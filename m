Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950D5CCA470
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 10:04:16 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.8507.1760004248778040157
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 03:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bcQKYI3t;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5997f407c85so270520137.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 03:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760004248; x=1760609048; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iz0ubTpfWq6Q/dGplhKwh/N2BNrFBAIdY6BI7zhL4v8=;
        b=bcQKYI3ttx+lvUZMtsuB6MnG/Nw72+KitjNtz3SebjDISzwz3euMCZqQj2CfR+lwBM
         W1lVtccwaS+NY1ObJVR7LK0W9GxMpBCsvlO5XpAvpGwhQe/Np+Y5J/+G+EPqY4F5tHyR
         NWghUJabznLDdSQd3oxksB2NnFvUY1WZUArtcifojkYJLQUn3tV0Ww/WskS/dF67lYoD
         6Q/b/n8Uoe8K7inIj85SyFgxfgaADxseoYu/sG9DxWjnlgqdtyREHyqMVmK5Il3w3Ubu
         Tf7vmEFIFP7bdajPm/SaupJzBjWPdJ0pP/xDJWTAl2yvMQ8WI8sjCiRNdvH+rEAsuapJ
         rJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760004248; x=1760609048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iz0ubTpfWq6Q/dGplhKwh/N2BNrFBAIdY6BI7zhL4v8=;
        b=pMNmmacDFnfdj363dJenVuSenZpQfxvpzIvM3oQ9vslJVvI+x+bYZapBmvR5kOMWza
         9swp4QyobZTYt7bqIMXJeSqyFIgLNYLFnkLqy9hro/qPRByOqvVvY1Yu+DH/EninryAU
         T/psk29ALBeQ+O8+zOWOo04uB/F9rHKlTSHWNhp01H19r3+dmCoJa8xboBCgKvSt6Ne0
         z0FmooMRfaxAW9KNgnY/KeGaVyujrhClO9wFBSURL4nUaNy+e2E+t+Ojjf/VsJ82dlAl
         QLNWmqm1Lp+2rYjS1oWGAZ3Q5qEIx0TCuNDpivDUfRrRH5myXrVxnfNd8qnSP8/4kkXR
         TTMw==
X-Gm-Message-State: AOJu0YwD8By6i7FxkYft5X9i3jZD/ZjnxbPBrs9ka71EHVxe4xfn+CeP
	a0PIE+I/SBek1GTi86UHRAX6ma2wzEOC3mkjqoytGvCEYWtGebRL9xAIR255s4XTrs1VABg1r3/
	HUUUmFrGD1E6QY5Eaq4eNk2nnSn3XsfMQxlEo+LY=
X-Gm-Gg: ASbGncsks0fOv3Oqq/ayMu0+HkW/9i1NTX9sCX4XiSbUVMNGxQhTFnAx7zBV2GnpXX4
	bCKDdL5e8h3baVyZs1g59K9Ywcsag/x93GWC3wxGdJqWXbkX5E6Pf+If5aIHLt0l7SKB4LW1r76
	R9qNfBlKiZDyw1H9LgVbFqzAg5dOjOE6AkRkMz5vzWR9/04lSrE4dM0SdH5gLqZ4EKi6LIlnZh/
	WGtdPv4JpQnpVRfA9T2jzKGweZ57MgmPr4KaTLK09+Z+9dy32P/s6TDfS0i+TgvpLfznGk7S7ka
	6+m1q4tV
X-Google-Smtp-Source: AGHT+IGqtiD/07E90gYB0tas1eJ1N0K05xJw8EQ51XhIL7F1scUjQOQiOMeYe6V3ENFXCzUf5Iyed1vWscXvuS1upCM=
X-Received: by 2002:a05:6102:8389:10b0:5d5:f40a:4cf1 with SMTP id
 ada2fe7eead31-5d5f40a4d20mr243766137.24.1760004247553; Thu, 09 Oct 2025
 03:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251008130137.2266449-1-Yash.Shinde@windriver.com>
 <CA+cAker8MWe6PCE9VfoWs=9CqnkGxzuAa2OA+3wpkEHh+BYJ+A@mail.gmail.com> <54760438-be36-471b-8634-070b767518c8@windriver.com>
