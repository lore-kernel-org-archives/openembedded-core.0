Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6FDC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 13:49:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8620.1702302589025476063
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 05:49:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1749FEC;
	Mon, 11 Dec 2023 05:50:34 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0545E3F738;
	Mon, 11 Dec 2023 05:49:47 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] go: set vendor in CVE_PRODUCT
Date: Mon, 11 Dec 2023 13:49:46 +0000
Message-Id: <20231211134946.4162388-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 13:49:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192167

From: Ross Burton <ross.burton@arm.com>

It's not uncommon for specific third party modules to use "go" as the
product[1]. However, the canonical CPE for the official Go
language/runtime is always golang:go[2], so use that explicitly.

[1] e.g. https://nvd.nist.gov/vuln/detail/CVE-2023-49292
[2] e.g. https://nvd.nist.gov/vuln/detail/CVE-2023-39320

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/go/go-binary-native_1.20.12.bb | 2 +-
 meta/recipes-devtools/go/go-common.inc               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.12.bb b/meta/=
recipes-devtools/go/go-binary-native_1.20.12.bb
index e555412a19c..41db2ada808 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.12.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.12.bb
@@ -16,7 +16,7 @@ SRC_URI[go_linux_ppc64le.sha256sum] =3D "2ae0ec3736216d=
fbd7b01ff679842dc1bed365e53
 UPSTREAM_CHECK_URI =3D "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX =3D "go(?P<pver>\d+(\.\d+)+)\.linux"
=20
-CVE_PRODUCT =3D "go"
+CVE_PRODUCT =3D "golang:go"
=20
 S =3D "${WORKDIR}/go"
=20
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtoo=
ls/go/go-common.inc
index 96e32eeb978..db165792dcb 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -20,7 +20,7 @@ B =3D "${S}"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)\.src\.tar"
=20
 # all recipe variants are created from the same product
-CVE_PRODUCT =3D "go"
+CVE_PRODUCT =3D "golang:go"
=20
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
 SSTATE_SCAN_CMD =3D "true"
--=20
2.34.1


