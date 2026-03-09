Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154E8FCA16D
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 18:01:39 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21184.1773079298360250532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 11:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LcauPtZv;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3591cc98871so5358656a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 11:01:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079298; cv=none;
        d=google.com; s=arc-20240605;
        b=NY6ckFvjem8Elk+MOYVhTg2XrfrWOw7g9qnl7ded1MuavZSakOLRZIU/PZPSUaTA7l
         8xutbDxiZDryoz0wj5X/zaKQ81jiRfwNt5vwSKmC/pX1iQZ62Civ9ubdydQzxYwIr6RN
         Fmz/G9n38Eb51uumRKbFp2Z48WLqvGQv+bapxzBhUGXm8gdr2itqw/RcM5BtfJ3X+nQj
         o2bPF4sBZgxMWjStI4LWJilHYJLYh6cY8TbhG2eA6VZY9RHYzTXcEG8EW4GWgD4TE8nQ
         rib4BTiecTd3qP7mg/UhzxpTBC0mSfVn5EqYQ3jKa1k3vynB9gvAvvDAXJnq8atpapri
         yaKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F6yZxUMcjfTmjYnD4EeqFQAW1nOjGaZbBIYojw7h010=;
        fh=4DeM7hj1ejr4Gj2cPG0KtQ85xB0Fr1ggUo81/SvxyIw=;
        b=QL4wUpoNc4jUo+5givkiGM0wcdjeVKGMoRMd7gv7KEJawo4qGEtzZe4FJdXDbxex05
         qElxMVVCGGivhC64HO8NFe4Vg1WhzYmkKZY5ljSKzBAvWXOqdOP6W/WqezhKtkDiG0WN
         88PGTD2bmdSC1TRoy/+RMeZ51Lf4eYEz9lkBgMG4isQz9CHfUw9VdJg0qlgS4n5VsUge
         qM+VB1RnNjww1mnHC7Zb09S8UTsDM89Zb1/m5JtJYxejEh2Vv5x7XJr/g9S8xnfqtzFX
         nyoKpQ7PI5SZ9AbdWw/U1FUN4higft/1wYWPfRYTErn9CzXHD5oOHT6CORq7mWQW35rT
         uUfA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773079298; x=1773684098; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F6yZxUMcjfTmjYnD4EeqFQAW1nOjGaZbBIYojw7h010=;
        b=LcauPtZvs7F4fgrYFr0RHx1xIxUkLIYgVP1KattmgrNcp5IXVRDILamgO/K6BzorSg
         6qFPPjLX7dBvczjfJfubC/C2XDvZeGjsH8t99GROZD0vnxz58PDUhdNI5WPeDG5Po5Nv
         xMVZNLPQxM0wuI5ARL2RwuN7n7sFDrmjS1yqP64yjXCwpu5+wRY4wRLlk5NgYVauYDeX
         fTAb8BDBKmGPhpKEWUlY6W+Kj+rXVI2frNLKUQIICuPprMyld5QVw+zXUcm/SgNvAsTs
         q2cw64gCalZMR9TgDGPpRGciHNtqFrgP9axKkrwGjfBs1ruHI7yfw4v8t1evliasr6TO
         6l4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079298; x=1773684098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6yZxUMcjfTmjYnD4EeqFQAW1nOjGaZbBIYojw7h010=;
        b=Orfvz1svejKeIITUQv4gaygI28apKjRykuUks7XIeeZtiV+MFz/BukfZ0uqY/2AE6a
         sOraUyl2nba235OCj9o6JOsiBOgDI6eDcIWVVmJxYGN+JUcemMcucBWfXiJ7svBiL+rJ
         0AIuLQPC4ZfBwDblucL0c7iAb/F1BJ6Plo3N5mAEedF2A20PQSxk4a8ql0UZ5lT9Pr9J
         cwve+lcO9MGK1EwyBD47KPE9jvNPaFqg6zBYUq1X0SenCbfCxYuZKDDfIm92kEcZ17EM
         9BmFctBgORKLS7x1KWDNlDAmpQHQbj10JZOCbuvQavHeIc25m0Ff9w8Jwx9F8yUqt3Wp
         qlDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/E446elK/ZYeF/uMT8OFKGWMRkqXIQsHNmFtWRtz61PT1HJja3licF/S0IO3kSK1lyq0GMzuBhdWA2zK++0lxeQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywb3PUm5PebMJI89tVAXoN2upErzZqrKslQA0iDpl15OMIvXjM/
	Bvyx8EX/ZQ039a9S1qjrxI49YaertmuTOVluVgLsZL+mAm1PHyCTGIiITVzra8+vA3twnmcY5rM
	BpBb/JoyuL8C/3oUXPDRSBwDnutphBfc=
