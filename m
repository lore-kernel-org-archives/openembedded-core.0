Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27931C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 19:42:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.2486.1646682160282466637
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 11:42:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0E9A1576
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:42:39 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C4003F7F5
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:42:39 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] flit_core: clean up configure/compile
Date: Mon,  7 Mar 2022 19:42:35 +0000
Message-Id: <20220307194236.3837684-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307194236.3837684-1-ross.burton@arm.com>
References: <20220307194236.3837684-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 19:42:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162862

Make do_configure do nothing by default as the base configure isn't
useful, and invoke the build API directly instead of writing a script.

In the future, this can simply call python3-build.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/flit_core.bbclass | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/classes/flit_core.bbclass b/meta/classes/flit_core.bbcl=
ass
index 819d12457c..a7667795fe 100644
--- a/meta/classes/flit_core.bbclass
+++ b/meta/classes/flit_core.bbclass
@@ -3,15 +3,13 @@ inherit pip_install_wheel python3native python3-dir set=
uptools3-base
 DEPENDS +=3D "python3 python3-flit-core-native python3-pip-native"
=20
 flit_core_do_configure () {
-    mkdir -p ${S}/dist
-    cat > ${S}/build-it.py << EOF
-from flit_core import buildapi
-buildapi.build_wheel('./dist')
-EOF
+    :
 }
=20
+# TODO: ideally this uses pypa/build
 flit_core_do_compile () {
-    ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/build=
-it.py
+    mkdir -p ${S}/dist
+    nativepython3 -c "from flit_core import buildapi; buildapi.build_whe=
el('./dist')"
 }
=20
 EXPORT_FUNCTIONS do_configure do_compile
--=20
2.25.1


