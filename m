Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057C4F46450
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 11:11:21 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47890.1773659476174150950
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 04:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WaH6IuVI;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50917e02472so56684051cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 04:11:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773659475; cv=none;
        d=google.com; s=arc-20240605;
        b=igMHZ7sqLiJWmbK7sk4U1Itr7FKY8KeLEvxbmlLy/YOtCJftZjCw7L4/ZsYy2+P8qc
         QRvEr1STYR7CeQSmsN2bbMRO80zn8LYjUJp9jM24l6TM78t6driqo7pFgh3kT61PApu6
         FgyEEMNJ3U0oYTkWAxeno7MW2CcVhG6ccDdLEOEK31ckMVM3YpLvC1HEtYQRt6DDYGBc
         5yQGrs5+SmBTlCOG0UDQSIbMD7rdAF8zvemVjVCFOlR4LoECnMLVnQ5BfEiPlk8aKSdA
         sF4DXxUKc12VecyqkZ9uMAW522t+lARZtaelsRzsnjnhYyZYDRrpdRY7jUk9X8Vcz1ra
         g9BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q4VjNUAkFEC1x5NiirLLlWlpy2oRiAPAOJ1pWcEnn68=;
        fh=BwkvW7yGJjeL00XyqZrBXM7Dcz/tjL13mEPe8xjOnqA=;
        b=K+VxExTlD94RUj8T0A9AJb60zJykQ+OotRc5xFu1UtBLPZr4XIaXetcHe3xG7PKFVJ
         CND8qMEdl6liCyILl5BgUKJ1sYJqKStoH9R5qkRY2y9YLDZ+IOhCUFYEs6ZkWP6OE+Jj
         nnvvr/yBclKje4h9HZe+LoSl7YYi44olHHesoLi+73xbNyM2qaqbr0IVEZAxJOiikLh5
         UWKffXmiF1DZHqgI2XpwS9JVd577qaSdm6bppfGR7AqZdV+lPRHmT3zAi/QByGPd5wte
         hNARmuJJ5tWNvDy72fhU7kgqAZfO8HdC2sQovELL5mZywyomLn3kennsLrbWQp3GGCRT
         hbVQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773659475; x=1774264275; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4VjNUAkFEC1x5NiirLLlWlpy2oRiAPAOJ1pWcEnn68=;
        b=WaH6IuVIVCFUi8HVCh3i+MPMy35XI6a1BLKGRFse6hYTvdLDraTfrSDqImRgwoeOIS
         jqPKrEl7z28esb0Lzkrl5fUt0cGPcpC8pvkF9V7B5dBWlVIWf9pSofbxibWdDMzX1Aw3
         OrkajtjuNRyzSM3vPjQ0isURGm7rzKND9ubqcpSPmkKQWoA0h54SZA+B286M1Alm/FJG
         1Qe0/2DAJCb9P1NsoIr3822H1Jl3HmF78+W5d2K4hjA107Os3+SvdS2uHdBbMFl5IHI9
         q5t1j4/lySmtP3ze33rSvfBxskMFyqvMJ7oypYYaqxhcekaz+xPiiKFjjmJUMmjQtsWi
         PmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773659475; x=1774264275;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4VjNUAkFEC1x5NiirLLlWlpy2oRiAPAOJ1pWcEnn68=;
        b=YV94gV6Rd75mtzzPWxcC2xsawgHnvTTw4OsUoK4rxHPiuiWWGkEibbyXtGWhc6GHXi
         UFJntxcyb7pTNfCaG9RPRt/m3NL/V2SSh3plF1V8Ahv0Y8sH3ztNNMpmQzvlqchIZKfm
         rEqzjKUFSnBmkZFOx0VgIgxbJsgAtvZF73zgJmwy9Sj4SVcbi2gPb0FBC4SQm/U/6rfV
         LbiLQZA8WZ5+lsjO+/o8U8MJDixgElTy2BpkgTrrQSC5wxjT3Wq1E4QHoPWxt7kqbmKW
         woczhQQMe5N13zq/lAIuMleclYTM2INq+ZuPbcNT2M0bE9s4LMRa0TtJLoPAzq4xcLtI
         7EGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq5gNw9Ucn8VFAjyomQzbz6h9wwdF50XpuDGByC7OQdsZizC+ZmuiI6+ouKOi238/Jam/Lr8Ae/hEmCRClqSuzBA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzcuWKqmxVLn+uV32tT3O5rwq/oCm5EBKsUsPrl0yhn72kAAXmq
	7poM/fXAWeoH7oddZ9dA5cjoNjpBMQqcHnjK4vagZKsdl5jNP9L7LrszyB32XUeL1YO9k9mqTT6
	JSTc1aqXNOZh/bNd6x7Ig6BZ8Clb/HDQ=
X-Gm-Gg: ATEYQzwmB4laYFEGvM28GY43JAlErcH3UmveLTfYwIF5n3BozPQeUFPA0TvVLdoO9Vd
	Ax4sWpJrYUAen11/3fcOPcYvtxXxrqO5szdZKT/JWaDUQYwacJkO2csn7lPfgEn1CMbZ5QX0h93
	tOIquE2L56OSFIOEbNS0Hhf7NiAgj6jFSJxnTahl2rDHXN6ww+PfwT8d+mWE1OozClFkbONyEVL
	hppVug5eItfDui7Q2op5/XSYKLO+UKhiYiCLUE8tBgyk+psKq99DuHeo38G6Y9UD0N4Sx58ThL0
	SXTEitRB73aPRIKP4Vf1NkD8vCRSlB/8muAlnEYcmg==
X-Received: by 2002:a05:622a:253:b0:509:4198:5471 with SMTP id
 d75a77b69052e-50957b78d8fmr177919911cf.3.1773659475142; Mon, 16 Mar 2026
 04:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <0101019cf1bb5bec-59c0036d-cf9f-4133-9a27-4f70a7286fa7-000000@us-west-2.amazonses.com>
 <420d9aeb-72b4-448a-8e41-9e20f1fd3a47@windriver.com>
In-Reply-To: <420d9aeb-72b4-448a-8e41-9e20f1fd3a47@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 16 Mar 2026 12:11:04 +0100
X-Gm-Features: AaiRm52qtD011OTlqkJCNfSBbznAcfXSkWNgj5pRqIGLIRv3vp_3dy_DOrRcHE0
Message-ID: <CANNYZj8eGhjci6Umfvhy1b8_-PDw_q8HrjyY22NOiP8y0H2iFA@mail.gmail.com>
Subject: Re: [OE-core] [AUH] barebox-tools: upgrading to 2026.03.0 SUCCEEDED
To: Hemanth.KumarMD@windriver.com
Cc: richard.purdie@linuxfoundation.org, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 11:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233246

On Mon, 16 Mar 2026 at 12:03, Hemanth Kumar M D via
lists.openembedded.org
<Hemanth.KumarMD=windriver.com@lists.openembedded.org> wrote:
> The recipe currently carries a local patch added for a glibc 2.43 build
> issue (which is anyway dropped in this AUH update).
> Will this upgrade be taken automatically, or should we prepare and send
> the upgrade patch?

You should take the auh patch and follow the instructions above to
re-send it from yourself. AUH patches are not taken automatically, as
they're made by a bot. They're meant as a starting point for anyone
interested in that particular upgrade. Sometimes, resetting the author
to yourself and adding s-o-b, and then saying in commit message that
the removed recipe patch has been merged upstream is all you need to
do (the above update patch seems to be of that kind).

Alex

