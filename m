Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EC2EB64DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 15:24:47 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.1375.1687533879991400168
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 08:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gR7weEwO;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b47a15ca10so13121781fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 08:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687533878; x=1690125878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gj8Pe7A0gb1JwmZSha7pZUPRi9YyGAH1Rl9CAJ7YEQU=;
        b=gR7weEwOY6itxM+vXJlHhZkuJpF+yQ1OvtpGZLYIf/5B3fBzzfr4Z9J0ZPhIZWIgbX
         j5cuMhn1TKIP1xDphz6H5vaH2l7SXazk9CUg1qN0JpnQ0gxHc3KzuAUkYkUo8vh33i+K
         VunH63W/sHkKkov9QeOxKPpo//RdMryztJvKvJ/+iAXlj1cUNhSiUxoMOSmivPxoJWw8
         SmfqWk3cpS9d+o9EhXPWBOEgoZSbrR9nKHxPN4aN8tLmj1d5RX4Ix4lWYyZhqplJHtlb
         6OBFOyE2JyAMt2+AN3/q/+XVhXLQK1D/tYPvIvpyIFFSAyVV4YBs5buS0Ezdzs4xXUYa
         am8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687533878; x=1690125878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gj8Pe7A0gb1JwmZSha7pZUPRi9YyGAH1Rl9CAJ7YEQU=;
        b=HwLJc2HeDWrSlJutdZuJzEKB7RC829qJ6yrnR+z/+MTtIu8JVUjDEqoLrp3UN8lZsB
         7Ok7DZsFmwtG8rVGQu8MRJMKmXAPNRkRSJ/I0cDLtkMUox7AoeyfpYaiHAgutqg3AXxD
         1pEsrOhjEkyCgkOLvIdVXsl8C0pONXbYZKJ3iqL5M9FVVTbaRkfBWEH5cnV0kr4Kmkgt
         fmQJ4o+KpP+pA5x26ygQvmDVDC1a8b43vgumElEbLsd0lX9karjIdkUvzaXI8MVsgas4
         35GCWI3Sam3BTy30yEWqCVXBqZDw4vt6QBRDR0X6/hGw2SV0suGNcZuzjowQ4NsQbWps
         vptw==
X-Gm-Message-State: AC+VfDytjnRKA6NVCsJRsOP56BW5evg8Y9H84Iou336UVPStt1whF06i
	j9XiWTqWTX0Ao4t4DJROoy0lc85GiDZzlOVL43Q=
X-Google-Smtp-Source: ACHHUZ4WmRl+8KEDwneUDXGe+BSb0spD00WPi/SMJ61AR8COrUTGZbEhKiOmHIV070/SupJ53+snwcsJhLh1QRy0LA8=
X-Received: by 2002:a05:651c:14d:b0:2b5:9778:7cd3 with SMTP id
 c13-20020a05651c014d00b002b597787cd3mr1911081ljd.31.1687533878025; Fri, 23
 Jun 2023 08:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230622161749.797820-1-maxime.roussinbelanger@gmail.com>
 <20230622161749.797820-2-maxime.roussinbelanger@gmail.com>
 <CANNYZj8KCSygjo9EPUD91oqOzdZhBkYVrJCVthu66bBSoQz8Jg@mail.gmail.com>
 <CAE=T-s78z1EsvaTs6AiSU2LXwB9Niq1_UGSWG1RmhSUkk1eGBw@mail.gmail.com>
 <CANNYZj_afN2+PxGrQVLShBnrKK6th7=EeUO-nrb3B7oZHrEU1w@mail.gmail.com> <CAE=T-s4rMrn93u3f+BK-+XLyraaor0v75X5RXVhfBHMosJKz_g@mail.gmail.com>
In-Reply-To: <CAE=T-s4rMrn93u3f+BK-+XLyraaor0v75X5RXVhfBHMosJKz_g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 23 Jun 2023 17:24:26 +0200
Message-ID: <CANNYZj_8cEcts07U6EVEO4JS3KsZSPAx=T_NvoSk1QxCcGUCSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] insane: ignore nativesdk-${PN}-src host
 contaminated issue
To: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 15:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183333

On Fri, 23 Jun 2023 at 16:56, Maxime Roussin-B=C3=A9langer
<maxime.roussinbelanger@gmail.com> wrote:
> When you mention `packages`, do you mean the .rpm, .deb, etc?
>
> What would be proper desired ownership inside those packages
> for a nativesdk -src package? Is it suppose to be root?

You can probably check how these packages get created in the first
place? There will be explicit ownership set at that point.

Alex

