Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7AAC433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 19:50:33 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web11.874.1637178631879129260
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 11:50:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F6PE0i1t;
 spf=pass (domain: gmail.com, ip: 209.85.222.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id b17so8604258uas.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 11:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z5fkmbBYNxl3b5zHAzZAO15LsWYYLNf/wzLyp/1gT2w=;
        b=F6PE0i1tQF6CnYlCvRRlkx2jVkYEL0SeBNtPrNWlv8wFIgeeBa/+OOMLgQcoGjl0Bo
         +8yTMcUiWKLtgycg9qagYEIHYq6337Ujyi26isiAf5+kWeBxsdXaS2Bctk9dUqYRxiyR
         ZGgfpo2uhKD25QfZUXc7c8aqtL559cK6rjr0+z5JsZxu9+sZ60NDhhX0iXJChpO//95U
         YB1wWCNq9xz2ZZgU1Alwt8HEtqepMcPNqUyL2y0SbOfgq6/in7qRju2k7VBBzfrYpqCX
         iUZgXTLzWss1JYZAxmP4X5v7q4vNXIuJ8Kwo3zcmtqOBJIQqzNjH57TURGSgch91YM4P
         K9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z5fkmbBYNxl3b5zHAzZAO15LsWYYLNf/wzLyp/1gT2w=;
        b=qlCKq4Y2zFbpCQHY3bExSLxdJ4ZekiZNntt3o5K3/qpXeTpwSvmamor5wyVe9QoDll
         Nq8Fy5Y8ZJsWm+IaWTwFXXkqt11j5cPUU4NcXTxWqITEwm5T9n6kltTDw4c6yo7rcdbp
         un7OnxTGDVAxeOl9YSGX1/7i7WrCzvazll+Q394fiwPJJorcxGtfj3pWmtQ42IOLH7Lu
         W8He1lSEcgPlYKW+X3mECV4LkdRuqNz9UtABOlGebgAz4WgwoNXiPr6mWyi2jdUeIwzu
         S+j2EyB+AOxcVtsofM3JrznO9PiASbJh3zexrWKu+1wjvCWQq7HLc+UhtaaLq+EpUXOK
         1GZg==
X-Gm-Message-State: AOAM531mOtWf9IGoCAFV6AmhPF6O3fKQuo4QkxLQHKA7WMGLspOpLo6X
	F4C0Mv3PAmitT9LqxiY4pAAiVseWIhVJv5aZD7M=
X-Google-Smtp-Source: 
 ABdhPJyA7gW1ecTfEHdS1AvszNX5vfvDl87Tcot4IG9I/fJLEFHr5gveVyYucqo+BGxHaJGwN5rmPGHfJZTQL7pF/Es=
X-Received: by 2002:a67:ca8f:: with SMTP id a15mr66410160vsl.18.1637178630971;
 Wed, 17 Nov 2021 11:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
 <CANNYZj-tjH20-ocHq_7DWC6qaPA0XhKfk4cGXMPNbs-_YXp8jg@mail.gmail.com>
 <510650712bc36f761fc9c43d47a1761bc4d60366.camel@gmail.com>
 <CANNYZj_1r4Gj_CwBE7Rrr3NedxH9saVQeEuu1mpBFx9A=stDGQ@mail.gmail.com>
 <fe49ca32907173d954160ead0c714eaa654a3ae5.camel@gmail.com>
 <CANNYZj9BTbgsZznvdiP3Fhcc9Wwmb_5F3AnZ1gGyS0TKnv6gqQ@mail.gmail.com>
 <58f4aeaccff5aa6cc9b92144e20cc1831d503f99.camel@gmail.com>
 <CANNYZj_KSZ2GkKdiZZfpzDbq3z8mFPNNU=_SZdjZYtWpZarxFA@mail.gmail.com>
 <05772373b7f5566fac765c0697c8ba74c903b19e.camel@gmail.com>
In-Reply-To: <05772373b7f5566fac765c0697c8ba74c903b19e.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Nov 2021 20:50:18 +0100
Message-ID: 
 <CANNYZj_4nZaw_tNFCQx+QnSc5nARHxiKAE5RoHN-fR4UJ=S9jg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/8] systemd: allow building for nativesdk
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 paul.eggleton@microsoft.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000bba6b105d1015a9e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 19:50:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158458

--000000000000bba6b105d1015a9e
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Nov 2021 at 19:05, Luca Boccassi <luca.boccassi@gmail.com> wrote:

> > This patchset allows systemd binaries to be used in SDKs; what I
> > would like to see is that those binaries are built and used directly
> > in yocto builds. E.g. systemd recipe gains BBCLASSEXTEND = "native",
> > systemd.bbclass gets DEPENDS = "systemd-native" and then uses the
> > native systemd binaries in the same way you want to use them in your
> > private SDK-based pipelines.
>
> Sounds good to me, feel free to go ahead and send patches to do that.
> It's unrelated to this series and to my requirements, and I have no use
> for it, so I will not be spending any time chasing down various rabbit
> holes to make it work, sorry.
>

Please consider the needs of the project and the community too. From that
perspective I do think any QA enhancement must be available to users of
bitbake before it's available to users of SDK (and even then, without any
regression testing upstream, and only if they set up special SDK plumbing
in private CI pipelines). Doing otherwise sets a bad precedent in my
opinion.

Alex

--000000000000bba6b105d1015a9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 17 Nov 2021 at 19:05, Luca Boccassi &lt;<a href=3D"mailto:lu=
ca.boccassi@gmail.com">luca.boccassi@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">&gt; This patchset allows sys=
temd binaries to be used in SDKs; what I<br>
&gt; would like to see is that those binaries are built and used directly<b=
r>
&gt; in yocto builds. E.g. systemd recipe gains BBCLASSEXTEND =3D &quot;nat=
ive&quot;,<br>
&gt; systemd.bbclass gets DEPENDS =3D &quot;systemd-native&quot; and then u=
ses the<br>
&gt; native systemd binaries in the same way you want to use them in your<b=
r>
&gt; private SDK-based pipelines. <br>
<br>
Sounds good to me, feel free to go ahead and send patches to do that.<br>
It&#39;s unrelated to this series and to my requirements, and I have no use=
<br>
for it, so I will not be spending any time chasing down various rabbit<br>
holes to make it work, sorry.<br></blockquote><div><br></div>Please conside=
r the needs of the project and the community too. From that perspective I d=
o think any QA enhancement must be available to users of bitbake before it&=
#39;s available to users of SDK (and even then, without any regression test=
ing upstream, and only if they set up special SDK plumbing in private CI pi=
pelines). Doing otherwise sets a bad precedent in my opinion.</div><div cla=
ss=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div></div=
>

--000000000000bba6b105d1015a9e--

