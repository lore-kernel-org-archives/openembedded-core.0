Received: from smtp1.ingenico.com ([217.108.148.240])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Matthieu.CRAPET@ingenico.com>) id 1Tsztm-0000KV-MU
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 18:57:11 +0100
X-IronPort-AV: E=Sophos;i="4.84,439,1355094000"; d="scan'208,217";a="20851415"
Received: from frsnprexc1.usr.ingenico.loc ([10.23.2.11])
	by antispam1.usr.ingenico.loc with ESMTP; 09 Jan 2013 18:40:58 +0100
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.4721
MIME-Version: 1.0
Date: Wed, 9 Jan 2013 18:40:56 +0100
Message-ID: <D9D7124626ED1E43963D86B2657D5CCD04EA51DA@FRSNPREXC1.usr.ingenico.loc>
X-MS-Has-Attach: 
Importance: normal
Priority: normal
X-MS-TNEF-Correlator: 
Thread-Topic: sstate, cache or licence issue?
thread-index: Ac3ujKGvwt/RCuU2SlKfRT+7leTZpg==
From: "Matthieu CRAPET" <Matthieu.CRAPET@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Subject: sstate, cache or licence issue?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 17:57:11 -0000
Content-Class: urn:content-classes:message
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01CDEE90.7BB8F27F"
Content-Transfer-Encoding: 7bit

------_=_NextPart_001_01CDEE90.7BB8F27F
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear all,

=20

I've got some trouble with my today's update to oe-core.

=20

I created a basic (image) recipe:

---

DESCRIPTION =3D "A console-only production image with headers."

PR =3D "r0"

LICENSE =3D "MIT"

IMAGE_FEATURES +=3D "dev-pkgs debug-tweaks package-management
ssh-server-openssh"

inherit core-image

IMAGE_INSTALL +=3D "openssh openssl directfb directfb-examples"

---

=20

I've got a do_populate_lic failure but image is generated correctly
(do_rootfs is ok). It fails in sstate_create_package

=20

| DEBUG: Executing shell function sstate_create_package

| shell-init: error retrieving current directory: getcwd: cannot access
parent directories: No such file or directory

| chdir: error retrieving current directory: getcwd: cannot access
parent directories: No such file or directory

=20

run.sstate_create_package.$PID

=20

