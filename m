Return-Path: <s.mueller-klieser@phytec.de>
X-Greylist: delayed 433 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 18 May 2017 13:32:49 UTC
Received: from root.phytec.de (mail.x-arc.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id B6EE378039
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 13:32:49 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 45F70A0022F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 15:26:29 +0200 (CEST)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017051815253582-585654 ;
	Thu, 18 May 2017 15:25:35 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 May 2017 15:25:35 +0200
Message-Id: <1495113935-16337-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 18.05.2017 15:25:35,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 18.05.2017 15:25:35
X-TNEFEvaluated: 1
Subject: [PATCH] systemd: fix lz4 build
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
X-List-Received-Date: Thu, 18 May 2017 13:32:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Updating lz4 in oe-core required back porting 3d4cf7de48a from master,
as versioning scheme changed.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 ...heck-for-lz4-in-the-old-and-new-numbering.patch | 51 ++++++++++++++++++=
++++
 meta/recipes-core/systemd/systemd=5F232.bb           |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0021-build-sys-check-=
for-lz4-in-the-old-and-new-numbering.patch

diff --git a/meta/recipes-core/systemd/systemd/0021-build-sys-check-for-lz4=
-in-the-old-and-new-numbering.patch b/meta/recipes-core/systemd/systemd/002=
1-build-sys-check-for-lz4-in-the-old-and-new-numbering.patch
new file mode 100644
index 0000000..a7d7461
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0021-build-sys-check-for-lz4-in-the=
-old-and-new-numbering.patch
@@ -0,0 +1,51 @@
+From 8200002233bd40acda4bbfb991a31d87f4224fea Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek@in=
.waw.pl>
+Date: Wed, 23 Nov 2016 10:18:30 -0500
+Subject: [PATCH 21/21] build-sys: check for lz4 in the old and new numberi=
ng
+ scheme (#4717)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+lz4 upstream decided to switch to an incompatible numbering scheme
+(1.7.3 follows 131, to match the so version).
+PKG=5FCHECK=5FMODULES does not allow two version matches for the same pack=
age,
+so e.g. lz4 < 10 || lz4 >=3D 125 cannot be used. Check twice, once for
+"new" numbers (anything below 10 is assume to be new), once for the "old"
+numbers (anything above >=3D 125). This assumes that the "new" versioning
+will not get to 10 to quickly. I think that's a safe assumption, lz4 is a
+mature project.
+
+Fixed #4690.
+
+Upstream-Status: Backport
+
+Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
+---
+ configure.ac | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 279ce28..782b5d7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -640,10 +640,13 @@ AM=5FCONDITIONAL(HAVE=5FBZIP2, [test "$have=5Fbzip2"=
 =3D "yes"])
+ have=5Flz4=3Dno
+ AC=5FARG=5FENABLE(lz4, AS=5FHELP=5FSTRING([--disable-lz4], [Disable optio=
nal LZ4 support]))
+ AS=5FIF([test "x$enable=5Flz4" !=3D "xno"], [
+-        PKG=5FCHECK=5FMODULES(LZ4, [ liblz4 >=3D 125 ],
+-               [AC=5FDEFINE(HAVE=5FLZ4, 1, [Define in LZ4 is available])
++        PKG=5FCHECK=5FMODULES(LZ4, [ liblz4 < 10 ],
++               [AC=5FDEFINE(HAVE=5FLZ4, 1, [Define if LZ4 is available])
+                 have=5Flz4=3Dyes],
+-                have=5Flz4=3Dno)
++                [PKG=5FCHECK=5FMODULES(LZ4, [ liblz4 >=3D 125 ],
++                      [AC=5FDEFINE(HAVE=5FLZ4, 1, [Define if LZ4 is avail=
able])
++                      have=5Flz4=3Dyes],
++                      have=5Flz4=3Dno)])
+         AS=5FIF([test "x$have=5Flz4" =3D xno -a "x$enable=5Flz4" =3D xyes=
],
+               [AC=5FMSG=5FERROR([*** LZ4 support requested but libraries =
not found])])
+ ])
+--=20
+1.9.1
+
diff --git a/meta/recipes-core/systemd/systemd=5F232.bb b/meta/recipes-core=
/systemd/systemd=5F232.bb
index 398cb46..6513054 100644
--- a/meta/recipes-core/systemd/systemd=5F232.bb
+++ b/meta/recipes-core/systemd/systemd=5F232.bb
@@ -33,6 +33,7 @@ SRC=5FURI +=3D " \
            file://0018-check-for-uchar.h-in-configure.patch \
            file://0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.=
patch \
            file://0020-back-port-233-don-t-use-the-unified-hierarchy-for-t=
he-systemd.patch \
+           file://0021-build-sys-check-for-lz4-in-the-old-and-new-numberin=
g.patch \
 "
 SRC=5FURI=5Fappend=5Flibc-uclibc =3D "\
            file://0002-units-Prefer-getty-to-agetty-in-console-setup-syste=
m.patch \
--=20
1.9.1


