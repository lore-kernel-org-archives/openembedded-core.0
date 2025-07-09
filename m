Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DE6C83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 09:17:23 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.11246.1752052642912480033
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 02:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b8uwNKco;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so2619873f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 02:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752052641; x=1752657441; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlPYohcvwTwxD9nl8cW/ZCLYDMFcCVlOeRa0z/bVAZE=;
        b=b8uwNKcoN4HutMJtHoMyVwJ9Ux6lCHkGH7s/SEHTM/gHCOIbh3CHWczuip0wTh49cC
         ss8v84ghzJo/oIe9zF9V+Ue2MK5d/nrvytfI5MmoXBCf0RfLq2oxugRuPJUWazNawY07
         ducWTxwfOYqxcNuoj4d9SgdAGOue5tBn7Ul3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752052641; x=1752657441;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AlPYohcvwTwxD9nl8cW/ZCLYDMFcCVlOeRa0z/bVAZE=;
        b=UCs+5fiq0AoLDXB063J5ptNtuTkJJldfKSfR1jI7hiIegwMw8n8ae5xP1vx1L7fEFY
         dOJs06h5iY2QHnE+xXGom+BZlNK1LVEmC1FoSqVJTEf22jX2sep9iUEEjLK6MzVXd7WR
         YClyaCgSkeC1oeAf18xrf6mmkmz/M/Vd0OEriNrRbPn3NTwn3SIBcHXuqEbpHnErIVE+
         CC5Tfjc4ch0N7fZF7CFrne9CJ7WhQCgT6e1Zqr8jDqUFy11VBfm9DAnE/RBsVQx4zWMx
         H+tOLhsHpPjPstB7MVJA4isNkxYQozriwT01N5Ok5E2c0A/65PtI5mJaO5xeom2d2+1m
         rzqA==
X-Forwarded-Encrypted: i=1; AJvYcCXnkK26sWsvkxJ2Fs2lvbNnJzheiGQ7NsiN3RVnH8QH/mc7IavX2/oQ/gBi9vCC45yxzUppPomrln8mQ1lKOvEFCw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzZt/SrZBL5ZWZ/LXRtwu/HCvMKpYaHqLd5bN+khcg+yMv2jDSE
	0ZwrMEvfy6LazZYtu/Apb49B91dl8mhuUStSfgqOt61v2FxRxEEj5zitoS+2XMfReik=
X-Gm-Gg: ASbGnctdisNrbGSA92Dl2tBJYpzGZ/U0R2WvgUrDBBLYVln7arrcvlPJ09zlv+pQsMC
	FAz2Mayh1RlJoUAgWLvFr8fZcVJ4ZOz2Jo3eD537f7uFcmkX1QmsEDVdj3Z6xLDGEIMKEEG4PRf
	k76+9lhL+nOGRTxnEWGy3fNZmdPa3KnJkst/ogRjMjBVS/26aaQtuODl9ARSWf+THUfSDIicBPQ
	HsfXzDBR+33roBhZUIrPdwjUlWLl2lP2ohAqQk5Wemkh0TzLJRwWqQ0YpLZpYQOV/8AcEty/8xl
	wPcA+cFsBUiDPf8WzOtzoAquRMkXf6X41Wn/NH76QJjOmcGBFXA7N6y/RYdUwDA1mukNseEC1o1
	HtyIBzO+AIxkPzZWkhIJFq/xCsZjX2v02s4xmJhTaUkEHU54X
X-Google-Smtp-Source: AGHT+IFW9fUbc7PZhiVuYGtUOIG++VnsqLPUmUgTRKrQQltbtyKwXAdzsKUtiaGDTARnV5f3uOpLjQ==
X-Received: by 2002:a05:6000:2909:b0:3b4:9b82:d43f with SMTP id ffacd0b85a97d-3b5e44e93e3mr1388455f8f.16.1752052641269;
        Wed, 09 Jul 2025 02:17:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8726:2b2e:9de:f840? ([2001:8b0:aba:5f3c:8726:2b2e:9de:f840])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225a2dcsm15210128f8f.71.2025.07.09.02.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 02:17:20 -0700 (PDT)
Message-ID: <84caeee4b92dad27f67c745c63aaafbf9abb6c1b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 6/6] qemuriscv: Dynamically configure qemu
 CPU
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mark.hatle@kernel.crashing.org, openembedded-core@lists.openembedded.org
Date: Wed, 09 Jul 2025 10:17:19 +0100
In-Reply-To: <1751492664-12569-7-git-send-email-mark.hatle@kernel.crashing.org>
References: 
	<1751492664-12569-1-git-send-email-mark.hatle@kernel.crashing.org>
	 <1751492664-12569-7-git-send-email-mark.hatle@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 09:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220084

On Wed, 2025-07-02 at 16:44 -0500, Mark Hatle via lists.openembedded.org wr=
ote:
> From: Mark Hatle <mark.hatle@amd.com>
>=20
> Use TUNE_FEATURES to dynamically configure the QEMU emulated CPU for the
> options selected by the DEFAULTTUNE.
>=20
> Note: OpenSBI currently requires 'c' (compressed instructions) or it will
> not work.
>=20
> Change the base device configuration to use a different variable to selec=
t
> the emulate devices.=C2=A0 This will allow a user to override or append t=
he
> QB_OPT_APPEND without the riscv32 override getting in the way.
>=20
> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> ---
> =C2=A0meta/conf/machine/include/riscv/qemuriscv.inc | 31 ++++++++++++++++=
+--
> =C2=A01 file changed, 28 insertions(+), 3 deletions(-)
>=20

FWIW I narrowed down the ptest failures to this patch.

Cheers,

Richard

