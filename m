Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18439C56205
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 15:51:10 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22472.1786031469275100271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 08:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=b6Ysi9K7;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [10.0.5.46] (unknown [70.37.26.60])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0796920B710C;
	Thu,  6 Aug 2026 08:50:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0796920B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1786031447;
	bh=doknkFkpbWVfsKOoLGmvucW+dQjbDqZ6HkbF6+v6Qyo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=b6Ysi9K7SDP+giVMljpHAigcYT/Jh3nj08K8Y68nJLM7ofwxHwz0sRWvvRX200BaX
	 G4z+Z4b72uPeeM9INy2ioMmLJu48jbL/8kipHqUqhSHNI1nVMkCRLD2XhpDd7eDqof
	 jmRj8BAyA201K4AXFhD0FLhA8hHrvX2cbHhZJ3xo=
Content-Type: multipart/alternative;
 boundary="------------dyT7pKAXs8H4TJLL0BziuSTH"
Message-ID: <12ac583b-cb68-48ca-9fdc-28216d706713@linux.microsoft.com>
Date: Thu, 6 Aug 2026 09:51:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/4] python_pep517.bbclass: always export
 _PYTHON_HOST_PLATFORM for wheel tag
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20260804220456.2342710-1-alhe@linux.microsoft.com>
 <20260804220456.2342710-3-alhe@linux.microsoft.com>
 <a863f3a0f5304826bf15afe3fb0767d43d378477.camel@linuxfoundation.org>
Content-Language: en-US
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <a863f3a0f5304826bf15afe3fb0767d43d378477.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 15:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242953

This is a multi-part message in MIME format.
--------------dyT7pKAXs8H4TJLL0BziuSTH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


On 8/6/2026 6:26 AM, Richard Purdie via lists.openembedded.org wrote:
> On Tue, 2026-08-04 at 22:04 +0000, Alejandro Hernandez Samaniego via li=
sts.openembedded.org wrote:
>> python distutils/sysconfig.get_platform() falls back to
>> distutils.util.get_platform() when the _PYTHON_HOST_PLATFORM
>> environment variable is unset, and returns the *build host* arch.
>> The result is baked into the produced wheel's filename
>> (pkg-<ver>-cp3XX-cp3XX-<PLAT>.whl) and its <pkg>.dist-info/WHEEL
>> metadata.
>>
>> Without this export, extension-module wheels tag themselves with
>> whichever arch the autobuilder worker happens to have, which makes
>> the resulting rpm non-reproducible across mixed-arch autobuilder
>> pools.
>>
>> Since python 3.14 + wheel >=3D0.44 also rejects wheels with an empty
>> platform tag ("Bad wheel filename"), the value has to be non-empty
>> in every class scope. HOST_ARCH is class-scoped by bitbake
>> (target/native/cross/nativesdk), so `linux-${HOST_ARCH}` covers
>> every case with a single unconditional assignment. Setting per-class
>> overrides to "" (as an earlier draft did) trips the wheel filename
>> check and must be avoided.
>>
>> Pure-python wheels ignore _PYTHON_HOST_PLATFORM and remain tagged
>> "any", so this change only affects wheels that ship compiled
>> extensions (cffi, cryptography, numpy, bcrypt, markupsafe, psutil,
>> rpds-py, websockets, ...).
>>
>> Assisted-by: AI - OpenAI
>> Signed-off-by: Alejandro Hernandez<alhe@linux.microsoft.com>
>> ---
>>  =C2=A0meta/classes-recipe/python_pep517.bbclass | 16 ++++++++++++++++
>>  =C2=A01 file changed, 16 insertions(+)
>>
>> diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classes-=
recipe/python_pep517.bbclass
>> index d6246af5c2..06b23d3cba 100644
>> --- a/meta/classes-recipe/python_pep517.bbclass
>> +++ b/meta/classes-recipe/python_pep517.bbclass
>> @@ -30,6 +30,22 @@ PEP517_INSTALL_PYTHON:class-native =3D "nativepytho=
n3"
>>  =C2=A0# pypa/installer option to control the bytecode compilation
>>  =C2=A0INSTALL_WHEEL_COMPILE_BYTECODE ?=3D "--compile-bytecode=3D0"
>>  =20
>> +# Force the wheel's platform tag to reflect the target machine rather=
 than the
>> +# build host. Without this, extension-module wheels bake the build ho=
st's arch
>> +# (e.g. linux_x86_64) into <pkg>.dist-info/WHEEL via distutils/syscon=
fig's
>> +# get_platform(), which breaks reproducibility across autobuilder wor=
kers of
>> +# different architectures. Pure-python wheels ignore this variable an=
d remain
>> +# tagged "any".
>> +#
>> +# HOST_ARCH is class-scoped by bitbake:
>> +#=C2=A0=C2=A0 - target:=C2=A0=C2=A0=C2=A0=C2=A0 HOST_ARCH =3D=3D TARG=
ET_ARCH (reproducible across workers)
>> +#=C2=A0=C2=A0 - native:=C2=A0=C2=A0=C2=A0=C2=A0 HOST_ARCH =3D=3D BUIL=
D_ARCH=C2=A0 (matches worker arch, unpackaged)
>> +#=C2=A0=C2=A0 - cross:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HOST_ARCH =3D=3D=
 BUILD_ARCH
