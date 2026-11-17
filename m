Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16176.1794916929039332957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 04:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=mremi/iH;
 spf=pass (domain: geanix.com, ip: 109.224.244.107, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1794916926; x=1795176126;
	bh=Iy42M1MGOEzSr2cDCrz1FzKpeqfZhEh4EH2rUOeqMqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mremi/iH7kJ+/mgEXQ7hGOllHDQ234v/nv/WYXW3WInPy+v9Rw65FbKRWz4iIMUG/
	 GWvkfEe0pJY8kAT+LKNbd0fW82lvLiIk7Rpwqf45GP+RnMBlLvTCkLmVVqJoO3UeKm
	 D5Bt84jxh9UqBd4ZpFKhsppS00VzmLokU54mu4B9MwaZUqt9szU41gKYMvjG/orec6
	 lvZD5x/gPIMturY7l+F4sm6cXl1jMQv7gv6jGljglUmDqk1wlLuj4YMPcnPWanDB6X
	 ZbZLo5SWo2gKe0jvBsRJ/fxauMqiAdASirp9cgiUIjVqpPcyStpBPAAkyHXrHM7ptg
	 hfUUpCaXnsRWA==
X-Pm-Submission-Id: 4jTNd873jmz1DDLY
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [PATCH v2 2/3] license_image: don't apply INCOMPATIBLE_LICENSE to SDK host tools
Date: Tue, 17 Nov 2026 13:01:54 +0100
Message-ID: <20261117120155.3986876-3-sean@geanix.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117120155.3986876-1-sean@geanix.com>
References: <20261117120155.3986876-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 12:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250434
Content-Type: text/plain; charset="utf-8"

Since the SDK host and target sysroots are passed through
write_license_files(), do_populate_sdk checks every nativesdk and
cross-canadian package against the image's INCOMPATIBLE_LICENSE and
fails, e.g. with INCOMPATIBLE_LICENSE =3D "GPL-3.0*":

  Some packages cannot be installed into the image because they have
  incompatible licenses:
        nativesdk-autoconf (GPL-3.0-or-later)

At parse time skip_incompatible_package_licenses() exempts these
recipes, so they are built and packaged, and only the SDK manifest
step rejects them. Use incompatible_license_check_needed() in
write_license_files() too, so host tools in the SDK are treated the
same way. Target packages in the image and in the SDK target sysroot
are still checked.

Fixes: f757ae4dadab ("license_image: extend to SDK coverage")
AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta/classes-recipe/license_image.bbclass | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-rec=
ipe/license_image.bbclass
index 7d00b1ae53..728db8ae3a 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -128,16 +128,23 @@ def write_license_files(d, license_manifest, pkg_di=
c, rootfs):
=20
             pkg_allow_licenses =3D oe.license.filter_pkg_license_list(pk=
g, allow_licenses)
=20
+            # Host tools in the SDK (nativesdk, cross-canadian) are not
+            # subject to INCOMPATIBLE_LICENSE, same as at parse time.
+            if oe.license.incompatible_license_check_needed(d, pkg_dic[p=
kg]["PN"]):
+                pkg_bad_licenses =3D bad_licenses
+            else:
+                pkg_bad_licenses =3D []
+
             if node:
-                if incompatible_licenses :=3D oe.license.license_allowed=
(node, bad_licenses, pkg_allow_licenses):
+                if incompatible_licenses :=3D oe.license.license_allowed=
(node, pkg_bad_licenses, pkg_allow_licenses):
                     incompatible_packages.append("%s (%s)" % (pkg, ' '.j=
oin(n.to_string() for n in incompatible_licenses)))
-                elif incompatible_licenses :=3D oe.license.license_allow=
ed(node, bad_licenses, []):
+                elif incompatible_licenses :=3D oe.license.license_allow=
ed(node, pkg_bad_licenses, []):
                     oe.qa.handle_error('license-exception', "Including %=
s with incompatible license(s) %s into the image, because it has been all=
owed by exception list." %
                                        (pkg, ' '.join(n.to_string() for =
n in incompatible_licenses)), d)
=20
             (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) =3D \
                 oe.license.manifest_licenses(d, pkg_dic[pkg]["LICENSE"],
-                                             bad_licenses, pkg_allow_lic=
enses)
+                                             pkg_bad_licenses, pkg_allow=
_licenses)
=20
             if not "IMAGE_MANIFEST" in pkg_dic[pkg]:
                 # Rootfs manifest
--=20
2.56.0

