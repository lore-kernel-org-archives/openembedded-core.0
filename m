Return-Path: <richard@nod.at>
X-Greylist: delayed 496 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 18 Dec 2018 23:37:32 UTC
Received: from lilium.sigma-star.at (lilium.sigma-star.at [109.75.188.150])
	by mail.openembedded.org (Postfix) with ESMTP id 5CEE96BA72
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 23:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by lilium.sigma-star.at (Postfix) with ESMTP id 9132718021730;
	Wed, 19 Dec 2018 00:29:17 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 00:29:11 +0100
Message-Id: <20181218232911.10855-1-richard@nod.at>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] sdk: Fix SDKIMAGE_LINGUAS handling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2018 23:37:32 -0000
Content-Transfer-Encoding: quoted-printable

Currently SDKIMAGE_LINGUAS is broken for any inputs except "all".
In the non-"all" case, each enabled language package is installed via
pm.install("nativesdk-glibc-binary-localedata-%s.utf-8" % lang)
This will throw a python exception since pm.install() expects a list of
strings and not a string.

Fix the problem by passing a single element list to pm.install().

Cc: richard.purdie@linuxfoundation.org
Fixes: 67615e01751b ("rootfs_rpm.bbclass: migrate image creation to dnf")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 meta/lib/oe/sdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 153b07d76b40..98073cf0cac7 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -96,7 +96,7 @@ class Sdk(object, metaclass=3DABCMeta):
                 pm.install_glob("nativesdk-glibc-binary-localedata-*.utf=
-8", sdk=3DTrue)
             else:
                 for lang in linguas.split():
-                    pm.install("nativesdk-glibc-binary-localedata-%s.utf=
-8" % lang)
+                    pm.install(["nativesdk-glibc-binary-localedata-%s.ut=
f-8" % lang])
             # Generate a locale archive of them
             target_arch =3D self.d.getVar('SDK_ARCH')
             rootfs =3D oe.path.join(self.sdk_host_sysroot, self.sdk_nati=
ve_path)
--=20
2.20.1


