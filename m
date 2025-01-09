Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFE7E77197
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 17:26:26 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.2642.1736443585086139619
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jan 2025 09:26:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TqNrFBiK;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d8edad9932so7728336d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 09:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736443584; x=1737048384; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bZu7iMIuQ+skWiwt847D9FIBDykMfIkGwAu58PVHF/A=;
        b=TqNrFBiKdJAnNgXqniNiZ9agljw2ZJjr3cUGqjXyMtWUODPvBXS+9nCLovqTc/kf7M
         L+3VHspgp+UVBfwIZZwbilvJ/MOYkf8zmZsnKXPo0v6RN/hrgclQ8yDZhC199foavxbc
         6aKyLBtjAGI1+C8b+R0X1XqfO8YHbeAR++W/RWjrZN+8Ei9bY6ATYFJrovbGPf6e4mEg
         6Jw/5iMYeajPZ3VvhqQ9KC4bHF63e1USMN7mlLMg9vITc1lJ9EOoTOP0w05xdaDmjjA3
         KZwvNbJXCfz0alqWtcXbivJLMp24gm04G3nyjqHlsB4NsM54VBGCozezDqx8eokKtv+g
         0+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736443584; x=1737048384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZu7iMIuQ+skWiwt847D9FIBDykMfIkGwAu58PVHF/A=;
        b=C82DNw9oBGd+zKgFv+G0aS13HJaYhmabCL+Rd0ADKbdI+dh+WKscHafCJ6TEGAn+pH
         g6qfPjZKQ9ilxAWPvzmp3+T7u/eWPFhk3IaJqdWGSqyEEaYd++ZBdaSrLxc7o31uNZQ2
         FfWSTmtCVE9dEdo4KCbmtEgYOz+kj4YNet2yRv8Hr/Rcu+5nHhc+pISNw+Lc9LhkJ5a3
         N+PmGVUYPmEu24eSGJryS0go2X+jKNkjvqdoIyKHwoqLU93jLBOmZgJmMNFBoQsY+IjR
         S2P9mUsKO18UvbSmc3P+BItyRmdPgSN3/6tSUE03EWiUD5guFJ7l85aIjmMh9HuZvN9U
         uMOw==
X-Gm-Message-State: AOJu0YwmjszuJbcC505k4pfJqNNS79u7dvx+O6fKJjArCkOTPrX8kKW7
	BHV+bZTDKUAPoFShKD8yBWOT9cUQLe8M6rzpI4d0tFzBriBedTqoUWa1BfF5zpbfNNpl2Lb5a18
	gXbPbDqqp2DKvvDcr6OCinX30X64=
X-Gm-Gg: ASbGncuNBoVPHvX76xOr7KDm8IzzT/nT8Fmt7JcTHmX1nitYBmzIcW+Oyi6a/cEDK0q
	OpODI2gKloGacY0W6ICFQjWODim/yaZC43emdyfzm7v6RY+o96PtqlOBn7JoxLibONTtr
X-Google-Smtp-Source: AGHT+IFfA0kj05eyqG77rADDoR5nVZnWENaQQaLljOriHLvgDhxEyS+7rMoPKfC5yXreZyRFSVslJxryFfA5rOd0mY0=
X-Received: by 2002:ad4:5943:0:b0:6d8:96a6:ec22 with SMTP id
 6a1803df08f44-6df9b210064mr5691216d6.23.1736443584099; Thu, 09 Jan 2025
 09:26:24 -0800 (PST)
MIME-Version: 1.0
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
 <20250108084226.117178-12-alex.kanavin@gmail.com> <ABBC5F2A-C656-49D1-BE06-058CEFABF6F5@arm.com>
In-Reply-To: <ABBC5F2A-C656-49D1-BE06-058CEFABF6F5@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jan 2025 18:26:12 +0100
X-Gm-Features: AbW1kvb-QSf7usV1ZMfCYZbjOZ5bKrDvz7mr5p0NzXrDDSd72afkAxi0-Q_SLes
Message-ID: <CANNYZj-bwjVyguoUQEdo9NFnLdGCWbMSXQ5Ch8gybKnVkF=Ovg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 12/20] libgit2: update 1.8.4 -> 1.9.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="00000000000000bb4f062b49476a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 17:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209630

--00000000000000bb4f062b49476a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes. I was tired and used =E2=80=98fixup=E2=80=99 instead of squash=E2=80=
=99 which would=E2=80=99ve opened
the editor. The incorrect message can be dropped.

Alex

On Thu 9. Jan 2025 at 18.21, Ross Burton <Ross.Burton@arm.com> wrote:

> On 8 Jan 2025, at 08:42, Alexander Kanavin via lists.openembedded.org
> <alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>
> Your commit message says:
>
> > Do not install cmake files; if someone wants them, please make
> > them reproducible and not hardcode-installed into /usr/lib.
>
> But then:
>
> > +Subject: [PATCH] src/libgit2/CMakeLists.txt: install cmake files into
> > + configured libdir
> ...
> > +do_install:append() {
> > +    sed -i -e 's,${RECIPE_SYSROOT},,g'
> ${D}${libdir}/cmake/libgit2/libgit2Targets.cmake
>
> Guessing the commit message is out of date?
>
> Ross
>
>

--00000000000000bb4f062b49476a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes. I was tired and used =E2=80=98fixup=E2=80=99 instead=
 of squash=E2=80=99 which would=E2=80=99ve opened the editor. The incorrect=
 message can be dropped.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Alex</div><div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu 9. Jan 2025 at 18.21, Ross Burton &l=
t;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)">On 8 Jan 2025, at 08:42, Alexander Kanavin via <=
a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blan=
k">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.co=
m@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.or=
g</a>&gt; wrote:<br>
<br>
Your commit message says:<br>
<br>
&gt; Do not install cmake files; if someone wants them, please make<br>
&gt; them reproducible and not hardcode-installed into /usr/lib.<br>
<br>
But then:<br>
<br>
&gt; +Subject: [PATCH] src/libgit2/CMakeLists.txt: install cmake files into=
<br>
&gt; + configured libdir<br>
...<br>
&gt; +do_install:append() {<br>
&gt; +=C2=A0 =C2=A0 sed -i -e &#39;s,${RECIPE_SYSROOT},,g&#39; ${D}${libdir=
}/cmake/libgit2/libgit2Targets.cmake<br>
<br>
Guessing the commit message is out of date?<br>
<br>
Ross<br>
<br>
</blockquote></div></div>

--00000000000000bb4f062b49476a--

