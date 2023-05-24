Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0555C7EE23
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 14:57:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11204.1684940245388708323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 07:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 708A0113E;
	Wed, 24 May 2023 07:58:09 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E63F33F762;
	Wed, 24 May 2023 07:57:23 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] base: add ability to provide further details when using LICENSE_FLAGS
Date: Wed, 24 May 2023 15:57:21 +0100
Message-Id: <20230524145721.3628187-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 14:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181677

From: Ross Burton <ross.burton@arm.com>

Recipes with proprietary licenses often need to use LICENSE_FLAGS so
that the user can opt-in with consent. However, if you don't consent
then the error simply tells you the license identifier but not further
context.

Add a new variable LICENSE_FLAGS_DETAILS, which will be looked in for a
flag with the name of the licence.  If found then the contents are
printed as a source of further details.

For example, a recipe with an EULA may set:

  LICENSE_FLAGS =3D "FooBar-EULA"
  LICENSE_FLAGS_DETAILS[FooBar-EULA] =3D "https://example.com/eula"

If Foobar-EULA isn't in LICENSE_FLAGS_ACCEPTED then the error message is
more useful:

  Has a restricted license 'FooBar-EULA' which is not listed in your
  LICENSE_FLAGS_ACCEPTED. For further details, see
  https://example.com/eula.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/base.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
index b6e339ed9c5..976a2ddee4b 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -516,12 +516,12 @@ python () {
         check_license_format(d)
         unmatched_license_flags =3D check_license_flags(d)
         if unmatched_license_flags:
-            if len(unmatched_license_flags) =3D=3D 1:
-                message =3D "because it has a restricted license '{0}'. =
Which is not listed in LICENSE_FLAGS_ACCEPTED".format(unmatched_license_f=
lags[0])
-            else:
-                message =3D "because it has restricted licenses {0}. Whi=
ch are not listed in LICENSE_FLAGS_ACCEPTED".format(
-                    ", ".join("'{0}'".format(f) for f in unmatched_licen=
se_flags))
-            bb.debug(1, "Skipping %s %s" % (pn, message))
+            for unmatched in unmatched_license_flags:
+                message =3D "Has a restricted license '%s' which is not =
listed in your LICENSE_FLAGS_ACCEPTED." % unmatched
+                details =3D d.getVarFlag("LICENSE_FLAGS_DETAILS", unmatc=
hed)
+                if details:
+                    message +=3D " For further details, see %s." % detai=
ls
+            bb.debug(1, "Skipping %s: %s" % (pn, message))
             raise bb.parse.SkipRecipe(message)
=20
     # If we're building a target package we need to use fakeroot (pseudo=
)
--=20
2.34.1


