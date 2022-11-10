Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E77C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 02:01:47 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.2132.1668045701278102218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 18:01:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Z8nPagpk;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1668045702;
  x=1699581702;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+QUff76OVTlBCO7h+Nm2HmAsIAXV8kF4+h5tNMwV68c=;
  b=Z8nPagpkRfTklWrTuyhp9VjrbdVk4meb2LU02lTxybyWgiHmvsNzIeIG
   Iw0wulhuaROl5/gphfrdkoVtwZ7zEH3eOgJxP49BzVG0WmmKhFKAMc8Jd
   VZQN4SQFL/IsiR1xRqr130C4xAvKx6CF57QQ3Cs5Crk0rffN3q7D99kR+
   ZhJ0e+guQDl8IDVW+6tnCaPqKm/gEWmJf47q1LKgGlg5Kqk3aHIA0A64G
   fDgAzEMmDLFgQjBJ1BjM9aG5eYW/tm8vZlyVv97X0CZnFl6FGnGwDxXKc
   dej9GG7UAU0JT70hAogj9VsII/8Rlv9Lbb8oWxs/0Os6tGl9ztOHPTZjB
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] pango: Make it build with ptest disabled
Date: Thu, 10 Nov 2022 03:01:36 +0100
Message-ID: <20221110020136.908205-1-pkj@axis.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 02:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173063

This avoids the following error:

  ERROR: pango-1.50.11-r0 do_package: QA Issue: pango: Files/directories
  were installed but not shipped in any package:
    /usr/libexec
    /usr/libexec/installed-tests
    /usr/libexec/installed-tests/pango
    /usr/libexec/installed-tests/pango/nofonts
    /usr/libexec/installed-tests/pango/nofonts/fonts.conf

Also use tabs for indentation of shell code.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-graphics/pango/pango_1.50.11.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango_1.50.11.bb b/meta/recipes-graphics/pango/pango_1.50.11.bb
index f545689811..f982d9a65b 100644
--- a/meta/recipes-graphics/pango/pango_1.50.11.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.11.bb
@@ -38,13 +38,15 @@ PACKAGECONFIG[thai] = ",,libthai"
 GIR_MESON_OPTION = 'introspection'
 
 do_configure:prepend() {
-    chmod +x ${S}/tests/*.py
+	chmod +x ${S}/tests/*.py
 }
 
 # https://gitlab.gnome.org/GNOME/pango/-/issues/713
 do_install:append() {
-    mkdir -p ${D}/${libexecdir}/installed-tests/pango/nofonts/
-    install ${S}/tests/nofonts/fonts.conf ${D}/${libexecdir}/installed-tests/pango/nofonts/
+	if [ "${@bb.utils.filter('PACKAGECONFIG', 'tests', d)}" ]; then
+		mkdir -p ${D}${libexecdir}/installed-tests/pango/nofonts
+		install ${S}/tests/nofonts/fonts.conf ${D}${libexecdir}/installed-tests/pango/nofonts
+	fi
 }
 
 LEAD_SONAME = "libpango-1.0*"

