Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00666C6FA8D
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 07:32:58 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web09.4859.1662967974294004997
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 00:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25,
 mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oXdvu-006qlw-JA; Mon, 12 Sep 2022 10:32:52 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oXdvu-0004pH-H4; Mon, 12 Sep 2022 10:32:42 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org,
	docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/7] kernel-dev/common.rst: remove SRC_URI:append from
 examples
Date: Mon, 12 Sep 2022 10:32:16 +0300
Message-Id: <20220912073221.16601-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220912073221.16601-1-mikko.rapeli@linaro.org>
References: <20220912073221.16601-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: 0.0 (/)
X-Rspam-Report: Action: no action
 Symbol: ASN(0.00)
 Message-ID: 20220912073221.16601-2-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 07:32:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170526

It's better to use SRC_URI += to append patches etc. If anything
is added via :append, that can no longer be removed at all.
If common, re-usable layers use SRC_URI:append, then users can
not change those patches or SRC_URI entries without completely
replacing the recipe with a copy in their own layer. Thus
+= is better.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/kernel-dev/common.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 16ef6453bd..fb8d7cd029 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -360,9 +360,9 @@ home directory:
 
       FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
-      SRC_URI:append = " file://patch-file-one.patch"
-      SRC_URI:append = " file://patch-file-two.patch"
-      SRC_URI:append = " file://patch-file-three.patch"
+      SRC_URI += "file://patch-file-one.patch"
+      SRC_URI += "file://patch-file-two.patch"
+      SRC_URI += "file://patch-file-three.patch"
 
    The :term:`FILESEXTRAPATHS` and :term:`SRC_URI` statements
    enable the OpenEmbedded build system to find patch files. For more
@@ -1002,7 +1002,7 @@ Section.
    contents::
 
       FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-      SRC_URI:append = " file://0001-calibrate.c-Added-some-printk-statements.patch"
+      SRC_URI += "file://0001-calibrate.c-Added-some-printk-statements.patch"
 
    The :term:`FILESEXTRAPATHS` and :term:`SRC_URI` statements
    enable the OpenEmbedded build system to find the patch file.
@@ -1875,7 +1875,7 @@ build.
 2. *Add the Feature File to SRC_URI:* Add the ``.scc`` file to the
    recipe's :term:`SRC_URI` statement::
 
-      SRC_URI:append = " file://test.scc"
+      SRC_URI += "file://test.scc"
 
    The leading space before the path is important as the path is
    appended to the existing path.
@@ -1884,7 +1884,7 @@ build.
    :term:`KERNEL_FEATURES` statement to specify the feature as a kernel
    feature::
 
-      KERNEL_FEATURES:append = " test.scc"
+      KERNEL_FEATURES += "test.scc"
 
    The OpenEmbedded build
    system processes the kernel feature when it builds the kernel.
-- 
2.17.1