In-Reply-To: <54760438-be36-471b-8634-070b767518c8@windriver.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 9 Oct 2025 12:03:56 +0200
X-Gm-Features: AS18NWD9sYpQcG73P5gyE1gO5xjq_rf5vMD_Wj33iMPUokXBh1VojrJpvusw7fU
Message-ID: <CA+cAkerQe6UydF7pPDE8d-AU6STa2o9Oqv_i0KYJ42gzL59B0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo-c: fix debug symbols containing TMPDIR references
To: Yash Shinde <Yash.Shinde@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="000000000000fa8b150640b6ebae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 10:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224611

--000000000000fa8b150640b6ebae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Oct 2025 at 08:45, Yash Shinde <Yash.Shinde@windriver.com> wrote:

>
> On 08-10-2025 23:13, Fr=C3=A9d=C3=A9ric Martinsons wrote:
>
> Do you think it is cargo-c specific? Or all recipes which inherits cargo
> class must have that?
>
> The error logs pointed out to cargo-c binaries only.
> For cargo, DEBUG_PREFIX_MAP is already defined:
>
> https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/rust/cargo_1=
.90.0.bb#n22
>
> This remaps the rust source path i.e $RUSTSRC.
> However, cargo-c uses a separate source installation directory
> ($CARGO_HOME) which isn't covered
> by DEBUG_PREFIX_MAP.
>
>
Thanks !


