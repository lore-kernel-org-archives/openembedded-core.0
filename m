Return-Path: <lw@hqv.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF4BC369A6
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 11:37:00 +0000 (UTC)
Subject: Re: python3: Allow to specify which pyc files to keep
To: openembedded-core@lists.openembedded.org
From: "Lukas Woodtli" <lw@hqv.ch>
X-Originating-Location: Zurich, CH (185.132.16.78)
X-Originating-Platform: Linux Firefox 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 10 Apr 2025 04:36:50 -0700
References: <CANNYZj9qgX5=4Jym0Uq2u5VJcZ89c-MRSU9oiTkUbBvNvfSFtQ@mail.gmail.com>
In-Reply-To: <CANNYZj9qgX5=4Jym0Uq2u5VJcZ89c-MRSU9oiTkUbBvNvfSFtQ@mail.gmail.com>
Message-ID: <13400.1744285010599994886@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="5qjtHgQtMZcQEAG7tt5l"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214651

--5qjtHgQtMZcQEAG7tt5l
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>=20
> Should we rather just package the higher level .pyc into their own
> packages?
>=20

But this would include 3 additional packages. One for each optimization lev=
el.
Embedded devices might have limited storage resources.
Therefore, it makes sense to just include the .pyc files with the necessary=
 optimization level to the image.
And not all of them.

Patch with (hopefully) proper formatting:

From d7159cd842fd2a10ba5aeff62877be2ebb2eab87 Mon Sep 17 00:00:00 2001
From: Lukas Woodtli <lukas.woodtli@husqvarnagroup.com>
Date: Mon, 7 Apr 2025 11:55:33 +0200
Subject: [PATCH] python3: Allow to specify which pyc files to keep

The pyc files for a specific optimization level can be kept and are
installed in the final image.

Signed-off-by: Lukas Woodtli <lukas.woodtli@husqvarnagroup.com>
---
.../recipes-devtools/python/python3_3.13.2.bb | 32 +++++++++++++++----
1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipes-=
devtools/python/python3_3.13.2.bb
index 7c36fd92ed..ac74432a2a 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.2.bb
@@ -217,6 +217,12 @@ do_install:append:class-native() {
mv ${D}/${bindir}/${PN}/python*config ${D}/${bindir}/
}

