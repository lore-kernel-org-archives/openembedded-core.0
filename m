Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED91C4345F
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 00:26:55 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.1750.1712968011439603442
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 17:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bgklvwQQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2220a389390so637356fac.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 17:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712968011; x=1713572811; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhoNk4SunUc8jqwTA+FqYNDXGkKnmw1N88UlmHFQ2VY=;
        b=bgklvwQQiB0GnbfO8Sy/XUAl1K1nLQ+V0MJ7x6tPon6lG8Xgo72pMO2OL4X73yOXqU
         i81qA7+GnD8qUDQ2mRbdHhbvTGHumK/NgeAwhaCFHl+YkLQ5bQae0OBMNARHmVuPdZFa
         JSY9XcpPlaNmzgOcdWCkaOviRSNk/pZQ9mbaPTfghWDD4goaaODnKdj9IUUntimZIofs
         KRCV9EliZiUYp4lL8cc1+f+eH2F+NzjtJHwQHw2py8xxoem1X+XUfAa68BMWB7rkBTZC
         6QpVECbYI1I2N85csUEcW8Np7xKvsvqr/+KG9MItDGxt49kph8EDYV63GDouSWKPSrrt
         WRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712968011; x=1713572811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhoNk4SunUc8jqwTA+FqYNDXGkKnmw1N88UlmHFQ2VY=;
        b=HXJ48mJ0eYxsctVr8uo0O4Q/IyY8WAr+nSMWI3LxHBo8f/jG2udvmIoTjMBxEy8n5J
         Psl/AYbriP44tmv4bNbHWfNIRbvwZNEg6LK/FVOYBj9joOY3tJe8Hg0dBuXAjB4Kbnp6
         HMcpxYXU43XFNPe1LnAu+IIZ0g0NbbvjR+PMaXrCiVD0i3jwC9UyUw81HpbvK7EElPeR
         cz1ges9rw/O8LgeQZVfK0PLANw5U7FWyWaB3kmaiUEhAtJ9XNjm4T7De/W1n+sx+OxYj
         9m+I1hcAN2UhfbGzeeP0sPVIDW/sAtT0l8EkQx01pQ9FNIEp2FKNwYch/uUBsSvJ0Wg4
         0sqA==
X-Gm-Message-State: AOJu0YyGeBd9u+N3SEobfWhCL0nHVoPyu0CnT58Dr8xIqcXfstzaIZmi
	PQBmaNSs8h0EVuSvH7CxFlHMUpdXqQghT0kaKZ9ivAsa6DeZ7c8La6xn61CNqqVZEQZCj1Bz8l8
	cws/5s+K+NXL3CookwRZOP9Ag1lk=
X-Google-Smtp-Source: AGHT+IGKdPyvfpdQOB1Gx0lGXKADKWa7HnvlzhLdQF+v6bFnT6F+9kNrU1UInu4ij6HHSNiYJbDk6OG3NYK2lu68iqw=
X-Received: by 2002:a05:6871:3a0e:b0:233:37f9:f320 with SMTP id
 pu14-20020a0568713a0e00b0023337f9f320mr2773556oac.18.1712968010729; Fri, 12
 Apr 2024 17:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240412165714.8951-1-peter.marko@siemens.com>
 <20240412165714.8951-3-peter.marko@siemens.com> <AS1PR10MB5697E46CE94DF5D1CBC5F901FD042@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697E46CE94DF5D1CBC5F901FD042@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Apr 2024 17:26:24 -0700
Message-ID: <CAMKF1sqLRn60xsM3QB7dUAgKFPKdawyyVEnjBo5vHmU_Udgmog@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/3] kbd: remove non-free Agafari fonts
To: peter.marko@siemens.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Apr 2024 00:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198190

On Fri, Apr 12, 2024 at 10:02=E2=80=AFAM Peter Marko via
lists.openembedded.org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> I know that binary patches are problematic over mailing list.
> Here the patch as zipped attachment just in case.
>

This does not help either, This patch is deleting files so why not
just do the delete operation in do_compile:prepend

rm -rf ${S}/data/consolefonts/Agafari-1*

until the mentioned patch is part of a future kbd release.

> Peter
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198182): https://lists.openembedded.org/g/openembedde=
d-core/message/198182
> Mute This Topic: https://lists.openembedded.org/mt/105486424/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

