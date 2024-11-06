Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0EBD44D7C
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 14:55:07 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.47401.1730904906103226660
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 06:55:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hyCY7SBp;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5ebbed44918so3957475eaf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 06:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730904905; x=1731509705; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oJOV7g2GYUF0Eh7F9ZD8Q3RhUz9TwNsYBePbEkWqO78=;
        b=hyCY7SBpscr93tvAPknqn8SGtgHag31lDOj8SSc4+81v/fkXKyVV95qAPD0cR3w67t
         NaMa4IE/4mH9zP8T+0IfEtH4RhhJZTpOg6gjq4sUlR/xSQezofm0Ag6GtJinInzXnJ3C
         1/XnbKqJNITpdwiFwcFGX5IeWTbXNJbdOY0E9ujQ5LDBplU6EKHz/9KtfruKfD00JVRA
         mN8su8YsT00zSjx2hCeQNqz3qgiVj64B/MVQ3WNEgU34xAG5pD3AezT733OUxZVZhs1z
         Sl3//JeRSED4q2CLsSAnjRLWWiPjnGkCxsVcUzIHHadtmU9x/7XLVpzBN5qS0hStekAQ
         h98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730904905; x=1731509705;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oJOV7g2GYUF0Eh7F9ZD8Q3RhUz9TwNsYBePbEkWqO78=;
        b=ecYiiI+znyDPdaf2S8/rvQ5uLs7Tt0/kUTuXcxVMjPFTombIiKfzgxj6e80Q6495jJ
         432cXTGLtt7gsMAl98WzzonI9J93xyLLbaeLg1QiAlFUejnELi+CUo9UxjQI06OXwGKp
         UUxmF9IPnf2JFEdj0m7gvFinfisys8M6OZ1y8U4rsubi9qqbQuFQh1BoltNFj+/CXUCd
         LcV8NMCAiIHVr1Y07uPWTczsmtddZZhMAnqCbi4V+mt0PF8/lRgiF0EEcxGSGiyzBENs
         Da/dbOxdVTnAVt7Tzux7sCrg44UNhzP0BmhCOTgdkYlO+E2WnhbjwhyQks2nDREZImot
         TDoA==
X-Forwarded-Encrypted: i=1; AJvYcCXfFy51sf/tQsZK2ODZ5DjsVPtKpVYeF+52vreEwRepHH1Bi/ZTh3KAikp3Zx3hAcSWBWamexNxYHxFM4DYzsPuGw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx2b9HpZTlVkFqCrdanPL1E10u3YdX9mkBBHgqRj5tWd5FFdYF+
	bvlQc4FApXtr76oILs+09Fkkzoa3uGfi39RzGsnJ4jP+nKsqdZCTB0mNNgGV11/fNVY6AAU1n6C
	HO7wA5zcy9wM5zy+H1k17wDRUJafk/g==
X-Google-Smtp-Source: AGHT+IEA0yATFj1ahO9aHdYQe45nL9hXW23J+WRqxFy7GJTHMMETqyWW+ftn3B2hDhEYpN5MCoB+9xIZAtJ/2zJTLko=
X-Received: by 2002:a05:6820:601:b0:5e1:ebf1:816d with SMTP id
 006d021491bc7-5ec5ec6a66amr19362843eaf.4.1730904905337; Wed, 06 Nov 2024
 06:55:05 -0800 (PST)
MIME-Version: 1.0
References: <20241105184540.3450302-1-raj.khem@gmail.com> <20241105184540.3450302-16-raj.khem@gmail.com>
 <ZytHQPBqHCH4scZZ@bootlin-mathieu>
In-Reply-To: <ZytHQPBqHCH4scZZ@bootlin-mathieu>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Nov 2024 06:54:54 -0800
Message-ID: <CAMKF1sp6X-BMRg+ZTxf+0vYM_GRtsMeqDqymfq1=7TehF+K4YA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 16/19] sdks: Add clang toolchain to SDKs
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000005d28906263fb40b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 14:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206787

--00000000000005d28906263fb40b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 2:38=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Tue, Nov 05, 2024 at 10:45:35AM -0800, Khem Raj wrote:
> > Use SDK_TOOLCHAINS_LANGS to tether clang toolchain into SDKs
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
>
> Hi Khem,
>
> Thanks for your patches, but I believe there is an issue with this one:
> it modifies files in both openembedded-core and yocto-docs.
>
> Could you provide the documentation modification as a separate commit ?


Thanks for reporting this. Will push into control tree soon

>
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--00000000000005d28906263fb40b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Nov 6, 2024 at 2:38=E2=80=AFAM Mathieu Dubois-Brian=
d &lt;<a href=3D"mailto:mathieu.dubois-briand@bootlin.com">mathieu.dubois-b=
riand@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On=
 Tue, Nov 05, 2024 at 10:45:35AM -0800, Khem Raj wrote:<br>
&gt; Use SDK_TOOLCHAINS_LANGS to tether clang toolchain into SDKs<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Khem,<br>
<br>
Thanks for your patches, but I believe there is an issue with this one:<br>
it modifies files in both openembedded-core and yocto-docs.<br>
<br>
Could you provide the documentation modification as a separate commit ?</bl=
ockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for reporting=
 this. Will push into control tree soon</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
 dir=3D"auto"><br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--00000000000005d28906263fb40b--

