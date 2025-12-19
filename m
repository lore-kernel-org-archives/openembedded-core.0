Return-Path: <vishal.gupta_1@philips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B292D7877D
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 13:57:00 +0000 (UTC)
Subject: Re: [PATCH 1/1] wpa-supplicant: fix sed expression
To: openembedded-core@lists.openembedded.org
From: vishal.gupta_1@philips.com
X-Originating-Location: =?UTF-8?B?RMO8c3NlbGRvcmYsIE5vcnRoIFJoaW5lLVdlc3RwaGFsaWEsIERF?= (155.190.62.28)
X-Originating-Platform: Windows Edge 143
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 19 Dec 2025 05:56:55 -0800
References: <20251219124928.1474117-1-vishal.gupta_1@bbl.philips.com> <CANNYZj-xn-KQUFor=QFG_OBq0MF1tuBacUYyQJUDwF2gqnZA9Q@mail.gmail.com>
In-Reply-To: <CANNYZj-xn-KQUFor=QFG_OBq0MF1tuBacUYyQJUDwF2gqnZA9Q@mail.gmail.com>
Message-ID: <250823.1766152615641090465@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="CTXmTiexHfgxYjeSMTXs"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 13:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228238

--CTXmTiexHfgxYjeSMTXs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

In the do_configure function current intention of implementation is to firs=
t delete it when we copying and then depending on the PACKAGECONFIG assign =
it with correct value.
As delete is failed because the line start with "#" we will have two CONFIG=
_TLS value in final ".config" file

one, at some where middle of the file
#CONFIG_TLS=3Dopenssl

second, depending on package config, at the end of file as it's an append o=
peration.
CONFIG_TLS=3Dopenssl / gnutls

