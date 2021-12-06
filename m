Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D2FC433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 12:47:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.50894.1638794847083300987
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 04:47:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6477F11B3
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 04:47:25 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 105663F881
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 04:47:24 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tcf-agent: cleanup patches
Date: Mon,  6 Dec 2021 12:47:21 +0000
Message-Id: <20211206124721.3899116-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 12:47:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159226

ldflags.patch isn't really suitable for upstream, so mark inappropriate.

fix_ranlib.patch has been rebased into uselessness over time, it's now
setting RANLIB to just '$@' which expands to '' when called, so is a
null operation.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../tcf-agent/tcf-agent/fix_ranlib.patch        | 17 -----------------
 .../tcf-agent/tcf-agent/ldflags.patch           |  6 +++++-
 .../recipes-devtools/tcf-agent/tcf-agent_git.bb |  1 -
 3 files changed, 5 insertions(+), 19 deletions(-)
 delete mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.=
patch

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch b=
/meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch
deleted file mode 100644
index abd33babeb..0000000000
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Actually pass the arguments to RANLIB.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Index: agent/Makefile.inc
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- a/Makefile.inc
-+++ b/Makefile.inc
-@@ -92,6 +92,7 @@ ifeq ($(OPSYS),GNU/Linux)
-     OPTS +=3D -DUSE_uuid_generate=3D0
-   endif
-   OPTS +=3D -DENABLE_arch_$(shell uname -m)
-+  RANLIB +=3D $@
- endif
-
- ifneq ($(OPSYS),Windows)
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch b/me=
ta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
index c03c55d22b..dfe492091c 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
@@ -1,4 +1,8 @@
-Upstream-Status: Pending
+We need LDFLAGS to be respected otherwise there are QA warnings as the r=
ight
+flags don't get used.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
 From d92af0483c20365fd0af740d0baef8870b4aa374 Mon Sep 17 00:00:00 2001
 From: Abdur Rehman <abdur_rehman@mentor.com>
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/reci=
pes-devtools/tcf-agent/tcf-agent_git.bb
index d6d563d8e7..0d627f4e23 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -11,7 +11,6 @@ PV =3D "1.7.0+git${SRCPV}"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
 SRC_URI =3D "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;proto=
col=3Dhttps;branch=3Dmaster \
-           file://fix_ranlib.patch \
            file://ldflags.patch \
            file://tcf-agent.init \
            file://tcf-agent.service \
--=20
2.25.1


