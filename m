Return-Path: <joseph-reynolds@charter.net>
Received: from mtaout003-public.msg.strl.va.charter.net
	(mtaout003-public.msg.strl.va.charter.net [68.114.190.28])
	by mail.openembedded.org (Postfix) with ESMTP id 5000E745ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 19:45:44 +0000 (UTC)
Received: from impout001 ([68.114.189.16]) by mtaout003.msg.strl.va.charter.net
	(InterMail vM.9.00.023.01 201-2473-194) with ESMTP id
	<20180913194545.BUXR7355.mtaout003.msg.strl.va.charter.net@impout001>;
	Thu, 13 Sep 2018 14:45:45 -0500
Received: from localhost ([68.114.5.181]) by impout001 with charter.net
	id b7ll1y0053uLLH8017llTy; Thu, 13 Sep 2018 14:45:45 -0500
X-Authority-Analysis: v=2.2 cv=ffHd8wYF c=1 sm=1 tr=0
	a=VBTjg2AHeJkaqYfRu568yw==:117 a=VBTjg2AHeJkaqYfRu568yw==:17
	a=fJkqCKB1fTMA:10 a=x7bEGLp0ZPQA:10 a=hOpmn2quAAAA:8 a=Q4-j1AaZAAAA:8
	a=NEAV23lmAAAA:8 a=_PVZOzHT9zynZaEzAOEA:9 a=QEXdDO2ut3YA:10
	a=QyXUC8HyAAAA:8
	a=YShdRTrQ18BYbtu_:21 a=_W_S_7VecoQA:10 a=GyA-uvUxXSCciAkwuKQO:22
	a=9H3Qd4_ONW2Ztcrla5EB:22
Message-ID: <b7ll1y0053uLLH8017llTy@charter.net>
From: joseph-reynolds@charter.net
To: "'Burton, Ross'" <ross.burton@intel.com>
X-Mailer: Atmail 7.1.1.13434
X-Originating-IP: [129.42.161.36]
Date: Thu, 13 Sep 2018 14:45:45 -0500
MIME-Version: 1.0
Cc: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] dropbear: disable medium-strength ssh ciphers
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
X-List-Received-Date: Thu, 13 Sep 2018 19:45:44 -0000
Content-Type: multipart/alternative;
	boundary="=_b8e0205fcee86ebac26df4da80e6b553"

--=_b8e0205fcee86ebac26df4da80e6b553
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

>From: "Burton, Ross" =0A>To: joseph-reynolds@charter.net=0A>Cc: "openem=
bedded-core@lists.openembedded.org"=0A>Sent: Thursday September 13 2018=
 11:00:26AM=0A>Subject: Re: [OE-core] [PATCH v2] dropbear: disable mediu=
m-strength=0Assh ciphers=0A>=0A >This still can't be actually used, beca=
use dropbear won't be looking=0A >in the recipe folder and nothing puts=
 that file into the source=0Atree.=0A >Put a #error in it if you don't b=
elieve me. :)=0A=0AThanks for pointing that out. I had conflated the OE=
 & Yocto recipes,=0Athen forgot to include the recipe change in my patch=
. My home project=0Ais actually https://github.com/openbmc/openbmc, so I=
 set out to=0Aupstream this change to Yocto/Poky, OE, and Dropbear. Than=
ks for your=0Apatience, as this is my first attempt to upstream.=0A=0AMy=
 second issue is creating a correct patch. I used git format-patch=0AHEA=
D^ and then cut/paste the result into my web-based email reader.=0AThe p=
atch appears correct, but the automation says my patch is=0Amal-formed.=
 I am still trying to enable sending plain-text email from=0Amy shell en=
vironment.=0A=0AFinally, I want to change my approach. I had been updati=
ng the=0Adropbear localoptions.h file to customize Dropbear's behavior.=
 But I=0Areally want to change Dropbear's default behavior for everyone,=
 which=0Ameans I should update default_options.h and leave localoptions.=
h=0Aalone. I plan to create a pull request to update the Dropbear projec=
t=0Adefault_options.h file, and a patch for openembedded-core to change=
=0Athe dropbear_2018.76.bb recipe to pick up the Dropbear patch.=0A=0A-=
 Joseph=0A=0A>Ross>=0A >=0A >On 12 September 2018 at 22:56,  wrote:=0A >=
> This changes the Dropbear SSH server configuration so it will not=0A >=
> accept medium-strength encryption ciphers including: CBC mode,=0AMD5,=
=0A >> 96-bit MAC, and triple DES. This is consistent with the default=
=0A >> supported OpenSSH ciphers.=0A >>=0A >> Upstream-Status: Pending=
=0A >>=0A >> Signed-off-by: Joseph Reynolds =0A >> ---=0A >> meta/recipe=
s-core/dropbear/dropbear/localoptions.h | 8 ++++++++=0A >> 1 file change=
d, 8 insertions(+)=0A >> create mode 100644=0Ameta/recipes-core/dropbear=
/dropbear/localoptions.h=0A >>=0A >> diff --git a/meta/recipes-core/drop=
bear/dropbear/localoptions.h=0A >> b/meta/recipes-core/dropbear/dropbear=
/localoptions.h=0A >> new file mode 100644=0A >> index 0000000..ec48c26=
=0A >> --- /dev/null=0A>> +++ b/meta/recipes-core/dropbear/dropbear/loca=
loptions.h=0A >> @@ -0,0 +1,8 @@=0A >> +/* Customize dropbear per defaul=
t_options.h in the dropbear=0Aproject */=0A >> +=0A >> +/* Disable insec=
ure ciphers */=0A >> +#define DROPBEAR_TWOFISH256 0=0A >> +#define DROPB=
EAR_TWOFISH128 0=0A >> +#define DROPBEAR_ENABLE_CBC_MODE 0=0A >> +#defin=
e DROPBEAR_SHA1_HMAC 0=0A >> +#define DROPBEAR_SHA1_96_HMAC 0=0A >> --=
=0A >> 1.8.3.1=0A >>=0A >>=0A >> --=0A

