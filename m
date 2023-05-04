Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87B6C77B78
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 09:31:45 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.45665.1683192700226224118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 02:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=EVheGrmR;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f0108a7d20so266506e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683192698; x=1685784698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=80R9m6gIfpVGX8caH3PE/G3r7cxVbTsqUZdzR+g58ck=;
        b=EVheGrmRLk890SkreCzZ5id3zWvaaN4dDw6nIY+jvxL4iW7cGU1XOXRMcJXq4RgQYk
         V79d39v+5kfmI5O+NA9i1EOS7cdzMtBvnxNz+iuEBMDOuBbgjL0K//sJGS1f9hxGbI1w
         SwCGipEaqRwsh6bifyop6TLT1xAxMTqgaAET9oRr3xTa0jKF6j0Bu10ukXBMqfTX6Mhg
         2DZcXcXaVpCdCMyBFCwJOMXZlqZ7Z+Yss1idXSjw/V69xw+GPHUmIE91oNqLyZm3C7Q0
         N+PcCXYSVw5jk320pRB5YSRRltpEFBNOgE5eCM2dj735FysTo0fvyHZq+2YTDnlztelU
         u6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683192698; x=1685784698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80R9m6gIfpVGX8caH3PE/G3r7cxVbTsqUZdzR+g58ck=;
        b=bmjgZkKzLHMhmYez6a2gnsxkLcEu1qd8B69vm8U+d3HBgIzoLVK4H0zqb5u7oAOHEa
         NmbuIrxaZxGFwfBc+iirQ3IyGt/YpeeX+weTCwhBNjOGqgZW2YprhxsBwKfDe3Z2hp/o
         iotgqYJYKIyeNJrQ1qxBgjSAndwNEXHUvh0+1Mgh9cKX/ys4h1RbHEayzQhwfUyqPIIy
         99E9k6h4huNrvKSka892W774D5A0QBP28PpzwlBxHhJokYtJbjjyPQcSp0Shp+zLbu57
         ij82VABmIByV6oMOky7r0M9nfY390RLQizRsJmRnps9xYzwja2m1wX9K6nJG2eeGkUTX
         ttSw==
X-Gm-Message-State: AC+VfDwkFBmCJiv4miBX74ZRLAt8KHbmh4XKV2pjH5PFn713/T6OvpS8
	5grnBpREetykfAHlkd7WhCVp4dLiKfDLUhaA24g=
X-Google-Smtp-Source: ACHHUZ43ClyQrVuzXVmJ13WxO1ZkBt3vxpSzVCDXnQN0Ov+n1dgX7wn7BclzGbsaYxvAo7UomLPqWLAIfiu5BH7WpPA=
X-Received: by 2002:ac2:4c30:0:b0:4d8:6540:a72f with SMTP id
 u16-20020ac24c30000000b004d86540a72fmr1601546lfq.46.1683192698074; Thu, 04
 May 2023 02:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <CANx9H-B4seY487YwfvgW2ze_n6MWr73kJsOTc8spdou32qubKg@mail.gmail.com>
 <57f1224b-14c5-2ba4-c752-98dba8f57a21@berginkonsult.se> <CANNYZj-uE2WUvfZpjq67wHyeFqQaN1L7HYp54Fm99J5UzS8cdw@mail.gmail.com>
In-Reply-To: <CANNYZj-uE2WUvfZpjq67wHyeFqQaN1L7HYp54Fm99J5UzS8cdw@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 4 May 2023 11:31:26 +0200
Message-ID: <CA+cAkeoxG-eF=PKs8en6TcjQ4yDJgit8JfrXjKdtVJSVkjj2aA@mail.gmail.com>
Subject: Re: [OE-core] [RFC] python3-cryptogaphy upgrade to 40.0.2 issues
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Peter Bergin <peter@berginkonsult.se>, Tim Orling <ticotimo@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000db7a9305fadad606"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 09:31:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180858

