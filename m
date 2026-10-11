Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F97CA9ECC
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 20:40:52 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.320.1791751245755585822
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 13:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3Cu31nBk;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so12746745e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 13:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791751244; x=1792356044; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WUdkbPMYmHil0n99qWAuFpn5OQht/47xRlGsjrL52bo=;
        b=3Cu31nBkGeLDK+BwX+16ZEkZXnZ93lCBdaWnNqit3fWqrgGHvHKbxFk3iRR0oaFUA6
         MvtnWlpoQsbqLWxUpDB7L0tUEA+SkhLKULsK1mwJeQOhT/O0K6Vx8YEJhJDGM7hTlLgt
         fEL6yDLT4bgWoK0Y7dAY38try4U1G8axULZA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791751244; x=1792356044;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WUdkbPMYmHil0n99qWAuFpn5OQht/47xRlGsjrL52bo=;
        b=mfvmIX4qu4o7fNlnfDtTBuHxI+VxeoMwopq2dDEISR/IUxDsY3KYezjwpAzPRSEaEB
         bSQKfPEs0H4nRYd1Yn9k6knW7x1/QUAyam5MzwNzAQw0qOQNa+XqKcaZlJKWtJ3NNzDX
         1EN1HPFSiB630WJP32/x2YET15t5TjMI1tsQUSgGpe1gGWYxNJ0VXAPP7KWD5EIoinUE
         flv7Fjs/Fa5RsQl8Sl0j29Hbr9YSUwbTgiQbZUnlPEJn3DbLi1eYeUJMOLk5bOMU3iA2
         PoC1B4hcy5t76ckfyi9e/6i1QpQz5QKBcn+SrG9adkSW71tg2MaGgtRCgzla62bMUTu8
         EGOw==
X-Gm-Message-State: AFq9FYJD4uoym5eJ1aQuB0+BD13tAuBlHFSG6zI08ICGr5u8tOMczgg+
	TIK4JSoIfM7VK6E1rV2pb+qrLccKuhXkMmmq3LdlcHcdY4zShmk6J9kFOxZIeTDF0rc=
X-Gm-Gg: AYBFou1o0g9I+FYOUKhtaCjwLSYzLsA9Yb/PVau/iPRmyH1OwkNji2pof9UGCNlFLfB
	jhgUll0lLw1lPB2/8xdVIsTJ3ZWzxmnHjJzfka7PdOYWGLxW0hudYCjSX439ujPHlO2yqaB87s0
	aiz5QjyQ0b3nwLV+eEpWtBE3sSvav/UkauJxcO4mdVJUgWAWFZy2G3uj/ecpx5pM8p8UAwUDZOn
	94x1+1TSvGitFV7PoKbHzy3nD96b1/daSKLBzyXr+b3U5K0TsrjUXL5x1o+9/hwAiMCW5FEM3wN
	M+IU513hHyjA/xuPnusV76Xp/5qEOGD78Eon7A951to2lkf3y4sqf9hMxy1IWSuhzYy6Ta5k9Ox
	58aqASEbyuUZEotsbI1bpejWYyj8IfBaNDSBMq8UxKrpg2m/s7pCK99N4rBkc9tYc8mOmBvjt7X
	OoxfJt2v3qxmXDxEP3Hapi8aJ4DPsswPB0UFkx4juDp5ChddgzheRo/FZ96NNCEuR4w+Nn3OZLX
	t6UDpAeH/mX3dJ0dItnMw6IN8qtTsQEJhuwmvdoUyVK/ntwYcw9kfG9nsIICQ==
X-Received: by 2002:a05:600c:698d:b0:4a1:97c6:d2b4 with SMTP id 5b1f17b1804b1-4a197c6d614mr66769335e9.15.1791751243627;
        Sun, 11 Oct 2026 13:40:43 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e48db03sm334547385e9.3.2026.10.11.13.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 13:40:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 Oct 2026 22:40:42 +0200
Message-Id: <DM2AT1MD4MQM.3ALT5IJJTVMVI@smile.fr>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "Paul Barker"
 <paul@pbarker.dev>
Subject: Re: [OE-core][wrynose 00/60] Patch review
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1791707817.git.yoann.congal@smile.fr>
 <AS8PR10MB507316F31E025A7F7EEC2533FD902@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB507316F31E025A7F7EEC2533FD902@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 20:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247593

On Sun Oct 11, 2026 at 12:19 PM CEST, Peter Marko wrote:
> Please drop my libpcre2 series for now.

Ok, I dropped it from stable/wrynose-next.

> When trying to create this series for scarthgap and trying to resolve
> conflicts I found that pcre2 now committed to do "at least five years"
> of maintenance for each release.
> https://github.com/PCRE2Project/pcre2/commit/0f85a365a7ab586a39089f4ecdc4=
f9f6857c043e#diff-599c7525a19150cfd62bfa7bafbf578487389804a4ec3964ffa60d322=
db9bbfdR22-R44
>
> Release branches are available that we could use.
> Checking contents of release/10.47 branch, it contains commits which I
> picked, however some are squashed with other ones indicating that my
> backport was not complete.
> For example fix for CVE-2026-89156 now consists of two squashed
> commits where I picked only one.
> https://github.com/PCRE2Project/pcre2/commit/5528f329f597eabbf1cfd5a1f3b4=
fa51a8c02d60
> This requires further study before merging.

Agreed but this upstream maintenance branch looks - on paper -
compatible with our policy. So, this is encouraging.

> This also opens second question, similar to one recently asked for
> rsync very recently.
> May I switch libpcre2 to gif fetcher and update to latest release
> branch hash instead of backporting commits?
> Or should I rather pick (potentially all) commits from there?
> I'd prefer to switch to the git fetcher.

I also like the idea of switching to git fetcher. So, I'll happily
review a series doing the switch then upgrade along the branch.

Thanks!
--=20
Yoann Congal
Smile ECS


