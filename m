Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1FCC54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 16:30:23 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.32391.1748277019545894571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 09:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=jEOLRa5x;
 spf=pass (domain: limonsoftware.com, ip: 209.85.128.176, mailfrom: anibal@limonsoftware.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70e3e0415a7so13592737b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 09:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1748277018; x=1748881818; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0w5pG++2ePJKYuWcI7wX4gCgOiioI1mWOQruAfl8djA=;
        b=jEOLRa5xZCIq4avmxT3M5V9VP1xx88NppQXu85NeL4mkS/h5Ua8mgAQ5gv3NpNvT2W
         V2FKBxgiDSsm7gvyQBDMwrZHPjgrsKwQfmI+6Ntpm3d5j5sne/+fIdwCgFDmGZkDGxs/
         QlEjX93OUXNJRVyv4HzV7XpfXJz0cn0PPPqFyEYAj7XQ2PEGMnC77h5iyZNUJ3+TFA37
         /2SPOR89Vx2CuAqDLffbILZVb3Wl473W3FWekIdYMWZzQePbXdoXIqE+2N0A51LDAbdv
         gEU/EQOIYLauD+NbcVbXXRbCciOo2mHMcCT86A4rqd4SyQ6DLxZtgVqIyqrGSoETzYpj
         HiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748277018; x=1748881818;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0w5pG++2ePJKYuWcI7wX4gCgOiioI1mWOQruAfl8djA=;
        b=CsqMoO6tDW6w9UKmOJ2D67g119BM7bBM1YiaiZ/1nrwMWDHMYyVVrIKzGQaoXLfEq9
         CxuM2UDopcPi4uynHMgN6SrMfiUKHWbrPJhTxuxRwRCbQ4Dej7s6DpVq9yvu48nbKkY/
         hjMJZ666YBSLYuqsVAJ/0VOLPLwPZCiYoQ6Cii8qgLhbmgXwMGwTmcyteYSRgk5pcgQa
         xwcUVQHguhja9m3vXOOncDwUSEt+HvycL8vUkwLtWzAZsDRPDsQcaT6yqwT3tp/UX0yl
         xGVsXEypYGBVwn16Pa6aMdE3n4Rxo9Owt0oDDaVFe8FohaqAkU/bBUMhESim6jqMt2jZ
         efUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfNMQ8u0PWAsiVY0MXnf3T4aQ8v/7jlB4Wr7o8l1RFYSU7LKwYzevZHdRDzSVoavzDqLX2fH43EdRddeL8/sNtbg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyg3D+44jSqUyHcb6bFtBDoczRFHjMrGnvTEZQ+eLgQYZo0n5UN
	zewYUzMFwhKP2P7s1MMv6fTPl2VKeITDhiK6Xi8Uayt7uWZPWtCiY9aU1HSJkHpGi66U+V2sNR2
	PWTdiKgjojT4GbyTZ3fJ3/rrdxT/PP7UimMgW0flWwg==
X-Gm-Gg: ASbGncvw4WE5cW8FUpG+24bkcKChIteFJYswUQAk6sFbIqwXcVoP+LdwSSSB8xsWw3X
	FudlokcFYlAa9uKmpr2nJoA2doI1REDx8DxQVu1rHo3K7S+OSZkenDVMfXOrBZkGugcLqG+iORL
	c9CyxT7sg3RNrx6jWsaXXDVrFXApgFUlQ94gQ=
X-Google-Smtp-Source: AGHT+IFbTPsfWli2K0sLhuQPsiaWqR6EgE5WCJhC4krI/2a4AYwPYjYfZUTlAjAjx7Mu835g8tGvqut1aaZOLP2F5iM=
X-Received: by 2002:a05:690c:a85:b0:70e:2173:6f98 with SMTP id
 00721157ae682-70e2cb7848amr119910187b3.6.1748277018585; Mon, 26 May 2025
 09:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240323195304.2909926-1-anibal@limonsoftware.com>
 <20240323195304.2909926-2-anibal@limonsoftware.com> <20240325101809ec807440@mail.local>
 <17C008DA5E69D9E5.27941@lists.openembedded.org> <183C6D415DE5406F.22941@lists.openembedded.org>
 <CAOU5ZMu4ysbugdvOJ4Q1YqVK4nD8frX_wAeo-mSJXRCG3tTQFA@mail.gmail.com> <fa7b5f9f72d23b279f8d933a7ccf4d40c629e381.camel@linuxfoundation.org>
In-Reply-To: <fa7b5f9f72d23b279f8d933a7ccf4d40c629e381.camel@linuxfoundation.org>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Mon, 26 May 2025 10:30:07 -0600
X-Gm-Features: AX0GCFvEJb7T7tDA3eReZk46D0epNIEZyuCDXEzsp4CoyTZgX5naxEJV-wZOhA4
Message-ID: <CAOU5ZMtUY=pP_U+nhdyNDkKS-cGctG1ymEAXqQ6iMe4bFdEBCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] wic: plugins source bootimage/isoimage
 rename to allow be imported
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	bruce.ashfield@gmail.com
Content-Type: multipart/alternative; boundary="000000000000a9862b06360c7694"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 16:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217270

--000000000000a9862b06360c7694
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Yeah, I understand, let me know any further breakage I can fix.

Cheers!,
Anibal

On Mon, May 26, 2025 at 6:01=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2025-05-20 at 08:20 -0600, Anibal Limon wrote:
> > Just a ping.
> >
> > After apply this Bruce will apply the meta-virt one,
> >
> > https://lists.yoctoproject.org/g/meta-virtualization/message/9252
>
> I put this in for testing and there are multiple references in OE-Core
> which also need renaming as without that we see a ton of failures. I've
> gone ahead and put a potential patch in master-next but I'm a bit
> worried the needed thought/planning for a major change like this hasn't
> happened.
>
> I understand the need to make it, we do need to support existing users
> somehow though.
>
> Cheers,
>
> Richard
>

--000000000000a9862b06360c7694
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<div><br></div><div>Yeah, I=C2=A0understand, le=
t me know any further breakage I can fix.</div><div><br></div><div>Cheers!,=
</div><div>Anibal</div></div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 26, 2025 at 6:01=
=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Tue, 2025-05-20 at 08:20 -06=
00, Anibal Limon wrote:<br>
&gt; Just a ping.=C2=A0<br>
&gt; <br>
&gt; After apply this Bruce will apply the meta-virt one,<br>
&gt; <br>
&gt; <a href=3D"https://lists.yoctoproject.org/g/meta-virtualization/messag=
e/9252" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org=
/g/meta-virtualization/message/9252</a><br>
<br>
I put this in for testing and there are multiple references in OE-Core<br>
which also need renaming as without that we see a ton of failures. I&#39;ve=
<br>
gone ahead and put a potential patch in master-next but I&#39;m a bit<br>
worried the needed thought/planning for a major change like this hasn&#39;t=
<br>
happened.<br>
<br>
I understand the need to make it, we do need to support existing users<br>
somehow though.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--000000000000a9862b06360c7694--

