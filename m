Return-Path: <richard@nod.at>
Received: from lilium.sigma-star.at (lilium.sigma-star.at [109.75.188.150])
	by mail.openembedded.org (Postfix) with ESMTP id B844A7BFF8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 20:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by lilium.sigma-star.at (Postfix) with ESMTP id 4541C1802175F;
	Wed,  9 Jan 2019 21:42:36 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2019 21:42:19 +0100
Message-Id: <20190109204219.2460-1-richard@nod.at>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>
Subject: [PATCH v2] sdk: Fix SDKIMAGE_LINGUAS handling
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
X-List-Received-Date: Wed, 09 Jan 2019 20:42:37 -0000
Content-Transfer-Encoding: quoted-printable

Currently SDKIMAGE_LINGUAS is broken for any inputs except "all".
In the non-"all" case, each enabled language package is installed via
pm.install("nativesdk-glibc-binary-localedata-%s.utf-8" % lang)
This will throw a python exception since pm.install() expects a list of
strings and not a string.

Fix the problem by constructing a list.
That way it is now also possible to call the package installer just
once.

Cc: "Burton, Ross" <ross.burton@intel.com>
Fixes: 67615e01751b ("rootfs_rpm.bbclass: migrate image creation to dnf")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
Changes since v1, http://lists.openembedded.org/pipermail/openembedded-co=
re/2018-December/277240.html
 - Invoke the package installer just once (Ross Burton)

---
 meta/lib/oe/sdk.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 153b07d76b40..878ee1647ff2 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -95,8 +95,8 @@ class Sdk(object, metaclass=3DABCMeta):
             if linguas =3D=3D "all":
                 pm.install_glob("nativesdk-glibc-binary-localedata-*.utf=
-8", sdk=3DTrue)
             else:
-                for lang in linguas.split():
-                    pm.install("nativesdk-glibc-binary-localedata-%s.utf=
-8" % lang)
+                pm.install(["nativesdk-glibc-binary-localedata-%s.utf-8"=
 % \
+                           lang for lang in linguas.split()])
             # Generate a locale archive of them
             target_arch =3D self.d.getVar('SDK_ARCH')
             rootfs =3D oe.path.join(self.sdk_host_sysroot, self.sdk_nati=
ve_path)
--=20
2.20.1


