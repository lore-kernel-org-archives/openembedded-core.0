Return-Path: <eric.meyers15310@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF782C3ABBE
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 20:56:48 +0000 (UTC)
Subject: [oe] glib-2.0 Introspection Data Question   #poky
To: openembedded-core@lists.openembedded.org
From: "Eric Meyers" <eric.meyers15310@gmail.com>
X-Originating-Location: Lincolnwood, Illinois, US (73.168.239.54)
X-Originating-Platform: Windows Chrome 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 06 May 2025 13:56:40 -0700
Message-ID: <Rr0o.1746565000533076699.rvHw@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="REKuAZ1ttJ2rkXW3XEtW"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 20:56:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216083

--REKuAZ1ttJ2rkXW3XEtW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Was wondering if someone can help me with an issue I'm seeing with my workf=
low after upgrading to styhead/master on poky - specifically related to gob=
ject-introspection data for the GLib-2.0 recipe. In particular, I see that =
the gobject-introspection/glib recipes were updated in this patch/mailing l=
ist discussion:

https://lists.openembedded.org/g/openembedded-core/topic/105860089

But it is unclear to me if this patch still supports producing native GLib-=
2.0/Gio/GObject .typelib files in a recipe's sysroot?

It looks suspect to me that the PACKAGECONFIG for the native class is wiped=
 in this line:

https://github.com/yoctoproject/poky/blob/master/meta/recipes-core/glib-2.0=
/glib.inc#L40

Which would lead me to believe that glib-2.0-native does not produce any .t=
ypelib files?

However, when digging, I noticed that the missing .typelib file existed in =
the gobject-introspection-native build directory, but was just not being sh=
ipped to the sysroot-destdir. I needed to add the following do_install:appe=
nd to gobject-introspection_%.bbappend:

do_install:append:class-native() {
cp -f ${B}/gir/GLib-2.0.typelib ${D}${RECIPE_SYSROOT_NATIVE}/usr/lib/girepo=
sitory-1.0/GLib-2.0.typelib
cp -f ${B}/gir/GObject-2.0.typelib ${D}${RECIPE_SYSROOT_NATIVE}/usr/lib/gir=
epository-1.0/GObject-2.0.typelib
cp -f ${B}/gir/Gio-2.0.typelib ${D}${RECIPE_SYSROOT_NATIVE}/usr/lib/girepos=
itory-1.0/Gio-2.0.typelib
}

(OR this patch will also accomplish similar behavior):

gobject-introspection_%.bbappend:

SRC_URI:append:class-native =3D " ${@bb.utils.contains('GI_DATA_ENABLED', '=
True', 'file://0001-Install-typelib-files-if-native-build.patch', '', d)}"

0001-Install-typelib-files-if-native-build.patch:
+---
+ gir/meson.build | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gir/meson.build b/gir/meson.build
+index e5a7a13..e8100fd 100644
+--- a/gir/meson.build
++++ b/gir/meson.build
+@@ -541,6 +541,8 @@ foreach gir: uninstalled_gir_files
+ =C2=A0 =C2=A0 output: '@BASENAME@.typelib',
+ =C2=A0 =C2=A0 depends: [gobject_gir, gircompiler, ],
+ =C2=A0 =C2=A0 command: gircompiler_command,
++ =C2=A0 =C2=A0install: true,
++ =C2=A0 =C2=A0install_dir: typelibdir,
+ =C2=A0 )
+ endforeach

I'm hesitant to submit either patch due to the fear that I'm (1) missing so=
mething/not understanding something right and (2) doing something completel=
y wrong.

I've verified that GI_DATA_ENABLED is set to True on my system, according t=
o this page:

https://docs.yoctoproject.org/dev/dev-manual/gobject-introspection.html

And I've tried to remove the PACKAGECONFIG:class-native =3D "" line in glib=
.inc without any luck - this just introduces a bunch of circular dependenci=
es.

For context, we are running with a workflow that executes python unit tests=
 on the native host environment and these *.typelib files are required for =
certain functionality.

Ideally, we would migrate to ptest which would probably solve this issue, b=
ut this unfortunately isn't an option at the time for us due to the integra=
tion effort it would require.

Any help is appreciated in advance.

Thanks!

