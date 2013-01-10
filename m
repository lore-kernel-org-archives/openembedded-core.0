Received: from smtp1.ingenico.com ([217.108.148.240])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Matthieu.CRAPET@ingenico.com>) id 1TtIYM-0006UG-FH
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 14:52:25 +0100
X-IronPort-AV: E=Sophos;i="4.84,444,1355094000"; d="scan'208,217";a="20899736"
Received: from frsnprexc1.usr.ingenico.loc ([10.23.2.11])
	by antispam1.usr.ingenico.loc with ESMTP; 10 Jan 2013 14:37:06 +0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 10 Jan 2013 14:37:03 +0100
Message-ID: <D9D7124626ED1E43963D86B2657D5CCD04EA568C@FRSNPREXC1.usr.ingenico.loc>
In-Reply-To: <50EE2822.9050108@windriver.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [OE-core] sstate, cache or licence issue?
Thread-Index: Ac3u2r0RZFBhKT6mR8ahkXl2EzNEnQAXIFxA
References: <D9D7124626ED1E43963D86B2657D5CCD04EA51DA@FRSNPREXC1.usr.ingenico.loc>
	<50EE2822.9050108@windriver.com>
From: "Matthieu CRAPET" <Matthieu.CRAPET@ingenico.com>
To: "ChenQi" <Qi.Chen@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Subject: Re: sstate, cache or licence issue?
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
X-List-Received-Date: Thu, 10 Jan 2013 13:52:28 -0000
Content-class: urn:content-classes:message
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01CDEF37.95188EB3"

------_=_NextPart_001_01CDEF37.95188EB3
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

=20

Yes, this was bug#3674!

=20

Applied:

sstate.bbclass:specify function dirs to avoid race

http://cgit.openembedded.org/openembedded-core/commit/?id=3Dccef1cf783669=
a4683eda9d4b44dbe6bcf426259

=20

Tested with success. Thanks a lot!

=20

Regards,

Matthieu Crapet

=20

=20

De : openembedded-core-bounces@lists.openembedded.org =
[mailto:openembedded-core-bounces@lists.openembedded.org] De la part de =
ChenQi
Envoy=E9 : jeudi 10 janvier 2013 03:32
=C0 : openembedded-core@lists.openembedded.org
Objet : Re: [OE-core] sstate, cache or licence issue?

=20

On 01/10/2013 01:40 AM, Matthieu CRAPET wrote:

	Dear all,

	=20

	I've got some trouble with my today's update to oe-core.

	=20

	I created a basic (image) recipe:

	---

	DESCRIPTION =3D "A console-only production image with headers."

	PR =3D "r0"

	LICENSE =3D "MIT"

	IMAGE_FEATURES +=3D "dev-pkgs debug-tweaks package-management =
ssh-server-openssh"

	inherit core-image

	IMAGE_INSTALL +=3D "openssh openssl directfb directfb-examples"

	---

	=20

	I've got a do_populate_lic failure but image is generated correctly =
(do_rootfs is ok). It fails in sstate_create_package

	=20

	| DEBUG: Executing shell function sstate_create_package

	| shell-init: error retrieving current directory: getcwd: cannot access =
parent directories: No such file or directory

	| chdir: error retrieving current directory: getcwd: cannot access =