X-Gm-Gg: ATEYQzwBoGuImPpPZKljnXUGoQmQO9jcocsutMr6oH2KBav3y3T/TByi7iIgNCz1uZF
	ph8cn5FMlqzjd/XyP6v+xBXz4NMVt9pYchjqU6cU5RQJ0tBAJgjlhgwdk7o3QVnaAt4UFjEBIcj
	sHDaoUNbiija8IwKho5udUq6Z/8Zz/z5zqsE8r7hJ0qpO9UR2il9zyemD0GHVqNW8/zqZ1n043V
	0msSyezJseWODUAc/Km1Ojes9sNd2GyJUeW9UynvdcJgUF31z0dJM+Z/mji8NQIjGm0Xa9+5i5I
	ww91+5lrCdMsZwq7cjlVtuFPatBmzxBk1R9EBk7X
X-Received: by 2002:a17:90b:3d11:b0:358:f010:759c with SMTP id
 98e67ed59e1d1-359be30b720mr10400034a91.24.1773079297515; Mon, 09 Mar 2026
 11:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
 <20260304174324.1186644-2-Harish.Sadineni@windriver.com> <da48a9fc8556f2a54e44f7e029be64182b0e8cf9.camel@linuxfoundation.org>
 <22371edb-5575-4636-88cc-462d0b19646c@windriver.com> <CADkTA4P3mPN8COS=Qeqf9Rzu3-E93r4j11x9b2hX5b2etR34zg@mail.gmail.com>
 <2e0e0fda-248c-4018-a9d1-2c6679560e2c@windriver.com>
In-Reply-To: <2e0e0fda-248c-4018-a9d1-2c6679560e2c@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Mar 2026 14:01:25 -0400
X-Gm-Features: AaiRm527oBLNrWNbXNj2q96tlk7VLtqYNYNm-Rd09RMXg449lyxm9n68amG_Ru4
Message-ID: <CADkTA4OZVd17y5v2XYzZx1gRqSE81A+RRo4-WaL13195GpKTAw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7 01/14] linux-yocto: conditionally add
 clang/rust/bindgen-cli-native to DEPENDS
To: Harish Sadineni <Harish.Sadineni@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, paul@pbarker.dev, yoann.congal@smile.fr
Content-Type: multipart/alternative; boundary="000000000000afe665064c9b31b2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 18:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232752

--000000000000afe665064c9b31b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 12:54=E2=80=AFPM Harish Sadineni <
Harish.Sadineni@windriver.com> wrote:

>
> On 3/9/2026 9:59 PM, Bruce Ashfield wrote:
>
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>
>
> On Mon, Mar 9, 2026 at 12:10=E2=80=AFPM Harish Sadineni <
> Harish.Sadineni@windriver.com> wrote:
>
>>
>> On 3/9/2026 4:56 PM, Richard Purdie wrote:
>>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>
>> On Wed, 2026-03-04 at 09:43 -0800, Sadineni, Harish via lists.openembedd=
ed.org <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveY=
dw8EvQ!cWPq0za66UhcuPm1JB9FSYJ5JMWWpL_480vZLcrK0BTZbuoPaFvjdJly1r2bF4S-jo8X=
5LrrrXkmL3xU90Zr5Er_U2VxaLk$> wrote:
>>
>> From: Harish Sadineni <Harish.Sadineni@windriver.com> <Harish.Sadineni@w=
indriver.com>
>>
>> Conditionally add 'clang-native', 'rust-native' and 'bindgen-cli-native'=
 to 'DEPENDS'
