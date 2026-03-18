Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA9A103E176
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 13:11:29 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13667.1773839487759289702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 06:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jYuDjjhr;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82987437624so595397b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 06:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773839487; cv=none;
        d=google.com; s=arc-20240605;
        b=Mxr+cAFoqRW4saRkTQ6T05R5pqiGAeyysS8nKAX+LQ2Zreji7fYo2JVUGncwIPdE8t
         9CdMwLwwU176Vr6WZu6AyZ/krnjH2NUDf2HY6ceyJ2U3aVeAHqBUCMEgjTWLBLhB0ZTF
         vpCSGx65FLT1db7CQFW68rjuBAC55/WueTczXKh9e5exwO2jG9Qe1GJM+GBEiZOZml6c
         i6SL2+jVmilSHpMl15p2vDKVuYp49wsHaI6jylGNalWM286IN9RoBz5+joi0oNpbmFg7
         YdI1mZyxh4R3/je2J+95sLMSHq7YZSqhSMvU8bfNcYbxOi5PzpLwlYrCQrPBpUoCFyFz
         wmKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KF71+b+p2nNSy9yoGJl0YghPt/TlroNGm+8bdEeXgrg=;
        fh=q27Xj9bEWy/R2x3TFow3S7utRsJAwLBPGIAWoBmI5pg=;
        b=kU+d98278t2cvIdyzXLt62nZiQDoGkiyMZIEkx0pqRq8wtAtQYIQYdZgQ1bMtEYcvq
         OR3/CY1XPhWkNwd0KDKN9RYpG27bJTVYfm8riFMhiIstV6ROKFf4tH8HX6ncBazXwiHM
         CgQSy1DRYqtfm8T8getOGIVa3602+QCuVA0IqB4Fn4xnXEmC3BL9eKfEIIGndc2sfglo
         ggePhuPa5YqmrA9NIg1tjBOHxrz3qsQXMkAglj5Z6JhHOnPK+WvKtAspZXdfsh9D+j+b
         hNF078zLzI8yXfD9a1rPy1JERSLlkyDyXrGLdeFgTj/LD7EQFZEi968BLN3gYsW++eZb
         5hYg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773839487; x=1774444287; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KF71+b+p2nNSy9yoGJl0YghPt/TlroNGm+8bdEeXgrg=;
        b=jYuDjjhr1oHZ/s41FlXEE2RHCAnDqm8F6FyhhDJhc6VPI5Gg+eAwmesqsZOS+RsSz8
         ZEPlrenv0a1xIKW2KMkFRyCrTmHPOPdkwcgFsjoDQ/OgdGpl5DPi2wITa1KIxMZeggBK
         gFT+PZSuAnLc5E7pAWslZhMPTilrCEyHvDPzCcXg2+QnabhVMEJ8akTK8Y2GAwcOdwCT
         sTybnbxGVYn48KIWzsEnZlj9cX+xaiOyJQnJmdKwnh+7R+Faact29KGjk01MPlXiEqqJ
         /0RxZZheFnhq6OBbZwhfjNiqdT/2CQU8YEBBlQtzGZ438wTl3bV9h5HTWHH924Qcyhqi
         bUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773839487; x=1774444287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KF71+b+p2nNSy9yoGJl0YghPt/TlroNGm+8bdEeXgrg=;
        b=jVUnE4m0LKrqypcqD8nq4pIVZFrk+6ck90vd+rkq+bBWzTlVJLi0sd9QX1YG17NGWB
         l0qP7Aof5JclmDgCxWYNPealkkxM5LuvlJRNqz/1ks3iq5bsLRNcjZdPt551dzQ0IQCL
         QTQccuQ3/lMnhX1vg7irt99OfwzFGlwPKbM/NBPpP9s0NnjOyCP89Pa5U0EQ5C4jWR4j
         HoxuhryuNPu6LAslfBY3pNUCFuzgYvaa4WqsSLt2cqAVGJvQ8I98rcv9+y+vEg23rGzA
         4KJI34qy9H3qFa0TrusTIxTebpkudosqf93ZXuoTJLG/wgnby/GoB6kO0TO1XhJu3M2f
         e/lw==