--=_b8e0205fcee86ebac26df4da80e6b553
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body>&gt;From: "Burton, Ross" <ross.burton@intel.com><br>&gt;To:=
 joseph-reynolds@charter.net<br>&gt;Cc: "openembedded-core@lists.openemb=
edded.org"<br>&gt;Sent: Thursday September 13 2018 11:00:26AM<br>&gt;Sub=
ject: Re: [OE-core] [PATCH v2] dropbear: disable medium-strength ssh cip=
hers<br>&gt;<br> &gt;This still can't be actually used, because dropbear=
 won't be looking<br>=0A &gt;in the recipe folder and nothing puts that=
 file into the source tree.<br>=0A &gt;Put a #error in it if you don't b=
elieve me. :)<br></ross.burton@intel.com><br><div><div>Thanks for pointi=
ng that out.&nbsp; I had conflated the OE &amp; Yocto recipes, then forg=
ot to include the recipe change in my patch.&nbsp; My home project is ac=
tually https://github.com/openbmc/openbmc, so I set out to upstream this=
 change to Yocto/Poky, OE, and Dropbear.&nbsp; Thanks for your patience,=
 as this is my first attempt to upstream.<br></div><div><br></div><div>M=
y second issue is creating a correct patch.&nbsp; I used&nbsp; git forma=
t-patch HEAD^&nbsp; and then cut/paste the result into my web-based emai=
l reader.&nbsp; The patch appears correct, but the automation says my pa=
tch is mal-formed.&nbsp; I am still trying to enable sending plain-text=
 email from my shell environment.<br></div></div><div><br></div><div>Fin=
ally, I want to change my approach.&nbsp; I had been updating the dropbe=
ar localoptions.h file to customize Dropbear's behavior.&nbsp; But I rea=
lly want to change Dropbear's default behavior for everyone, which means=
 I should update default_options.h and leave localoptions.h alone.&nbsp;=
 I plan to create a pull request to update the Dropbear project default_=
options.h file, and a patch for openembedded-core to change the dropbear=
_2018.76.bb recipe to pick up the Dropbear patch.<br></div><div><br></di=
v><div>- Joseph<br></div><div><br></div><div><ross.burton@intel.com>&gt;=
Ross</ross.burton@intel.com></div><div>&gt;<br><ross.burton@intel.com></=
ross.burton@intel.com></div><ross.burton@intel.com>=0A &gt;<br>=0A &gt;O=
n 12 September 2018 at 22:56, &lt;joseph-reynolds@charter.net&gt; wrote:=
<br>=0A &gt;&gt; This changes the Dropbear SSH server configuration so i=
t will not<br>=0A &gt;&gt; accept medium-strength encryption ciphers inc=
luding: CBC mode, MD5,<br>=0A &gt;&gt; 96-bit MAC, and triple DES. This=
 is consistent with the default<br>=0A &gt;&gt; supported OpenSSH cipher=
s.<br>=0A &gt;&gt;<br>=0A &gt;&gt; Upstream-Status: Pending<br>=0A &gt;&=
gt;<br>=0A &gt;&gt; Signed-off-by: Joseph Reynolds &lt;joseph-reynolds@c=
harter.net&gt;<br>=0A &gt;&gt; ---<br>=0A &gt;&gt; meta/recipes-core/dro=
pbear/dropbear/localoptions.h | 8 ++++++++<br>=0A &gt;&gt; 1 file change=
d, 8 insertions(+)<br>=0A &gt;&gt; create mode 100644 meta/recipes-core/=
dropbear/dropbear/localoptions.h<br>=0A &gt;&gt;<br>=0A &gt;&gt; diff --=
git a/meta/recipes-core/dropbear/dropbear/localoptions.h<br>=0A &gt;&gt;=
 b/meta/recipes-core/dropbear/dropbear/localoptions.h<br>=0A &gt;&gt; ne=
w file mode 100644<br>=0A &gt;&gt; index 0000000..ec48c26<br>=0A &gt;&gt=
; --- /dev/null<br>&gt;&gt; +++ b/meta/recipes-core/dropbear/dropbear/lo=
caloptions.h<br>=0A &gt;&gt; @@ -0,0 +1,8 @@<br>=0A &gt;&gt; +/* Customi=
ze dropbear per default_options.h in the dropbear project */<br>=0A &gt;=
&gt; +<br>=0A &gt;&gt; +/* Disable insecure ciphers */<br>=0A &gt;&gt; +=
#define DROPBEAR_TWOFISH256 0<br>=0A &gt;&gt; +#define DROPBEAR_TWOFISH1=
28 0<br>=0A &gt;&gt; +#define DROPBEAR_ENABLE_CBC_MODE 0<br>=0A &gt;&gt;=
 +#define DROPBEAR_SHA1_HMAC 0<br>=0A &gt;&gt; +#define DROPBEAR_SHA1_96=
_HMAC 0<br>=0A &gt;&gt; --<br>=0A &gt;&gt; 1.8.3.1<br>=0A &gt;&gt;<br>=
=0A &gt;&gt;<br>=0A &gt;&gt; --<br><a target=3D"_blank" href=3D"http://l=
ists.openembedded.org/mailman/listinfo/openembedded-core<br"><br>=0A </a=
></ross.burton@intel.com></body></html>

--=_b8e0205fcee86ebac26df4da80e6b553--
