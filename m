Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0940CD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 17:25:45 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2231.1778261143617158905
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 10:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=C3FeJsZj;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8b4298d271fso34826396d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 10:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778261143; cv=none;
        d=google.com; s=arc-20240605;
        b=N1vMemyvlKR9JHlGstwfAiDDD38tr3LnlcojgO2SkXROidxgStjZVPtlL5Z4QDsUsI
         2XY3JPJz039iPxRlCueObz1386Wa8mCHVtWoWX3XOB5jiUETlv6BOQI/FnDGep5lXWWK
         6nM/5A5rE3USnbuy66MidfIZIQj2DdQWbDN0lD2HzNZlLoTI0xbLeKV7+/tk4gJObA18
         UW1effYmrUAsUid9VVLNababtWFiEwPyQoUKtpvJDet5daByqqFJUgNLYfrtuRRzU1U2
         PM+cOunQzebW9EgPg42xheOcvdGPqubJmS0mxtD34p4GWfSW3jmfYrRpMberm3cyCPGc
         1d/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FhF/IQeVjUyERND0bsuUgwkRKFMdQd+YRGb/JJ/g9gQ=;
        fh=yc9IhGhkWOhvORCpjqVJ1Sb2oa8Q2Jl76sS9VJTX1rM=;
        b=Jsuj2P3z9qhhn+lwK7RQI9Xv+CeDvA3yxZ6jg1IQdxo1tOz414a1yK3yY+1ATOCe8g
         lWEEtrKfB+VS9kFj3eEBdMqLH4Ac4Qp/NwOsJXcwwJOAlG4kNHwOfxD6jDtsvyxnSJZ1
         67tAyyGfnJk3f7Uau2fkJp0jrrd+yD8t4LmSA88/4hQTPXa5Zqks03NolnM1e1CWj3h9
         aLWXac8LepFrfQPrYGcbJ38MYyTZTgUyFd3+gJcKIKvmruXvbJQTyr25tm8u/tj9bO4g
         FU9YlvJKif8MhXqFOe62H9b6t5SGlbgEefkgENNzf8Klw8qZ3ZpASqfRuiPsn+XrY4Qy
         JqzA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778261143; x=1778865943; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FhF/IQeVjUyERND0bsuUgwkRKFMdQd+YRGb/JJ/g9gQ=;
        b=C3FeJsZjqv3Fcjun65VXBu3lIDWahrW3jB0zyHewx5nZIOX1tP6UrwOZCOMB7kQtMA
         1KI9DO+nhZ6YtkuGFp1Wx2vQx+K8tu+YHA/pbG6AIqXQOuddgOa2Y3d8gs48y3vZpQNw
         GoSS7Jp8TJDznnzrRY85Rfer1FDk3457Xj8Qmw6QdtH9EFz5AV90MnLk1bHrTQOK1BtM
         cJS1UwvJpSUlsDNEdFTRiZg2Wd+K5luPfcP6yG6s/iatvG40FmFMfXFhbsmJxiWeEtHe
         DZrTC0oJBMCObEnbWlvOW7k+AremoOVrRdaCC4j3ZtQSVGoGUSw2AWXxX58bu0dfYGSA
         fIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778261143; x=1778865943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhF/IQeVjUyERND0bsuUgwkRKFMdQd+YRGb/JJ/g9gQ=;
        b=oJQUCuDolmCeodaBahjQKVhjSTiaT3STfXuniOXJkjX5KV4eLJw6Rf5OfXonzmnxyT
         p9kfgNVui41ISImUzcEFCjZs7vy1cM5yB+eJl/sTBjf9hOTQJgQIsuxzdniNbhnaOQLF
         uF6KpeJETgrlZbOD3YSjI/kdcTCIWkCp+M7dfyXKTWpjI2AfJxb6lXD+QSOu+u+sL3BX
         0r869fr7V9nPeajlhMkGms3pWQAzcZSEqW4m00KpezZcyban0KI6hLxOTDdKi26h8q4P
         Gk+9xqD3kQZQFe1KBMLjF2Gf0+5XqvxUYKchJisumCM/UV6RHz/W4SNr+za23L2NGbwP
         158w==
