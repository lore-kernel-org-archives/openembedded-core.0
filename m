Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8665FC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 14:34:12 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.94494.1783089249399237194
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 07:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rpwoAqz0;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 79571C49F58
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Jul 2026 14:34:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A5CC260300;
	Fri,  3 Jul 2026 14:34:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C16CB104C952E;
	Fri,  3 Jul 2026 16:34:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783089246; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=wtgMnkZ9WR8EMPzJRbj/0UgKnHiWLB508oEAxcV+ZLU=;
	b=rpwoAqz0DUi+TmqgIAAavlHVD042prQTvRr4LqXoRK0Khv/OIza85PPh3DCulJIIut7ETY
	5L7IO1TVjwqqqPxddhD7UHk4ii7DmyqZEPn7l7bshmpgCXBNWBBL6vEQbrPceS0f5/i19M
	E9wT9tWLu2H/jr7FCd4oM3cvPiD+Ql0IzGQ9R0EcPj0CJspsmlNR8D0aTZlGrEdHi4iLn9
	bUiFgHtrogGs5piZRjus987I8v6Qu1gKmmRJLkNS0TSSM52kdYmkFyO6g0ElK6mLVkyXAM
	8+px3MOA3hcZhn5nGeSKiIb5inMZTOIaVmVmInxJh4+CtVdKYLMcbLCZptCI8g==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Fri, 03 Jul 2026 16:34:03 +0200
Subject: [PATCH] glib-2.0: Upgrade 2.88.1 -> 2.89.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-glib-2-0-cve-2026-58016-master-v1-1-e16967ddff16@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQqDMBCF4avIrDswiVSDV5EuknS0U1qVjEpBv
 HujLr+3+N8GyklYoSk2SLyKyjhkmFsB8eWHnlGe2WDJVlRTif1HAlokjCvjseLdkanw63XmhLU
 Lhjx1xtkScmRK3MnvPGgfl3UJb47zUYV9/wPF49osggAAAA==
X-Change-ID: 20260703-glib-2-0-cve-2026-58016-master-78b10a0f1823
To: openembedded-core@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 14:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240114

This upgrade fixes CVE-2026-58016

A flaw was found in GLib. A state confusion issue exists in
g_dbus_node_info_new_for_xml() in the gio/gdbusintrospection.c file when
processing malformed D-Bus introspection XML, specifically with a <node>
element nested within other elements like <method>, <signal>, <property>
or <arg>. This issue can cause an unsigned integer overflow and lead to an
out-of-bounds read, resulting in a denial of service.

The CVE NVD entry is wrong, it indicates that the CVE is fixed in 2.88.1
but the fix was realized in 2.89.0, see [1]. The fix is not present in 2.88.2.

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 .../glib-2.0/{glib-2.0-initial_2.88.1.bb => glib-2.0-initial_2.89.1.bb} | 0
 meta/recipes-core/glib-2.0/{glib-2.0_2.88.1.bb => glib-2.0_2.89.1.bb}   | 0
 meta/recipes-core/glib-2.0/glib.inc                                     | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.89.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.89.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.89.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.89.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 8d23092187bf..be037046d525 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -238,7 +238,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[archive.sha256sum] = "51ab804c56f6eab3e5045c774d1290ac5e4c923d4f9a3d8e33123bee45c1840e"
+SRC_URI[archive.sha256sum] = "74447129c31afe141810f995626e8b99ab677413dae76ee3cf5a9cc6e75a486e"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.

---
base-commit: 0776ddc4508387f3c1a13f7a1b6e2a6119aea4b2
change-id: 20260703-glib-2-0-cve-2026-58016-master-78b10a0f1823

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