>> +#=C2=A0=C2=A0 - nativesdk:=C2=A0 HOST_ARCH =3D=3D SDK_ARCH
>> +# so a single expression covers every class without producing an empt=
y tag
>> +# (which python 3.14 + wheel >=3D0.44 rejects with "Bad wheel filenam=
e").
>> +export _PYTHON_HOST_PLATFORM =3D "linux-${HOST_ARCH}"
> The fix looks right, thanks!
>
> I'm not sure we need the 10+ lines of explanation from AI ;-) The
> commit message could be more concise too. We're seening way too much
> text being added by AI in general and it will make the codebase harder
> to understand in the long run :(.
>
> Cheers,
>
> Richard

I agree, I can send a v2 or just keep it in mind for next time, let me kn=
ow.

Cheers,
Alejandro

>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#242937):https://lists.openembedded.org/g/openembedd=
ed-core/message/242937
> Mute This Topic:https://lists.openembedded.org/mt/120602086/4354175
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [a=
lhe@linux.microsoft.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------dyT7pKAXs8H4TJLL0BziuSTH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 8/6/2026 6:26 AM, Richard Purdie vi=
a
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:a863f3a0f5304826bf15afe3fb0767d43d378477.camel@linuxfoundatio=
n.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Tue, 2026-08-04 at 22:04 =
+0000, Alejandro Hernandez Samaniego via lists.openembedded.org wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">python distutils/sysconfig=
.get_platform() falls back to
distutils.util.get_platform() when the _PYTHON_HOST_PLATFORM
environment variable is unset, and returns the *build host* arch.
The result is baked into the produced wheel's filename
(pkg-&lt;ver&gt;-cp3XX-cp3XX-&lt;PLAT&gt;.whl) and its &lt;pkg&gt;.dist-i=
nfo/WHEEL
metadata.

Without this export, extension-module wheels tag themselves with
whichever arch the autobuilder worker happens to have, which makes
the resulting rpm non-reproducible across mixed-arch autobuilder
pools.

Since python 3.14 + wheel &gt;=3D0.44 also rejects wheels with an empty
platform tag ("Bad wheel filename"), the value has to be non-empty
in every class scope. HOST_ARCH is class-scoped by bitbake
(target/native/cross/nativesdk), so `linux-${HOST_ARCH}` covers
every case with a single unconditional assignment. Setting per-class
overrides to "" (as an earlier draft did) trips the wheel filename
check and must be avoided.

Pure-python wheels ignore _PYTHON_HOST_PLATFORM and remain tagged
"any", so this change only affects wheels that ship compiled
extensions (cffi, cryptography, numpy, bcrypt, markupsafe, psutil,
rpds-py, websockets, ...).

Assisted-by: AI - OpenAI
Signed-off-by: Alejandro Hernandez <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a=
>
---
=C2=A0meta/classes-recipe/python_pep517.bbclass | 16 ++++++++++++++++
=C2=A01 file changed, 16 insertions(+)

diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classes-rec=
ipe/python_pep517.bbclass
index d6246af5c2..06b23d3cba 100644
--- a/meta/classes-recipe/python_pep517.bbclass
+++ b/meta/classes-recipe/python_pep517.bbclass
@@ -30,6 +30,22 @@ PEP517_INSTALL_PYTHON:class-native =3D "nativepython3"
=C2=A0# pypa/installer option to control the bytecode compilation
=C2=A0INSTALL_WHEEL_COMPILE_BYTECODE ?=3D "--compile-bytecode=3D0"
=C2=A0
+# Force the wheel's platform tag to reflect the target machine rather th=
an the
+# build host. Without this, extension-module wheels bake the build host'=
s arch
+# (e.g. linux_x86_64) into &lt;pkg&gt;.dist-info/WHEEL via distutils/sys=
config's
+# get_platform(), which breaks reproducibility across autobuilder worker=
s of
+# different architectures. Pure-python wheels ignore this variable and r=
emain
+# tagged "any".
+#
+# HOST_ARCH is class-scoped by bitbake:
+#=C2=A0=C2=A0 - target:=C2=A0=C2=A0=C2=A0=C2=A0 HOST_ARCH =3D=3D TARGET_=
ARCH (reproducible across workers)
+#=C2=A0=C2=A0 - native:=C2=A0=C2=A0=C2=A0=C2=A0 HOST_ARCH =3D=3D BUILD_A=
RCH=C2=A0 (matches worker arch, unpackaged)
+#=C2=A0=C2=A0 - cross:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HOST_ARCH =3D=3D BU=
ILD_ARCH
+#=C2=A0=C2=A0 - nativesdk:=C2=A0 HOST_ARCH =3D=3D SDK_ARCH
+# so a single expression covers every class without producing an empty t=
ag
+# (which python 3.14 + wheel &gt;=3D0.44 rejects with "Bad wheel filenam=
e").
+export _PYTHON_HOST_PLATFORM =3D "linux-${HOST_ARCH}"
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
The fix looks right, thanks!

I'm not sure we need the 10+ lines of explanation from AI ;-) The
commit message could be more concise too. We're seening way too much
text being added by AI in general and it will make the codebase harder
to understand in the long run :(.

Cheers,

Richard</pre>
    </blockquote>
    <pre>I agree, I can send a v2 or just keep it in mind for next time, =
let me know.

Cheers,
Alejandro</pre>
    <pre>
</pre>
    <blockquote type=3D"cite"
cite=3D"mid:a863f3a0f5304826bf15afe3fb0767d43d378477.camel@linuxfoundatio=
n.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">


</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#242937): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/242937">https:/=
/lists.openembedded.org/g/openembedded-core/message/242937</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/120602086/4354175">https://lists.openembedded.org/mt=
/120602086/4354175</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------dyT7pKAXs8H4TJLL0BziuSTH--

