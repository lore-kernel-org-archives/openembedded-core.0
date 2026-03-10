Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E4AFD2D88
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 13:40:58 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40325.1773150052974203529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 06:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iRl7jhc9;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3598b2318c2so5642761a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 06:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773150052; cv=none;
        d=google.com; s=arc-20240605;
        b=d67Or1IfUIKWu/X4KHPTxQhnYjTOzArOCfxx18yL7A3gTk+zjUc8GHMcRc4cuc2plM
         tD6hMGrslO55a4BF4p1FQTziZR7jE6fohkJZXwup10LmP0svzjvR2wj0t5R90JoblUZ9
         IdTBWHbfSzB+XPi2wVF7XdeWG688fK+j5dW+Eiah2MQWgg7ducoV+51HGGJRPLyFbHPe
         oIfA1ikyhp7ZcVhVjiewS6PHltD7BIbgt0oQOQoJKECreHHuX8hUR1gwuGsS90V2h2FD
         lOazcnI/SSUVirt2O6WVma8bVu0jrMBYsGzaWjUldDN8+9gdx+I9tPgaltltLMjYhFHR
         kFog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uOP8Azk94Z80X0WcL4xlF6qa2MlvyfI9CPWEUVFFKEM=;
        fh=8D717AUHqlN75VTcQyWpptEJkZCCDhgf9FZqdLkWZJk=;
        b=KN9Y9DJ1FgkfJHmUnWm0HLC4cjjpvJ/4ixqRGGP3fANVslTl/PPi92XkrgZaomjCWY
         S98EHmHzXRiEwxgHMted0afJwXgCOCDewsb1Z4v8Rksq1vxvnVE/GGIdCiDqUN7A/0Vw
         +pOVjqLfosO50WUznOHNcvWoguHcWt6si1dW6MZ+8o7L0YufQo95oW5cha+ssZUuiEN7
         /7fLguwFo9YMdX7f1AlOLYhyLti4QjtPovFRFi8sjS+DObwNT+uNTn+7ny9o9Bt3MgUT
         27TCL9RP8lqwL9ycO9HlL6K81hwFPWgwVzaRVVpe6U8QElDg1sx/+XxOaaJK1r+4GmdA
         jj2w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773150052; x=1773754852; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uOP8Azk94Z80X0WcL4xlF6qa2MlvyfI9CPWEUVFFKEM=;
        b=iRl7jhc9sP8rlCjSWBwIDmdA1cgxxTJ7I3JoCkzr0Iv4HuR4mATM/L7evHwfdxTyNv
         f5aYlJM4B2SPbRGysmETAmXkWBEsZSd3YOiOvo7uTJlTYRM7bvSo7QRuMzan1dSilQrf
         RkthU1b8VCcsViKE0eX+LUZXCILeOq2fOx7x3sCIJ6ZqaPgmL4I2L1fQ/ou5gZUeS3Sn
         yi8bo075poWsaLJUjOA3XTiTJkJLIYuflHiDR8XXBox4+excORR36K0EZpBHDOkpjPy5
         dT/rR1b2uZf8K+x1jau33xt0u4UohSbX4KKvSrF9UuxeGwLsEbolFz+HBbXn9vR+WPe4
         KmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773150052; x=1773754852;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOP8Azk94Z80X0WcL4xlF6qa2MlvyfI9CPWEUVFFKEM=;
        b=jk7KhhkLitFR2hZldjZizXFuWeJJB0I8UprCNh/rf0R53fF7iYssgTmPNem2yVxT93
         3C146foBzsfY1n2GuUBjKYV5RwjGaHgNrl8T1PCrPqLU9o+ReZmKPQ2akexZaJTns0Et
         TZhcQi8uthL1lQYWjHKM+BhQsuvnvGdH1V5WpkDfnGvU6RTGbZ2g1h0iQxtPv/rokX+c
         Q+fsKSlrxms53QGcTCX04seXKEG+lBek+9Sj3tYIfeezi3v21tAXeviUZPw0UXyMsDRz
         gNsIIo6dJ9a7jQO/LeUlYPCAkGuE3S2BLaMqrzqc+b96jiQDYYjyueM7tTMX2torsepA
         AUPA==
