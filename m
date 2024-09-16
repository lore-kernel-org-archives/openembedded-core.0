Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40779C3ABCB
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 20:19:43 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.5037.1726517978250878600
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Sep 2024 13:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OH7ZDbuZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cacabd2e0so41849115e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 13:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726517977; x=1727122777; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y9aGWaedm/a7uIom05NKGxMU/YfM91Krg/Tjt5fFr0A=;
        b=OH7ZDbuZX8WHeYvVJPSm+q0Z7zNhlDKm9NO8Lv182FzXm8YT6Vb7ej9hYdHg6QOmnT
         rzCv74ff+cFu8N5csbczdvd4u772siY+Rq3edojXFIbHY7c4/U9nkSaIPmcS3ot+FOOp
         cBP6zJKJWx4tUIcJlrX1d6HMVCNru77Dh3ads=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726517977; x=1727122777;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y9aGWaedm/a7uIom05NKGxMU/YfM91Krg/Tjt5fFr0A=;
        b=xNapkWU7qBdNurjdNnwm9ClqCF5/lYBIUxKCYJ31vjTqPe1FWCS9/T0MLtUE7HIwHq
         osxffrfsg5jGNj8IKSkaH/emNHkDaekva+9DP/eHMfGHtQ37vxL4Seawp0IY3r3M1iGy
         FXkXYfKEsK51T2lm7rqgNxFRqNd05TC0F0Hsol7EyAezhYBXkumm7BGQQDV36lbMnfpV
         YAjcyQvDgMnvTOKJzCFWztWRjsMjKyqTd7AaoepnwcBWvkp7yPDTVGi8TbFk6Uf38DWO
         psAVsorsp8sCwhxshAwS0r759Q1gSy004LPSJWLWjZIwvnRcn26JQU4P4gZd77oJY5/3
         uA1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWD7uk+8mbkR/NMLIBGrQYuPJsR4vNHmXbBdKYKEJFJ5RnoKHML4gULklmhCsLyCA8RenOeIKt63WXLhO65T4d48A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyGTs+YsZH8PgozeL+H3cfQAm7sN6ao+VLlGCEnuCarGzOqqVmM
	Voo7Y/6IG8SgqqjzqownrAk4AlczqQkVPZZCat3+ZAzvykeWrb4baVH5wkP35zg=
X-Google-Smtp-Source: AGHT+IFKYGb+BsbWebbYjnRpWzEnx4MttUL/RYZ+LxFqBomKGGUIHtVOEdwVMfv4+mZGYurDTpPHrw==
X-Received: by 2002:a05:600c:3b9e:b0:42c:bd4d:e8ba with SMTP id 5b1f17b1804b1-42cdb522847mr113098715e9.8.1726517976538;
        Mon, 16 Sep 2024 13:19:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:40e9:76b1:d784:d4b8? ([2001:8b0:aba:5f3c:40e9:76b1:d784:d4b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7800308sm7942549f8f.87.2024.09.16.13.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 13:19:36 -0700 (PDT)
Message-ID: <d6d5664e994c9cb45ec0e39bf05104b341920641.camel@linuxfoundation.org>
Subject: Re: Backport fix for inter-recipe useradd dependencies bug #13419
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Jonas Mark (BT-FS/ENG1-Mue)" <Mark.Jonas@de.bosch.com>, 
 "steve@sakoman.com"
	 <steve@sakoman.com>
Cc: "pidge@baylibre.com" <pidge@baylibre.com>, "alex@linutronix.de"
	 <alex@linutronix.de>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "Simoes Ricardo
 (BT-FS/ENG1.1-Ovr)" <Ricardo.Simoes@pt.bosch.com>
Date: Mon, 16 Sep 2024 21:19:35 +0100
In-Reply-To: <DU0PR10MB7076812C64238EC056EFCE1AAD602@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
References: 
	<DU0PR10MB7076812C64238EC056EFCE1AAD602@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 20:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204611

On Mon, 2024-09-16 at 19:38 +0000, Jonas Mark (BT-FS/ENG1-Mue) wrote:
> I am wondering whether it would be reasonable to ask for backporting
> of the fix for inter-recipe useradd dependencies to Kirkstone?
>
> I am referring to the fix for bug #13419 which was fixed on
> Scarthgap.
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13419
>=20
> I understand that the backporting would involve the addition of
> USERADD_DEPENDS to useradd.bbclass as well a fix to bitbake.
>=20
> My colleague Ricardo and I are visiting the OSSEU this week in case
> somebody would like to discuss this in person.

The changes to bitbake were complex and relied on previous work.
Whether that work was even present in the kirkstone version of bitbake,
I'm not sure.

I've be very nervous about trying to backport that kind of change to a
release as far through the LTS cycle as kirkstone is, particularly as
it changes behaviour.

You didn't mention whether you had tested those fixes against
kirkstone? Even if so, I'd still probably be nervous about making
changes like this as people might be relying on the existing behaviour
or have their own workarounds.

Cheers,

Richard

