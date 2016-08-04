Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.visioncatalog.com [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 0028D76651
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 13:35:22 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id A32DAA0041A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 15:27:58 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016080415275730-19329 ;
	Thu, 4 Aug 2016 15:27:57 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 4 Aug 2016 15:27:51 +0200
Message-Id: <1470317274-27771-5-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1470317274-27771-1-git-send-email-s.mueller-klieser@phytec.de>
References: <1470317274-27771-1-git-send-email-s.mueller-klieser@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 04.08.2016 15:27:57,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 04.08.2016 15:27:57
X-TNEFEvaluated: 1
Subject: [PATCH 4/7] python-numpy: remove dangling patch
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
X-List-Received-Date: Thu, 04 Aug 2016 13:35:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 .../python-numpy/files/add-glibc-check.patch       | 36 ------------------=
----
 1 file changed, 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/python-numpy/files/add-glibc-chec=
k.patch

diff --git a/meta/recipes-devtools/python-numpy/files/add-glibc-check.patch=
 b/meta/recipes-devtools/python-numpy/files/add-glibc-check.patch
deleted file mode 100644
index 29768f3..0000000
--- a/meta/recipes-devtools/python-numpy/files/add-glibc-check.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Dont punish musl for glibc's trignometeric functions problems
-additionally ensure that glibc specific macros are not used
-unconditionally
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: numpy-1.10.4/numpy/core/src/private/npy=5Fconfig.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- numpy-1.10.4.orig/numpy/core/src/private/npy=5Fconfig.h
-+++ numpy-1.10.4/numpy/core/src/private/npy=5Fconfig.h
-@@ -75,10 +75,12 @@
-=20
- #if defined(HAVE=5FFEATURES=5FH)
- #include <features.h>
-+#ifdef =5F=5FGLIBC=5F=5F
- #define TRIG=5FOK =5F=5FGLIBC=5FPREREQ(2, 16)
- #else
- #define TRIG=5FOK 0
- #endif
-+#endif
-=20
- #if !TRIG=5FOK
- #undef HAVE=5FCASIN
-Index: numpy-1.10.4/numpy/core/src/npymath/ieee754.c.src
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- numpy-1.10.4.orig/numpy/core/src/npymath/ieee754.c.src
-+++ numpy-1.10.4/numpy/core/src/npymath/ieee754.c.src
-@@ -612,7 +612,7 @@ void npy=5Fset=5Ffloatstatus=5Finvalid(void)
- }
-=20
-=20
--#elif defined(=5F=5FGLIBC=5F=5F) || defined(=5F=5FAPPLE=5F=5F) || \
-+#elif defined(=5F=5Flinux=5F=5F) || defined(=5F=5FAPPLE=5F=5F) || \
-       defined(=5F=5FCYGWIN=5F=5F) || defined(=5F=5FMINGW32=5F=5F) || \
-       (defined(=5F=5FFreeBSD=5F=5F) && (=5F=5FFreeBSD=5Fversion >=3D 5021=
14))
- #  include <fenv.h>
--=20
1.9.1


