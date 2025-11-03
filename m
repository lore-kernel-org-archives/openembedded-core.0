Return-Path: <gordon.lack@dsl.pipex.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354DBCCF9E3
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 00:57:36 +0000 (UTC)
Received: from vsmx001.tt.xion.oxcs.net (vsmx001.tt.xion.oxcs.net [153.92.124.184])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10572.1762131454874030065
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 16:57:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@dsl.pipex.com header.s=mail1 header.b=S8r9dwxI;
 spf=pass (domain: dsl.pipex.com, ip: 153.92.124.184, mailfrom: gordon.lack@dsl.pipex.com)
Received: from vsmx001.tt.xion.oxcs.net (unknown [185.27.183.132])
	by mx-out.tt.xion.oxcs.net (Postfix) with ESMTP id 3D3D3A4087F;
	Mon,  3 Nov 2025 00:57:32 +0000 (UTC)
Received: from proxy-18.proxy.shared.ham.xion.oxcs.net (proxy-18.proxy.shared.ham.xion.oxcs.net [89.168.156.2])
	by mx-out.tt.xion.oxcs.net (Postfix) with ESMTPA id AFC29A40116;
	Mon,  3 Nov 2025 00:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=dsl.pipex.com;
	s=mail1; t=1762131452;
	bh=LhmKDDo0b6at1xv5015QPx764saGnpmcxID184VNxgs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=S8r9dwxIG+VCgYmAY9E5lnujCYVNDCMQTqC3plUndVnUZ9Aco0P4xDe3RUHMfgSKC
	 24dmGAkLeHNTPnw+mnWQxxtgH17PvcBfnH0NuhgnE3FYPKmuUQvhXARW+khTxO4uK9
	 wHynuapYElrbLavgf74dcFmX4uNVw7cYpKaaJnNnKIB1PAfOudSHOh2DfLuXnBmYMM
	 ZA9z1LDiY+p9U3N1pJv2mQcT6587FqQlTr0PurvYxppRwAEI1XF0v5/4WwbqA8HWFU
	 37DRqk4HxP/l9LD7le3RMDZBsECbl2zkGpQmo3XRuRLBpQSHEtXt6E42DVsohFKjNS
	 d+H2b5qrw9kAA==
Received: from [192.168.1.10] (gmllaptop.lacknet [192.168.1.10])
	by benuc.lacknet (Postfix) with ESMTPSA id 07DCB5F29C;
	Mon, 03 Nov 2025 00:57:29 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------2xab3imYDdRkI9gCcHJtkuvP"
Message-ID: <c64b4431-304a-4e8d-961e-a3508ee203f5@dsl.pipex.com>
Date: Mon, 3 Nov 2025 00:57:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] Avoid running whilst in a deleted
 directory.
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20251102200653.3438957-1-gordon.lack@dsl.pipex.com>
 <fcd2e330b64058ae60b478acf9f30d1f83ea72a7.camel@linuxfoundation.org>
Content-Language: en-GB
From: Gordon Lack <gordon.lack@dsl.pipex.com>
In-Reply-To: <fcd2e330b64058ae60b478acf9f30d1f83ea72a7.camel@linuxfoundation.org>
X-VadeSecure-Status: LEGIT
X-VADE-STATUS: LEGIT
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 00:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225585

This is a multi-part message in MIME format.
--------------2xab3imYDdRkI9gCcHJtkuvP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


