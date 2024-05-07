Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BA1C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 20:50:46 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.417.1715115042762625797
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 13:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=w/zsdYbA;
 spf=pass (domain: linaro.org, ip: 209.85.219.170, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-de61424f478so3812233276.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 13:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715115042; x=1715719842; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RF96Jj6ovCW0q/DuBsPKHs+4Jty/JL/bVCIEzNsIJ/I=;
        b=w/zsdYbAI2IzgMiSbHCxWQwzZWzTpQihsG3rHU6YdQCTmACEttxq4c+cVauNF0z0Ur
         NL8LlMNJrW3X7DP13rR5tvwKrBwpso4F2Vx7ujhByFCj3y+ht5s1Elk+soJBk+7NaDdJ
         e0wLs1X/r+84zrFA5D0I5ZcnEiPcCs4LPLus5g8LvdMyDHLPEHhUlSqiduvHgKIvg8XN
         OGy8EKcdY3/juNKijstznR5rkxXLpJ8Z8KFx6+6yNdB3+U9ME1Cr77D/qPxCzIDbxnpJ
         HOiE73+zTX4E6lUWAwibVgBDHw5F7RH5fi25HUrmDrt3jIfEq0vtyJSn/D+fpflsVT5Q
         e8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715115042; x=1715719842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RF96Jj6ovCW0q/DuBsPKHs+4Jty/JL/bVCIEzNsIJ/I=;
        b=Tm3b+Mq5LXG8keQSZhnio3DPpk567s3Tgb1Xxi8hwjxoPsgKbxMK9R3poLt7sdD2bN
         JpoDCfeHxYWujT64gvbL7ruehYzEhZGLS27f1AWwRgbNGqzP2WDqlBjD4OWqZ/62d2/A
         3mUYjwfFbv+Fa8/EFSqv1xSogVv8anZP68j/zdKEX1L2FW2UeC1gx6vkkTJux5S8S28n
         SfbhqRsVW8/EPbZvE7bvmHpO43fs6InWLBmih0gaVJ98xEQzdK5sXNuEDFcKXt9FZ3NK
         IkIrdKLa0Qn+u+Eqluttu/0mwRR5xMvfDcwWT2z3USsK4z1nPcJjg6WeSOUWWJixDjw8
         axKg==
X-Forwarded-Encrypted: i=1; AJvYcCWBbw/TvMvUsg4/6SsGct94cxZkT4gvje9BnHhnPXZlRfd6uleB6+/NX5P+hrzf6tdzK3a7MuFGB14eqcBWs4/3YpFDrvxrv9MJR1FqtMDSGhgNLqhocHcg
X-Gm-Message-State: AOJu0YyXSy3qvd8XtYR2KAa+56fq1dLU0aWGaMlL9ef/oJp7cTHuEZKV
	dfiLZEY0DNPNpqeqvvy4+4SerJuZouocRkRFpDYdgvPEfNzVZCMayek0Qc6f2yEQmhZkX9zopKz
	Vve0xr8uY+cCQQipRxpOhr7o3lBGIeIO+aslVmg==
X-Google-Smtp-Source: AGHT+IF1zTm13Kl5FdzUhp1PpKPHK+5CdPzXDpsyKEE8+GzWm4gLmsi9JSq5zGBQhRYqsi0wSe5D6TZBCuv1h/efZIY=
X-Received: by 2002:a25:99c3:0:b0:dcb:fe58:a08b with SMTP id
 3f1490d57ef6-debb9d01f40mr776589276.15.1715115041978; Tue, 07 May 2024
 13:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240503151827.1387077-1-ralph.siemsen@linaro.org>
 <e7b395f6-b9f6-4566-9237-42d5b7f9c9ce@cherry.de> <CAOSpxdZxkuaEwpPCWuvFjRm+qfbDxbW5Udk7-i95r89zEadGbA@mail.gmail.com>
In-Reply-To: <CAOSpxdZxkuaEwpPCWuvFjRm+qfbDxbW5Udk7-i95r89zEadGbA@mail.gmail.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Tue, 7 May 2024 16:50:31 -0400
Message-ID: <CANp-EDZTO9jfqZkMta3iypqb1ssdOQCDyHPojhGAzVtZfADqjg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uboot-sign: fix loop in do_uboot_assemble_fitimage
To: Steve Sakoman <steve@sakoman.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, openembedded-core@lists.openembedded.org, 
	sean.anderson@seco.com, jamin_lin@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 20:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199107

On Fri, May 3, 2024 at 1:36=E2=80=AFPM Steve Sakoman <steve@sakoman.com> wr=
ote:
>
> Please submit a kirkstone patch once this hits the master branch.

Ack. I have been checking daily on master and master-next, but so far
it does not seem to have been picked up.

It is a clean cherry-pick into kirkstone, so at least that part should
be simple ;-)

Regards,
Ralph

