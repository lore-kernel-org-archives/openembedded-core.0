Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CB5FD2D6C
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 12:44:58 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39145.1773146690735170770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 05:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f+vWg3/Q;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso6266988a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 05:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773146690; cv=none;
        d=google.com; s=arc-20240605;
        b=b4pqGt2xu/3I4R+N4dmzXlH0KYKDCUZ9oWCfSaWmigaGAWPEnTyGh0Abp9oKs8Cgyp
         CbbHaz2xsv3h6BIofTEAScuTaORaG0KYBI63oIfhlBn2jzN0V5/cw0pfN5eGw9Z4DpNt
         dbC0fyZ03owk8+hhjwcNsmezSHIZDY8vI/yFY1pK5AyeB+vCWtH7WEb/y2SXL/kITOQr
         WQuK9830iX7MXs6xcTnk1Fj+FrCDPyPkFFAe/CvOcUJdKGDIfdg0CFFeHAn6O+cWSjOR
         /QW9iwVYR3siMyYjav8M8F64Ga/X1YPHwg6XubNsTq+mFX48HnXMofWb2M64w36NH5R1
         3XCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6QtpJLRDbmyvaHfQKVJ0ZvSCwxIPvRXud8yLq7a8Lc8=;
        fh=a1/erI9LR+3sDWVQHpeUsITKP1lePNUxowSF7H+ohzA=;
        b=Ep4d1o9J5h1UwoANh8aKzjTfRO95Ledb1kIiJ06cO4omIPdSITk38qxNjBCVjHeTlf
         bW4FFjKJT8QeaLu5q6d+1fA0PLdgUf/4X1uZGJXJhtA31cOsZNMbmW6x+pNm4vNhLOGq
         1c8Ri0lr+0rLCTlCS4zIYgRHn2dhx1xdylxQ/kO7TNCGQWZ5/Vat1hFaZD18IPLGTwIC
         G5gCJB3UAzPVmDc4j8lpSwazkfKWseq8NjfNEZO2RbEWr7QBR7Z2MOHhAJN+aXn+MogX
         WBRZSUt6jcwGNm8DxiMLyg6Jkyyny5LThGtYwCakyeCrARF+BVicvYXMqLXq6/0fcmXb
         SLJw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773146690; x=1773751490; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6QtpJLRDbmyvaHfQKVJ0ZvSCwxIPvRXud8yLq7a8Lc8=;
        b=f+vWg3/QzdR9UduIDUqgbu0DgsJejHPQIGRb5fsEDPT9yAMxh6FT3+vpPVuwRYyKxP
         SUXir9JjxCzVmZxK4Mez3EgkU+a14h1BywpGPvXT7hAXywnvo6L77z5g7ToXjMD55Yq9
         8RL3Ku6UGV/5N7RpFcGUa3jAyDKrUtMCUwE8yOVGsL12S4XgQwd4745fzKvVNBrO/Geh
         nbUPA+ZNeD4U2/+LJvYaUg7H48OOkJdmPP+AmyXiSCtalBOc9oIinwsgcKr7D7qy+VVV
         epfZ1MSaQOUn72/dJcAMzXtI4SprBhapCNLsMOMxFbkssfdsjhIoJDJEBCfbtSrHNy4H
         HHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146690; x=1773751490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QtpJLRDbmyvaHfQKVJ0ZvSCwxIPvRXud8yLq7a8Lc8=;
        b=A5cPGy6Aw4wlTuqn2xjaomZtdYbrE4qUqa0RJNiBFeNkEApjVHbWQgajGxrBLmD0Qt
         K1anTTZtxtky6feJXBZoWjY/Tmp7Ru1Y4irvvCdcMpHOhOqrqFIfqxQXDEyBOArEtWh+
         C278BiYaQi11lk3iIOWQYmYGu9f5II78tAd/7B7CIurWUBizH0vsn0783iPSJNbrgu2h
         a84O6O7UuEhOYXYA70et+3dhpl0rHbtdJl74hOFDdjlOMj2yH+aANL8fm29jVH7/nL5y
         IEwAGz/4yyYjUmABAR660yLkKxoGt7wkWgNFZzQW7uiQrsj4JQcLswdoY06po48f/uHj
         UN8A==
X-Forwarded-Encrypted: i=1; AJvYcCX/UqWlmhMo8A7mEUVKU0B3MVhYS1WWx/LfTKsFIK3Nz9F31Nx1THS1ghKk1urf70vBFPpLCiKF6heBOF7ccNLsgg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxY9/HKkMD4neRpo1oAz7iXPQyYvTua3gJJ+9taA1jaAHgwmHQE
	re9MrQ8BJvG6Byd7TTUZUe79soRDALSth4WBkhJ3kIiSU1EpbYe26rYChsR4+OdRKLil3UvGZrG
	jTBiCHRHLG+tJ8NXKWZuJGwPWKClbJfc=