X-Forwarded-Encrypted: i=1; AJvYcCWDCQIz3G5tL2lkdDQGHg8NLQzsGnwMLEyQc60+09TmuBNibrxWHpaZv7OxPw/rVUV33tYSaIH9XICcIo8ckk1M9A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxMJ+zdMzzM8X8jiJbsk4b0fAw+mmIVP+wols+6NTeOJPDjxpjC
	g2RIlHbGxjwfxRwIrVHv16ZHPDJhI0vgLDgNifQId4/ehLgTK1RXrk3VQ1BAAFzhoNyaHXrA8gY
	keRuEUxJ5HgT/0g7bVpBPcH6jIvTCsjs=
X-Gm-Gg: ATEYQzwzIZBEYZtXKYArzUX5+wSgJH/xNOtIaLjP7Anfo2hQkwpQAx5/M+q6+PmD4oH
	j+/Botrg8Gt5H3CNpXSyJtKOkE5gcyI+wuF/Pv3beWvAplMpJZWEyeAtcvzl+xXSdT9r6vWHVOY
	AO8nEDOc8A44EAq34uShKb/9+BKH1X2WBmXTewwdj2HrKQenmhshXbaF/7CBdl8fj0Xa57smNzJ
	NtPyjj5wDCYDaaxhYADDWNiCP6jIFdk++G6U4XHCPVj9fxyFqfv4JItkrCbFmhiYrhRHhmlC2vm
	QoqcCZIl/JmWKHkNDmqXZUmm5/NqeH6ucHfEuiQ2
X-Received: by 2002:a17:90b:5346:b0:359:8a78:569c with SMTP id
 98e67ed59e1d1-359be374e1amr13044400a91.25.1773150052266; Tue, 10 Mar 2026
 06:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
 <20260304174324.1186644-2-Harish.Sadineni@windriver.com> <da48a9fc8556f2a54e44f7e029be64182b0e8cf9.camel@linuxfoundation.org>
 <22371edb-5575-4636-88cc-462d0b19646c@windriver.com> <CADkTA4P3mPN8COS=Qeqf9Rzu3-E93r4j11x9b2hX5b2etR34zg@mail.gmail.com>
 <2e0e0fda-248c-4018-a9d1-2c6679560e2c@windriver.com> <CADkTA4OZVd17y5v2XYzZx1gRqSE81A+RRo4-WaL13195GpKTAw@mail.gmail.com>
 <cff0fc23fcf9e5176fc4830f1ff395a79bcaffe8.camel@linuxfoundation.org>
 <638a690c-6890-47da-a604-a25b86140139@windriver.com> <CADkTA4O0dKthNDw5mM473SCd-2_MQXUDoMCQnkwQKafWW=mPXQ@mail.gmail.com>
 <66dd7f13-045b-499a-a79a-2753e5f35014@windriver.com>
In-Reply-To: <66dd7f13-045b-499a-a79a-2753e5f35014@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Mar 2026 09:40:40 -0400
X-Gm-Features: AaiRm50smKYj48LYLT7He4pRv4IQP2HiB6_US2KHSKVwmG7j_0fZg4Pin65Fl0U
Message-ID: <CADkTA4P3uzGO+6uqFaWdeuSGXpOqbKeSSA=KQUJHJ+Kyau=8ZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7 01/14] linux-yocto: conditionally add
 clang/rust/bindgen-cli-native to DEPENDS
To: Harish Sadineni <Harish.Sadineni@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, paul@pbarker.dev, yoann.congal@smile.fr
Content-Type: multipart/alternative; boundary="000000000000ffb6f8064cabaad4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 13:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232785

--000000000000ffb6f8064cabaad4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 9:30=E2=80=AFAM Harish Sadineni <
Harish.Sadineni@windriver.com> wrote:

