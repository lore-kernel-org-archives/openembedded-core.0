Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A5FCD5BCF
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 08:36:38 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11992.1779698191955949200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2026 01:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=A9R7E9RO;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so7132625f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 01:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779698190; x=1780302990; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+rEardEiWer2/SG21eSWf6n1Jsnp90yMts1DzrXaj4=;
        b=A9R7E9ROumLZxEcBm+eY2gvcxEwKVaJHCv+ET/20DrLPpgwzPyO4RU6V5b9MSyVvKx
         k4nle3PtgaDy8ygVzcpjkcf+Cw7+O282+q/i8MYqcMJYdJ4A4bFiaTHrHM+zsmGosxxG
         4VckMoJiyz3B20KBZ+ki1aZ2O4R4vvWrTiIvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779698190; x=1780302990;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J+rEardEiWer2/SG21eSWf6n1Jsnp90yMts1DzrXaj4=;
        b=fDz1ZareKlgWR9p2oBVVSA4PA61kKfySbv1zSS9Q+pHarv0TJ5MWLGVg8NnitusPXU
         NCinCctJUDVl3aFlb/DjYEj04Jgdn35+l2+r81QUSPyLA6Vzz5VpQ1WcLCdo92F54I2I
         nrAz84CsTgcvqxuuAoRfE7wkY7/YInKxQC3bwpBV1xP7aaPcsy+eworF0knp9wmiyH8a
         bxyhM10Dm91ERiNOVur/+t7xoPlMdTgm7bnQHCND/99WZvf5fZLpnLhLsqqWfNhOLeKQ
         yqwup4NiL0n++ejwtOgwDHlEngiaOrEi/O3GBD9ZGhucjYWyTZLe+EuqDf+be2FzzI7K
         BaNA==
X-Forwarded-Encrypted: i=1; AFNElJ9nHu00ePgNPOR02k+6ABPR184AE23+pH/NLKay2ISVKc8+ARZOc+egK7f9/cS205IH/4+WhWMvlkpMW1sXhxF1aw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyCSu1vUPlSVSsbZBMfhUTR8rT9lz8Ykwyf6chjqNFTxP03YBDD
	HAKdAq0mAXgAkP852AMGJZW00lq+Nv8HnvdfdPGUA7+01O7Bou0kT41hinfWPFJ9pE8=
X-Gm-Gg: Acq92OHMJD17PQWGFFRFu+9dZY5WvgSA24zqkVB+sqKddan7vWmWoJ1HiFoU7kCwYeh
	kr5YIVvwEd4nhkSZpYVnYQc6ANLKeQIum/7Q7Albv8SGdw2A2fSonmaDKb0oFuvh2jBUZJ2LU87
	DSozf71SiXX7X5Ub9p6hpEm0TBGtOReoF0FqcEchRuqftrxAhfabDH5isltOaYKfirnLvhLxea7
	0bsVy94Ab9WRnbkmyB7R1NlNiHZM7BMdvI02/jduYONNHvphKqK2CdBn6vpmX4nnbsmzJ6q8pAv
	3Um34ikHNFXy9u8eFd9LeEL98cjEwGMqelbOxgepH3f9ws3YIwCyFrI0CPKrw32OdgAB8+CMFhR
	o3WutG4KwY9qkECfXnaFlRbhzvowlG3bBPdkc1Rua4dw4S8KkdjI7YHzrTr/axeXii9MUgo11VM
	O37afZKHLjYe/4B85PoEMf+bkZ5CrYc9wMFe22kWqvmI4SPzZsJ+6rIgrCaXmhELhGRxb0dy03g
	ZtUaUw4HeI4OyA=
X-Received: by 2002:a05:6000:4305:b0:45e:73b9:e996 with SMTP id ffacd0b85a97d-45eb38b7e16mr23969874f8f.32.1779698190189;
        Mon, 25 May 2026 01:36:30 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d49132sm25534352f8f.24.2026.05.25.01.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 01:36:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 May 2026 10:36:29 +0200
Message-Id: <DIRMCTGHXX9D.PPPFQFYQFN9Y@smile.fr>
Subject: Re: OE-core CVE metrics for wrynose on Mon May 25 10:19:22 2026
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, "OE-Core ML"
 <openembedded-core@lists.openembedded.org>, "Yocto Security ML"
 <yocto-security@lists.yoctoproject.org>
X-Mailer: aerc 0.20.0
References: <20260525083403.2532103-1-yoann.congal@smile.fr>
In-Reply-To: <20260525083403.2532103-1-yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 May 2026 08:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237573

Hello,

The NVD API is down right now (returning empty lists and 503 errors) so
I can't generate the CVE list for scarthgap. I'll try again tomorrow.

Regards,
--=20
Yoann Congal
Smile ECS