do_configure () {
${MAKE} -C wpa_supplicant clean
sed -e '/^#\?CONFIG_TLS=3D/d' <wpa_supplicant/defconfig >wpa_supplicant/.co=
nfig
if ${@ bb.utils.contains('PACKAGECONFIG', 'openssl', 'true', 'false', d) };=
 then
echo 'CONFIG_TLS=3Dopenssl' >>wpa_supplicant/.config
elif ${@ bb.utils.contains('PACKAGECONFIG', 'gnutls', 'true', 'false', d) }=
; then
echo 'CONFIG_TLS=3Dgnutls' >>wpa_supplicant/.config
sed -i -e 's/\(^CONFIG_DPP=3D\)/#\1/' \
-e 's/\(^CONFIG_EAP_PWD=3D\)/#\1/' \
-e 's/\(^CONFIG_SAE=3D\)/#\1/' wpa_supplicant/.config
fi

So with this change there will be only one "CONFIG_TLS=3D<value>" option.

--CTXmTiexHfgxYjeSMTXs
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div><span style=3D"color: #000000; font-family: 'Segoe UI', 'Segoe UI Web =
(West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neu=
e', sans-serif; font-size: 14.6667px; font-style: normal; font-variant-liga=
tures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing:=
 normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: n=
one; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-sp=
ace: normal; background-color: #ffffff; text-decoration-thickness: initial;=
 text-decoration-style: initial; text-decoration-color: initial; display: i=
nline !important; float: none;">Hi Alexander,</span><br style=3D"color: #00=
0000; font-family: 'Segoe UI', 'Segoe UI Web (West European)', -apple-syste=
m, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif; font-size: 14.=
6667px; font-style: normal; font-variant-ligatures: normal; font-variant-ca=
ps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-alig=
n: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: =
0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color:=
 #ffffff; text-decoration-thickness: initial; text-decoration-style: initia=
l; text-decoration-color: initial;" /><span style=3D"color: #000000; font-f=
amily: 'Segoe UI', 'Segoe UI Web (West European)', -apple-system, BlinkMacS=
ystemFont, Roboto, 'Helvetica Neue', sans-serif; font-size: 14.6667px; font=
-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; te=
xt-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; white-space: normal; background-color: #ffffff; te=
xt-decoration-thickness: initial; text-decoration-style: initial; text-deco=
ration-color: initial; display: inline !important; float: none;"><br />In t=
he do_configure function current intention of implementation is to first de=
lete it when we copying and then depending on the PACKAGECONFIG assign it w=
ith correct value.</span><br style=3D"color: #000000; font-family: 'Segoe U=
I', 'Segoe UI Web (West European)', -apple-system, BlinkMacSystemFont, Robo=
to, 'Helvetica Neue', sans-serif; font-size: 14.6667px; font-style: normal;=
 font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 40=
0; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px;=
 text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-wi=
dth: 0px; white-space: normal; background-color: #ffffff; text-decoration-t=
hickness: initial; text-decoration-style: initial; text-decoration-color: i=
nitial;" /><span style=3D"color: #000000; font-family: 'Segoe UI', 'Segoe U=
I Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Helveti=
ca Neue', sans-serif; font-size: 14.6667px; font-style: normal; font-varian=
t-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transf=
orm: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; wh=
ite-space: normal; background-color: #ffffff; text-decoration-thickness: in=
itial; text-decoration-style: initial; text-decoration-color: initial; disp=
lay: inline !important; float: none;">As delete is failed because the line =
start with "#" we will have two CONFIG_TLS value in final ".config" file</s=
pan><br style=3D"color: #000000; font-family: 'Segoe UI', 'Segoe UI Web (We=
st European)', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue',=
 sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatur=
es: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: no=
rmal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none=
; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space=
: normal; background-color: #ffffff; text-decoration-thickness: initial; te=
xt-decoration-style: initial; text-decoration-color: initial;" /><br style=
=3D"color: #000000; font-family: 'Segoe UI', 'Segoe UI Web (West European)'=
, -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif; =
font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; bac=
kground-color: #ffffff; text-decoration-thickness: initial; text-decoration=
-style: initial; text-decoration-color: initial;" /><span style=3D"color: #=
000000; font-family: 'Segoe UI', 'Segoe UI Web (West European)', -apple-sys=
tem, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif; font-size: 1=
4.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-=
caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-al=
ign: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing=
: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-colo=
r: #ffffff; text-decoration-thickness: initial; text-decoration-style: init=
ial; text-decoration-color: initial; display: inline !important; float: non=
e;">one, at some where middle of the file</span><br style=3D"color: #000000=
; font-family: 'Segoe UI', 'Segoe UI Web (West European)', -apple-system, B=
linkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif; font-size: 14.6667=
px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: s=
tart; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; white-space: normal; background-color: #ff=
ffff; text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial;" /><span style=3D"color: #000000; font-famil=
y: 'Segoe UI', 'Segoe UI Web (West European)', -apple-system, BlinkMacSyste=
mFont, Roboto, 'Helvetica Neue', sans-serif; font-size: 14.6667px; font-sty=
le: normal; font-variant-ligatures: normal; font-variant-caps: normal; font=
-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-i=
ndent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; white-space: normal; background-color: #ffffff; text-d=
ecoration-thickness: initial; text-decoration-style: initial; text-decorati=
on-color: initial; display: inline !important; float: none;">#CONFIG_TLS=3D=
openssl</span><br style=3D"color: #000000; font-family: 'Segoe UI', 'Segoe =
UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Helvet=
ica Neue', sans-serif; font-size: 14.6667px; font-style: normal; font-varia=
nt-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-s=
pacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-trans=
form: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; w=
hite-space: normal; background-color: #ffffff; text-decoration-thickness: i=
nitial; text-decoration-style: initial; text-decoration-color: initial;" />=
<br style=3D"color: #000000; font-family: 'Segoe UI', 'Segoe UI Web (West E=
uropean)', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', san=
s-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal=
; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; wi=
dows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: no=
rmal; background-color: #ffffff; text-decoration-thickness: initial; text-d=
ecoration-style: initial; text-decoration-color: initial;" /><span style=3D=
"color: #000000; font-family: 'Segoe UI', 'Segoe UI Web (West European)', -=
apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif; fon=
t-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgr=
ound-color: #ffffff; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial; display: inline !important; f=
loat: none;">second, depending on package config, at the end of file as it'=
s an append operation.</span><br style=3D"color: #000000; font-family: 'Seg=
oe UI', 'Segoe UI Web (West European)', -apple-system, BlinkMacSystemFont, =
Roboto, 'Helvetica Neue', sans-serif; font-size: 14.6667px; font-style: nor=
mal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight=
: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: =
0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; white-space: normal; background-color: #ffffff; text-decorati=
on-thickness: initial; text-decoration-style: initial; text-decoration-colo=
r: initial;" /><span style=3D"color: #000000; font-family: 'Segoe UI', 'Seg=
oe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Hel=
vetica Neue', sans-serif; font-size: 14.6667px; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-weight: 400; lette=
r-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tr=
ansform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px=
; white-space: normal; background-color: #ffffff; text-decoration-thickness=
: initial; text-decoration-style: initial; text-decoration-color: initial; =
display: inline !important; float: none;">CONFIG_TLS=3Dopenssl / gnutls</sp=
an><br style=3D"color: #000000; font-family: 'Segoe UI', 'Segoe UI Web (Wes=
t European)', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', =
sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligature=
s: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: nor=
mal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none;=
 widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space:=
 normal; background-color: #ffffff; text-decoration-thickness: initial; tex=