>
> On 3/10/2026 6:14 PM, Bruce Ashfield wrote:
>
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>
>
> On Tue, Mar 10, 2026 at 6:58=E2=80=AFAM Harish Sadineni <
> Harish.Sadineni@windriver.com> wrote:
>
>>
>> On 3/10/2026 12:50 AM, Richard Purdie wrote:
>> > CAUTION: This email comes from a non Wind River email account!
>> > Do not click links or open attachments unless you recognize the sender
>> and know the content is safe.
>> >
>> > On Mon, 2026-03-09 at 14:01 -0400, Bruce Ashfield wrote:
>> >>
>> >>
>> >> On Mon, Mar 9, 2026 at 12:54=E2=80=AFPM Harish Sadineni
>> >> <Harish.Sadineni@windriver.com> wrote:
>> >>>
>> >>>
>> >>>
>> >>>
>> >>> On 3/9/2026 9:59 PM, Bruce Ashfield wrote:
>> >>>
>> >>>
>> >>>> CAUTION: This email comes from a non Wind River email account!
>> >>>>   Do not click links or open attachments unless you recognize the
>> >>>> sender and know the content is safe.
>> >>>>
>> >>>>
>> >>>>
>> >>>>
>> >>>>
>> >>>>
>> >>>>
>> >>>>
>> >>>>
>> >>>>
>> >>>>
>> >>>> On Mon, Mar 9, 2026 at 12:10=E2=80=AFPM Harish Sadineni
>> >>>> <Harish.Sadineni@windriver.com> wrote:
>> >>>>
>> >>>>
>> >>>>>
>> >>>>>
>> >>>>>
>> >>>>>
>> >>>>> On 3/9/2026 4:56 PM, Richard Purdie wrote:
>> >>>>>
>> >>>>>
>> >>>>>> CAUTION: This email comes from a non Wind River email
>> >>>>>> account!
>> >>>>>> Do not click links or open attachments unless you recognize
>> >>>>>> the sender and know the content is safe.
>> >>>>>>
>> >>>>>> On Wed, 2026-03-04 at 09:43 -0800, Sadineni, Harish via
>> >>>>>> lists.openembedded.org
>> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8E=
vQ!ekkiIdFR1oUUFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqU=
aeJv3wtCoY4XeJd8am36JgQ$>
>> wrote:
>> >>>>>>
>> >>>>>>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>> >>>>>>>
>> >>>>>>> Conditionally add 'clang-native', 'rust-native' and
>> >>>>>>> 'bindgen-cli-native' to 'DEPENDS'
>> >>>>>>> when Kernel Rust Support is enabled.
>> >>>>>>>
>> >>>>>>> These tools are required for building Rust-enabled kernels
>> >>>>>>> and for
>> >>>>>>> generating Rust FFI bindings via bindgen during the kernel
>> >>>>>>> build.
>> >>>>>>>
>> >>>>>>> This ensures the additional dependencies are only pulled in
>> >>>>>>> when
>> >>>>>>> Rust support is explicitly enabled, avoiding unnecessary
>> >>>>>>> native
>> >>>>>>> dependencies for non-Rust kernel builds.
>> >>>>>>>
>> >>>>>>> Signed-off-by: Harish Sadineni
>> >>>>>>> <Harish.Sadineni@windriver.com>
>> >>>>>>> ---
>> >>>>>>>   meta/recipes-kernel/linux/linux-yocto.inc
>> <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!ekki=
IdFR1oUUFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqUaeJv3wt=
CoY4XeJd8KLPsVX0$>
>> | 3 +++
>> >>>>>>>   1 file changed, 3 insertions(+)
>> >>>>>>>
>> >>>>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>> <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!ekki=
IdFR1oUUFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqUaeJv3wt=
CoY4XeJd8KLPsVX0$>
>> >>>>>>> b/meta/recipes-kernel/linux/linux-yocto.inc
>> <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!ekki=
IdFR1oUUFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqUaeJv3wt=
CoY4XeJd8KLPsVX0$>
>> >>>>>>> index 4d0a726bb6..b7961bbcdf 100644
>> >>>>>>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!ekki=
IdFR1oUUFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqUaeJv3wt=
CoY4XeJd8KLPsVX0$>
>> >>>>>>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> <https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!ekki=
IdFR1oUUFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqUaeJv3wt=
CoY4XeJd8KLPsVX0$>
>> >>>>>>> @@ -76,11 +76,14 @@ do_install:append(){
>> >>>>>>>   KERNEL_FEATURES:append:qemuall =3D " features/kernel-
>> >>>>>>> sample/kernel-sample.scc"
>> >>>>>>>
>> >>>>>>>   KERNEL_DEBUG ?=3D ""
>> >>>>>>> +KERNEL_RUST_SUPPORT ?=3D ""
>> >>>>>>>   # These used to be version specific, but are now common
>> >>>>>>> dependencies.  New
>> >>>>>>>   # tools / dependencies will continue to be added in
>> >>>>>>> version specific recipes.
>> >>>>>>>   DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86",
>> >>>>>>> "arm64", "powerpc" ], "elfutils-native", "", d)}'
>> >>>>>>>   DEPENDS +=3D "openssl-native util-linux-native"
>> >>>>>>>   DEPENDS +=3D "gmp-native libmpc-native"
>> >>>>>>> +RUST_KERNEL_DEPENDS ?=3D
>> >>>>>>> "${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True',
>> >>>>>>> 'clang-native rust-native bindgen-cli-native', '', d)}"
>> >>>>>>> +DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
>> >>>>>>>
>> >>>>>>>   # Some options depend on CONFIG_PAHOLE_VERSION, so need to
>> >>>>>>> make pahole-native available before do_kernel_configme
>> >>>>>>>   do_kernel_configme[depends] +=3D
>> >>>>>>> '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-
>> >>>>>>> native:do_populate_sysroot", "", d)}'
>> >>>>>>>
>> >>>>>> I thought we were going to try and use KERNEL_FEATURES for
>> >>>>>> this?
>> >>>>>>
>> >>>>>   Hi Richard,
>> >>>>>
>> >>>>>   I have tried this but i got circular dependency error with
>> >>>>> KERNEL_FEATURES. So, I opted using variable
>> >>>>> KERNEL_RUST_SUPPORT.
>> >>>>>
>> >>>>>
>> >>>>
>> >>>>
>> >>>>
>> >>>>
>> >>>> I'm curious about that. Can you share the details ? (diff and the
>> >>>> bitbake error)
>> >>>>
>> >>>>
>> >>>>
>> >>>>
>> >>>>
>> >>>>
>> >>>   As discussed previously, I attempted to use the following in
>> >>> meta/recipes-kernel/linux/linux-yocto_6.18.bb
>> <https://urldefense.com/v3/__http://linux-yocto_6.18.bb__;!!AjveYdw8EvQ!=
ekkiIdFR1oUUFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqUaeJ=
v3wtCoY4XeJd8cBMffSY$>
>> :
>> >>>
>> >>>   KERNEL_FEATURES:append =3D " ${@bb.utils.contains('KERNEL_FEATURES=
',
>> >>> 'rust-kernel', ' features/kernel-rust/kernel-rust.scc', '', d)}"
>> >>>
>> >>>   This resulted in a BitBake variable dependency chain failure. The
>> >>> issue occurs because the expression is trying to read
>> >>> KERNEL_FEATURES
>> >>>   while simultaneously modifying KERNEL_FEATURES, which creates a
>> >>> circular dependency.
>> >>>
>> >>
>> >> Yes, that's clearly not going to work, but that wouldn't have been
>> >> the suggestion.
>> >>
>> >> Wasn't Richard asking about setting the RUST_KERNEL_DEPENDS based on
>> >> the KERNEL_FEATURES containing rust.scc ?
>> We understood like Richard suggestion is to use KERNEL_FEATURES
>> everywhere instead of KERNEL_RUST_SUPPORT variable.
>>
>> We can use the KERNEL_RUST_SUPPORT variable to append rust.scc to
>> KERNEL_FEATURES and then we could make other checks depends on
>> KERNEL_FEATURES.
>> But as the other recipes (make-mod-scripts, kernel-devsrc,
>> module-rust.bbclass) do not know about KERNEL_FEATURES, so again we've
>> to depend on KERNEL_RUST_SUPPORT Variable.
>>
>
> I'm curious as to what you think is different about KERNEL_RUST_SUPPORT
> and KERNEL_FEATURES as variables ?
>
> There is no difference i guess.
>
>
> They are both defined in the kernel recipe namespace, so any limitations
> about
> the visibility of one, is true about the other.
>
>
> We will set KERNEL_RUST_SUPPORT =3D "true" in local.conf, so it is global=
ly
> visible.
>

