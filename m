Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE2FFA374B
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 12:57:40 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.72735.1726232253401100327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Sep 2024 05:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout05.t-online.de (Postfix) with SMTP id EBB8220DC;
	Fri, 13 Sep 2024 14:57:22 +0200 (CEST)
Received: from [192.168.178.67] ([84.154.173.20]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sp5rV-1rTzRw0; Fri, 13 Sep 2024 14:57:21 +0200
Date: Fri, 13 Sep 2024 14:59:05 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH] mesa: add support for rusticl
To: =?iso-8859-1?b?QvZzevZybelueWkgWm9sdOFu?= <zboszor@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <HE5RJS.ZELCTN0DIQK32@t-online.de>
In-Reply-To: <b3c52dd5-e19a-442a-9da6-7ad1857c1e0c@gmail.com>
References: <20240908172311.3773048-1-f_l_k@t-online.de>
	<CANNYZj_aLfFFe14-YNYfGt5T05dRb_-N7NPSk3Tx5-j09xRtrg@mail.gmail.com>
	<HSHJJS.OO3X80OW2KGA@t-online.de>
	<17F4C79C2431BD42.10184@lists.openembedded.org>
	<b3c52dd5-e19a-442a-9da6-7ad1857c1e0c@gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-6Pjxgjzg+ZbhB0MYRGde"
X-TOI-EXPURGATEID: 150726::1726232241-E0FF758A-04F587CA/0/0 CLEAN NORMAL
X-TOI-MSGID: 3e046db7-234f-43ed-8e23-1abbf2589dbc
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 12:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204482

--=-6Pjxgjzg+ZbhB0MYRGde
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,
thanks for the feedback. Yes, I accidentally added the patch I made for=20
mesa 24.2.1. Currently I have it like this, which should also work:

diff --git a/src/gallium/frontends/rusticl/meson.build=20
b/src/gallium/frontends/rusticl/meson.build
index 84df0a9edb9..20459f73993 100644
--- a/src/gallium/frontends/rusticl/meson.build
+++ b/src/gallium/frontends/rusticl/meson.build
@@ -122,6 +122,7 @@ endif

 rusticl_bindgen_c_args =3D [
   '-fno-builtin-malloc',
+  '-I@include@', '-I@include_cpp@', '-I@include_cpp_target_sys@',
 ]

 cl_c_args =3D [
--=20

One assumption on the shader issue. intel_clc is currently added only=20
for x86-64. If you are building for another platform intel_clc is not=20
installed for mesa-native, but required for 'iris'.

Changing this line:
GALLIUMDRIVERS:append =3D"${@bb.utils.contains_any('PACKAGECONFIG',=20
'opencl-rusticl opencl-clover', ',iris', '', d)}"
to:
GALLIUMDRIVERS:append:x86-64=20
=3D"${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl=20
opencl-clover', ',iris', '', d)}"

might remove the need to disable raytracing in EXTRA_OEMESON