sstate_create_package() {

        cd
/lingot/build/tmp-eglibc/work/rp02-ing-linux-gnueabi/test-image/1.0-r0/s
state-build-populate-lic/

        TFILE=3D`mktemp ...

...

=20

The problem is that the directory exists (containing
license-destdir/test-image/{COPYING.MIT,LICENSE,generic_MIT})

=20

If re-bitbake recipe, works fine.

If I "bitbake -c cleanall" first + manually delete recipe directory
(/lingot/build/tmp-eglibc/work/rp02-ing-linux-gnueabi/test-image) then,
re-bitbake recipe: the do_populate_lic fails again.

=20

More surprising: if I wait some times (few minutes). I re-get the error
but with the extra lines:

=20

| DEBUG: Removing manifest:
/lingot/build/tmp-eglibc/deploy/licenses/test-image/LICENSE

| DEBUG: Removing manifest:
/lingot/build/tmp-eglibc/deploy/licenses/test-image/COPYING.MIT

| DEBUG: Removing manifest:
/lingot/build/tmp-eglibc/deploy/licenses/test-image/generic_MIT

| DEBUG: Removing manifest:
/lingot/build/tmp-eglibc/deploy/licenses/test-image/

=20

I added and removed package in IMAGE_INSTALL, sometimes it passes,
sometimes not, maybe there is a concurrent access somewhere?

=20

The two logs are available here:

http://pastebin.com/raw.php?i=3DCVczF2vB

=20

Notice that I'm using my own external toolchain but I don't know that It
is relevant.

=20

Any hint appreciated here!

=20

Regards,

Matthieu Crapet


=20
About Ingenico (Euronext: FR0000125346 - ING)
Ingenico is a leading provider of payment solutions, with over 17 =
million terminals deployed in more than 125 countries. Its 3,600 =
employees worldwide support retailers, banks and service providers to =
optimize and secure their electronic payments solutions, develop their =
offer of services and increase their point of sales revenue.
More information on http://www.ingenico.com/.
This message may contain confidential and/or privileged information. If =
you are not the addressee or authorized to receive this for the =
addressee, you must not use, copy, disclose or take any action based on =
this message or any information herein. If you have received this =
message in error, please advise the sender immediately by reply e-mail =
and delete this message. Thank you for your cooperation.
 P Please consider the environment before printing this e-mail

------_=_NextPart_001_01CDEE90.7BB8F27F
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<HTML xmlns=3D"http://www.w3.org/TR/REC-html40" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel"><head><META =
content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Type">
<meta content=3D"text/html; charset=3Dutf-8" =
http-equiv=3DContent-Type><meta content=3D"Microsoft Word 14 (filtered =
medium)" name=3DGenerator><style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
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
</o:shapelayout></xml><![endif]--><META content=3D"text/html; =
charset=3Dutf-8" http-equiv=3D"Content-Type">
<STYLE><!-- /* Style Definitions */ =
p.6271aeb8-3e0c-4268-9157-9618eb0e7060, =
li.6271aeb8-3e0c-4268-9157-9618eb0e7060, =
div.6271aeb8-3e0c-4268-9157-9618eb0e7060, =
table.6271aeb8-3e0c-4268-9157-9618eb0e7060Table	{margin:0cm; =
margin-bottom:.0001pt;}div.Section1 {page:Section1;}--></STYLE>
</head><BODY>
<DIV><div class=3DWordSection1><p class=3DMsoNormal>Dear =
all,<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><span lang=3DEN-GB>I&#8217;ve got some trouble with my =
today&#8217;s update to oe-core.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>I created a basic (image) =
recipe:<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>---<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>DESCRIPTION =3D &quot;A console-only production image with =
headers.&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>PR =3D &quot;r0&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>LICENSE =3D =
&quot;MIT&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>IMAGE_FEATURES +=3D &quot;dev-pkgs debug-tweaks =
package-management ssh-server-openssh&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>inherit =
core-image<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>IMAGE_INSTALL +=3D &quot;openssh openssl directfb =
directfb-examples&quot;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>---<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>I&#8217;ve got a do_populate_lic failure but image is =
generated correctly (do_rootfs is ok). It fails in =
sstate_create_package<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>| DEBUG: Executing shell function =
sstate_create_package<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>| shell-init: error retrieving current directory: getcwd: =
cannot access parent directories: No such file or =
directory<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB>| =
chdir: error retrieving current directory: getcwd: cannot access parent =
directories: No such file or directory<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-GB>run.sstate_create_package.$PID<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>sstate_create_package() =
{<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cd =
&nbsp;/lingot/build/tmp-eglibc/work/rp02-ing-linux-gnueabi/test-image/1.0=
-r0/sstate-build-populate-lic/<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TFILE=3D`mktemp =
&#8230;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&#8230;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>The problem is that the directory exists (containing =
license-destdir/test-image/{COPYING.MIT,LICENSE,generic_MIT})<o:p></o:p><=
/span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>If re-bitbake recipe, works fine.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>If I &#8220;bitbake -c =
cleanall&#8221; first + manually delete recipe directory =
(/lingot/build/tmp-eglibc/work/rp02-ing-linux-gnueabi/test-image) then, =
re-bitbake recipe: the do_populate_lic fails =
again.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>More surprising: if I wait some times (few minutes). I =
re-get the error but with the extra lines:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>| DEBUG: Removing manifest: =
/lingot/build/tmp-eglibc/deploy/licenses/test-image/LICENSE<o:p></o:p></s=
pan></p><p class=3DMsoNormal><span lang=3DEN-GB>| DEBUG: Removing =
manifest: =
/lingot/build/tmp-eglibc/deploy/licenses/test-image/COPYING.MIT<o:p></o:p=
></span></p><p class=3DMsoNormal><span lang=3DEN-GB>| DEBUG: Removing =
manifest: =
/lingot/build/tmp-eglibc/deploy/licenses/test-image/generic_MIT<o:p></o:p=
></span></p><p class=3DMsoNormal><span lang=3DEN-GB>| DEBUG: Removing =
manifest: =
/lingot/build/tmp-eglibc/deploy/licenses/test-image/<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>I added and removed package in =
IMAGE_INSTALL, sometimes it passes, sometimes not, maybe there is a =
concurrent access somewhere?<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>The two logs are available =
here:<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB><a =
href=3D"http://pastebin.com/raw.php?i=3DCVczF2vB">http://pastebin.com/raw=
.php?i=3DCVczF2vB</a><o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>Notice that I&#8217;m using my own external toolchain but I =
don&#8217;t know that It is relevant.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>Any hint appreciated =
here!<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>Regards,<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>Matthieu Crapet<o:p></o:p></span></p></div></DIV>
<DIV>&nbsp;</DIV>
<DIV STYLE=3D"FONT-FAMILY: Courier New; FONT-SIZE: 9pt"><FONT =
FACE=3D"Arial" SIZE=3D"1">
<P STYLE=3D"TEXT-ALIGN: justify"><SPAN><FONT FACE=3D"Arial" =
SIZE=3D"2"><STRONG>About Ingenico </STRONG>(Euronext: FR0000125346 - =
ING)</FONT></SPAN></P>
<P STYLE=3D"TEXT-ALIGN: justify"><SPAN><SPAN LANG=3D"EN-GB" =
STYLE=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt; mso-ansi-language: =
EN-GB"><SPAN STYLE=3D"FONT-FAMILY: Arial; COLOR: black; FONT-SIZE: 10pt; =
mso-ansi-language: FR; mso-fareast-font-family: 'Times New Roman'; =
mso-fareast-language: FR; mso-bidi-language: AR-SA">Ingenico is a =
leading provider of payment solutions, with over 17 million terminals =
deployed in more than 125 countries.&nbsp;Its 3,600 employees worldwide =
support retailers, banks and service providers to optimize and secure =
their electronic payments solutions, develop their offer of services and =
increase their point of sales revenue.</SPAN></SPAN></SPAN></P>
<P STYLE=3D"TEXT-ALIGN: justify"><SPAN><SPAN LANG=3D"EN-GB" =
STYLE=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt; mso-ansi-language: =
EN-GB"><SPAN STYLE=3D"FONT-FAMILY: Arial; COLOR: black; FONT-SIZE: 10pt; =
mso-ansi-language: FR; mso-fareast-font-family: 'Times New Roman'; =
mso-fareast-language: FR; mso-bidi-language: AR-SA">More information =
on</SPAN></SPAN></SPAN><SPAN><STRONG><SPAN LANG=3D"EN-GB" =
STYLE=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt; mso-ansi-language: =
EN-GB"><SPAN STYLE=3D"COLOR: red"> <A =
HREF=3D"http://www.ingenico.com/"><SPAN STYLE=3D"COLOR: red"><FONT =
COLOR=3D"#ff0000">www.ingenico.com</FONT></SPAN></A></SPAN>.</SPAN></STRO=
NG></SPAN></P>
<P STYLE=3D"TEXT-ALIGN: justify"><SPAN STYLE=3D"FONT-FAMILY: =
'Arial','sans-serif'; FONT-SIZE: 7.5pt"><FONT SIZE=3D"1">This message =
may contain confidential and/or privileged information. If you are not =
the addressee or authorized to receive this for the addressee, you must =
not use, copy, disclose or take any action based on this message or any =
information herein. If you have received this message in error, please =
advise the sender immediately by reply e-mail and delete this message. =
</FONT></SPAN><SPAN STYLE=3D"FONT-FAMILY: 'Arial','sans-serif'; =
FONT-SIZE: 7.5pt"><FONT SIZE=3D"1">Thank you for your =
cooperation.</FONT></SPAN></P>
<P CLASS=3D"MsoNormal"><SPAN STYLE=3D"FONT-FAMILY: 'Arial','sans-serif'; =
FONT-SIZE: 7.5pt">&nbsp;</SPAN><SPAN LANG=3D"EN-GB" =
STYLE=3D"FONT-FAMILY: Webdings; COLOR: green; FONT-SIZE: =
12pt">P</SPAN><SPAN LANG=3D"EN-GB" STYLE=3D"FONT-FAMILY: =
'Arial','sans-serif'; COLOR: black"> </SPAN><SPAN LANG=3D"EN-GB" =
STYLE=3D"FONT-FAMILY: 'Arial','sans-serif'; COLOR: green; FONT-SIZE: =
7.5pt">Please consider the environment before printing this =
e-mail</SPAN></P></FONT></DIV></BODY></HTML>

------_=_NextPart_001_01CDEE90.7BB8F27F--
