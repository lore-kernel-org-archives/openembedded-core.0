Return-Path: <herve.jourdain@neuf.fr>
X-Greylist: delayed 502 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 07 Mar 2016 10:50:45 UTC
Received: from smtp24.services.sfr.fr (smtp24.services.sfr.fr [93.17.128.82])
	by mail.openembedded.org (Postfix) with ESMTP id D29036057A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 10:50:45 +0000 (UTC)
Received: from filter.sfr.fr (localhost [111.250.196.5])
	by msfrf2411.sfr.fr (SMTP Server) with ESMTP id 66425700009A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 11:42:24 +0100 (CET)
Authentication-Results: sfrmc.priv.atos.fr; dkim=none (no signature);
	dkim-adsp=none (no policy) header.from=herve.jourdain@neuf.fr
Received: from nb-hjo (111-250-196-5.dynamic.hinet.net [111.250.196.5])	(using
	TLSv1 with cipher AES128-SHA (128/128 bits))	(No client certificate
	requested)
	by msfrf2411.sfr.fr (SMTP Server) with ESMTP id F32377000086
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 11:42:22 +0100 (CET)
X-SFR-UUID: 20160307104222995.F32377000086@msfrf2411.sfr.fr
Received: from nbhjo
	by nb-hjo (PGP Universal service);  Mon, 07 Mar 2016 11:42:21 +0100
X-PGP-Universal: processed;	by nb-hjo on Mon, 07 Mar 2016 11:42:21 +0100
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-core@lists.openembedded.org
References: <004901d1785c$fb27d0f0$f17772d0$@neuf.fr>
In-Reply-To: <004901d1785c$fb27d0f0$f17772d0$@neuf.fr>
Date: Mon, 7 Mar 2016 11:42:17 +0100
Message-ID: <005801d1785e$07915900$16b40b00$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQHP4Vmgxw9eN8fN6lAZp6kcg4zXAZ9Q+RCA
Subject: [systemd][PATCH] some dependencies in systemd seem not to be taken into account in systemd_229.bb
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
X-List-Received-Date: Mon, 07 Mar 2016 10:50:46 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0059_01D17866.69572090"
Content-Language: fr

------=_NextPart_000_0059_01D17866.69572090
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Systemd: - RESOLVED depends on GCRYPT, so GCRYPT should be enabled if
RESOLVED is enabled

                 - ${PN}-binfmt should be added to SYSTEMD_PACKAGES only if
binfmt is enabled

Without this patch, build fails when gcrypt is not in PACKAGECONFIG, but
resolved is, or when binfmt is not in PACKAGECONFIG.

 

Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr
<mailto:herve.jourdain@neuf.fr> >

---

diff --git a/meta/recipes-core/systemd/systemd_229.bb
b/meta/recipes-core/systemd/systemd_229.bb

index 16af0ac..6523e0a 100644

--- a/meta/recipes-core/systemd/systemd_229.bb

+++ b/meta/recipes-core/systemd/systemd_229.bb

@@ -97,11 +97,13 @@ PACKAGECONFIG_remove_libc-musl = "smack"

 

 PACKAGECONFIG[journal-upload] = "--enable-libcurl,--disable-libcurl,curl"

# Sign the journal for anti-tampering

-PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"

+# RESOLVED depends on GCRYPT, so disable gcrypt only if resolved and gcrypt
are NOT part of PACKAGECONFIG - done in EXTRA_OECONF

+PACKAGECONFIG[gcrypt] = "--enable-gcrypt,,libgcrypt"

PACKAGECONFIG[cryptsetup] =
"--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"

PACKAGECONFIG[microhttpd] =
"--enable-microhttpd,--disable-microhttpd,libmicrohttpd"

PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils"

-PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"

+# RESOLVED depends on GCRYPT, so enable gcrypt any time resolved is in
PACKAGECONFIG

+PACKAGECONFIG[resolved] = "--enable-resolved
--enable-gcrypt,--disable-resolved,libgcrypt"

PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"

PACKAGECONFIG[machined] = "--enable-machined,--disable-machined"

PACKAGECONFIG[backlight] = "--enable-backlight,--disable-backlight"

@@ -180,6 +182,9 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \

                  --with-firmware-path=/lib/firmware \

                  --with-testdir=${PTEST_PATH} \

                "

+# RESOLVED depends on GCRYPT, so disable gcrypt only if resolved and gcrypt
are NOT part of PACKAGECONFIG

+EXTRA_OECONF += "${@bb.utils.contains_any('PACKAGECONFIG', 'resolved
gcrypt', '', '--disable-gcrypt', d)}
<mailto:$%7b@bb.utils.contains_any('PACKAGECONFIG',%20'resolved%20gcrypt',%2
0'',%20'--disable-gcrypt',%20d)%7d> "

+

# per the systemd README, define VALGRIND=1 to run under valgrind

