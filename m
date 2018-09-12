Return-Path: <joseph-reynolds@charter.net>
Received: from mtaout006-public.msg.strl.va.charter.net
	(mtaout006-public.msg.strl.va.charter.net [68.114.190.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4E4D0796B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 21:04:03 +0000 (UTC)
Received: from impout003 ([68.114.189.18]) by mtaout006.msg.strl.va.charter.net
	(InterMail vM.9.00.023.01 201-2473-194) with ESMTP id
	<20180912210403.PKQE7358.mtaout006.msg.strl.va.charter.net@impout003>;
	Wed, 12 Sep 2018 16:04:03 -0500
Received: from localhost ([68.114.5.35]) by impout003 with charter.net
	id al431y00B0lLAyC01l43Xu; Wed, 12 Sep 2018 16:04:03 -0500
X-Authority-Analysis: v=2.2 cv=HqsGIwbS c=1 sm=1 tr=0
	a=VBTjg2AHeJkaqYfRu568yw==:117 a=VBTjg2AHeJkaqYfRu568yw==:17
	a=fJkqCKB1fTMA:10 a=x7bEGLp0ZPQA:10 a=hOpmn2quAAAA:8 a=Q4-j1AaZAAAA:8
	a=hTbhJLIYz-uw5w-XMvMA:9 a=QEXdDO2ut3YA:10 a=QyXUC8HyAAAA:8
	a=i3XdmG2DZesjxjtrWAsA:9 a=jC2kCOo3qHkEYHyT:21 a=_W_S_7VecoQA:10
	a=GyA-uvUxXSCciAkwuKQO:22 a=9H3Qd4_ONW2Ztcrla5EB:22
Message-ID: <al431y00B0lLAyC01l43Xu@charter.net>
From: joseph-reynolds@charter.net
To: "'Burton, Ross'" <ross.burton@intel.com>
X-Mailer: Atmail 7.1.1.13434
X-Originating-IP: [129.42.161.36]
Date: Wed, 12 Sep 2018 16:04:03 -0500
MIME-Version: 1.0
Cc: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] disable medium-strength dropbear ssh ciphers
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
X-List-Received-Date: Wed, 12 Sep 2018 21:04:03 -0000
Content-Type: multipart/alternative;
	boundary="=_eb00b36b4c70dafa7ac47939d47588c9"

--=_eb00b36b4c70dafa7ac47939d47588c9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

>From: "Burton, Ross" =0A>To: joseph-reynolds@charter.net=0A>Cc: "openem=
bedded-core@lists.openembedded.org"=0A>Sent: Wednesday September 12 2018=
 7:20:27AM=0A>Subject: Re: [OE-core] [PATCH] disable medium-strength dro=
pbear ssh=0Aciphers=0A>=0A >Presumably this doesn't actually work as you=
're just adding a file=0Ato=0A >git without actually referring to it any=
where.=0A >=0AThanks for your email. I am still trying to get the Dropbe=
ar patch=0Aupstreamed. (This is my first patch, so I am a bit of an open=
 source=0Anoob.)=0A=0ATo address your concern: Dropbear version 2018.76=
 and later build=0Aprocess specifically looks for the localoptions.h fil=
e as the way to=0Acustomize dropbear. (Note the 2017.75 and earlier vers=
ions use a=0Adifferent mechanism to customize.) See the Makefile.in file=
 for=0Adetails.=0A=0AHowever, now I am wondering if patching Dropbear's=
 default_options.h=0Afile would be a better way to make this change. Add=
ing a localoption.h=0Afile is the way to customize dropbear. But I want=
 to change the=0A*default* behavior of dropbear so that it uses the same=
 encryption=0Aciphers as OpenSSH. I think patching default_options.h wou=
ld be better=0Away to accomplish that goal. And that patch could be appl=
ied to the=0ADropbear project itself.=0A >Ross=0A >=0A >On 7 September 2=
018 at 20:16,  wrote:=0A > This changes the Dropbear SSH server configur=
ation so it will not=0A > accept medium-strength encryption ciphers incl=
uding: CBC mode, MD5,=0A > 96-bit MAC, and triple DES.=0A >=0A > Upstrea=
m-Status: Pending=0A >=0A > Signed-off-by: Joseph Reynolds =0A > ---=0A=
 > meta/recipes-core/dropbear/dropbear/localoptions.h | 8 ++++++++=0A >=
 1 file changed, 8 insertions(+)=0A > create mode 100644=0Ameta/recipes-=
core/dropbear/dropbear/localoptions.h=0A >=0A > diff --git a/meta/recipe=
s-core/dropbear/dropbear/localoptions.h=0A > b/meta/recipes-core/dropbea=
r/dropbear/localoptions.h=0A > new file mode 100644=0A > index 0000000..=
ec48c26=0A > --- /dev/null=0A > +++ b/meta/recipes-core/dropbear/dropbea=
r/localoptions.h=0A > @@ -0,0 +1,8 @@=0A > +/* Customize dropbear per de=
fault_options.h in the dropbear=0Aproject */=0A > +=0A > +/* Disable ins=
ecure ciphers */=0A > +#define DROPBEAR_TWOFISH256 0=0A > +#define DROPB=
EAR_TWOFISH128 0=0A > +#define DROPBEAR_ENABLE_CBC_MODE 0=0A > +#define=
 DROPBEAR_SHA1_HMAC 0=0A > +#define DROPBEAR_SHA1_96_HMAC 0=0A > --=0A >=
 2.7.2=0A >=0A >=0A >=0A > --=0A > _____________________________________=
__________=0A > Openembedded-core mailing list=0A > Openembedded-core@li=
sts.openembedded.org=0A >

--=_eb00b36b4c70dafa7ac47939d47588c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body>&gt;From: "Burton, Ross" <ross.burton@intel.com><br>&gt;To:=
 joseph-reynolds@charter.net<br>&gt;Cc: "openembedded-core@lists.openemb=
edded.org"<br>&gt;Sent: Wednesday September 12 2018 7:20:27AM<br>&gt;Sub=
ject: Re: [OE-core] [PATCH] disable medium-strength dropbear ssh ciphers=
<br>&gt;<br> &gt;Presumably this doesn't actually work as you're just ad=
ding a file to<br>=0A &gt;git without actually referring to it anywhere.=
<br></ross.burton@intel.com><div><ross.burton@intel.com>=0A &gt;</ross.b=
urton@intel.com></div><div><ross.burton@intel.com><br></ross.burton@inte=
l.com></div><div><ross.burton@intel.com></ross.burton@intel.com><ross.bu=
rton@intel.com><div>Thanks for your email.&nbsp; I am still =0Atrying to=
 get the Dropbear patch upstreamed.&nbsp; (This is my first patch, =0Aso=
 I am a bit of an open source noob.)<br></div><div><br></div><div>To =0A=
address your concern: Dropbear version 2018.76 and later build process=
 =0Aspecifically looks for the localoptions.h file as the way to customi=
ze =0Adropbear.&nbsp; (Note the&nbsp; 2017.75 and earlier versions use a=
 different =0Amechanism to customize.)&nbsp; See the Makefile.in file fo=
r details.<br></div><div><br></div><div>However,=0A now I am wondering i=
f patching Dropbear's default_options.h file would =0Abe a better way to=
 make this change.&nbsp; Adding a localoption.h file is the=0A way to cu=
stomize dropbear.&nbsp; But I want to change the *default* behavior=0A o=
f dropbear so that it uses the same encryption ciphers as OpenSSH.&nbsp;=
 I =0Athink patching default_options.h would be better way to accomplish=
 that =0Agoal.&nbsp; And that patch could be applied to the Dropbear pro=
ject itself.</div><div><br></div></ross.burton@intel.com></div><ross.bur=
ton@intel.com>=0A &gt;Ross<br>=0A &gt;<br>=0A &gt;On 7 September 2018 at=
 20:16, &lt;joseph-reynolds@charter.net&gt; wrote:<br>=0A &gt; This chan=
ges the Dropbear SSH server configuration so it will not<br>=0A &gt; acc=
ept medium-strength encryption ciphers including: CBC mode, MD5,<br>=0A=
 &gt; 96-bit MAC, and triple DES.<br>=0A &gt;<br>=0A &gt; Upstream-Statu=
s: Pending<br>=0A &gt;<br>=0A &gt; Signed-off-by: Joseph Reynolds &lt;jo=
seph-reynolds@charter.net&gt;<br>=0A &gt; ---<br>=0A &gt; meta/recipes-c=
ore/dropbear/dropbear/localoptions.h | 8 ++++++++<br>=0A &gt; 1 file cha=
nged, 8 insertions(+)<br>=0A &gt; create mode 100644 meta/recipes-core/d=
ropbear/dropbear/localoptions.h<br>=0A &gt;<br>=0A &gt; diff --git a/met=
a/recipes-core/dropbear/dropbear/localoptions.h<br>=0A &gt; b/meta/recip=
es-core/dropbear/dropbear/localoptions.h<br>=0A &gt; new file mode 10064=
4<br>=0A &gt; index 0000000..ec48c26<br>=0A &gt; --- /dev/null<br>=0A &g=
t; +++ b/meta/recipes-core/dropbear/dropbear/localoptions.h<br>=0A &gt;=
 @@ -0,0 +1,8 @@<br>=0A &gt; +/* Customize dropbear per default_options.=
h in the dropbear project */<br>=0A &gt; +<br>=0A &gt; +/* Disable insec=
ure ciphers */<br>=0A &gt; +#define DROPBEAR_TWOFISH256 0<br>=0A &gt; +#=
define DROPBEAR_TWOFISH128 0<br>=0A &gt; +#define DROPBEAR_ENABLE_CBC_MO=
DE 0<br>=0A &gt; +#define DROPBEAR_SHA1_HMAC 0<br>=0A &gt; +#define DROP=
BEAR_SHA1_96_HMAC 0<br>=0A &gt; --<br>=0A &gt; 2.7.2<br>=0A &gt;<br>=0A=
 &gt;<br>=0A &gt;<br>=0A &gt; --<br>=0A &gt; ___________________________=
____________________<br>=0A &gt; Openembedded-core mailing list<br>=0A &=
gt; Openembedded-core@lists.openembedded.org<br>=0A &gt; <a target=3D"_b=
lank" href=3D"http://lists.openembedded.org/mailman/listinfo/openembedde=
d-core<br">http://lists.openembedded.org/mailman/listinfo/openembedded-c=
ore<br>=0A /&gt; &gt;<br>=0A </a></ross.burton@intel.com></body></html>

--=_eb00b36b4c70dafa7ac47939d47588c9--
