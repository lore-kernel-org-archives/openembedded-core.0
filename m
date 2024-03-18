Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34480C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 13:58:55 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.45017.1710770325452307211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 06:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=PSC6gKuB;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42IDwh0B233960
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 14:58:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1710770323;
	bh=knJ1uAGiNEecGn4ojCxdvxRTsLCcfSSdDvKWBJe6bd0=; l=3266;
	h=From:To:Cc:Subject:Date;
	b=PSC6gKuBZiLbUQr/B5qj54iHrxUJGQnQNggmOCGPYLXB/leLHlczZTIFu/cXOY+zK
	 s7v2cE935T0pNSpzp7/cSDgSMCX5LjJVxvk5ocJJqI9VMbMZe70nN6/BuWGDTxazly
	 vf5ddTX9dk57+uZcz51YRIz6umevlV9KSyeUj+mKFhQx02I6/Kya93s/3oMo8mxZpR
	 KAXIopfrix0hcDnj376rQ30Ozqda4aHiPKzzB/1oBtqQvR+nfIhJpuAtgPrJVWYEhz
	 zw3sh4H0UJ4iojWA3PXxG28wo1c1yeQTN+SJBzKi7q00vvWoPrx+nlk6XRtxobxDTX
	 lkHW0ZCsYApkA==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 42IDweuK294145
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Mon, 18 Mar 2024 14:58:41 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id 7DF46PUNM8; Mon, 18 Mar 2024 14:58:40 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42IDwe4g229924
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 18 Mar 2024 14:58:40 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.97.1)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rmDVg-00000001l5x-13Sy;
	Mon, 18 Mar 2024 14:58:40 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] shadow: fix copydir operation with 'pseudo'
Date: Mon, 18 Mar 2024 14:58:26 +0100
Message-ID: <20240318135826.419294-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 65f84890b121c496daa90d93
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 13:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197307

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Calling 'useradd' through pseudo on (at least) Ubuntu 20 creates
filesystem objects (.bashrc, .profile) with invalid attributes.  It
manifests as

| tar: ./home/.../.bashrc: Unknown file type; file ignored

or

| Copying files into the device: __populate_fs: ignoring entry ".bashrc"
| .bashrc: File not found by ext2_lookup while looking up ".bashrc"

when building the image.

This happens due to a bug in shadow which is caused by clobbering
fstatat() results.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 ...copy_entry-use-temporary-stat-buffer.patch | 39 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch

diff --git a/meta/recipes-extended/shadow/files/0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch b/meta/recipes-extended/shadow/files/0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch
new file mode 100644
index 000000000000..d278a4cda3ff
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch
@@ -0,0 +1,39 @@
+From af4b8cb780587aa736692a3baa76b60474f19c5d Mon Sep 17 00:00:00 2001
+From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
+Date: Mon, 18 Mar 2024 12:14:21 +0100
+Subject: [PATCH] lib/copydir:copy_entry(): use temporary stat buffer
+
+There are no guarantees that fstatat() does not clobber the stat
+buffer on errors.
+
+Use a temporary buffer so that the following code sees correct
+attributes of the source entry.
+
+Upstream-Status: Submitted [https://github.com/shadow-maint/shadow/pull/974]
+
+Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
+---
+ lib/copydir.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+Index: shadow-4.14.2/lib/copydir.c
+===================================================================
+--- shadow-4.14.2.orig/lib/copydir.c
++++ shadow-4.14.2/lib/copydir.c
+@@ -415,6 +415,7 @@ static int copy_entry (const struct path
+ {
+ 	int err = 0;
+ 	struct stat sb;
++	struct stat tmp_sb;
+ 	struct link_name *lp;
+ 	struct timespec mt[2];
+ 
+@@ -436,7 +437,7 @@ static int copy_entry (const struct path
+ 		 * If the destination already exists do nothing.
+ 		 * This is after the copy_dir above to still iterate into subdirectories.
+ 		 */
+-		if (fstatat(dst->dirfd, dst->name, &sb, AT_SYMLINK_NOFOLLOW) != -1) {
++		if (fstatat(dst->dirfd, dst->name, &tmp_sb, AT_SYMLINK_NOFOLLOW) != -1) {
+ 			return 0;
+ 		}
+ 
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 16b99a0b60e8..a164b8347f8c 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -12,6 +12,7 @@ DEPENDS = "virtual/crypt"
 
 GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
+           file://0001-lib-copydir-copy_entry-use-temporary-stat-buffer.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
            "
-- 
2.44.0


