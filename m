Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6589DC79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:53:25 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14700.1789048395205585229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 06:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rP1HAqlx;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso86475525e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 06:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789048393; x=1789653193; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7j4u7SohyWbL+mxJaBFy7JhwO/2LysbzirnErjVWvUQ=;
        b=rP1HAqlxdM4XeDitxvd1jEsyfA6bqfeBRbAlMk+xJMfdRRL0yQcFpC9vq8QrkBSbEb
         PqDIDrmjEpMDDB5hwP5mkFdE6Hv/1aV2g16wMDMF1QvOkBLSvqPK2LrZS5OgyPcqg84X
         JjZitXOPj05HXUgruwfIAlmlkFQgJ7bXPdWUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789048393; x=1789653193;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7j4u7SohyWbL+mxJaBFy7JhwO/2LysbzirnErjVWvUQ=;
        b=iDrsqEs5piSp0rwm6RwbPSIr4V/kvPOkYUZQNOUnFEE39R1yPggb4FTYRh8Q3c2UaU
         hx7uOq6IH5a4j6q1SyLM20up6Bf3kYMumzvfZdcMobGABCmdKXJeoQYEFLq0TRecH36H
         U/09aS9HfnJZ4TqA5P9UGObpdz0d9Fqw23e7Y//VmUnnmFr3h/Y4U48kTUAQMt2kAvRU
         3kwNM4aF8xY46ipQz7AluSpF4I4YGgSKNLv8ZfwutWAzrOM+w3EMTEdJUN+xQu/AfbfU
         EZQud+hYJhNernKO4wnpPSncJowW71ZscQXFK2C50v+aWdE1DrVM/+Ajm0MKGkO9pWxR
         Ofdw==
X-Forwarded-Encrypted: i=1; AKwUvBxuScCpsY78IthcmHOxfC59lYGl34/YfApkXXWV6zQffEtNoxn3cPpHhnAYcO/fpSGmaM6oyoZ42SSgHX+Et+/IIg==@lists.openembedded.org
X-Gm-Message-State: AFuF++km9QC/qZvIm2jWcqDpG1Ork23zQpje3ZS58YTBhVrt+NALA6HS
	S/APXaAdibhBS9MNFKZRwojkKgnuc18a5C4oifvb/dqo8RQU/3o5iapDlykcydWjRnQ=
X-Gm-Gg: AYBFou1nFbtxNnhRSUCDc6e06GaIHbH2LvLEZnfIzoOW2MceNYUrXwEzzfyumryzB5Y
	UF5Oz6r6YwbE5TSIBhu5L+bjkL09GTmmFyJN+tcy4I1Gw9fzlBluDJ3XSgyIhwEZhUcZfk2Cavl
	/F5D6oH6AFOz597Ptl6b0VcYih5/EtOk0Q9v+41ZoTU/plKXyWogvpNlSQ1ROybDspVtiIUh+OS
	ILL+4WIKtUPQrNZN6hjPEnfo81dPCfgWc/4fzngAde7tufxvS9pxhZP6ogzvyDu9qdZQtDEiZKF
	1P0G4AjQ97i6H/kfj04L704wXq5K1CHbu2GruVTIiXypgqjN3qvZabo7XklPApWhJR/aeqpt16X
	zamk02jZKyO9K2lQ1t5UjiMec+XXHyAM0WhhEnHezwbqHZMbNLRFLjz0OPdApccguze7q6itXS7
	1mMJn4QCFB/OS+GOLsJdsLY+pIrHEWwzaQvcnw6bgtDPg1S9z480fnjGL0WBey9D0So4DRlHVv/
	gISuT5lLkzHmWnG6xcQiURHacnHNGAkp68b0jIEL2EMqhhuBaQKc9aHy0Q1xGs=
X-Received: by 2002:a05:600c:a49:b0:49c:fc6c:be0c with SMTP id 5b1f17b1804b1-49cffdc3823mr342901835e9.18.1789048393332;
        Thu, 10 Sep 2026 06:53:13 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c07c17sm93697185e9.14.2026.09.10.06.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 06:53:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Sep 2026 15:53:12 +0200
Message-Id: <DLBOQ59QG4J8.29O4AC74ZP982@smile.fr>
Subject: Re: [OE-core] [PATCH wrynose] systemd: backport drop-in lookup
 optimization
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <wenwfu@qti.qualcomm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260910023338.1422939-1-wenwfu@qti.qualcomm.com>
In-Reply-To: <20260910023338.1422939-1-wenwfu@qti.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245583

On Thu Sep 10, 2026 at 4:33 AM CEST, Wenwen Fu via lists.openembedded.org w=
rote:
> Systemd re-derived drop-in name candidates for every lookup directory
> while enumerating units, adding repeated parsing and allocations to the
> boot path.
>
> Backport the upstream optimization to the wrynose branch. Adapt it for
> systemd 259.5 and its older unit path cache and configuration file APIs.
>
> Assisted-by: Codex:GPT-5
> Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
> ---
>  ...-t-re-derive-drop-in-name-candidates.patch | 249 ++++++++++++++++++
>  meta/recipes-core/systemd/systemd_259.5.bb    |   1 +
>  2 files changed, 250 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-shared-dropin-=
don-t-re-derive-drop-in-name-candidates.patch

Hello,

Optimisations are not acceptable under stable policy[0], so, I can't
merge this, sorry.

[0]: https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_P=
atch_Acceptance_Policies

Regards,
--=20
Yoann Congal
Smile ECS


