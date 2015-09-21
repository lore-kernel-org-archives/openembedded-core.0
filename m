Return-Path: <net147@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id CDFAA60053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 17:55:46 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so122547717pad.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 10:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=X8BbL4F5x02CS1f9XAeZUBRa17o8aXvLha/Uck/CYH4=;
	b=sh+QQN2tDtt+Y68Iz+DAuINXbBk1CFccAVeDWrBDupFj2SPnV0whSttlrn3QLnXJvo
	xKt837e/nh+mlS19Fcr4J16C5uPFy4b8JX+CZXYQ8WaV28A2kZvJnsuCsFcSzp7csGIL
	+ZFdUNAlMEMM89kiNWvnPtnlvKrIF0+AZ2atpUdmApdOYm6RKMS1X4gky1yYLFszQpUG
	Dh8tOvmlRdVF4Q/Y+MFNl7dr2qlECN5yQa6oDcsT7HzNzJ9KQwhalyq+pMPiiWgZVVAR
	SvWaWEQiA1AXzBCCyIBVaE+7c5iFNIcoOL50czXMpoFC6SjYkeg+y6cggMh6qQGRf/GZ
	EP5w==
X-Received: by 10.66.136.102 with SMTP id pz6mr26187222pab.52.1442858146513;
	Mon, 21 Sep 2015 10:55:46 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	be3sm25669283pbc.88.2015.09.21.10.55.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 10:55:45 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 03:56:29 +1000
Message-Id: <1442858189-29753-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH v2] systemd: disable problematic GCC 5.2 optimizations
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Sep 2015 17:55:47 -0000

This fixes systemd failing to start on Raspberry Pi 2 if it is compiled
with GCC 5.2.

It would try to start "Journal Service" and "udev Kernel Device Manager"
but fail repeatedly.

[YOCTO #8291]

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd_225.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index f7d4c7d..fd1a3f3 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -123,6 +123,9 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
 # uclibc does not have NSS
 EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
 
+# disable problematic GCC 5.2 optimizations [YOCTO #8291]
+FULL_OPTIMIZATION_append_arm = " -fno-schedule-insns -fno-schedule-insns2"
+
 do_configure_prepend() {
 	export NM="${HOST_PREFIX}gcc-nm"
 	export AR="${HOST_PREFIX}gcc-ar"
-- 
2.5.0


