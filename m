Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0D9D3E77B
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 18:33:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3206.1765391595743980966
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 10:33:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 177D51762
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:33:08 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E6FE53F762
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:33:14 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] classes/meson: drop meson_do_qa_configure as it is non-functional
Date: Wed, 10 Dec 2025 18:33:02 +0000
Message-ID: <20251210183308.4022909-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210183308.4022909-1-ross.burton@arm.com>
References: <20251210183308.4022909-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 18:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227499

The patches to meson to add this warning were removed in 2021[1], so
remove the checks that look for them.

[1] oe-core cb2a7dcc86d ("meson: update 0.57.2 -> 0.58.0")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/meson.bbclass | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
index 45d43319f9c..72dbbcb67b1 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -184,16 +184,6 @@ meson_do_configure() {
     fi
 }
=20
-python meson_do_qa_configure() {
-    import re
-    warn_re =3D re.compile(r"^WARNING: Cross property (.+) is using defa=
ult value (.+)$", re.MULTILINE)
-    with open(d.expand("${B}/meson-logs/meson-log.txt")) as logfile:
-        log =3D logfile.read()
-    for (prop, value) in warn_re.findall(log):
-        bb.warn("Meson cross property %s used without explicit assignmen=
t, defaulting to %s" % (prop, value))
-}
-do_configure[postfuncs] +=3D "meson_do_qa_configure"
-
 do_compile[progress] =3D "outof:^\[(\d+)/(\d+)\]\s+"
 meson_do_compile() {
     meson compile -v ${PARALLEL_MAKE} ${MESON_TARGET}
--=20
2.43.0


