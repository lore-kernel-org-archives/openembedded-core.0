Return-Path: <pmi183@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E0BC25B75
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 09:47:28 +0000 (UTC)
Subject: Re: [PATCH] buildhistory: Fix do_package race issues
To: openembedded-core@lists.openembedded.org
From: pmi183@gmail.com
X-Originating-Location: Rinchoa, Lisbon, PT (78.137.195.161)
X-Originating-Platform: Windows Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 13 May 2024 02:47:19 -0700
References: <20211123135919.26315-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211123135919.26315-1-richard.purdie@linuxfoundation.org>
Message-ID: <25272.1715593639334797374@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="7CJUKpxGrMH2B0HFnJdI"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 09:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199226

--7CJUKpxGrMH2B0HFnJdI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

While using buildhistory, i faced an issue with files-in-package.txt missin=
g and digging into the logs i found out:

find: =E2=80=98/home/user/src/poky-master/build/tmp/work/core2-64-poky-linu=
x/base-passwd/3.6.3/packages-split/*=E2=80=99: No such file or directory

Calling `buildhistory_list_pkg_files`=C2=A0 from do_package seems to be acc=
essing the dir before being ready and fails.

Additionally, using `BUILDHISTORY_RESET` along with `BUILDHISTORY_PRESERVE`=
 looks to fail to preserve files since there is nothing to handle buildhist=
ory/old dir and ends up losing all files marked to preserve.

Thank you,
Pedro

----------------------------------------

meta/classes/buildhistory.bbclass | 29 ++++++++++++++++++++++++-----
1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index fd53e92402..4962c53cae 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -98,11 +98,6 @@ python buildhistory_emit_pkghistory() {
if not "package" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
return 0

- =C2=A0 =C2=A0if d.getVar('BB_CURRENTTASK') in ['package', 'package_setsce=
ne']:
- =C2=A0 =C2=A0 =C2=A0 =C2=A0# Create files-in-<package-name>.txt files con=
taining a list of files of each recipe's package
- =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec_func("buildhistory_list_pkg_file=
s", d)
- =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0
-
if not d.getVar('BB_CURRENTTASK') in ['packagedata', 'packagedata_setscene'=
]:
return 0

@@ -110,6 +105,7 @@ python buildhistory_emit_pkghistory() {
import json
import shlex
import errno
+ =C2=A0 =C2=A0import shutil

pkghistdir =3D d.getVar('BUILDHISTORY_DIR_PACKAGE')
oldpkghistdir =3D d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')
@@ -223,6 +219,20 @@ python buildhistory_emit_pkghistory() {
items.sort()
return ' '.join(items)

+ =C2=A0 =C2=A0def copypreservedoldpkgdatafiles(pkg, preserve):
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
@@ -250,6 +260,11 @@ python buildhistory_emit_pkghistory() {
if not os.path.exists(pkghistdir):
bb.utils.mkdirhier(pkghistdir)
else:
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0reset =3D d.getVar("BUILDHISTORY_RESET")
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if reset:
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for pkg in packagelist:
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0copypreservedoldpk=
gdatafiles(pkg, preserve)
+
# Remove files for packages that no longer exist
for item in os.listdir(pkghistdir):
if item not in preserve:
@@ -327,6 +342,10 @@ python buildhistory_emit_pkghistory() {

write_pkghistory(pkginfo, d)

+ =C2=A0 =C2=A0# Only executed when running task `packagedata`
+ =C2=A0 =C2=A0if d.getVar('BB_CURRENTTASK') =3D=3D 'packagedata':
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec_func("buildhistory_list_pkg_file=
s", d)
+
oe.qa.exit_if_errors(d)
}

--
2.34.1

--7CJUKpxGrMH2B0HFnJdI
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,<br /><br />While using buildhistory, i faced an issue with file=
s-in-package.txt missing and digging into the logs i found out:<br />
<p style=3D"margin: 0px;">&nbsp;</p>
<p><code>find: &lsquo;/home/user/src/poky-master/build/tmp/work/core2-64-po=
ky-linux/base-passwd/3.6.3/packages-split/*&rsquo;: No such file or directo=
ry</code></p>
Calling `buildhistory_list_pkg_files`&nbsp; from do_package seems to be acc=
essing the dir before being ready and fails.<br /><br />Additionally, using=
 `BUILDHISTORY_RESET` along with `BUILDHISTORY_PRESERVE` looks to fail to p=
reserve files since there is nothing to handle buildhistory/old dir and end=
s up losing all files marked to preserve.<br /><br />Thank you,<br />Pedro<=
br /><br />----------------------------------------<br /><br />&nbsp;meta/c=
lasses/buildhistory.bbclass | 29 ++++++++++++++++++++++++-----<br />&nbsp;1=
 file changed, 24 insertions(+), 5 deletions(-)<br /><br />diff --git a/met=
a/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass<br />ind=
ex fd53e92402..4962c53cae 100644<br />--- a/meta/classes/buildhistory.bbcla=
ss<br />+++ b/meta/classes/buildhistory.bbclass<br />@@ -98,11 +98,6 @@ pyt=
hon buildhistory_emit_pkghistory() {<br />&nbsp; &nbsp; &nbsp;if not "packa=
ge" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():<br />&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;return 0<br /><br />- &nbsp; &nbsp;if d.getVar('BB_CU=
RRENTTASK') in ['package', 'package_setscene']:<br />- &nbsp; &nbsp; &nbsp;=
 &nbsp;# Create files-in-&lt;package-name&gt;.txt files containing a list o=
f files of each recipe's package<br />- &nbsp; &nbsp; &nbsp; &nbsp;bb.build=
.exec_func("buildhistory_list_pkg_files", d)<br />- &nbsp; &nbsp; &nbsp; &n=
bsp;return 0<br />-<br />&nbsp; &nbsp; &nbsp;if not d.getVar('BB_CURRENTTAS=
K') in ['packagedata', 'packagedata_setscene']:<br />&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;return 0<br /><br />@@ -110,6 +105,7 @@ python buildhistory_emi=
t_pkghistory() {<br />&nbsp; &nbsp; &nbsp;import json<br />&nbsp; &nbsp; &n=
bsp;import shlex<br />&nbsp; &nbsp; &nbsp;import errno<br />+ &nbsp; &nbsp;=
import shutil<br /><br />&nbsp; &nbsp; &nbsp;pkghistdir =3D d.getVar('BUILD=
HISTORY_DIR_PACKAGE')<br />&nbsp; &nbsp; &nbsp;oldpkghistdir =3D d.getVar('=
BUILDHISTORY_OLD_DIR_PACKAGE')<br />@@ -223,6 +219,20 @@ python buildhistor=
y_emit_pkghistory() {<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;items.sort()<b=
r />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return ' '.join(items)<br /><br />+ &=
nbsp; &nbsp;def copypreservedoldpkgdatafiles(pkg, preserve):<br />+ &nbsp; =
&nbsp; &nbsp; &nbsp;if os.path.exists(os.path.join(oldpkghistdir, pkg)):<br=
 />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;listofobjs =3D os.listdir(os.=
path.join(oldpkghistdir, pkg))<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;for obj in listofobjs:<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;if obj not in preserve:<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;continue<br />+ &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;try:<br />+ &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bb.utils.mkdirhier(os.path.join(pk=
ghistdir, pkg))<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;shutil.copyfile(os.path.join(oldpkghistdir, pkg, obj), os.=
path.join(pkghistdir, pkg, obj))<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;except IOError as e:<br />+ &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bb.note("Unable to copy file. %s"=
 % e)<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;except =
EnvironmentError as e:<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;bb.note("Unable to copy file. %s" % e)<br />+<br />=
&nbsp; &nbsp; &nbsp;pn =3D d.getVar('PN')<br />&nbsp; &nbsp; &nbsp;pe =3D d=
.getVar('PE') or "0"<br />&nbsp; &nbsp; &nbsp;pv =3D d.getVar('PV')<br />@@=
 -250,6 +260,11 @@ python buildhistory_emit_pkghistory() {<br />&nbsp; &nbs=
p; &nbsp;if not os.path.exists(pkghistdir):<br />&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;bb.utils.mkdirhier(pkghistdir)<br />&nbsp; &nbsp; &nbsp;else:<br />=
+ &nbsp; &nbsp; &nbsp; &nbsp;reset =3D d.getVar("BUILDHISTORY_RESET")<br />=
+ &nbsp; &nbsp; &nbsp; &nbsp;if reset:<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;for pkg in packagelist:<br />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;copypreservedoldpkgdatafiles(pkg, preserve)<br />+<b=
r />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;# Remove files for packages that no l=
onger exist<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for item in os.listdir(p=
kghistdir):<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if item no=
t in preserve:<br />@@ -327,6 +342,10 @@ python buildhistory_emit_pkghistor=
y() {<br /><br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;write_pkghistory(pkginfo=
, d)<br /><br />+ &nbsp; &nbsp;# Only executed when running task `packageda=
ta`<br />+ &nbsp; &nbsp;if d.getVar('BB_CURRENTTASK') =3D=3D 'packagedata':=
<br />+ &nbsp; &nbsp; &nbsp; &nbsp;bb.build.exec_func("buildhistory_list_pk=
g_files", d)<br />+<br />&nbsp; &nbsp; &nbsp;oe.qa.exit_if_errors(d)<br />&=
nbsp;}<br /><br />--<br />2.34.1

--7CJUKpxGrMH2B0HFnJdI--

