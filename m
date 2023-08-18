Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E183EC71155
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 14:18:52 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.12339.1692368326113884879
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 07:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jmablh5u;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2bba6fc4339so14426641fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 07:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692368324; x=1692973124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6isUq2sl/XZ69kg3bSWxOzi9BMOv3ijF+ohELQIQ6I=;
        b=jmablh5ugwwxYLpTk9RpVHItUFAe111GKazz97/xly0HQGFMgdKyCrjQrD8FXvObCl
         SNRQB1rppNxOlthQIx+2Z4ohvxz4bgvpuBkyndwcFZzub/ZRaHqtXBA8Mx6xf5quZAPK
         oEXY3sLYW5YXFoP8Nls0rkTyklDKxG/9VM8IwC5ybW8TDP7auFsanUpcxvzKTw1/y5lv
         2t8w3GX+0ztRWG1Ar7Re8/PVa988lCBcmAtcohgxprkdggWFdQ7vXDbbn/xe5+g3TFpO
         1mR1xw2mz8w21CK8Ov9zKL1ChsFWaRYHYcFpw5dBXmDzxVwxBpmwvcHlZdGpMF0bN7Dg
         Z0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692368324; x=1692973124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6isUq2sl/XZ69kg3bSWxOzi9BMOv3ijF+ohELQIQ6I=;
        b=BPrEKS2jqdABmw8YjDKy3i97z2SWUGij55/f57nahdkrNV1AmPEQR7l5hOTV3JUD4I
         b2pE0Pguywsvhb787qZwSvQsa6OZOqLsN2O4Ig/8aaqfHBHepSdbbXPXlyhRUxMW4WLq
         pMGLSGhcioJsJsouTj70DO15M5CykyVO6i184E+ecYnH7l0kqhiGi7uR533xezRrLVPw
         u1NeFiDV13c/1FeRFBrFxA/biO2ij9coewo5mVZNByPa+CnHTxk3lfEta/dPUI3ulCp0
         CX9BXlS92/DHSW7du3zRV6PZcdxy+4KFBBO750jEhsnl0EpIeCC/9CrdghQ5KlHMaZdd
         46bw==
X-Gm-Message-State: AOJu0YwMX9hEZfPHQG2qk9A4El1cklUOBWVGrN0gjyVDaCqHk5Sj41Yp
	M9xC9Edj17mpvt7hDIRY23nmH9+KV4DbzI3MmUY=
X-Google-Smtp-Source: AGHT+IGNnFbcrtHlllIosLlAHQlyZPKgugvNZ0benaiSO8OSLVB5e1LUi/lCRp7ssmUG+AXXLYG6VwOc7elCc0yripE=
X-Received: by 2002:a2e:834b:0:b0:2b6:cf31:5e81 with SMTP id
 l11-20020a2e834b000000b002b6cf315e81mr1846316ljh.20.1692368324058; Fri, 18
 Aug 2023 07:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230817185431.1562460-1-JPEWhacker@gmail.com>
 <20230817191202.1565879-1-JPEWhacker@gmail.com> <fce3961fa5372d09bfb8292fd273dc45c91344b9.camel@linuxfoundation.org>
In-Reply-To: <fce3961fa5372d09bfb8292fd273dc45c91344b9.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 18 Aug 2023 08:18:32 -0600
Message-ID: <CAJdd5GZ3K_W+xRKvf5Lj7R0r=0aAHB0_8shswr1bzmY0tH7kXw@mail.gmail.com>
Subject: Re: [OE-core][RFC v2] sstatesig: Add ACL and XATTR data to outhash
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, p.lobacz@welotec.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 14:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186373

On Fri, Aug 18, 2023 at 1:20=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-08-17 at 13:12 -0600, Joshua Watt wrote:
> > Records the ACL and (some) extended attributes in the outhash
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> > NOTE: This requires ACL and XATTR support from bitbake
> >
> > V2: Filter ACLs to not duplicate the stat mode (since that also does
> > extra filtering)
>
> I put this into testing as I was curious:

oops, sorry. That's a pretty simple fix; I'll send a V3 in a bit
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/154/builds/374/st=
eps/12/logs/stdio
>
> and more. I've not looked into what went wrong.
>
> Cheers,
>
> Richard

