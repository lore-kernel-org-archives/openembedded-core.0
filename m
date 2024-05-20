Return-Path: <pmi183@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26EE3C04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 08:10:24 +0000 (UTC)
Subject: Re: [PATCH] buildhistory: Fix do_package race issues
To: openembedded-core@lists.openembedded.org
From: pmi183@gmail.com
X-Originating-Location: Rio Tinto, Porto, PT (37.189.18.123)
X-Originating-Platform: Windows Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 20 May 2024 01:10:19 -0700
References: <CANNYZj941KS_ULo9iwpyYCKmvpHRur-4djy0AD=bjUvjnwW1XA@mail.gmail.com>
In-Reply-To: <CANNYZj941KS_ULo9iwpyYCKmvpHRur-4djy0AD=bjUvjnwW1XA@mail.gmail.com>
Message-ID: <17234.1716192619114804009@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="XJI2whicTIdjkT4FCaxK"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 08:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199555

--XJI2whicTIdjkT4FCaxK
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

I made some debug in the flow and i saw a timing issue and since there's no=
 reason to generate files-in-package.txt before sstate-cache operations i m=
oved the call to the postfunc of sstate:

---
meta/classes-global/sstate.bbclass | =C2=A05 +++++
meta/classes/buildhistory.bbclass =C2=A0| 18 +++++++++++++++---
meta/lib/oe/packagedata.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02 +-
3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 76a7b59636..7e3c3e3c4f 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -104,6 +104,7 @@ SSTATEPOSTCREATEFUNCS =3D ""
SSTATEPREINSTFUNCS =3D ""
SSTATEPOSTUNPACKFUNCS =3D "sstate_hardcode_path_unpack"
SSTATEPOSTINSTFUNCS =3D ""
+SSTATEPOSTFUNCS =3D ""
EXTRA_STAGING_FIXMES ?=3D "HOSTTOOLS_DIR"

# Check whether sstate exists for tasks that support sstate and are in the
@@ -805,6 +806,10 @@ python sstate_task_postfunc () {
sstate_installpkgdir(shared_state, d)

bb.utils.remove(d.getVar("SSTATE_BUILDDIR"), recurse=3DTrue)
+
+ =C2=A0 =C2=A0for postfunc in (d.getVar('SSTATEPOSTFUNCS') or '').split():
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0# All hooks should run in the SSTATE_INSTDIR
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec_func(postfunc, d, (sstateinst,))
}
sstate_task_postfunc[dirs] =3D "${WORKDIR}"

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index fd53e92402..054c213bf5 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -58,6 +58,9 @@ SSTATEPOSTUNPACKFUNCS:append =3D " buildhistory_emit_outp=
utsigs"
sstate_installpkgdir[vardepsexclude] +=3D "buildhistory_emit_outputsigs"
SSTATEPOSTUNPACKFUNCS[vardepvalueexclude] .=3D "| buildhistory_emit_outputs=
igs"

+SSTATEPOSTFUNCS:append =3D " buildhistory_emit_filesinpackage"
+SSTATEPOSTFUNCS[vardepvalueexclude] .=3D "| buildhistory_emit_filesinpacka=
ge"
+
# All items excepts those listed here will be removed from a recipe's
# build history directory by buildhistory_emit_pkghistory(). This is
# necessary because some of these items (package directories, files that
@@ -87,6 +90,16 @@ buildhistory_emit_sysroot() {
buildhistory_list_files_no_owners $BASE ${BUILDHISTORY_DIR_PACKAGE}/sysroot
}

