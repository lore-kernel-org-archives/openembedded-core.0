Return-Path: <cjp256@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 61B046CA74
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 11:49:35 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id y6so1112769lbh.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 04:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=d6ASTchnqBkVDif5jld2YUrVdSEl5V14fy0XJNDwN44=;
	b=JPVrsCkXi6i74LpWVUVzZCdUo5h6JtLhVRaKZwBWBZUC9rlU1gGKIJyg6+Du3aKY5L
	Bh0DelQN+QfNfuAXf1ykes8xMI9Yzn+KIV0UKq0Yenh1wLPBvdYWEenEvFXjv3ke1Kt/
	L2icLxOFLM3y2OiC4Nqf10rKuHTQD6QkZNsfOhsZ5UE1/pto5nYxOUaGO1Ta/cQ54e6s
	XDVQzF5NLg4ZbKF1trEpafNslgxLsPN3ZzEeEUP21KCKK3tLnQ/rWgl51Bdj3J4NLaCx
	tJUDX8pJPLm9JlbzAJ98rnW8qNWrjqn9QrlYz67NXAMJnllVyxXEsGiXiuj2c4Hpxak5
	Wzwg==
MIME-Version: 1.0
X-Received: by 10.112.0.242 with SMTP id 18mr3209557lbh.18.1383133776227; Wed,
	30 Oct 2013 04:49:36 -0700 (PDT)
Received: by 10.114.181.41 with HTTP; Wed, 30 Oct 2013 04:49:36 -0700 (PDT)
In-Reply-To: <52701AE6.30106@linux.intel.com>
References: <1381882516-29599-1-git-send-email-cjp256@gmail.com>
	<5268DEE0.7000506@linux.intel.com>
	<CABZSBQepb=+J-OSGkD7Kt-u9sZU0eLJ+-NSqZS-np9tp6xc2RQ@mail.gmail.com>
	<20131029072729.GB6291@lpalcu-linux>
	<CABZSBQfM7hwgF7ZtmypBzJQoTGPObow59zADZdbnaEK-+YO-Jw@mail.gmail.com>
	<52701AE6.30106@linux.intel.com>
Date: Wed, 30 Oct 2013 07:49:36 -0400
Message-ID: <CABZSBQeq2Nh+K5X5q9CjZ8_ZUNg6x545wjXAuy268v6TPHi7+g@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: upgrade to 1.6.1
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
X-List-Received-Date: Wed, 30 Oct 2013 11:49:36 -0000
Content-Type: multipart/alternative; boundary=f46d042ac0e868b3cd04e9f3ed35

