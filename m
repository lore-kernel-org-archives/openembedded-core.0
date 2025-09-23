Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08EABCAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 08:58:40 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.12149.1758617917540801173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 01:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FIASgOn0;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4d10f772416so13200751cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 01:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758617916; x=1759222716; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnVrOLP0D96QIXmqvl0Lj/ESjhHJpeWHl1A8RYD+brM=;
        b=FIASgOn008d9v9hgqe0rR3EABLUd5mdgdcNCfDTQnuovOP15vQ2/2pRi9ezIYzFfm5
         WJ8yW4xF4ZEwa3Jp55R7sKyyjqcEcke/r8GRA8fixL5NP52JvFK4y2PfuAhdxBR21e+o
         1r5SMYGPqGGRttmEYkJJqWwlHc2rrnlv9dtwo21EnqGnDny3sFgIhxIP/V1PqjnsHGtC
         2gb5jPKEnCxInxIrsyD4SAKu8Ro5E0bUYiviiKcUAJ6KJya1ms2O4mvvpzNvwMuazEij
         ZdVjzyYWnOsw6JFTVSOyIlbLO4aLsefxBDMnFmlYWfLp1ZiZcpj8ILMBd6xW0GZGqiGt
         aZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758617916; x=1759222716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnVrOLP0D96QIXmqvl0Lj/ESjhHJpeWHl1A8RYD+brM=;
        b=M4R+AvOCoc4NEItHk4f/3kxe3Ham9S/iVQtXnepSlACGqyAJP6ZbXuMy6BzIwVpZfA
         42EyJqJKvIVolr8GPC6HEbgZr7/lua4MFP3hnKAqKH9f/RwNP3gnNTupxqQCtpEzXz/K
         gweHzhVaXqBSFF2BwVMP4HppqlDCtw8sbi19bcb0KkyPMxFvc5RUdsWKhVN8S4qf7ZaA
         e+pLN7z28Hu1MnHC2IYTaIEdlWrvTbbdnqEzER2mCjt2fx8/wNyeOiwR14pHkCmnoZNz
         taceAYiEzc3ETW6ZMGnxaPqPX+2OdcIqVHVI3rdrZYmU0qggO0FGgjZu82G4y5jgXhUP
         wmDA==
X-Gm-Message-State: AOJu0YwC8tDCaUXU+D77Y/8a5n2VDSK3pWQPH31JMkMYff3gZdbGILu+
	S/JxruCU/v7khL2zEIcbnb/yQkE0KkgcmBlontgvK39/erx7LFhvs5AYLV0E7jIrt1Frn/EGEHT
	rTxSuR/sguw8cKCJ2eWISKcjzxhoY/kM=
X-Gm-Gg: ASbGnctXVHw6bY+MTJ9kv6ZbM23CTIwvvwJ3UCOYji5B6tNWe0Wp6DE6bz1dohZYmUm
	jOubbD/8C/d41WN44U/l8i7/24PRw+8baqudUUdi7+BcdvjBjB7PFm0e8h8IrWksERIgao3O2yO
	V+9D+UqKCjEpN5m+N/mowNuOgwFCcFDlDM6yLo0pS4XH1BnnyX1w/d5P9zFmdtC05LEPxaMp1ID
	evVaPyfnh2xT6CFilgtyqMiSzboAJqoB1vKEcdDrUtT14PcbQNDs03y7QmateUwomSNZH7J8euk
	M485xbnJbKfCNCifwIyw7ppHTvigZN27WaXFzuRS
X-Google-Smtp-Source: AGHT+IHGCM/GVo0EdW03YyYArjPtLFV+I3BkCsp5XN61zZPH55Ensqwz/F/N9NTZY7j91vqXBo6uGzjw8/C4gT5sbTI=
X-Received: by 2002:a05:622a:1646:b0:4b7:ad70:238b with SMTP id
 d75a77b69052e-4d39894ed79mr17180011cf.32.1758617916357; Tue, 23 Sep 2025
 01:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <a6ccd7f6-effb-4cc3-803e-faf6a9d52b2d@collabora.co.uk>
In-Reply-To: <a6ccd7f6-effb-4cc3-803e-faf6a9d52b2d@collabora.co.uk>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Sep 2025 10:58:25 +0200
X-Gm-Features: AS18NWBDSz9HuA0bn8df_Ix4HK3GJ2Dwa98U3XZqcqDbZY2kWemIT9tfHzPmoM4
Message-ID: <CANNYZj_AfcRqE0sOpkfOizCVwPHq2OPbhTgVxTMomvDeHsr5ig@mail.gmail.com>
Subject: Re: [OE-core] pseudo FTBFS on 32-bit arm{el,hf} on Debian
To: andrew.shadura@collabora.co.uk
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 08:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223869

On Tue, 23 Sept 2025 at 09:23, Andrej Shadura via
lists.openembedded.org
<andrew.shadura=3Dcollabora.co.uk@lists.openembedded.org> wrote:
> Unfortunately, I don=E2=80=99t know how to make pseudo compatible with su=
ch a
> setup. Any hints?

You need to remove these:
-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_TIME_BITS=3D64

pseudo is a special syscall wrapper, and handles both 32 and 64 bit
versions directly.

Alex

