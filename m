Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA60CA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 09:47:24 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7525.1790934439236274446
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 02:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dtUDzcjA;
 spf=pass (domain: smile.fr, ip: 74.125.225.99, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b08452cafso1385032f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 02:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790934437; x=1791539237; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kM+CvnkjsL/7tzfO3T2twI8OrjZ5PVpP4AA9JynwP1E=;
        b=dtUDzcjATvpzUYiYad5ylPp6n2LjhvUY3URmVDqEQgiQMbjha2ZsN2L9uA+owz8JG8
         lT0FmTGTy5awahz5WIr4NSHHaBle1WnMPzLIMGawJLPxOgiJU6A3kbuFiHIwh/jvGYV6
         sZLRAH/KaK21LjSs31c9Tjez68jgj0Rp2DbpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934437; x=1791539237;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kM+CvnkjsL/7tzfO3T2twI8OrjZ5PVpP4AA9JynwP1E=;
        b=uEyGwp7ar7TIge39XZV4jAOEPodnT9U/AeamuvKfyvmarvw1bFjFzz+Iyk+evPTqvQ
         Y6dbZE0btHK3zAkXVeVO6h3BiOQMx+Q68hb9s38PwwdguGtwvas3KdCXnbYbd/+Va5uc
         Xk1vO/oS4c2fr4rZdwelvmYmIP5fLAowZDpChtBvkwqJkEXkzE7X5iGktmNpP5TcT+fq
         Inw3ME7HqAm4PkRllH4iGHBM0AImHpCFFT+TPD6skNa8q9jB3KzgjYC5KAIqEQIcw9+e
         3KEtVDY2sK+yIFp/FtNZItqpVNQRjMY3tC67qvDWosQCwFBajfgC6xoASgf0RztacjI9
         KS+A==
X-Forwarded-Encrypted: i=1; AKwUvBxoY0m+QednkMYt+RIBHn6cQp2UGCsFmtXtHF8VLDpauL12umjFsXwCe/UhJdIVkcOKG4mnDS4wHNts1gHfsa19zQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKVRNPp7mw/zzVJcRwdWgg/ivY9IZFRSRI7X+Ga6iublQhVHKnz
	GxMvqVPSeqtd68rtZgpUEFNnqQnW0DRr+/Q7fQIXkdmFbcPNl/tdCNtRuaGF9RBKrSk=
X-Gm-Gg: AYBFou0aj9k06Xj+U/85+XxxZHzwnsysrzw2rxHxQHwupAfCsLrN7mkKzGi4m37VjT/
	a2zQGRwSeOz0cEGs81tG3OXwJ2jTRpf0BPCtxCckCtORdHUK9077wDgZxI6vdTga8WQzzqyCGw3
	pWI7o5Jsx96U6395wh0pAw8yqzbaXM+sztcsJwS3Lie8lOv3fCHCNzKlFt4WlHJQbz71M8V8Dp9
	lGZ/toDlOy6Xm4UMHfaPes/WYa1lJpuH20719IRgDc7cUgObmmF7MMr1v4XTpMHxZgC1vAfwsKl
	CQhbpc4yN4D1WCo3lu3V/Ihs8Jwd2wRTPuxio3osK4JKfqnoHZ7728Z82UJXBW/Q/Zr4Z3fKvlU
	zmiwt6kq3RoIfJgXQwOEvnQgHFw+hHOM1yE5Kwll7hlkbMUs8Wrh6iCrugdFcqFJq7sGbr7WZHB
	GWrVtmL2njyXQyonG85y2Lbinpy528R3gKYNdLkZZvAwlIlhHigBw51NybR7lBhYdi8Qf7T2PLg
	OiR+RpHl/YSHmlc4Y1fTWIZrxbh4tI0OH3evCTjRcjWYID2a15mbd1CW+Hcjtw=
X-Received: by 2002:a05:6000:41dd:b0:487:27f9:837 with SMTP id ffacd0b85a97d-48b12720456mr3893256f8f.44.1790934437409;
        Fri, 02 Oct 2026 02:47:17 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104417sm4369664f8f.27.2026.10.02.02.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:47:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 11:47:16 +0200
Message-Id: <DLU99U4S7591.5BVIYWG6DZTE@smile.fr>
Cc: "Suresh H A" <Suresh.HA@bmwtechworks.in>
To: <UpStream_IP-SH@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>, <suresh.ha@bmwtechworks.in>
Subject: Re: [OE-core] [poky][scarthgap][PATCH] systemd: replace a bunch of
 assert() with friendlier checks
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260902081733.3136152-1-UpStream_IP-SH@bmwtechworks.in>
In-Reply-To: <20260902081733.3136152-1-UpStream_IP-SH@bmwtechworks.in>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 09:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247096

On Wed Sep 2, 2026 at 10:17 AM CEST, Suresh H A via lists.openembedded.org =
wrote:
> From: Suresh H A <Suresh.HA@bmwtechworks.in>
>
> Backport a patch that replaces a bunch of assert() with friendlier checks
> Fix is already available since systemd v258-rc1.
>
> Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
> ---
>  ...a-bunch-of-assert-with-friendlier-ch.patch | 108 ++++++++++++++++++
>  meta/recipes-core/systemd/systemd_255.21.bb   |   1 +
>  2 files changed, 109 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-replac=
e-a-bunch-of-assert-with-friendlier-ch.patch

Hello,

What problem is this trying to fix? Did you triggered those assert() in
a project?

In itself, the patch looks fine but I have to make sure there is a real
reason for merging it. Can you send a v2 with a little more information
about that?

Thanks!
--=20
Yoann Congal
Smile ECS


