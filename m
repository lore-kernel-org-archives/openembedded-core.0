Return-Path: <leimaohui@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 8F4D36BA9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 07:10:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,966,1367942400"; d="scan'208,217";a="8314996"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 27 Aug 2013 15:07:51 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r7R7AsOs025980
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 15:10:55 +0800
Received: from G08FNSTD100511 ([10.167.226.63])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013082715085991-979932 ;
	Tue, 27 Aug 2013 15:08:59 +0800 
From: "leimaohui" <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Aug 2013 15:10:53 +0800
Message-ID: <011401cea2f4$92481300$b6d83900$@cn.fujitsu.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac6i9HWPrUR6k5dFRf+f4d/xOUKbiA==
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/08/27 15:09:00,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/08/27 15:09:00,
	Serialize complete at 2013/08/27 15:09:00
Subject: [PATCH 1/1] consolekit_0.4.6.bb: Fix QA error when --enable-udev-acl
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
X-List-Received-Date: Tue, 27 Aug 2013 07:11:00 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0115_01CEA337.A06DC400"
Content-Language: zh-cn

------=_NextPart_000_0115_01CEA337.A06DC400
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="us-ascii"

Add EXTRA_OECONF += "--enable-udev-acl" to 

consolekit_0.4.6.bb whill cause a package_qa error. 

The error message looks like:

 

| ERROR: QA Issue: non debug package contains .debug directory: 

| consolekit path consolekit/0.4.6-r0/packages-split/consolekit/lib/u

| dev/.debug/udev-acl

 

There is a need to add udev-acl file to package instead of "${base_libdir}"

 

Signed-off-by: leimaohui <leimaohui@cn.fujitsu.com>

---

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb 

b/meta/recipes-support/consolekit/consolekit_0.4.6.bb

index 63da028..4133f4d 100644

--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb

+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb

@@ -28,9 +28,10 @@ PACKAGECONFIG[policykit] = ",,polkit"

PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=

${systemd_unitdir}/system/,--with-systemdsystemunitdir="

 

FILES_${PN} += "${localstatedir}/log/ConsoleKit ${exec_prefix}/lib/ConsoleKit \

-                ${libdir}/ConsoleKit  ${systemd_unitdir} ${base_libdir} \

-                ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"

-FILES_${PN}-dbg += "${base_libdir}/security/.debug"

+                ${libdir}/ConsoleKit  ${systemd_unitdir}
${base_libdir}/udev/rules.d \

+               ${base_libdir}/udev/udev-acl ${datadir}/dbus-1
${datadir}/PolicyKit \

+               ${datadir}/polkit*"

+FILES_${PN}-dbg += "${base_libdir}/security/.debug /lib/udev/.debug"

 

PACKAGES =+ "pam-plugin-ck-connector"

FILES_pam-plugin-ck-connector += "${base_libdir}/security/*.so"

--

1.7.1

 


------=_NextPart_000_0115_01CEA337.A06DC400
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset="us-ascii"

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 14 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"MS Gothic";
	panose-1:2 11 6 9 7 2 5 8 2 4;}
@font-face
	{font-family:"MS Gothic";
	panose-1:2 11 6 9 7 2 5 8 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@MS Gothic";
	panose-1:2 11 6 9 7 2 5 8 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0mm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Arial","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"\7EAF\6587\672C Char";
	margin:0mm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"MS Gothic";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Arial","sans-serif";
	color:windowtext;}
span.Char
	{mso-style-name:"\7EAF\6587\672C Char";
	mso-style-priority:99;
	mso-style-link:\7EAF\6587\672C;
	font-family:"MS Gothic";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Arial","sans-serif";}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026">
<v:textbox inset=3D"5.85pt,.7pt,5.85pt,.7pt" />
</o:shapedefaults></xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DJA link=3Dblue =
vlink=3Dpurple style=3D'text-justify-trim:punctuation'><div =
class=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>Add EXTRA_OECONF =
+=3D &quot;--enable-udev-acl&quot; to <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>consolekit_0.4.6.bb=
 whill </span><span lang=3DEN-US>cause</span><span lang=3DEN-US =
style=3D'mso-fareast-language:ZH-CN'> a package_qa error. =
<o:p></o:p></span></p><p class=3DMsoPlainText><span lang=3DEN-US =
style=3D'font-family:"Arial","sans-serif"'>The error message looks =
like:<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'><o:p>&nbsp;</o:p></=
span></p><p class=3DMsoNormal><span lang=3DEN-US>|</span><span =
lang=3DEN-US style=3D'mso-fareast-language:ZH-CN'> </span><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>ERROR: QA Issue: =
non debug package contains .debug directory: <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>| consolekit path =
consolekit/0.4.6-r0/packages-split/consolekit/lib/u<o:p></o:p></span></p>=
<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>| =
dev/.debug/udev-acl<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'><o:p>&nbsp;</o:p></=
span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>There is a need to =
add udev-acl file to package instead of =
&#8220;${base_libdir}&#8221;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'><o:p>&nbsp;</o:p></=
span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>Signed-off-by: =
leimaohui &lt;<a =
href=3D"mailto:leimaohui@cn.fujitsu.com">leimaohui@cn.fujitsu.com</a>&gt;=
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>---</span><span =
lang=3DEN-US style=3D'font-size:10.0pt'><o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>diff --git =
a/meta/recipes-support/consolekit/consolekit_0.4.6.bb =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>b/meta/recipes-supp=
ort/consolekit/consolekit_0.4.6.bb<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>index =
63da028..4133f4d 100644<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>--- =
a/meta/recipes-support/consolekit/consolekit_0.4.6.bb<o:p></o:p></span></=
p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>+++ =
b/meta/recipes-support/consolekit/consolekit_0.4.6.bb<o:p></o:p></span></=
p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>@@ -28,9 +28,10 @@ =
PACKAGECONFIG[policykit] =3D =
&quot;,,polkit&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>PACKAGECONFIG[syste=
md] =3D &quot;--with-systemdsystemunitdir=3D</span><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'><o:p></o:p></span><=
/p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>${systemd_unitdir}/=
system/,--with-systemdsystemunitdir=3D&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'><o:p>&nbsp;</o:p></=
span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>FILES_${PN} +=3D =
&quot;${localstatedir}/log/ConsoleKit ${exec_prefix}/lib/ConsoleKit =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>-&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
${libdir}/ConsoleKit&nbsp; ${systemd_unitdir} ${base_libdir} =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>-&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
${datadir}/dbus-1 ${datadir}/PolicyKit =
${datadir}/polkit*&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>-FILES_${PN}-dbg =
+=3D &quot;${base_libdir}/security/.debug&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>+&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
${libdir}/ConsoleKit&nbsp; ${systemd_unitdir} =
${base_libdir}/udev/rules.d \<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>+&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
${base_libdir}/udev/udev-acl ${datadir}/dbus-1 ${datadir}/PolicyKit =
\<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>+&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
${datadir}/polkit*&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>+FILES_${PN}-dbg =
+=3D &quot;${base_libdir}/security/.debug =
/lib/udev/.debug&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'><o:p>&nbsp;</o:p></=
span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>PACKAGES =3D+ =
&quot;pam-plugin-ck-connector&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>FILES_pam-plugin-ck=
-connector +=3D =
&quot;${base_libdir}/security/*.so&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>--<o:p></o:p></span=
></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt;mso-fareast-language:ZH-CN'>1.7.1<o:p></o:p></s=
pan></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.0pt'><o:p>&nbsp;</o:p></span></p></div></body></htm=
l>

------=_NextPart_000_0115_01CEA337.A06DC400--