--f46d042ac0e868b3cd04e9f3ed35
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 29, 2013 at 4:30 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 10/29/2013 01:20 PM, Chris Patterson wrote:
>
>>
>>
>>
>> On Tue, Oct 29, 2013 at 3:27 AM, Laurentiu Palcu
>> <laurentiu.palcu@intel.com <mailto:laurentiu.palcu@intel.**com<laurentiu.palcu@intel.com>>>
>> wrote:
>>
>>     Hi Chris,
>>
>>     On Mon, Oct 28, 2013 at 07:54:51PM -0400, Chris Patterson wrote:
>>      >
>>      > I'm not terribly familiar with the nativesdk, and (foolishly)
>>     neglected to test
>>      > that.  However, I looked into it, and it looks like the
>>     relocatable_sdk.patch
>>      > affects a linker script that is no longer available.  I dropped
>>     the patch and
>>      > tested installing an oe-core sdk sysroot (via bitbake -c
>> populate_sdk
>>      > core-image-minimal) and qemu appears to work fine from within the
>> sdk
>>      > environment.
>>      >
>>      > I'm open to suggestions for further testing this upgrade
>>     (particularly a case
>>      > to cover what relocatable_sdk.patch was originally intended to
>>     resolve). I'm
>>      > certainly not the expert here, but am willing to help out.
>>      >
>>     To test this particular case, build meta-toolchain and install it in a
>>     different location than the default one. Then, just do a 'readelf -s"
>>     on any qemu binary and make sure the .interp section has a size of
>>     0x1000 bytes.
>>
>>     If it does, then it's ok to drop the patch. That patch was needed
>>     because qemu happened to use their own linker scripts and, in order to
>>     have the SDK relocatable, we needed to reseve space in the .interp
>>     section to squeeze the new path.
>>
>>
>> Thanks Laurentiu - I did validate that the interp section looks to be
>> 0x1000 bytes for the qemu-* binaries:
>>
>> $
>> /usr/local/oecore-x86_64/**sysroots/x86_64-oesdk-linux/**
>> usr/bin/qemu-system-arm
>> --version
>> QEMU emulator version 1.6.1, Copyright (c) 2003-2008 Fabrice Bellard
>>
>> $ readelf -S
>> /usr/local/oecore-x86_64/**sysroots/x86_64-oesdk-linux/**
>> usr/bin/qemu-system-arm
>>
>> There are 29 section headers, starting at offset 0x5a14b8:
>>
>> Section Headers:
>>    [Nr] Name              Type             Address           Offset
>>         Size              EntSize          Flags  Link  Info  Align
>>    [ 0]                   NULL             0000000000000000  00000000
>>         0000000000000000  0000000000000000           0     0     0
>>    [ 1] .interp           PROGBITS         0000000000000270  00000270
>>         0000000000001000  0000000000000000   A       0     0     1
>>    [ 2] .note.ABI-tag     NOTE             0000000000001270  00001270
>>         0000000000000020  0000000000000000   A       0     0     4
>>    [ 3] .note.gnu.build-i NOTE             0000000000001290  00001290
>> ...
>>
>> If anyone has any other suggestions to test, I will gladly attempt them
>> before posting a v2.
>>
>>
> Your last message said you tested core-image-minimal, did you do any
> testing with a graphical image like core-image sato?  We really apperciate
> the work you put in here.
>
>
I built core-image-sato for qemuarm and it appears to work fine.  Are there
any other typical methods/scripts which invoke nativesdk-qemu or
qemu-native besides runqemu?  runqemu works fine for qemu-native, but
runqemu doesn't work for me within the sdk (missing python fnctl module
dependency).  Instead I have tested nativesdk-qemu by directly invoking
qemu-*.

Thanks


> Thanks
>         Sau!
>
>  Cheers!
>> -Chris
>>
>

--f46d042ac0e868b3cd04e9f3ed35
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Oct 29, 2013 at 4:30 PM, Saul Wold <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com<=
/a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"im">On 10/2=
9/2013 01:20 PM, Chris Patterson wrote:<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"im">
<br>
<br>
<br>
On Tue, Oct 29, 2013 at 3:27 AM, Laurentiu Palcu<br></div><div><div class=
=3D"h5">
&lt;<a href=3D"mailto:laurentiu.palcu@intel.com" target=3D"_blank">laurenti=
u.palcu@intel.com</a> &lt;mailto:<a href=3D"mailto:laurentiu.palcu@intel.co=
m" target=3D"_blank">laurentiu.palcu@intel.<u></u>com</a>&gt;&gt; wrote:<br=
>
<br>
=A0 =A0 Hi Chris,<br>
<br>
=A0 =A0 On Mon, Oct 28, 2013 at 07:54:51PM -0400, Chris Patterson wrote:<br=
>
=A0 =A0 =A0&gt;<br>
=A0 =A0 =A0&gt; I&#39;m not terribly familiar with the nativesdk, and (fool=
ishly)<br>
=A0 =A0 neglected to test<br>
=A0 =A0 =A0&gt; that. =A0However, I looked into it, and it looks like the<b=
r>
=A0 =A0 relocatable_sdk.patch<br>
=A0 =A0 =A0&gt; affects a linker script that is no longer available. =A0I d=
ropped<br>
=A0 =A0 the patch and<br>
=A0 =A0 =A0&gt; tested installing an oe-core sdk sysroot (via bitbake -c po=
pulate_sdk<br>
=A0 =A0 =A0&gt; core-image-minimal) and qemu appears to work fine from with=
in the sdk<br>
=A0 =A0 =A0&gt; environment.<br>
=A0 =A0 =A0&gt;<br>
=A0 =A0 =A0&gt; I&#39;m open to suggestions for further testing this upgrad=
e<br>
=A0 =A0 (particularly a case<br>
=A0 =A0 =A0&gt; to cover what relocatable_sdk.patch was originally intended=
 to<br>
=A0 =A0 resolve). I&#39;m<br>
=A0 =A0 =A0&gt; certainly not the expert here, but am willing to help out.<=
br>
=A0 =A0 =A0&gt;<br>
=A0 =A0 To test this particular case, build meta-toolchain and install it i=
n a<br>
=A0 =A0 different location than the default one. Then, just do a &#39;reade=
lf -s&quot;<br>
=A0 =A0 on any qemu binary and make sure the .interp section has a size of<=
br>
=A0 =A0 0x1000 bytes.<br>
<br>
=A0 =A0 If it does, then it&#39;s ok to drop the patch. That patch was need=
ed<br>
=A0 =A0 because qemu happened to use their own linker scripts and, in order=
 to<br>
=A0 =A0 have the SDK relocatable, we needed to reseve space in the .interp<=
br>
=A0 =A0 section to squeeze the new path.<br>
<br>
<br>
Thanks Laurentiu - I did validate that the interp section looks to be<br>
0x1000 bytes for the qemu-* binaries:<br>
<br>
$<br>
/usr/local/oecore-x86_64/<u></u>sysroots/x86_64-oesdk-linux/<u></u>usr/bin/=
qemu-system-arm<br>
--version<br>
QEMU emulator version 1.6.1, Copyright (c) 2003-2008 Fabrice Bellard<br>
<br>
$ readelf -S<br>
/usr/local/oecore-x86_64/<u></u>sysroots/x86_64-oesdk-linux/<u></u>usr/bin/=
qemu-system-arm<br>
<br>
There are 29 section headers, starting at offset 0x5a14b8:<br>
<br>
Section Headers:<br>
=A0 =A0[Nr] Name =A0 =A0 =A0 =A0 =A0 =A0 =A0Type =A0 =A0 =A0 =A0 =A0 =A0 Ad=
dress =A0 =A0 =A0 =A0 =A0 Offset<br>
=A0 =A0 =A0 =A0 Size =A0 =A0 =A0 =A0 =A0 =A0 =A0EntSize =A0 =A0 =A0 =A0 =A0=
Flags =A0Link =A0Info =A0Align<br>
=A0 =A0[ 0] =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NULL =A0 =A0 =A0 =A0 =A0 =
=A0 0000000000000000 =A000000000<br>
=A0 =A0 =A0 =A0 0000000000000000 =A00000000000000000 =A0 =A0 =A0 =A0 =A0 0 =
=A0 =A0 0 =A0 =A0 0<br>
=A0 =A0[ 1] .interp =A0 =A0 =A0 =A0 =A0 PROGBITS =A0 =A0 =A0 =A0 0000000000=
000270 =A000000270<br>
=A0 =A0 =A0 =A0 0000000000001000 =A00000000000000000 =A0 A =A0 =A0 =A0 0 =
=A0 =A0 0 =A0 =A0 1<br>
=A0 =A0[ 2] .note.ABI-tag =A0 =A0 NOTE =A0 =A0 =A0 =A0 =A0 =A0 000000000000=
1270 =A000001270<br>
=A0 =A0 =A0 =A0 0000000000000020 =A00000000000000000 =A0 A =A0 =A0 =A0 0 =
=A0 =A0 0 =A0 =A0 4<br>
=A0 =A0[ 3] .note.gnu.build-i NOTE =A0 =A0 =A0 =A0 =A0 =A0 0000000000001290=
 =A000001290<br>
...<br>
<br>
If anyone has any other suggestions to test, I will gladly attempt them<br>
before posting a v2.<br>
<br>
</div></div></blockquote>
<br>
Your last message said you tested core-image-minimal, did you do any testin=
g with a graphical image like core-image sato? =A0We really apperciate the =
work you put in here.<br>
<br></blockquote><div><br>I built core-image-sato for qemuarm and it appear=
s to work fine.=A0 Are there any other typical methods/scripts which invoke=
 nativesdk-qemu or qemu-native besides runqemu?=A0 runqemu works fine for q=
emu-native, but runqemu doesn&#39;t work for me within the sdk (missing pyt=
hon fnctl module dependency).=A0 Instead I have tested nativesdk-qemu by di=
rectly invoking qemu-*.<br>
<br></div><div>Thanks<br></div><div>=A0<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
Thanks<br>
=A0 =A0 =A0 =A0 Sau!<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers!<br>
-Chris<br>
</blockquote>
</blockquote></div><br></div></div>

--f46d042ac0e868b3cd04e9f3ed35--
