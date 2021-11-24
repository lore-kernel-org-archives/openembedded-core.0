Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340BBC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 17:13:03 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web12.888.1637773982262566548
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 09:13:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MBImb7NQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id ay21so6505215uab.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 09:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wBDl3vcu5xNk5b8hKc/pI4YZ3GydH7zWLe/UXcbUprA=;
        b=MBImb7NQunnabIw5WeWRhd6bL1zknvpqAedPhKz2b+ClNhenPgoqezqq1a2YjBc5h9
         vFBjUN/bA5o9YjHJMZVVZhL5kmrOduh1gG/HEob3xyjFTU+OPkCKVXDyHL1he2QbRAe+
         5/WDK0wVTxoVTrRlZzJVRBAUthaZbVn1GQnzKMhl1jhlJExpysWUg7QwRI9ffry9ainh
         9jMKPrnaDws+BJxuYEUcMV9PSRyD69SB6AguXN3YKJtG7okkFfP94m8uxIlTixXiwjTr
         LOw5eZladhnXUJiFNEObgUjGsFfVtTTYKJ82DQxXBGmuul4lVVuXAhqVpy4ouHFDx2pu
         10wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wBDl3vcu5xNk5b8hKc/pI4YZ3GydH7zWLe/UXcbUprA=;
        b=gld95xTxJ0LGsKeKVoBpbYICNAA5yoS6o1S394rq/TweHUweMrKsgmLCPsRfugN53n
         g8y8F8yhm3u7HvT3Qzj42O5sqvHp8fZ4/p3/IIvfYyiWGGRHSlJyA6/jymb0LWde6+Yp
         gc1VPv6oFM5lwtAXdZH14FdixFBwz+KI6xeH3YAX6iSY3OaK4miP3lBkf1SteKGD6MpX
         keTgvemGztiq2RjDSIWvG1i0tOywYq01h0zzRzLqZEmuSoGuLtZ7rZkyuLpjY70gmb8O
         7eeyChozCzRX/InvFUbT10BB7vDfTWtfPsy0HTguhboGXl6aelQzNj2qu+H22SDnUzPn
         O4pQ==
X-Gm-Message-State: AOAM5322sa7haA0+s1T3CgvDLZ8O8Ye/aDeFJy2x07KhFDCRKUIdBReD
	Cl7FBUGcFXcjIMHN/6qBD6m6r8AwV52z+P/MHkM=
X-Google-Smtp-Source: 
 ABdhPJy2APK+Tl2Q6Bdnk5vComzPPFNiOa3wTI9+zZhbAkAOma0/RpUa3roCP5243qfF8u4vp7ovWlD5POUL81NcXWw=
X-Received: by 2002:ab0:1e04:: with SMTP id m4mr12972813uak.100.1637773981500;
 Wed, 24 Nov 2021 09:13:01 -0800 (PST)
MIME-Version: 1.0
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211124144739.2250-15-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj8YGPDu6W-HC58i_BqonXbQa4S21TrLieAdUKX8qWbWaA@mail.gmail.com>
 <673658e8-0b06-ffad-eadf-c1b2352ce5a8@weidmueller.com>
In-Reply-To: <673658e8-0b06-ffad-eadf-c1b2352ce5a8@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Nov 2021 18:12:49 +0100
Message-ID: 
 <CANNYZj_WOtdn0cujx8-fD=BNCW71oW-1YJ8+j=jU=Ji=5+2vVQ@mail.gmail.com>
Subject: Re: [RFC PATCH 14/15] node-red: Add version 2.1.3
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
 Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="00000000000063c62e05d18bf81d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 17:13:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158727

--00000000000063c62e05d18bf81d
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Nov 2021 at 17:53, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> I will add tests after we agree on the fetcher and the structure of the
> npm classes. At the moment there are too much possible solution and too
> little feedback.
>

I think it's better to start by thinking how you want to test end-to-end
what you're implementing, and write the tests together with the initial
submission, as they also serve as examples of typical use cases. This also
allows reviewers to experiment with the code and not just passively read
it, as it's otherwise not entirely clear how to actually try it out.

Alex

--00000000000063c62e05d18bf81d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 24 Nov 2021 at 17:53, Stefan Herbrechtsmeier &lt;<a href=3D"=
mailto:stefan.herbrechtsmeier-oss@weidmueller.com">stefan.herbrechtsmeier-o=
ss@weidmueller.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">I will add tests after we agree on the fetcher and the st=
ructure of the <br>
npm classes. At the moment there are too much possible solution and too <br=
>
little feedback.<br></blockquote><div><br></div><div>I think it&#39;s bette=
r to start by thinking how you want to test end-to-end what you&#39;re impl=
ementing, and write the tests together with the initial submission, as they=
 also serve as examples of typical use cases. This also allows reviewers to=
 experiment with the code and not just passively read it, as it&#39;s other=
wise not entirely clear how to actually try it out.<br></div><div><br></div=
><div>Alex<br></div></div></div>

--00000000000063c62e05d18bf81d--

