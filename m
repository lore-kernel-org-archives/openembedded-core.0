Return-Path: <hans.beckerus@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id C95406B12F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 11:31:40 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id z5so6100082lbh.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 04:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:from:content-type:message-id:date:to
	:content-transfer-encoding:mime-version;
	bh=678pgtU6ryT89WNWOaj+QLytVQsB4PzG3qkM5f1qKVw=;
	b=X2hBcOyJxxfnUW1xDvGEzIbVpZuQGEcxs9yf/pXsZA0MEZf2qYaZG6ArzhE5/pw4yR
	BDj0Bz7T0iWYNjfaCD+aNU/9YlF4VPTUpEB++u5dKqKmLTIMU/m9ekTjBU0EiGGhHSaG
	l7+xrImzdsORaNltzAbQrymdlYR6ZPZY9/3GB5b/sBaG2nk5NIMGaDZtzTdPYZQlgSd3
	CJwJZXMU1YBbQATZM56+vKGWSw+101J/DcSp7Djh4wajZLdHA4c6PhusxNP+HmCCRPLs
	44JEjd1y+eP8CeQ0w6lqG7o6Oo/sPxJWmqsaFLbj3tbxmQ5dERIlS3xsL3jcE29OStlj
	yKPQ==
X-Received: by 10.112.168.35 with SMTP id zt3mr20455332lbb.11.1378812697982;
	Tue, 10 Sep 2013 04:31:37 -0700 (PDT)
Received: from [10.23.75.233] (c-5eeaaab7-74736162.cust.telenor.se.
	[94.234.170.183])
	by mx.google.com with ESMTPSA id zc3sm8342800lbb.2.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Sep 2013 04:31:36 -0700 (PDT)
From: =?utf-8?Q?Hans_Beck=C3=A9rus?= <hans.beckerus@gmail.com>
X-Mailer: iPhone Mail (10B329)
Message-Id: <00D40DBB-D50A-44EE-B939-8EC0AD1024EB@gmail.com>
Date: Tue, 10 Sep 2013 13:31:33 +0200
To: openembedded-core@lists.openembedded.org
Mime-Version: 1.0 (1.0)
Subject: [PATCH v3] libtool: fix resolve of lt_sysroot
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
X-List-Received-Date: Tue, 10 Sep 2013 11:31:42 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-D6895395-3F18-4ED2-A1B4-6F876DFA564A
Content-Transfer-Encoding: 7bit

--Apple-Mail-D6895395-3F18-4ED2-A1B4-6F876DFA564A
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