>
> Regards,
> Yash
>
> Le mer. 8 oct. 2025, 15:01, Yash Shinde via lists.openembedded.org
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8Ev=
Q!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6=
w0vcM-0RUYHKsb9Ca4-IUA$>
> <Yash.Shinde=3Dwindriver.com@lists.openembedded.org> a =C3=A9crit :
>
>> From: Yash Shinde <Yash.Shinde@windriver.com>
>>
>> When building cargo-c with DEBUG mode, QA checks fail due to
>> absolute paths from the build environment (TMPDIR) being embedded into
>> the debug symbols/binaries. This causes issues such as:
>>
>>   ERROR: do_package_qa: File /usr/bin/.debug/cargo-capi contains
>> reference to TMPDIR [buildpaths]
>>   ERROR: do_package_qa: File /usr/bin/.debug/cargo-cinstall contains
>> reference to TMPDIR [buildpaths]
>>   ERROR: do_package_qa: File /usr/bin/.debug/cargo-cbuild contains
>> reference to TMPDIR [buildpaths]
>>   ERROR: do_package_qa: File /usr/bin/.debug/cargo-ctest contains
>> reference to TMPDIR [buildpaths]
>>
>> To fix this, pass an additional -ffile-prefix-map option to
>> DEBUG_PREFIX_MAP to
>> ensure that paths under `${CARGO_HOME}` are remapped to
>> `${TARGET_DBGSRC_DIR}`.
>> This ensures debug info is reproducible and does not leak host-specific
>> paths.
>>
>> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
>> ---
>>  meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb
>> <https://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ!eT6N=
Uyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-=
0RUYHKsb90kr3UWQ$>
>> | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb
>> <https://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ!eT6N=
Uyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-=
0RUYHKsb90kr3UWQ$>
>> b/meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb
>> <https://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ!eT6N=
Uyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-=
0RUYHKsb90kr3UWQ$>
>> index fd15f02da9..5ef68e13c2 100644
>> --- a/meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb
>> <https://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ!eT6N=
Uyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-=
0RUYHKsb90kr3UWQ$>
>> +++ b/meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb
>> <https://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ!eT6N=
Uyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-=
0RUYHKsb90kr3UWQ$>
>> @@ -12,6 +12,8 @@ SRC_URI =3D "crate://crates.io/cargo-c/${PV};name=3Dca=
rgo-c
>> <https://urldefense.com/v3/__http://crates.io/cargo-c/$*7BPV*7D;name=3Dc=
argo-c__;JSU!!AjveYdw8EvQ!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bI=
zqgfXyiGljcR3YtFoalO9cR6w0vcM-0RUYHKsb9-NilF0c$>
>> \
>>  SRC_URI[cargo-c.sha256sum] =3D
>> "17d431789b050b0fcf678455dfd5ceb7e5b45cd806140f8fe03b16b995d6cbff"
>>  S =3D "${CARGO_VENDORING_DIRECTORY}/cargo-c-${PV}"
>>
>> +DEBUG_PREFIX_MAP +=3D
>> "-ffile-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC_DIR}"
>> +
>>  inherit cargo cargo-update-recipe-crates pkgconfig
>>
>>  DEPENDS =3D "openssl curl"
>> --
>> 2.49.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#224581):
>> https://lists.openembedded.org/g/openembedded-core/message/224581
>> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedd=
ed-core/message/224581__;!!AjveYdw8EvQ!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHc=
S2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-0RUYHKsb9Y5bg2LA$>
>> Mute This Topic: https://lists.openembedded.org/mt/115653303/6213388
>> <https://urldefense.com/v3/__https://lists.openembedded.org/mt/115653303=
/6213388__;!!AjveYdw8EvQ!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIz=
qgfXyiGljcR3YtFoalO9cR6w0vcM-0RUYHKsb9IEGgQYE$>
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>> <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedd=
ed-core/unsub__;!!AjveYdw8EvQ!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXs=
f2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-0RUYHKsb9b7ysiMA$>
>> [frederic.martinsons@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>> --
> Regards,
> Yash Shinde
>
>

--000000000000fa8b150640b6ebae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 9 Oct 2=
025 at 08:45, Yash Shinde &lt;<a href=3D"mailto:Yash.Shinde@windriver.com">=
Yash.Shinde@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><u></u>

 =20
  <div>
    <p><br>
    </p>
    <div>On 08-10-2025 23:13, Fr=C3=A9d=C3=A9ric
      Martinsons wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div>
        <div dir=3D"auto">
          <div>Do you think it is cargo-c specific? Or all recipes which
            inherits cargo class must have that?=C2=A0</div>
          <div dir=3D"auto"><br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>The error logs pointed out to cargo-c binaries only.=C2=A0</p>
    For cargo, DEBUG_PREFIX_MAP is already defined:<br>
<a href=3D"https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/rus=
t/cargo_1.90.0.bb#n22" target=3D"_blank">https://git.yoctoproject.org/poky/=
tree/meta/recipes-devtools/rust/cargo_1.90.0.bb#n22</a><br>
    <br>
    This remaps the rust source path i.e $RUSTSRC.<br>
    However, cargo-c uses a separate source installation directory
    ($CARGO_HOME) which isn&#39;t covered<br>
    by DEBUG_PREFIX_MAP.<br><br></div></blockquote><div><br></div><div>Than=
ks !</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div>
    <br>
    Regards,<br>
    Yash
    <blockquote type=3D"cite">
      <div>
        <div dir=3D"auto">
          <div dir=3D"auto">
            <div class=3D"gmail_quote" dir=3D"auto">
              <div dir=3D"ltr" class=3D"gmail_attr">Le mer. 8 oct. 2025,
                15:01, Yash Shinde via <a href=3D"https://urldefense.com/v3=
/__http://lists.openembedded.org__;!!AjveYdw8EvQ!eT6NUyxobn9jkx3pHarcK-637_=
es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-0RUYHKsb9Ca4-IUA$" tar=
get=3D"_blank">
                  lists.openembedded.org</a> &lt;Yash.Shinde=3D<a href=3D"m=
ailto:windriver.com@lists.openembedded.org" target=3D"_blank">windriver.com=
@lists.openembedded.org</a>&gt;
                a =C3=A9crit=C2=A0:<br>
              </div>
              <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                From: Yash Shinde &lt;<a href=3D"mailto:Yash.Shinde@windriv=
er.com" rel=3D"noreferrer" target=3D"_blank">Yash.Shinde@windriver.com</a>&=
gt;<br>
                <br>
                When building cargo-c with DEBUG mode, QA checks fail
                due to<br>
                absolute paths from the build environment (TMPDIR) being
                embedded into<br>
                the debug symbols/binaries. This causes issues such as:<br>
                <br>
                =C2=A0 ERROR: do_package_qa: File /usr/bin/.debug/cargo-cap=
i
                contains reference to TMPDIR [buildpaths]<br>
                =C2=A0 ERROR: do_package_qa: File
                /usr/bin/.debug/cargo-cinstall contains reference to
                TMPDIR [buildpaths]<br>
                =C2=A0 ERROR: do_package_qa: File
                /usr/bin/.debug/cargo-cbuild contains reference to
                TMPDIR [buildpaths]<br>
                =C2=A0 ERROR: do_package_qa: File /usr/bin/.debug/cargo-cte=
st
                contains reference to TMPDIR [buildpaths]<br>
                <br>
                To fix this, pass an additional -ffile-prefix-map option
                to DEBUG_PREFIX_MAP to<br>
                ensure that paths under `${CARGO_HOME}` are remapped to
                `${TARGET_DBGSRC_DIR}`.<br>
                This ensures debug info is reproducible and does not
                leak host-specific paths.<br>
                <br>
                Signed-off-by: Yash Shinde &lt;<a href=3D"mailto:Yash.Shind=
e@windriver.com" rel=3D"noreferrer" target=3D"_blank">Yash.Shinde@windriver=
.com</a>&gt;<br>
                ---<br>
                =C2=A0meta/recipes-devtools/rust/cargo-c_0.10.16+<a href=3D=
"https://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ!eT6NUyx=
obn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-0RU=
YHKsb90kr3UWQ$" rel=3D"noreferrer noreferrer" target=3D"_blank">cargo-0.91.=
0.bb</a> | 2 ++<br>
                =C2=A01 file changed, 2 insertions(+)<br>
                <br>
                diff --git a/meta/recipes-devtools/rust/cargo-c_0.10.16+<a =
href=3D"https://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ!=
eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0=
vcM-0RUYHKsb90kr3UWQ$" rel=3D"noreferrer noreferrer" target=3D"_blank">carg=
o-0.91.0.bb</a>
                b/meta/recipes-devtools/rust/cargo-c_0.10.16+<a href=3D"htt=
ps://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ!eT6NUyxobn9=
jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-0RUYHKs=
b90kr3UWQ$" rel=3D"noreferrer noreferrer" target=3D"_blank">cargo-0.91.0.bb=
</a><br>
                index fd15f02da9..5ef68e13c2 100644<br>
                --- a/meta/recipes-devtools/rust/cargo-c_0.10.16+<a href=3D=
"https://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ!eT6NUyx=
obn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-0RU=
YHKsb90kr3UWQ$" rel=3D"noreferrer noreferrer" target=3D"_blank">cargo-0.91.=
0.bb</a><br>
                +++ b/meta/recipes-devtools/rust/cargo-c_0.10.16+<a href=3D=
"https://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ!eT6NUyx=
obn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-0RU=
YHKsb90kr3UWQ$" rel=3D"noreferrer noreferrer" target=3D"_blank">cargo-0.91.=
0.bb</a><br>
                @@ -12,6 +12,8 @@ SRC_URI =3D &quot;crate://<a href=3D"http=
s://urldefense.com/v3/__http://crates.io/cargo-c/$*7BPV*7D;name=3Dcargo-c__=
;JSU!!AjveYdw8EvQ!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiG=
ljcR3YtFoalO9cR6w0vcM-0RUYHKsb9-NilF0c$" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">crates.io/cargo-c/${PV};name=3Dcargo-c</a>
                \<br>
                =C2=A0SRC_URI[cargo-c.sha256sum] =3D
                &quot;17d431789b050b0fcf678455dfd5ceb7e5b45cd806140f8fe03b1=
6b995d6cbff&quot;<br>
                =C2=A0S =3D &quot;${CARGO_VENDORING_DIRECTORY}/cargo-c-${PV=
}&quot;<br>
                <br>
                +DEBUG_PREFIX_MAP +=3D
                &quot;-ffile-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC_D=
IR}&quot;<br>
                +<br>
                =C2=A0inherit cargo cargo-update-recipe-crates pkgconfig<br=
