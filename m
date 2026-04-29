Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B41FF8875
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 19:21:19 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4147.1777490469451683638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 12:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ClatRrTo;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: festevam@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38dd9f11a09so966951fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 12:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777490467; cv=none;
        d=google.com; s=arc-20240605;
        b=RMQ3KN9xteomg8KX/VqqNB0cgQyx+YgVe/nrAwzxilmrFZX6iHsTVviK8NYcQmzu1b
         cvl1to7oP4tGEG8N5/sxQtATDPcs1/i1SVrDtENeXYVh5BdPG0k61rTeCn6fmBtk4rNM
         sNJyZZJ6L6f7KZDMZq38GRmxkEWW6HU2gutNJK/x4ZxCpRiNFvzikaup4b8aAJM0bBaJ
         cFjnyUNAoqjFAmoS7TeCJ11bf3LQQ9+L61+3zNpx7VOVcMFP0/eGhMgrQp71uo2fAbEF
         rbc1goT+KQqgXpuzPcU8BN8sYj70ynLmdWO5us0BphkdrFDU2XWdMR1oSI8kn5lp5Gun
         4pag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j62cKwEwFMbL4vGjpw2YWaK4L20MEOa2ZwvfDPDy37o=;
        fh=SBLP/sS65Y5rJRvIGq9EaOQHgO2k6h1ewpCLgZWeZLA=;
        b=Hzms4Q1H9bKlOg8maTMHyLJrCd7D0NhI77aoA7q92tebx4P0xdZvXSaGVU50a/Ko4a
         vk9Br8gJm1ifPr4/9SLTpUEpg0E1if1c3UJfiKlTCgVCP0fzItNsV/6GXsArlxb/EkK4
         K7pKmcEX7dYLxfD4rbsB1Noksku73PeyQ8p+Ad5T02mlwgrMHnCXh5lSoDUQF02c+X6T
         6QqCT47RcDhkLGPeYx+8flCIbgJ9di4IK7fBAu26ZtNLIEkjR0bllTv61jiG4LsuRi1u
         X4dd4VeZyhllSMVYHgSWmjOL+IWWpGOBMNPCUOew3gWyzefg5CfQU/hW4HfpKwXyTioI
         ZSpw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777490467; x=1778095267; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j62cKwEwFMbL4vGjpw2YWaK4L20MEOa2ZwvfDPDy37o=;
        b=ClatRrTobnLZLPH/bB2vmltIPolW9+TMJckGmOx8K3TEyozYubMK48/qIZjopzYVpb
         NRO4BtMovsDkaPWG/2H7le96bKsFU+u89fls/6qN4rlJIxJ2WvduMO5rhJ5YMglY9VNo
         Oj2Ta56sROeIX5m2qtjZjnt2aYxbLduBEOCDNV4XFnqtaPH5oVq+Uott2686B9M+QvBt
         6ovAwdAvXkU11fpzonLdIpTPjbdX3HUwKNj4TRQOvi4wqwCQ8X+0QGlwxiJxAgojHgdk
         YIvNlVsX+VbWTMpdHE3amwIBdPDRdERcR+ArWQYy8WN5nrcxBCRRbIKxeRuEW8Qz9kFD
         YMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490467; x=1778095267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j62cKwEwFMbL4vGjpw2YWaK4L20MEOa2ZwvfDPDy37o=;
        b=iWQcRgoPr7VbHVRCLN/XWMvtRGWlqRSKnlzR3Gt1BAPXicwHkbbQywkjpoqv6OzaBN
         NVurfAgIQa69lQyRu1uhaVz+cnmRkYW9ynU9YwULOxh94gcGJre6k8h+8VbcgTobJ0Mz
         lf48K2/tH9haMMYQk7mTGHtCpQkbmuBknkmQaoDcgyim7Z0hfLbiOlOOimM2rMfZUOXz
         IQ0JmEDeKN0OmV8lNuOg+j3IIOW95qo3CfKAqYpUe7Y3IFTc0ySPXhqvDAQ1NVrEGFAD
         rDM52tWNt43N9+6EFLjU5phVkGNrWpYfNlCb8UZzgsVLqONKQj+rCGMWyp6JpcTCAk0V
         8NZg==
X-Gm-Message-State: AOJu0YzD/xUZIYs2Fqx6w4Dy+twNjOMUZHxsctOc5y8Tj8OucPYjLj9e
	LFvwT7ry3p5Hpy9KFffjd8e2xRuSHMOfJsQMZhXs6VIczEG+426Pc82As07ArIqx3zW+JUIP7qy
	ctVMGQ0YOVURBiVP38mJQfLuHEmxni+s=
X-Gm-Gg: AeBDieuaxVy+NulkXRakcRLGs8ucooT41Pa41qLVIGg6X1LxJoXnW8deeB01nBBBkvS
	OqrHftVAkq1wGi1PPtFnjE6oLt9rHg1zP4EA0JOYAay8hmCVZufdYKoI98yVNIkir40FKg3NEVE
	fcY+b2nU+yUTiL7+SHznpdOHTcwecv0ZTBGT1GiT0TKgmyiqaLHKwRdFtlMdTiyGdbH40w2LAzg
	jlyFVdDpsX27UnZ9akLurr3zquEIOO7tBB2XaQiLXe8iDhgPJaX40Pllo2nIy3+Oxtsf8PZuXef
	m+IuYKeuGhjJfvoUWZ4qUTTwbHvsIAFO0bG7CO6c6HQ0PTlpsPLJhDbU2t4vGOJkch3XUr5kokR
	82/pKr+E=
X-Received: by 2002:a05:6512:2350:b0:5a4:1afa:414d with SMTP id
 2adb3069b0e04-5a749cf0064mr1688234e87.7.1777490467018; Wed, 29 Apr 2026
 12:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260429171723.167639-1-joaomarcos.costa@bootlin.com>
In-Reply-To: <20260429171723.167639-1-joaomarcos.costa@bootlin.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 29 Apr 2026 16:20:54 -0300
X-Gm-Features: AVHnY4JNnQju4Ynd372KuhhYvhDD23CFt0HeVVsCW44_eGAefQS2OK9ewWH1f80
Message-ID: <CAOMZO5DW=PBRN1FwnHcySKaUqQCkLsLqEJm63=XfUL3DAJNx_A@mail.gmail.com>
Subject: Re: [PATCH] u-boot-tools: drop yaml in DT validation
To: =?UTF-8?Q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com, 
	quentin.schulz@cherry.de, marek.vasut@mailbox.org, khem.raj@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 19:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236130

Hi Jo=C3=A3o,

On Wed, Apr 29, 2026 at 2:17=E2=80=AFPM Jo=C3=A3o Marcos Costa
<joaomarcos.costa@bootlin.com> wrote:
>
> Since yamltree was dropped from upstream dtc (i.e., in Linux), a patch wa=
s
> sent to U-Boot to backport the corresponding changes.
>
> Apply this patch in u-boot's sources.
>
> Overall, this fixes the build-time issues with DTC (and so in
> u-boot-tools).
>
> Considering libyaml is no longer used, the dependency on libyaml-native c=
an be
> dropped as well (thus reverting the change below):
>
> 02e09e036e: u-boot-tools: Add dependency on libyaml for dtschema validati=
on
>
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>

Thanks for addressing this:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

