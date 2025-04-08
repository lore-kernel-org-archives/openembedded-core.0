Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B4EC369A2
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 15:17:10 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.78041.1744125428380081190
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 08:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kwa+0+zP;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so14944846d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 08:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744125427; x=1744730227; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hWrQOpaUL1SqTcukch5YtTp1IlVIjzNDh0L2061+d6U=;
        b=Kwa+0+zPdUKkQEGLM/M6GPstj4SNlpkCWYuyOmsboneNbi6NagG7Cqz2wytlFwV7Hd
         H8OPX3HNDsNBrTbQuIyC+Lu6MglzVxVlOSMJJnyevaDUWEOdaddURFG8FZeaPQgY26nj
         9+ZsodGUQUXBcwPYdgRcyREY3hsWEvuQmGN1T6ZtD8SSTnLk1bB67tKnVdta72Ju7mMe
         Nx2ShzOTgZEKc0bMbtPSGLyZkB2iT44j9wCUpPQmhY21dsJg4rbpyZNKGI+qMyqP73rG
         Z32Ov4CWN3eUJrYBel8FOEBJ9lI7ynV9lMAD46h1jHNm3dcPzIjk2VpSl7gupGb1lr1S
         OXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744125427; x=1744730227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWrQOpaUL1SqTcukch5YtTp1IlVIjzNDh0L2061+d6U=;
        b=vgy++qD2sMIz7YR5DV14RjQ/ZOrbiu7/3+IrQSPKl4t14UGgacBRLq/wEnPNmkg7RT
         4HZbC0vmFrV0AhRdZW0T9zZPr1GH9k6RlbrGOeLxiteVcn9YqBnBDZCqr/6uPMUF2K4b
         I2VXL0zr9FkSj6lvG53+kHyyA0DDE/8aL27tGMDceqJSRy1MEW1VGXqE8qlb0zT6Pf+m
         OVDItzWX+j0TFyk42MDFxglTB1PS2+viha9X8aJryqFDYWafFiLdNXXY9y1V01Qw3fY3
         0dGJQBsCnanGx+7pGeVb/XBdmx4G4FG/1JUoic2io3wA781A6HPZMOk/3tQEkb0DAzUk
         Ajow==
X-Forwarded-Encrypted: i=1; AJvYcCVerdX5j7ItoVxK6E2SEkbGS3bhzBkZR4XiwTm9VCglX8cARTuJNHZiro03Cuq3lHvjO4k8afUUGA5uFqfsHMNrCw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzLWmO/zT9m8+0DSIF7EgTfur8WiQas9Qb0RyNKKM1Rj9sK8gXf
	r3pEqII547FLi3v1pYD52MB24f3mougTR98zoQ+UhPjUvtYxP5IGIkLW55L4AA158a4SCDNGwf9
	bTGCeT8XgJ8Jyi1pNUxIWZC10nTs=
X-Gm-Gg: ASbGncs7j+XSPBET4acLf2j8CnE3Tb8CiS+tIRxqnPg4s6o0Y3LCt1cDuMRQBBQHsDM
	vFpfN9NCwCNB2Qk5aXAYcx3uvS5kzl+wIqaBc7ZBceP5cGpAX6VVZVGHT9EBNZoOHxcOMFVIUkK
	jT/RcsaBi7OrwUF/v03W6VD3tLfNrnPD2T67ctLZ1bLkdoI7Wj6tUIT7UzGfxV
X-Google-Smtp-Source: AGHT+IEVMLlL1YtR2gCueaiyRJAsnVerOWlFve1RnBNQdaIG8xWHVCjaKYq5qhd57r0I/UywpY3tz0zRF9vDmrjalFg=
X-Received: by 2002:a05:6214:e86:b0:6e8:fa72:be51 with SMTP id
 6a1803df08f44-6f05850ca4bmr277573966d6.19.1744125427383; Tue, 08 Apr 2025
 08:17:07 -0700 (PDT)
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
 <CANNYZj8hp_OCYz3ZYSHg2GdO8QiE6LAxLVmz6k_U=ZdY8UAkrw@mail.gmail.com>
 <FR3P281MB1917DF6032653CF52115E214B6A82@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
 <CANNYZj8P7qJ0WnsWR=fVKfF8XtuqXV9GYHMEwmKSNLwC=vbMWA@mail.gmail.com> <FR3P281MB1917DE5D2A5D3323691E4470B6B52@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
In-Reply-To: <FR3P281MB1917DE5D2A5D3323691E4470B6B52@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Apr 2025 17:16:56 +0200
X-Gm-Features: ATxdqUHf77_71JVaD0kvsiPnN84dQcizpDlOmmk53p9u-JRi5Ml9roaOV6govRk
Message-ID: <CANNYZj_S=U9hgez6izNSoN1+PfXmgg6TpogSdYsbVvwqwUKLdw@mail.gmail.com>
Subject: Re: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit lib_package
To: Mario Schuknecht <Mario.Schuknecht@iris-sensing.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 15:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214544

On Tue, 8 Apr 2025 at 17:12, Mario Schuknecht
<Mario.Schuknecht@iris-sensing.com> wrote:

> So far I understand the problem now, the "Provides:" version information
> inside the .deb package is missing.
>
> I have checked the rpm and deb class and it seems that the deb class
> does not support the "Provides:" version on purpose.
>
> There is the following code comment:
>  "drop version information here, not wanted/supported by deb"
> http://web.git.yoctoproject.org/poky/tree/meta/classes-global/package_deb.bbclass#n223
>
> That comes with this commit:
> https://web.git.yoctoproject.org/poky/commit/?h=00765258a2fd0627e0b8b15ed917e1caeda30b38
>
> Should the deb class be extended by the "Provides:" version or is the problem somewhere else?

Note that the commit is ten years old, and it's well possible versions
in Provides were not supported back then, but are both supported and
enforced now. Maybe you can run local experiments to confirm that?

Alex