parent directories: No such file or directory

	=20

	run.sstate_create_package.$PID

	=20

	sstate_create_package() {

	        cd  =
/lingot/build/tmp-eglibc/work/rp02-ing-linux-gnueabi/test-image/1.0-r0/ss=
tate-build-populate-lic/

	        TFILE=3D`mktemp ...

	...

	=20

	The problem is that the directory exists (containing =
license-destdir/test-image/{COPYING.MIT,LICENSE,generic_MIT})

	=20

	If re-bitbake recipe, works fine.

	If I "bitbake -c cleanall" first + manually delete recipe directory =
(/lingot/build/tmp-eglibc/work/rp02-ing-linux-gnueabi/test-image) then, =
re-bitbake recipe: the do_populate_lic fails again.

	=20

	More surprising: if I wait some times (few minutes). I re-get the error =
but with the extra lines:

	=20

	| DEBUG: Removing manifest: =
/lingot/build/tmp-eglibc/deploy/licenses/test-image/LICENSE

	| DEBUG: Removing manifest: =
/lingot/build/tmp-eglibc/deploy/licenses/test-image/COPYING.MIT

	| DEBUG: Removing manifest: =
/lingot/build/tmp-eglibc/deploy/licenses/test-image/generic_MIT

	| DEBUG: Removing manifest: =
/lingot/build/tmp-eglibc/deploy/licenses/test-image/

	=20

	I added and removed package in IMAGE_INSTALL, sometimes it passes, =
sometimes not, maybe there is a concurrent access somewhere?

	=20


Maybe it's the same bug with bug#3674 =
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3674).

Cheers,
Chen Qi




The two logs are available here:

http://pastebin.com/raw.php?i=3DCVczF2vB

=20

Notice that I'm using my own external toolchain but I don't know that It =
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

More information on www.ingenico.com <http://www.ingenico.com/> .

This message may contain confidential and/or privileged information. If =
you are not the addressee or authorized to receive this for the =
addressee, you must not use, copy, disclose or take any action based on =
this message or any information herein. If you have received this =
message in error, please advise the sender immediately by reply e-mail =
and delete this message. Thank you for your cooperation.

 P Please consider the environment before printing this e-mail






_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

=20


------_=_NextPart_001_01CDEF37.95188EB3
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta name=3DGenerator =
content=3D"Microsoft Word 14 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:Webdings;
	panose-1:5 3 1 2 1 5 9 6 7 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	color:black;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	color:black;}
pre
	{mso-style-priority:99;
	mso-style-link:"Pr=E9format=E9 HTML Car";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";
	color:black;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
p.6271aeb8-3e0c-4268-9157-9618eb0e7060, =
li.6271aeb8-3e0c-4268-9157-9618eb0e7060, =
div.6271aeb8-3e0c-4268-9157-9618eb0e7060
	{mso-style-name:6271aeb8-3e0c-4268-9157-9618eb0e7060;
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	color:black;}
span.PrformatHTMLCar
	{mso-style-name:"Pr=E9format=E9 HTML Car";
	mso-style-priority:99;
	mso-style-link:"Pr=E9format=E9 HTML";
	font-family:"Consolas","serif";
	color:black;
	mso-fareast-language:EN-US;}
span.EmailStyle23
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
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
</o:shapelayout></xml><![endif]--></head><body bgcolor=3Dwhite lang=3DFR =
link=3Dblue vlink=3Dpurple><div class=3DWordSection1><p =
class=3DMsoNormal><span =
style=3D'color:#1F497D'>Hi,<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'color:#1F497D'>Yes, this =
was bug#3674!<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'color:#1F497D'>Applied:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>sstate.bbclass:specify function =
dirs to avoid race<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'color:#1F497D'><a =
href=3D"http://cgit.openembedded.org/openembedded-core/commit/?id=3Dccef1=
cf783669a4683eda9d4b44dbe6bcf426259">http://cgit.openembedded.org/openemb=
edded-core/commit/?id=3Dccef1cf783669a4683eda9d4b44dbe6bcf426259</a><o:p>=
</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'color:#1F497D'>Tested with =
success. Thanks a lot!<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'color:#1F497D'>Regards,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'color:#1F497D'>Matthieu =
Crapet<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><div><div =
style=3D'border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm'><p class=3DMsoNormal><b><span =
style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif";color:windowt=
ext;mso-fareast-language:FR'>De&nbsp;:</span></b><span =
style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif";color:windowt=
ext;mso-fareast-language:FR'> =
openembedded-core-bounces@lists.openembedded.org =
[mailto:openembedded-core-bounces@lists.openembedded.org] <b>De la part =
de</b> ChenQi<br><b>Envoy=E9&nbsp;:</b> jeudi 10 janvier 2013 =
03:32<br><b>=C0&nbsp;:</b> =
openembedded-core@lists.openembedded.org<br><b>Objet&nbsp;:</b> Re: =
[OE-core] sstate, cache or licence =
issue?<o:p></o:p></span></p></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><p class=3DMsoNormal>On =
01/10/2013 01:40 AM, Matthieu CRAPET =
wrote:<o:p></o:p></p></div><blockquote =
style=3D'margin-top:5.0pt;margin-bottom:5.0pt'><div><p =
class=3DMsoNormal>Dear all,<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;<o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>I&#8217;ve got some trouble with my today&#8217;s update to =
oe-core.</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>I created a basic (image) recipe:</span><o:p></o:p></p><p =
class=3DMsoNormal><span lang=3DEN-GB>---</span><o:p></o:p></p><p =
class=3DMsoNormal><span lang=3DEN-GB>DESCRIPTION =3D &quot;A =
console-only production image with =
headers.&quot;</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>PR =3D &quot;r0&quot;</span><o:p></o:p></p><p =
class=3DMsoNormal><span lang=3DEN-GB>LICENSE =3D =
&quot;MIT&quot;</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>IMAGE_FEATURES +=3D &quot;dev-pkgs debug-tweaks =
package-management ssh-server-openssh&quot;</span><o:p></o:p></p><p =
class=3DMsoNormal><span lang=3DEN-GB>inherit =
core-image</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>IMAGE_INSTALL +=3D &quot;openssh openssl directfb =
directfb-examples&quot;</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>---</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>I&#8217;ve got a do_populate_lic failure but image is =
generated correctly (do_rootfs is ok). It fails in =
sstate_create_package</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>| DEBUG: Executing shell function =
sstate_create_package</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>| shell-init: error retrieving current directory: getcwd: =
cannot access parent directories: No such file or =
directory</span><o:p></o:p></p><p class=3DMsoNormal><span lang=3DEN-GB>| =
chdir: error retrieving current directory: getcwd: cannot access parent =
directories: No such file or directory</span><o:p></o:p></p><p =
class=3DMsoNormal><span lang=3DEN-GB>&nbsp;</span><o:p></o:p></p><p =
class=3DMsoNormal><span =
lang=3DEN-GB>run.sstate_create_package.$PID</span><o:p></o:p></p><p =
class=3DMsoNormal><span lang=3DEN-GB>&nbsp;</span><o:p></o:p></p><p =
class=3DMsoNormal><span lang=3DEN-GB>sstate_create_package() =
{</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cd =
&nbsp;/lingot/build/tmp-eglibc/work/rp02-ing-linux-gnueabi/test-image/1.0=
-r0/sstate-build-populate-lic/</span><o:p></o:p></p><p =
class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TFILE=3D`mktemp =
&#8230;</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&#8230;</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>The problem is that the directory exists (containing =
license-destdir/test-image/{COPYING.MIT,LICENSE,generic_MIT})</span><o:p>=
</o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>If re-bitbake recipe, works fine.</span><o:p></o:p></p><p =
class=3DMsoNormal><span lang=3DEN-GB>If I &#8220;bitbake -c =
cleanall&#8221; first + manually delete recipe directory =
(/lingot/build/tmp-eglibc/work/rp02-ing-linux-gnueabi/test-image) then, =
re-bitbake recipe: the do_populate_lic fails =
again.</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>More surprising: if I wait some times (few minutes). I =
re-get the error but with the extra lines:</span><o:p></o:p></p><p =
class=3DMsoNormal><span lang=3DEN-GB>&nbsp;</span><o:p></o:p></p><p =
class=3DMsoNormal><span lang=3DEN-GB>| DEBUG: Removing manifest: =
/lingot/build/tmp-eglibc/deploy/licenses/test-image/LICENSE</span><o:p></=
o:p></p><p class=3DMsoNormal><span lang=3DEN-GB>| DEBUG: Removing =
manifest: =
/lingot/build/tmp-eglibc/deploy/licenses/test-image/COPYING.MIT</span><o:=
p></o:p></p><p class=3DMsoNormal><span lang=3DEN-GB>| DEBUG: Removing =
manifest: =
/lingot/build/tmp-eglibc/deploy/licenses/test-image/generic_MIT</span><o:=
p></o:p></p><p class=3DMsoNormal><span lang=3DEN-GB>| DEBUG: Removing =
manifest: =
/lingot/build/tmp-eglibc/deploy/licenses/test-image/</span><o:p></o:p></p=
><p class=3DMsoNormal><span lang=3DEN-GB>&nbsp;</span><o:p></o:p></p><p =
class=3DMsoNormal><span lang=3DEN-GB>I added and removed package in =
IMAGE_INSTALL, sometimes it passes, sometimes not, maybe there is a =
concurrent access somewhere?</span><o:p></o:p></p><p =
class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;</span><o:p></o:p></p></div></blockquote><p =
class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif";mso-fareast-language:FR'><br>Maybe it's the same bug with =
bug#3674 (<a =
href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3674">https:/=
/bugzilla.yoctoproject.org/show_bug.cgi?id=3D3674</a>).<br><br>Cheers,<br=
>Chen Qi<br><br><br><o:p></o:p></span></p><div><p =
class=3DMsoNormal><span lang=3DEN-GB>The two logs are available =
here:</span><o:p></o:p></p><p class=3DMsoNormal><span lang=3DEN-GB><a =
href=3D"http://pastebin.com/raw.php?i=3DCVczF2vB">http://pastebin.com/raw=
.php?i=3DCVczF2vB</a></span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>Notice that I&#8217;m using my own external toolchain but I =
don&#8217;t know that It is relevant.</span><o:p></o:p></p><p =
class=3DMsoNormal><span lang=3DEN-GB>&nbsp;</span><o:p></o:p></p><p =
class=3DMsoNormal><span lang=3DEN-GB>Any hint appreciated =
here!</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>&nbsp;</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>Regards,</span><o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB>Matthieu Crapet</span><o:p></o:p></p></div><div><p =
class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif";mso-fareast-language:FR'>&nbsp;<o:p></o:p></span></p></div=
><div><p style=3D'text-align:justify'><strong><span =
style=3D'font-size:10.0pt;font-family:"Arial","sans-serif"'>About =
Ingenico </span></strong><span =
style=3D'font-size:10.0pt;font-family:"Arial","sans-serif"'>(Euronext: =
FR0000125346 - ING)</span><span =
style=3D'font-size:7.5pt;font-family:"Arial","sans-serif"'><o:p></o:p></s=
pan></p><p style=3D'text-align:justify'><span =
style=3D'font-size:10.0pt;font-family:"Arial","sans-serif"'>Ingenico is =
a leading provider of payment solutions, with over 17 million terminals =
deployed in more than 125 countries.&nbsp;Its 3,600 employees worldwide =
support retailers, banks and service providers to optimize and secure =
their electronic payments solutions, develop their offer of services and =
increase their point of sales revenue.</span><span =
style=3D'font-size:7.5pt;font-family:"Arial","sans-serif"'><o:p></o:p></s=
pan></p><p style=3D'text-align:justify'><span =
style=3D'font-size:10.0pt;font-family:"Arial","sans-serif"'>More =
information on</span><strong><span =
style=3D'font-size:10.0pt;font-family:"Arial","sans-serif";color:red'> =
<span lang=3DEN-GB><a href=3D"http://www.ingenico.com/"><span =
style=3D'color:red'>www.ingenico.com</span></a></span></span></strong><st=
rong><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:"Arial","sans-serif"'>.</span></str=
ong><span =
style=3D'font-size:7.5pt;font-family:"Arial","sans-serif"'><o:p></o:p></s=
pan></p><p style=3D'text-align:justify'><span =
style=3D'font-size:7.5pt;font-family:"Arial","sans-serif"'>This message =
may contain confidential and/or privileged information. If you are not =
the addressee or authorized to receive this for the addressee, you must =
not use, copy, disclose or take any action based on this message or any =
information herein. If you have received this message in error, please =
advise the sender immediately by reply e-mail and delete this message. =
Thank you for your cooperation.<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:7.5pt;font-family:"Arial","sans-serif"'>&nbsp;</span><=
span lang=3DEN-GB =
style=3D'font-size:12.0pt;font-family:Webdings;color:green'>P</span><span=
 lang=3DEN-GB style=3D'font-family:"Arial","sans-serif"'> </span><span =
lang=3DEN-GB =
style=3D'font-size:7.5pt;font-family:"Arial","sans-serif";color:green'>Pl=
ease consider the environment before printing this =
e-mail</span><o:p></o:p></p></div><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif";mso-fareast-language:FR'><br><br><br><o:p></o:p></span></p=
><pre>_______________________________________________<o:p></o:p></pre><pr=
e>Openembedded-core mailing list<o:p></o:p></pre><pre><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-cor=
e@lists.openembedded.org</a><o:p></o:p></pre><pre><a =
href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-co=
re</a><o:p></o:p></pre><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif";mso-fareast-language:FR'><o:p>&nbsp;</o:p></span></p></div=
></body></html>

------_=_NextPart_001_01CDEF37.95188EB3--
