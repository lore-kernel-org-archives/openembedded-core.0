Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D67EB7EB6
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 09:56:33 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14627.1772618183321080683
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 01:56:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZmpKoUgk;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-89a1347051aso20698586d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 01:56:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772618182; cv=none;
        d=google.com; s=arc-20240605;
        b=TMFuUO/wPxVjqzKPPE2wlEGeZknzkz7uzfBFxeWsFu30WeNC19n84t9lN+a2Kzzx9A
         9UowIcJqwHDtoc7s1zbfBo50bUcNXbR7ec0B/EbV5d7UZRcMxl9VlUmSOUytZgNQW9rQ
         aGkz3PTO0oed8uCnZX/5g+3Njz69uG9cEB2zZ9+eWcZeHr+yw6WziDdiKoP5Qh9GDlrB
         yKZ0YtI2ifsy5iIhj5nmrRkiQB7mfQ/A7tnYdnSlE+CNJrYVeUiuOORdfhcssNXls0z0
         AGeN5KUQxl9vDDMB2lzl8gJc+9iRNmwZNNBDvigc9926ml3ngpPl2LHRs4QgaUdB+JY3
         IXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JeP2Zll8hTJ66LXrirzNjq8ZecX3ap3XI+QhE7DDI9w=;
        fh=nN3b3dfGRIjrpjHx1fVsEaSOw/6WBmHqj0fk/PIzebk=;
        b=VJl0gjzbknm5BhtcsUHrzXvRADAVSruymIswT+J1kJbxD0Yb0CRPdpHi9GzH0zP1Yx
         jqtN/dgFBeU2UTvDysFMuoLMrMum7D/O3mAxoCnEtO2LdOgYTeVFjBYLSnukiwWcZE3w
         Ggv4ncSjJEtBUfQzpicieoGJ3utmNsVxIFWIXKKtDFRmOxF/hElcWElGCT0JdcoSvaa5
         FWYnXCPzd3xmoSM0yImBpGPn/28J9rTHoqt1Vc/TIBpvEQ3ZGV3SE/+a9RmGrwe2uALS
         Jfj3rAKWKINuVCZ611TVYk4C7z/abuvtGiDA5SOxlVbcTMUjkaOPP53BnRYhzq6U8XOo
         a8yw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772618182; x=1773222982; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JeP2Zll8hTJ66LXrirzNjq8ZecX3ap3XI+QhE7DDI9w=;
        b=ZmpKoUgkk0XRx3q3EcSqvr6kkNgPruniLAfKhVXnHbX2faswg8KwPJt1D74JBIVJJl
         J9Dux2zYgHJ0azML9c8KxgXQGsQohktJkMqmrfFIEtO4pPOorvYFhUYQ5N4hzPZbpP0u
         yrRkSlwxDt6mV6vVhSIQ8EPJEdrLtTrDfz9I2ii6Blr/ftzko+ksq8VlUUSRv2DZnYBW
         N3eRGM5/2KaAahtwU+w169azU9BHTV10Xff71l56cpzkXB/pmXGYp28k8L+jZ7KDgwi6
         TGj3+XztqycesluYPRncKGJbnOfnUbSlvP7etoP97qhET1DHlHox5jKw7CHwe7tWOQer
         EJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772618182; x=1773222982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JeP2Zll8hTJ66LXrirzNjq8ZecX3ap3XI+QhE7DDI9w=;
        b=RmEAM60AHUh/VzA7w+mBczlqJh5IjwirQK7qDuEZOw269GBXZjQMD4URIwx5Vj/+4Q
         dM32hwGbRb1TaYhEbqq7cq/qapSTfg8LLZj3jrr7RDlYRZyJ8VmActnn52n1OM8xnnDu
         JLE5WNuG+fS6++QIspDrGexrB2tZCuaIRdl7T7cBnh+3u9hy2Y04BnEaLnHbz4huvSiY
         VcRifrYLNm/skjnlr4roEMKIeY3rROi11PpqxM2dBj90z3z6YN1bOgkuOTkQIOa67d8u
         8QKC20SdVhUfPPtFJD5RVxL1UkDYHAeQDXV7WiCtfXWxe8Cykl8wIHJPankPh+b1JAkN
         5kXw==
X-Gm-Message-State: AOJu0YzRiLlWvjlb44VziY1AIABFrOfXzKjToc/DqDEIBE+QvYf2JuPg
	FARplKR4+PLlH+9GnAdgbd8Eb5x3QsJI+Ii5HOG8rbNewCBoi+zMrsOyeLuorTLTqGQKug58nE2
	jpQJyJlWeyh8px45w5xtIiaVjFuEWwLY=
X-Gm-Gg: ATEYQzz9eTkmEip3Hwoghf+I4VIUTz1G3qMFxRuTjt1vVxZkKADerQygXL/44hrKbWP
	uISKlZ0t6uauxp/TsY2DREV2KnqolLblCDvPjHBqD/MA+zmkS9HwG3lNNg5xNNAloTRvHDeahtH
	iZaeX+NhNlCR8SD++y6/2xJ18A7GLiNFZQ/ZKYu2VaCLSwEbwTwZWd0WtSGW6//1xhidqEcveFi
	M8Mn5XIqDqM/9CYalYzJYHz3YuSdjoMWeZqpwaGcFy4/yUD6uCTc6BLbDzq6eeeYWlMCfE3v23v
	Wt5HbK4SNmXgNs/BfyxceWYartvzTXAgSLOcNSYDtQ==
X-Received: by 2002:a05:6214:5198:b0:899:e540:9dae with SMTP id
 6a1803df08f44-89a197db2a9mr15469416d6.0.1772618182322; Wed, 04 Mar 2026
 01:56:22 -0800 (PST)
MIME-Version: 1.0
References: <20260303100929.1624-1-wangmy@fujitsu.com> <20260303100929.1624-22-wangmy@fujitsu.com>
In-Reply-To: <20260303100929.1624-22-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Mar 2026 10:56:11 +0100
X-Gm-Features: AaiRm50fcE3pUrkFqXMfPlFDhrBPFBmOEpotgDEqhCnBue4YgxdhekLzpLbHa-c
Message-ID: <CANNYZj9ok9W5-Cs5yLZr68mG6=C8u8pKSZ7s-dgEFA7yDPauaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 22/23] vulkan-samples: upgrade to latest revision
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org, 
	Upgrade Helper <auh@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 09:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232354

On Tue, 3 Mar 2026 at 11:10, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
> From: Upgrade Helper <auh@yoctoproject.org>

This patch needs 'amend --reset-author' so it comes from yourself.

Alex

