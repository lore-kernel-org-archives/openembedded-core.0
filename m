Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA61CD5BD5
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 15:48:42 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14198.1779983317913249861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 08:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sFIxuZ5c;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-902deb2412fso1448021885a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 08:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779983317; cv=none;
        d=google.com; s=arc-20240605;
        b=bNXS5+nCvlZMnvjeeTtbm4I1G/hhy3MMRy6Df5zKtwrNxyFfMkEUf7fud+cdBrYU6M
         gfSmYK8YHy01m6YkIKXBdTVSPhd3aa26orqmeDwH9wy1UezimWNoJF2XsjiHf3qOLOeH
         wEYXNQ8OAurKQnv+lYkdcdRo4fl83XYCX1bYGAPYuBM9tt3p5VhXl8FZ7ubDe8wOulsn
         sU3gbiAGbYPBFUBhO5Tx7KOq0uIRQlJF6eJJzGW2XI5HSgvmxfpBpiDBdS3TdyK81z34
         C2cSzZW7eOfr8iZNL/VDqE7sOTPZ7Mbvh5cSNFoMEi5O88zhxklPpn0DIB2xO7iBnuXo
         sqKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4mdyVL2CUmHtTAuLaSY1aPRHx+4BY7mLG+ixXauJkC0=;
        fh=MtFXnbtSY8cYZkrXRgxdOGzOIF+Ezgbo2KzA7GBSL4o=;
        b=UhORPOu8ldq1txky8G7q1Rcwq6kdRSgTiPo0AIS/iORWXOgOXXlIKRDraD/hlSMe4J
         x31n5GU8mk6GK2J1yLeQy/c/RuYosmYD7Ib7oCJw6LCl7vsARsktSWi7WOLDddg0R8IR
         GGl0xAvEthsmAZmkviYM9UeXEoTUJXISGstjGChLiLdNYEKEeC5PVlsNQSb9mmyANCM5
         G1fBXgEcqJhUjvckkmylCfGbek5LcxVRVh/o49B8oYzQf6BN8rBII73P8tvgrc4cdB26
         3bkZm+GyWAgtf7nDE0jLHPmYzEAZanU3xZqu+MlWBZzSlov7So7yEM4Jj648zyOJXAwQ
         9RnQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779983317; x=1780588117; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4mdyVL2CUmHtTAuLaSY1aPRHx+4BY7mLG+ixXauJkC0=;
        b=sFIxuZ5c3uk92X6zlG+E2g2bLOvZMbVhuhmvU0JYXuruUKcw9jGKRkJ21rFnowDYN3
         3P/UUfKHOlaDR4dpYc0mtb0Rrv6NsqWXqlROVN1fReYfKC95D628j9mwYNGe1FVbeImD
         NamA6S69ctg3HJ+SeISzJ5+XhP8o+Y+IXjmV2jHIHyvAMHO7y8VQb+p2w6ihN6ccWDhW
         UKkiDXrDToz4uymuw2zOyebfoc6gQgX/xXhDtFDOc0KqupDMV+SDbo87C24pcJs3/2nb
         tiYtZs4P+vyHgaFS78d5uFasqxBbV+537rUTHYCMMpuVabnZN/sB9kq2EADwlY3ICu2a
         chWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779983317; x=1780588117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mdyVL2CUmHtTAuLaSY1aPRHx+4BY7mLG+ixXauJkC0=;
        b=pd5INZb8y9ZpOrxmugcmW6OvNfQ96/uaUOPxnsPlT+B4ajqCjRV1yt+1bYcrThX3Sf
         sBl2yAEsa4kVPT1z3gNMVdjPMjUuNT9liB5U2AYCJ/Qw3PblUoK4QHsMLv1PQmQQvCIU
         6iwinLhbdV2rAe4nuQUs36F18R745YYhlI8GzBrcyjGT4mGOhus2Qgr9uwe/+bMahW5b
         hY5frCyoEnPfOc84zMd0XqY5ZkDQgCb3B/Pm5CHGF62YFD6YjCHSuQIvGeWc2ERS6rui
         Zq+XxOZbzbasrq6BskSDz6EcX2qwobGMPqgjR7uk/Q5+lhtrCR6o9G8+J5vLlQRcXNzs
         C4Ww==
