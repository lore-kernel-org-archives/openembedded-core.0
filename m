Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84114C021AB
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 09:20:52 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.18208.1739956850725854149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 01:20:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dThFlff7;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c0970e2e79so535379185a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 01:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739956850; x=1740561650; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ndOtmVmT4hHn2xXDxUCwQcHXcBwGw85E9PK38exDAfI=;
        b=dThFlff7FVF5AqkKsne6Af75b/VbU1CelDVCha8+bcTBKJNUv0gGZV9EeEMg6ulXi/
         +eo2btpjlE0g8PJuqSyZHt4zor56HL6uFDNXEUi4rUNZYcIQOh8CBigU5pGlLM5jlSXE
         Ltw6eIdgINC5Dd+1t0VDbdE9oWTOtCdzbKp4bbWc8GxDl4SzPjt1DKTUlNW8C6wELt2R
         59+LZYV+fRXWn8MZz04FQC1Z9or01liecBl89ImsYbBMx/7QS0sO5PQDOnPV0qKVXp8V
         cOAiDBGWZ+p1hkrUIKY7Nd2lobIniSPUxkfq686VPTXD0YuwjNqsuXouzPiRiCNtDLag
         zW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739956850; x=1740561650;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndOtmVmT4hHn2xXDxUCwQcHXcBwGw85E9PK38exDAfI=;
        b=qEKAmZ/8pZOQpOh21Zt2oKVMarc0v/2xv9nao9HvICRxQSzABUcoEK0HqcU0rHCIar
         gykaYdh+Fr4NblhzkcadGN6tZXHoD8YHDwbXcrJDzzDFJD1TLadP+Arc4yk3tuVLGGnf
         Sj3Q13fvIr/T/kM70Iaykh8roGPxqFMdxalPO6Q+zqCXZ6XhXJwJVFAEoQQvu0iXaZid
         5JfEdOycg70Rn2BMS1VPQclGuuG8B4rDb4GHQl7MyVtWypSOyfV/WMNfFAztrBgPl9QD
         dM/zwrGxVGd+hviVmPT3nYPgT9LX5sahv8A22J1I4rrQVpt7p3Z9mvGreB5tRgdKS+yE
         7Kag==
X-Forwarded-Encrypted: i=1; AJvYcCUH8wizsXCwi5mUZ46rwD+uin+8LiT2qQWeRi8ueyx2tIspvO5thywIfDx2r0sXf5sGYsoRmkggE+BL6iehktNaag==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwaMLnVlzsg0oGITBH7C/NX4UFEGxGtM77vBfqF63JEGmKS1GQj
	YVhSfyjJT+HdzOEiiHdrEAfvRaMHv65xMXmYQlLS1AFYjLdRmSiX+0WTUsnHX/Xh6WiZoiGAryJ
	/2cO+9lrF7dIY3g1p1O6wAmywI6w=
X-Gm-Gg: ASbGnctrS0gB/qlP6EV+pnFFiw3BC3CBZrbFbgOznwXELV9ed2s+M85ejc9yfb+j3pS
	y9yHhuBf5lwtasCorV1MSuNucDuHWi4GIWpESRnbXf4g32BItqIovDrRHqk6gdIYZ+MyVeyVGoD
	P3vHxojL6HVzVhsgPD1lDxXU5MV3amfhc=
X-Google-Smtp-Source: AGHT+IGh5tnyjLVdmpkuPhWNXZNez2Vj2JmAAUzTAgoFPHpZSQQWRk4xLkctdOrXAauGpC4Okvdx3dxZ4F9znitzA9Y=
X-Received: by 2002:a05:6214:ac7:b0:6d8:9062:6616 with SMTP id
 6a1803df08f44-6e66cc8b65emr294402056d6.7.1739956849663; Wed, 19 Feb 2025
 01:20:49 -0800 (PST)
MIME-Version: 1.0
References: <20250218133736.2113804-1-hongxu.jia@windriver.com>
 <20250218133736.2113804-2-hongxu.jia@windriver.com> <CANNYZj-X7wLRf9rxMBgDZn0nSDo12ya7nbhGTr=FZj=MPLu7=w@mail.gmail.com>
 <7fcfd8dd-6740-4594-be52-4f841b3d85df@windriver.com>
In-Reply-To: <7fcfd8dd-6740-4594-be52-4f841b3d85df@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Feb 2025 10:20:38 +0100
X-Gm-Features: AWEUYZnK7Uw-aji8_lXS2ytDHggrhXwrTdyPCOrkaSGQLzZ9Gpy9bxQIfYZ2xrI
Message-ID: <CANNYZj_0L4XHs_927C=HQMFQR5Y3qb8pWRo1XXT2ghjKm-EvOg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH v2 2/2] setuptools3-base.bbclass:
 override default subprocess timeout
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 09:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211692

On Wed, 19 Feb 2025 at 03:28, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> > This hasn't been accepted in master yet. And there's a strong
> > opposition, as this is felt to be something needed for misconfigured
> > CIs that get I/O load beyond all reason. Can this be kept as your
> > local tweak?
>
> Sure, we kept it as local patch

Well, it has actually landed in master at about same time I wrote that
:) https://git.yoctoproject.org/poky/commit/?h=master&id=a4ba090f61484ea7cf8014c232ebec6f195f54a3

I'm not asking for a revert, but can the default be reset from 600 to
upstream's 40?

Alex