Alternatively also removing x86-64 from these lines:
EXTRA_OEMESON:append:class-target:x86-64 =3D "=20
${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl=20
opencl-clover', '-Dintel-clc=3Dsystem', '', d)}"
EXTRA_OEMESON:append:class-native:x86-64 =3D "=20
${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl=20
opencl-clover', '-Dintel-clc=3Denabled -Dinstall-intel-clc=3Dtrue=20
-Dgallium-rusticl=3Dfalse', '', d)}"

might help, but I'm unsure if intel_clc would be of any use apart from=20
x86-64


On Fri, Sep 13 2024 at 12:43:46 PM +02:00:00, B=F6sz=F6rm=E9nyi Zolt=E1n=20
<zboszor@gmail.com> wrote:
> 2024. 09. 13. 12:40 keltez=E9ssel, Zoltan Boszormenyi via=20
> lists.openembedded.org =EDrta:
>> 2024. 09. 09. 11:45 keltez=E9ssel, Markus Volk via=20
>> lists.openembedded.org =EDrta:
>>> On Mon, Sep 9 2024 at 10:46:59 AM +02:00:00, Alexander Kanavin=20
>>> <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> =7F=7Fwrote:
>>>> This does need to be properly looked into, there's probably a=20
>>>> better patch possible, =7F=7F=7For a build setting we're missing, or a=
t=20
>>>> least an upstream ticket to be filed. It's not =7F=7F=7Fa good patch=20
>>>> when it says 'workaround' and doesn't explain the issue and the=20
>>>> fix.
>>>=20
>>> Fully agree. This is ugly as hell. Just a quick and dirty hack to=20
>>> get things working =7F=7F(which is always a good starting point) but by=
=20
>>> no means a solution for oe-core. Thats =7F=7Fwhy I marked it RFC
>>=20
>> Don't call it a "workaround" then.
>> Call it "pass in recipe-sysroot include directories" because
>> that's what this patch does combined with the mesa.inc changes.
>=20
> The underlying problem seems to be that bindgen does not
> seem to pick up CFLAGS or CPPFLAGS automatically, so it needs
> the extra -I options passed in under Yocto to look for headers
> in the correct places.
>=20
>>=20
>> Though it's not complete in my testing.
>> I needed this patch against 24.2.2 so I could build Mesa Rusticl,
>> plus EXTRA_OEMESON +=3D "-Dintel-rt=3Ddisabled" in my bbappend
>> because the iris driver failed to build otherwise, complaining for
>> every generated file from *.cl about "shader not available, consider
>> installing libclc" or something like that, eventually failing the=20
>> build.
>>=20
>> diff --git a/src/gallium/frontends/rusticl/meson.build=20
>> =7Fb/src/gallium/frontends/rusticl/meson.build
>> index eef09d8f01e..efac4cab964 100644
>> --- a/src/gallium/frontends/rusticl/meson.build
>> +++ b/src/gallium/frontends/rusticl/meson.build
>> @@ -146,6 +146,7 @@ rusticl_opencl_bindings_rs =3D rust.bindgen(
>>      rusticl_bindgen_c_args,
>>      pre_args,
>>      cl_c_args,
>> +   '-I@include@', '-I@include_cpp@', '-I@include_cpp_target_sys@'
>>    ],
>>    args : [
>>      rusticl_bindgen_args,
>> @@ -190,6 +191,7 @@ rusticl_llvm_bindings_rs =3D rust.bindgen(
>>    c_args : [
>>      rusticl_bindgen_c_args,
>>      pre_args,
>> +   '-I@include@', '-I@include_cpp@', '-I@include_cpp_target_sys@'
>>    ],
>>    dependencies : [
>>      dep_clang,
>>=20
>>=20
>>>=20
>>>=20
>>>=20
>>=20
>>=20
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#204478):=20
>> <https://lists.openembedded.org/g/openembedded-core/message/204478>
>> Mute This Topic:=20
>> <https://lists.openembedded.org/mt/108340502/3617728>
>> Group Owner: openembedded-core+owner@lists.openembedded.org=20
>> <mailto:openembedded-core+owner@lists.openembedded.org>
>> Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-core/unsub>=20
>> [zboszor@gmail.com <mailto:zboszor@gmail.com>]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20
>=20


--=-6Pjxgjzg+ZbhB0MYRGde
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Hi,</div><div>thanks for the feedb=
ack. Yes, I accidentally added the patch I made for mesa 24.2.1. Currently =
I have it like this, which should also work:</div><div><br></div><div><div>=
diff --git a/src/gallium/frontends/rusticl/meson.build b/src/gallium/fronte=
nds/rusticl/meson.build</div><div>index 84df0a9edb9..20459f73993 100644</di=
v><div>--- a/src/gallium/frontends/rusticl/meson.build</div><div>+++ b/src/=
gallium/frontends/rusticl/meson.build</div><div>@@ -122,6 +122,7 @@ endif</=
div><div>&nbsp;</div><div>&nbsp;rusticl_bindgen_c_args =3D [</div><div>&nbs=
p; &nbsp;'-fno-builtin-malloc',</div><div>+ &nbsp;'-I@include@', '-I@includ=
e_cpp@', '-I@include_cpp_target_sys@',</div><div>&nbsp;]</div><div>&nbsp;</=
div><div>&nbsp;cl_c_args =3D [</div><div>--&nbsp;</div></div><div><br></div=
><div>One assumption on the shader issue. intel_clc is currently added only=
 for x86-64. If you are building for another platform intel_clc is not inst=
alled for mesa-native, but required for 'iris'.</div><div><br></div><div>Ch=
anging this line:</div><div>GALLIUMDRIVERS:append =3D"${@bb.utils.contains_=
any('PACKAGECONFIG', 'opencl-rusticl opencl-clover', ',iris', '', d)}"</div=
><div>to:</div><div>GALLIUMDRIVERS:append:x86-64 =3D"${@bb.utils.contains_a=
ny('PACKAGECONFIG', 'opencl-rusticl opencl-clover', ',iris', '', d)}"</div>=
<div><br></div><div>might remove the need to disable raytracing in EXTRA_OE=
MESON</div><div><br></div><div>Alternatively also removing x86-64 from thes=
e lines:</div><div><div>EXTRA_OEMESON:append:class-target:x86-64 =3D " ${@b=
b.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl opencl-clover', '-Din=
tel-clc=3Dsystem', '', d)}"</div><div>EXTRA_OEMESON:append:class-native:x86=
-64 =3D " ${@bb.utils.contains_any('PACKAGECONFIG', 'opencl-rusticl opencl-=
clover', '-Dintel-clc=3Denabled -Dinstall-intel-clc=3Dtrue -Dgallium-rustic=
l=3Dfalse', '', d)}"</div></div><div><br></div><div>might help, but I'm uns=
ure if intel_clc would be of any use apart from x86-64</div><div><br></div>=
</div><div id=3D"geary-quote" dir=3D"auto"><br>On Fri, Sep 13 2024 at 12:43=
:46 PM +02:00:00, B=F6sz=F6rm=E9nyi Zolt=E1n &lt;zboszor@gmail.com&gt; wrot=
e:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-spa=
ce: break-spaces;">2024. 09. 13. 12:40 keltez=E9ssel, Zoltan Boszormenyi vi=
a lists.openembedded.org =EDrta:
<blockquote>2024. 09. 09. 11:45 keltez=E9ssel, Markus Volk via lists.openem=
bedded.org =EDrta:
<blockquote>On Mon, Sep 9 2024 at 10:46:59 AM +02:00:00, Alexander Kanavin =
&lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt=
; =7F=7Fwrote:
<blockquote>This does need to be properly looked into, there's probably a b=
etter patch possible, =7F=7F=7For a build setting we're missing, or at leas=
t an upstream ticket to be filed. It's not =7F=7F=7Fa good patch when it sa=
ys 'workaround' and doesn't explain the issue and the fix.
</blockquote>
Fully agree. This is ugly as hell. Just a quick and dirty hack to get thing=
s working =7F=7F(which is always a good starting point) but by no means a s=
olution for oe-core. Thats =7F=7Fwhy I marked it RFC
</blockquote>
Don't call it a "workaround" then.
Call it "pass in recipe-sysroot include directories" because
that's what this patch does combined with the mesa.inc changes.
</blockquote>
The underlying problem seems to be that bindgen does not
seem to pick up CFLAGS or CPPFLAGS automatically, so it needs
the extra -I options passed in under Yocto to look for headers
in the correct places.

<blockquote>
Though it's not complete in my testing.
I needed this patch against 24.2.2 so I could build Mesa Rusticl,
plus EXTRA_OEMESON +=3D "-Dintel-rt=3Ddisabled" in my bbappend
because the iris driver failed to build otherwise, complaining for
every generated file from *.cl about "shader not available, consider
installing libclc" or something like that, eventually failing the build.

diff --git a/src/gallium/frontends/rusticl/meson.build =7Fb/src/gallium/fro=
ntends/rusticl/meson.build
index eef09d8f01e..efac4cab964 100644
--- a/src/gallium/frontends/rusticl/meson.build
+++ b/src/gallium/frontends/rusticl/meson.build
@@ -146,6 +146,7 @@ rusticl_opencl_bindings_rs =3D rust.bindgen(
&nbsp;&nbsp;&nbsp;&nbsp; rusticl_bindgen_c_args,
&nbsp;&nbsp;&nbsp;&nbsp; pre_args,
&nbsp;&nbsp;&nbsp;&nbsp; cl_c_args,
+&nbsp;&nbsp; '-I@include@', '-I@include_cpp@', '-I@include_cpp_target_sys@=
'
&nbsp;&nbsp; ],
&nbsp;&nbsp; args : [
&nbsp;&nbsp;&nbsp;&nbsp; rusticl_bindgen_args,
@@ -190,6 +191,7 @@ rusticl_llvm_bindings_rs =3D rust.bindgen(
&nbsp;&nbsp; c_args : [
&nbsp;&nbsp;&nbsp;&nbsp; rusticl_bindgen_c_args,
&nbsp;&nbsp;&nbsp;&nbsp; pre_args,
+&nbsp;&nbsp; '-I@include@', '-I@include_cpp@', '-I@include_cpp_target_sys@=
'
&nbsp;&nbsp; ],
&nbsp;&nbsp; dependencies : [
&nbsp;&nbsp;&nbsp;&nbsp; dep_clang,


<blockquote>


</blockquote>

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#204478): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/204478">https://lists.openembedded.org/g/openembedd=
ed-core/message/204478</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108340502/361=
7728">https://lists.openembedded.org/mt/108340502/3617728</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:zboszor@gmail.com">zboszor@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</blockquote>
</div></blockquote></div>
--=-6Pjxgjzg+ZbhB0MYRGde--