And of course a feature can't count on something being set in local.conf,
it must be a variable that users need to set in their distro or other
similarly
global configuration.

Bruce



>
> In contrast, KERNEL_FEATURES is conditionally set based on
> KERNEL_RUST_SUPPORT inside the kernel recipe,
> meaning its value is only determined at the recipe level and not
> accessible elsewhere.
>
> Thanks,
> Harish
>
>
> or am I missing something ?
>
> Bruce
>
>
>>
>> So, for consistency we used everywhere KERNEL_RUST_SUPPORT.
>>
>> Is this implementation ok or we should switch to use -
>> KERNEL_FEATURES in kernel recipes and
>> KERNEL_RUST_SUPPORT in other recipes.
>>
>> Thanks,
>> Harish
>> > Yes, along with maybe with a tweak to the KERNEL_FEATURES code which
>> > could expand " rust " or maybe " kernel-rust "in KERNEL_FEATURES into
>> > "features/kernel-rust/kernel-rust.scc" too just so there was a nice
>> > short cut for it?
>> >
>> > Cheers,
>> >
>> > Richard
>> >
>> >
>> >
>>
>
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

--000000000000ffb6f8064cabaad4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 10, 2026 at 9:30=
=E2=80=AFAM Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windriver=
.com">Harish.Sadineni@windriver.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div>
    <p><br>
    </p>
    <div>On 3/10/2026 6:14 PM, Bruce Ashfield
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
            <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 10, 2026 at
              6:58=E2=80=AFAM Harish Sadineni &lt;<a href=3D"mailto:Harish.=