+#
+# Write out files-in-package for this package
+#
+python buildhistory_emit_filesinpackage() {
+ =C2=A0 =C2=A0if d.getVar('BB_CURRENTTASK') in ['package', 'package_setsce=
ne']:
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0# Create files-in-<package-name>.txt files con=
taining a list of files of each recipe's package
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec_func("buildhistory_list_pkg_file=
s", d)
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0
+}
+
#
# Write out metadata about this package for comparison when writing future =
packages
#
@@ -99,8 +112,6 @@ python buildhistory_emit_pkghistory() {
return 0

if d.getVar('BB_CURRENTTASK') in ['package', 'package_setscene']:
- =C2=A0 =C2=A0 =C2=A0 =C2=A0# Create files-in-<package-name>.txt files con=
taining a list of files of each recipe's package
- =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec_func("buildhistory_list_pkg_file=
s", d)
return 0

if not d.getVar('BB_CURRENTTASK') in ['packagedata', 'packagedata_setscene'=
]:
@@ -599,7 +610,8 @@ buildhistory_list_files_no_owners() {

buildhistory_list_pkg_files() {
# Create individual files-in-package for each recipe's package
- =C2=A0 =C2=A0 =C2=A0 for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type =
d); do
+ =C2=A0 =C2=A0pkgdirlist=3D$(find ${PKGDEST}/* -maxdepth 0 -type d)
+ =C2=A0 =C2=A0 =C2=A0 for pkgdir in ${pkgdirlist}; do
pkgname=3D$(basename $pkgdir)
outfolder=3D"${BUILDHISTORY_DIR_PACKAGE}/$pkgname"
outfile=3D"$outfolder/files-in-package.txt"
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 2d1d6ddeb7..e8c503b43b 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -309,7 +309,7 @@ fi
subdata_file =3D pkgdatadir + "/runtime/%s" % pkg
with open(subdata_file, 'w') as sf:
for var in (d.getVar('PKGDATA_VARS') or "").split():
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D write_if_e=
xists(sf, pkg, var)
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_if_exists(sf=
, pkg, var)

write_if_exists(sf, pkg, 'FILERPROVIDESFLIST')
for dfile in sorted((d.getVar('FILERPROVIDESFLIST:' + pkg) or "").split()):
--
2.34.1

--XJI2whicTIdjkT4FCaxK
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,<br /><br />I made some debug in the flow and i saw a timing issue =
and since there's no reason to generate files-in-package.txt before sstate-=
cache operations i moved the call to the postfunc of sstate:<br /><br />---=
<br />&nbsp;meta/classes-global/sstate.bbclass | &nbsp;5 +++++<br />&nbsp;m=
eta/classes/buildhistory.bbclass &nbsp;| 18 +++++++++++++++---<br />&nbsp;m=
eta/lib/oe/packagedata.py &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;2 +-<br />&nb=
sp;3 files changed, 21 insertions(+), 4 deletions(-)<br /><br />diff --git =
a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass<b=
r />index 76a7b59636..7e3c3e3c4f 100644<br />--- a/meta/classes-global/ssta=
te.bbclass<br />+++ b/meta/classes-global/sstate.bbclass<br />@@ -104,6 +10=
4,7 @@ SSTATEPOSTCREATEFUNCS =3D ""<br />&nbsp;SSTATEPREINSTFUNCS =3D ""<br=
 />&nbsp;SSTATEPOSTUNPACKFUNCS =3D "sstate_hardcode_path_unpack"<br />&nbsp=
;SSTATEPOSTINSTFUNCS =3D ""<br />+SSTATEPOSTFUNCS =3D ""<br />&nbsp;EXTRA_S=
TAGING_FIXMES ?=3D "HOSTTOOLS_DIR"<br /><br />&nbsp;# Check whether sstate =
exists for tasks that support sstate and are in the<br />@@ -805,6 +806,10 =
@@ python sstate_task_postfunc () {<br />&nbsp; &nbsp; &nbsp;sstate_install=
pkgdir(shared_state, d)<br /><br />&nbsp; &nbsp; &nbsp;bb.utils.remove(d.ge=
tVar("SSTATE_BUILDDIR"), recurse=3DTrue)<br />+<br />+ &nbsp; &nbsp;for pos=
tfunc in (d.getVar('SSTATEPOSTFUNCS') or '').split():<br />+ &nbsp; &nbsp; =
&nbsp; &nbsp;# All hooks should run in the SSTATE_INSTDIR<br />+ &nbsp; &nb=
sp; &nbsp; &nbsp;bb.build.exec_func(postfunc, d, (sstateinst,))<br />&nbsp;=
}<br />&nbsp;sstate_task_postfunc[dirs] =3D "${WORKDIR}"<br /><br />diff --=
git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass=
<br />index fd53e92402..054c213bf5 100644<br />--- a/meta/classes/buildhist=
ory.bbclass<br />+++ b/meta/classes/buildhistory.bbclass<br />@@ -58,6 +58,=
9 @@ SSTATEPOSTUNPACKFUNCS:append =3D " buildhistory_emit_outputsigs"<br />=
&nbsp;sstate_installpkgdir[vardepsexclude] +=3D "buildhistory_emit_outputsi=
gs"<br />&nbsp;SSTATEPOSTUNPACKFUNCS[vardepvalueexclude] .=3D "| buildhisto=
ry_emit_outputsigs"<br /><br />+SSTATEPOSTFUNCS:append =3D " buildhistory_e=
mit_filesinpackage"<br />+SSTATEPOSTFUNCS[vardepvalueexclude] .=3D "| build=
history_emit_filesinpackage"<br />+<br />&nbsp;# All items excepts those li=
sted here will be removed from a recipe's<br />&nbsp;# build history direct=
ory by buildhistory_emit_pkghistory(). This is<br />&nbsp;# necessary becau=
se some of these items (package directories, files that<br />@@ -87,6 +90,1=
6 @@ buildhistory_emit_sysroot() {<br />&nbsp; &nbsp; &nbsp; &nbsp; buildhi=
story_list_files_no_owners $BASE ${BUILDHISTORY_DIR_PACKAGE}/sysroot<br />&=
nbsp;}<br /><br />+#<br />+# Write out files-in-package for this package<br=
 />+#<br />+python buildhistory_emit_filesinpackage() {<br />+ &nbsp; &nbsp=
;if d.getVar('BB_CURRENTTASK') in ['package', 'package_setscene']:<br />+ &=
nbsp; &nbsp; &nbsp; &nbsp;# Create files-in-&lt;package-name&gt;.txt files =
containing a list of files of each recipe's package<br />+ &nbsp; &nbsp; &n=
bsp; &nbsp;bb.build.exec_func("buildhistory_list_pkg_files", d)<br />+ &nbs=
p; &nbsp; &nbsp; &nbsp;return 0<br />+}<br />+<br />&nbsp;#<br />&nbsp;# Wr=
ite out metadata about this package for comparison when writing future pack=
ages<br />&nbsp;#<br />@@ -99,8 +112,6 @@ python buildhistory_emit_pkghisto=
ry() {<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0<br /><br />&nbsp; &n=
bsp; &nbsp;if d.getVar('BB_CURRENTTASK') in ['package', 'package_setscene']=
:<br />- &nbsp; &nbsp; &nbsp; &nbsp;# Create files-in-&lt;package-name&gt;.=
txt files containing a list of files of each recipe's package<br />- &nbsp;=
 &nbsp; &nbsp; &nbsp;bb.build.exec_func("buildhistory_list_pkg_files", d)<b=
r />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0<br /><br />&nbsp; &nbsp; &nb=
sp;if not d.getVar('BB_CURRENTTASK') in ['packagedata', 'packagedata_setsce=
ne']:<br />@@ -599,7 +610,8 @@ buildhistory_list_files_no_owners() {<br /><=
br />&nbsp;buildhistory_list_pkg_files() {<br />&nbsp; &nbsp; &nbsp; &nbsp;=
 # Create individual files-in-package for each recipe's package<br />- &nbs=
p; &nbsp; &nbsp; for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do=
<br />+ &nbsp; &nbsp;pkgdirlist=3D$(find ${PKGDEST}/* -maxdepth 0 -type d)<=
br />+ &nbsp; &nbsp; &nbsp; for pkgdir in ${pkgdirlist}; do<br />&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pkgname=3D$(basename $pkgdir)=
<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; outfolder=3D"=
${BUILDHISTORY_DIR_PACKAGE}/$pkgname"<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; outfile=3D"$outfolder/files-in-package.txt"<br />di=
ff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py<br />ind=
ex 2d1d6ddeb7..e8c503b43b 100644<br />--- a/meta/lib/oe/packagedata.py<br /=
>+++ b/meta/lib/oe/packagedata.py<br />@@ -309,7 +309,7 @@ fi<br />&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;subdata_file =3D pkgdatadir + "/runtime/%s" % pkg=
<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;with open(subdata_file, 'w') as sf:=
<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for var in (d.getVar(=
'PKGDATA_VARS') or "").split():<br />- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;val =3D write_if_exists(sf, pkg, var)<br />+ &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_if_exists(sf, pkg, var)<b=
r /><br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_if_exists(s=
f, pkg, 'FILERPROVIDESFLIST')<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;for dfile in sorted((d.getVar('FILERPROVIDESFLIST:' + pkg) or "").s=
plit()):<br />--<br />2.34.1

--XJI2whicTIdjkT4FCaxK--