X-Gm-Message-State: AOJu0Yz9KmLGMpKq3tiorHIB4L4zTeo3P620yTEo6XmgRhxKPMfPrlPD
	cl28WdKe1f0kxgINPfadPmcF5v7946McFGT0WRWh6cUwNHrmz8AUbLbjmxIrAYYONP1RpG6FyID
	cgKGhHRAuf+6Gib/UDfa2T7lpyoG0eEQ=
X-Gm-Gg: Acq92OFLyhyqhEM6em0K1xaLvUMenUegNCJGR7YsWWlgk/gmHBKsEiQrmGZAj2vRUM4
	MGaE5yN6hJqePzHPoExsMjBg6MUZcsQGNhY2K2AdzGETdML1LyXmc38ROyYM/qYxODR1n0NXYC3
	ImTW+FAf5rPJbQbao/LP89rZmdjgyExhlRo7TXO0vWrmApaS5B6bIVrWhe3qMTJ9ufmBEfKeisS
	tIVK7kaXQxxp3gtqApKgoeIxTmyXZ4Ojjj63h38maH4Uku3YnI815tBP8OYsFpZePLUWbi/RDJr
	Famfi3NWctUU4pVfEm1LnuO0J2TxoFJJwnWjpgX9jYZltuC6anr6
X-Received: by 2002:a05:6214:45a1:b0:8ac:a6f7:8a70 with SMTP id
 6a1803df08f44-8bd8ec82c5amr156853706d6.22.1778261142454; Fri, 08 May 2026
 10:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <5622df201a632dfc83c5193f029745b3ebd97e44.camel@pbarker.dev>
 <CANx9H-AbMu_n-0ww2UsV117jT20wjWP_i-HiMq4DHAh4NdYN9Q@mail.gmail.com> <CAPQx_gNgsrsQJuxvnRi2LrM2K2hitm5Epnv55X1=PVLerZJozg@mail.gmail.com>
In-Reply-To: <CAPQx_gNgsrsQJuxvnRi2LrM2K2hitm5Epnv55X1=PVLerZJozg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 May 2026 19:25:31 +0200
X-Gm-Features: AVHnY4JwUcvgQ313u1PcSdoYAAaiYEkX8_-1oTRHMEf1bZOoXFrHOBSubzU1QRI
Message-ID: <CANNYZj_raMY7tQ-L5Jk=Ct_PAZw6KagDQGbR1zF3jzF=4-h9Bw@mail.gmail.com>
Subject: Re: [OE-core] [Openembedded-architecture] What to do with vim in openembedded-core?
To: vince@underview.tech
Cc: openembedded-core@lists.openembedded.org, 
	openembedded-architecture@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 17:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236731

On Fri, 8 May 2026 at 18:35, Vincent Davis Jr via
lists.openembedded.org <vince=underview.tech@lists.openembedded.org>
wrote:
> Would it be fine to stop applying CVE patches to vim and keep the recipe in oe-core? I and i'm assuming most people solely use it for development purposes anyways. Then remove vim from production builds.

I'm afraid it would not be fine, and this is why we're even
considering these drastic changes. If vim CVEs are not patched, it
would quickly start dominating CVE reports, dwarfing everything else,
including significant single issues in other components, and it would
make the yocto project look bad, regardless of explanations offered.

I agree otherwise: this constant never-ending stream of CVEs feels
like vim is misusing CVEs for minor issues that other projects fix
quietly and without CVE fuss. It also feels like people want them
fixed to make CVE reports better, not to improve actual security.
Whenever I raise this and try to press the matter, they go silent, as
if the subject makes them uncomfortable.

Alex