This patch updates libtool.m4 (and its output) to resolve a problem
with variable 'lt_sysroot' not being properly updated if the option
'--with[-libtool]-sysroot' is not provided when running the 'configure'
script for a package.
=20
According to the help text ouput from 'configure':
--with-libtool-sysroot=3DDIR Search for dependent libraries within DIR
                       (or the compiler's sysrooot if not specified).
=20
Due to swapped cases in a switch statement, when checking if the option
was specified or not, wrong actions were taken resulting in an
incorrect sysroot and failures to properly locate e.g. .la files.
=20
For current upstream status see:
http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
=20
Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
---
meta/recipes-devtools/libtool/libtool-2.4.2.inc    |  1 +
.../libtool/libtool/fix-resolve-lt-sysroot.patch   | 35 ++++++++++++++++++++=
++
2 files changed, 36 insertions(+)
create mode 100644 meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysr=
oot.patch
=20
diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-=
devtools/libtool/libtool-2.4.2.inc
index bb4ddf0..92e4949 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -20,6 +20,7 @@ SRC_URI =3D "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
                  file://respect-fstack-protector.patch \
            file://norm-rpath.patch \
            file://dont-depend-on-help2man.patch \
+           file://fix-resolve-lt-sysroot.patch \
           "
 SRC_URI[md5sum] =3D "d2f3b7d4627e69e13514a40e72a24d50"
diff --git a/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.pa=
tch b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
new file mode 100644
index 0000000..5a6335b
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
@@ -0,0 +1,35 @@
+
+Upstream-Status: Pending
+
+This patch updates libtool.m4 (and its output) to resolve a problem
+with variable 'lt_sysroot' not being properly updated if the option
+'--with[-libtool]-sysroot' is not provided when running the 'configure'
+script for a package.
+
+I have also reported the problem to libtool here
+
+http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
+
+Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
+---
+diff -ur libtool-2.4.2.orig/libltdl/m4/libtool.m4 libtool-2.4.2/libltdl/m4/=
libtool.m4
+--- libtool-2.4.2.orig/libltdl/m4/libtool.m4           2013-09-05 10:37:24.=
690013000 +0200
++++ libtool-2.4.2/libltdl/m4/libtool.m4 2013-09-05 12:05:51.560281000 +0200=

+@@ -1234,7 +1234,7 @@
+ dnl in case the user passed a directory name.
+ lt_sysroot=3D
+ case ${with_libtool_sysroot} in #(
+- yes)
++ no)
+    if test "$GCC" =3D yes; then
+      lt_sysroot=3D`$CC --print-sysroot 2>/dev/null`
+    fi
+@@ -1242,7 +1242,7 @@
+  /*)
+    lt_sysroot=3D`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`=

+    ;; #(
+- no|'')
++ yes|'')
+    ;; #(
+  *)
+    AC_MSG_RESULT([${with_libtool_sysroot}])
--
1.8.3.3=

--Apple-Mail-D6895395-3F18-4ED2-A1B4-6F876DFA564A
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><p class=3D"MsoNormal" style=3D"margin: 0cm=
 0cm 0.0001pt; "><br></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0=
001pt; "><span style=3D"-webkit-text-size-adjust: auto; background-color: rg=
ba(255, 255, 255, 0);">This patch updates libtool.m4 (and its output) to res=
olve a problem<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0=
cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; background=
-color: rgba(255, 255, 255, 0);">with variable 'lt_sysroot' not being proper=
ly updated if the option<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D=
"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; b=
ackground-color: rgba(255, 255, 255, 0);">'--with[-libtool]-sysroot' is not p=
rovided when running the 'configure'<o:p></o:p></span></p><p class=3D"MsoNor=
mal" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-a=
djust: auto; background-color: rgba(255, 255, 255, 0);">script for a package=
.<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.000=
1pt; "><o:p style=3D"-webkit-text-size-adjust: auto; background-color: rgba(=
255, 255, 255, 0);">&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D"margin: 0=
cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; background=
-color: rgba(255, 255, 255, 0);">According to the help text ouput from 'conf=
igure':<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm=
 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; background-color=
: rgba(255, 255, 255, 0);">--with-libtool-sysroot=3DDIR Search for dependent=
 libraries within DIR<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"m=
argin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; ba=
ckground-color: rgba(255, 255, 255, 0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; (or the compiler's sysrooot if not specified).<o:p></o=
:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><o=
:p style=3D"-webkit-text-size-adjust: auto; background-color: rgba(255, 255,=
 255, 0);">&nbsp;</o:p></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0=
.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; background-color: r=
gba(255, 255, 255, 0);">Due to swapped cases in a switch statement, when che=
cking if the option<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"mar=
gin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; back=
ground-color: rgba(255, 255, 255, 0);">was specified or not, wrong actions w=
ere taken resulting in an<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D=
"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; b=
ackground-color: rgba(255, 255, 255, 0);">incorrect sysroot and failures to p=
roperly locate e.g. .la files.<o:p></o:p></span></p><p class=3D"MsoNormal" s=
tyle=3D"margin: 0cm 0cm 0.0001pt; "><o:p style=3D"-webkit-text-size-adjust: a=
uto; background-color: rgba(255, 255, 255, 0);">&nbsp;</o:p></p><p class=3D"=
MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-=
size-adjust: auto; background-color: rgba(255, 255, 255, 0);">For current up=
stream status see:<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"marg=
in: 0cm 0cm 0.0001pt; "><font color=3D"#000000"><span style=3D"-webkit-text-=
size-adjust: auto; background-color: rgba(255, 255, 255, 0);"><a href=3D"htt=
p://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html" x-apple-da=
ta-detectors=3D"true" x-apple-data-detectors-type=3D"link" x-apple-data-dete=
ctors-result=3D"0">http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg=
00005.html</a><o:p></o:p></span></font></p><p class=3D"MsoNormal" style=3D"m=
argin: 0cm 0cm 0.0001pt; "><o:p style=3D"-webkit-text-size-adjust: auto; bac=
kground-color: rgba(255, 255, 255, 0);">&nbsp;</o:p></p><p class=3D"MsoNorma=
l" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adj=
ust: auto; background-color: rgba(255, 255, 255, 0);">Signed-off-by: Hans Be=
ckerus &lt;hans.beckerus at&nbsp;<a href=3D"http://gmail.com/" x-apple-data-=
detectors=3D"true" x-apple-data-detectors-type=3D"link" x-apple-data-detecto=
rs-result=3D"1">gmail.com</a>&gt;<o:p></o:p></span></p><p class=3D"MsoNormal=
" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adju=
st: auto; background-color: rgba(255, 255, 255, 0);">---<o:p></o:p></span></=
p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D=
"-webkit-text-size-adjust: auto; background-color: rgba(255, 255, 255, 0);">=
meta/recipes-devtools/libtool/libtool-2.4.2.inc&nbsp;&nbsp;&nbsp; |&nbsp; 1 +=
<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001=
pt; "><span style=3D"-webkit-text-size-adjust: auto; background-color: rgba(=
255, 255, 255, 0);">.../libtool/libtool/fix-resolve-lt-sysroot.patch&nbsp;&n=
bsp; | 35 ++++++++++++++++++++++<o:p></o:p></span></p><p class=3D"MsoNormal"=
 style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjus=
t: auto; background-color: rgba(255, 255, 255, 0);">2 files changed, 36 inse=
rtions(+)<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0=
cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; background-col=
or: rgba(255, 255, 255, 0);">create mode 100644 meta/recipes-devtools/libtoo=
l/libtool/fix-resolve-lt-sysroot.patch<o:p></o:p></span></p><p class=3D"MsoN=
ormal" style=3D"margin: 0cm 0cm 0.0001pt; "><o:p style=3D"-webkit-text-size-=
adjust: auto; background-color: rgba(255, 255, 255, 0);">&nbsp;</o:p></p><p c=
lass=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webk=
it-text-size-adjust: auto; background-color: rgba(255, 255, 255, 0);">diff -=
-git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtoo=
ls/libtool/libtool-2.4.2.inc<o:p></o:p></span></p><p class=3D"MsoNormal" sty=
le=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: a=
uto; background-color: rgba(255, 255, 255, 0);">index bb4ddf0..92e4949 10064=
4<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.000=
1pt; "><span style=3D"-webkit-text-size-adjust: auto; background-color: rgba=
(255, 255, 255, 0);">--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc<o=
:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt=
; "><span style=3D"-webkit-text-size-adjust: auto; background-color: rgba(25=
5, 255, 255, 0);">+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc<o:p>=
</o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "=
><span style=3D"-webkit-text-size-adjust: auto; background-color: rgba(255, 2=
55, 255, 0);">@@ -20,6 +20,7 @@ SRC_URI =3D "${GNU_MIRROR}/libtool/libtool-$=
{PV}.tar.gz \<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0=
cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; background=
-color: rgba(255, 255, 255, 0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;file://respect-f=
stack-protector.patch \<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D=
"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; b=
ackground-color: rgba(255, 255, 255, 0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://norm-rpath.patch \<o:p></o:p></span>=
</p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D=
"-webkit-text-size-adjust: auto; background-color: rgba(255, 255, 255, 0);">=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://do=
nt-depend-on-help2man.patch \<o:p></o:p></span></p><p class=3D"MsoNormal" st=
yle=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: a=
uto; background-color: rgba(255, 255, 255, 0);">+&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://fix-resolve-lt-sysroot.patch \<o:p>=
</o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "=
><span style=3D"-webkit-text-size-adjust: auto; background-color: rgba(255, 2=
55, 255, 0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "=
<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001=
pt; "><span style=3D"-webkit-text-size-adjust: auto; background-color: rgba(=
255, 255, 255, 0);"><o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"ma=
rgin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; bac=
kground-color: rgba(255, 255, 255, 0);">&nbsp;SRC_URI[md5sum] =3D "d2f3b7d46=
27e69e13514a40e72a24d50"<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D=
"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; b=
ackground-color: rgba(255, 255, 255, 0);">diff --git a/meta/recipes-devtools=
/libtool/libtool/fix-resolve-lt-sysroot.patch b/meta/recipes-devtools/libtoo=
l/libtool/fix-resolve-lt-sysroot.patch<o:p></o:p></span></p><p class=3D"MsoN=
ormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size=
-adjust: auto; background-color: rgba(255, 255, 255, 0);">new file mode 1006=
44<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.00=
01pt; "><span style=3D"-webkit-text-size-adjust: auto; background-color: rgb=
a(255, 255, 255, 0);">index&nbsp;<a href=3D"tel:0000000" x-apple-data-detect=
ors=3D"true" x-apple-data-detectors-type=3D"telephone" x-apple-data-detector=
s-result=3D"6">0000000</a>..5a6335b<o:p></o:p></span></p><p class=3D"MsoNorm=
al" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-ad=
just: auto; background-color: rgba(255, 255, 255, 0);">--- /dev/null<o:p></o=
:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><s=
pan style=3D"-webkit-text-size-adjust: auto; background-color: rgba(255, 255=
, 255, 0);">+++ b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysro=
ot.patch<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0c=
m 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; background-colo=
r: rgba(255, 255, 255, 0);">@@ -0,0 +1,35 @@<o:p></o:p></span></p><p class=3D=
"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text=
-size-adjust: auto; background-color: rgba(255, 255, 255, 0);">+<o:p></o:p><=
/span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span s=
tyle=3D"-webkit-text-size-adjust: auto; background-color: rgba(255, 255, 255=
, 0);">+Upstream-Status: Pending<o:p></o:p></span></p><p class=3D"MsoNormal"=
 style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjus=
t: auto; background-color: rgba(255, 255, 255, 0);">+<o:p></o:p></span></p><=
p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-w=
ebkit-text-size-adjust: auto; background-color: rgba(255, 255, 255, 0);">+Th=
is patch updates libtool.m4 (and its output) to resolve a problem<o:p></o:p>=
</span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span=
 style=3D"-webkit-text-size-adjust: auto; background-color: rgba(255, 255, 2=
55, 0);">+with variable 'lt_sysroot' not being properly updated if the optio=
n<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.000=
1pt; "><span style=3D"-webkit-text-size-adjust: auto; background-color: rgba=
(255, 255, 255, 0);">+'--with[-libtool]-sysroot' is not provided when runnin=
g the 'configure'<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margi=
n: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; backgr=
ound-color: rgba(255, 255, 255, 0);">+script for a package.<o:p></o:p></span=
></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=
=3D"-webkit-text-size-adjust: auto; background-color: rgba(255, 255, 255, 0)=
;">+<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.=
0001pt; "><span style=3D"-webkit-text-size-adjust: auto; background-color: r=
gba(255, 255, 255, 0);">+I have also reported the problem to libtool here<o:=
p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt;=
 "><span style=3D"-webkit-text-size-adjust: auto; background-color: rgba(255=
, 255, 255, 0);">+<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"marg=
in: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; backg=
round-color: rgba(255, 255, 255, 0);">+<a href=3D"http://lists.gnu.org/archi=
ve/html/bug-libtool/2013-09/msg00005.html" x-apple-data-detectors=3D"true" x=
-apple-data-detectors-type=3D"link" x-apple-data-detectors-result=3D"7">http=
://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html</a><o:p></o:=
p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><sp=
an style=3D"-webkit-text-size-adjust: auto; background-color: rgba(255, 255,=
 255, 0);">+<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0c=
m 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; background-=
color: rgba(255, 255, 255, 0);">+Signed-off-by: Hans Beckerus &lt;hans.becke=
rus at&nbsp;<a href=3D"http://gmail.com/" x-apple-data-detectors=3D"true" x-=
apple-data-detectors-type=3D"link" x-apple-data-detectors-result=3D"8">gmail=
.com</a>&gt;<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0c=
m 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; background-=
color: rgba(255, 255, 255, 0);">+---<o:p></o:p></span></p><p class=3D"MsoNor=
mal" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-a=
djust: auto; background-color: rgba(255, 255, 255, 0);">+diff -ur libtool-2.=
4.2.orig/libltdl/m4/libtool.m4 libtool-2.4.2/libltdl/m4/libtool.m4<o:p></o:p=
></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><spa=
n style=3D"-webkit-text-size-adjust: auto; background-color: rgba(255, 255, 2=
55, 0);">+--- libtool-2.4.2.orig/libltdl/m4/libtool.m4&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2013-09-05 10:37:24.690013000 +0200<o=
:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt=
; "><span style=3D"-webkit-text-size-adjust: auto; background-color: rgba(25=
5, 255, 255, 0);">++++ libtool-2.4.2/libltdl/m4/libtool.m4 2013-09-05 12:05:=
51.560281000 +0200<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"marg=
in: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; backg=
round-color: rgba(255, 255, 255, 0);">+@@ -1234,7 +1234,7 @@<o:p></o:p></spa=
n></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span styl=
e=3D"-webkit-text-size-adjust: auto; background-color: rgba(255, 255, 255, 0=
);">+ dnl in case the user passed a directory name.<o:p></o:p></span></p><p c=
lass=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webk=
it-text-size-adjust: auto; background-color: rgba(255, 255, 255, 0);">+ lt_s=
ysroot=3D<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0=
cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; background-col=
or: rgba(255, 255, 255, 0);">+ case ${with_libtool_sysroot} in #(<o:p></o:p>=
</span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span=
 style=3D"-webkit-text-size-adjust: auto; background-color: rgba(255, 255, 2=
55, 0);">+- yes)<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin=
: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; backgro=
und-color: rgba(255, 255, 255, 0);">++ no)<o:p></o:p></span></p><p class=3D"=
MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-=
size-adjust: auto; background-color: rgba(255, 255, 255, 0);">+&nbsp;&nbsp;&=
nbsp; if test "$GCC" =3D yes; then<o:p></o:p></span></p><p class=3D"MsoNorma=
l" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adj=
ust: auto; background-color: rgba(255, 255, 255, 0);">+&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; lt_sysroot=3D`$CC --print-sysroot 2&gt;/dev/null`<o:p></o:p></span=
></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=
=3D"-webkit-text-size-adjust: auto; background-color: rgba(255, 255, 255, 0)=
;">+&nbsp;&nbsp;&nbsp; fi<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D=
"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; b=
ackground-color: rgba(255, 255, 255, 0);">+@@ -1242,7 +1242,7 @@<o:p></o:p><=
/span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span s=
tyle=3D"-webkit-text-size-adjust: auto; background-color: rgba(255, 255, 255=
, 0);">+&nbsp; /*)<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"marg=
in: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; backg=
round-color: rgba(255, 255, 255, 0);">+&nbsp;&nbsp;&nbsp; lt_sysroot=3D`echo=
 "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`<o:p></o:p></span></p><=
p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-w=
ebkit-text-size-adjust: auto; background-color: rgba(255, 255, 255, 0);">+&n=
bsp;&nbsp;&nbsp; ;; #(<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"=
margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; b=
ackground-color: rgba(255, 255, 255, 0);">+- no|'')<o:p></o:p></span></p><p c=
lass=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webk=
it-text-size-adjust: auto; background-color: rgba(255, 255, 255, 0);">++ yes=
|'')<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.=
0001pt; "><span style=3D"-webkit-text-size-adjust: auto; background-color: r=
gba(255, 255, 255, 0);">+&nbsp;&nbsp;&nbsp; ;; #(<o:p></o:p></span></p><p cl=
ass=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webki=
t-text-size-adjust: auto; background-color: rgba(255, 255, 255, 0);">+&nbsp;=
 *)<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm 0.0=
001pt; "><span style=3D"-webkit-text-size-adjust: auto; background-color: rg=
ba(255, 255, 255, 0);">+&nbsp;&nbsp;&nbsp; AC_MSG_RESULT([${with_libtool_sys=
root}])<o:p></o:p></span></p><p class=3D"MsoNormal" style=3D"margin: 0cm 0cm=
 0.0001pt; "><span style=3D"-webkit-text-size-adjust: auto; background-color=
: rgba(255, 255, 255, 0);">--<o:p></o:p></span></p><p class=3D"MsoNormal" st=
yle=3D"margin: 0cm 0cm 0.0001pt; "><span style=3D"-webkit-text-size-adjust: a=
uto; background-color: rgba(255, 255, 255, 0);">1.8.3.3</span></p></body></h=
tml>=

--Apple-Mail-D6895395-3F18-4ED2-A1B4-6F876DFA564A--