>> when Kernel Rust Support is enabled.
>>
>> These tools are required for building Rust-enabled kernels and for
>> generating Rust FFI bindings via bindgen during the kernel build.
>>
>> This ensures the additional dependencies are only pulled in when
>> Rust support is explicitly enabled, avoiding unnecessary native
>> dependencies for non-Rust kernel builds.
>>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com> <Harish.S=
adineni@windriver.com>
>> ---
>>  meta/recipes-kernel/linux/linux-yocto.inc <https://urldefense.com/v3/__=
http://linux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuPm1JB9FSYJ5JMWWpL_480vZ=
LcrK0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_ybuc9RA$> | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc <https://urldefen=
se.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuPm1JB9FSYJ5=
JMWWpL_480vZLcrK0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_ybuc9RA$> b=
/meta/recipes-kernel/linux/linux-yocto.inc <https://urldefense.com/v3/__htt=
p://linux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuPm1JB9FSYJ5JMWWpL_480vZLcr=
K0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_ybuc9RA$>
>> index 4d0a726bb6..b7961bbcdf 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc <https://urldefense.com/=
v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuPm1JB9FSYJ5JMWWpL_=
480vZLcrK0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_ybuc9RA$>
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc <https://urldefense.com/=
v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuPm1JB9FSYJ5JMWWpL_=
480vZLcrK0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_ybuc9RA$>
>> @@ -76,11 +76,14 @@ do_install:append(){
>>  KERNEL_FEATURES:append:qemuall =3D " features/kernel-sample/kernel-samp=
le.scc"
>>
>>  KERNEL_DEBUG ?=3D ""
>> +KERNEL_RUST_SUPPORT ?=3D ""
>>  # These used to be version specific, but are now common dependencies.  =
New
>>  # tools / dependencies will continue to be added in version specific re=
cipes.
>>  DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "power=
pc" ], "elfutils-native", "", d)}'
>>  DEPENDS +=3D "openssl-native util-linux-native"
>>  DEPENDS +=3D "gmp-native libmpc-native"
>> +RUST_KERNEL_DEPENDS ?=3D "${@bb.utils.contains('KERNEL_RUST_SUPPORT', '=
True', 'clang-native rust-native bindgen-cli-native', '', d)}" <$%7B@bb.uti=
ls.contains('KERNEL_RUST_SUPPORT','True','clang-nativerust-nativebindgen-cl=
i-native','',d)%7D>
>> +DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
>>
>>  # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-=
native available before do_kernel_configme
>>  do_kernel_configme[depends] +=3D '${@bb.utils.contains("KERNEL_DEBUG", =
"True", "pahole-native:do_populate_sysroot", "", d)}'
>>
>> I thought we were going to try and use KERNEL_FEATURES for this?
>>
>> Hi Richard,
>>
>> I have tried this but i got circular dependency error with
>> KERNEL_FEATURES. So, I opted using variable KERNEL_RUST_SUPPORT.
>>
>
> I'm curious about that. Can you share the details ? (diff and the bitbake
> error)
>
>
> As discussed previously, I attempted to use the following in
> meta/recipes-kernel/linux/linux-yocto_6.18.bb:
>
> KERNEL_FEATURES:append =3D " ${@bb.utils.contains('KERNEL_FEATURES',
> 'rust-kernel', ' features/kernel-rust/kernel-rust.scc', '', d)}"
>
> This resulted in a BitBake variable dependency chain failure. The issue
> occurs because the expression is trying to read KERNEL_FEATURES
> while simultaneously modifying KERNEL_FEATURES, which creates a circular
> dependency.
>

Yes, that's clearly not going to work, but that wouldn't have been the
suggestion.

Wasn't Richard asking about setting the RUST_KERNEL_DEPENDS based on the
KERNEL_FEATURES containing rust.scc ?

Bruce



>
> example:
>  The variable dependency chain for the failure is: KERNEL_FEATURES ->
> KERNEL_FEATURES -> KERNEL_FEATURES -> KERNEL_FEATURES...
>
> Thanks,
> Harish
>
>
> Bruce
>
>
>
>> The implementation of KERNEL_RUST_SUPPORT is problematic as it only
>> works for the value of "True", not "true", or "1" or 1 or any other
>> thing people might dream up. "Contains" isn't really an appropriate
>> mechanism for a boolean either.
>>
>> You can use bb.utils.to_boolean() as a way to better obtain a boolean
>> value from a random variable.
>>
>> Understood, Earlier i took reference from the code that already present
>> in that file.
>> I have updated the code we will send v8.
>>
>> Thanks,
>> Harish
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>
>>
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000afe665064c9b31b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div dir=3D"ltr"><div dir=3D"ltr"><div style=
=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Mar 9, 2026 at 12:54=E2=80=AFPM Hari=
sh Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windriver.com" target=3D"=
_blank">Harish.Sadineni@windriver.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div>
    <p><br>
    </p>
    <div>On 3/9/2026 9:59 PM, Bruce Ashfield
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
          <div dir=3D"ltr">
            <div style=3D"font-size:small"><br>
            </div>
          </div>
          <br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 9, 2026 at
              12:10=E2=80=AFPM Harish Sadineni &lt;<a href=3D"mailto:Harish=
