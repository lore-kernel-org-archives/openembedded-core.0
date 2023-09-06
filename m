Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA99BEE14A5
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 15:17:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1046.1694013412529808644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 08:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 193BF11FB;
	Wed,  6 Sep 2023 08:17:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9A1733F7B4;
	Wed,  6 Sep 2023 08:16:51 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] scripts/oe-find-native-sysroot: use bitbake-getvar
Date: Wed,  6 Sep 2023 16:16:48 +0100
Message-Id: <20230906151648.313352-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230906151648.313352-1-ross.burton@arm.com>
References: <20230906151648.313352-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 15:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187321

From: Ross Burton <ross.burton@arm.com>

Instead of bitbake and grep, just use bitbake-getvar.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/oe-find-native-sysroot | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-sysr=
oot
index 5146bbf9999..6228efcbeec 100755
--- a/scripts/oe-find-native-sysroot
+++ b/scripts/oe-find-native-sysroot
@@ -36,20 +36,9 @@ if [ "$1" =3D '--help' -o "$1" =3D '-h' -o $# -ne 1 ] =
; then
 fi
=20
 # Global vars
-BITBAKE_E=3D""
 set_oe_native_sysroot(){
-    echo "Running bitbake -e $1"
-    BITBAKE_E=3D"`bitbake -e $1`"
-    OECORE_NATIVE_SYSROOT=3D`echo "$BITBAKE_E" | grep ^STAGING_DIR_NATIV=
E=3D | cut -d '"' -f2`
-
-    if [ "x$OECORE_NATIVE_SYSROOT" =3D "x" ]; then
-        # This indicates that there was an error running bitbake -e that
-        # the user needs to be informed of
-        echo "There was an error running bitbake to determine STAGING_DI=
R_NATIVE"
-        echo "Here is the output from bitbake -e $1"
-        echo $BITBAKE_E
-        exit 1
-    fi
+    echo "Getting sysroot..."
+    OECORE_NATIVE_SYSROOT=3D$(bitbake-getvar -r $1 --value STAGING_DIR_N=
ATIVE)
 }
=20
 if [ "x$OECORE_NATIVE_SYSROOT" =3D "x" ]; then
--=20
2.34.1


