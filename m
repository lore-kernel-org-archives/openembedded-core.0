Return-Path: <a1ba.omarov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B52C54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 18:53:20 +0000 (UTC)
Subject: [PATCH RESEND] wpa-supplicant: add support for building without DBus
To: openembedded-core@lists.openembedded.org
From: "Alibek Omarov" <a1ba.omarov@gmail.com>
X-Originating-Location: Helsinki, Uusimaa, FI (135.181.76.187)
X-Originating-Platform: Linux Firefox 116
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 23 Mar 2024 11:53:13 -0700
Message-ID: <x1Pa.1711219993562897943.5Sfr@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="6XsfRwYXv1S9nVoqGqcz"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 18:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197467

--6XsfRwYXv1S9nVoqGqcz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Useful on highly resource constrained embedded systems where DBus is an ext=
ra
dependency. Tested to build with and without ` dbus ` in PACKAGECONFIG.

DBus interface is left enabled by default to preserve old behavior.

Signed-off-by: Alibek Omarov < a1ba.omarov@gmail.com >
---
.../wpa-supplicant/ wpa-suppli cant_2.10.bb ( http://wpa-supplicant_2.10.bb=
 ) | 21 +++++++++++++------
1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/wp
a-supplicant/ wpa-supplicant_2. 10.bb ( http://wpa-supplicant_2.10.bb )
b/meta/recipes-connectivity/wp a-supplicant/ wpa-supplicant_2. 10.bb ( http=
://wpa-supplicant_2.10.bb )
index 46604045da..dec904b12d 100644
--- a/meta/recipes-connectivity/wp a-supplicant/ wpa-supplicant_2. 10.bb ( =
http://wpa-supplicant_2.10.bb )
+++ b/meta/recipes-connectivity/wp a-supplicant/ wpa-supplicant_2. 10.bb ( =
http://wpa-supplicant_2.10.bb )
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D
"file://COPYING;md5=3D5ebcb90236 d1ad640558c3d3cd3035df \

file://README;beginline=3D1;endl ine=3D56;md5=3De3d2f6c2948991e37c1 ca4960d=
e84747
\

file://wpa_supplicant/wpa_supp licant.c;beginline=3D1;endline=3D 12;md5=3D7=
6306a95306fee9a976b0ac 1be70f705"

-DEPENDS =3D " dbus libnl"
+DEPENDS =3D "libnl"

SRC_URI =3D " http://w1.fi/releases/wpa_sup plicant-${PV}.tar.gz ( http://w=
1.fi/releases/wpa_supplicant-$%7BPV%7D.tar.gz ) \
file://wpa-supplicant.sh \
@@ -25,9 +25,10 @@ S =3D "${WORKDIR}/wpa_supplicant-${P V}"

inherit pkgconfig systemd

-PACKAGECONFIG ?=3D "openssl"
+PACKAGECONFIG ?=3D "openssl dbus "
PACKAGECONFIG[gnutls] =3D ",,gnutls libgcrypt"
PACKAGECONFIG[openssl] =3D ",,openssl"
+PACKAGECONFIG[ dbus ] =3D ",, dbus "

CVE_PRODUCT =3D "wpa_supplicant"

@@ -46,6 +47,12 @@ do_configure () {
-e 's/\(^CONFIG_SAE=3D\)/#\1/' wpa_supplicant/.config
fi

+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "${@bb.utils.contains('PACKAGE CONFIG',' d=
bus ','true','false', d)}"
=3D "false" ]; then
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e 's/\(^CON=
FIG_CTRL_IFACE_DBUS_N EW=3D\)/#\1/' \
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-e 's/\(^CONFIG_CTRL_IFACE_DBUS_I NTRO=3D\)/#\1/'
wpa_supplicant/.config
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi
+
+
# For rebuild
rm -f wpa_supplicant/*.d wpa_supplicant/ dbus /*.d
}
@@ -72,10 +79,12 @@ do_install () {
install -m 755 ${WORKDIR}/wpa-supplicant.sh
${D}${sysconfdir}/network/if-p re-up.d/wpa-supplicant
ln -sf ../if-pre-up.d/wpa-supplicant
${D}${sysconfdir}/network/if-p ost-down.d/wpa-supplicant

-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/${sysconfdir}/ dbus -1/syst em.=
d
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644
${S}/wpa_supplicant/ dbus / dbus - wpa_supplicant.conf
${D}/${sysconfdir}/ dbus -1/syst em.d
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/${datadir}/ dbus -1/system- ser=
vices
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}/wpa_supplicant/ dbus /*.ser=
 vice
${D}/${datadir}/ dbus -1/system- services
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains('PACKAGEC ONFIG',' dbus=
 ','true','false', d)}; then
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/${s=
ysconfdir}/ dbus -1/syst em.d
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644
${S}/wpa_supplicant/ dbus / dbus - wpa_supplicant.conf
${D}/${sysconfdir}/ dbus -1/syst em.d
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/${d=
atadir}/ dbus -1/system- services
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}=
/wpa_supplicant/ dbus /*.ser vice
${D}/${datadir}/ dbus -1/system- services
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi

if ${@bb.utils.contains('DISTRO_F EATURES','systemd','true','fal se',d)};
then
install -d ${D}/${systemd_system_unitdir}
--
2.34.1

--6XsfRwYXv1S9nVoqGqcz
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Useful on highly resource constrained embedded systems where <span class=3D=
"il">DBus</span> is an extra<br />dependency. Tested to build with and with=
out `<span class=3D"il">dbus</span>` in PACKAGECONFIG.<br /><br /><span cla=
ss=3D"il">DBus</span> interface is left enabled by default to preserve old =
behavior.<br /><br />Signed-off-by: Alibek Omarov &lt;<a href=3D"mailto:a1b=
a.omarov@gmail.com" target=3D"_blank" rel=3D"noopener">a1ba.omarov@gmail.co=
m</a>&gt;<br />---<br />&nbsp;.../wpa-supplicant/<a href=3D"http://wpa-supp=
licant_2.10.bb" target=3D"_blank" rel=3D"noopener noreferrer" data-saferedi=
recturl=3D"https://www.google.com/url?q=3Dhttp://wpa-supplicant_2.10.bb&amp=
;source=3Dgmail&amp;ust=3D1711306318785000&amp;usg=3DAOvVaw3B66wKLNz74QU3lv=
ALbJOs">wpa-suppli<wbr />cant_2.10.bb</a>&nbsp; &nbsp; &nbsp;| 21 +++++++++=
++++------<br />&nbsp;1 file changed, 15 insertions(+), 6 deletions(-)<br /=
><br />diff --git a/meta/recipes-connectivity/wp
<div id=3D":tg" class=3D"a3s aiL "><wbr />a-supplicant/<a href=3D"http://wp=
a-supplicant_2.10.bb" target=3D"_blank" rel=3D"noopener noreferrer" data-sa=
feredirecturl=3D"https://www.google.com/url?q=3Dhttp://wpa-supplicant_2.10.=
bb&amp;source=3Dgmail&amp;ust=3D1711306318785000&amp;usg=3DAOvVaw3B66wKLNz7=
4QU3lvALbJOs">wpa-supplicant_2.<wbr />10.bb</a><br />b/meta/recipes-connect=
ivity/wp<wbr />a-supplicant/<a href=3D"http://wpa-supplicant_2.10.bb" targe=
t=3D"_blank" rel=3D"noopener noreferrer" data-saferedirecturl=3D"https://ww=
w.google.com/url?q=3Dhttp://wpa-supplicant_2.10.bb&amp;source=3Dgmail&amp;u=
st=3D1711306318785000&amp;usg=3DAOvVaw3B66wKLNz74QU3lvALbJOs">wpa-supplican=
t_2.<wbr />10.bb</a><br />index 46604045da..dec904b12d 100644<br />--- a/me=
ta/recipes-connectivity/wp<wbr />a-supplicant/<a href=3D"http://wpa-supplic=
ant_2.10.bb" target=3D"_blank" rel=3D"noopener noreferrer" data-saferedirec=
turl=3D"https://www.google.com/url?q=3Dhttp://wpa-supplicant_2.10.bb&amp;so=
urce=3Dgmail&amp;ust=3D1711306318785000&amp;usg=3DAOvVaw3B66wKLNz74QU3lvALb=
JOs">wpa-supplicant_2.<wbr />10.bb</a><br />+++ b/meta/recipes-connectivity=
/wp<wbr />a-supplicant/<a href=3D"http://wpa-supplicant_2.10.bb" target=3D"=
_blank" rel=3D"noopener noreferrer" data-saferedirecturl=3D"https://www.goo=
gle.com/url?q=3Dhttp://wpa-supplicant_2.10.bb&amp;source=3Dgmail&amp;ust=3D=
1711306318785000&amp;usg=3DAOvVaw3B66wKLNz74QU3lvALbJOs">wpa-supplicant_2.<=
wbr />10.bb</a><br />@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D<br />"file://COPY=
ING;md5=3D5ebcb90236<wbr />d1ad640558c3d3cd3035df \<br /><br />file://READM=
E;beginline=3D1;endl<wbr />ine=3D56;md5=3De3d2f6c2948991e37c1<wbr />ca4960d=
e84747<br />\<br /><br />file://wpa_supplicant/wpa_supp<wbr />licant.c;begi=
nline=3D1;endline=3D<wbr />12;md5=3D76306a95306fee9a976b0ac<wbr />1be70f705=
"<br /><br />-DEPENDS =3D "<span class=3D"il">dbus</span> libnl"<br />+DEPE=
NDS =3D "libnl"<br /><br />&nbsp;SRC_URI =3D "<a href=3D"http://w1.fi/relea=
ses/wpa_supplicant-$%7BPV%7D.tar.gz" target=3D"_blank" rel=3D"noopener nore=
ferrer" data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttp://w1.fi=
/releases/wpa_supplicant-$%257BPV%257D.tar.gz&amp;source=3Dgmail&amp;ust=3D=
1711306318785000&amp;usg=3DAOvVaw33b-aJvOM3UxFjOiDQvJGJ">http://w1.fi/relea=
ses/wpa_sup<wbr />plicant-${PV}.tar.gz</a> \<br />&nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; file://wpa-supplicant.sh \<br />@@ -25,9 +25,10 @@ S =3D "=
${WORKDIR}/wpa_supplicant-${P<wbr />V}"<br /><br />&nbsp;inherit pkgconfig =
systemd<br /><br />-PACKAGECONFIG ?=3D "openssl"<br />+PACKAGECONFIG ?=3D "=
openssl <span class=3D"il">dbus</span>"<br />&nbsp;PACKAGECONFIG[gnutls] =
=3D ",,gnutls libgcrypt"<br />&nbsp;PACKAGECONFIG[openssl] =3D ",,openssl"<=
br />+PACKAGECONFIG[<span class=3D"il">dbus</span>] =3D ",,<span class=3D"i=
l">dbus</span>"<br /><br />&nbsp;CVE_PRODUCT =3D "wpa_supplicant"<br /><br =
/>@@ -46,6 +47,12 @@ do_configure () {<br />&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; -e 's/\(^CONFIG_SAE=3D\)/#\1/' wpa_supplicant/.con=
fig<br />&nbsp; &nbsp; &nbsp; &nbsp; fi<br /><br />+&nbsp; &nbsp; &nbsp; &n=
bsp;if [ "${@bb.utils.contains('PACKAGE<wbr />CONFIG','<span class=3D"il">d=
bus</span>','true','false',<wbr />d)}"<br />=3D "false" ]; then<br />+&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sed -i -e 's/\(^CONFIG_CT=
RL_IFACE_DBUS_N<wbr />EW=3D\)/#\1/' \<br />+&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-e 's/\(^CONFIG_CTRL_IF=
ACE_DBUS_I<wbr />NTRO=3D\)/#\1/'<br />wpa_supplicant/.config<br />+&nbsp; &=
nbsp; &nbsp; &nbsp;fi<br />+<br />+<br />&nbsp; &nbsp; &nbsp; &nbsp; # For =
rebuild<br />&nbsp; &nbsp; &nbsp; &nbsp; rm -f wpa_supplicant/*.d wpa_suppl=
icant/<span class=3D"il">dbus</span>/*.d<br />&nbsp;}<br />@@ -72,10 +79,12=
 @@ do_install () {<br />&nbsp; &nbsp; &nbsp; &nbsp; install -m 755 ${WORKD=
IR}/wpa-supplicant.sh<br />${D}${sysconfdir}/network/if-p<wbr />re-up.d/wpa=
-supplicant<br />&nbsp; &nbsp; &nbsp; &nbsp; ln -sf ../if-pre-up.d/wpa-supp=
licant<br />${D}${sysconfdir}/network/if-p<wbr />ost-down.d/wpa-supplicant<=
br /><br />-&nbsp; &nbsp; &nbsp; &nbsp;install -d ${D}/${sysconfdir}/<span =
class=3D"il">dbus</span>-1/syst<wbr />em.d<br />-&nbsp; &nbsp; &nbsp; &nbsp=
;install -m 644<br />${S}/wpa_supplicant/<span class=3D"il">dbus</span>/<sp=
an class=3D"il">dbus</span>-<wbr />wpa_supplicant.conf<br />${D}/${sysconfd=
ir}/<span class=3D"il">dbus</span>-1/syst<wbr />em.d<br />-&nbsp; &nbsp; &n=
bsp; &nbsp;install -d ${D}/${datadir}/<span class=3D"il">dbus</span>-1/syst=
em-<wbr />services<br />-&nbsp; &nbsp; &nbsp; &nbsp;install -m 644 ${S}/wpa=
_supplicant/<span class=3D"il">dbus</span>/*.ser<wbr />vice<br />${D}/${dat=
adir}/<span class=3D"il">dbus</span>-1/system-<wbr />services<br />+&nbsp; =
&nbsp; &nbsp; &nbsp;if ${@bb.utils.contains('PACKAGEC<wbr />ONFIG','<span c=
lass=3D"il">dbus</span>','true','false',<wbr />d)}; then<br />+&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d ${D}/${sysconfdir}/<s=
pan class=3D"il">dbus</span>-1/syst<wbr />em.d<br />+&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 644<br />${S}/wpa_supplicant/<s=
pan class=3D"il">dbus</span>/<span class=3D"il">dbus</span>-<wbr />wpa_supp=
licant.conf<br />${D}/${sysconfdir}/<span class=3D"il">dbus</span>-1/syst<w=
br />em.d<br />+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;inst=
all -d ${D}/${datadir}/<span class=3D"il">dbus</span>-1/system-<wbr />servi=
ces<br />+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m=
 644 ${S}/wpa_supplicant/<span class=3D"il">dbus</span>/*.ser<wbr />vice<br=
 />${D}/${datadir}/<span class=3D"il">dbus</span>-1/system-<wbr />services<=
br />+&nbsp; &nbsp; &nbsp; &nbsp;fi<br /><br />&nbsp; &nbsp; &nbsp; &nbsp; =
if ${@bb.utils.contains('DISTRO_F<wbr />EATURES','systemd','true','fal<wbr =
/>se',d)};<br />then<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; install -d ${D}/${systemd_system_unitdir}<br />--<br />2.34.1</div>

--6XsfRwYXv1S9nVoqGqcz--

