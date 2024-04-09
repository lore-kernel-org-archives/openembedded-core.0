Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EAECD1284
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 09:16:39 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.132317.1712654195954091914
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 02:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nq8SGp7u;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d6ff0422a2so66512331fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 02:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712654194; x=1713258994; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GwjrOnlMVHP3tk7xPPDLbNT/5xD73WVQ9vAyVCA4we0=;
        b=Nq8SGp7ut3bGm0rhUKDRwFrFVlwD+aN74SUJV52wSSVRQGW0DN5ybt9npnJyZBEN5h
         FE4V9/D7CtKs2HQ0KCzo5ba6BN88GC8vkGK1RLuvsQFWi13eAaor08TuW9pHp/8XQhYu
         x8eAyjZtUDLxenHc3NrrVv8I+ruAEJ+7jlaNLMolAQhV88ofKdCSbmEcZjFhlhYf0XdW
         3OApkm4zElZc/hEGgXXG1H0wqmTbiMIWaLPjT17x7WFa3AMdBp2k/XMIRZGer2/q5pit
         9IGHHthpi8I7ceHUqeCCMRQW6dCvMA200yru6lnprIcC49SkqOa0mysr+TjbLG/G55KS
         QSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712654194; x=1713258994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GwjrOnlMVHP3tk7xPPDLbNT/5xD73WVQ9vAyVCA4we0=;
        b=pKjCbSswyPYXJcq4tR7bld53/pSemP5G50u04N8ptxtnyq9NtzJXp8fFQ1+4G4Ayrf
         RdehsJwADDcKAVu1Jlu+5/8uwc9xq5EXRDBRNeKJ3h/mRM4wH0QKfu60czeFT1VnfPj5
         1sc8UxeWXF7vdeq2W6148D+DjBwe4MzH/SXXuoy3izpqyuTJ0a0ZHjH8MXw8NFCB3MUe
         yGTu0iVaGFkFiW8uHkdHpoFZJA5i/dpOpbCgN/mbRl55TEq8gyutwoScN1Al1OCRUR8o
         jpFs0U28/2G6X9uzYWCIWB01etM99JgGC8F6Sn1POATO315LdQCuEoe8y2NQU7cB0bfc
         WLnw==
X-Gm-Message-State: AOJu0YycpYBs5x8IFRQzFzeyV3uOvd6K8RgowJxmEYkKGsIp/EswTC3I
	Ey7kKH9ZieADspIbYncTAnr216FOKBthYhr+h6WolKPiSz/BpcJp5Ff97JzqnvvhrwavWakdxlv
	41H9orePBCJWBJ6ukBFgqAqkjjFs=
X-Google-Smtp-Source: AGHT+IENcXCen5VQoqSSxQxzhVZ+JZEWNWpPpdU4VSzXEr53DASKlTuAwlceD8P25r77yv0bv14dsrpwZsuxvW0xWOA=
X-Received: by 2002:a2e:b994:0:b0:2d8:4a22:7536 with SMTP id
 p20-20020a2eb994000000b002d84a227536mr7362908ljp.48.1712654193639; Tue, 09
 Apr 2024 02:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240408070450.27686-1-peter.marko@siemens.com>
In-Reply-To: <20240408070450.27686-1-peter.marko@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Apr 2024 11:16:22 +0200
Message-ID: <CANNYZj-HosUT6unGOohfRA22x9MWbUgYDn5N=mWjELVkTjBQsg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] systemd: make predictable name mac policy opt-out
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 09:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198057

On Mon, 8 Apr 2024 at 09:06, Peter Marko via lists.openembedded.org
<peter.marko=siemens.com@lists.openembedded.org> wrote:
> -           file://0001-NamePolicy.patch \
> +           ${@bb.utils.contains('PACKAGECONFIG', 'predictable-if-mac', 'file://0001-NamePolicy.patch', '', d)} \

Conditional patches are terrible for maintainability. Please make it a
proper meson option, and submit upstream.

Alex

