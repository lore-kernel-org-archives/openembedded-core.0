Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794A4C19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 15:17:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.13002.1740669414509689382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 07:16:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BjEo5/9E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43995b907cfso7193695e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 07:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740669413; x=1741274213; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S+gO8MmSp/CoZ7eU46mdPKrvKzbpFL/Jfrw+/aCykw8=;
        b=BjEo5/9EgLP3D2jb9QKy8EwzqEUz5mlIO9pXqAAlEWAWnz2NYkS24vNeRwMOpyU4RP
         gMq4v4S8V25zxGwdodAHcrG7cyWjw0uydLNW7wT17gZL9a/88xFNKj+UMVnGYvtDuCjm
         hBtoGiPeFD1oRcU3KLNW13Yzztn8rOZntkkGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740669413; x=1741274213;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S+gO8MmSp/CoZ7eU46mdPKrvKzbpFL/Jfrw+/aCykw8=;
        b=LkcBItLrhQQ/gpT8lbVJ6deQXOgug1ZNygf8cliBQQzIWpaympZm820PSP8nLqPBwQ
         egWflQwLnh6bNDFkezOjmQOHaP3aBClCcXjSglUv2eE2edgllncpbxsnmSlUb3IMxNKT
         4tAeN9t7QmnmsYILrgksJ1B7KOAqs+Jg/7m3UEnc6K1btAmY7NmAuJJZ77lrwLW1hfXl
         RF/aSmNjFC1DjDHpovao7OU9/JPQA0Ib9KeUFC2P48l020L5Sbbfu0zmmSsKxbJuqHg0
         xj3bgT0EG4zBI+Pr9X7wokmAq/5WflqRRMjwTIyoyiTfWIxMNEZ5nDkodnATzYlOfRPT
         F+PQ==
X-Gm-Message-State: AOJu0Yx6PxCkBnlRnoN1xOcBK0Rgm+smGSWili49AoUYdafNCPjJs6Nu
	80DphhOEVDHPf8QZCXW1NP2tnknFLyjxptTmGRgmVMAbEP6CSj+RkgP7acVEEIg=
X-Gm-Gg: ASbGncvnA4eV+WW/B0FITgPsRWHB7tPwAtFVF+CgMCwdgIn7JBuBlDlA05JkDgW2VFb
	GHTTkM65lWLJqfbIE/X47aDw1Pn7bk5qtKKtQbTqMAONg8rZOisnw1hCH/Kw7gZyY0kxGyIR2zi
	t1Ys3FD4FaIYgKtEqaFGfvqCTFgs7uF2NRgPuH/k4+pg8imzTiheEaO9duzES2J8Z6S6EpBMzUI
	ISnSsgj0Sj8U+CgKA1b2V46rTn971Z0Yq/tNJwiNoLbcmdUbVrTr+egGFs08tUa+QiqDtJY+AKo
	rp2aYUInDD71D0wJSkBaKeos0gAEn+OPuC7ObHIUXBQzy8wvcFNvtgpT+rtKmtTZF2F3q/wX6kO
	1KEw0UaFYriJ/zL8=
X-Google-Smtp-Source: AGHT+IH393BJ5ZWM4ghaAiJP4UKEFwUJ5dplKtJLtg4BdA0UE2OELQjIke799Fbp3qdKbHA6+dRNIQ==
X-Received: by 2002:a05:600c:198e:b0:439:9e53:49d8 with SMTP id 5b1f17b1804b1-43ab0f979cdmr114814965e9.30.1740669409523;
        Thu, 27 Feb 2025 07:16:49 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:af40:c449:3dc9:d155? ([2001:8b0:aba:5f3c:af40:c449:3dc9:d155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7a27ab2asm26112465e9.32.2025.02.27.07.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 07:16:48 -0800 (PST)
Message-ID: <16cfbb610ad62cee349f20573342c756a6caf7f2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] psplash: fix typo in psplash-systemd.service
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org, Jon Mason <Jon.Mason@arm.com>,
  Ross Burton <ross.burton@arm.com>
Date: Thu, 27 Feb 2025 15:16:47 +0000
In-Reply-To: <Z8ArxMPj19hAs3dZ@nuoska>
References: <20250220082517.2065822-1-mikko.rapeli@linaro.org>
	 <11af77e0e16064cb97ab14593d5a931e38694275.camel@linuxfoundation.org>
	 <Z8ArxMPj19hAs3dZ@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 15:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212014

On Thu, 2025-02-27 at 11:09 +0200, Mikko Rapeli wrote:
> I propose ignoring these errors in psplash-systemd.service. It tries
> really hard to start only when /dev/fb0 and fifo is there but can't
> handle all errors
> from /dev/fb0 going missing or signals being thrown at
> psplash-start@fb0.service.
>=20
> The progress bar is effectively "best effort".

That makes a lot of sense. I really appreciate getting to the bottom of
this, thanks!

Cheers,

Richard

