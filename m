Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541ADC433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 12:07:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.14862.1636718873785267764
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 04:07:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15302ED1
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 04:07:52 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3F0D3F70D
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 04:07:51 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] insane: remove unrecognised option check for Meson
Date: Fri, 12 Nov 2021 12:07:49 +0000
Message-Id: <20211112120749.3656222-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 12:07:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158216

Meson 0.60 onwards no longer simply warns when an unrecognised option is
passed, it errors out instead. This means we can remove the logic in
insane.bbclass to check for the warnings.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/insane.bbclass | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 1675adf6ac..27b1a00fb9 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1229,15 +1229,12 @@ Rerun configure task after fixing this."""
     ####################################################################=
#######
     # Check unrecognised configure options (with a white list)
     ####################################################################=
#######
-    if bb.data.inherits_class("autotools", d) or bb.data.inherits_class(=
"meson", d):
+    if bb.data.inherits_class("autotools", d):
         bb.note("Checking configure output for unrecognised options")
         try:
             if bb.data.inherits_class("autotools", d):
                 flag =3D "WARNING: unrecognized options:"
                 log =3D os.path.join(d.getVar('B'), 'config.log')
-            if bb.data.inherits_class("meson", d):
-                flag =3D "WARNING: Unknown options:"
-                log =3D os.path.join(d.getVar('T'), 'log.do_configure')
             output =3D subprocess.check_output(['grep', '-F', flag, log]=
).decode("utf-8").replace(', ', ' ').replace('"', '')
             options =3D set()
             for line in output.splitlines():
--=20
2.25.1