>
                <br>
                =C2=A0DEPENDS =3D &quot;openssl curl&quot;<br>
                -- <br>
                2.49.0<br>
                <br>
                <br>
                -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                Links: You receive all messages sent to this group.<br>
                View/Reply Online (#224581): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-core/message/224581_=
_;!!AjveYdw8EvQ!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGlj=
cR3YtFoalO9cR6w0vcM-0RUYHKsb9Y5bg2LA$" rel=3D"noreferrer noreferrer" target=
=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/224581</a><br>
                Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/115653303/6213388__;!!AjveYdw8EvQ!eT6NUyxobn=
9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-0RUYHK=
sb9IEGgQYE$" rel=3D"noreferrer noreferrer" target=3D"_blank">
                  https://lists.openembedded.org/mt/115653303/6213388</a><b=
r>
                Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@li=
sts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">
                  openembedded-core+owner@lists.openembedded.org</a><br>
                Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!eT6NUyxob=
n9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-0RUYH=
Ksb9b7ysiMA$" rel=3D"noreferrer noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:frederic.martinsons@gmail.com" rel=3D"noreferrer" target=3D"_blank">fr=
ederic.martinsons@gmail.com</a>]<br>
                -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                <br>
              </blockquote>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <pre cols=3D"72">--=20
Regards,
Yash Shinde</pre>
  </div>

</blockquote></div></div>

--000000000000fa8b150640b6ebae--