CFLAGS .= "${@bb.utils.contains('PACKAGECONFIG', 'valgrind', '
-DVALGRIND=1', '', d)}
<mailto:$%7b@bb.utils.contains('PACKAGECONFIG',%20'valgrind',%20'%20-DVALGRI
ND=1',%20'',%20d)%7d> "

 

@@ -196,6 +201,10 @@ do_configure_prepend() {

              else

                             cp -r ${S}/units ${S}/units.pre_sed

              fi

+             if [ ${@bb.utils.contains('PACKAGECONFIG
<mailto:$%7b@bb.utils.contains('PACKAGECONFIG> ', 'resolved', 'true',
'false', d)} -a \

+         ! ${@bb.utils.contains('PACKAGECONFIG
<mailto:$%7b@bb.utils.contains('PACKAGECONFIG> ', 'gcrypt', 'true', 'false',
d)} ]; then

+                           PACKAGECONFIG_append = "gcrypt"

+             fi

}

 

 do_install() {

@@ -298,8 +307,10 @@ PACKAGES =+ "\

     ${PN}-extra-utils \

"

 

-SYSTEMD_PACKAGES = "${PN}-binfmt"

-SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"

+#SYSTEMD_PACKAGES = "${PN}-binfmt"

+#SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"

+SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt',
'${PN}-binfmt', '', d)}
<mailto:$%7b@bb.utils.contains('PACKAGECONFIG',%20'binfmt',%20'$%7bPN%7d-bin
fmt',%20'',%20d)%7d> "

+SYSTEMD_SERVICE_${PN}-binfmt = "${@bb.utils.contains('PACKAGECONFIG',
'binfmt', 'systemd-binfmt.service', '', d)}
<mailto:$%7b@bb.utils.contains('PACKAGECONFIG',%20'binfmt',%20'systemd-binfm
t.service',%20'',%20d)%7d> "

 

 USERADD_PACKAGES = "${PN}"

USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd',
'--system -d / -M --shell /bin/nologin systemd-journal-gateway;', '', d)}
<mailto:$%7b@bb.utils.contains('PACKAGECONFIG',%20'microhttpd',%20'--system%
20-d%20/%20-M%20--shell%20/bin/nologin%20systemd-journal-gateway;',%20'',%20
d)%7d> "