X-Forwarded-Encrypted: i=1; AJvYcCX1nGh0xMWOMwyz1XFNTU/QKXdwyK4Z9KAYHvvvVsT3zrhQUo7zLi44pMI80X6B8yJGpMcmjNELJKF4g8esdioP/w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxB/V2nEGeE8/3hx+MhkFyiJMkO76IN6BV8VpQirhcAeQc5Ftx0
	UaRqmHWTth7TwjKMfm6FNVU/qMuNNxYLOQjmsiGbOn7DPDndY8jC+2Wj/YbbpdfI6di1Z6/lIjy
	YEygkA2zKde/XvcDwXf/yKj4+VSAfNNI=
X-Gm-Gg: ATEYQzwfFTI+9OTFpJE9CptejA3E1hCIQGWSb0gkJW0SVvSZ0Xk/BvHKf4o4po/vgmo
	3adjlW59GhKkrwJUfc8s5ELaeBePrCzr76zjlVGiOY9RgcsKAeQ4Tw9flbU9KAPIT9x0YKKqL/+
	56Xpp58QRbjXjGa3nKNvMxHcNSNUfgOPvF0hOrj7ghRznnHIQZVdqlBCCn8OspkpZMDP+g1LnHi
	SQK9swlwtiasy7h+r2S9OHZdVwETk3xRAn1TMP2e8/756mhkNlAbOeoe2Z0ib0zrziAlGGpTyVU
	kFIY4KZBxVJQgQGmZg/mJn25gZGFOG1PercbzGbq
X-Received: by 2002:a05:6a00:2b96:b0:829:751b:4b06 with SMTP id
 d2e1a72fcca58-82a560e8fd4mr4566480b3a.21.1773839486919; Wed, 18 Mar 2026
 06:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260317180753.488090-1-Harish.Sadineni@windriver.com>
 <CANPvuRmtjsuAQtpv11A6cqwAow3mjMsErkH9hB3VT=j2KNgpHw@mail.gmail.com> <08dd72cc-7183-4dcc-9435-23d76a2de431@windriver.com>
In-Reply-To: <08dd72cc-7183-4dcc-9435-23d76a2de431@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 18 Mar 2026 09:11:15 -0400
X-Gm-Features: AaiRm50hwHn9c14TFW41dEIiaCzQo8qazxanztqucOPAoUS5RBgg_BxfGzSuOnw
Message-ID: <CADkTA4NE5CfjSzJbh=jhU2K_iPPXtpta=SoFyTLpNmdcU-jBHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto-rust: Move rust kernel
 dependencies to bbclass
To: Harish.Sadineni@windriver.com
Cc: Jose Quaresma <quaresma.jose@gmail.com>, openembedded-core@lists.openembedded.org, 
	Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="00000000000081a59a064d4c301a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 13:11:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233387

--00000000000081a59a064d4c301a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 1:36=E2=80=AFAM Sadineni, Harish via lists.openembe=
dded.org
<Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:

>
> On 3/18/2026 1:31 AM, Jose Quaresma wrote:
>
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>
>
> Sadineni, Harish via lists.openembedded.org
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8Ev=
Q!b2ICl_fijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFl=
qz30xa1maTf9B_kjeB1qQ$>
> <Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> escreveu (ter=C3=
=A7a,
> 17/03/2026 =C3=A0(s) 18:08):
>
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>
>> Move the rust kernel dpendencies from linux-yocto.inc
>> <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!b2IC=
l_fijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa=
1maTf9B9txvlTIQ$>
>> to
>> kernel-yocto-rust.bbclass.
>>
>> This centralizes Rust-specific configuration in the dedicated class,
>> which is intended to be inherited only when Rust kernel support is
>> enabled (e.g. via KERNEL_FEATURES).
>>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
>>  meta/classes-recipe/kernel-yocto-rust.bbclass | 2 ++
>>  meta/recipes-kernel/linux/linux-yocto.inc
>> <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!b2IC=
l_fijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa=
1maTf9B9txvlTIQ$>
>>    | 2 --
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass
>> b/meta/classes-recipe/kernel-yocto-rust.bbclass
>> index 608ccc4609..49f2bfc1ae 100644
>> --- a/meta/classes-recipe/kernel-yocto-rust.bbclass
>> +++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
>> @@ -10,6 +10,8 @@ RUST_DEBUG_REMAP =3D
>> "--remap-path-prefix=3D${WORKDIR}=3D${TARGET_DBGSRC_DIR} \
>>  KRUSTFLAGS =3D " ${RUST_DEBUG_REMAP}"
>>  EXTRA_OEMAKE:append =3D " KRUSTFLAGS=3D'${KRUSTFLAGS}'"
>>
>> +RUST_KERNEL_DEPENDS ?=3D "clang-native rust-native bindgen-cli-native"
>> +DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
>>
>
> Any special reason to have this RUST_KERNEL_DEPENDS variable? It is not
> used anywhere else.
> I wonder if just the DEPENDS could be used directly.
>
> In earlier revisions, Bruce suggested keeping these dependencies in a
> variable assigned with ?=3D.
> This approach makes it easier to customize them from bbappends and relate=
d
> use cases.
>
>
Yes, exactly. This allows us (or someone like myself specifically) to
easily override the
behaviour without a :remove

Bruce



> Thanks,
> Harish
>
>
> Jose
>
>
>>  RUST_KERNEL_TASK_DEPENDS ?=3D  "rust-native:do_populate_sysroot
>> clang-native:do_populate_sysroot bindgen-cli-native:do_populate_sysroot"
>>  do_kernel_configme[depends] +=3D "${RUST_KERNEL_TASK_DEPENDS}"
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>> <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!b2IC=
l_fijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa=
1maTf9B9txvlTIQ$>
>> b/meta/recipes-kernel/linux/linux-yocto.inc
>> <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!b2IC=
l_fijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa=
1maTf9B9txvlTIQ$>
>> index f47873348a..4e230d405a 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!b2IC=
l_fijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa=
1maTf9B9txvlTIQ$>
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!b2IC=
l_fijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa=
1maTf9B9txvlTIQ$>
>> @@ -81,8 +81,6 @@ KERNEL_DEBUG ?=3D ""
>>  DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "power=
pc"
>> ], "elfutils-native", "", d)}'
>>  DEPENDS +=3D "openssl-native util-linux-native"
>>  DEPENDS +=3D "gmp-native libmpc-native"
>> -RUST_KERNEL_DEPENDS ?=3D "${@bb.utils.contains('KERNEL_FEATURES', 'rust=
',
>> 'clang-native rust-native bindgen-cli-native', '', d)}"
>> <$%7B@bb.utils.contains('KERNEL_FEATURES','rust','clang-nativerust-nativ=
ebindgen-cli-native','',d)%7D>
>> -DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
>>
>>  # Some options depend on CONFIG_PAHOLE_VERSION, so need to make
>> pahole-native available before do_kernel_configme
>>  do_kernel_configme[depends] +=3D '${@bb.utils.contains("KERNEL_DEBUG",
>> "True", "pahole-native:do_populate_sysroot", "", d)}'
>> --
>> 2.49.0
>>
>>
>>
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233358):
> https://lists.openembedded.org/g/openembedded-core/message/233358
> Mute This Topic: https://lists.openembedded.org/mt/118369300/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000081a59a064d4c301a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 18, 2026 at 1:36=
=E2=80=AFAM Sadineni, Harish via <a href=3D"http://lists.openembedded.org">=
lists.openembedded.org</a> &lt;Harish.Sadineni=3D<a href=3D"mailto:windrive=
r.com@lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div>
    <p><br>
    </p>
    <div>On 3/18/2026 1:31 AM, Jose Quaresma
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <strong>
      </strong>
      <div style=3D"border:1pt solid rgb(156,101,0);padding:2pt;background:=