Sadineni@windriver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>=
&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              On 3/10/2026 12:50 AM, Richard Purdie wrote:<br>
              &gt; CAUTION: This email comes from a non Wind River email
              account!<br>
              &gt; Do not click links or open attachments unless you
              recognize the sender and know the content is safe.<br>
              &gt;<br>
              &gt; On Mon, 2026-03-09 at 14:01 -0400, Bruce Ashfield
              wrote:<br>
              &gt;&gt;<br>
              &gt;&gt;<br>
              &gt;&gt; On Mon, Mar 9, 2026 at 12:54=E2=80=AFPM Harish Sadin=
eni<br>
              &gt;&gt; &lt;<a href=3D"mailto:Harish.Sadineni@windriver.com"=
 target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;
              wrote:<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt; On 3/9/2026 9:59 PM, Bruce Ashfield wrote:<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt; CAUTION: This email comes from a non Wind
              River email account!<br>
              &gt;&gt;&gt;&gt;=C2=A0 =C2=A0Do not click links or open attac=
hments
              unless you recognize the<br>
              &gt;&gt;&gt;&gt; sender and know the content is safe.<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt; On Mon, Mar 9, 2026 at 12:10=E2=80=AFPM Hari=
sh
              Sadineni<br>
              &gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:Harish.Sadineni@windri=
ver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;
              wrote:<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt; On 3/9/2026 4:56 PM, Richard Purdie
              wrote:<br>
              &gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt; CAUTION: This email comes from a
              non Wind River email<br>
              &gt;&gt;&gt;&gt;&gt;&gt; account!<br>
              &gt;&gt;&gt;&gt;&gt;&gt; Do not click links or open
              attachments unless you recognize<br>
              &gt;&gt;&gt;&gt;&gt;&gt; the sender and know the content
              is safe.<br>
              &gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt; On Wed, 2026-03-04 at 09:43
              -0800, Sadineni, Harish via<br>
              &gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://urldefense.com/v3=
/__http://lists.openembedded.org__;!!AjveYdw8EvQ!ekkiIdFR1oUUFgkUmXVgRrlc4N=
10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqUaeJv3wtCoY4XeJd8am36JgQ$" rel=
=3D"noreferrer" target=3D"_blank">
                lists.openembedded.org</a> wrote:<br>
              &gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; From: Harish Sadineni &lt;<a hre=
f=3D"mailto:Harish.Sadineni@windriver.com" target=3D"_blank">Harish.Sadinen=
i@windriver.com</a>&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; Conditionally add
              &#39;clang-native&#39;, &#39;rust-native&#39; and<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; &#39;bindgen-cli-native&#39; to
              &#39;DEPENDS&#39;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; when Kernel Rust Support is
              enabled.<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; These tools are required for
              building Rust-enabled kernels<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; and for<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; generating Rust FFI bindings
              via bindgen during the kernel<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; build.<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; This ensures the additional
              dependencies are only pulled in<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; when<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; Rust support is explicitly
              enabled, avoiding unnecessary<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; native<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; dependencies for non-Rust
              kernel builds.<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Harish
              Sadineni<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:Harish.Sad=
ineni@windriver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt=
;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0meta/recipes-kernel/=
linux/<a href=3D"https://urldefense.com/v3/__http://linux-yocto.inc__;!!Ajv=
eYdw8EvQ!ekkiIdFR1oUUFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyP=
NmuAqUaeJv3wtCoY4XeJd8KLPsVX0$" target=3D"_blank">linux-yocto.inc</a> | 3 +=
++<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A01 file changed, 3
              insertions(+)<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git
              a/meta/recipes-kernel/linux/<a href=3D"https://urldefense.com=