------=_NextPart_000_0059_01D17866.69572090
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DFR =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal><span lang=3DEN-US>Systemd: - RESOLVED depends on =
GCRYPT, so GCRYPT should be enabled if RESOLVED is =
enabled<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - ${PN}-binfmt should be added to =
SYSTEMD_PACKAGES only if binfmt is enabled<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Without this patch, build fails =
when gcrypt is not in PACKAGECONFIG, but resolved is, or when binfmt is =
not in PACKAGECONFIG.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-US>Signed-off-by: Herve Jourdain &lt;<a =
href=3D"mailto:herve.jourdain@neuf.fr">herve.jourdain@neuf.fr</a>&gt;<o:p=
></o:p></span></p><p class=3DMsoPlainText><span =
lang=3DEN-US>---<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>diff --git a/meta/recipes-core/systemd/systemd_229.bb =
b/meta/recipes-core/systemd/systemd_229.bb<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>index 16af0ac..6523e0a =
100644<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>--- =
a/meta/recipes-core/systemd/systemd_229.bb<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>+++ =
b/meta/recipes-core/systemd/systemd_229.bb<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>@@ -97,11 +97,13 @@ =
PACKAGECONFIG_remove_libc-musl =3D =
&quot;smack&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;PACKAGECONFIG[journal-upload] =3D =
&quot;--enable-libcurl,--disable-libcurl,curl&quot;<o:p></o:p></span></p>=
<p class=3DMsoNormal><span lang=3DEN-US># Sign the journal for =
anti-tampering<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>-PACKAGECONFIG[gcrypt] =3D =
&quot;--enable-gcrypt,--disable-gcrypt,libgcrypt&quot;<o:p></o:p></span><=
/p><p class=3DMsoNormal><span lang=3DEN-US>+# RESOLVED depends on =
GCRYPT, so disable gcrypt only if resolved and gcrypt are NOT part of =
PACKAGECONFIG - done in EXTRA_OECONF<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>+PACKAGECONFIG[gcrypt] =3D =
&quot;--enable-gcrypt,,libgcrypt&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>PACKAGECONFIG[cryptsetup] =3D =
&quot;--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup&quot;<o:p=
></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>PACKAGECONFIG[microhttpd] =3D =
&quot;--enable-microhttpd,--disable-microhttpd,libmicrohttpd&quot;<o:p></=
o:p></span></p><p class=3DMsoNormal>PACKAGECONFIG[elfutils] =3D =
&quot;--enable-elfutils,--disable-elfutils,elfutils&quot;<o:p></o:p></p><=
p class=3DMsoNormal><span lang=3DEN-US>-PACKAGECONFIG[resolved] =3D =
&quot;--enable-resolved,--disable-resolved&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>+# RESOLVED depends on GCRYPT, so =
enable gcrypt any time resolved is in =
PACKAGECONFIG<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>+PACKAGECONFIG[resolved] =3D &quot;--enable-resolved =
--enable-gcrypt,--disable-resolved,libgcrypt&quot;<o:p></o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-US>PACKAGECONFIG[networkd] =3D =
&quot;--enable-networkd,--disable-networkd&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>PACKAGECONFIG[machined] =3D =
&quot;--enable-machined,--disable-machined&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>PACKAGECONFIG[backlight] =3D =
&quot;--enable-backlight,--disable-backlight&quot;<o:p></o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-US>@@ -180,6 +182,9 @@ EXTRA_OECONF =
=3D &quot; --with-rootprefix=3D${rootprefix} \<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
--with-firmware-path=3D/lib/firmware \<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--with-=
testdir=3D${PTEST_PATH} \<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>+# RESOLVED depends on GCRYPT, so =
disable gcrypt only if resolved and gcrypt are NOT part of =
PACKAGECONFIG<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>+EXTRA_OECONF +=3D &quot;<a =
href=3D"mailto:$%7b@bb.utils.contains_any('PACKAGECONFIG',%20'resolved%20=
gcrypt',%20'',%20'--disable-gcrypt',%20d)%7d">${@bb.utils.contains_any('P=
ACKAGECONFIG', 'resolved gcrypt', '', '--disable-gcrypt', =
d)}</a>&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>+<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US># per the systemd README, define VALGRIND=3D1 to run under =
valgrind<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>CFLAGS .=3D &quot;<a =
href=3D"mailto:$%7b@bb.utils.contains('PACKAGECONFIG',%20'valgrind',%20'%=
20-DVALGRIND=3D1',%20'',%20d)%7d">${@bb.utils.contains('PACKAGECONFIG', =
'valgrind', ' -DVALGRIND=3D1', '', d)}</a>&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>@@ -196,6 +201,10 @@ =
do_configure_prepend() {<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; else<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -r ${S}/units =
${S}/units.pre_sed<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; fi<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; if [ <a =
href=3D"mailto:$%7b@bb.utils.contains('PACKAGECONFIG">${@bb.utils.contain=
s('PACKAGECONFIG</a>', 'resolved', 'true', 'false', d)} -a =
\<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ! <a =
href=3D"mailto:$%7b@bb.utils.contains('PACKAGECONFIG">${@bb.utils.contain=
s('PACKAGECONFIG</a>', 'gcrypt', 'true', 'false', d)} ]; =
then<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; PACKAGECONFIG_append =3D =
&quot;gcrypt&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; fi<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>}<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;do_install() {<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>@@ -298,8 +307,10 @@ PACKAGES =3D+ =
&quot;\<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp; ${PN}-extra-utils =
\<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>-SYSTEMD_PACKAGES =3D =
&quot;${PN}-binfmt&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>-SYSTEMD_SERVICE_${PN}-binfmt =3D =
&quot;systemd-binfmt.service&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>+#SYSTEMD_PACKAGES =3D =
&quot;${PN}-binfmt&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>+#SYSTEMD_SERVICE_${PN}-binfmt =3D =
&quot;systemd-binfmt.service&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>+SYSTEMD_PACKAGES =3D &quot;<a =
href=3D"mailto:$%7b@bb.utils.contains('PACKAGECONFIG',%20'binfmt',%20'$%7=
bPN%7d-binfmt',%20'',%20d)%7d">${@bb.utils.contains('PACKAGECONFIG', =
'binfmt', '${PN}-binfmt', '', d)}</a>&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>+SYSTEMD_SERVICE_${PN}-binfmt =3D =
&quot;<a =
href=3D"mailto:$%7b@bb.utils.contains('PACKAGECONFIG',%20'binfmt',%20'sys=
temd-binfmt.service',%20'',%20d)%7d">${@bb.utils.contains('PACKAGECONFIG'=
, 'binfmt', 'systemd-binfmt.service', '', =
d)}</a>&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;</span>USERADD_PACKAGES =3D =
&quot;${PN}&quot;<o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-US>USERADD_PARAM_${PN} +=3D &quot;<a =
href=3D"mailto:$%7b@bb.utils.contains('PACKAGECONFIG',%20'microhttpd',%20=
'--system%20-d%20/%20-M%20--shell%20/bin/nologin%20systemd-journal-gatewa=
y;',%20'',%20d)%7d">${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', =
'--system -d / -M --shell /bin/nologin systemd-journal-gateway;', '', =
d)}</a>&quot;<o:p></o:p></span></p></div></body></html>

------=_NextPart_000_0059_01D17866.69572090--
