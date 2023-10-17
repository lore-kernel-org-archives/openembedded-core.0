Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C82FCDB483
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 22:15:12 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.268884.1697580903555931102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 15:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V44X1T2J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40675f06f1fso44863975e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 15:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697580902; x=1698185702; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ktiqJhaNnWcsiSGNM+O7S3VXUYzQWCbd8b7d5uvXGcE=;
        b=V44X1T2JLF/AkgffUcRHoKltZ+HHN1eL8HX9hKwuGhTcEYVoau4UzO+UJsIJni56iL
         1XWfXLiI7Z3U6SI4PaEniFxca0zHuMReL4k/NJJKT/1lpr/ki/orQVK8xSu1+MMuup8r
         u5M4Y42ShHONvDInaZ04ajY5n2lYntf5zvwsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697580902; x=1698185702;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ktiqJhaNnWcsiSGNM+O7S3VXUYzQWCbd8b7d5uvXGcE=;
        b=D0+VyPsIdpc1xhHgTrT+23dZbEhx+Qd9H/ogKlv977bUV/jSdhpu585F68eKFZ5ubP
         Mzmnw8le9QJUH26ybbB02hZifX97PJXA5YVDtBhh2oL8DBOWhfyGyDHFi6FWPQ4Sw8bP
         F/K8HcF0TEXemVsXUeXHwaUZskX+NyYcKR0kbZNLnqWvc7VFNdea6DMuU8mxJNJH2PMf
         IaPHlD3rlTqXIZWlNxg2ZV7mL50fc/cMYhmGwkmJt/PQKk7KpQwib6asWhdEWt6i3FY0
         XG4D9jtzElueKUTQzAQrF69ehs35vbulDGhgQvVFGbPGV7NkGUTO3q+NbY4v7QSlpM7e
         ePIA==
X-Gm-Message-State: AOJu0YwXqel38JOnW+7sriixHr6lo5fIR4zVekAZI2g5sW6j4YE1/BRx
	fWtWxbCroLA0wmx5B6L6Poq8tw==
X-Google-Smtp-Source: AGHT+IFcD584mZAgvTv5EGC18+zO/bg2J9E4Wz4b6TSboOWLzQ2Eveiz/8BdWHNYQbqZ7sqhtPHlXA==
X-Received: by 2002:a5d:4805:0:b0:32d:8982:ff12 with SMTP id l5-20020a5d4805000000b0032d8982ff12mr3353992wrq.7.1697580901859;
        Tue, 17 Oct 2023 15:15:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa42:b755:fc77:86e9? ([2001:8b0:aba:5f3c:fa42:b755:fc77:86e9])
        by smtp.gmail.com with ESMTPSA id a17-20020a5d5091000000b0032d893d8dc8sm691378wrt.2.2023.10.17.15.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 15:15:01 -0700 (PDT)
Message-ID: <87cdf04bfd7997465dad157d9d81fc14ca7d122f.camel@linuxfoundation.org>
Subject: Re: Kernel 6.5 ttyS1 hang with qemu (was Re: [OE-core] Summary of
 the remaining 6.5 kernel serial issue (and 6.5 summary)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tony Lindgren <tony@atomide.com>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-serial@vger.kernel.org,
 openembedded-core <openembedded-core@lists.openembedded.org>, Bruce
 Ashfield <bruce.ashfield@gmail.com>, Randy MacLeod
 <randy.macleod@windriver.com>,  Paul Gortmaker
 <paul.gortmaker@windriver.com>
Date: Tue, 17 Oct 2023 23:14:59 +0100
In-Reply-To: <20231017065616.GN27774@atomide.com>
References: <ZSPQY6UYg21Z0PnN@nuoska>
	 <1520ecb5f4b6959af835a7781b94694913f76912.camel@linuxfoundation.org>
	 <178DF50519C11C84.8679@lists.openembedded.org>
	 <b208c9c6b72be4ef0f2aadb7bed103280bff60a0.camel@linuxfoundation.org>
	 <2023101516-unmolded-otter-e3e0@gregkh>
	 <214757eca7f4cd639a7a8d9a822476c1ec30f01c.camel@linuxfoundation.org>
	 <20231016063501.GL27774@atomide.com> <ZSzjNgdCH_wmB4u2@nuoska>
	 <20231016072352.GM27774@atomide.com>
	 <0d86deae37877258f46322d4d727903fca12ad21.camel@linuxfoundation.org>
	 <20231017065616.GN27774@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 22:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189363

On Tue, 2023-10-17 at 09:56 +0300, Tony Lindgren wrote:
> * Richard Purdie <richard.purdie@linuxfoundation.org> [231016 08:10]:
> > The port sometimes doesn't come up properly at boot.
> >=20
> > To be clear, the "\n\n" from the qemu side into the port doesn't seem
> > to help. The "echo helloB > /dev/ttyS1" inside the image does seem to
> > wake it up.=20
>=20
> So if I understand correctly, this issue still happens with kernel patche=
d
> with commit 81a61051e0ce ("serial: core: Fix checks for tx runtime PM
> state"), and the issue now only happens sometimes.

The issue has always been intermittent and it appeared to happen less
frequently with 81a61051e0ce added but it was hard to know if I was
imagining that.

> I wonder if the following additional change might help?

I've added it into testing and have not reproduced the failure with it
applied yet, locally or on our autobuilder. We need to sort some
release pieces which have been delayed by these issues and we're going
with a workaround for that. Once that is built I can get back to
testing this change more extensively, see if we can still provoke the
issue or not. It may take a day or two of testing before we know with
any certainty if the issue is resolved or not.

Cheers,

Richard