t-decoration-style: initial; text-decoration-color: initial;" /><br style=
=3D"color: #000000; font-family: 'Segoe UI', 'Segoe UI Web (West European)'=
, -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif; =
font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; bac=
kground-color: #ffffff; text-decoration-thickness: initial; text-decoration=
-style: initial; text-decoration-color: initial;" /><span style=3D"color: #=
000000; font-family: 'Segoe UI', 'Segoe UI Web (West European)', -apple-sys=
tem, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif; font-size: 1=
4.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-=
caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-al=
ign: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing=
: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-colo=
r: #ffffff; text-decoration-thickness: initial; text-decoration-style: init=
ial; text-decoration-color: initial; display: inline !important; float: non=
e;">do_configure () {</span><br style=3D"color: #000000; font-family: 'Sego=
e UI', 'Segoe UI Web (West European)', -apple-system, BlinkMacSystemFont, R=
oboto, 'Helvetica Neue', sans-serif; font-size: 14.6667px; font-style: norm=
al; font-variant-ligatures: normal; font-variant-caps: normal; font-weight:=
 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0=
px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke=
-width: 0px; white-space: normal; background-color: #ffffff; text-decoratio=
n-thickness: initial; text-decoration-style: initial; text-decoration-color=
: initial;" /><span style=3D"color: #000000; font-family: 'Segoe UI', 'Sego=
e UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Helv=
etica Neue', sans-serif; font-size: 14.6667px; font-style: normal; font-var=
iant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter=
-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: normal; background-color: #ffffff; text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial; d=
isplay: inline !important; float: none;">&nbsp; &nbsp; &nbsp; &nbsp; ${MAKE=
} -C wpa_supplicant clean</span><br style=3D"color: #000000; font-family: '=
Segoe UI', 'Segoe UI Web (West European)', -apple-system, BlinkMacSystemFon=
t, Roboto, 'Helvetica Neue', sans-serif; font-size: 14.6667px; font-style: =
normal; font-variant-ligatures: normal; font-variant-caps: normal; font-wei=
ght: 400; letter-spacing: normal; orphans: 2; text-align: start; text-inden=
t: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-st=
roke-width: 0px; white-space: normal; background-color: #ffffff; text-decor=
ation-thickness: initial; text-decoration-style: initial; text-decoration-c=
olor: initial;" /><span style=3D"color: #000000; font-family: 'Segoe UI', '=
Segoe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, '=
Helvetica Neue', sans-serif; font-size: 14.6667px; font-style: normal; font=
-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text=
-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: =
0px; white-space: normal; background-color: #ffffff; text-decoration-thickn=
ess: initial; text-decoration-style: initial; text-decoration-color: initia=
l; display: inline !important; float: none;">&nbsp; &nbsp; &nbsp; &nbsp; se=
d -e '/^#\?CONFIG_TLS=3D/d' &lt;wpa_supplicant/defconfig &gt;wpa_supplicant=
/.config</span><br style=3D"color: #000000; font-family: 'Segoe UI', 'Segoe=
 UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Helve=
tica Neue', sans-serif; font-size: 14.6667px; font-style: normal; font-vari=
ant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-=
spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tran=
sform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
white-space: normal; background-color: #ffffff; text-decoration-thickness: =
initial; text-decoration-style: initial; text-decoration-color: initial;" /=
><span style=3D"color: #000000; font-family: 'Segoe UI', 'Segoe UI Web (Wes=
t European)', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', =
sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligature=
s: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: nor=
mal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none;=
 widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space:=
 normal; background-color: #ffffff; text-decoration-thickness: initial; tex=
