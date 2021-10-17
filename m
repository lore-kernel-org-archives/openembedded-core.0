Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E676C433F5
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 11:26:38 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web09.21562.1634469996708680460
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 04:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HzuMmnBT;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id e10so553367uab.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 04:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VxJlxtMUwpQn94tWf/GYUVWTD+tDaSqCjwJAyGc5AtM=;
        b=HzuMmnBTym0KzKn/csWQ9bXDDeYJXA9qiJc60ltd2MlOyv+4oI9aNTCrNGAHYUBpr2
         NMKO5UIgiN7DETCosDOXuI5ZTGNcZ4JCrCWITH6U4BYseNA0kacf9DMwCfi9CCFYzLX+
         0Mstk2F04utyCp8uNpxopAtJYfPBKMPo1I5KkLUhakVwSRU2ABtUY1heFj58qR6B49mf
         evI3rOHh1ZXqPQFG9PDALu+WmPFx6g7+fFtNio/wwLBSfLkS1c/uB7n0YEYp8mlYyXdT
         BWpnJ25QO1u9swkA/B/a92SC23cjAZQiezzDdXZF6EI0TM6BVNfhS88agiG9tjQFJ0so
         /knA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VxJlxtMUwpQn94tWf/GYUVWTD+tDaSqCjwJAyGc5AtM=;
        b=jA37gYRrAKrSylkjoieEdrqcnOv5dNTnBmnt7vzpdQ8TBm5+Wx1QwmD5TcfwJ9jsP4
         9KgmxxtKKyyfWTrJ8k+kiCA5nKUgB3RcqlXmL3EIWrCjbZrP9XUJs6B/2XwsaJwyIunx
         2FVDXy2aaTnd3n8jyFted5fZapkkWj2yLVnIhoSwyOWo+fidChBSpszrZfVf554YGrQN
         BiijmWQC7QAhmc5RenBKQqs5mF4rPmnWfj2gZozRiQ0nV3UFo0GveGqZ4Lmj/ahAHmTx
         8Cl1sYbKBN0sf+uSs5Sp/+xnMMHIhhvBQzfb5BuI4vpPWAKZm8ga0Wuglvs34OqR0ta+
         h6YQ==
X-Gm-Message-State: AOAM533wH0yBDbH5zBh6ve3cL7iBTmUJq7kyf7zg8WYOvLCuRGXTDBjd
	6wBfxCtjZNdonDCiFahjXIeXNIh6jBkOUt0Uhu0=
X-Google-Smtp-Source: 
 ABdhPJwG3uvd0Pn4Nk+0EBuVSNvcf+fciN3cP2CrwgQgGBqbHbibDDCND6aPXwnhjdskMtywSL2184CPTTFFJMdhgGQ=
X-Received: by 2002:ab0:36e8:: with SMTP id x8mr1023482uau.22.1634469995771;
 Sun, 17 Oct 2021 04:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211015170630.1069043-1-alex@linutronix.de>
 <5b92ee280a2f08291fa77a303d7b9edc98a61d30.camel@linuxfoundation.org>
 <CANNYZj-RwGKeut0Lf2iecz-VvcMiBdLZ8TcZeAeKNN1Wn3O0vw@mail.gmail.com>
 <CAJdd5GaHkNKYdS2f09B78fiCbm1-rzmrUwB3-DqqDsrgcSo2jw@mail.gmail.com>
In-Reply-To: 
 <CAJdd5GaHkNKYdS2f09B78fiCbm1-rzmrUwB3-DqqDsrgcSo2jw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 17 Oct 2021 13:26:24 +0200
Message-ID: 
 <CANNYZj_-01QOpUjnSw1x7ap7JLkpYtTu8zHqLZtkbzqrN3PwMg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] populate_sdk_base: add support for zstd
 compression (and default to it)
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007e7a1005ce8ab3b0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 11:26:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157033

--0000000000007e7a1005ce8ab3b0
Content-Type: text/plain; charset="UTF-8"

On Sat, 16 Oct 2021 at 21:21, Joshua Watt <jpewhacker@gmail.com> wrote:

>
> Is this the maximum compression level for zstd? Also, are any of these
> using parallel compression?
>

Yes, they all run with the same standard cpu cores setting from
bitbake.conf. xz additionally has a RAM cap.

zstd has further compression levels, but I didn't try them - you're weclome
to:
--ultra : enable levels beyond 19, up to 22 (requires more memory)

Alex

--0000000000007e7a1005ce8ab3b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, 16 Oct 2021 at 21:21, Joshua Watt &lt;<a href=3D"mailto:jpew=
hacker@gmail.com">jpewhacker@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><br><div dir=3D"aut=
o">Is this the maximum compression level for zstd? Also, are any of these u=
sing parallel compression?</div></div></blockquote><div><br></div>Yes, they=
 all run with the same standard cpu cores setting from bitbake.conf. xz add=
itionally has a RAM cap.<br></div><div class=3D"gmail_quote"><br></div><div=
 class=3D"gmail_quote">zstd has further compression levels, but I didn&#39;=
t try them - you&#39;re weclome to:</div><div class=3D"gmail_quote">--ultra=
 : enable levels beyond 19, up to 22 (requires more memory) <br></div><div =
class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div></=
div>

--0000000000007e7a1005ce8ab3b0--

