Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DEEC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 11:03:10 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.43821.1744023784948790466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 04:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=It2KRSm2;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8fca43972so50280096d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 04:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744023784; x=1744628584; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zhvLoZENAFIQga9EudT4gVSZQz7cKUWSVX/PCJ01Viw=;
        b=It2KRSm2fAoFsej/QZEiHwGljCF0zX+zon/ubCxhXACNVtP0wQYeBNQFRVepJoR8BJ
         rXYjFq6oNzR25Q77B4HfSV3F2SZ3UGtQ8crzLMlU2kdHHfwqJxjM5eYP2H1bth8Y6fdh
         PYJwriRSBANRy0wWZFCGsg42DjeDKpA0yEbivk28/8wNrae6TjyLa0Mx/BRifxKiRlS6
         FCDuh5vY307sh40AVhzV1zrodVnk1qgEU0iQ7WnhvZV4Jt8qdwSK474MtIuBTOOwBhAv
         sOClmcIi/ryemaMA6EvUs+X1uey8AFx3cL2OIXdH/jsG75AaCipSpIwbdhS+BBp+zCHt
         QiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744023784; x=1744628584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhvLoZENAFIQga9EudT4gVSZQz7cKUWSVX/PCJ01Viw=;
        b=n4G4IIo7yTZs85gXmqRd93lTwy4YdoF3JmhPXwfD9S28FaYVBXm0VQwDmfTIE4Rcod
         KdN4zF9qcSPkzaFygoNB+y9x45+51zB78Wzc01SV+KfAgCMraTyl+fIK+9caH2AREeXZ
         1xFbJOLLZHB5/KOAsZVlPeq/0zJMBfIJuXbGPpuSodfT0AyfkzztnGk+BW/i619XIjfc
         izxqkT8gJUgtdkSJ3yg04D1VdMU99YTfAqrwpB//6E3HiTmGMxkIV8HN/q7VOBbz+Pr6
         Ijkke9qa08DtcZkFUbx1w2rnqPGs+GJwsWNubI5RbEusA7Y2U1sb0PV6M/8e7jQhoGf1
         qRow==
X-Forwarded-Encrypted: i=1; AJvYcCUcpHrLpptZ+khgYdsiHqh1mNRJExfLkPzeTxPI16n0GWwoFPe5zm/meuRVSp/8KHkSuiUk9FTokW0NdH24D3tX4Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw4jyBcFw/Bsze+xUVJgup+E0xiYts/WgKwShHWbTIQfs2qs5Ge
	c7dW7Ycq5gk3Y9tHxC/6YaFLDq2acD2qpiF4n0bXC/fEptFcHIdo+HzYevg1kyRncfKqb4+k5C+
	Zkj8qafjlXwnh4OZcQwajg5+ws0k=
X-Gm-Gg: ASbGncuVz/m5UiXJ/SjSqvEtzMNLjlYdCL3J9nEz/B6+CKlLOMed4yoef1Y18B0QOmN
	FuiMmscyqGDl+rbarNZZSbvK6Pbz8RFJfZMIK6gVSSO1zqxUW5Mfd/e0sBxdfRgUBMHoErlxecR
	xcrqeK5kvf7u7PPCqEa7fZqpQyGYfow8+rXBhXbo++esUCZMpLPiNSQB2/VE5n
X-Google-Smtp-Source: AGHT+IGjQIqU50Fa4BsKT0DjEdBQjmZqwgARYTvyE0VDR94nKe1HNN0QDuly91HnujNFUumjaqjWwA2N/Vnc+43f/6w=
X-Received: by 2002:ad4:5c69:0:b0:6e4:2e12:3a0c with SMTP id
 6a1803df08f44-6f01e7bbe1bmr201251256d6.39.1744023783574; Mon, 07 Apr 2025
 04:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250321151245.21227-1-mario.schuknecht@iris-sensing.com>
 <D8NTZA6A6JBD.5NEFFO2SQS5Q@bootlin.com> <FR3P281MB19170866636FFF96C26464B8B6A42@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj8s=w0CY3VFOCRtzn9z=LeH7H+z_TXS2QcvcRJyeUbAXA@mail.gmail.com>
 <5cdce6f6145ff07615ebf8496b21cdca9c75641d.camel@linuxfoundation.org>
 <FR3P281MB1917204FF59FC089654B5FCFB6A72@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <18300D8D696CD25C.32743@lists.openembedded.org> <CANNYZj8tqi5tnomg7t5k9iGHj_xCszmC6nCYfKmgh=yToiM9aQ@mail.gmail.com>
 <FR3P281MB1917CC7FE52D22DAF61020FAB6A62@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj_E+01hDV3hF=9AjPnEZTfmLCAwav203=XS7Y8sZquRuQ@mail.gmail.com>
 <FR3P281MB1917B56C58FEF4BC1FCEC291B6A92@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj8hp_OCYz3ZYSHg2GdO8QiE6LAxLVmz6k_U=ZdY8UAkrw@mail.gmail.com> <FR3P281MB1917DF6032653CF52115E214B6A82@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To: <FR3P281MB1917DF6032653CF52115E214B6A82@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Apr 2025 13:02:52 +0200
X-Gm-Features: ATxdqUFCN61t4okWlSx6FISp-bD7AC19yqrbfXqn_3yQOGF-4ANfUO3unTw5g0A
Message-ID: <CANNYZj8P7qJ0WnsWR=fVKfF8XtuqXV9GYHMEwmKSNLwC=vbMWA@mail.gmail.com>
Subject: Re: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit lib_package
To: Mario Schuknecht <Mario.Schuknecht@iris-sensing.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 11:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214448

On Sat, 5 Apr 2025 at 17:34, Mario Schuknecht
<Mario.Schuknecht@iris-sensing.com> wrote:

> As I understand it, the problem is not with apt but with not repackaging gnupg.
> 'gnupg:do_package_write_deb' is missing the dependency to 'libgpg-error:do_packagedata'.
>
>
> To stay on the right track, should the code that maps these shared library dependencies
> to packages that contain them also add this missing task dependency?

I do not think so, I believe apt and metadata in .deb files should be
investigated first. I went and looked into libgpg-error0 .deb control
file, and it does contain the needed Provides, but crucially, the
Provides line itself lacks version info:

Package: libgpg-error0
Version: 1.51-r0
...
Provides: libgpg-error

If you built .rpm, then the Provides does include the version info:

%package -n libgpg-error0
...
Provides: libgpg-error = 1.51

So I suspect apt gets confused somehow: either it doesn't pick up this
Provides at all, or it rejects it because the version isn't known, and
gnupg has version constraints:

Depends: gnupg-gpg, libassuan9 (>= 3.0.2), libbz2-1 (>= 1.0.8), libc6
(>= 2.41+git0+0a7c7a3e28), libgcrypt (>= 1.11.0), libgnutls30 (>=
3.8.9), libgpg-error (>= 1.51), libksba8 (>= 1.6.7), libnpth0 (>=
1.8), libreadline8 (>= 8.2.13), libz1 (>= 1.3.1)

I'm out of time to look further into this today, but maybe you can
check if we're missing something in .deb generation (compared to rpm),
particularly having version info in Provides as explained here:

https://www.debian.org/doc/debian-policy/ch-relationships.html#virtual-packages-provides

Alex

