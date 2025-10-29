Return-Path: <bst@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47705CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 18:12:30 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.11509.1761761549582512385
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 11:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: bst@pengutronix.de)
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <bst@pengutronix.de>)
	id 1vEAep-0008Du-P5; Wed, 29 Oct 2025 19:12:27 +0100
From: Bastian Krause <bst@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Chen Qi <Qi.Chen@windriver.com>,
	Bastian Krause <bst@pengutronix.de>
Subject: [OE-core][scarthgap][PATCH] util-linux: fix pointer usage in hwclock param handling
Date: Wed, 29 Oct 2025 19:12:24 +0100
Message-ID: <20251029181224.3971640-1-bst@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 18:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225463

Passing params as numbers to hwclock is broken in util-linux 2.39.3 due
to wrong pointer handling. So backport the fix from upstream included
since util-linux 2.41.

Signed-off-by: Bastian Krause <bst@pengutronix.de>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...-utils-hwclock-rtc-fix-pointer-usage.patch | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/sys-utils-hwclock-rtc-fix-pointer-usage.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 1ecf5c7b39..ccab4b17f4 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -43,6 +43,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://CVE-2024-28085-0001.patch \
            file://CVE-2024-28085-0002.patch \
 	   file://fstab-isolation.patch \
+           file://sys-utils-hwclock-rtc-fix-pointer-usage.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/sys-utils-hwclock-rtc-fix-pointer-usage.patch b/meta/recipes-core/util-linux/util-linux/sys-utils-hwclock-rtc-fix-pointer-usage.patch
new file mode 100644
index 0000000000..d98509d6ac
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/sys-utils-hwclock-rtc-fix-pointer-usage.patch
@@ -0,0 +1,27 @@
+From 7064cd275607a43223b2dbaef75c610f33f432ff Mon Sep 17 00:00:00 2001
+From: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
+Date: Sat, 23 Mar 2024 13:39:55 +0530
+Subject: [PATCH] sys-utils: hwclock-rtc: fix pointer usage
+
+passing double pointer doesn't fill param value
+
+Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/1064a53e4ff357dc649a8c4a0a41dfb5a1191bba]
+Signed-off-by: Bastian Krause <bst@pengutronix.de>
+---
+ sys-utils/hwclock-rtc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sys-utils/hwclock-rtc.c b/sys-utils/hwclock-rtc.c
+index 7094cd0..c797397 100644
+--- a/sys-utils/hwclock-rtc.c
++++ b/sys-utils/hwclock-rtc.c
+@@ -424,7 +424,7 @@ static int resolve_rtc_param_alias(const char *alias, __u64 *value)
+ /* kernel uapi __u64 can be defined differently than uint64_t */
+ static int strtoku64(const char *str, __u64 *num, int base)
+ {
+-	return ul_strtou64(str, (uint64_t *) &num, base);
++	return ul_strtou64(str, (uint64_t *) num, base);
+ }
+ 
+ /*
-- 
2.47.3


