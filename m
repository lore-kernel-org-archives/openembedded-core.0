Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C8FC433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 18:02:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1673.1635876156113015846
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 11:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 348B911B3
	for <openembedded-core@lists.openembedded.org>;
 Tue,  2 Nov 2021 11:02:35 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE1D23F7B4
	for <openembedded-core@lists.openembedded.org>;
 Tue,  2 Nov 2021 11:02:34 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: silence DeprecationWarnings in python3-config
Date: Tue,  2 Nov 2021 18:02:33 +0000
Message-Id: <20211102180233.4104293-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 18:02:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157806

Our patched python3-config uses distutils, but that will emit a
DeprecationWarning when imported.  This isn't useful when using the
output of python3-config to find include paths.

This isn't a huge problem typically as the warning goes to stderr, but
some build systems read both stdout and stderr.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3/python-config.patch | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python-config.patch b/m=
eta/recipes-devtools/python/python3/python-config.patch
index d0ddbbc7fd..c53f646af3 100644
--- a/meta/recipes-devtools/python/python3/python-config.patch
+++ b/meta/recipes-devtools/python/python3/python-config.patch
@@ -14,7 +14,6 @@ as appropriate.
 Upstream-Status: Inappropriate [Embedded Specific]
=20
 Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
-:
=20
 ---
  Misc/python-config.in | 10 +++++-----
@@ -24,11 +23,13 @@ diff --git a/Misc/python-config.in b/Misc/python-conf=
ig.in
 index ebd99da..13e57ae 100644
 --- a/Misc/python-config.in
 +++ b/Misc/python-config.in
-@@ -6,7 +6,7 @@
+@@ -6,7 +6,9 @@
  import getopt
  import os
  import sys
 -import sysconfig
++import warnings
++warnings.filterwarnings("ignore", category=3DDeprecationWarning)
 +from distutils import sysconfig
 =20
  valid_opts =3D ['prefix', 'exec-prefix', 'includes', 'libs', 'cflags',
--=20
2.25.1


