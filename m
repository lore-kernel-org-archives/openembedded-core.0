Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337FFCCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 00:15:06 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.594.1762474501316981799
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 16:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AKb2m2kz;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-45002de5102so121510b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 16:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762474500; x=1763079300; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/ZE2leAR3SrgT0BqST9n+Gd5Nzw9mT+RVNf3ldWEds=;
        b=AKb2m2kzXV2Y2lUA0Pnbxwek3CrfFSYRcgO2jb5+oXyANcP1M4nwp3NgNpj3kbD+ga
         4uh3fCMZRcvhXgr6KNAxobHTq5IPlLiDOAMDPx3vxxD2XzHC7nwu6LiUK8aHoc4F3ms8
         Gd4I/unqIdtA1JlBUCFDjtHyraXAJSsCu0nSTxX/MnFjMW2Uyh21InsLFSJat9ovpqxV
         sTapZ8D/ykwkO2QYA1RHIkqGbHzYj7nTgjqM9N6Ws/IQWLylibf5/oS2Dfl+SYyZ3Cwn
         9tni7MKS7g6ZDJpFrnPITq9cEVekR5ZSWI7NxOG1o65mUPEuxqoTB+1mG+ZNw1q/OOSK
         0T0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762474500; x=1763079300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O/ZE2leAR3SrgT0BqST9n+Gd5Nzw9mT+RVNf3ldWEds=;
        b=MuTb0r+HdLDvoy5bKQFFUoTiW33AtOfStDW87kgYFQNs1rd0L5STChKXAKBfN2a8Rp
         4hSZb6a1MeFtAI+t3AsZznYuc9sysz+YIPMZTJKCJ4zhHBlSKK4gRR3T4KhVGU0UFBJw
         9stYSZ0Rl9Xhx0EYAAgv0MFbfCWF51FKQXoi9J5qSTc0+a77yjgrPRlmaROwjpXh5khs
         WX3YZbVO/IrX6Rn5L9l0C4dTWGQATUtr4gHfEFenGOFBWAzmxSFGFF9xghNdqx/TklSS
         dVMETyRwj9NZM80xBrM3iYFeIqGM3T2/9prIru72nRHiLlWtNkAe9zovmhlarPOvkHoa
         fDGQ==
X-Gm-Message-State: AOJu0Yw+ygShNzT0l4lHl7YcNP8VytJjysS39S/EXLAcGPU9r6PLvtzu
	Qvylu0a9tjnG840UQ19Mbsw+GToq/hZY2dQg8AmndNet3Td0/QB66RFBRuHDMXAfKNuMRoRYoyn
	Q9IvMkIQ3Fz7iWG551uBgSQ0Q7S3xPJw=
X-Gm-Gg: ASbGncvmcgxJtGI+wTiOzwWsJYPMLMvEibwACZuOYUdlxrFw3D/znr1nth54dBZn6v8
	NoJlvEhPtuVXp8kd8P+MF73h652gYQmBZISDBMLWW1A6TU9oxBIgGMu/EgODbIPXCUfaZ5dCjnv
	8vHVMB3w7PGGObJeHz+ZJAkPu/i6H4BxYh9BC1l/FI74eO8vDv+vNKZlJvkP3hoozGxfqbMyG8c
	nTYCYNmaUgNbqHO9GCj69MggX3Eg9tt7FjmvIthjFE38uP4dFxQsr5/C3GshKUTEtKx0U/kBw==
X-Google-Smtp-Source: AGHT+IH6rRj8ML9g+q6i5y8DUZ/4MEzfzKGiZcocUTz2luCT4meML+GaSBi7L/B8TF9iQr0e5y9uH25aRVtmVnpC06g=
X-Received: by 2002:a05:6808:320f:b0:450:2de:27d9 with SMTP id
 5614622812f47-45015f72eecmr890619b6e.67.1762474500496; Thu, 06 Nov 2025
 16:15:00 -0800 (PST)
MIME-Version: 1.0
References: <20251106202024.3084674-1-peter.marko@siemens.com>
 <CADySD0Gi+0SdC9q3PMamqrB0H-m81fZo2yT9vm0rX5=L99++gg@mail.gmail.com> <AS1PR10MB569749F18CF02AF8CD990895FDC2A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569749F18CF02AF8CD990895FDC2A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 7 Nov 2025 13:14:49 +1300
X-Gm-Features: AWmQ_bnJxN28QvMcLmgCJ12fwlqpLblOpsapUkobzh7dBv_yrEbDQQyzxqnNgvo
Message-ID: <CADySD0HdAnOzdKfHn=Aaba6iSTu+6iKuVTFi6qNLFQsBbaf3Qg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] curl: ignore CVE-2025-10966
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 00:15:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226006

On Fri, Nov 7, 2025 at 9:46=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.co=
m> wrote:
>
>
>
> > -----Original Message-----
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > Sent: Thursday, November 6, 2025 21:42
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core][kirkstone][PATCH] curl: ignore CVE-2025-10966
> >
> > On Fri, Nov 7, 2025 at 9:20=E2=80=AFAM Peter Marko via lists.openembedd=
ed.org
> > <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
> > >
> > > From: Peter Marko <peter.marko@siemens.com>
> > >
> > > Per [1] this CVE applies only when wolfssl backed is used.
> > > 8.17.0 removed WolfSSL support completely.
> >
> > But the recipe version in use is 7.82, so how is this applicable? Or
> > am I missing something?
>
> 7.82 is less than 8.17 (which was released couple only days ago), so this=
 CVE is applicable and needs to be handled.

thanks Peter, another read of the changes made things clear.

>
> Peter
>
> >
> > >
> > > [1] https://curl.se/docs/CVE-2025-10966.html
> > >
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > ---
> > >  meta/recipes-support/curl/curl_7.82.0.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-
> > support/curl/curl_7.82.0.bb
> > > index 54362e6978..2326392a4f 100644
> > > --- a/meta/recipes-support/curl/curl_7.82.0.bb
> > > +++ b/meta/recipes-support/curl/curl_7.82.0.bb
> > > @@ -79,6 +79,8 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-42915"
> > >  CVE_CHECK_IGNORE +=3D "CVE-2024-32928"
> > >  # ignored: gzip decompression of content-encoded HTTP responses with=
 the
> > `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older
> > >  CVE_CHECK_IGNORE +=3D "CVE-2025-0725"
> > > +# not-applicable-config: applicable only with wolfssl
> > > +CVE_CHECK_IGNORE +=3D "${@bb.utils.contains('PACKAGECONFIG',
> > 'openssl', 'CVE-2025-10966','',d)}"
> > >
> > >  inherit autotools pkgconfig binconfig multilib_header
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#225993): https://lists.openembedded.org/g/openemb=
edded-
> > core/message/225993
> > > Mute This Topic: https://lists.openembedded.org/mt/116159924/3619737
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> > [ankur.tyagi85@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

