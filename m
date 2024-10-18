Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CC4D374BF
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 16:34:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.26848.1729269259865206737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 09:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8369FEC
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 09:34:48 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CBBC23F528
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 09:34:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] buildstats-summary: look for buildstats if not specified
Date: Fri, 18 Oct 2024 17:34:14 +0100
Message-Id: <20241018163414.791689-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 16:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206066

If the user hasn't specified a buildstats directory, use the latest
entry under $BUILDDIR.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/buildstats-summary | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/scripts/buildstats-summary b/scripts/buildstats-summary
index b10c671b29b..cc2a27722af 100755
--- a/scripts/buildstats-summary
+++ b/scripts/buildstats-summary
@@ -87,7 +87,11 @@ def main(argv=3DNone) -> int:
     )
=20
     parser.add_argument(
-        "buildstats", metavar=3D"BUILDSTATS", help=3D"Buildstats file", =
type=3Dpathlib.Path
+        "buildstats",
+        metavar=3D"BUILDSTATS",
+        nargs=3D"?",
+        type=3Dpathlib.Path,
+        help=3D"Buildstats file, or latest if not specified",
     )
     parser.add_argument(
         "--sort",
@@ -116,6 +120,16 @@ def main(argv=3DNone) -> int:
=20
     args =3D parser.parse_args(argv)
=20
+    # If a buildstats file wasn't specified, try to find the last one
+    if not args.buildstats:
+        try:
+            builddir =3D pathlib.Path(os.environ["BUILDDIR"])
+            buildstats_dir =3D builddir / "tmp" / "buildstats"
+            args.buildstats =3D sorted(buildstats_dir.iterdir())[-1]
+        except KeyError:
+            print("Build environment has not been configured, cannot fin=
d buildstats")
+            return 1
+
     bs =3D read_buildstats(args.buildstats)
     dump_buildstats(args, bs)
=20
--=20
2.34.1


