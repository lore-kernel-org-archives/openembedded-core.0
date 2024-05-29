Return-Path: <pmi183@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB09C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 11:57:19 +0000 (UTC)
Subject: Re: [PATCH] buildhistory: Fix do_package race issues
To: openembedded-core@lists.openembedded.org
From: pmi183@gmail.com
X-Originating-Location: Vila Nova de Foz Coa, Guarda, PT (213.205.68.220)
X-Originating-Platform: Windows Chrome 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 29 May 2024 04:57:16 -0700
References: <CANNYZj92hE=tRTpYX9LB2FnbOZsJ6gSmtdJE3zqtop-Nhzzfrg@mail.gmail.com>
In-Reply-To: <CANNYZj92hE=tRTpYX9LB2FnbOZsJ6gSmtdJE3zqtop-Nhzzfrg@mail.gmail.com>
Message-ID: <26273.1716983836341504845@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="1ZWcBsmrbs9D9idSKwKa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 11:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200003

--1ZWcBsmrbs9D9idSKwKa
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Patch 1 - fixes race condition detected while executing functions registere=
d on `SSTATEPOSTINSTFUNCS`
---
meta/classes-global/sstate.bbclass | 3 ++-
1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 76a7b59636..9887169e4f 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -403,7 +403,6 @@ def sstate_installpkgdir(ss, d):
for state in ss['dirs']:
prepdir(state[1])
bb.utils.rename(sstateinst + state[0], state[1])
- =C2=A0 =C2=A0sstate_install(ss, d)

for plain in ss['plaindirs']:
workdir =3D d.getVar('WORKDIR')
@@ -416,6 +415,8 @@ def sstate_installpkgdir(ss, d):
prepdir(dest)
bb.utils.rename(src, dest)

+ =C2=A0 =C2=A0sstate_install(ss, d)
+
return True

