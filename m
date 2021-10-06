Return-Path: <chuckwolber@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823AFC433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 04:32:49 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web08.7416.1633494768252089150
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 21:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X3YmeQ1U;
 spf=pass (domain: gmail.com, ip: 209.85.219.170,
 mailfrom: chuckwolber@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id s4so2408867ybs.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 21:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K8mn7dw17MiStjN37ZsDjijrnrHIMNLM1wWtvq/V1Yo=;
        b=X3YmeQ1UpLUxgpczTJN9NUvyKDEj4kaCfA0In0UW5YIMWEEo8wMGtZ5yFgaHU/AXb8
         8CjBSyClAVUVvYVxtna9u4s4EHv7q57eshDjrK8RSX/Jvz80IcPqGN0Z+VJkOdlyuR6d
         XfAuDc384VDt3pg4Q5yye1I/uywQtj1QYwHBb6Me3tjSfF1p+6KWoFTqigL/CiCyF+C1
         a2kMW+vtYEMMeX5IKMFF6Jmtwgj908xGwwELFsyqo2TBLyab+X6+COkXQKOWrF0bFJ84
         nSwaFwI3YpkyaX7INrLoQ4G9HJpsGO+cbSZ1+VMFuQprv8PsC+WP/p2JDq9XVBhttSrX
         7mQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K8mn7dw17MiStjN37ZsDjijrnrHIMNLM1wWtvq/V1Yo=;
        b=M8UfAc9TmikL/xRnoS5irtyRNiCPFIawFmkm5ukCXc+Ou0J2Ax263vLb9SUqJSrga9
         GxF9eb1tKLxIPXXliZO9/t+XqQ6GorBmhyW2dR7hUf8E1wKEt4e6n9T1uJTw7h1EcQAe
         0+uG6zF4NDTApYXjEfUsP0MRWnHESCbt/fg3F83tivgzoPcDuGMpbfCzIi7+F8IMc8eN
         epBRW4cPcL2ISHt6xS4L+By+6RG4tKGSdRkfp6jYdbV+vIyPhV12lrzJeVuhiUeiF9L2
         W+Nqmr+OGFrbvUZwly5u4qW6DnddS3P/tljV3bqlOv7VHSRcByRTL5uSldE0hJBzyQiR
         72Aw==
X-Gm-Message-State: AOAM532FRucnwzVFF2uahQzC1KoamqZvVGT03jVXjWgc41KdmeCYa1HU
	WZWVgxZt4yFZuCBYRvmgAU/ShDJOf5UCeWungfw=
X-Google-Smtp-Source: 
 ABdhPJyokvFQzTCNjSfGOz4m4YX9A2LwaHMozHLXp83bOndvjJJhBc2uXX0p0jNnPLMtSwttVdbtWcrFvVw+h3pHhEc=
X-Received: by 2002:a25:14d6:: with SMTP id 205mr25969285ybu.93.1633494767312;
 Tue, 05 Oct 2021 21:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <37b61ef2-5ea9-7e90-75fe-50cc662d9124@weidmueller.com>
 <6318d76222b819d3a165d405fc48dbcbadf29085.camel@linuxfoundation.org>
 <50d4d79f-a7cd-fd0a-0c6d-597b6dc4ca6a@weidmueller.com>
 <CANNYZj8Fns4xWre3_ajv-5QADpCi0f+WS2wRXCKXezOgj5fhzg@mail.gmail.com>
 <0bddcbc4-cf11-39da-5797-131fc59d7f6f@weidmueller.com>
 <CANNYZj_Xudaobe6W2TTnugjovq3KcHWBYsvZ8kS0kYZaWwkLCw@mail.gmail.com>
 <AM9PR09MB464243B2852B92E67D825612A8AF9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB464243B2852B92E67D825612A8AF9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Chuck Wolber <chuckwolber@gmail.com>
Date: Tue, 5 Oct 2021 21:32:36 -0700
Message-ID: 
 <CAB=6tBSnAsLhiJa_HCnFMEFs4AWbb6pX8QWr8f9BVWZFJjqTnA@mail.gmail.com>
Subject: Re: [OE-core] Improve npm support to run build scripts
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000059226d05cda7a32c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 04:32:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156672

--00000000000059226d05cda7a32c
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 5, 2021 at 12:29 PM Konrad Weihmann <kweihmann@outlook.com>
wrote:

>
> While personally I think in the long run, every npm dependency has to be
> provided as a recipe of its own (even I know the costs of that pretty
> well)... esp when CVE checking and basic packaging hygiene should be
> enforced.
>

Emphatically agree. The "stuff it all into one recipe" npm approach is very
broken.

..Ch:W..


-- 
*"Perfection must be reached by degrees; she requires the slow hand of
time." - Voltaire*

--00000000000059226d05cda7a32c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 5, 2021 at 12:29 PM Konra=
d Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com">kweihmann@outlook.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>
While personally I think in the long run, every npm dependency has to be <b=
r>
provided as a recipe of its own (even I know the costs of that pretty <br>
well)... esp when CVE checking and basic packaging hygiene should be <br>
enforced.<br>
</blockquote></div><div><br></div><div>Emphatically agree. The &quot;stuff =
it all into one recipe&quot; npm approach is very broken.<br></div><div><br=
></div><div>..Ch:W..<br></div><div><br></div><br>-- <br><div dir=3D"ltr" cl=
ass=3D"gmail_signature"><div dir=3D"ltr"><div><b><span style=3D"font-family=
:monospace">&quot;Perfection must be reached by degrees; she requires the s=
low hand of time.&quot; - Voltaire</span></b></div></div></div></div>

--00000000000059226d05cda7a32c--

