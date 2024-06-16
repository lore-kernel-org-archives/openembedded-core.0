Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2761FC27C6E
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 04:26:55 +0000 (UTC)
Subject: Re: [PATCH v4 2/2] image-bootfiles.bbclass: new class, copy boot files to root filesystem
To: openembedded-core@lists.openembedded.org
From: "Konrad Weihmann" <kweihmann@outlook.com>
X-Originating-Location: Berlin, Land Berlin, DE (89.12.182.18)
X-Originating-Platform: Linux Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 15 Jun 2024 21:26:49 -0700
References: <20240530095314.407638-3-marcus.folkesson@gmail.com>
In-Reply-To: <20240530095314.407638-3-marcus.folkesson@gmail.com>
Message-ID: <20106.1718512009844562919@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="VLRZVXlNL9C7H4mMTSOA"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 04:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200772

--VLRZVXlNL9C7H4mMTSOA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Looking at the combination of the patches and the following

+ boot_files =3D d.getVar("IMAGE_BOOT_FILES")
+ if boot_files is None:
+ return
+
+ install_files =3D get_boot_files(deploy_image_dir, boot_files)
+ if install_files is None:
+ bb.warn("Could not find any boot files to install even though IMAGE_BOOT_=
FILES is not empty")
+ return

get_boot_files only returns None if boot_files is None, which is caught alr=
eady earlier on here, so the bb.warn clause likely will not be reached

Personally a check like `if install_files:` would make more sense

IMAGE_PREPROCESS_COMMAND +=3D "bootfiles_populate;"

I'm not sure if that wouldn't raise issues if any of the packages would ins=
tall a file by the same path/name as also set here.

In my opinion moving it to a POSTPROCESS function with some checks that it =
won't overwrite any files/folders might be the better option

--VLRZVXlNL9C7H4mMTSOA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Robot=
o, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Ap=
ple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; =
font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; display: inline !important; f=
loat: none;">Looking at the combination of the patches and the following</s=
pan></p>
<p>&nbsp;</p>
<p><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Robot=
o, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Ap=
ple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; =
font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; display: inline !important; f=
loat: none;">+ boot_files =3D d.getVar("IMAGE_BOOT_FILES")</span><br style=
=3D"box-sizing: border-box; overflow-wrap: break-word !important; color: #3=
33333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto =
Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI=
 Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style=
: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-ind=
ent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; white-space: pre-wrap; background-color: #ffffff; text-d=
ecoration-thickness: initial; text-decoration-style: initial; text-decorati=
on-color: initial;" /><span style=3D"color: #333333; font-family: system-ui=
, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Ari=
al, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', '=
Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-ligatu=
res: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: n=
ormal; orphans: 2; text-align: start; text-indent: 0px; text-transform: non=
e; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spac=
e: pre-wrap; background-color: #ffffff; text-decoration-thickness: initial;=
 text-decoration-style: initial; text-decoration-color: initial; display: i=
nline !important; float: none;">+ if boot_files is None:</span><br style=3D=
"box-sizing: border-box; overflow-wrap: break-word !important; color: #3333=
33; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto San=
s', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Em=
oji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: n=
ormal; font-variant-ligatures: normal; font-variant-caps: normal; font-weig=
ht: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent=
: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-str=
oke-width: 0px; white-space: pre-wrap; background-color: #ffffff; text-deco=
ration-thickness: initial; text-decoration-style: initial; text-decoration-=
color: initial;" /><span style=3D"color: #333333; font-family: system-ui, '=
Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial,=
 sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Not=
o Color Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures=
: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norm=
al; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: =
pre-wrap; background-color: #ffffff; text-decoration-thickness: initial; te=
xt-decoration-style: initial; text-decoration-color: initial; display: inli=
ne !important; float: none;">+ return</span><br style=3D"box-sizing: border=
-box; overflow-wrap: break-word !important; color: #333333; font-family: sy=
stem-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation San=
s', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Sym=
bol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant=
-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spa=
cing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transfo=
rm: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; whi=
te-space: pre-wrap; background-color: #ffffff; text-decoration-thickness: i=
nitial; text-decoration-style: initial; text-decoration-color: initial;" />=
<span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Roboto, =
'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple=
 Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; fon=
t-size: 16px; font-style: normal; font-variant-ligatures: normal; font-vari=
ant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; tex=
t-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial; display: inline !important; floa=
t: none;">+</span><br style=3D"box-sizing: border-box; overflow-wrap: break=
-word !important; color: #333333; font-family: system-ui, 'Segoe UI', Robot=
o, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Ap=
ple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; =
font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial;" /><span style=3D"color: #333=
333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sa=
ns', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI E=
moji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: =
normal; font-variant-ligatures: normal; font-variant-caps: normal; font-wei=
ght: 400; letter-spacing: normal; orphans: 2; text-align: start; text-inden=
t: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-st=
roke-width: 0px; white-space: pre-wrap; background-color: #ffffff; text-dec=
oration-thickness: initial; text-decoration-style: initial; text-decoration=
-color: initial; display: inline !important; float: none;">+ install_files =
=3D get_boot_files(deploy_image_dir, boot_files)</span><br style=3D"box-siz=
ing: border-box; overflow-wrap: break-word !important; color: #333333; font=
-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Lib=
eration Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'S=
egoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; f=
ont-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; t=
ext-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-widt=
h: 0px; white-space: pre-wrap; background-color: #ffffff; text-decoration-t=
hickness: initial; text-decoration-style: initial; text-decoration-color: i=
nitial;" /><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI=
', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-se=
rif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color =
Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: normal=
; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orph=
ans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: =
2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap=
; background-color: #ffffff; text-decoration-thickness: initial; text-decor=
ation-style: initial; text-decoration-color: initial; display: inline !impo=
rtant; float: none;">+ if install_files is None:</span><br style=3D"box-siz=
ing: border-box; overflow-wrap: break-word !important; color: #333333; font=
-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Lib=
eration Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'S=
egoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; f=
ont-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; t=
ext-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-widt=
h: 0px; white-space: pre-wrap; background-color: #ffffff; text-decoration-t=
hickness: initial; text-decoration-style: initial; text-decoration-color: i=
nitial;" /><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI=
', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-se=
rif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color =
Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: normal=
; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orph=
ans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: =
2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap=
; background-color: #ffffff; text-decoration-thickness: initial; text-decor=
ation-style: initial; text-decoration-color: initial; display: inline !impo=
rtant; float: none;">+ bb.warn("Could not find any boot files to install ev=
en though IMAGE_BOOT_FILES is not empty")</span><br style=3D"box-sizing: bo=
rder-box; overflow-wrap: break-word !important; color: #333333; font-family=
: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation=
 Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI=
 Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-var=
iant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter=
-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: pre-wrap; background-color: #ffffff; text-decoration-thicknes=
s: initial; text-decoration-style: initial; text-decoration-color: initial;=
" /><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Robo=
to, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'A=
pple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';=
 font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-=
variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2;=
 text-align: start; text-indent: 0px; text-transform: none; widows: 2; word=
-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backg=
round-color: #ffffff; text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial; display: inline !important; =
float: none;">+ return</span></p>
<p>&nbsp;</p>
<p><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Robot=
o, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Ap=
ple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; =
font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; display: inline !important; f=
loat: none;"><span style=3D"color: #333333; font-family: system-ui, 'Segoe =
UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-=
serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Colo=
r Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: norm=
al; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; or=
phans: 2; text-align: start; text-indent: 0px; text-transform: none; widows=
: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wr=
ap; background-color: #ffffff; text-decoration-thickness: initial; text-dec=
oration-style: initial; text-decoration-color: initial; display: inline !im=
portant; float: none;">get_boot_files only returns None if boot_files is No=
ne, which is caught already earlier on here, so the bb.warn clause likely w=
ill not be reached</span></span></p>
<p><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Robot=
o, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Ap=
ple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; =
font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; display: inline !important; f=
loat: none;"><span style=3D"color: #333333; font-family: system-ui, 'Segoe =
UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-=
serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Colo=
r Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: norm=
al; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; or=
phans: 2; text-align: start; text-indent: 0px; text-transform: none; widows=
: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wr=
ap; background-color: #ffffff; text-decoration-thickness: initial; text-dec=
oration-style: initial; text-decoration-color: initial; display: inline !im=
portant; float: none;">Personally a check like `if install_files:` would ma=
ke more sense</span></span></p>
<p>&nbsp;</p>
<p><span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Robot=
o, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Ap=
ple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; =
font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; display: inline !important; f=
loat: none;"><span style=3D"color: #333333; font-family: system-ui, 'Segoe =
UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-=
serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Colo=
r Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: norm=
al; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; or=
phans: 2; text-align: start; text-indent: 0px; text-transform: none; widows=
: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wr=
ap; background-color: #ffffff; text-decoration-thickness: initial; text-dec=
oration-style: initial; text-decoration-color: initial; display: inline !im=
portant; float: none;"><span style=3D"color: #333333; font-family: system-u=
i, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Ar=
ial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', =
'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-ligat=
ures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: no=
ne; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spa=
ce: pre-wrap; background-color: #ffffff; text-decoration-thickness: initial=
; text-decoration-style: initial; text-decoration-color: initial; display: =
inline !important; float: none;">IMAGE_PREPROCESS_COMMAND +=3D "bootfiles_p=
opulate;"</span></span></span></p>
<p>&nbsp;</p>
<p>I'm not sure if that wouldn't raise issues if any of the packages would =
install a file by the same path/name as also set here.</p>
<p>In my opinion moving it to a POSTPROCESS function with some checks that =
it won't overwrite any files/folders might be the better option</p>

--VLRZVXlNL9C7H4mMTSOA--