+# We want bytecode precompiled .py files (.pyc's) by default
+# but the user may set it on their own conf
+INCLUDE_PYCS ?=3D "1"
+
+PYCS_OPT_LEVEL ?=3D "0"
+
do_install:append() {
for c in ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py; do
python3 ${UNPACKDIR}/reformat_sysconfig.py $c
@@ -249,10 +255,25 @@ do_install:append() {
# so remove it too
rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.cpython*

- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# Remove the opt-1.pyc and opt-=
2.pyc files. They effectively waste space on embedded
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# style targets as they're only=
 used when python is called with the -O or -OO options
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# which is rare.
- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0find ${D} -name *opt-*.pyc -del=
ete
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if [ "${INCLUDE_PYCS}" -eq "1" =
]; then
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#=
 Remove only the .pyc files of unused optimization level.
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if [ "$=
{PYCS_OPT_LEVEL}" -eq "0" ]; then
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0# keep only unoptimized .pyc files
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0find ${D} -name *.opt-1.pyc -exec rm -f {} \;
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0find ${D} -name *.opt-2.pyc -exec rm -f {} \;
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0elif [ =
"${PYCS_OPT_LEVEL}" -eq "1" ]; then
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0# keep only .pyc files with optimization level 1
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0find ${D} -name *.pyc -and -not -name *.opt-1.pyc -exec r=
m -f {} \;
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0elif [ =
"${PYCS_OPT_LEVEL}" -eq "2" ]; then
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0# keep only .pyc files with optimization level 2
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0find ${D} -name *.pyc -and -not -name *.opt-2.pyc -exec r=
m -f {} \;
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0bberror "Python optimization level ${PYCS_OPT_LEVEL} is n=
ot supported"
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fi
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# remov=
e all .pyc files
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0find ${=
D} -name *.pyc -delete
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fi
}

do_install:append:class-nativesdk () {
@@ -326,9 +347,6 @@ py_package_preprocess () {
rm -rf ${PKGD}/${libdir}/python-sysconfigdata
}

-# We want bytecode precompiled .py files (.pyc's) by default
-# but the user may set it on their own conf
-INCLUDE_PYCS ?=3D "1"

python(){
import collections, json
--
2.43.0

--5qjtHgQtMZcQEAG7tt5l
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>&nbsp;</div>
<blockquote>
<div>Should we rather just package the higher level .pyc into their own pac=
kages?</div>
</blockquote>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>But this would include 3 additional packages. One for each optimizatio=
n level.</div>
<div>Embedded devices might have limited storage resources.</div>
<div>Therefore, it makes sense to just include the .pyc files with the nece=
ssary optimization level to the image.</div>
<div>And not all of them.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Patch with (hopefully) proper formatting:</div>
<div>&nbsp;</div>
<div><span style=3D"font-family: monospace;"><span style=3D"color: #000000;=
 background-color: #ffffff;">From d7159cd842fd2a10ba5aeff62877be2ebb2eab87 =
Mon Sep 17 00:00:00 2001 </span><br />From: Lukas Woodtli &lt;lukas.woodtli=
@husqvarnagroup.com&gt; <br />Date: Mon, 7 Apr 2025 11:55:33 +0200 <br />Su=
bject: [PATCH] python3: Allow to specify which pyc files to keep <br /><br =
/>The pyc files for a specific optimization level can be kept and are <br /=
>installed in the final image. <br /><br />Signed-off-by: Lukas Woodtli &lt=
;lukas.woodtli@husqvarnagroup.com&gt; <br />--- <br />.../recipes-devtools/=
python/python3_3.13.2.bb | 32 +++++++++++++++---- <br />1 file changed, 25 =
insertions(+), 7 deletions(-) <br /><br />diff --git a/meta/recipes-devtool=
s/python/python3_3.13.2.bb b/meta/recipes-devtools/python/python3_3.13.2.bb=
 <br />index 7c36fd92ed..ac74432a2a 100644 <br />--- a/meta/recipes-devtool=
s/python/python3_3.13.2.bb <br />+++ b/meta/recipes-devtools/python/python3=
_3.13.2.bb <br />@@ -217,6 +217,12 @@ do_install:append:class-native() { <b=
r />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mv ${D}/${bindir}/${PN}=
/python*config ${D}/${bindir}/ <br />} <br />&nbsp;<br />+# We want bytecod=
e precompiled .py files (.pyc's) by default <br />+# but the user may set i=
t on their own conf <br />+INCLUDE_PYCS ?=3D "1" <br />+ <br />+PYCS_OPT_LE=
VEL ?=3D "0" <br />+ <br />do_install:append() { <br />&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;for c in ${D}/${libdir}/python${PYTHON_MAJMIN}/=
_sysconfigdata*.py; do <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;python3 ${UNPACKDIR}/reformat_sysconfig.py $c <br=
 />@@ -249,10 +255,25 @@ do_install:append() { <br />&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;# so remove it too <br />&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycach=
e__/traceback.cpython* <br />&nbsp;<br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;# Remove the opt-1.pyc and opt-2.pyc files. They effectively wast=
e space on embedded <br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# sty=
le targets as they're only used when python is called with the -O or -OO op=
tions <br />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# which is rare. <b=
r />- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;find ${D} -name *opt-*.pyc =
-delete <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if [ "${INCLUDE_P=
YCS}" -eq "1" ]; then <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;# Remove only the .pyc files of unused optimizat=
ion level. <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;if [ "${PYCS_OPT_LEVEL}" -eq "0" ]; then <br />+ &nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#=
 keep only unoptimized .pyc files <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;find ${D} -name *.=
opt-1.pyc -exec rm -f {} \; <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;find ${D} -name *.opt-2.=
pyc -exec rm -f {} \; <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;elif [ "${PYCS_OPT_LEVEL}" -eq "1" ]; then <br />+ &nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;# keep only .pyc files with optimization level 1 <br />+ &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;find ${D} -name *.pyc -and -not -name *.opt-1.pyc -exec rm -f {} \=
; <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;elif [ "${PYCS_OPT_LEVEL}" -eq "2" ]; then <br />+ &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# keep o=
nly .pyc files with optimization level 2 <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;find ${D} -=
name *.pyc -and -not -name *.opt-2.pyc -exec rm -f {} \; <br />+ &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else <br />+ &nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;bberror "Python optimization level ${PYCS_OPT_LEVEL} is not suppor=
ted" <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;fi <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else <br />+ &nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# remove all .=
pyc files <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;find ${D} -name *.pyc -delete <br />+ &nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;fi <br />} <br />&nbsp;<br />do_install:append:class-nativesd=
k () { <br />@@ -326,9 +347,6 @@ py_package_preprocess () { <br />&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rm -rf ${PKGD}/${libdir}/python-sysc=
onfigdata <br />} <br />&nbsp;<br />-# We want bytecode precompiled .py fil=
es (.pyc's) by default <br />-# but the user may set it on their own conf <=
br />-INCLUDE_PYCS ?=3D "1" <br />&nbsp;<br />python(){ <br />&nbsp;&nbsp;&=
nbsp;&nbsp;import collections, json <br />-- &nbsp;<br />2.43.0<br /><br />=
</span></div>

--5qjtHgQtMZcQEAG7tt5l--

