Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id AE9416FFCD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 16:08:54 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u56G8tOM028527 for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2016 11:08:55 -0500
Received: from delcastillo2.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016060611085549-544415 ;
	Mon, 6 Jun 2016 11:08:55 -0500 
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 6 Jun 2016 11:08:52 -0500
Message-Id: <1465229332-16069-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1464892387-696-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1464892387-696-1-git-send-email-alejandro.delcastillo@ni.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 06/06/2016 11:08:55 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 06/06/2016 11:08:55 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-06-06_07:, , signatures=0
Subject: [PATCH v3] opkg-utils: update SRCREV
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
X-List-Received-Date: Mon, 06 Jun 2016 16:08:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Drop patches now included in newer SRCREV. Update HOMEPAGE and PV
version to better align with opkg. Current revision include:

* Python 3 compatibility
* Improved error handling

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 ...re-do-find-ls-code-to-not-fail-on-filenam.patch | 56 ------------------=
----
 .../opkg-build-Exit-when-fail-to-list-files.patch  | 45 -----------------
 meta/recipes-devtools/opkg-utils/opkg-utils=5Fgit.bb | 10 ++--
 3 files changed, 4 insertions(+), 107 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-b=
uild-re-do-find-ls-code-to-not-fail-on-filenam.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/opkg-build-=
Exit-when-fail-to-list-files.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-re=
-do-find-ls-code-to-not-fail-on-filenam.patch b/meta/recipes-devtools/opkg-=
utils/opkg-utils/0001-opkg-build-re-do-find-ls-code-to-not-fail-on-filenam.=
patch
deleted file mode 100644
index 5cbb55a..0000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-re-do-fin=
d-ls-code-to-not-fail-on-filenam.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 8e424296ce2af4a5a7392c38a31f8723f9b9fbda Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Thu, 7 Apr 2016 20:43:13 -0400
-Subject: [PATCH] opkg-build: re-do find/ls code to not fail on filenames w=
ith
- spaces
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- opkg-build | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/opkg-build b/opkg-build
-index a9ccad2..07305b2 100755
---- a/opkg-build
-+++ b/opkg-build
-@@ -6,7 +6,6 @@
- # 2003-04-25 rea@sr.unh.edu
- #   Updated to work on Familiar Pre0.7rc1, with busybox tar.
- #   Note it Requires: binutils-ar (since the busybox ar can't create)
--#   For UID debugging it needs a better "find".
- set -e
-=20
- version=3D1.0
-@@ -47,12 +46,12 @@ pkg=5Fappears=5Fsane() {
-=20
- 	PKG=5FERROR=3D0
-=20
--	tilde=5Ffiles=3D`find . -name '*~'`
-+	tilde=5Ffiles=3D`find . -name '*~' -ls -printf '\\\n'`
- 	if [ -n "$tilde=5Ffiles" ]; then
- 	    if [ "$noclean" =3D "1" ]; then
- 		echo "*** Warning: The following files have names ending in '~'.
- You probably want to remove them: " >&2
--		ls -ld $tilde=5Ffiles
-+		echo -e $tilde=5Ffiles
- 		if [ $? -ne 0 ]; then
- 			echo "*** Error: Fail to list files have names ending in '~'."
- 			exit 1
-@@ -64,12 +63,12 @@ You probably want to remove them: " >&2
- 	    fi
- 	fi
-=20
--	large=5Fuid=5Ffiles=3D`find . -uid +99 || true`
-+	large=5Fuid=5Ffiles=3D`find . -uid +99 -ls -printf '\\\n' || true`
-=20
- 	if [ "$ogargs" =3D "" ]  && [ -n "$large=5Fuid=5Ffiles" ]; then
- 		echo "*** Warning: The following files have a UID greater than 99.
- You probably want to chown these to a system user: " >&2
--		ls -ld $large=5Fuid=5Ffiles
-+		echo -e $large=5Fuid=5Ffiles
- 		if [ $? -ne 0 ]; then
- 			echo "*** Error: Fail to list files have a UID greater than 99."
- 			exit 1
---=20
-2.2.0
-
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/opkg-build-Exit-wh=
en-fail-to-list-files.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/o=
pkg-build-Exit-when-fail-to-list-files.patch
deleted file mode 100644
index 6c66902..0000000
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/opkg-build-Exit-when-fail=
-to-list-files.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-We have an issue when ls segfaults in some cases [1] so it's
-better to detect the failure at this level instead of continue
-the build process.
-
-[YOCTO #8926]
-
-Upstream-Status: Submitted [2]
-
-[1] https://bugzilla.yoctoproject.org/show=5Fbug.cgi?id=3D8926#c0
-[2] https://groups.google.com/forum/#!topic/opkg-devel/cmX02bgHZms
-
-Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
----
- opkg-build | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/opkg-build b/opkg-build
-index 98008b6..a9ccad2 100755
---- a/opkg-build
-+++ b/opkg-build
-@@ -53,6 +53,10 @@ pkg=5Fappears=5Fsane() {
- 		echo "*** Warning: The following files have names ending in '~'.
- You probably want to remove them: " >&2
- 		ls -ld $tilde=5Ffiles
-+		if [ $? -ne 0 ]; then
-+			echo "*** Error: Fail to list files have names ending in '~'."
-+			exit 1
-+		fi
- 		echo >&2
- 	    else
- 		echo "*** Removing the following files: $tilde=5Ffiles"
-@@ -66,6 +70,10 @@ You probably want to remove them: " >&2
- 		echo "*** Warning: The following files have a UID greater than 99.
- You probably want to chown these to a system user: " >&2
- 		ls -ld $large=5Fuid=5Ffiles
-+		if [ $? -ne 0 ]; then
-+			echo "*** Error: Fail to list files have a UID greater than 99."
-+			exit 1
-+		fi
- 		echo >&2
- 	fi
- 	   =20
---=20
-2.1.4
-
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils=5Fgit.bb b/meta/re=
cipes-devtools/opkg-utils/opkg-utils=5Fgit.bb
index 8873b28..a7aec45 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils=5Fgit.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils=5Fgit.bb
@@ -1,18 +1,16 @@
 SUMMARY =3D "Additional utilities for the opkg package manager"
 SUMMARY=5Fupdate-alternatives-opkg =3D "Utility for managing the alternati=
ves system"
 SECTION =3D "base"
-HOMEPAGE =3D "http://code.google.com/p/opkg/"
+HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils"
 LICENSE =3D "GPLv2+"
 LIC=5FFILES=5FCHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f \
                     file://opkg.py;beginline=3D1;endline=3D18;md5=3D159174=
91ad6bf7acc666ca5f7cc1e083"
 PROVIDES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives'=
, 'virtual/update-alternatives', '', d)}"
=20
-SRCREV =3D "53274f087565fd45d8452c5367997ba6a682a37a"
-PV =3D "0.1.8+git${SRCPV}"
+SRCREV =3D "3ffece9bf19a844edacc563aa092fd1fbfcffeee"
+PV =3D "0.3.2+git${SRCPV}"
=20
-SRC=5FURI =3D "git://git.yoctoproject.org/opkg-utils \
-           file://opkg-build-Exit-when-fail-to-list-files.patch \
-           file://0001-opkg-build-re-do-find-ls-code-to-not-fail-on-filena=
m.patch"
+SRC=5FURI =3D "git://git.yoctoproject.org/opkg-utils"
 SRC=5FURI=5Fappend=5Fclass-native =3D " file://tar=5Fignore=5Ferror.patch"
=20
 S =3D "${WORKDIR}/git"
--=20
1.9.1