.Sadineni@windriver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a=
>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <div>
                <p><br>
                </p>
                <div>On 3/9/2026 4:56 PM, Richard Purdie wrote:<br>
                </div>
                <blockquote type=3D"cite">
                  <pre>CAUTION: This email comes from a non Wind River emai=
l account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Wed, 2026-03-04 at 09:43 -0800, Sadineni, Harish via <a href=3D"https://=
urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!cWPq0za66=
UhcuPm1JB9FSYJ5JMWWpL_480vZLcrK0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr=
5Er_U2VxaLk$" target=3D"_blank">lists.openembedded.org</a> wrote:
</pre>
                  <blockquote type=3D"cite">
                    <pre>From: Harish Sadineni <a href=3D"mailto:Harish.Sad=
ineni@windriver.com" target=3D"_blank">&lt;Harish.Sadineni@windriver.com&gt=
;</a>

Conditionally add &#39;clang-native&#39;, &#39;rust-native&#39; and &#39;bi=
ndgen-cli-native&#39; to &#39;DEPENDS&#39;
when Kernel Rust Support is enabled.

These tools are required for building Rust-enabled kernels and for
generating Rust FFI bindings via bindgen during the kernel build.

This ensures the additional dependencies are only pulled in when
Rust support is explicitly enabled, avoiding unnecessary native
dependencies for non-Rust kernel builds.

Signed-off-by: Harish Sadineni <a href=3D"mailto:Harish.Sadineni@windriver.=
com" target=3D"_blank">&lt;Harish.Sadineni@windriver.com&gt;</a>
---
 meta/recipes-kernel/linux/<a href=3D"https://urldefense.com/v3/__http://li=
nux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuPm1JB9FSYJ5JMWWpL_480vZLcrK0BTZb=
uoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_ybuc9RA$" target=3D"_blank">linu=
x-yocto.inc</a> | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/<a href=3D"https://urldefense.com/v3=
/__http://linux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuPm1JB9FSYJ5JMWWpL_48=
0vZLcrK0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_ybuc9RA$" target=3D"=
_blank">linux-yocto.inc</a> b/meta/recipes-kernel/linux/<a href=3D"https://=
urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuPm1=
JB9FSYJ5JMWWpL_480vZLcrK0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_ybu=
c9RA$" target=3D"_blank">linux-yocto.inc</a>
index 4d0a726bb6..b7961bbcdf 100644
--- a/meta/recipes-kernel/linux/<a href=3D"https://urldefense.com/v3/__http=
://linux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuPm1JB9FSYJ5JMWWpL_480vZLcrK=
0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_ybuc9RA$" target=3D"_blank"=
>linux-yocto.inc</a>
+++ b/meta/recipes-kernel/linux/<a href=3D"https://urldefense.com/v3/__http=
://linux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuPm1JB9FSYJ5JMWWpL_480vZLcrK=
0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_ybuc9RA$" target=3D"_blank"=
>linux-yocto.inc</a>
@@ -76,11 +76,14 @@ do_install:append(){
 KERNEL_FEATURES:append:qemuall =3D &quot; features/kernel-sample/kernel-sa=
mple.scc&quot;

 KERNEL_DEBUG ?=3D &quot;&quot;
+KERNEL_RUST_SUPPORT ?=3D &quot;&quot;
 # These used to be version specific, but are now common dependencies.  New
 # tools / dependencies will continue to be added in version specific recip=
es.
 DEPENDS +=3D &#39;${@bb.utils.contains_any(&quot;ARCH&quot;, [ &quot;x86&q=
uot;, &quot;arm64&quot;, &quot;powerpc&quot; ], &quot;elfutils-native&quot;=
, &quot;&quot;, d)}&#39;
 DEPENDS +=3D &quot;openssl-native util-linux-native&quot;
 DEPENDS +=3D &quot;gmp-native libmpc-native&quot;
