Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BD4D2168E
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:21:35 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.11976.1728994887824600444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TIDmMlk4;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ea8de14848so1313860a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 05:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728994887; x=1729599687; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0Xc10JLIwEUlFrWsXtnEr8IR0L35JFO5gqI5RHjqCw=;
        b=TIDmMlk4RQDlU6bU2ECOeoZFMFz2E6uJnKDRrQ5BzObkcMpFWTZzF2qPzclvHfjWAV
         TCG/RA6uPby3LPlVOYufb4cD7rXRrASk0lEXpG5V2cNvfGMURYRyeN1A8/dX7LX9Zhcd
         StBRBnZ17K7XX0DqiHPnuHVOne0xuZ8PeYiCgXkTzue2KPhjEhBf1Y8ZJ5lO5Rv/hjgY
         nfSN0zAeKAEXFVQa8U9H5SVSXVFWEhgVcSarpxGBaQWMIDOum3Su9nTp+/p3Uq/HKzye
         PDVPDWqWShQiUU1WkkftmMbu9vH1pvvrXbqb+PY3mITXsGGvOgfVJ3r/etLpO+Sm+F60
         VjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728994887; x=1729599687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0Xc10JLIwEUlFrWsXtnEr8IR0L35JFO5gqI5RHjqCw=;
        b=Ooc/+oyq/qG0kObTmGcHUXftDnamxftSlP96RprUPSItIXV2LEkRXSrN4GbSjPp6Ph
         D1N2yL19Rp/uxm53UrfphXTf3VCca2bepsYc5mimBqBkkdDtXpN79DaQOMp8629IXP+S
         MTtyuqMbAN11I0ZA2oiJfrVjvUBd/SqI1uSQJR5Gy9UZXu12WAuWakyWIz2pzOATO5Aj
         AaIW59IJym2TWWhnfs6Yy+BAXmzaPnMHHaJ8T3wKJTUDHmbsHuOkphB/+Kyje//TBqMX
         mPck6D4YqnKcmacOkg3lFGAdXHEIY89emRlhDXsFkVwKZ1YtVXBwh1hf13d8IWqyrgSm
         Q8XQ==
X-Gm-Message-State: AOJu0Yxr8Q7G2BRGcB2prlxu2EubMlfAFhNKMjuLziwCUovetl3Z1LdA
	TYOPW4zYYYYLkTE7PV2p/fKpjPD6wb/iUwtiOTp8BXGcwRuFviz8h08EnoW/8UX5jp6C2jLBKY9
	0KKsK+6OX3hvCNMwv8ykvvAsEp1nfBFOd
X-Google-Smtp-Source: AGHT+IFcOy/BBdcSfC/6qPEkEku92kUYg99LJ3GB/otzfPjspn3oyG0VGu1J45fhEv/7VQNbDHt8E+nllOYyrgk1E5A=
X-Received: by 2002:a05:6a20:b40b:b0:1d8:fc45:339c with SMTP id
 adf61e73a8af0-1d8fc4539f1mr929801637.10.1728994887058; Tue, 15 Oct 2024
 05:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241015-deprecated-kmeta-audit-v1-1-4a38514da362@bootlin.com>
In-Reply-To: <20241015-deprecated-kmeta-audit-v1-1-4a38514da362@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 15 Oct 2024 08:21:13 -0400
Message-ID: <CADkTA4MYpK7W1ctaUKP7Qg+t=ECOZa9Cx_GRM8+XH4yig3ojJA@mail.gmail.com>
Subject: Re: [PATCH] kernel-yocto: remove deprecated variable KMETA_AUDIT
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:21:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205909

On Tue, Oct 15, 2024 at 6:07=E2=80=AFAM Antonin Godard
<antonin.godard@bootlin.com> wrote:
>
> This variable has been introduced by commit
> 1d4c120edeb6e45665eafd6962a10ebb89d758eb ("kernel-yocto: allow branch
> auditing to be suspended") but its usage removed by commit
> 0f698dfd1c8bbc0d53ae7977e26685a7a3df52a3 ("kernel-yocto: streamline
> patch, configuration and audit phases").
>
> I haven't found any reference to this variable elsewhere... so remove it
> entirely.

I'm actually working on some code that will once again use that
variable.

Paul Barker submitted some changes that allow in-tree defconfigs
to be applied alongside of the fragments that the project hosts. I'm
enabling auditing of those fragments as part of that integration,

That audit can be a bit noisy, so I'm using that flag to allow it to
be disabled for some fragments.

Bruce

>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-reci=
pe/kernel-yocto.bbclass
> index 6d5c3b6327b61b9bb6678dae2dbf059dbde178f6..bf22f332b955d08e45ad73fac=
de5a82e4b53eef2 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -23,7 +23,6 @@ SRCREV_FORMAT ?=3D "meta_machine"
>  #   2: report options that are not hardware related, but set by a BSP
>  KCONF_AUDIT_LEVEL ?=3D "1"
>  KCONF_BSP_AUDIT_LEVEL ?=3D "0"
> -KMETA_AUDIT ?=3D "yes"
>  KMETA_AUDIT_WERROR ?=3D ""
>
>  # returns local (absolute) path names for all valid patches in the
>
> ---
> base-commit: c83a535d1b32f7fd292cd9caea1ec962bc3c735b
> change-id: 20241015-deprecated-kmeta-audit-1ae2e9d46e22
>
> Best regards,
> --
> Antonin Godard <antonin.godard@bootlin.com>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