--000000000000db7a9305fadad606
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 May 2023 at 11:00, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Thu, 4 May 2023 at 10:41, Peter Bergin <peter@berginkonsult.se> wrote:
>
> > At
> >
> https://github.com/pyca/cryptography/blob/f816b457494e010b655cd7fdcd30e3446f86a703/src/rust/build.rs#L46
> > the path to python includes is defined by calling 'python3 -c "import
> > sysconfig; print(sysconfig.get_path('include'))"' (but from inside
> > rust). With print-debugging this seems to return the bad string
> > '/usr/include/python3.11' which is then passed to cc::Build
> >
> > I executed this in recipe context:
> >
> > do_compile:prepend() {
> >      which python3
> >      python3 -c "import sysconfig; print(sysconfig.get_path('include'))"
> > }
> >
> > and then I got the correct return value:
> >
> > |
> >
> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3
> > |
> >
> /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptography/40.0.2-r0/recipe-sysroot-native/usr/include/python3.11
>
> This is pointing to the native sysroot in a target build, so it is
> most likely not actually correct. I believe 'inherit
> python3targetconfig' may help, as it substitutes most places where
> native python gets queried by components with target-specific values.
>
> Alex
>

Unless I'm mistaken , in the error message we can see that the compiler
specified the sysroot correctly (recipe-sysroot and recipe-sysroot-native)
and so the path /usr/include/python3.11 is correct under this sysroot
(Python.h lies there).

I would like to have a verbose output which show the compiler command args
for python3-cryptography 39.0.2 to compare
the compiler arguments but I didn't manage to do it for now (tried to put a
config.toml in src/rust/.cargo with term.verbose=true).

--000000000000db7a9305fadad606
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 4 May 2023 at 11:00, Alexande=
r Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Thu, 4 May 2023 at 10:41, Peter Bergin &lt;<a href=3D"mailto:peter@be=
rginkonsult.se" target=3D"_blank">peter@berginkonsult.se</a>&gt; wrote:<br>
<br>
&gt; At<br>
&gt; <a href=3D"https://github.com/pyca/cryptography/blob/f816b457494e010b6=
55cd7fdcd30e3446f86a703/src/rust/build.rs#L46" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/pyca/cryptography/blob/f816b457494e010b655cd7fd=
cd30e3446f86a703/src/rust/build.rs#L46</a><br>
&gt; the path to python includes is defined by calling &#39;python3 -c &quo=
t;import<br>
&gt; sysconfig; print(sysconfig.get_path(&#39;include&#39;))&quot;&#39; (bu=
t from inside<br>
&gt; rust). With print-debugging this seems to return the bad string<br>
&gt; &#39;/usr/include/python3.11&#39; which is then passed to cc::Build<br=
>
&gt;<br>
&gt; I executed this in recipe context:<br>
&gt;<br>
&gt; do_compile:prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 which python3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3 -c &quot;import sysconfig; print(sysconfig=
.get_path(&#39;include&#39;))&quot;<br>
&gt; }<br>
&gt;<br>
&gt; and then I got the correct return value:<br>
&gt;<br>
&gt; |<br>
&gt; /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptograp=
hy/40.0.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3<br>
&gt; |<br>
&gt; /work/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-cryptograp=
hy/40.0.2-r0/recipe-sysroot-native/usr/include/python3.11<br>
<br>
This is pointing to the native sysroot in a target build, so it is<br>
most likely not actually correct. I believe &#39;inherit<br>
python3targetconfig&#39; may help, as it substitutes most places where<br>
native python gets queried by components with target-specific values.<br>
<br>
Alex<br></blockquote><div><br></div><div>Unless I&#39;m mistaken , in the e=
rror message we can see that the compiler specified the sysroot correctly (=
recipe-sysroot and recipe-sysroot-native)</div><div>and so the path /usr/in=
clude/python3.11 is correct under this sysroot (Python.h lies there).</div>=
<div><br></div><div>I would like to have a verbose output which show the co=
mpiler command args for python3-cryptography 39.0.2 to compare</div><div>th=
e compiler arguments but I didn&#39;t manage to do it for now (tried to put=
 a config.toml in src/rust/.cargo with term.verbose=3Dtrue).</div></div></d=
iv>

--000000000000db7a9305fadad606--

