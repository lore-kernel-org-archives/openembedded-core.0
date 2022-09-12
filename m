Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D18C6FA8D
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 07:33:08 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web09.4858.1662967972063937732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 00:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25,
 mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oXdvq-006qlE-Ev; Mon, 12 Sep 2022 10:32:48 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.92)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1oXdvq-0004kR-CE; Mon, 12 Sep 2022 10:32:38 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org,
	docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/7] common-tasks.rst: remove SRC_URI:append from examples
Date: Mon, 12 Sep 2022 10:32:15 +0300
Message-Id: <20220912073221.16601-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: 0.0 (/)
X-Rspam-Report: Action: no action
 Symbol: ASN(0.00)
 Message-ID: 20220912073221.16601-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 07:33:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170525

Using SRC_URI:append without recipe, machine or architecture
specific limitations makes the :append'ed text unremovable
and thus users and custom layers can not change the variable
anymore. This makes it hard to e.g. override SRC_URI completely
in a bbappend to update the full recipe to a newer version.
Thus common, reusable layers which users are meant to re-use and
customize should not use SRC_URI:append but SRC_URI += instead.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 documentation/dev-manual/common-tasks.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index b08a55331d..3112f9b893 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2577,7 +2577,7 @@ chapter of the BitBake User Manual.
 
       S = "${WORKDIR}/postfix-${PV}"
       CFLAGS += "-DNO_ASM"
-      SRC_URI:append = " file://fixup.patch"
+      CFLAGS:append = " --enable-important-feature"
 
 -  *Functions:* Functions provide a series of actions to be performed.
    You usually use functions to override the default implementation of a
@@ -2708,19 +2708,20 @@ in the BitBake User Manual.
    to existing variables. This operator does not add any additional
    space. Also, the operator is applied after all the ``+=``, and ``=+``
    operators have been applied and after all ``=`` assignments have
-   occurred.
+   occurred. This means that if ``:append`` is used, that text can not be
+   removed.
 
    The following example shows the space being explicitly added to the
    start to ensure the appended value is not merged with the existing
    value::
 
-      SRC_URI:append = " file://fix-makefile.patch"
+      CFLAGS:append = " --enable-important-feature"
 
    You can also use
    the ``:append`` operator with overrides, which results in the actions
    only being performed for the specified target or machine::
 
-      SRC_URI:append:sh4 = " file://fix-makefile.patch"
+      CFLAGS:append:sh4 = " --enable-important-sh4-specific-feature"
 
 -  *Prepending (:prepend):* Use the ``:prepend`` operator to prepend
    values to existing variables. This operator does not add any
-- 
2.17.1