X-Gm-Gg: ATEYQzwNoLcWnv4rwcs28pXbuvF4CWcoCQT7Af3+AiJafHSPV+IO1i/KzOri02Kaclf
	CbesTn4A5Qsfn7w0vBvR7XEkH1LADqYhn7wjNJ36hyjJr4j1vZokBRYAj4On2SBRAmu6AbZGYF7
	5Iuwda0vj6hqoXOYW+M1EQQkoqtiUMN6Wp9dpGhdcoiVxPjaPTNBS0SsTt3VuVQ/6pUZ2/TrsRW
	ngzOwLchToJ1Egk3CO1n6TjsWr/Iree9I+mKzh9lbo8MoWV686Mo1rmwJQ4wXmeVv3xUGs9NfcF
	6bp1gp2MCs/Eew0OJF+S9/ZwcE00Lj7AaW3SlK3t
X-Received: by 2002:a17:90b:3810:b0:359:fb49:eb08 with SMTP id
 98e67ed59e1d1-359fb49f2cbmr517190a91.18.1773146690054; Tue, 10 Mar 2026
 05:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
 <20260304174324.1186644-2-Harish.Sadineni@windriver.com> <da48a9fc8556f2a54e44f7e029be64182b0e8cf9.camel@linuxfoundation.org>
 <22371edb-5575-4636-88cc-462d0b19646c@windriver.com> <CADkTA4P3mPN8COS=Qeqf9Rzu3-E93r4j11x9b2hX5b2etR34zg@mail.gmail.com>
 <2e0e0fda-248c-4018-a9d1-2c6679560e2c@windriver.com> <CADkTA4OZVd17y5v2XYzZx1gRqSE81A+RRo4-WaL13195GpKTAw@mail.gmail.com>
 <cff0fc23fcf9e5176fc4830f1ff395a79bcaffe8.camel@linuxfoundation.org> <638a690c-6890-47da-a604-a25b86140139@windriver.com>
In-Reply-To: <638a690c-6890-47da-a604-a25b86140139@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Mar 2026 08:44:37 -0400
X-Gm-Features: AaiRm51hwWJEHMaNOZxmhiT8IKc4dzHt2sgIUgwTsH1JdgiG7FTlmwOzduUGt1M
Message-ID: <CADkTA4O0dKthNDw5mM473SCd-2_MQXUDoMCQnkwQKafWW=mPXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7 01/14] linux-yocto: conditionally add
 clang/rust/bindgen-cli-native to DEPENDS
To: Harish Sadineni <Harish.Sadineni@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, paul@pbarker.dev, yoann.congal@smile.fr
Content-Type: multipart/alternative; boundary="000000000000986cf3064caae219"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 12:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232776

--000000000000986cf3064caae219
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 6:58=E2=80=AFAM Harish Sadineni <
Harish.Sadineni@windriver.com> wrote:

>
> On 3/10/2026 12:50 AM, Richard Purdie wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender
> and know the content is safe.
> >
> > On Mon, 2026-03-09 at 14:01 -0400, Bruce Ashfield wrote:
> >>
> >>
> >> On Mon, Mar 9, 2026 at 12:54=E2=80=AFPM Harish Sadineni
> >> <Harish.Sadineni@windriver.com> wrote:
> >>>
> >>>
> >>>
> >>>
> >>> On 3/9/2026 9:59 PM, Bruce Ashfield wrote:
> >>>
> >>>
> >>>> CAUTION: This email comes from a non Wind River email account!
> >>>>   Do not click links or open attachments unless you recognize the
> >>>> sender and know the content is safe.
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>> On Mon, Mar 9, 2026 at 12:10=E2=80=AFPM Harish Sadineni
> >>>> <Harish.Sadineni@windriver.com> wrote:
> >>>>
> >>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 3/9/2026 4:56 PM, Richard Purdie wrote:
> >>>>>
> >>>>>
> >>>>>> CAUTION: This email comes from a non Wind River email
> >>>>>> account!
> >>>>>> Do not click links or open attachments unless you recognize
> >>>>>> the sender and know the content is safe.
> >>>>>>
> >>>>>> On Wed, 2026-03-04 at 09:43 -0800, Sadineni, Harish via
> >>>>>> lists.openembedded.org wrote:
> >>>>>>
> >>>>>>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
> >>>>>>>
> >>>>>>> Conditionally add 'clang-native', 'rust-native' and
> >>>>>>> 'bindgen-cli-native' to 'DEPENDS'
> >>>>>>> when Kernel Rust Support is enabled.
> >>>>>>>
> >>>>>>> These tools are required for building Rust-enabled kernels
> >>>>>>> and for
> >>>>>>> generating Rust FFI bindings via bindgen during the kernel
> >>>>>>> build.
> >>>>>>>
> >>>>>>> This ensures the additional dependencies are only pulled in
> >>>>>>> when
> >>>>>>> Rust support is explicitly enabled, avoiding unnecessary
> >>>>>>> native
> >>>>>>> dependencies for non-Rust kernel builds.
> >>>>>>>
> >>>>>>> Signed-off-by: Harish Sadineni
> >>>>>>> <Harish.Sadineni@windriver.com>
> >>>>>>> ---
> >>>>>>>   meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
> >>>>>>>   1 file changed, 3 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> >>>>>>> b/meta/recipes-kernel/linux/linux-yocto.inc
> >>>>>>> index 4d0a726bb6..b7961bbcdf 100644
> >>>>>>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> >>>>>>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> >>>>>>> @@ -76,11 +76,14 @@ do_install:append(){
> >>>>>>>   KERNEL_FEATURES:append:qemuall =3D " features/kernel-
> >>>>>>> sample/kernel-sample.scc"
> >>>>>>>
> >>>>>>>   KERNEL_DEBUG ?=3D ""
> >>>>>>> +KERNEL_RUST_SUPPORT ?=3D ""
> >>>>>>>   # These used to be version specific, but are now common
> >>>>>>> dependencies.  New
> >>>>>>>   # tools / dependencies will continue to be added in
> >>>>>>> version specific recipes.
> >>>>>>>   DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86",
> >>>>>>> "arm64", "powerpc" ], "elfutils-native", "", d)}'
> >>>>>>>   DEPENDS +=3D "openssl-native util-linux-native"
> >>>>>>>   DEPENDS +=3D "gmp-native libmpc-native"
> >>>>>>> +RUST_KERNEL_DEPENDS ?=3D
> >>>>>>> "${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True',
> >>>>>>> 'clang-native rust-native bindgen-cli-native', '', d)}"
> >>>>>>> +DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
> >>>>>>>
> >>>>>>>   # Some options depend on CONFIG_PAHOLE_VERSION, so need to
> >>>>>>> make pahole-native available before do_kernel_configme
> >>>>>>>   do_kernel_configme[depends] +=3D
> >>>>>>> '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-
> >>>>>>> native:do_populate_sysroot", "", d)}'
> >>>>>>>
> >>>>>> I thought we were going to try and use KERNEL_FEATURES for
> >>>>>> this?
> >>>>>>
> >>>>>   Hi Richard,
> >>>>>
> >>>>>   I have tried this but i got circular dependency error with
> >>>>> KERNEL_FEATURES. So, I opted using variable
> >>>>> KERNEL_RUST_SUPPORT.
> >>>>>
> >>>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>> I'm curious about that. Can you share the details ? (diff and the
> >>>> bitbake error)
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>   As discussed previously, I attempted to use the following in
> >>> meta/recipes-kernel/linux/linux-yocto_6.18.bb:
> >>>
> >>>   KERNEL_FEATURES:append =3D " ${@bb.utils.contains('KERNEL_FEATURES'=
,
> >>> 'rust-kernel', ' features/kernel-rust/kernel-rust.scc', '', d)}"
> >>>
> >>>   This resulted in a BitBake variable dependency chain failure. The
> >>> issue occurs because the expression is trying to read
> >>> KERNEL_FEATURES
> >>>   while simultaneously modifying KERNEL_FEATURES, which creates a
> >>> circular dependency.
> >>>
> >>
> >> Yes, that's clearly not going to work, but that wouldn't have been
> >> the suggestion.
> >>
> >> Wasn't Richard asking about setting the RUST_KERNEL_DEPENDS based on
> >> the KERNEL_FEATURES containing rust.scc ?
> We understood like Richard suggestion is to use KERNEL_FEATURES
> everywhere instead of KERNEL_RUST_SUPPORT variable.
>
> We can use the KERNEL_RUST_SUPPORT variable to append rust.scc to
> KERNEL_FEATURES and then we could make other checks depends on
> KERNEL_FEATURES.
> But as the other recipes (make-mod-scripts, kernel-devsrc,
> module-rust.bbclass) do not know about KERNEL_FEATURES, so again we've
> to depend on KERNEL_RUST_SUPPORT Variable.
>