+RUST_KERNEL_DEPENDS ?=3D <a href=3D"mailto:$%7B@bb.utils.contains(&#39;KER=
NEL_RUST_SUPPORT&#39;,&#39;True&#39;,&#39;clang-nativerust-nativebindgen-cl=
i-native&#39;,&#39;&#39;,d)%7D" target=3D"_blank">&quot;${@bb.utils.contain=
s(&#39;KERNEL_RUST_SUPPORT&#39;, &#39;True&#39;, &#39;clang-native rust-nat=
ive bindgen-cli-native&#39;, &#39;&#39;, d)}&quot;</a>
+DEPENDS +=3D &quot;${RUST_KERNEL_DEPENDS}&quot;

 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-nat=
ive available before do_kernel_configme
 do_kernel_configme[depends] +=3D &#39;${@bb.utils.contains(&quot;KERNEL_DE=
BUG&quot;, &quot;True&quot;, &quot;pahole-native:do_populate_sysroot&quot;,=
 &quot;&quot;, d)}&#39;
</pre>
                  </blockquote>
                  <pre>I thought we were going to try and use KERNEL_FEATUR=
ES for this?</pre>
                </blockquote>
                Hi Richard,<br>
                <br>
                I have tried this but i got circular dependency error
                with KERNEL_FEATURES. So, I opted using variable
                KERNEL_RUST_SUPPORT.</div>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div style=3D"font-size:small">I&#39;m
                curious about that. Can you share the details ? (diff
                and the bitbake error)<br>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    As discussed previously, I attempted to use the following in
    meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.18.bb" target=
=3D"_blank">linux-yocto_6.18.bb</a>:<br>
    <br>
    KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&#39;KERNEL_FEAT=
URES&#39;,
    &#39;rust-kernel&#39;, &#39; features/kernel-rust/kernel-rust.scc&#39;,=
 &#39;&#39;, d)}&quot;<br>
    <br>
    This resulted in a BitBake variable dependency chain failure. The
    issue occurs because the expression is trying to read
    KERNEL_FEATURES <br>
    while simultaneously modifying KERNEL_FEATURES, which creates a
    circular dependency.<br></div></blockquote><div><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Yes, that&#39;s clearly not =
going to work, but that wouldn&#39;t have been the suggestion.<br><br>Wasn&=
#39;t Richard asking about setting the RUST_KERNEL_DEPENDS based on the KER=
NEL_FEATURES containing rust.scc ?</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div>
    <br>
    example:<br>
    =C2=A0The variable dependency chain for the failure is: KERNEL_FEATURES
    -&gt; KERNEL_FEATURES -&gt; KERNEL_FEATURES -&gt; KERNEL_FEATURES...<br=
>
    <br>
    Thanks,<br>
    Harish<br>
    <blockquote type=3D"cite">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote">
            <div>
              <div style=3D"font-size:small"><br>
              </div>
              <div style=3D"font-size:small">Bruce</div>
              <br>
            </div>
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <div><span style=3D"white-space:pre-wrap"></span>
                <blockquote type=3D"cite">
                  <pre>The implementation of KERNEL_RUST_SUPPORT is problem=
atic as it only
works for the value of &quot;True&quot;, not &quot;true&quot;, or &quot;1&q=
uot; or 1 or any other
thing people might dream up. &quot;Contains&quot; isn&#39;t really an appro=
priate
mechanism for a boolean either.

You can use bb.utils.to_boolean() as a way to better obtain a boolean
value from a random variable.</pre>
                </blockquote>
                Understood, Earlier i took reference from the code that
                already present in that file.
                <br>
                I have updated the code we will send v8.<br>
                <br>
                Thanks,<br>
                Harish<br>
                <blockquote type=3D"cite">
                  <pre>Cheers,

Richard





</pre>
                </blockquote>
              </div>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <div><br>
          </div>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not follo=
w
            the NULL pointer, for chaos and madness await thee at its
            end<br>
            - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
  </div>

</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
</div>

--000000000000afe665064c9b31b2--

