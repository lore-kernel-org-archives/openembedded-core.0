Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899FAC47DDF
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 09:16:00 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.11599.1706778958198513674
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 01:15:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RDR3rJiK;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51124db6cf0so690666e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 01:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706778956; x=1707383756; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lrx4UXHg9EV0pZwmOaY7sAppm2/aDJO3XsvQy3RR20Y=;
        b=RDR3rJiKhIdHcNVnXiRD+ShBgqDcTHJf3Y1I6T5mGzjwmDw+srh9XdkkTlBaH97unD
         5ZmWmsFrfzuWh9iBrFdaeIaAiEAY8Isusc2VM7aMOMyTENwMTTHC54CdzeqC+rxw0D++
         UugAErl0YlxdzlZtRCbNU6JvQwKI0SPTZO4UNe17fvsl4qkpsvl36e1BRh188en+Fp7j
         R1p1Ni8XjD8EX7o56Npxxafn3iZDxrIGkC9ZbodUwdhgnh4tVWj31MEfxThitpaJewrZ
         zQ2xYDFT4NmojcmTSGKPooFurnjnO4SH+ygH4/Ml22o2hG5HM2e1wYcnKA5Brr68VxWw
         sU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706778956; x=1707383756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrx4UXHg9EV0pZwmOaY7sAppm2/aDJO3XsvQy3RR20Y=;
        b=E48e/DAh4G64sLcsM1L/ntOahcjOhjxTgWxVoF+BWPGEuhf1dU7zTm+rv74eU12cH4
         GjTL9u3iuN/bm96itLzyVUlxMs7DLYM5B27PbnkVZ80aq3BncoTjtSzvmBNYTVHnu1CQ
         aaVntiw6mi6RB2k2gFxukG4GJA0QBnye/r9G9pAGGeoiXuBDaoxOPJJUarYRte6cLWlp
         ggv3+/KOQzWoebgXBEc9+3zbosy7a9QgbMk+M8OctfVmZoLZ3PXjgTx9WHi+bLOr514J
         yQrQtQoeUVEAifArAndNFKsDZwZvcpkV3jAwqC/RwBs4u7diUzArsGmNjcY8vcQeihwc
         ZX0Q==
X-Gm-Message-State: AOJu0Yyrak6q70KutXdBFMNf2Pr/5yuZU35L1xVGobEPW4Hv4LCoXaZO
	mI9+e1IG6BfYCAWpddTTj9cVOGmChjR1A9dwwKMQTgtjpQJHtPGrnzMr/bJyUb+XihKSLZxBCOH
	E2X9Z6IfC3/+9TTn/UafzRhB3HAE=
X-Google-Smtp-Source: AGHT+IHH+JUO0kVnk2hCra86nxEqpoGzb7J8arlkwc1hzbuAqoiKz2CD4d5ATa6PNYFSVbNwO+D/I81CWn4jHIR/Pyc=
X-Received: by 2002:a05:6512:3f1e:b0:50e:bc4f:19d3 with SMTP id
 y30-20020a0565123f1e00b0050ebc4f19d3mr605840lfa.25.1706778955385; Thu, 01 Feb
 2024 01:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20240131120438.1097632-1-alex@linutronix.de> <2024020100020005ae4aed@mail.local>
In-Reply-To: <2024020100020005ae4aed@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 1 Feb 2024 10:15:44 +0100
Message-ID: <CANNYZj9UdOL8mYZgZYaTTZOR3kKf9h-8M7LgGcrVGJOMR8uWVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] classes/package_rpm: additionally escape \
 and " in filenames
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 09:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194582

On Thu, 1 Feb 2024 at 01:02, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> > -                return p.replace("%", "%%")
> > +                return p.replace("%", "%%").replace("\\", "\\\\").replace('"', '\\"'))
>
>   File "/home/pokybuild/yocto-worker/build-appliance/build/meta/classes-global/package_rpm.bbclass", line 220
>     return p.replace("%", "%%").replace("\\", "\\\\").replace('"', '\\"'))
>                                                                          ^
> SyntaxError: unmatched ')'
>

Thanks,  I sent a corrected patchset now.

Alex

