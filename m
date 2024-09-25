Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CC2CD3424
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.9317.1727246987009092835
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OylBvXZn;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246988; x=1758782988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xl99AFMobEcmEemBe5lIY3wDcJyd0fg8LfaS/xVNV2g=;
  b=OylBvXZnLtuepXbCdox4B/SZqfHaXDIA9kzFtP7AoCLZJ0heZm9RvI5s
   GoIc0owKpcoQOIvJUATgCfy0S/nYGT+xJctOHx5Gb4bC4D3wfG9K1l/ES
   Jid2vQ4R9QDWB2eP5EKf+hN/7O9OtvnmY/BRXu+cGVqdpcJtFA2ocUuXx
   x89CniSik+v+9zmydOEaEymNGT7CKAvuvKG5vVd5xMCDS2pjdZeSxQ+Kr
   UtrjSnbIctJj7PY5K9cRhGAztCNM8g3gh+twYLkye3MPAVvAkmsnTlhgT
   ZjRIpwE0/8jrf3ZxMzO3spVgu0MON6xgte+whcBl5TuywcmsvmN/qyJ9x
   w==;
X-CSE-ConnectionGUID: Z/1oRzPITQanlmMXCxtHow==
X-CSE-MsgGUID: HynRQ/4ZT2CDZO5iApIVoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="174735942"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="174735942"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:45 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 48589D9231
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:43 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F16DBF3DC
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A507520086326
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 544B21A000A;
	Wed, 25 Sep 2024 14:49:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/47] openssh: upgrade 9.8p1 -> 9.9p1
Date: Wed, 25 Sep 2024 14:48:55 +0800
Message-Id: <1727246960-20665-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--11.505800-10.000000
X-TMASE-MatchedRID: kfHlHSjlGDOjz0nOeth/yTo39wOA02LhQRlUSJjs8Z/QarzCEH4/6rLG
	xJEl+nNJBVQYxBSolVoSuJRtSU84o+CnSW1s2x7bzYK5U+QI3O43l2plwgrtWDBwx50fHFECIUt
	KH5AJM9ki+t+0AiFaYsrbguuTTSDuTBhdFGvbKacrT6V6InEuVxmyTBaqiJvcmgxzSCl7WBk6SI
	YaJ07sj/7gxvhPYNtrZ2FGwGbBwh3wqb7UKVuBaZTp3iXK6AMUrthpnZXZolC3d3F7I47tA5FjQ
	nJ9F0Di6wjmyLa4MnTSKuuqNb2Dum6N1u5t418jqoeab9Xgz8/4zqSlP1M8u20mAJ1eNpo4+F7D
	E2vfqH7i8zVgXoAltqKtaNMn6jcZeotJ6wqXvVzEQdG7H66TyH4gKq42LRYkiVA5D2Cr+LvP3bk
	K8JdlDY7C01D25P3Qk7PNuIz9TJh+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204914

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 include openbsd-compat/base64.c license in LICENSE

0001-Cast-to-sockaddr-in-systemd-interface.patch
removed since it's included in 9.9p1

Changelog:
 http://www.openssh.com/releasenotes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ast-to-sockaddr-in-systemd-interface.patch | 30 -------------------
 .../{openssh_9.8p1.bb => openssh_9.9p1.bb}    |  5 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockaddr-in-systemd-interface.patch
 rename meta/recipes-connectivity/openssh/{openssh_9.8p1.bb => openssh_9.9p1.bb} (97%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockaddr-in-systemd-interface.patch b/meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockaddr-in-systemd-interface.patch
deleted file mode 100644
index c41642ae10..0000000000
--- a/meta/recipes-connectivity/openssh/openssh/0001-Cast-to-sockaddr-in-systemd-interface.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From a3068c6edb81c0b0b9a2ced82e8632c79314e409 Mon Sep 17 00:00:00 2001
-From: Darren Tucker <dtucker@dtucker.net>
-Date: Sun, 7 Jul 2024 18:46:19 +1000
-Subject: [PATCH] Cast to sockaddr * in systemd interface.
-
-Fixes build with musl libx.  bz#3707.
-
-Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/8b664df75966e5aed8dabea00b8838303d3488b8]
-
-Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
----
- openbsd-compat/port-linux.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/openbsd-compat/port-linux.c b/openbsd-compat/port-linux.c
-index 4c024c6d2..8adfec5a7 100644
---- a/openbsd-compat/port-linux.c
-+++ b/openbsd-compat/port-linux.c
-@@ -366,7 +366,7 @@ ssh_systemd_notify(const char *fmt, ...)
- 		error_f("socket \"%s\": %s", path, strerror(errno));
- 		goto out;
- 	}
--	if (connect(fd, &addr, sizeof(addr)) != 0) {
-+	if (connect(fd, (struct sockaddr *)&addr, sizeof(addr)) != 0) {
- 		error_f("socket \"%s\" connect: %s", path, strerror(errno));
- 		goto out;
- 	}
--- 
-2.45.2
-
diff --git a/meta/recipes-connectivity/openssh/openssh_9.8p1.bb b/meta/recipes-connectivity/openssh/openssh_9.9p1.bb
similarity index 97%
rename from meta/recipes-connectivity/openssh/openssh_9.8p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.9p1.bb
index 83145dbd18..6d9dac3497 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.9p1.bb
@@ -6,7 +6,7 @@ and for executing commands on a remote machine."
 HOMEPAGE = "http://www.openssh.com/"
 SECTION = "console/network"
 LICENSE = "BSD-2-Clause & BSD-3-Clause & ISC & MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=072979064e691d342002f43cd89c0394"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=78ffb36e5a48c0d8c5648603a3b6c8eb"
 
 DEPENDS = "zlib openssl virtual/crypt"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -23,11 +23,10 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://volatiles.99_sshd \
            file://run-ptest \
            file://sshd_check_keys \
-           file://0001-Cast-to-sockaddr-in-systemd-interface.patch \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
            "
-SRC_URI[sha256sum] = "dd8bd002a379b5d499dfb050dd1fa9af8029e80461f4bb6c523c49973f5a39f3"
+SRC_URI[sha256sum] = "b343fbcdbff87f15b1986e6e15d6d4fc9a7d36066be6b7fb507087ba8f966c02"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.34.1