rgb(252,252,3)"><strong><u></u><span style=3D"font-size:11pt;color:rgb(0,0,=
0)">CAUTION: This email
              comes from a non Wind River email account!</span><u></u></str=
ong><br>
        <u></u><span style=3D"font-size:10pt;color:rgb(0,0,0)">Do not click=
 links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        <u></u></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr"><br>
          </div>
          <br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">Sadineni, Harish via <a h=
ref=3D"https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYd=
w8EvQ!b2ICl_fijVSH2wVxqIv7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRg=
NbFlqz30xa1maTf9B_kjeB1qQ$" target=3D"_blank">
                lists.openembedded.org</a> &lt;Harish.Sadineni=3D<a href=3D=
"mailto:windriver.com@lists.openembedded.org" target=3D"_blank">windriver.c=
om@lists.openembedded.org</a>&gt;
              escreveu (ter=C3=A7a, 17/03/2026 =C3=A0(s) 18:08):<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              From: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@w=
indriver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<br>
              <br>
              Move the rust kernel dpendencies from <a href=3D"https://urld=
efense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!b2ICl_fijVSH2wVxqIv7=
GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa1maTf9B9txvlTIQ$=
" target=3D"_blank">
                linux-yocto.inc</a> to<br>
              kernel-yocto-rust.bbclass.<br>
              <br>
              This centralizes Rust-specific configuration in the
              dedicated class,<br>
              which is intended to be inherited only when Rust kernel
              support is<br>
              enabled (e.g. via KERNEL_FEATURES).<br>
              <br>
              Signed-off-by: Harish Sadineni &lt;<a href=3D"mailto:Harish.S=
adineni@windriver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&=
gt;<br>
              ---<br>
              =C2=A0meta/classes-recipe/kernel-yocto-rust.bbclass | 2 ++<br=
>
              =C2=A0meta/recipes-kernel/linux/<a href=3D"https://urldefense=
.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!b2ICl_fijVSH2wVxqIv7GAO9M7=
s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa1maTf9B9txvlTIQ$" targ=
et=3D"_blank">linux-yocto.inc</a>=C2=A0 =C2=A0 =C2=A0| 2 --<br>
              =C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
              <br>
              diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass
              b/meta/classes-recipe/kernel-yocto-rust.bbclass<br>
              index 608ccc4609..49f2bfc1ae 100644<br>
              --- a/meta/classes-recipe/kernel-yocto-rust.bbclass<br>
              +++ b/meta/classes-recipe/kernel-yocto-rust.bbclass<br>
              @@ -10,6 +10,8 @@ RUST_DEBUG_REMAP =3D
              &quot;--remap-path-prefix=3D${WORKDIR}=3D${TARGET_DBGSRC_DIR}=
 \<br>
              =C2=A0KRUSTFLAGS =3D &quot; ${RUST_DEBUG_REMAP}&quot;<br>
              =C2=A0EXTRA_OEMAKE:append =3D &quot; KRUSTFLAGS=3D&#39;${KRUS=
TFLAGS}&#39;&quot;<br>
              <br>
              +RUST_KERNEL_DEPENDS ?=3D &quot;clang-native rust-native
              bindgen-cli-native&quot;<br>
              +DEPENDS +=3D &quot;${RUST_KERNEL_DEPENDS}&quot;<br>
            </blockquote>
            <div><br>
            </div>
            <div>Any special reason to have this RUST_KERNEL_DEPENDS
              variable? It is not used anywhere else.</div>
            <div>I wonder if just the DEPENDS=C2=A0could be used directly.<=
br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>In earlier revisions, Bruce suggested keeping these dependencies
      in a variable assigned with ?=3D. <br>
      This approach makes it easier to customize them from bbappends and
      related use cases.<br>
      <br></p></div></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">Yes, exactly. This allows us (or someone l=
