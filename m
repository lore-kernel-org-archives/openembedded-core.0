Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D6BC5AC7C
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 17:29:00 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24777.1786037340007880082
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 10:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=njmBiauB;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [10.0.5.46] (unknown [70.37.26.61])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2E52720B710C;
	Thu,  6 Aug 2026 10:28:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2E52720B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1786037318;
	bh=vI7GKC6Zq+K+Qf0wqdpUpmR/vqqIy6PMGgGOy7hA9Cw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=njmBiauBPFkaJU+Q4GhDYgowXRj8sigBpl1aubdRK6zRTtedWVRmxVb/tp1kHgHk3
	 J+7w4NXyXMzPirzeWbKEMVs8kR6n0xgKx762AFAhC/yg/7xEstKjpuAQx2uPFKrLo4
	 jByBXcM/s3S5NYOOiA2glavzhsdNSqIvuWK3pILU=
Content-Type: multipart/alternative;
 boundary="------------lmSA0os4G9oU6WeRB2dXRCwa"
Message-ID: <c5e82305-005a-454c-8b23-502870014209@linux.microsoft.com>
Date: Thu, 6 Aug 2026 11:28:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/4] python_pep517.bbclass: always export
 _PYTHON_HOST_PLATFORM for wheel tag
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20260804220456.2342710-1-alhe@linux.microsoft.com>
 <20260804220456.2342710-3-alhe@linux.microsoft.com>
 <a863f3a0f5304826bf15afe3fb0767d43d378477.camel@linuxfoundation.org>
 <12ac583b-cb68-48ca-9fdc-28216d706713@linux.microsoft.com>
 <c5594afab73a3a5627aa694bb4b879e38f855382.camel@linuxfoundation.org>
Content-Language: en-US
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <c5594afab73a3a5627aa694bb4b879e38f855382.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 17:29:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242965

This is a multi-part message in MIME format.
--------------lmSA0os4G9oU6WeRB2dXRCwa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


On 8/6/2026 10:09 AM, Richard Purdie via lists.openembedded.org wrote:
> On Thu, 2026-08-06 at 09:51 -0600, Alejandro Hernandez wrote:
>>  =20
>>
>>
>>  =20
>>
>>  =20
>>
>> On 8/6/2026 6:26 AM, Richard Purdie via lists.openembedded.org wrote:
>>  =20
>>
>>  =20
>>
>>>  =20
>>>
>>> On Tue, 2026-08-04 at 22:04 +0000, Alejandro Hernandez Samaniego via =
lists.openembedded.org wrote:
>>>  =20
>>>
>>>>  =20
>>>>
>>>> python distutils/sysconfig.get_platform() falls back to
>>>> distutils.util.get_platform() when the _PYTHON_HOST_PLATFORM
>>>> environment variable is unset, and returns the *build host* arch.
>>>> The result is baked into the produced wheel's filename
>>>> (pkg-<ver>-cp3XX-cp3XX-<PLAT>.whl) and its <pkg>.dist-info/WHEEL
>>>> metadata.
>>>>
>>>> Without this export, extension-module wheels tag themselves with
>>>> whichever arch the autobuilder worker happens to have, which makes
>>>> the resulting rpm non-reproducible across mixed-arch autobuilder
>>>> pools.
>>>>
>>>> Since python 3.14 + wheel >=3D0.44 also rejects wheels with an empty
>>>> platform tag ("Bad wheel filename"), the value has to be non-empty
>>>> in every class scope. HOST_ARCH is class-scoped by bitbake
>>>> (target/native/cross/nativesdk), so `linux-${HOST_ARCH}` covers
>>>> every case with a single unconditional assignment. Setting per-class
>>>> overrides to "" (as an earlier draft did) trips the wheel filename
>>>> check and must be avoided.
>>>>
>>>> Pure-python wheels ignore _PYTHON_HOST_PLATFORM and remain tagged
>>>> "any", so this change only affects wheels that ship compiled
>>>> extensions (cffi, cryptography, numpy, bcrypt, markupsafe, psutil,
>>>> rpds-py, websockets, ...).
>>>>
>>>> Assisted-by: AI - OpenAI
>>>> Signed-off-by: Alejandro Hernandez<alhe@linux.microsoft.com>
>>>> ---
>>>>  =C2=A0meta/classes-recipe/python_pep517.bbclass | 16 ++++++++++++++=
++
>>>>  =C2=A01 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classe=
s-recipe/python_pep517.bbclass
>>>> index d6246af5c2..06b23d3cba 100644
>>>> --- a/meta/classes-recipe/python_pep517.bbclass
>>>> +++ b/meta/classes-recipe/python_pep517.bbclass
>>>> @@ -30,6 +30,22 @@ PEP517_INSTALL_PYTHON:class-native =3D "nativepyt=
hon3"
>>>>  =C2=A0# pypa/installer option to control the bytecode compilation
>>>>  =C2=A0INSTALL_WHEEL_COMPILE_BYTECODE ?=3D "--compile-bytecode=3D0"
>>>>  =20
>>>> +# Force the wheel's platform tag to reflect the target machine rath=
er than the
>>>> +# build host. Without this, extension-module wheels bake the build =
host's arch
>>>> +# (e.g. linux_x86_64) into <pkg>.dist-info/WHEEL via distutils/sysc=
onfig's
>>>> +# get_platform(), which breaks reproducibility across autobuilder w=
orkers of
>>>> +# different architectures. Pure-python wheels ignore this variable =
and remain
>>>> +# tagged "any".
>>>> +#
>>>> +# HOST_ARCH is class-scoped by bitbake:
>>>> +#=C2=A0=C2=A0 - target:=C2=A0=C2=A0=C2=A0=C2=A0 HOST_ARCH =3D=3D TA=
RGET_ARCH (reproducible across workers)
>>>> +#=C2=A0=C2=A0 - native:=C2=A0=C2=A0=C2=A0=C2=A0 HOST_ARCH =3D=3D BU=
ILD_ARCH=C2=A0 (matches worker arch, unpackaged)
>>>> +#=C2=A0=C2=A0 - cross:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HOST_ARCH =3D=3D=
 BUILD_ARCH
