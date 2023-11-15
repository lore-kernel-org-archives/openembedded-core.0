Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7BFC2BB3F
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 22:32:59 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.27125.1700087578676133172
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 14:32:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=avTUvVYL;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-32fdd0774d9so134410f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700087577; x=1700692377; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ch54HTcKA6PT5Ia2xxu53U9HvywfC9REKTWpDgbRYkY=;
        b=avTUvVYLf+YHKrsftf8npCtrCUYSqhaFhnhb4WSXQVbZaMtCLGrGdiEs04Lrt/RGCi
         GFKvF9yHon9j7lhWeWzFNNzOGRLgH8DSV8gGABviVyssZaozXnSZMsfqYVs2xGaBgv+e
         z1GOC27a4ndExxcRMhOzxYiE0kfhcY4ZgbfAdYItodfPhWfvm/j2a1zh0m7F0OM4bNjw
         wumZkiMmeJG2M4Gs20sf3p+xavd6W2ob/74lzy516pSlVCR6UoUzN/DUIAcWZZ9e0FQT
         B9HLdIDgqspSbZLXIZ6zwO4xmEXd7Bv/LXfQijE4KhuJa4HNEBQpPgUkx/PmklnlBlEA
         HiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700087577; x=1700692377;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ch54HTcKA6PT5Ia2xxu53U9HvywfC9REKTWpDgbRYkY=;
        b=aPmvprd7mwTYYcPVQM4vrdJGiZX/bF9zk+fqENPMH7Cb1mImv6/U0wfNuz3nyYlHxP
         KMECvA60a8UfABovidetmy3Ht7gsLxDsbtFeTU7ca7Sctwys78W/CUmwbl0+VQJ167BZ
         gmTFpCnfWZqp5XORdGFlCjenWED+OafMKDU2RyNYvxEetzTAE5I2EIQnBty+RrWhxyLD
         nKoajAfDO2wGORWWdIL0OHthuZpKeQcL3IxrYEBuRBkBdpi5DWjqkWbAIRNcPL4hcWZu
         QqEQPf/V4Uhdghvj0TE+MPKVPA0prg/6ui1PjOnwAZYDcg8M6ogRmxKo4dDomcGmcNk/
         Pl1w==
X-Gm-Message-State: AOJu0YxAdOXkCrm56wzQrIWrZbmKEFjAefHibVYycm0SRUzmt4CpDjmL
	HP+xwDCr9X+6CvWv5j6RrD4=
X-Google-Smtp-Source: AGHT+IH5IWpd0LpiP4A78AWPPh53qzT60x7OY4ivFFCvNW7NCHIX3BvQOlJWTFb7OgYDkuDrIhrYBA==
X-Received: by 2002:a5d:64a5:0:b0:32f:7b2e:2dd with SMTP id m5-20020a5d64a5000000b0032f7b2e02ddmr14817132wrp.45.1700087576847;
        Wed, 15 Nov 2023 14:32:56 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id x9-20020adfffc9000000b0032da87e32e2sm11786647wrs.4.2023.11.15.14.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 14:32:56 -0800 (PST)
Message-ID: <b38107c74191ff9a5fa6fb0a9cf8a42cfed32225.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v8 3/8] image-combined-dbg: make this the
 default
From: adrian.freihofer@gmail.com
To: Christopher Larson <kergoth@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 15 Nov 2023 23:32:55 +0100
In-Reply-To: <b98adc29-7e18-4c68-b94c-4b9b5b2a38db@Spark>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
	 <20231101110129.647878-4-adrian.freihofer@siemens.com>
	 <41e4a23f7b8fcbc1da06d9414646aed6d9a33f1a.camel@linuxfoundation.org>
	 <1952881b121248aaae11df8b884caba82d567bec.camel@gmail.com>
	 <b98adc29-7e18-4c68-b94c-4b9b5b2a38db@Spark>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 22:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190747

On Wed, 2023-11-15 at 09:26 -0700, Christopher Larson wrote:
>=20
> Can you explain your issues with gdb with using a rootfs-dbg, because
> I don=E2=80=99t see any problem with a filesystem that only contains debu=
g
> symbols, given how easily gdb can be configured to look into
> alternate paths. I=E2=80=99ll admit I also don=E2=80=99t know the differe=
nce between
> these modes, and also wonder how IMAGE_GEN_DEBUGFS relates.
>=20
>=20
It simply does not find the symbols if only the rootfs-dbg is
available. If this class=C2=A0
https://git.yoctoproject.org/poky/tree/meta/classes-recipe/image-combined-d=
bg.bbclass
is added to the build it just works.

Since this is not too obvious, I wondered if it wouldn't be better if
the combined debugfs were the default behavior. Then Ross asked the
same question and I developed a patch to simplify this.

But either way, there are too many unanswered questions to change a
well-established default behavior. And there are other ways to deal
with it.
Thank you for pointing this out.