t-decoration-style: initial; text-decoration-color: initial; display: inlin=
e !important; float: none;">&nbsp; &nbsp; &nbsp; &nbsp; if ${@ bb.utils.con=
tains('PACKAGECONFIG', 'openssl', 'true', 'false', d) }; then</span><br sty=
le=3D"color: #000000; font-family: 'Segoe UI', 'Segoe UI Web (West European=
)', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif=
; font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orpha=
ns: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2=
; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; b=
ackground-color: #ffffff; text-decoration-thickness: initial; text-decorati=
on-style: initial; text-decoration-color: initial;" /><span style=3D"color:=
 #000000; font-family: 'Segoe UI', 'Segoe UI Web (West European)', -apple-s=
ystem, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif; font-size:=
 14.6667px; font-style: normal; font-variant-ligatures: normal; font-varian=
t-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-=
align: start; text-indent: 0px; text-transform: none; widows: 2; word-spaci=
ng: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-co=
lor: #ffffff; text-decoration-thickness: initial; text-decoration-style: in=
itial; text-decoration-color: initial; display: inline !important; float: n=
one;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; echo 'CONFIG_=
TLS=3Dopenssl' &gt;&gt;wpa_supplicant/.config</span><br style=3D"color: #00=
0000; font-family: 'Segoe UI', 'Segoe UI Web (West European)', -apple-syste=
m, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif; font-size: 14.=
6667px; font-style: normal; font-variant-ligatures: normal; font-variant-ca=
ps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-alig=
n: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: =
0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color:=
 #ffffff; text-decoration-thickness: initial; text-decoration-style: initia=
l; text-decoration-color: initial;" /><span style=3D"color: #000000; font-f=
amily: 'Segoe UI', 'Segoe UI Web (West European)', -apple-system, BlinkMacS=
ystemFont, Roboto, 'Helvetica Neue', sans-serif; font-size: 14.6667px; font=
-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; te=
xt-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; white-space: normal; background-color: #ffffff; te=
xt-decoration-thickness: initial; text-decoration-style: initial; text-deco=
ration-color: initial; display: inline !important; float: none;">&nbsp; &nb=
sp; &nbsp; &nbsp; elif ${@ bb.utils.contains('PACKAGECONFIG', 'gnutls', 'tr=
ue', 'false', d) }; then</span><br style=3D"color: #000000; font-family: 'S=
egoe UI', 'Segoe UI Web (West European)', -apple-system, BlinkMacSystemFont=
, Roboto, 'Helvetica Neue', sans-serif; font-size: 14.6667px; font-style: n=
ormal; font-variant-ligatures: normal; font-variant-caps: normal; font-weig=
ht: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent=
: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-str=
oke-width: 0px; white-space: normal; background-color: #ffffff; text-decora=
tion-thickness: initial; text-decoration-style: initial; text-decoration-co=
lor: initial;" /><span style=3D"color: #000000; font-family: 'Segoe UI', 'S=
egoe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'H=
elvetica Neue', sans-serif; font-size: 14.6667px; font-style: normal; font-=
variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; let=
ter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-=
transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; white-space: normal; background-color: #ffffff; text-decoration-thickne=
ss: initial; text-decoration-style: initial; text-decoration-color: initial=
; display: inline !important; float: none;">&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; echo 'CONFIG_TLS=3Dgnutls' &gt;&gt;wpa_supplicant/=
.config</span><br style=3D"color: #000000; font-family: 'Segoe UI', 'Segoe =
UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Helvet=
ica Neue', sans-serif; font-size: 14.6667px; font-style: normal; font-varia=
nt-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-s=
pacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-trans=
form: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; w=
hite-space: normal; background-color: #ffffff; text-decoration-thickness: i=
nitial; text-decoration-style: initial; text-decoration-color: initial;" />=
<span style=3D"color: #000000; font-family: 'Segoe UI', 'Segoe UI Web (West=
 European)', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', s=
ans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatures=
: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norm=
al; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: =
normal; background-color: #ffffff; text-decoration-thickness: initial; text=
-decoration-style: initial; text-decoration-color: initial; display: inline=
 !important; float: none;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; sed -i -e 's/\(^CONFIG_DPP=3D\)/#\1/' \</span><br style=3D"color: #=
000000; font-family: 'Segoe UI', 'Segoe UI Web (West European)', -apple-sys=
tem, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif; font-size: 1=
4.6667px; font-style: normal; font-variant-ligatures: normal; font-variant-=
caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-al=
ign: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing=
: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-colo=
r: #ffffff; text-decoration-thickness: initial; text-decoration-style: init=
ial; text-decoration-color: initial;" /><span style=3D"color: #000000; font=
-family: 'Segoe UI', 'Segoe UI Web (West European)', -apple-system, BlinkMa=
cSystemFont, Roboto, 'Helvetica Neue', sans-serif; font-size: 14.6667px; fo=
nt-style: normal; font-variant-ligatures: normal; font-variant-caps: normal=
; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; =
text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webk=
it-text-stroke-width: 0px; white-space: normal; background-color: #ffffff; =
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial; display: inline !important; float: none;">&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -e 's/\(^CONF=
IG_EAP_PWD=3D\)/#\1/' \</span><br style=3D"color: #000000; font-family: 'Se=
goe UI', 'Segoe UI Web (West European)', -apple-system, BlinkMacSystemFont,=
 Roboto, 'Helvetica Neue', sans-serif; font-size: 14.6667px; font-style: no=
