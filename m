Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A9EC43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 13:32:33 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9757.1784035943739756279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 06:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mZaEIENW;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ee43b3e5abso37005876d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 06:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035943; cv=none;
        d=google.com; s=arc-20260327;
        b=nGmazgtidOcwXiDylXknBKOw7XzM6Y4Qi5sL4YslkHccVENIKAtveCz31f43HJO19D
         iODUzdem2EGFGwhHoUKbmVvnEwzNuF8kfIsY4MCJW8uDXrDHdBdXU+YHs8Xy1qRVptaa
         eK0N//TJt8d0EfIG0tO29y288ylgZSkGX4iPWpGd30Kw5WOZpfPdqP2dV1E1CJPmk+ZB
         aZNqwHzYGTIzJhHj4dWJPP2JUq/QpHoF8KVlCcHXBpVJQVb6C8z1M7qxa9IkkQPbEOnF
         HGOvqeKU4AEYZIke7xiGLieJNtugkUEX0tcTdifBqafjeHyWtCuhouPTNK3OvfCMQiZn
         FiwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wy6d5Ah0t8lGB1u8oDnvRBtlj37frfJ3VvMqaQvCAeU=;
        fh=Gm82lJGUGgBpHVVqNsCo8FTHyXidvwg3U5sEWFmbn4k=;
        b=eIfZkuSUipb1WiSOnzdZMfHDtCfrrLcRsusYRgCv5TFl7VdqFS1QxWHvk3oW980lFm
         SleRKML2C/iMmQu2LJe0aIsAKrGzwL94T1Dd6DI0BSuKr5JvSR5PP3XMEE/rMnCO9fql
         YD8slGrZtj1mjpxpM7pGOjsLPsTu6ODb3MwxhFJzRgnyCq/e3s+ZRjgzt4qYWilLGOlL
         nu7odKjdXigiAQmUIUh+xx/Eu5kkeaotK1DSO1iXWi5xQOCnm0KyVBXkJdGKUa7kzObl
         HI1QEVZQYdx6T+0LKJe1Nb8Rbz9WgHMefQDpBW2B1p0YSaOkYxnVD5LmwHDema1653Nd
         LFMA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035943; x=1784640743; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wy6d5Ah0t8lGB1u8oDnvRBtlj37frfJ3VvMqaQvCAeU=;
        b=mZaEIENWczn/PNfAU0KftY9UgAnwKEnIPMjU6WFwNLusfo/VoLGPr2bodjSlCphl0t
         s+4r1fpxw7wWr2hOpepVdAb6nnK7PuUtjHwdlTcMaRjzc4fe2nw1VGTb48kvoFvcv39t
         iKJ7qGuVkUkhJ5mJzVCpPgxhizUNTLh4oiVuKmcu+69IPnzQhQsB/4V2hAcVyfvRrR4c
         qdwlTiQ8LpbFISEolHj0RslRzMHMncKECPKDWf6d4Z20sYEp51wGb1zeWrEpBXBn3q2g
         Q2KwUphLDO4AN9tLt0gFWcctTeA3ljytbdHzIXobtYJT/ZwYe66UJp2+QKDhEdZp6QjF
         dWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035943; x=1784640743;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wy6d5Ah0t8lGB1u8oDnvRBtlj37frfJ3VvMqaQvCAeU=;
        b=TO25xhOTmipPRPPywF6KgpiRa2H8766qgUeqKJS0X0a+D43sr+3+f4y1k0c8BeEIfw
         EIIU6dFVwi9iOY0S/c2Yi9v9HlOQ++xKcS6y9AlBM80kTXq2ydfE9TNsXGLQGxL2X+wY
         uydl9cOST1P6GDgEYPwVsvM7RNzXZwUTlurJ1Dp+KpUXWcHDESQMH9B3KAeTxj/Xj1+1
         pruRfziceLL3CwmA87l+dfZxW3sjeIIdrSK5/UHFMQ3c/YBfVt4cxG71W3O+4gP7bBs2
         V7LN6xXz45TmBXKHbfO+xiSo4B/E7H8gaUS6ThixKh7Eo7J+lrgY5TpS1rvVsvwSZDfY
         k3iw==
X-Gm-Message-State: AOJu0YxBuiFjzQTaG47rO34nhhxNlCG7rZ6/Tm3D/ygO9iuUQ12Vu94I
	/tKFDz0iQy9S0WYJBMTvQChg+1RYh2fwYoEaMV0/sxzmyjbGsL2fbx7djOej8HEQnqt3cJ50UHb
	Ap0bZrvouguEmOdml/14POUrt+/KHJEA=
X-Gm-Gg: AfdE7cm61mqNuez5xLWbuCOV+TKiVuzHE0CcFWB3DY2fxD/K3982YzjH4H/nFRlz8S1
	RXCGNJr2uhflii8UepF/QxylEqOVZylRZ+0+WnCXmrFJO6uN1uJ1AQN94vlBbEAAWnuU2Lb5NMR
	sWr/D5MqPhV49XUWt/5aNsKLOPV2F6X736o+rBKQvcDnq+z2jIcbH4JjSB06JoJW6hgkzMDfZNR
	m/nwZ4MyQvXYxS/SVK2iR+JxFrAn6eE8Yu6fDKNTDpRiwa5+IEgB8T4nG2Kite4U6NjOb6InEYC
	g8+uPcOmMPcCRDdHasVlVTnVafxxM74=
X-Received: by 2002:a05:6214:d6b:b0:8ee:f0ac:b9f with SMTP id
 6a1803df08f44-9074c73c683mr23611526d6.21.1784035942430; Tue, 14 Jul 2026
 06:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260713185154.4171585-1-Ishaan.Desai@ibm.com>
In-Reply-To: <20260713185154.4171585-1-Ishaan.Desai@ibm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Jul 2026 15:32:11 +0200
X-Gm-Features: AUfX_mzGf-BQpA7TFUG012EI7J27E-Tv7fEHRzN6WgqaGOomyESVhcnDlnDxwnE
Message-ID: <CANNYZj_HBsupBnzMvb_z1OxE3f38MAf+7x9N1FSPGKQKVumqJw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] memory-control: add recipe and bbclass for
 cgroup v2 memory limiting
To: Ishaan.Desai@ibm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 13:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240893

On Mon, 13 Jul 2026 at 20:52, Ishaan Desai via lists.openembedded.org
<Ishaan.Desai=ibm.com@lists.openembedded.org> wrote:
> Adds a CLI tool and bbclass for applying per-service memory limits via
> systemd resource control and Linux cgroups v2.
>
> The memory-control command inspects MemoryMax and MemoryHigh settings
> for any running systemd service and lists all services with a drop-in
> applied.
>
> memory-control.bbclass allows any recipe to set a memory limit at build
> time by inheriting the class and setting MEMORY_LIMIT. Two OOM policies
> are available via MEMORY_OOM_POLICY: "reboot" (default) reboots on OOM,
> and "kill" terminates only the offending process.
>
> The recipe requires the systemd DISTRO_FEATURE via features_check so it
> is cleanly skipped on non-systemd distros. The bbclass guards its
> RDEPENDS injection with bb.utils.contains for the same reason.

Note that the question from RP is still standing, and without an
answer, this is not going to be accepted. There's a lot of possible
resource control mechanisms, this doesn't mean oe-core should carry
them.

Should this perhaps be proposed directly to systemd upstream first?

Alex