On 02/11/2025 23:22, Richard Purdie wrote:
> On Sun, 2025-11-02 at 20:06 +0000, Gordon Lack via lists.openembedded.o=
rg wrote:
>> This caused a problem when building on Kubuntu 25.10.
>>
>> Whilst the real problem is the cp in Rust coreutils, it makes sense no=
t
>> to be in the directory you are about to delete.
>>
>> ---
>>  =C2=A0meta/recipes-devtools/perl/perl_5.40.2.bb | 6 ++++++
>>  =C2=A01 file changed, 6 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/perl/perl_5.40.2.bb b/meta/recipes-=
devtools/perl/perl_5.40.2.bb
>> index a78d2ed0be..ee6896b479 100644
>> --- a/meta/recipes-devtools/perl/perl_5.40.2.bb
>> +++ b/meta/recipes-devtools/perl/perl_5.40.2.bb
>> @@ -58,6 +58,12 @@ CFLAGS:append:toolchain-clang =3D " -fno-strict-ali=
asing"
>>  =C2=A0CFLAGS:append:toolchain-gcc:class-target:x86-64 =3D " -fno-buil=
tin-memcpy -D__NO_STRING_INLINES -U_FORTIFY_SOURCE"
>>  =20
>>  =C2=A0do_configure:prepend() {
>> +# ${B} will have been set as our current directory before immediately
>> +# before do_configure is called. So let's avoid any problems associat=
ed
>> +# with it being deleted from underneath us.
>> +# We're being put back there (the new version) at the end of this cod=
e
>> +#
>> +=C2=A0=C2=A0=C2=A0 cd /
>>  =C2=A0=C2=A0=C2=A0=C2=A0 rm -rf ${B}
>>  =C2=A0=C2=A0=C2=A0=C2=A0 cp -rfp ${S} ${B}
>>  =C2=A0=C2=A0=C2=A0=C2=A0 cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross=
/* ${B}
> Thanks for sending this!
>
> The patch does need a few small tweaks. I'd suggest "cd ${WORKDIR}" as
> I get nervous about going to / and running rm,
OK. But =E2=80=9Ccd /=E2=80=9D never bothers me, as:

  * you can=E2=80=99t run a build=C2=A0as root (at least not the OE-allia=
nce build I
    once tried as root on a old, spare, system in an attempt to debug
    something)
  * it=E2=80=99s the only location you can guarantee to be present.

>   I appreciate it
> shouldn't matter. I've not looked but I'd also like to confirm this
> does a "cd ${B}" at the end so the cwd is restored?
It does. One more context line would show it.

The full function is:

do_configure:prepend() {
# ${B} will have been set as our current directory before immediately
# before do_configure is called. So let's avoid any problems associated
# with it being deleted from underneath us.
# We're being put back there (the new version) at the end of this code
#
     cd /
     rm -rf ${B}
     cp -rfp ${S} ${B}
     cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${B}
     cd ${B}
}

> The comments should also really be indented too to match the cd, just
> for readability/coding style.
On the /readability/ we=E2=80=99ll have to differ.
Comments are *not* code, so indenting them to the same level makes=20
/both/ unreadable.

With most code indented (in functions) and comments starting on column 1=20
I can read each separately.
With both aligned the same I can=E2=80=99t see which is which.

I=E2=80=99ll submit a new patch that uses WORKDIR (it=E2=80=99s one level=
 above ${B}, so=20
will also work) and put all of the comments outside of the function, to=20
make them readable.
--------------2xab3imYDdRkI9gCcHJtkuvP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <br>
  <body text=3D"#111111" bgcolor=3D"#cccccc">
    <div class=3D"moz-cite-prefix">On 02/11/2025 23:22, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:fcd2e330b64058ae60b478acf9f30d1f83ea72a7.camel@linuxfoundatio=
n.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Sun, 2025-11-02 at 20:06 =
+0000, Gordon Lack via lists.openembedded.org wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
This caused a problem when building on Kubuntu 25.10.

Whilst the real problem is the cp in Rust coreutils, it makes sense not
to be in the directory you are about to delete.

---
=C2=A0meta/recipes-devtools/perl/perl_5.40.2.bb | 6 ++++++
=C2=A01 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.40.2.bb b/meta/recipes-dev=
tools/perl/perl_5.40.2.bb
index a78d2ed0be..ee6896b479 100644
--- a/meta/recipes-devtools/perl/perl_5.40.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.40.2.bb
@@ -58,6 +58,12 @@ CFLAGS:append:toolchain-clang =3D " -fno-strict-aliasi=
ng"
=C2=A0CFLAGS:append:toolchain-gcc:class-target:x86-64 =3D " -fno-builtin-=
memcpy -D__NO_STRING_INLINES -U_FORTIFY_SOURCE"
=C2=A0
=C2=A0do_configure:prepend() {
+# ${B} will have been set as our current directory before immediately
+# before do_configure is called. So let's avoid any problems associated
+# with it being deleted from underneath us.
+# We're being put back there (the new version) at the end of this code
+#
+=C2=A0=C2=A0=C2=A0 cd /
=C2=A0=C2=A0=C2=A0=C2=A0 rm -rf ${B}
=C2=A0=C2=A0=C2=A0=C2=A0 cp -rfp ${S} ${B}
=C2=A0=C2=A0=C2=A0=C2=A0 cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* $=
{B}
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Thanks for sending this!=C2=A0

The patch does need a few small tweaks. I'd suggest "cd ${WORKDIR}" as
I get nervous about going to / and running rm,</pre>
    </blockquote>
    OK. But =E2=80=9Ccd /=E2=80=9D never bothers me, as:<br>
    <ul>
      <li>you can=E2=80=99t run a build=C2=A0as root (at least not the OE=
-alliance
        build I once tried as root on a old, spare, system in an attempt
        to debug something)=C2=A0</li>
      <li>it=E2=80=99s the only location you can guarantee to be present.=
</li>
    </ul>
    <blockquote type=3D"cite"
cite=3D"mid:fcd2e330b64058ae60b478acf9f30d1f83ea72a7.camel@linuxfoundatio=
n.org">
      <pre wrap=3D"" class=3D"moz-quote-pre"> I appreciate it
shouldn't matter. I've not looked but I'd also like to confirm this
does a "cd ${B}" at the end so the cwd is restored?</pre>
    </blockquote>
    It does. One more context line would show it.<br>
    <br>
    The full function is:<br>
    <pre>do_configure:prepend() {
# ${B} will have been set as our current directory before immediately
# before do_configure is called. So let's avoid any problems associated
# with it being deleted from underneath us.
# We're being put back there (the new version) at the end of this code
#
    cd /  =20
    rm -rf ${B}
    cp -rfp ${S} ${B}
    cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${B}
    cd ${B}
}

</pre>
    <blockquote type=3D"cite"
cite=3D"mid:fcd2e330b64058ae60b478acf9f30d1f83ea72a7.camel@linuxfoundatio=
n.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">The comments should also rea=
lly be indented too to match the cd, just
for readability/coding style.</pre>
    </blockquote>
    On the <i>readability</i> we=E2=80=99ll have to differ.<br>
    Comments are <b>not</b> code, so indenting them to the same level
    makes=C2=A0<i>both</i> unreadable.<br>
    <br>
    With most code indented (in functions) and comments starting on
    column 1 I can read each separately.<br>
    With both aligned the same I can=E2=80=99t see which is which.<br>
    <br>
    I=E2=80=99ll submit a new patch that uses WORKDIR (it=E2=80=99s one l=
evel above
    ${B}, so will also work) and put all of the comments outside of the
    function, to make them readable.
  </body>
</html>

--------------2xab3imYDdRkI9gCcHJtkuvP--