--REKuAZ1ttJ2rkXW3XEtW
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Was wondering if someone can help me with an issue I'm seeing with my =
workflow after upgrading to styhead/master on poky - specifically related t=
o gobject-introspection data for the GLib-2.0 recipe. In particular, I see =
that the gobject-introspection/glib recipes were updated in this patch/mail=
ing list discussion:&nbsp;</div>
<div>&nbsp;</div>
<div style=3D"padding-left: 40px;"><a href=3D"https://lists.openembedded.or=
g/g/openembedded-core/topic/105860089" target=3D"_blank" rel=3D"noopener">h=
ttps://lists.openembedded.org/g/openembedded-core/topic/105860089</a></div>
<div>&nbsp;</div>
<div>But it is unclear to me if this patch still supports producing <em>nat=
ive</em> GLib-2.0/Gio/GObject .typelib files in a recipe's sysroot?</div>
<div>&nbsp;</div>
<div>It looks suspect to me that the PACKAGECONFIG for the native class is =
wiped in this line:&nbsp;</div>
<div>&nbsp;</div>
<div style=3D"padding-left: 40px;"><a href=3D"https://github.com/yoctoproje=
ct/poky/blob/master/meta/recipes-core/glib-2.0/glib.inc#L40" target=3D"_bla=
nk" rel=3D"noopener">https://github.com/yoctoproject/poky/blob/master/meta/=
recipes-core/glib-2.0/glib.inc#L40</a></div>
<div>&nbsp;</div>
<div>Which would lead me to believe that glib-2.0-native does not produce a=
ny .typelib files?</div>
<div>&nbsp;</div>
<div>However, when digging, I noticed that the missing .typelib file existe=
d in the gobject-introspection-native build directory, but was just not bei=
ng shipped to the sysroot-destdir. I needed to add the following do_install=
:append to gobject-introspection_%.bbappend:&nbsp;</div>
<div>&nbsp;</div>
<div>do_install:append:class-native() {<br />&nbsp; &nbsp; &nbsp; &nbsp; cp=
 -f ${B}/gir/GLib-2.0.typelib ${D}${RECIPE_SYSROOT_NATIVE}/usr/lib/gireposi=
tory-1.0/GLib-2.0.typelib<br />&nbsp; &nbsp; &nbsp; &nbsp; cp -f ${B}/gir/G=
Object-2.0.typelib ${D}${RECIPE_SYSROOT_NATIVE}/usr/lib/girepository-1.0/GO=
bject-2.0.typelib<br />&nbsp; &nbsp; &nbsp; &nbsp; cp -f ${B}/gir/Gio-2.0.t=
ypelib ${D}${RECIPE_SYSROOT_NATIVE}/usr/lib/girepository-1.0/Gio-2.0.typeli=
b<br />}&nbsp;</div>
<div>&nbsp;</div>
<div><em>(OR this patch will also accomplish similar behavior):&nbsp;</em><=
/div>
<div>&nbsp;</div>
<div>gobject-introspection_%.bbappend:&nbsp;</div>
<div>&nbsp;</div>
<div>SRC_URI:append:class-native =3D " ${@bb.utils.contains('GI_DATA_ENABLE=
D', 'True', 'file://0001-Install-typelib-files-if-native-build.patch', '', =
d)}"</div>
<div>&nbsp;</div>
<div>0001-Install-typelib-files-if-native-build.patch:<br />+---<br />+ gir=
/meson.build | 2 ++<br />+ 1 file changed, 2 insertions(+)<br />+<br />+dif=
f --git a/gir/meson.build b/gir/meson.build<br />+index e5a7a13..e8100fd 10=
0644<br />+--- a/gir/meson.build<br />++++ b/gir/meson.build<br />+@@ -541,=
6 +541,8 @@ foreach gir: uninstalled_gir_files<br />+ &nbsp; &nbsp; output:=
 '@BASENAME@.typelib',<br />+ &nbsp; &nbsp; depends: [gobject_gir, gircompi=
ler, ],<br />+ &nbsp; &nbsp; command: gircompiler_command,<br />++ &nbsp; &=
nbsp;install: true,<br />++ &nbsp; &nbsp;install_dir: typelibdir,<br />+ &n=
bsp; )<br />+ endforeach</div>
<div>&nbsp;</div>
<div>I'm hesitant to submit either patch due to the fear that I'm (1) missi=
ng something/not understanding something right and (2) doing something comp=
letely wrong.&nbsp;</div>
<div>&nbsp;</div>
<div>I've verified that GI_DATA_ENABLED is set to True on my system, accord=
ing to this page:&nbsp;</div>
<div>&nbsp;</div>
<div style=3D"padding-left: 40px;"><a href=3D"https://docs.yoctoproject.org=
/dev/dev-manual/gobject-introspection.html" target=3D"_blank" rel=3D"noopen=
er">https://docs.yoctoproject.org/dev/dev-manual/gobject-introspection.html=
</a></div>
<div style=3D"padding-left: 40px;">&nbsp;</div>
<div>And I've tried to remove the PACKAGECONFIG:class-native =3D "" line in=
 glib.inc without any luck - this just introduces a bunch of circular depen=
dencies.&nbsp;&nbsp;</div>
<div>&nbsp;</div>
<div>For context, we are running with a workflow that executes python unit =
tests on the native host environment and these *.typelib files are required=
 for certain functionality.</div>
<div>&nbsp;</div>
<div>Ideally, we would migrate to ptest which would probably solve this iss=
ue, but this unfortunately isn't an option at the time for us due to the in=
tegration effort it would require.&nbsp;</div>
<div>&nbsp;</div>
<div>Any help is appreciated in advance.</div>
<div>&nbsp;</div>
<div>Thanks!</div>
</div>

--REKuAZ1ttJ2rkXW3XEtW--

