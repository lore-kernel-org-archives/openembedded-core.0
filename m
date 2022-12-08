Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382ADC3A5A7
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 12:35:56 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.12301.1670502945470147688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 04:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LBPjir5v;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8681E20011;
	Thu,  8 Dec 2022 12:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670502943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/EHQbT9vU4lJfQkzhGI+YnJDmvYzjrF1IZUtI0L62dk=;
	b=LBPjir5vtPiBCYDyUhV564VL6f9qbuWFs00V72VJNX13M6/eR2iEgb6EOc85oH/haTP91l
	81DKexFRE9d258R0iy/GbR02fYrO1NhOIiX0guYX1sHGf9h7M99tmNvs3ExnytwrZsqFJm
	hZjXd0v4CjluAv/aM5FIWZAwA9LqNu2IjblMhJk1X+Z+sTYR567CvzO2zXVnTusuhyYX+u
	P8Uz1yj13f3X16VLdw5gcfXXxjTyRujuL4Qju5TPQCO1/Z8iQhYQJpzqoY7gErAJP5JjUp
	Cdmxd4a8/fsvMPgJNDll09O3FwUm4HnA7eZg745NeLIWtveg9W2/6Sm7xJNt8Q==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] bitbake.conf: remove SERIAL_CONSOLE variable
Date: Thu,  8 Dec 2022 13:35:34 +0100
Message-Id: <20221208123534.2758751-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 12:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174403

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This variable has been deprecated since version 2.6
Use SERIAL_CONSOLES instead.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/conf/bitbake.conf       | 3 +--
 meta/conf/documentation.conf | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d47568157a..c9a4e328f1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -914,8 +914,7 @@ MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
 COMBINED_FEATURES = "${@oe.utils.set_intersect('DISTRO_FEATURES', 'MACHINE_FEATURES', d)}"
 COMBINED_FEATURES[vardeps] += "DISTRO_FEATURES MACHINE_FEATURES"
 
-SERIAL_CONSOLE ??= ""
-SERIAL_CONSOLES ??= "${@d.getVar('SERIAL_CONSOLE').replace(' ', ';')}"
+SERIAL_CONSOLES ??= ""
 
 NO_RECOMMENDATIONS ??= ""
 BAD_RECOMMENDATIONS ?= ""
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index ab2addb321..a27d7a53c3 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -376,7 +376,6 @@ SDKIMAGE_FEATURES[doc] = "Equivalent to IMAGE_FEATURES. However, this variable a
 SDKMACHINE[doc] = "Specifies the architecture (i.e. i686 or x86_64) for which to build SDK and ADT items."
 SECTION[doc] = "The section in which packages should be categorized. Package management utilities can make use of this variable."
 SELECTED_OPTIMIZATION[doc] = "The variable takes the value of FULL_OPTIMIZATION unless DEBUG_BUILD = '1'. In this case, the value of DEBUG_OPTIMIZATION is used."
-SERIAL_CONSOLE[doc] = "The speed and device for the serial port used to attach the serial console. This variable is given to the kernel as the 'console' parameter. After booting occurs, getty is started on that port so remote login is possible."
 SERIAL_CONSOLES[doc] = "Defines the serial consoles (TTYs) to enable using getty."
 SERIAL_CONSOLES_CHECK[doc] = "Similar to SERIAL_CONSOLES except the device is checked for existence before attempting to enable it. Supported only by SysVinit."
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS[doc] = "A list of recipe dependencies that should not be used to determine signatures of tasks from one recipe when they depend on tasks from another recipe."
-- 
2.37.2


