Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD335C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 10:51:23 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18509.1782816681713858271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 03:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cg5B5QJK;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c0cea8883so5243881cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 03:51:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782816681; cv=none;
        d=google.com; s=arc-20260327;
        b=axrhvUGBP9Y+SWv4TXz+6WISUn+fHiIDyVLpEyeLiXfLs1ACDWGiTSrv9m6hAiEWOP
         VUhnIELnzkOr55xfYsrPW9HMyD1OOIeGLAN+yG8TDkUAhqtCvugVMO7Isq8aSw8SPKZB
         rtDDV7atSqQeoGbOiKdvN6S8bYtONhq6kjm8XIghsl16ryxMMXPM0aipQFKomrRM60xd
         wE0xM+4YDzQBITWt2qbl9yHWV1Uvkd6i63sNVH6BWF0O/WMrgqZsvr1iWxUpsRORiw7x
         AAD7sNitoVI9TOkwJJljllFWV5iTD4s7ce43iUYDSqMzSyJZClEJdEmr7sZ4Q/pnDRwU
         Mt2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IKaNJsAqb2bEFT7lguIHfqzRC0IGCZn+Z6dVA+c0mts=;
        fh=CdVsbpul9d3p5VgpQtzqpL/V8b2PQ988smBapi/L898=;
        b=TDDD+tGBGufWqJAO3w66CjI+9h/f8nMP3mOKSaiazC2mMvVPtLxh+uD5+weQy29ERq
         wfcBsIWZ38Apw/9TjKYkgaXhybrql9pVs43GAKekGlYv8Cyu6IxMvwfjxFP5/zhmC+nE
         /iccsZhWR68D21SW1yczZuhVyNPupmFK82OsjsaDu4dz4JGUiWDGMOsPi6cj+YNnwf9F
         dRrHRss3iZLgSR0gkgGfyRWyhYNWrpgWVpt9vEn1QtnIHq+uy1Y0XQuRkIcZuNcgx4Hz
         YQbciySDrLZQZ4LeVvoic4O6yCrh78eITu6qyNeJzoWA9/XwAd38T7Y0vRkfXljV/hKH
         5VEw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782816681; x=1783421481; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IKaNJsAqb2bEFT7lguIHfqzRC0IGCZn+Z6dVA+c0mts=;
        b=cg5B5QJKj1nn7lax9FrueYwVGESw/A4KOSQQ/MMxWqzA6VaY7/c26s+qJeQrdR+aiH
         i+da+GPtj1rocCofBlvh4mfOosuIws/qxFxsGwpBEx8aIoSA10AGhjna4PqFbayYfrhF
         RvZXuDvUpzUKI/VShNWiZEbDsYwzIewVLQ7Ru5byh/l7T2ctEE+hBWMZlYbYJ1UxRbbq
         FN8aJGhYMZMt4LZpSSr2sedjchb4lkoj0HQvo/v6FMArRRg7DYolf+n42yYQ6RjBIC+O
         1ZylxdhT6l4NIQToEGAetcbJsxZwut7fIqxSRqnp8cGKZtiijgm+u0LN2ijxMX1SyfzQ
         t9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782816681; x=1783421481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKaNJsAqb2bEFT7lguIHfqzRC0IGCZn+Z6dVA+c0mts=;
        b=kfBEhiFyu7/CxZzGhBREC7M6dztYu7qyK5XgLwr0TQ9QueAv9i5Mn8netonPJEsl0w
         isJPo2bYvpl52DxGXW2Gre2VL0HjxKJWgJdgwpAP4XBUrykHNPsgq/nhQibhtndsh3na
         BKkI73Y4GtbeR0XW1KQK196YidI6xBXSIpWvYIC9NI7EoB9FA2EL+YvRBEc1g8K9TIlu
         xos9tr/d+xl4U83CaZdCkOa9YeabygpggJOmsSSyUw1l693Tn03B9FBb8aZf3x0ELNsz
         U1CGkgYUvKx5170TuQoC2z5L5PmUkpCK/k3iCkp05nbKXROifaUUzKy7AemCrO5Nd4uf
         Bzqg==
X-Forwarded-Encrypted: i=1; AFNElJ9BV4WHkYcJyMf9yrXxRppO7Zrcs4ODTu6vd8B3GN67ykRtZmp6HeKxNEmzUrykq7qu7DJiWqv/79hOtHiY44iong==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxgpQVV8XKIc053W/UdQYa7zQx3zejjiKFGskfPyFUYlNmtx8lX
	YjXSRq9yAMDLPdmlzWO1HYCyDKLa0pzoqbjHgMQse//PZfEjo/4BQo2Ulh08qQmBxWY5isWE8ex
	Fvvi5TPerTxpjs9pNX8wQZnUere/6aeM=
X-Gm-Gg: AfdE7clG4IyYYkFVk90aTl7NHd09/T6lR2DeA7VzRCw4ZWqNvAYuK4aDxHswHRUuT26
	9FfRzoEptH7f1cNcoTmx5T3a9RyVKM3QDSlbxd+DVxA0haYuTNSDK5zTd6Nq0ofK/4sCoKchnRO
	caqHuVb6yXhd6FzuEh+XG43heqPrxPe9Qtxw3LT2OcJPdhjVIFtZVmuhcdy+Nkq0Zd9icT2myju
	xWQ4mby/dczrNb3y09A/QkppEQG2qAd2+vrM9c9JAJCWsoycMR2gcAutwDy+CgDiBgPU91lpw==
X-Received: by 2002:ac8:5702:0:b0:51b:fdc0:ddee with SMTP id
 d75a77b69052e-51c17ecc8f0mr11060111cf.30.1782816680610; Tue, 30 Jun 2026
 03:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260629061229.702229-1-Moritz.Haase@bmw.de> <DJM8I70PCCB1.3GWRSQAJKNDNE@bootlin.com>
 <PAWPR09MB8030781990889EA67DD21074EAF72@PAWPR09MB8030.eurprd09.prod.outlook.com>
In-Reply-To: <PAWPR09MB8030781990889EA67DD21074EAF72@PAWPR09MB8030.eurprd09.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Jun 2026 12:51:09 +0200
X-Gm-Features: AVVi8CeSdzeHq6HP3-n6sPrQcRdECA8yCAfRpobxKSrpNd5xCAm5gf7IJQA98cg
Message-ID: <CANNYZj81bU-dwR1Y7kzQXkHCQ4QwNCiT5diZ2USYzr8PoBzM_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] json-c: upgrade 0.18 -> 0.19
To: Moritz.Haase@bmw.de
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 10:51:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239876

On Tue, 30 Jun 2026 at 12:47, Moritz Haase via lists.openembedded.org
<Moritz.Haase=bmw.de@lists.openembedded.org> wrote:

> From looking at the implementation of the test (which was added in 0.19), I'd
> guess it fails because it calls the 'json_parse' app (see [1]) - and we don't
> build the apps (see 'EXTRA_OECMAKE').
>
> If that is indeed the case, should the test be disabled/skipped? What's the
> preferred way to do this?

It would be better to enable the apps, package them separately, and
make ptest package RDEPEND on them.

Alex

