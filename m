Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246BDC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 19:42:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.2487.1646682160789596743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 11:42:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53237153B
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:42:40 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F28BA3F7F5
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:42:39 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] setuptools_build_meta: clean up configure/compile
Date: Mon,  7 Mar 2022 19:42:36 +0000
Message-Id: <20220307194236.3837684-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307194236.3837684-1-ross.burton@arm.com>
References: <20220307194236.3837684-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 19:42:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162863

Make do_configure do nothing by default as the base configure isn't
useful, and invoke the build API directly instead of writing a script.

In the future, this can simply call python3-build.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/setuptools_build_meta.bbclass | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/classes/setuptools_build_meta.bbclass b/meta/classes/se=
tuptools_build_meta.bbclass
index 8f5479e922..0651cca0a0 100644
--- a/meta/classes/setuptools_build_meta.bbclass
+++ b/meta/classes/setuptools_build_meta.bbclass
@@ -3,16 +3,13 @@ inherit pip_install_wheel setuptools3-base
 DEPENDS +=3D "python3-setuptools-native python3-wheel-native"
=20
 setuptools_build_meta_do_configure () {
-    mkdir -p ${S}/dist
-    cat > ${S}/build-it.py << EOF
-from setuptools import build_meta
-wheel =3D build_meta.build_wheel('./dist')
-print(wheel)
-EOF
+    :
 }
=20
+# TODO: ideally this uses pypa/build
 setuptools_build_meta_do_compile () {
-    nativepython3 ${S}/build-it.py
+    mkdir -p ${S}/dist
+    nativepython3 -c "from setuptools import build_meta; build_meta.buil=
d_wheel('./dist')"
 }
=20
 EXPORT_FUNCTIONS do_configure do_compile
--=20
2.25.1


