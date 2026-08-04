Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBDDC56201
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 22:05:09 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27829.1785881103135731572
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 15:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=k2PUnZfO;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from alhe-dev-ub.waqitnwczulubdoacjva2kqlvd.phxx.internal.cloudapp.net (unknown [134.33.52.9])
	by linux.microsoft.com (Postfix) with ESMTPSA id 966E420B7169
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 15:04:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 966E420B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1785881081;
	bh=KZnEUiYESM+aPbqxd+Xeuj9eNWJpR0+e30YdYe1TmS8=;
	h=From:To:Subject:Date:From;
	b=k2PUnZfO0Lx/p1tYPx6EfIZVcZOCY3etDKWE9MDlbflQ8OtCyHM4KOdgjfsBrk6jN
	 AwHLHQ7NSIJTFaXKvm3mdkWcB3TUxh2wfK8iFizP1g0OOAEYnj19UD4UkOA0T+7jN4
	 dDMkU7C7mcy8KuA1jTtsovPNA/PgXrYvN8w/J5+A=
From: Alejandro Hernandez <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] libtool: strip build system triplet from installed libtool script
Date: Tue,  4 Aug 2026 22:04:53 +0000
Message-ID: <20260804220456.2342710-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 22:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242805

The installed /usr/bin/libtool script sourced by any recipe that
inherits libtool contains build_alias=3D, build=3D and build_os=3D lines
populated by config.status with the *build machine's* triplet
(e.g. build=3Dx86_64-pc-linux-gnu, build_alias=3Dx86_64-linux). Those
values vary between autobuilder workers whose config.guess reports
different vendors or OS strings, which makes libtool.rpm non-
reproducible across the autobuilder pool and shows up as a diff in
the reproducibility selftest.

Extend the sanitising sed in remove-buildpaths.inc to blank those
three lines the same way the existing rules blank sysroot and
build-path references.

Verified locally: before this change the installed libtool contained
`build_alias=3Dx86_64-linux`, `build=3Dx86_64-pc-linux-gnu` and
`build_os=3Dlinux-gnu`; after this change all three lines are empty.

Assisted-by: AI - OpenAI
Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
---
 meta/recipes-devtools/libtool/remove-buildpaths.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/libtool/remove-buildpaths.inc b/meta/r=
ecipes-devtools/libtool/remove-buildpaths.inc
index 1ca95aeace..31bae6fb62 100644
--- a/meta/recipes-devtools/libtool/remove-buildpaths.inc
+++ b/meta/recipes-devtools/libtool/remove-buildpaths.inc
@@ -9,5 +9,8 @@ do_install:append () {
             -e 's@^\(predep_objects=3D"\).*@\1"@' \
             -e 's@^\(postdep_objects=3D"\).*@\1"@' \
             -e "s@${HOSTTOOLS_DIR}/@@g" \
+            -e 's@^build_alias=3D.*@build_alias=3D@' \
+            -e 's@^build=3D.*@build=3D@' \
+            -e 's@^build_os=3D.*@build_os=3D@' \
             -i ${D}${bindir}/libtool
 }
--=20
2.43.0


