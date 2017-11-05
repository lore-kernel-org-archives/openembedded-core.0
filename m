Return-Path: <gael.portay@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1A1DC782A3
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Nov 2017 18:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2966E9C1B16
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Nov 2017 13:08:14 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id 3RVzSc-GKUtu; Sun,  5 Nov 2017 13:08:13 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 9180D9C24E0;
	Sun,  5 Nov 2017 13:08:13 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id nOwh7DLoNsl9; Sun,  5 Nov 2017 13:08:13 -0500 (EST)
Received: from localhost.localdomain (unknown [172.16.15.6])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 64C289C1B16;
	Sun,  5 Nov 2017 13:08:13 -0500 (EST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Nov 2017 13:08:22 -0500
Message-Id: <20171105180822.31210-1-gael.portay@savoirfairelinux.com>
X-Mailer: git-send-email 2.14.2
MIME-Version: 1.0
Subject: [PATCH] util-linux: create nativesdk lib packages
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
X-List-Received-Date: Sun, 05 Nov 2017 18:08:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The nativesdk class does not create lib<x> packages as its cross
counterpart does.

	libblkid
	libuuid
	libsmartcols
	libfdisk
	libmount...

Instead theses libraries are shipped into the nativesdk-util-linux
package.

This causes nativesdk images to fail at do_rootfs when a package depends
on util-linux-lib<x> because the nativesdk-util-linux-lib<x> is not
created.

The example below shows what the error looks like with the not created
package nativesdk-util-linux-libuuid.

    	Collected errors:
    	 * calculate_dependencies_for: Cannot satisfy the following dependen=
cies for nativesdk-packagegroup-sdk-host:
    	 *     nativesdk-util-linux-libuuid *
    	 * opkg_solver_install: Cannot install package nativesdk-packagegrou=
p-sdk-host.

The reason comes from the place where the libraries are installed.

Libraries are installed under ${base_libdir} (ie. /lib) for the cross
the package; but they are installed under ${libdir} (ie. /usr/lib) for
nativesdk (and native).

	EXTRA_OECONF =3D "${SHARED_EXTRA_OECONF} --libdir=3D${base_libdir}"

	EXTRA_OECONF_class-native =3D "${SHARED_EXTRA_OECONF} \
	                             --disable-fallocate \
				     --disable-use-tty-group \
	"

The populate_packages_prepend function dynamically creates lib<x>
packages that are installed under ${base_libdir} directory.

The new function populate_packages_prepend_class-nativesdk for nativesdk
mimics the behavior of the cross function.

It creates dynamically nativesdk-lib<x> packages for libraries that are
installed under the ${libdir} directory.

Improves:

	91c0f9e35d util-linux: move libraries to base_libdir
	4cff0bd254 util-linux: Fix QA warnings about ALTERNATIVES
	4571c9e963 util-linux: collect libs for related libxx-dev package
	a7572d7000 util-linux: split libraries dynamically

Signed-off-by: Ga=C3=ABl PORTAY <gael.portay@savoirfairelinux.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
index 5c4694b1fd..0ab05c8cdc 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -303,6 +303,13 @@ python populate_packages_prepend() {
                       extra_depends=3D'', prepend=3DTrue, allow_links=3D=
True)
 }
=20
+python populate_packages_prepend_class-nativesdk() {
+    do_split_packages(d, '${libdir}', '^lib(.*)\.so\..*$',
+                      output_pattern=3D'nativesdk-util-linux-lib%s',
+                      description=3D'nativesdk-util-linux lib%s',
+                      extra_depends=3D'', prepend=3DTrue, allow_links=3D=
True)
+}
+
 RDEPENDS_${PN}-bash-completion +=3D "util-linux-lsblk"
 RDEPENDS_${PN}-ptest =3D "bash grep coreutils"
=20
--=20
2.14.2