rmal; font-variant-ligatures: normal; font-variant-caps: normal; font-weigh=
t: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent:=
 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stro=
ke-width: 0px; white-space: normal; background-color: #ffffff; text-decorat=
ion-thickness: initial; text-decoration-style: initial; text-decoration-col=
or: initial;" /><span style=3D"color: #000000; font-family: 'Segoe UI', 'Se=
goe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'He=
lvetica Neue', sans-serif; font-size: 14.6667px; font-style: normal; font-v=
ariant-ligatures: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-t=
ransform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; white-space: normal; background-color: #ffffff; text-decoration-thicknes=
s: initial; text-decoration-style: initial; text-decoration-color: initial;=
 display: inline !important; float: none;">&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -e 's/\(^CONFIG_SAE=3D\)/#\1/' wpa_su=
pplicant/.config</span><br style=3D"color: #000000; font-family: 'Segoe UI'=
, 'Segoe UI Web (West European)', -apple-system, BlinkMacSystemFont, Roboto=
, 'Helvetica Neue', sans-serif; font-size: 14.6667px; font-style: normal; f=
ont-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; t=
ext-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-widt=
h: 0px; white-space: normal; background-color: #ffffff; text-decoration-thi=
ckness: initial; text-decoration-style: initial; text-decoration-color: ini=
tial;" /><span style=3D"color: #000000; font-family: 'Segoe UI', 'Segoe UI =
Web (West European)', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica=
 Neue', sans-serif; font-size: 14.6667px; font-style: normal; font-variant-=
ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spac=
ing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transfor=
m: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; whit=
e-space: normal; background-color: #ffffff; text-decoration-thickness: init=
ial; text-decoration-style: initial; text-decoration-color: initial; displa=
y: inline !important; float: none;">&nbsp; &nbsp; &nbsp; &nbsp; fi<br /></s=
pan><br style=3D"color: #000000; font-family: 'Segoe UI', 'Segoe UI Web (We=
st European)', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue',=
 sans-serif; font-size: 14.6667px; font-style: normal; font-variant-ligatur=
es: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: no=
rmal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none=
; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space=
: normal; background-color: #ffffff; text-decoration-thickness: initial; te=
xt-decoration-style: initial; text-decoration-color: initial;" /><span styl=
e=3D"color: #000000; font-family: 'Segoe UI', 'Segoe UI Web (West European)=
', -apple-system, BlinkMacSystemFont, Roboto, 'Helvetica Neue', sans-serif;=
 font-size: 14.6667px; font-style: normal; font-variant-ligatures: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphan=
s: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; ba=
ckground-color: #ffffff; text-decoration-thickness: initial; text-decoratio=
n-style: initial; text-decoration-color: initial; display: inline !importan=
t; float: none;">So with this change there will be only one "CONFIG_TLS=3D&=
lt;value&gt;" option.</span></div>

--CTXmTiexHfgxYjeSMTXs--

