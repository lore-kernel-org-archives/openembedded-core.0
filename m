Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.tricorecenter.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 282356ABF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 08:27:42 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 60903A00105
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 10:28:53 +0200 (CEST)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015042110274328-42004 ;
	Tue, 21 Apr 2015 10:27:43 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 10:23:47 +0200
Message-Id: <1429604627-48554-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 21.04.2015 10:27:43,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 21.04.2015 10:27:43
Subject: [PATCH v2] gcc-4.9: backport from gcc trunk r212178
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
X-List-Received-Date: Tue, 21 Apr 2015 08:27:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

When compiling meta-toolchain-qt5 on cortexa8, the compiler throws an
internal compiler error:

...
qttools-opensource-src-5.3.2/src/linguist/shared/po.cpp:
In function 'bool loadPO(Translator&, QIODevice&, ConversionData&)':
qttools-opensource-src-5.3.2/src/linguist/shared/po.cpp:717:1:
internal compiler error: in add=5Fstores, at var-tracking.c:6000
...

Tracking this down led to https://bugs.linaro.org/show=5Fbug.cgi?id=3D534
It seems the bug is well know and fixed upstream. So backporting from
trunk seems to be the right solution. This fixes the compiler problem
on cortexa8 and does not seem to be very invasive. The original commit
can be found at:

git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@212178 138bc75d-0d04-0410-9=
61f-82ee72b054a4

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
v2: bug is still present in master, so this patch applies on master.
    It is relevant for more gcc versions. I tested master and dizzy.
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 ...racking.c-backport-from-gcc-trunk-r212178.patch | 39 ++++++++++++++++++=
++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0062-gcc-var-tracking=
.c-backport-from-gcc-trunk-r212178.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/=
gcc/gcc-4.9.inc
index 3af87d1..ee31f0b 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -77,6 +77,7 @@ SRC=5FURI =3D "\
     file://0059-gcc-PR-rtl-optimization-63348.patch \
     file://0060-Only-allow-e500-double-in-SPE=5FSIMD=5FREGNO=5FP-registers=
.patch \
     file://0061-target-gcc-includedir.patch \
+    file://0062-gcc-var-tracking.c-backport-from-gcc-trunk-r212178.patch \
 "
 SRC=5FURI[md5sum] =3D "4df8ee253b7f3863ad0b86359cd39c43"
 SRC=5FURI[sha256sum] =3D "2020c98295856aa13fda0f2f3a4794490757fc24bcca918d=
52cc8b4917b972dd"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0062-gcc-var-tracking.c-back=
port-from-gcc-trunk-r212178.patch b/meta/recipes-devtools/gcc/gcc-4.9/0062-=
gcc-var-tracking.c-backport-from-gcc-trunk-r212178.patch
new file mode 100644
index 0000000..c0ea62f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0062-gcc-var-tracking.c-backport-fr=
om-gcc-trunk-r212178.patch
@@ -0,0 +1,39 @@
+From b30ffb8097749fdb55704aa7d8307ca1a58255d6 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Stefan=3D20M=3DC3=3DBCller-Klieser?=3D <s.mueller-kliese=
r@phytec.de>
+Date: Tue, 7 Apr 2015 16:15:11 +0200
+Subject: [PATCH] gcc/var-tracking.c: backport from gcc trunk r212178
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+resolves a bug seen on cortexa8 building qt5 libraries.
+
+2014-06-30  Joseph Myers  <joseph@codesourcery.com>
+
+    * var-tracking.c (add=5Fstores): Return instead of asserting if old
+    and new values for conditional store are the same.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@212178 138bc75d-0d04-0410-=
961f-82ee72b054a4
+
+Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
+---
+ gcc/var-tracking.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/var-tracking.c b/gcc/var-tracking.c
+index 65d8285..7c38910 100644
+--- a/gcc/var-tracking.c
++++ b/gcc/var-tracking.c
+@@ -5997,7 +5997,8 @@ add=5Fstores (rtx loc, const=5Frtx expr, void *cuip)
+     {
+       cselib=5Fval *oval =3D cselib=5Flookup (oloc, GET=5FMODE (oloc), 0,=
 VOIDmode);
+=20
+-      gcc=5Fassert (oval !=3D v);
++      if (oval =3D=3D v)
++        return;
+       gcc=5Fassert (REG=5FP (oloc) || MEM=5FP (oloc));
+=20
+       if (oval && !cselib=5Fpreserved=5Fvalue=5Fp (oval))
+--=20
+1.9.1
+
--=20
1.9.1


