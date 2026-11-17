Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16177.1794916929135916046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 04:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=Pl5jusW7;
 spf=pass (domain: geanix.com, ip: 109.224.244.106, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1794916925; x=1795176125;
	bh=H2dsfelzAiNoT28/WPnEDf7Ssxabna14jZSAA1E/4jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Pl5jusW7wZwmv0wbms3vPWtZrBAOxsoS2Nu01s3WG4zWSDbQmK/yJQfNYhqC+wjRq
	 z6vj1ENdzfhbsQLbLGQkO9Usyc5ZpvciXplyT2O1Rm1PcgfS7ikxZI8nrm0etx9QTt
	 +MQpf0a7VB9Kt7hBqZDhK8qUH5H60AJd+pgF1v02hGpyW6rx+pWBHVwIRDtCiCwXUY
	 keEFwUGUJ0pyIEluot8KCb5GCer0uzBKDTFTHgt+LArlVfsbX0fzsC34Hsn5l0lq0M
	 34YjUF4K6weDXm5Cs7ynudDjv90B+9jRmzjC69s+won+y0FH3jBrsyYeH3ZylkWOAp
	 55u2ZA+KUEdbQ==
X-Pm-Submission-Id: 4jTNd74hWYz1DDLV
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [PATCH v2 1/3] lib/oe/license: factor out incompatible_license_check_needed()
Date: Tue, 17 Nov 2026 13:01:53 +0100
Message-ID: <20261117120155.3986876-2-sean@geanix.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117120155.3986876-1-sean@geanix.com>
References: <20261117120155.3986876-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 12:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250435
Content-Type: text/plain; charset="utf-8"

Move the check for recipes INCOMPATIBLE_LICENSE does not apply to
(native, nativesdk, cross, cross-canadian and gcc-source) out of
skip_incompatible_package_licenses() into its own function, so it can
be reused when checking packages at image/SDK creation time. No
functional change.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta/lib/oe/license.py | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index e2a2bcc47d..035311d469 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -561,23 +561,28 @@ def filter_pkg_license_list(pkg, lst):
=20
     return pkg_lst
=20
+def incompatible_license_check_needed(d, pn):
+    """
+    Return False for recipes that INCOMPATIBLE_LICENSE does not apply to=
:
+    native, nativesdk, cross and cross-canadian recipes, and gcc-source.
+    """
+    if pn.startswith("nativesdk-") or pn.startswith("gcc-source-"):
+        return False
+    for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${TARG=
ET_ARCH}",
+            "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
+            "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
+        if pn.endswith(d.expand(t)):
+            return False
+    return True
+
 def skip_incompatible_package_licenses(d, pkgs):
     if not pkgs:
         return {}
=20
     pn =3D d.getVar("PN")
=20
-    check_license =3D False if pn.startswith("nativesdk-") else True
-    for t in ["-native", "-cross-${TARGET_ARCH}", "-cross-initial-${TARG=
ET_ARCH}",
-            "-crosssdk-${SDK_SYS}", "-crosssdk-initial-${SDK_SYS}",
-            "-cross-canadian-${TRANSLATED_TARGET_ARCH}"]:
-        if pn.endswith(d.expand(t)):
-            check_license =3D False
-    if pn.startswith("gcc-source-"):
-        check_license =3D False
-
     bad_licenses =3D (d.getVar('INCOMPATIBLE_LICENSE') or "").split()
-    if not check_license or not bad_licenses:
+    if not incompatible_license_check_needed(d, pn) or not bad_licenses:
         return {}
=20
     bad_licenses =3D expand_wildcard_licenses(d, bad_licenses)
--=20
2.56.0

