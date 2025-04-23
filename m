Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CCAC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 17:26:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.509.1745429206690224311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 10:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 733501063
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 10:26:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC4F63F5A1
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 10:26:45 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] uninative: show errors if installing fails
Date: Wed, 23 Apr 2025 18:26:41 +0100
Message-ID: <20250423172641.502356-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 17:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215318

We call the installer script but if it fails the user doesn't see the
reason, which makes resolving the problem hard.  Capture both stdout and
stderr as text, and display it to the user when it fails.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/uninative.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/uninative.bbclass b/meta/classes-global/=
uninative.bbclass
index d2297b53f55..75e0c19704d 100644
--- a/meta/classes-global/uninative.bbclass
+++ b/meta/classes-global/uninative.bbclass
@@ -109,7 +109,7 @@ ${UNINATIVE_STAGING_DIR}-uninative/relocate_sdk.py \
   ${UNINATIVE_LOADER} \
   ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/${bindir_native=
}/patchelf-uninative \
   ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux${base_libdir_na=
tive}/libc*.so*" % chksum)
-        subprocess.check_output(cmd, shell=3DTrue)
+        subprocess.check_output(cmd, shell=3DTrue, text=3DTrue, stderr=3D=
subprocess.STDOUT)
=20
         with open(loaderchksum, "w") as f:
             f.write(chksum)
@@ -122,7 +122,9 @@ ${UNINATIVE_STAGING_DIR}-uninative/relocate_sdk.py \
         bb.warn("Disabling uninative as unable to fetch uninative tarbal=
l: %s" % str(exc))
         bb.warn("To build your own uninative loader, please bitbake unin=
ative-tarball and set UNINATIVE_TARBALL appropriately.")
     except subprocess.CalledProcessError as exc:
-        bb.warn("Disabling uninative as unable to install uninative tarb=
all: %s" % str(exc))
+        bb.warn("Disabling uninative as unable to install uninative tarb=
all:")
+        bb.warn(str(exc))
+        bb.warn(exc.stdout)
         bb.warn("To build your own uninative loader, please bitbake unin=
ative-tarball and set UNINATIVE_TARBALL appropriately.")
     finally:
         os.chdir(olddir)
--=20
2.43.0


