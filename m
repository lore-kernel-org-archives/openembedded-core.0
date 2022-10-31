Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59047FA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 21:10:30 +0000 (UTC)
Received: from mailrelay5-2.pub.mailoutpod2-cph3.one.com (mailrelay5-2.pub.mailoutpod2-cph3.one.com [46.30.211.186])
 by mx.groups.io with SMTP id smtpd.web12.1489.1667250623889853272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 14:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa1 header.b=lXuF3U5p;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.211.186, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=5GH9/f3zAcCAHmd/xWTV6tnEnzhwqspF9VC4qDD7Kxg=;
	b=lXuF3U5pZ9/Rxa5Y/PO7gur5N8rJA5UfNaFxdFsGyAQ+306a5tvwfmz1IpjR34ueiVwAPOJ9TISyX
	 m2una2uGRnffWzPJinPMeeioR594zcs369ieoKlQFCRv3EpaeVL4IGZ8EZxfvVWOo/za569z+laH6o
	 sdN7GheaU7Nw9a9yh6szzd7P4UPPoPaaeA6X3QyzKttpSYvdF3RasVisQtZZFg1rtoIQSS3aBlmUfF
	 oB/zjDx2u7PQfG78p6FrBHVslTT82QRiIHTB8dA4aCCz2tMl+VfHp7b+ZYX3xBQCbSP5n1194jKNAn
	 WNB8wuWZsDXNz/t27i3rP7Tg5BPtawA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=5GH9/f3zAcCAHmd/xWTV6tnEnzhwqspF9VC4qDD7Kxg=;
	b=h24KNtX68vTeUG9tbUlxflQWQZUheAkpIQ9WCNEPwqPex4Ky2REWJpni1bk48ymI8UHGwWbzQcu5h
	 NzQtQQ3Dw==
X-HalOne-ID: 6be39b5d-5960-11ed-9869-2b2c31a40212
Received: from pbergin-7420.. (ua-213-113-159-147.bbcust.telenor.se [213.113.159.147])
	by mailrelay5 (Halon) with ESMTPSA
	id 6be39b5d-5960-11ed-9869-2b2c31a40212;
	Mon, 31 Oct 2022 21:10:21 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH] gptfdisk: remove warning message from target system
Date: Mon, 31 Oct 2022 22:10:12 +0100
Message-Id: <20221031211012.169974-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 21:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172336

A recent change in libuuid made warning when running
sgdisk. Backport patch from upstream to silent warning.

The warning:
    "Warning! Unable to generate a proper UUID! Creating an improper one as a last
     resort! Windows 7 may crash if you save this partition table!"

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 ...to-deal-with-minor-change-in-libuuid.patch | 27 +++++++++++++++++++
 meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/fdisk/gptfdisk/0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch

diff --git a/meta/recipes-devtools/fdisk/gptfdisk/0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch b/meta/recipes-devtools/fdisk/gptfdisk/0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch
new file mode 100644
index 0000000000..f358081092
--- /dev/null
+++ b/meta/recipes-devtools/fdisk/gptfdisk/0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch
@@ -0,0 +1,27 @@
+From c640d9011a8330ebaad501784fb0ee1ce5e7a5ef Mon Sep 17 00:00:00 2001
+From: Rod Smith <rodsmith@rodsbooks.com>
+Date: Sat, 16 Apr 2022 09:32:04 -0400
+Subject: [PATCH] Updated guid.cc to deal with minor change in libuuid
+
+Upstream-Status: Backport [https://sourceforge.net/p/gptfdisk/code/ci/6a8416cbd12d55f882bb751993b94f72d338d96f/]
+Signed-off-by: Peter Bergin <peter@berginkonsult.se>
+---
+ guid.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/guid.cc b/guid.cc
+index 1e73ab7..d3e4fd5 100644
+--- a/guid.cc
++++ b/guid.cc
+@@ -141,7 +141,7 @@ void GUIDData::Zero(void) {
+ void GUIDData::Randomize(void) {
+    int i, uuidGenerated = 0;
+ 
+-#ifdef _UUID_UUID_H
++#if defined (_UUID_UUID_H) || defined (_UL_LIBUUID_UUID_H)
+    uuid_generate(uuidData);
+    ReverseBytes(&uuidData[0], 4);
+    ReverseBytes(&uuidData[4], 2);
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
index e473b9cd55..2c093c20ae 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
@@ -9,6 +9,7 @@ DEPENDS = "util-linux"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-gptcurses-correctly-include-curses.h.patch \
+           file://0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch \
            "
 SRC_URI[sha256sum] = "dafead2693faeb8e8b97832b23407f6ed5b3219bc1784f482dd855774e2d50c2"
 
-- 
2.34.1


