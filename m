Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFF8C52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 12:09:32 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.70485.1723550967544976167
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 05:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ILoZ5VDm;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.169, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-690404fd27eso51252247b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 05:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723550966; x=1724155766; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWg9YFkWw583vLPQvma87ajmwSfq+A8qCKKwePwL1M8=;
        b=ILoZ5VDmsm8kOeq9BBEQaw7HVZdJpn9RQKPlE0FDTqgxjqqr6Pm/Ams1sOJwFMN2R3
         1B61GKMFChV69fZczUknH6DRlYoUXE9NbT5E2Fq2ZSVf/CdC2dl4NMxpOowFaimBYW79
         VA8UgKZB9RBDL/yiOV73kYsWNeUzMJO2X8Ammd01SdZxpWzp/Stj/eiB+6KSe+98zN0M
         mGNf9p+zECzmppKqT1dKyNgTVOfMictGD8qIFzRDElX4dqIzI+D++TijBr2dhNen/vv6
         IgKbq35YZzXnCLVn3osWo2i4tEM6t7kvI9sSQ4ls5utf9XQIw+USLw7iVO/oCLc67c0F
         /sKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723550966; x=1724155766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWg9YFkWw583vLPQvma87ajmwSfq+A8qCKKwePwL1M8=;
        b=F5mEKoIzm5qrzcP7i/GfgMQp1w49Uv7xzonZd0OSG970Dc/yUCKZyeanoiFMFKAP1B
         pSvI/H5yq+7nrI4iXEyL1RwpMzeUDBp6wDPD+sT5nVI8eTyAZnAp6VkFzvwMjfeJW0ow
         a4+yQzwNon6ymaS9JqWLYjBgRUzPxRgR3IBbnPnSkJCkANMDOORbWjKYdPtpFlp9/Yif
         QyHT9aKxEBg3tNur6T6G4X8oiSo4dxhonLorqK75Vt9jlCkcvr+5BGBKkxVZkGTeAQCT
         c23c2CnTS5we41Xz78zhllBeQmzBl7gN8B5SMjrK73lahnsu1rVOMK3T9rVziBiuoBA7
         C2ZA==
X-Gm-Message-State: AOJu0Yziq0t5CceEomumBTa6I/fNeMrVOqAkJnBFa04lJMpP0eVkJQT4
	jndnvCgfCAoRuJL3Wknxv65FVdFirfUeXlKiaYF1ToPzOyhdV6nsSr/DiZkhIV0fcv+WYTXkYDa
	ewOmXsoDUiXVAldDnRnx5aLJ9TolHFuLvQSPHjQ==
X-Google-Smtp-Source: AGHT+IFwch4KRsWelRkQPVALmmSigZ/0+nVJWcJL3FoftG+9peRWvvsk0CMeXFDQuwgGZxoyBwt5S7qH+ANb6vidUpU=
X-Received: by 2002:a05:690c:60c5:b0:62c:e6c0:e887 with SMTP id
 00721157ae682-6a97151cc29mr50204107b3.9.1723550966647; Tue, 13 Aug 2024
 05:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <ebbbb5b1cfa0dc87360a1d72db7bf009c7264dfb.camel@linuxfoundation.org>
 <864.1723536321789931548@lists.openembedded.org>
In-Reply-To: <864.1723536321789931548@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 13 Aug 2024 05:09:15 -0700
Message-ID: <CAOSpxdaqBx5GMDe2-YJc2z_KA0VuBpv-aqP+Zt=XFa6p-XE9qQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] buildhistory: fix package output folder creation
To: pedro.silva.ferreira@criticaltechworks.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 12:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203263

On Tue, Aug 13, 2024 at 1:05=E2=80=AFAM Pedro Ferreira via
lists.openembedded.org
<pedro.silva.ferreira=3Dcriticaltechworks.com@lists.openembedded.org>
wrote:
>
> Is it possible/feasible to backport this change to LTS branches

Please send patches for kirkstone and scarthgap and I will add them to
my test queue.

I see that this resulted in some breakage in the master branch, so you
should also include patches for any oe-core breakage.

Thanks!

Steve

> Thank you,
>
> Pedro Ferreira
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203258): https://lists.openembedded.org/g/openembedde=
d-core/message/203258
> Mute This Topic: https://lists.openembedded.org/mt/107750091/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