/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!ekkiIdFR1oUUFgkUmXVgRrlc4N10os=
QLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqUaeJv3wtCoY4XeJd8KLPsVX0$" target=
=3D"_blank">linux-yocto.inc</a><br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; b/meta/recipes-kernel/linux/<a h=
ref=3D"https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!e=
kkiIdFR1oUUFgkUmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqUaeJv=
3wtCoY4XeJd8KLPsVX0$" target=3D"_blank">linux-yocto.inc</a><br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; index 4d0a726bb6..b7961bbcdf
              100644<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; ---
              a/meta/recipes-kernel/linux/<a href=3D"https://urldefense.com=
/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!ekkiIdFR1oUUFgkUmXVgRrlc4N10os=
QLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqUaeJv3wtCoY4XeJd8KLPsVX0$" target=
=3D"_blank">linux-yocto.inc</a><br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; +++
              b/meta/recipes-kernel/linux/<a href=3D"https://urldefense.com=
/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!ekkiIdFR1oUUFgkUmXVgRrlc4N10os=
QLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqUaeJv3wtCoY4XeJd8KLPsVX0$" target=
=3D"_blank">linux-yocto.inc</a><br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -76,11 +76,14 @@
              do_install:append(){<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0
              =C2=A0KERNEL_FEATURES:append:qemuall =3D &quot; features/kern=
el-<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; sample/kernel-sample.scc&quot;<b=
r>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0KERNEL_DEBUG ?=3D &q=
uot;&quot;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; +KERNEL_RUST_SUPPORT ?=3D &quot;=
&quot;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# These used to be v=
ersion
              specific, but are now common<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; dependencies.=C2=A0 New<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# tools / dependenci=
es will
              continue to be added in<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; version specific recipes.<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0DEPENDS +=3D
              &#39;${@bb.utils.contains_any(&quot;ARCH&quot;, [ &quot;x86&q=
uot;,<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; &quot;arm64&quot;, &quot;powerpc=
&quot; ],
              &quot;elfutils-native&quot;, &quot;&quot;, d)}&#39;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0DEPENDS +=3D &quot;o=
penssl-native
              util-linux-native&quot;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0DEPENDS +=3D &quot;g=
mp-native
              libmpc-native&quot;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; +RUST_KERNEL_DEPENDS ?=3D<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;
              &quot;${@bb.utils.contains(&#39;KERNEL_RUST_SUPPORT&#39;, &#3=
9;True&#39;,<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; &#39;clang-native rust-native
              bindgen-cli-native&#39;, &#39;&#39;, d)}&quot;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; +DEPENDS +=3D
              &quot;${RUST_KERNEL_DEPENDS}&quot;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Some options depen=
d on
              CONFIG_PAHOLE_VERSION, so need to<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; make pahole-native available
              before do_kernel_configme<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0do_kernel_configme[d=
epends]
              +=3D<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;
              &#39;${@bb.utils.contains(&quot;KERNEL_DEBUG&quot;, &quot;Tru=
e&quot;, &quot;pahole-<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt; native:do_populate_sysroot&quot;=
,
              &quot;&quot;, d)}&#39;<br>
              &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;&gt; I thought we were going to try
              and use KERNEL_FEATURES for<br>
              &gt;&gt;&gt;&gt;&gt;&gt; this?<br>
              &gt;&gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0Hi Richard,<br>
              &gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0I have tried this but i got
              circular dependency error with<br>
              &gt;&gt;&gt;&gt;&gt; KERNEL_FEATURES. So, I opted using
              variable<br>
              &gt;&gt;&gt;&gt;&gt; KERNEL_RUST_SUPPORT.<br>
              &gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt; I&#39;m curious about that. Can you share th=
e
              details ? (diff and the<br>
              &gt;&gt;&gt;&gt; bitbake error)<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;&gt;<br>
              &gt;&gt;&gt;=C2=A0 =C2=A0As discussed previously, I attempted=
 to use
              the following in<br>
              &gt;&gt;&gt; meta/recipes-kernel/linux/<a href=3D"https://url=
