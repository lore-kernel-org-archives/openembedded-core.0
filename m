Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9E5C4167B
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 15:25:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.46112.1670858748648690865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 07:25:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 223CD2F4;
	Mon, 12 Dec 2022 07:26:28 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28BD13F71E;
	Mon, 12 Dec 2022 07:25:47 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] meson: always use meson subcommands
Date: Mon, 12 Dec 2022 15:25:42 +0000
Message-Id: <20221212152542.3762880-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221212152542.3762880-1-ross.burton@arm.com>
References: <20221212152542.3762880-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 15:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174495

Invoking meson with just paths is a deprecated use of the binary and
causes warnings, so call 'meson setup' explicitly.

Whilst doing this cleanup, we can also call 'meson compile' and 'meson
install' instead of ninja.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/meson.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
index 765e81bc4f8..1014bd058ea 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -152,7 +152,7 @@ meson_do_configure() {
     mkdir -p "${B}/meson-private/tmp"
     export TMPDIR=3D"${B}/meson-private/tmp"
     bbnote Executing meson ${EXTRA_OEMESON}...
-    if ! meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" ${MESON_CROSS_F=
ILE} ${EXTRA_OEMESON}; then
+    if ! meson setup ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" ${MESON_C=
ROSS_FILE} ${EXTRA_OEMESON}; then
         bbfatal_log meson failed
     fi
 }
@@ -169,11 +169,11 @@ do_configure[postfuncs] +=3D "meson_do_qa_configure=
"
=20
 do_compile[progress] =3D "outof:^\[(\d+)/(\d+)\]\s+"
 meson_do_compile() {
-    ninja -v ${PARALLEL_MAKE}
+    meson compile -v ${PARALLEL_MAKE}
 }
=20
 meson_do_install() {
-    DESTDIR=3D'${D}' ninja -v ${PARALLEL_MAKEINST} install
+    meson install --destdir ${D}
 }
=20
 EXPORT_FUNCTIONS do_configure do_compile do_install
--=20
2.34.1


