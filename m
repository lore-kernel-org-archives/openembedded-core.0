Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F95ECE564
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 08:34:21 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.17951.1725957252440109795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 01:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kieWlgeX;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53662965a05so559366e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 01:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725957250; x=1726562050; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cP6aZevY1uzjNZ9wejzy9ekjcjtpXEJcpCBLMhryHoU=;
        b=kieWlgeXOoURCm4OI6aLRZ4KhZrcu/ny9CZkggc3B54oDioseBqywX3Ii9h/k3rMgc
         8m+/QA9LZQelM9kiJtSQf3k/VaVzcmZFgbzDLum8uKNideGRzbFtbmx0nrGfIDZIDBY3
         BwDQEFek7I/BIeH006jgaHVdKJ7q24WqkZ4dkgO91oWNaSw0CrOkVVJe25H4SEfqjDuz
         KY3m6VD9tjoRZiVzYfG3giMMESy8Zc2JOeMGsXR+gfo5u7C8vMst5hDGSf/cQQafN5zD
         hr/30tgLMDNhbpwGpQBEiDHNRxQrQyE03l2bnr0m+Z28oUhwE9yB8zHChO5/IbKToats
         aEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725957250; x=1726562050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cP6aZevY1uzjNZ9wejzy9ekjcjtpXEJcpCBLMhryHoU=;
        b=qmB7L6QlsooXmz19KaXJCO/CdTR558mOatgY8Qq7khnvs2FyaT6apgoiCbEOA/VdRh
         vnMiQAH1Yv++9ipp6qAbiwpmKrLl5lDS5rgemdJRNXkFxR5udL0uDkI5eWkNuYB7X0G5
         SYu5BFi14RMdVz9wBjd5rBv4nCLoqqyqSW8fg0MwEiOzEh5BpmPoRmi4Ii3BeMRQi3fb
         r8nfG2X12ykUCaRYDb8Jz63y7dQ22rJIpr0V0stN+UU4YY5zV/iI3ZRbbp7a8r/icVHp
         MAFdxIFlIwLDVG3vGe9lqGVJKbXs7L4ZL8dlYcwK2/CHYOKUyeXii6i5Mx9bJnGRG6/F
         EsEA==
X-Gm-Message-State: AOJu0YySHHwQEAAQ74u10qESnkr5Ux9HgrBgMdxDOwMRsi41lC1ec25M
	L8N5T3VgCIdzE16+tgRCzt7rwZzIfbG8wHYgI4cePA0m+TJJHYzJ/xdil8wGSEq8LVB6bDGEQuO
	PHe7+UqcTPVTEqdt9V5UYhDSUJ90=
X-Google-Smtp-Source: AGHT+IEMyHf8H7V27F9bxt9AS1yQR+eEkb8ELkkTXjCUY3tkyhkJDyMbJjLmDHjWdA0esaH0jsLMB57cNGAj6BvZzaU=
X-Received: by 2002:a05:6512:1116:b0:52e:9b68:d2da with SMTP id
 2adb3069b0e04-536587a35d2mr8490593e87.9.1725957249507; Tue, 10 Sep 2024
 01:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240910072006.3938401-1-ejo@pengutronix.de> <20240910072006.3938401-2-ejo@pengutronix.de>
In-Reply-To: <20240910072006.3938401-2-ejo@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Sep 2024 10:33:58 +0200
Message-ID: <CANNYZj98uy30C3Tj_K4wkipPJVGt1NDnH+AyUamWsjGGdsXR3w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 1/7] barebox: add initial support
To: ejo@pengutronix.de
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 08:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204339

On Tue, 10 Sept 2024 at 09:21, Enrico J=C3=B6rns via lists.openembedded.org
<ejo=3Dpengutronix.de@lists.openembedded.org> wrote:
> +PACKAGECONFIG[openssl] =3D ",,openssl-native"
> +PACKAGECONFIG[libusb] =3D ",,libusb1-native"
> +PACKAGECONFIG[fit] =3D ",,u-boot-tools-native dtc-native"

Does barebox have configuration options for these? The problem with
auto-detection is that one can't reliably keep this options disabled,
as openssl etc. can show up in native sysroot for other reasons.

Alex