python sstate_hardcode_path_unpack () {
--
2.25.1

Patch 2 - fixes `find` usage, avoiding hiding errors on the command executi=
on and creates buildhistory output folder if doesnt exist.
---
meta/classes/buildhistory.bbclass | 8 +++-----
1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index fd53e92402..59be4516b2 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -599,15 +599,13 @@ buildhistory_list_files_no_owners() {

buildhistory_list_pkg_files() {
# Create individual files-in-package for each recipe's package
- =C2=A0 =C2=A0 =C2=A0 for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type =
d); do
+ =C2=A0 =C2=A0pkgdirlist=3D$(find ${PKGDEST}/* -maxdepth 0 -type d)
+ =C2=A0 =C2=A0 =C2=A0 for pkgdir in $pkgdirlist; do
pkgname=3D$(basename $pkgdir)
outfolder=3D"${BUILDHISTORY_DIR_PACKAGE}/$pkgname"
outfile=3D"$outfolder/files-in-package.txt"
# Make sure the output folder exists so we can create the file
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -d $outfolder ] ;=
 then
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bbdebug 2 "Folder $outfolder does not exist, file $outfile not created"
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 continue
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $outfolder
buildhistory_list_files $pkgdir $outfile fakeroot
done
}
--
2.25.1

Patch 3 - fixes usage of 2 features combined, `BUILDHISTORY_PRESERVE` and `=
BUILDHISTORY_RESET`, restoring files to buildhistory main folder.
---
meta/classes/buildhistory.bbclass | 20 ++++++++++++++++++++
1 file changed, 20 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index 59be4516b2..c707f71657 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -110,6 +110,7 @@ python buildhistory_emit_pkghistory() {
import json
import shlex
import errno
+ =C2=A0 =C2=A0import shutil

pkghistdir =3D d.getVar('BUILDHISTORY_DIR_PACKAGE')
oldpkghistdir =3D d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')
@@ -223,6 +224,20 @@ python buildhistory_emit_pkghistory() {
items.sort()
return ' '.join(items)

+ =C2=A0 =C2=A0def preservebuildhistoryfiles(pkg, preserve):
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(os.path.join(oldpkghistdir, =
pkg)):
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0listofobjs =3D os.listdir(os.pat=
h.join(oldpkghistdir, pkg))
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for obj in listofobjs:
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if obj not in pres=
erve:
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cont=
inue
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.u=
tils.mkdirhier(os.path.join(pkghistdir, pkg))
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shut=
il.copyfile(os.path.join(oldpkghistdir, pkg, obj), os.path.join(pkghistdir,=
 pkg, obj))
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except IOError as =
e:
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.n=
ote("Unable to copy file. %s" % e)
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Environment=
Error as e:
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.n=
ote("Unable to copy file. %s" % e)
+
pn =3D d.getVar('PN')
pe =3D d.getVar('PE') or "0"
pv =3D d.getVar('PV')
@@ -250,6 +265,11 @@ python buildhistory_emit_pkghistory() {
if not os.path.exists(pkghistdir):
bb.utils.mkdirhier(pkghistdir)
else:
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0# Copy all files marked to preserve
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if d.getVar("BUILDHISTORY_RESET"):
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for pkg in packagelist:
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0preservebuildhisto=
ryfiles(pkg, preserve)
+
# Remove files for packages that no longer exist
for item in os.listdir(pkghistdir):
if item not in preserve:
--
2.25.1

Patch 4 - adds unit tests to validate files-in-package.txt generation and f=
eature combination from patch 3.
---
meta/lib/oeqa/selftest/cases/buildoptions.py | 26 ++++++++++++++++++++
1 file changed, 26 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/s=
elftest/cases/buildoptions.py
index 31dafaa9c5..e05bac7c6c 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -176,6 +176,32 @@ class BuildhistoryTests(BuildhistoryBase):
self.assertEqual(data['FILELIST'], '')
self.assertEqual(int(data['PKGSIZE']), 0)

+ =C2=A0 =C2=A0def test_files_in_package_txt_creation(self):
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0self.config_buildhistory()
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake('xcursor-transparent-theme -c cleansst=
ate')
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake('xcursor-transparent-theme')
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0history_dir =3D get_bb_var('BUILDHISTORY_DIR_P=
ACKAGE', 'xcursor-transparent-theme')
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(os.path.isdir(history_dir), 'b=
uildhistory dir was not created.')
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0subfolders =3D [ fobject.path for fobject in o=
s.scandir(history_dir) if fobject.is_dir() ]
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(len(subfolders), "No folders i=
nside package.")
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0for subpath in subfolders:
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(os.path.isfile(o=
s.path.join(subpath, 'files-in-package.txt')))
+
+ =C2=A0 =C2=A0def test_files_in_package_txt_reset_and_preserved(self):
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0self.config_buildhistory()
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0self.append_config("BUILDHISTORY_RESET =3D '1'=
")
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0self.append_config("BUILDHISTORY_PRESERVE:appe=
nd =3D ' files-in-package.txt'")
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake('xcursor-transparent-theme -c cleansst=
ate')
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake('xcursor-transparent-theme')
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.rmtree(get_bb_var('TMPDIR'))
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake('xcursor-transparent-theme')
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0history_dir =3D get_bb_var('BUILDHISTORY_DIR_P=
ACKAGE', 'xcursor-transparent-theme')
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(os.path.isdir(history_dir), 'b=
uildhistory dir was not created.')
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0subfolders =3D [ fobject.path for fobject in o=
s.scandir(history_dir) if fobject.is_dir() ]
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(len(subfolders), "No folders i=
nside package.")
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0for subpath in subfolders:
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertTrue(os.path.isfile(o=
s.path.join(subpath, 'files-in-package.txt')))
+
class ArchiverTest(OESelftestTestCase):
def test_arch_work_dir_and_export_source(self):
"""
--
2.25.1

--1ZWcBsmrbs9D9idSKwKa
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,<br /><br />Patch 1 - fixes race condition detected while executing=
 functions registered on `SSTATEPOSTINSTFUNCS`<br />---<br />&nbsp;meta/cla=
sses-global/sstate.bbclass | 3 ++-<br />&nbsp;1 file changed, 2 insertions(=
+), 1 deletion(-)<br /><br />diff --git a/meta/classes-global/sstate.bbclas=
s b/meta/classes-global/sstate.bbclass<br />index 76a7b59636..9887169e4f 10=
0644<br />--- a/meta/classes-global/sstate.bbclass<br />+++ b/meta/classes-=
global/sstate.bbclass<br />@@ -403,7 +403,6 @@ def sstate_installpkgdir(ss,=
 d):<br />&nbsp; &nbsp; &nbsp;for state in ss['dirs']:<br />&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;prepdir(state[1])<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;bb.utils.rename(sstateinst + state[0], state[1])<br />- &nbsp; &nbsp;sstat=
e_install(ss, d)<br /><br />&nbsp; &nbsp; &nbsp;for plain in ss['plaindirs'=
]:<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;workdir =3D d.getVar('WORKDIR')<b=
r />@@ -416,6 +415,8 @@ def sstate_installpkgdir(ss, d):<br />&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;prepdir(dest)<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;b=
b.utils.rename(src, dest)<br /><br />+ &nbsp; &nbsp;sstate_install(ss, d)<b=
r />+<br />&nbsp; &nbsp; &nbsp;return True<br /><br />&nbsp;python sstate_h=
ardcode_path_unpack () {<br />--<br />2.25.1<br /><br /><span style=3D"box-=
sizing: border-box; overflow-wrap: break-word !important; color: #222222; b=
ackground-color: #ffffff; font-style: normal; font-variant-ligatures: norma=
l; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orp=
hans: 2; text-align: start; text-indent: 0px; text-transform: none; widows:=
 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal;=
 text-decoration-thickness: initial; text-decoration-style: initial; text-d=
ecoration-color: initial; font-family: Arial, Helvetica, sans-serif; font-s=
ize: small;">Patch 2 - fixes `find` usage, avoiding hiding errors on the co=
mmand execution and creates buildhistory output folder if doesnt exist.</sp=
an><br />---<br />&nbsp;meta/classes/buildhistory.bbclass | 8 +++-----<br /=
>&nbsp;1 file changed, 3 insertions(+), 5 deletions(-)<br /><br />diff --gi=
t a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass<b=
r />index fd53e92402..59be4516b2 100644<br />--- a/meta/classes/buildhistor=
y.bbclass<br />+++ b/meta/classes/buildhistory.bbclass<br />@@ -599,15 +599=
,13 @@ buildhistory_list_files_no_owners() {<br /><br />&nbsp;buildhistory_=
list_pkg_files() {<br />&nbsp; &nbsp; &nbsp; &nbsp; # Create individual fil=
es-in-package for each recipe's package<br />- &nbsp; &nbsp; &nbsp; for pkg=
dir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do<br />+ &nbsp; &nbsp;pkg=
dirlist=3D$(find ${PKGDEST}/* -maxdepth 0 -type d)<br />+ &nbsp; &nbsp; &nb=
sp; for pkgdir in $pkgdirlist; do<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; pkgname=3D$(basename $pkgdir)<br />&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; outfolder=3D"${BUILDHISTORY_DIR_PACKAGE=
}/$pkgname"<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ou=
tfile=3D"$outfolder/files-in-package.txt"<br />&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; # Make sure the output folder exists so we can =
create the file<br />- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if =
[ ! -d $outfolder ] ; then<br />- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bbdebug 2 "Folder $outfolder does not e=
xist, file $outfile not created"<br />- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; continue<br />- &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; fi<br />+ &nbsp; &nbsp; &nbsp; &nbsp;mkdir =
-p $outfolder<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
buildhistory_list_files $pkgdir $outfile fakeroot<br />&nbsp; &nbsp; &nbsp;=
 &nbsp; done<br />&nbsp;}<br />--<br />2.25.1<br style=3D"box-sizing: borde=
r-box; overflow-wrap: break-word !important; color: #dee2e6; font-family: s=
ystem-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sa=
ns', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Sy=
mbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-varian=
t-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transf=
orm: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; wh=
ite-space: normal; background-color: #242526; text-decoration-thickness: in=
itial; text-decoration-style: initial; text-decoration-color: initial;" /><=
br /><span style=3D"box-sizing: border-box; overflow-wrap: break-word !impo=
rtant; color: #222222; background-color: #ffffff; font-style: normal; font-=
variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; let=
ter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-=
transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; white-space: normal; text-decoration-thickness: initial; text-decoratio=
n-style: initial; text-decoration-color: initial; font-family: Arial, Helve=
tica, sans-serif; font-size: small;">Patch 3 - fixes usage of 2 features co=
mbined, `BUILDHISTORY_PRESERVE` and `BUILDHISTORY_RESET`, restoring files t=
o buildhistory main folder.</span><br />---<br />&nbsp;meta/classes/buildhi=
story.bbclass | 20 ++++++++++++++++++++<br />&nbsp;1 file changed, 20 inser=
tions(+)<br /><br />diff --git a/meta/classes/buildhistory.bbclass b/meta/c=
lasses/buildhistory.bbclass<br />index 59be4516b2..c707f71657 100644<br />-=
-- a/meta/classes/buildhistory.bbclass<br />+++ b/meta/classes/buildhistory=
.bbclass<br />@@ -110,6 +110,7 @@ python buildhistory_emit_pkghistory() {<b=
r />&nbsp; &nbsp; &nbsp;import json<br />&nbsp; &nbsp; &nbsp;import shlex<b=
r />&nbsp; &nbsp; &nbsp;import errno<br />+ &nbsp; &nbsp;import shutil<br /=
><br />&nbsp; &nbsp; &nbsp;pkghistdir =3D d.getVar('BUILDHISTORY_DIR_PACKAG=
E')<br />&nbsp; &nbsp; &nbsp;oldpkghistdir =3D d.getVar('BUILDHISTORY_OLD_D=
IR_PACKAGE')<br />@@ -223,6 +224,20 @@ python buildhistory_emit_pkghistory(=
) {<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;items.sort()<br />&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;return ' '.join(items)<br /><br />+ &nbsp; &nbsp;def pr=
eservebuildhistoryfiles(pkg, preserve):<br />+ &nbsp; &nbsp; &nbsp; &nbsp;i=
f os.path.exists(os.path.join(oldpkghistdir, pkg)):<br />+ &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;listofobjs =3D os.listdir(os.path.join(oldpkghistd=
ir, pkg))<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for obj in listof=
objs:<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if obj =
not in preserve:<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;continue<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;try:<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;bb.utils.mkdirhier(os.path.join(pkghistdir, pkg))<br />=
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;shut=
il.copyfile(os.path.join(oldpkghistdir, pkg, obj), os.path.join(pkghistdir,=
 pkg, obj))<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;e=
xcept IOError as e:<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;bb.note("Unable to copy file. %s" % e)<br />+ &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;except EnvironmentError as e=
:<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;bb.note("Unable to copy file. %s" % e)<br />+<br />&nbsp; &nbsp; &nbsp;p=
n =3D d.getVar('PN')<br />&nbsp; &nbsp; &nbsp;pe =3D d.getVar('PE') or "0"<=
br />&nbsp; &nbsp; &nbsp;pv =3D d.getVar('PV')<br />@@ -250,6 +265,11 @@ py=
thon buildhistory_emit_pkghistory() {<br />&nbsp; &nbsp; &nbsp;if not os.pa=
th.exists(pkghistdir):<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bb.utils.mkdi=
rhier(pkghistdir)<br />&nbsp; &nbsp; &nbsp;else:<br />+ &nbsp; &nbsp; &nbsp=
; &nbsp;# Copy all files marked to preserve<br />+ &nbsp; &nbsp; &nbsp; &nb=
sp;if d.getVar("BUILDHISTORY_RESET"):<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;for pkg in packagelist:<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;preservebuildhistoryfiles(pkg, preserve)<br />+<br />=
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;# Remove files for packages that no longe=
r exist<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for item in os.listdir(pkghi=
stdir):<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if item not in=
 preserve:<br />--<br />2.25.1<br /><br /><span style=3D"box-sizing: border=
-box; overflow-wrap: break-word !important; color: #222222; background-colo=
r: #ffffff; font-style: normal; font-variant-ligatures: normal; font-varian=
t-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-=
align: start; text-indent: 0px; text-transform: none; widows: 2; word-spaci=
ng: 0px; -webkit-text-stroke-width: 0px; white-space: normal; text-decorati=
on-thickness: initial; text-decoration-style: initial; text-decoration-colo=
r: initial; font-family: Arial, Helvetica, sans-serif; font-size: small;">P=
atch 4 - adds unit tests to validate files-in-package.txt generation and fe=
ature combination from patch 3.</span><br style=3D"box-sizing: border-box; =
overflow-wrap: break-word !important; color: #dee2e6; font-family: system-u=
i, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Ar=
ial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', =
'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-ligat=
ures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: no=
ne; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spa=
ce: normal; background-color: #242526; text-decoration-thickness: initial; =
text-decoration-style: initial; text-decoration-color: initial;" />---<br /=
>&nbsp;meta/lib/oeqa/selftest/cases/buildoptions.py | 26 ++++++++++++++++++=
++<br />&nbsp;1 file changed, 26 insertions(+)<br /><br />diff --git a/meta=
/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/bui=
ldoptions.py<br />index 31dafaa9c5..e05bac7c6c 100644<br />--- a/meta/lib/o=
eqa/selftest/cases/buildoptions.py<br />+++ b/meta/lib/oeqa/selftest/cases/=
buildoptions.py<br />@@ -176,6 +176,32 @@ class BuildhistoryTests(Buildhist=
oryBase):<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.assertE=
qual(data['FILELIST'], '')<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.asse=
rtEqual(int(data['PKGSIZE']), 0)<br /><br />+ &nbsp; &nbsp;def test_files_i=
n_package_txt_creation(self):<br />+ &nbsp; &nbsp; &nbsp; &nbsp;self.config=
_buildhistory()<br />+ &nbsp; &nbsp; &nbsp; &nbsp;bitbake('xcursor-transpar=
ent-theme -c cleansstate')<br />+ &nbsp; &nbsp; &nbsp; &nbsp;bitbake('xcurs=
or-transparent-theme')<br />+ &nbsp; &nbsp; &nbsp; &nbsp;history_dir =3D ge=
t_bb_var('BUILDHISTORY_DIR_PACKAGE', 'xcursor-transparent-theme')<br />+ &n=
bsp; &nbsp; &nbsp; &nbsp;self.assertTrue(os.path.isdir(history_dir), 'build=
history dir was not created.')<br />+ &nbsp; &nbsp; &nbsp; &nbsp;subfolders=
 =3D [ fobject.path for fobject in os.scandir(history_dir) if fobject.is_di=
r() ]<br />+ &nbsp; &nbsp; &nbsp; &nbsp;self.assertTrue(len(subfolders), "N=
o folders inside package.")<br />+ &nbsp; &nbsp; &nbsp; &nbsp;for subpath i=
n subfolders:<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.assertTr=
ue(os.path.isfile(os.path.join(subpath, 'files-in-package.txt')))<br />+<br=
 />+ &nbsp; &nbsp;def test_files_in_package_txt_reset_and_preserved(self):<=
br />+ &nbsp; &nbsp; &nbsp; &nbsp;self.config_buildhistory()<br />+ &nbsp; =
&nbsp; &nbsp; &nbsp;self.append_config("BUILDHISTORY_RESET =3D '1'")<br />+=
 &nbsp; &nbsp; &nbsp; &nbsp;self.append_config("BUILDHISTORY_PRESERVE:appen=
d =3D ' files-in-package.txt'")<br />+ &nbsp; &nbsp; &nbsp; &nbsp;bitbake('=
xcursor-transparent-theme -c cleansstate')<br />+ &nbsp; &nbsp; &nbsp; &nbs=
p;bitbake('xcursor-transparent-theme')<br />+ &nbsp; &nbsp; &nbsp; &nbsp;sh=
util.rmtree(get_bb_var('TMPDIR'))<br />+ &nbsp; &nbsp; &nbsp; &nbsp;bitbake=
('xcursor-transparent-theme')<br />+ &nbsp; &nbsp; &nbsp; &nbsp;history_dir=
 =3D get_bb_var('BUILDHISTORY_DIR_PACKAGE', 'xcursor-transparent-theme')<br=
 />+ &nbsp; &nbsp; &nbsp; &nbsp;self.assertTrue(os.path.isdir(history_dir),=
 'buildhistory dir was not created.')<br />+ &nbsp; &nbsp; &nbsp; &nbsp;sub=
folders =3D [ fobject.path for fobject in os.scandir(history_dir) if fobjec=
t.is_dir() ]<br />+ &nbsp; &nbsp; &nbsp; &nbsp;self.assertTrue(len(subfolde=
rs), "No folders inside package.")<br />+ &nbsp; &nbsp; &nbsp; &nbsp;for su=
bpath in subfolders:<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.a=
ssertTrue(os.path.isfile(os.path.join(subpath, 'files-in-package.txt')))<br=
 />+<br />&nbsp;class ArchiverTest(OESelftestTestCase):<br />&nbsp; &nbsp; =
&nbsp;def test_arch_work_dir_and_export_source(self):<br />&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;"""<br />--<br />2.25.1<br />

--1ZWcBsmrbs9D9idSKwKa--