X-Gm-Message-State: AOJu0YwT3743T4IOo66bMLSM4wundQaGGGrALBgQajEjWDZbZlYOjB9j
	JEIC8nzfg9PzWhnU3RZ1vUYyMtRcyuiVJu6upeojtw2qwkhQgc8ttv27NcRqpNVnAjphXJyiulK
	qLtqS4d2GTGBoypvQT1vTIjROmWjniGo=
X-Gm-Gg: Acq92OHVwd4aBJDucF8AIkUcHuPOJ8SqpXLtbBh9Va7WHjQ+IS4FRSNj2WbvWXsTr9L
	oCWXHTrQq3bg4Vu0qpnR5WgQOgPXzsAdEJz4AOQ153VdGKVoWpoq5TNhW8c5m9eaibIkPLGbpLA
	nq57mWTFfcBh+jtD1rFwX6cHms0sav9KAVV1Bq4mNv/wIPiREqJ2S7KYHLr5LlCdK6raUhx4n4M
	UKe/M/6NpSS7RH1F8XRfW+TjnQX/3CoJseHPFjzpWN97Ff2Se6c409BzCR8us7iCnneN2oPuQQM
	7fvcXDm14Msp/ioP2T/rKvKMXRuKpGV5606UXJwJJLvMgKx/jFDV
X-Received: by 2002:a05:620a:371f:b0:914:b225:8c54 with SMTP id
 af79cd13be357-914b4a356e1mr4062920685a.54.1779983316839; Thu, 28 May 2026
 08:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260526112501.15985-1-adityags2004@gmail.com>
 <CANNYZj-CRdJjU1z-0m8bqfWtS=X_PVzyg8uKS4mcRXMua+ikVQ@mail.gmail.com>
 <CAHaUZZAZGRx0H4z5sr8ndJVqjdUk4N9kaSRKp=6-DyX73e0VkQ@mail.gmail.com>
 <CANNYZj_T4TDeN0LgrxqO4GZvebhhZx9smKrwN+MFG845z5dMUA@mail.gmail.com>
 <CAHaUZZCEHB_OVEpJgbE8tfsKyRP0JjOFBgjRyg54tLdFZY6Wtg@mail.gmail.com>
 <CANNYZj-BEjNW54zU6tOQ54BmtK8magKQe7oakp=iOggj6BBk-w@mail.gmail.com>
 <CAHaUZZBBwdufvhvggvG=xtoHuOFBZx+ExFGC+s_tK3Q51Qdwgw@mail.gmail.com> <CAHaUZZAG5d3WsGq_u-Kb4HuHc1u8H21gfcmSay4CxR-uxmE4Fg@mail.gmail.com>
In-Reply-To: <CAHaUZZAG5d3WsGq_u-Kb4HuHc1u8H21gfcmSay4CxR-uxmE4Fg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 May 2026 17:48:24 +0200
X-Gm-Features: AVHnY4KDJy965HJBOj-j-3R8VFYYnPBFyKRmeeu0QiKN9udo_cIJWNiCXQF3J7U
Message-ID: <CANNYZj-e18GG-PtrfnyDLrEnqOjzguOK+Qry3g+eypeywhEqKQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] randtest: retry on unstable sigma instead of
 tolerating statistical outliers
To: "Aditya G.S" <adityags2004@gmail.com>
Cc: openembedded-core@lists.openembedded.org, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com, 
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 15:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237714

On Thu, 28 May 2026 at 17:13, Aditya G.S <adityags2004@gmail.com> wrote:
> Given that the root cause has now been addressed upstream, this issue can be resolved in oe-core by backporting the corresponding upstream fix, rather than relying on a workaround such as skipping the test.
>
> Please let me know if you would like me to prepare a backport patch for oe-core based on the upstream changes.

Yes, this is what you should do.

Alex