ike myself specifically) to easily override the</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">behaviour without a :remove</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div><p>
      Thanks,<br>
      Harish<br>
    </p>
    <blockquote type=3D"cite">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote">
            <div>
              <br>
              Jose</div>
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              =C2=A0RUST_KERNEL_TASK_DEPENDS ?=3D=C2=A0
              &quot;rust-native:do_populate_sysroot
              clang-native:do_populate_sysroot
              bindgen-cli-native:do_populate_sysroot&quot;<br>
              =C2=A0do_kernel_configme[depends] +=3D
              &quot;${RUST_KERNEL_TASK_DEPENDS}&quot;<br>
              <br>
              diff --git a/meta/recipes-kernel/linux/<a href=3D"https://url=
defense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!b2ICl_fijVSH2wVxqIv=
7GAO9M7s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa1maTf9B9txvlTIQ=
$" target=3D"_blank">linux-yocto.inc</a>
              b/meta/recipes-kernel/linux/<a href=3D"https://urldefense.com=
/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!b2ICl_fijVSH2wVxqIv7GAO9M7s8y2=
roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa1maTf9B9txvlTIQ$" target=
=3D"_blank">linux-yocto.inc</a><br>
              index f47873348a..4e230d405a 100644<br>
              --- a/meta/recipes-kernel/linux/<a href=3D"https://urldefense=
.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!b2ICl_fijVSH2wVxqIv7GAO9M7=
s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa1maTf9B9txvlTIQ$" targ=
et=3D"_blank">linux-yocto.inc</a><br>
              +++ b/meta/recipes-kernel/linux/<a href=3D"https://urldefense=
.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!b2ICl_fijVSH2wVxqIv7GAO9M7=
s8y2roM4-SddwJPX71oFS2SfJg3Nz-LU_TqwuhSgmRgNbFlqz30xa1maTf9B9txvlTIQ$" targ=
et=3D"_blank">linux-yocto.inc</a><br>
              @@ -81,8 +81,6 @@ KERNEL_DEBUG ?=3D &quot;&quot;<br>
              =C2=A0DEPENDS +=3D &#39;${@bb.utils.contains_any(&quot;ARCH&q=
uot;, [ &quot;x86&quot;,
              &quot;arm64&quot;, &quot;powerpc&quot; ], &quot;elfutils-nati=
ve&quot;, &quot;&quot;, d)}&#39;<br>
              =C2=A0DEPENDS +=3D &quot;openssl-native util-linux-native&quo=
t;<br>
              =C2=A0DEPENDS +=3D &quot;gmp-native libmpc-native&quot;<br>
              -RUST_KERNEL_DEPENDS ?=3D
              <a href=3D"mailto:$%7B@bb.utils.contains(&#39;KERNEL_FEATURES=
&#39;,&#39;rust&#39;,&#39;clang-nativerust-nativebindgen-cli-native&#39;,&#=
39;&#39;,d)%7D" target=3D"_blank">&quot;${@bb.utils.contains(&#39;KERNEL_FE=
ATURES&#39;, &#39;rust&#39;,
              &#39;clang-native rust-native bindgen-cli-native&#39;, &#39;&=
#39;, d)}&quot;</a><br>
              -DEPENDS +=3D &quot;${RUST_KERNEL_DEPENDS}&quot;<br>
              <br>
              =C2=A0# Some options depend on CONFIG_PAHOLE_VERSION, so need
              to make pahole-native available before do_kernel_configme<br>
              =C2=A0do_kernel_configme[depends] +=3D
              &#39;${@bb.utils.contains(&quot;KERNEL_DEBUG&quot;, &quot;Tru=
e&quot;,
              &quot;pahole-native:do_populate_sysroot&quot;, &quot;&quot;, =
d)}&#39;<br>
              -- <br>
              2.49.0<br>
              <br>
              <br>
              <br>
              <br>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <div><br>
          </div>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">
            <div dir=3D"ltr">Best regards,
              <div><br>
                Jos=C3=A9 Quaresma</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#233358): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/233358" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/233358</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118369300/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118369300/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000081a59a064d4c301a--