defense.com/v3/__http://linux-yocto_6.18.bb__;!!AjveYdw8EvQ!ekkiIdFR1oUUFgk=
UmXVgRrlc4N10osQLVSoHUP7tqKnyuU2FDh5UdcpyUkPIW6qIyPNmuAqUaeJv3wtCoY4XeJd8cB=
MffSY$" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.18.bb</a>:<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt;=C2=A0 =C2=A0KERNEL_FEATURES:append =3D &quot;
              ${@bb.utils.contains(&#39;KERNEL_FEATURES&#39;,<br>
              &gt;&gt;&gt; &#39;rust-kernel&#39;, &#39;
              features/kernel-rust/kernel-rust.scc&#39;, &#39;&#39;, d)}&qu=
ot;<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt;=C2=A0 =C2=A0This resulted in a BitBake variable
              dependency chain failure. The<br>
              &gt;&gt;&gt; issue occurs because the expression is trying
              to read<br>
              &gt;&gt;&gt; KERNEL_FEATURES<br>
              &gt;&gt;&gt;=C2=A0 =C2=A0while simultaneously modifying
              KERNEL_FEATURES, which creates a<br>
              &gt;&gt;&gt; circular dependency.<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;<br>
              &gt;&gt; Yes, that&#39;s clearly not going to work, but that
              wouldn&#39;t have been<br>
              &gt;&gt; the suggestion.<br>
              &gt;&gt;<br>
              &gt;&gt; Wasn&#39;t Richard asking about setting the
              RUST_KERNEL_DEPENDS based on<br>
              &gt;&gt; the KERNEL_FEATURES containing rust.scc ?<br>
              We understood like Richard suggestion is to use
              KERNEL_FEATURES <br>
              everywhere instead of KERNEL_RUST_SUPPORT variable.<br>
              <br>
              We can use the KERNEL_RUST_SUPPORT variable to append
              rust.scc to <br>
              KERNEL_FEATURES and then we could make other checks
              depends on <br>
              KERNEL_FEATURES.<br>
              But as the other recipes (make-mod-scripts, kernel-devsrc,
              <br>
              module-rust.bbclass) do not know about KERNEL_FEATURES, so
              again we&#39;ve <br>
              to depend on KERNEL_RUST_SUPPORT Variable.<br>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div style=3D"font-size:small">I&#39;m
                curious as to what you think is different about
                KERNEL_RUST_SUPPORT</div>
              <div style=3D"font-size:small">and
                KERNEL_FEATURES as variables ?</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    There is no difference i guess.<br>
    <blockquote type=3D"cite">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote">
            <div>
              <div style=3D"font-size:small"><br>
              </div>
              <div style=3D"font-size:small">They
                are both defined in the kernel recipe namespace, so any
                limitations about</div>
              <div style=3D"font-size:small">the
                visibility of one, is true about the other.</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    We will set KERNEL_RUST_SUPPORT =3D &quot;true&quot; in local.conf, so =
it is
    globally visible.</div></blockquote><div><br></div><div><div class=3D"g=
mail_default" style=3D"font-size:small">And of course a feature can&#39;t c=
ount on something being set in local.conf,</div><div class=3D"gmail_default=
" style=3D"font-size:small">it must be a variable that users need to set in=
 their distro or other similarly</div><div class=3D"gmail_default" style=3D=
"font-size:small">global configuration.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div> <br>
    In contrast, KERNEL_FEATURES is conditionally set based on
    KERNEL_RUST_SUPPORT inside the kernel recipe, <br>
    meaning its value is only determined at the recipe level and not
    accessible elsewhere.<br>
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
              <div style=3D"font-size:small">or am I
                missing something ?</div>
              <div style=3D"font-size:small"><br>
              </div>
              <div style=3D"font-size:small">Bruce</div>
            </div>
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              So, for consistency we used everywhere
              KERNEL_RUST_SUPPORT.<br>
              <br>
              Is this implementation ok or we should switch to use -<br>
              KERNEL_FEATURES in kernel recipes and<br>
              KERNEL_RUST_SUPPORT in other recipes.<br>
              <br>
              Thanks,<br>
              Harish<br>
              &gt; Yes, along with maybe with a tweak to the
              KERNEL_FEATURES code which<br>
              &gt; could expand &quot; rust &quot; or maybe &quot; kernel-r=
ust &quot;in
              KERNEL_FEATURES into<br>
              &gt; &quot;features/kernel-rust/kernel-rust.scc&quot; too jus=
t so
              there was a nice<br>
              &gt; short cut for it?<br>
              &gt;<br>
              &gt; Cheers,<br>
              &gt;<br>
              &gt; Richard<br>
              &gt;<br>
              &gt;<br>
              &gt;<br>
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

--000000000000ffb6f8064cabaad4--

