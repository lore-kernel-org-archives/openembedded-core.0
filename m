Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB82C25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 16:46:25 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.1880.1716828378567880766
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 09:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MepNV/6M;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e95a74d51fso53920261fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 09:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716828377; x=1717433177; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2tn21PIGLHPed9UeOdxUlnvmQCZshPr5yKm8qsAwTw=;
        b=MepNV/6MVQGudVJiPaKMC9tghGuwPs13105GwTWUkTlHuDVB2/CYjIuTt7i7jioVL6
         cUjwR296V6yw+xUI2P4qvTcCSX7FA9O1DPkUUkRwglzAdU2LmOPnOcHSlSf2bpuJtNoI
         NNbehGx9FYb1hxtBJaAOZut8YnfuSfswo/hHNzhDWFmnrZSWCB7Oj5imMIge9WIlFOVh
         OM06wigR91sSBEn2l+TbpPZa5pSx5m36VqqtynNZz7lye47GWwFJTzv8Dmy+5f9KDyiA
         o9C8iXt1iVL6M4Wm/4flWFubGypWOzhH/9yddrpj8AGOben8EpBmz9OFLlXp8RJtohP2
         bX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716828377; x=1717433177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2tn21PIGLHPed9UeOdxUlnvmQCZshPr5yKm8qsAwTw=;
        b=bIsMbNYgPxLv7ye3IoIWSe9S8hpa5mSnnFADCfYPDxuuTU3ynT8ZOGuuJTRIJdwvJk
         PchdxWm8Pvxw8b+HZtBHuXOR51cXmC56iO+78JtrNk4rNn6sFARQck6GGKTFCg4kav+J
         hWs8xfiEzozjhK4QdJBsG3j87rj6pMJn9u8FcpEBATKiuCtilc6s4eUMhmhFOlDEOJi6
         4s8HrgINekx1ensIVBjXB80DQW4+YCFQbMFYHSmSONZhWeNTDMqkFyIN9b7xpsHq8C+D
         xdiYKSWRADRs1jSabBLdbi8cdmEcfA2Z+jK18WbFlsD2yKGhl0onHb4nLKiS2Bq1te5W
         Rstw==
X-Forwarded-Encrypted: i=1; AJvYcCUZG0N9sQGQSSnDeOQ13Hl0vBmpn6bpX78wPaRWzl/B+WvhMp/9hi+wfeVloa2M9u/lHWGmkhTzu5SEk+L7wrfc1tbFDgxul5ygVuTOtvmiwUt3Ml55Zoh+
X-Gm-Message-State: AOJu0YyCp77H75hmx6eA+PR2r2HeD6aQ6g7E+fmTbwO3SEFLceqV1qB5
	zALY7e10jsgwkv+KD4OcbK5bxoHudLlPqlNoogK11G1rUvoA/GLDBEj/QPTbPgZMXG8ocPJQnPr
	De/6nWL46Nsq/9ZtVpVju5KD2ydZPLA==
X-Google-Smtp-Source: AGHT+IHRO9VcTnMeCAIZgYoLDupLq0yvOxkN7w7tlEDK5wyUx5XzD8adL2szjZmMWXU14PfaU0Wi9VoSswqomEvP0b8=
X-Received: by 2002:a2e:9f4a:0:b0:2e7:1e4a:31e0 with SMTP id
 38308e7fff4ca-2e95b096f07mr89590211fa.18.1716828376580; Mon, 27 May 2024
 09:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240527134416.10699-1-jaekyu.lee@lge.com> <CANNYZj9yFM1zNjVum=sPaHXE4ZGbvB4ubkMnmt1gEPpHwz=X2w@mail.gmail.com>
 <CABVd4mGAV0HHg8ky9o=S5i0AnpOGyYVCo9torP+PGDmp55w5UA@mail.gmail.com>
In-Reply-To: <CABVd4mGAV0HHg8ky9o=S5i0AnpOGyYVCo9torP+PGDmp55w5UA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 May 2024 18:46:05 +0200
Message-ID: <CANNYZj8CVupvrkzcYXxLA1N5V8ZY5HqRRt+NrLYwYJ5Hto8QqA@mail.gmail.com>
Subject: Re: [PATCH] [OE-core][scarthgap] rust: remove unnecessary git signature
To: =?UTF-8?B?7J207J6s6rec?= <jkbestfamily@gmail.com>
Cc: jaekyu.lee@lge.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 16:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199916

On Mon, 27 May 2024 at 18:41, =EC=9D=B4=EC=9E=AC=EA=B7=9C <jkbestfamily@gma=
il.com> wrote:
>
> Thank you for reply.
>
> I don't think we need to remove it specifically for this patch.
> If possible, I will update patch to remove it from all patches. Do you ag=
ree that information ( git version information) is unnecessary?

It might be unnecessary, but I do not think there is a need to remove
it. If 'git format-patch' adds that when it writes a patch file to
disk, then we shouldn't fight with that: people will keep sending
patch files that have it.

Alex

