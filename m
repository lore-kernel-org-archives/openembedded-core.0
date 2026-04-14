Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7309F9D0E0
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 15:57:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56.1776182217280640348
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 08:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=V+cwWzoT;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 350674403
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 08:56:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8AF083F7B4
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 08:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776182216; bh=K76XiFFBvssEtTIoXM0tHxtMT7abJHjQtmW2apc/XAI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=V+cwWzoTRKOP9pRHuKkJutxeTqFbASkiOcIxBuHLaU63G2z4iALweD0dD4PqwtjYM
	 PluQVW3DFWgYZKQGffzTyr1rsjVKfDdz/edJwU22l8f834Ve3oaCOLUWHGjc5Gmlwy
	 +ndDacEy+qSRpv/2k/pu64ci3FJSadtF2AmMGDHM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] re2c: backport fix for CVE-2026-2903
Date: Tue, 14 Apr 2026 16:56:48 +0100
Message-ID: <20260414155652.1214302-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414155652.1214302-1-ross.burton@arm.com>
References: <20260414155652.1214302-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 15:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235162

Backport a patch from upstream to fix CVE-2026-2903.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../re2c/re2c/CVE-2026-2903.patch             | 68 +++++++++++++++++++
 meta/recipes-support/re2c/re2c_4.4.bb         |  4 +-
 2 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/re2c/re2c/CVE-2026-2903.patch

diff --git a/meta/recipes-support/re2c/re2c/CVE-2026-2903.patch b/meta/re=
cipes-support/re2c/re2c/CVE-2026-2903.patch
new file mode 100644
index 00000000000..266891fa494
--- /dev/null
+++ b/meta/recipes-support/re2c/re2c/CVE-2026-2903.patch
@@ -0,0 +1,68 @@
+From febeb977936f9519a25d9fbd10ff8256358cdb97 Mon Sep 17 00:00:00 2001
+From: Ulya Trofimovich <skvadrik@gmail.com>
+Date: Tue, 3 Feb 2026 21:33:11 +0000
+Subject: [PATCH] Fix null pointer dereference when actions are used with=
out
+ rules.
+
+Null pointer dereference happened because the root TNFA state was null:
+there were no rules for a block, but determinization still happened.
+
+In this case re2c should emit an error and never even attempt
+determinization. It was properly handled for blocks with start
+conditions, but not for normal blocks.
+
+This addresses #571 "[Bug] Segmentation Fault (NULL Dereference) in
+re2c::closure_leftmost_dfs during determinization".
+
+CVE: CVE-2026-2903
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/parse/ast.cc                | 19 +++++++++++++++----
+ test/conditions/cond_error_10.c |  2 +-
+ 2 files changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/src/parse/ast.cc b/src/parse/ast.cc
+index 91865e801..986cfb7da 100644
+--- a/src/parse/ast.cc
++++ b/src/parse/ast.cc
+@@ -332,10 +332,6 @@ Ret check_and_merge_special_rules(AstGrams& grams, =
const opt_t* opts, Msg& msg,
+                 all_conds_have_it =3D false; \
+             } else if (g.name =3D=3D STAR_COND) { \
+                 star_action =3D g.action[0]; \
+-            } else if (g.rules.empty()) { \
+-                RET_FAIL(msg.error(g.action[0]->loc, \
+-                    "%s action for non-existing condition `%s` found", =
\
+-                    str, g.name.c_str())); \
+             } \
+         } \
+         if (star_action && all_conds_have_it) { \
+@@ -422,6 +418,21 @@ Ret check_and_merge_special_rules(AstGrams& grams, =
const opt_t* opts, Msg& msg,
+         }
+     }
+=20
++    for (const AstGram& g : grams) {
++        if (g.rules.empty()) {
++#define CHECK_ACTION(action, str) do { \
++            if (!g.action.empty()) { \
++                RET_FAIL(msg.error(g.action[0]->loc, \
++                    "%s action %sbut no rules found", str, incond(g.nam=
e).c_str())); \
++            } \
++} while(0)
++            CHECK_ACTION(entry, "entry");
++            CHECK_ACTION(pre_rule, "pre-rule");
++            CHECK_ACTION(post_rule, "post-rule");
++#undef CHECK_ACTION
++        }
++    }
++
+     // zero condition must be the first one.
+     auto zero =3D std::find_if(
+             grams.begin(), grams.end(), [](const AstGram& g) { return g=
.name =3D=3D ZERO_COND; });
+diff --git a/test/conditions/cond_error_10.c b/test/conditions/cond_erro=
r_10.c
+index 571028a22..3bfde301b 100644
+--- a/test/conditions/cond_error_10.c
++++ b/test/conditions/cond_error_10.c
+@@ -1 +1 @@
+-conditions/cond_error_10.re:7:5: error: pre-rule action for non-existin=
g condition `c` found
++conditions/cond_error_10.re:7:5: error: pre-rule action in condition 'c=
' but no rules found
diff --git a/meta/recipes-support/re2c/re2c_4.4.bb b/meta/recipes-support=
/re2c/re2c_4.4.bb
index 3be66d13884..ea9364c483d 100644
--- a/meta/recipes-support/re2c/re2c_4.4.bb
+++ b/meta/recipes-support/re2c/re2c_4.4.bb
@@ -6,7 +6,9 @@ SECTION =3D "devel"
 LICENSE =3D "PD"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D64eca4d8a3b67f9dc7656094731a2=
c8d"
=20
-SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz \
+           file://CVE-2026-2903.patch"
+
 SRC_URI[sha256sum] =3D "6b6b865924447ef992d5db4e52fb9307e5f65f26edd43efa=
91395da810f4280a"
 GITHUB_BASE_URI =3D "https://github.com/skvadrik/re2c/releases"
=20
--=20
2.43.0