I'm curious as to what you think is different about KERNEL_RUST_SUPPORT
and KERNEL_FEATURES as variables ?

They are both defined in the kernel recipe namespace, so any limitations
about
the visibility of one, is true about the other.

or am I missing something ?

Bruce


>
> So, for consistency we used everywhere KERNEL_RUST_SUPPORT.
>
> Is this implementation ok or we should switch to use -
> KERNEL_FEATURES in kernel recipes and
> KERNEL_RUST_SUPPORT in other recipes.
>
> Thanks,
> Harish
> > Yes, along with maybe with a tweak to the KERNEL_FEATURES code which
> > could expand " rust " or maybe " kernel-rust "in KERNEL_FEATURES into
> > "features/kernel-rust/kernel-rust.scc" too just so there was a nice
> > short cut for it?
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000986cf3064caae219
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 10, 2026 at 6:58=
=E2=80=AFAM Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windriver=
.com">Harish.Sadineni@windriver.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><br>
On 3/10/2026 12:50 AM, Richard Purdie wrote:<br>
&gt; CAUTION: This email comes from a non Wind River email account!<br>
&gt; Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.<br>
&gt;<br>
&gt; On Mon, 2026-03-09 at 14:01 -0400, Bruce Ashfield wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Mar 9, 2026 at 12:54=E2=80=AFPM Harish Sadineni<br>
&gt;&gt; &lt;<a href=3D"mailto:Harish.Sadineni@windriver.com" target=3D"_bl=
ank">Harish.Sadineni@windriver.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 3/9/2026 9:59 PM, Bruce Ashfield wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; CAUTION: This email comes from a non Wind River email acco=
unt!<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0Do not click links or open attachments unless =
you recognize the<br>
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
&gt;&gt;&gt;&gt; On Mon, Mar 9, 2026 at 12:10=E2=80=AFPM Harish Sadineni<br=
>
&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:Harish.Sadineni@windriver.com" targe=
t=3D"_blank">Harish.Sadineni@windriver.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On 3/9/2026 4:56 PM, Richard Purdie wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; CAUTION: This email comes from a non Wind River em=
ail<br>
&gt;&gt;&gt;&gt;&gt;&gt; account!<br>
&gt;&gt;&gt;&gt;&gt;&gt; Do not click links or open attachments unless you =
recognize<br>
&gt;&gt;&gt;&gt;&gt;&gt; the sender and know the content is safe.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; On Wed, 2026-03-04 at 09:43 -0800, Sadineni, Haris=
h via<br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"n=
oreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; From: Harish Sadineni &lt;<a href=3D"mailto:Ha=
rish.Sadineni@windriver.com" target=3D"_blank">Harish.Sadineni@windriver.co=
m</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Conditionally add &#39;clang-native&#39;, &#39=
;rust-native&#39; and<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &#39;bindgen-cli-native&#39; to &#39;DEPENDS&#=
39;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; when Kernel Rust Support is enabled.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; These tools are required for building Rust-ena=
bled kernels<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; and for<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; generating Rust FFI bindings via bindgen durin=
g the kernel<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; build.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; This ensures the additional dependencies are o=
nly pulled in<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; when<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Rust support is explicitly enabled, avoiding u=
nnecessary<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; native<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; dependencies for non-Rust kernel builds.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Harish Sadineni<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:Harish.Sadineni@windrive=
r.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0meta/recipes-kernel/linux/linux-yo=
cto.inc | 3 +++<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+)<br=
>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/meta/recipes-kernel/linux/linux-y=
octo.inc<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; b/meta/recipes-kernel/linux/linux-yocto.inc<br=
>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; index 4d0a726bb6..b7961bbcdf 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- a/meta/recipes-kernel/linux/linux-yocto.in=
c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/meta/recipes-kernel/linux/linux-yocto.in=
c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -76,11 +76,14 @@ do_install:append(){<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0KERNEL_FEATURES:append:qemuall =3D=
 &quot; features/kernel-<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; sample/kernel-sample.scc&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0KERNEL_DEBUG ?=3D &quot;&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +KERNEL_RUST_SUPPORT ?=3D &quot;&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# These used to be version specifi=
c, but are now common<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; dependencies.=C2=A0 New<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# tools / dependencies will contin=
ue to be added in<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; version specific recipes.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0DEPENDS +=3D &#39;${@bb.utils.cont=
ains_any(&quot;ARCH&quot;, [ &quot;x86&quot;,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &quot;arm64&quot;, &quot;powerpc&quot; ], &quo=
t;elfutils-native&quot;, &quot;&quot;, d)}&#39;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0DEPENDS +=3D &quot;openssl-native =
util-linux-native&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0DEPENDS +=3D &quot;gmp-native libm=
pc-native&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +RUST_KERNEL_DEPENDS ?=3D<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &quot;${@bb.utils.contains(&#39;KERNEL_RUST_SU=
PPORT&#39;, &#39;True&#39;,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &#39;clang-native rust-native bindgen-cli-nati=
ve&#39;, &#39;&#39;, d)}&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +DEPENDS +=3D &quot;${RUST_KERNEL_DEPENDS}&quo=
t;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# Some options depend on CONFIG_PA=
HOLE_VERSION, so need to<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; make pahole-native available before do_kernel_=
configme<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0do_kernel_configme[depends] +=3D<b=
r>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &#39;${@bb.utils.contains(&quot;KERNEL_DEBUG&q=
uot;, &quot;True&quot;, &quot;pahole-<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; native:do_populate_sysroot&quot;, &quot;&quot;=
, d)}&#39;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; I thought we were going to try and use KERNEL_FEAT=
URES for<br>
&gt;&gt;&gt;&gt;&gt;&gt; this?<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0Hi Richard,<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0I have tried this but i got circular depen=
dency error with<br>
&gt;&gt;&gt;&gt;&gt; KERNEL_FEATURES. So, I opted using variable<br>
&gt;&gt;&gt;&gt;&gt; KERNEL_RUST_SUPPORT.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I&#39;m curious about that. Can you share the details ? (d=
iff and the<br>
&gt;&gt;&gt;&gt; bitbake error)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0As discussed previously, I attempted to use the fo=
llowing in<br>
&gt;&gt;&gt; meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.18.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.18.bb</a>:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0KERNEL_FEATURES:append =3D &quot; ${@bb.utils.cont=
ains(&#39;KERNEL_FEATURES&#39;,<br>
&gt;&gt;&gt; &#39;rust-kernel&#39;, &#39; features/kernel-rust/kernel-rust.=
scc&#39;, &#39;&#39;, d)}&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0This resulted in a BitBake variable dependency cha=
in failure. The<br>
&gt;&gt;&gt; issue occurs because the expression is trying to read<br>
&gt;&gt;&gt; KERNEL_FEATURES<br>
&gt;&gt;&gt;=C2=A0 =C2=A0while simultaneously modifying KERNEL_FEATURES, wh=
ich creates a<br>
&gt;&gt;&gt; circular dependency.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Yes, that&#39;s clearly not going to work, but that wouldn&#39;t h=
ave been<br>
&gt;&gt; the suggestion.<br>
&gt;&gt;<br>
&gt;&gt; Wasn&#39;t Richard asking about setting the RUST_KERNEL_DEPENDS ba=
sed on<br>
&gt;&gt; the KERNEL_FEATURES containing rust.scc ?<br>
We understood like Richard suggestion is to use KERNEL_FEATURES <br>
everywhere instead of KERNEL_RUST_SUPPORT variable.<br>
<br>
We can use the KERNEL_RUST_SUPPORT variable to append rust.scc to <br>
KERNEL_FEATURES and then we could make other checks depends on <br>
KERNEL_FEATURES.<br>
But as the other recipes (make-mod-scripts, kernel-devsrc, <br>
module-rust.bbclass) do not know about KERNEL_FEATURES, so again we&#39;ve =
<br>
to depend on KERNEL_RUST_SUPPORT Variable.<br></blockquote><div><br></div><=
div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m curious =
as to what you think is different about KERNEL_RUST_SUPPORT</div><div class=
=3D"gmail_default" style=3D"font-size:small">and KERNEL_FEATURES as variabl=
es ?</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">They are both define=
d in the kernel recipe namespace, so any limitations about</div><div class=
=3D"gmail_default" style=3D"font-size:small">the visibility of one, is true=
 about the other.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">or am I=
 missing something ?</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruc=
e</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
So, for consistency we used everywhere KERNEL_RUST_SUPPORT.<br>
<br>
Is this implementation ok or we should switch to use -<br>
KERNEL_FEATURES in kernel recipes and<br>
KERNEL_RUST_SUPPORT in other recipes.<br>
<br>
Thanks,<br>
Harish<br>
&gt; Yes, along with maybe with a tweak to the KERNEL_FEATURES code which<b=
r>
&gt; could expand &quot; rust &quot; or maybe &quot; kernel-rust &quot;in K=
ERNEL_FEATURES into<br>
&gt; &quot;features/kernel-rust/kernel-rust.scc&quot; too just so there was=
 a nice<br>
&gt; short cut for it?<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
&gt;<br>
&gt;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000986cf3064caae219--

