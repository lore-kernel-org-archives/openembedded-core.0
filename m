Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873F9C4345F
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 16:43:29 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.15456.1713026608220114917
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Apr 2024 09:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PQmnpreb;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2228c4c5ac3so1128352fac.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Apr 2024 09:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713026607; x=1713631407; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AvLpQGvu3ivts/fi4BufapTo2ogVlm1+uyWKgoxDu1E=;
        b=PQmnprebyTWLdMZDljfnq88xi14BqDvnAR9XMwvG9+xK4qeDRAge6XDAKCkvGyhZcN
         eQw6kPq8RIRevylkfdZ7DIOX60bOPLEF9ugc7GzMlWU+MuFtoW4Mmkt2bAmYHijTYIrj
         AoxODymJHa18En2hbubGprJ2i5OhOksuXN+1SnFLIqOMCGfEhh+tC2GoSOf0lqUhf1Jw
         WZWOcxDPE8qTZKthYucBvMxYOTc+MKLZGIr6exxtbaiBCpqzO6JQXuM3oPm02GB5DROl
         NS8+CCSF7zRrrUFwYH2FriXHxlFq5Hfb0WKNRoKmqdsk6HfSuxPHD51X3bsO1QMKJr9g
         M1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713026607; x=1713631407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvLpQGvu3ivts/fi4BufapTo2ogVlm1+uyWKgoxDu1E=;
        b=rnfKUD+IQpXWyfhDI8MCJchcWbHZxvn/LGMdaEC9OJ0/pvuGhoN5J8mvWjiXTe8+fF
         2uld/TdAfojxsDkgWDP1nUfw3Q+hhwtUUtTt4zVRX3SrkTK1d2PLj6BMl2P+kxQ8SC87
         pGLSJV2L8b09o+rmZ8w+TCLwwtSF2d/7ScDJirSvQ0JlNr1hv/RNlOooQe4WrlE3pV4X
         KYzNQR3diRVUKA3OnoVNrQHSBsbi/iDC1pD+2K44V32ZVW2haZzrJamsZy/VSTxGStcI
         RtQOZuQ93cdvb6ko0wMYUR3dLKz7WT8un5M5z8NacR9RzgX3N7LXriFQlmQUSDIbOcPy
         VyVA==
X-Gm-Message-State: AOJu0YykOfNZuo8thvkxSzXShWFVyvcesOLy31TZi+KaBoIqwvfaHQUG
	M49L6bJHv+QHs8+4ruLUVdgKSpvGaRrpBJu3s9NwPuU8xVMQcq6Y1UZUfdmIPyeLqNSL2ZMnsX4
	re734Db5qYG4vQykXrQ77J1fW9EqopuVW
X-Google-Smtp-Source: AGHT+IHImOlWwWOcH8WTtYEQH3h6hAdn1BYewbyWPP2SRyBIwKsVAXFsgt2m5iAsi42rNRCrcQnLrFEf0EpkmJFuegU=
X-Received: by 2002:a05:6870:c086:b0:21f:aba0:772d with SMTP id
 c6-20020a056870c08600b0021faba0772dmr6861325oad.39.1713026607403; Sat, 13 Apr
 2024 09:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240412110837.2253822-1-richard.purdie@linuxfoundation.org>
 <CAMKF1srhQY+C+=i872hXb=9w_LHnpX_w+Ot5NNULhkkB4VZDRw@mail.gmail.com> <f9ef1eb0e45455f069fcb8c054da0b95c7be29fa.camel@linuxfoundation.org>
In-Reply-To: <f9ef1eb0e45455f069fcb8c054da0b95c7be29fa.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 13 Apr 2024 09:43:16 -0700
Message-ID: <CAMKF1srOX18Ugtc13MJSAg9tOT7MFyNC=g5OtaxrV44p5w4Mjw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-websockets: Import from meta-python
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006cd9900615fd1625"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Apr 2024 16:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198200

--0000000000006cd9900615fd1625
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 13, 2024 at 4:38=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2024-04-12 at 07:05 -0700, Khem Raj wrote:
> > we need a patch to remove it from meta-python at same time
>
> I was testing this was all we needed and went to create one now I've
> confirmed that but I see you have one in master-next. Let me know if
> you need anything.


I think we are fine for now with that


>
> Cheers,
>
> Richard
>

--0000000000006cd9900615fd1625
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Apr 13, 2024 at 4:38=E2=80=AFAM Richard Purdie &lt;=
<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxf=
oundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri=
, 2024-04-12 at 07:05 -0700, Khem Raj wrote:<br>
&gt; we need a patch to remove it from meta-python at same time<br>
<br>
I was testing this was all we needed and went to create one now I&#39;ve<br=
>
confirmed that but I see you have one in master-next. Let me know if<br>
you need anything.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto=
">I think we are fine for now with that</div><div dir=3D"auto"><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000006cd9900615fd1625--