>>>> +#=C2=A0=C2=A0 - nativesdk:=C2=A0 HOST_ARCH =3D=3D SDK_ARCH
>>>> +# so a single expression covers every class without producing an em=
pty tag
>>>> +# (which python 3.14 + wheel >=3D0.44 rejects with "Bad wheel filen=
ame").
>>>> +export _PYTHON_HOST_PLATFORM =3D "linux-${HOST_ARCH}"
>>>>  =20
>>>>
>>>  =20
>>>
>>> The fix looks right, thanks!
>>>
>>> I'm not sure we need the 10+ lines of explanation from AI ;-) The
>>> commit message could be more concise too. We're seening way too much
>>> text being added by AI in general and it will make the codebase harde=
r
>>> to understand in the long run :(.
>>>
>>> Cheers,
>>>
>>> Richard
>>>  =20
>>>
>>  =20
>>
>> I agree, I can send a v2 or just keep it in mind for next time, let me=
 know.
> v2 please, it is too verbose and I would have to manually trim it...
>
> Cheers,
>
> Richard

Sent v2

Cheers!

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#242955):https://lists.openembedded.org/g/openembedd=
ed-core/message/242955
> Mute This Topic:https://lists.openembedded.org/mt/120602086/4354175
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [a=
lhe@linux.microsoft.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------lmSA0os4G9oU6WeRB2dXRCwa
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
    <div class=3D"moz-cite-prefix">On 8/6/2026 10:09 AM, Richard Purdie
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:c5594afab73a3a5627aa694bb4b879e38f855382.camel@linuxfoundatio=
n.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Thu, 2026-08-06 at 09:51 =
-0600, Alejandro Hernandez wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">=C2=A0


=C2=A0

=C2=A0

On 8/6/2026 6:26 AM, Richard Purdie via lists.openembedded.org wrote:
=C2=A0

=C2=A0

</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">=C2=A0

On Tue, 2026-08-04 at 22:04 +0000, Alejandro Hernandez Samaniego via list=
s.openembedded.org wrote:
=C2=A0

</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"" class=3D"moz-quote-pre">=C2=A0

python distutils/sysconfig.get_platform() falls back to
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
=C2=A0

</pre>
          </blockquote>
          <pre wrap=3D"" class=3D"moz-quote-pre">=C2=A0

The fix looks right, thanks!

I'm not sure we need the 10+ lines of explanation from AI ;-) The
commit message could be more concise too. We're seening way too much
text being added by AI in general and it will make the codebase harder
to understand in the long run :(.

Cheers,

Richard
=C2=A0

</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"moz-quote-pre">=C2=A0

I agree, I can send a v2 or just keep it in mind for next time, let me kn=
ow.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
v2 please, it is too verbose and I would have to manually trim it...

Cheers,

Richard</pre>
    </blockquote>
    <pre>Sent v2

Cheers!</pre>
    <blockquote type=3D"cite"
cite=3D"mid:c5594afab73a3a5627aa694bb4b879e38f855382.camel@linuxfoundatio=
n.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#242955): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/242955">https:/=
/lists.openembedded.org/g/openembedded-core/message/242955</a>
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

--------------lmSA0os4G9oU6WeRB2dXRCwa--

