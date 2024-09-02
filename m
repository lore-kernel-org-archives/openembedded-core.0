Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCBACD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:36:58 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.35779.1725273415701521931
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UkS9rhMG;
 spf=pass (domain: linaro.org, ip: 209.85.221.42, mailfrom: erik.schilling@linaro.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-374c2b0707fso906165f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 03:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725273414; x=1725878214; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyPZrsiOU5a7f2UD7z/0BdNSiu2DGTx1pu/8ZV8/iF8=;
        b=UkS9rhMGqi5yJ0eoIsdc9tgW00P6uwh/GRb9nIfS18JiOWjz5g9OApSaEBUOEJEmXq
         /NaJKI1GJoZyn7j9N0QKk8WfMJg06bCmYnt4Xq7tZcZbcvardEf4lVxY7dof9v31jJeD
         yVPfOW0mbdJzgrJd1MJorG84BkGk2rQR6BZMXESLxCRUezFGPdiXE2rUt4CG3/vW8BQX
         kxs02YXwgHi6syBn5k3latdwd1qg9Phf/y5tzg+ydvOWoJHORuWaajHe8lHkwKEaNnbr
         JRuW8Lr06zk0x9+qx8ddeyGPJ9lpYWw+Uy/Tc4XZlM1sVv8C7u0ZOfxOVEwvkNJE1ScC
         9VZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725273414; x=1725878214;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cyPZrsiOU5a7f2UD7z/0BdNSiu2DGTx1pu/8ZV8/iF8=;
        b=ah8f7ErTeGwBFaX7UEH2O30A4WSSmQ4ezeBXR4S+llu5IavlqRqHyOhAIDNLtOTccM
         +RdCitOdspSiT1PGE7SKh3CBrTVvJ7kdoM3OeCsqkOsbGioZ30fZfOmEs3uCALiBSmyy
         4+qYTto3rgckfYwGzS14F68XAF8vYhIXs/EHqmtY1M4kmiIVlCu08V6KGHP2m/Glf69P
         qjXgp/R1XVIn8TRzSUFdZIq2Yi5SFu248FWrY9/sT+ILLkWBBQPj1Se4fGb8P9CwgKKA
         cim69IuC1IN5hetuqxF5fl2Aj+VjLzhU3/x1y0dIear2F5Gd4zRyjeV2ZtmcWSiijrLI
         3ZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2uSf7kxIj5tjrabSDzEXylNJ1j0maMgJ/eTWYs/qrSheb/rVMYwXqHufcfvKJAtLBCB2mx8yXXh42Vm7x//D9lA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz0dMPKwe6c4uxiI/CxDDrPnQvu/xhq4zuh6lPwP9oL+gzRdfk0
	JBwxmyzqcM3vD4GCGy2n82ca0zGPFzsX+1ECOZYPx7xO/a4RTJ+lsM3yiJRUNrc=
X-Google-Smtp-Source: AGHT+IH2y85yJ78RGYH0mEALPh4US84SoKMIv65tj6hDSIo9qCbsirY6fIcfEJd46sjM2inho5dTWw==
X-Received: by 2002:a5d:64c3:0:b0:374:c64e:3fe7 with SMTP id ffacd0b85a97d-374c9478616mr2861795f8f.59.1725273413112;
        Mon, 02 Sep 2024 03:36:53 -0700 (PDT)
Received: from localhost ([2001:9e8:d593:9900::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374b960ef94sm7892569f8f.103.2024.09.02.03.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:36:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Sep 2024 12:36:52 +0200
Message-Id: <D3VQDRXC0KHV.2IZTPOVXOPTOZ@linaro.org>
Cc: "Michelle Lin" <michelle.linto91@gmail.com>
To: "Mikko Rapeli" <mikko.rapeli@linaro.org>,
 <openembedded-core@lists.openembedded.org>
From: "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [PATCH 3/3] uki.bbclass: add class for building Unified Kernel
 Images (UKI)
X-Mailer: aerc 0.18.2
References: <20240902094117.31156-1-mikko.rapeli@linaro.org>
 <20240902094117.31156-4-mikko.rapeli@linaro.org>
In-Reply-To: <20240902094117.31156-4-mikko.rapeli@linaro.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:36:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204087

On Mon Sep 2, 2024 at 11:41 AM CEST, Mikko Rapeli wrote:
> From: Michelle Lin <michelle.linto91@gmail.com>
>
> This class calls systemd ukify tool, which will combine
> kernel/initrd/stub components to build the UKI. To sign the UKI
> (i.e. SecureBoot), the keys/cert files can be specified
> in a configuration file or UEFI binary signing can be done
> via separate steps, see qemuarm64-secureboot in meta-arm.
> UKIs are loaded by UEFI firmware on target which can improve
> security by loading only correctly signed kernel, initrd and kernel
> command line.
>
> Using systemd-measure to pre-calculate TPM PCR values and sign them is
> not supported since that requires a TPM device on the build host. Thus
> "ConditionSecurity=3Dmeasured-uki" default from systemd 256 does not work
> but "ConditionSecurity=3Dtpm2" in combination with secure boot will.
> These can be used to boot securely into systemd-boot, kernel, kernel
> command line and initrd which then securely mounts a read-only dm-verity
> /usr partition and creates a TPM encrypted read-write / rootfs.
>
> Tested via qemuarm64-secureboot in meta-arm with
> https://lists.yoctoproject.org/g/meta-arm/topic/patch_v3_02_13/108031399
> and a few more changes needed, will be posted separately.
>
> Signed-off-by: Michelle Lin <michelle.linto91@gmail.com>
> Cc: Erik Schilling <erik.schilling@linaro.org>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>

> ---
>  meta/classes-recipe/uki.bbclass | 158 ++++++++++++++++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 meta/classes-recipe/uki.bbclass

Acked-by: Erik Schilling <erik.schilling@linaro.org>

