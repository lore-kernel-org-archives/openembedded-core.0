Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC34DCD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 11:18:17 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9226.1778152695212124398
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 04:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bQPbuz19;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51306c9f2e1so6652621cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 04:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778152694; cv=none;
        d=google.com; s=arc-20240605;
        b=kFw9baffEU2hO0E6nPBl7ECJbuHR623BIQQSivosfUzWEpCyw/CdWJHZLoAsN/7RF9
         ITeta0vnFRCudkvaIenFVovbnM4tuC37lN5gNu3IxkA4gSglAo7DwxyzXlCs8MpuykWo
         R44OSa66WuKKQozFecCyNpkgeJD96K9sQfmlmkpBu87ZixKAm4LNyc3nNwx5D7Y1HO/w
         zrDM4OjH9pdGyH2scA+cv6MUuZCbrM+MCb+iS0UOGt2R0AnOiX8Eo4osubv7UXw1q9xQ
         jgXIfU8lX20u+6Y5vBTahBxMSBySp1EyCQOa8yp/rODN2Z9lF3QbH+iaNggZmteMtJbm
         OTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RMKsxpnz0SY8UtcKAAvywdbO/29geQX1DiUDgdl7eRM=;
        fh=TCF2c1SeZtygcx56nKzKuEWfasmN5876JFZfVWTFFN8=;
        b=a4Dspdh72/7KRvpPb/pfXqEVqZqupeeEtb39NusVsx6uY434G62mfz54IyPeakudNT
         iKr38noV826TT8kyAAY/nE72fyYuV5skilcdMZbsHPlB3n1bEiLum4zho44X79PYXM3y
         qOCT3gse5uk3GvK4jvsT0ygo8HsCM2JiX51jgmR5VYY42TkMdcdBr6WXgRXEMTOpZeb2
         ra7PatDMi6B43iZkZGSnBhU/xEekMEgpYiJ44blnTdc5mMh8u76TDWM9OrWH/S0Xs0QI
         wtZeTnaglF6PeEf+v80aN1FXvFirqfu/S/19Ck3Ajtzyi59pcsQIbmGAjlb0EvWZIEHR
         T1LQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778152694; x=1778757494; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RMKsxpnz0SY8UtcKAAvywdbO/29geQX1DiUDgdl7eRM=;
        b=bQPbuz19XdZxQ5N/1b+01SdA1BpCz4KoHsWPKQJzi6OXSGh2hTsBiFtVL6Y20Vb4sO
         JBbAKsKX6nC7JakVVmKOXQWobmY3fR9Q3MmQhP8W2KYrN0/8ysSyIIqOyvXV3SLcHkFC
         Zn55Sr/3bLTarZSzSKealh/6qdSt5nejzDDgJNnXwb1hBz5Nkj5qMv0RKFdE+QmUIVNa
         H8lxWv6nin1I/Y3gCOWcQTMlDOxVqPkbCSPIgjHBAekq+3KMV4vEcY4lk/XnQqNU0elH
         ov0J2/eBRbkUqI1SkcuzZeVD7d2WeBzueTMJhkYL3TTGv+u28ZC+L2Zw0c1SbDzFs+Gg
         un6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778152694; x=1778757494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMKsxpnz0SY8UtcKAAvywdbO/29geQX1DiUDgdl7eRM=;
        b=OlRrq7ANMpQXJixmoriLmgMpDmJM3k3TvVEvx7R1VteKaDyzbaJBouknQI6AhDt0aF
         5nITL3Q2DSqE2kDd6kABlx4/LEQabyxgYXUasB+uqgAntCAsG0nVIxa7v+dntk72mlNn
         Jz/mw5jIuYjHEBB5QNWYpsWChBZEvuHdUyEr7mASUle4P7XA/XZMPQd6lRmbt58V/zoh
         P0TJFMhbcdtwEa71pt1Epd6vgxsYS1TgN+lZrXNe9awUblpb7NcmsV2irvNPnPnC3iYv
         aIdIuhIQMtlIyQeHLiXGhq0rBWWx80E2NNWd7s+gjrexR2vfBYqF6saHTjmzox0/oabP
         yxDA==
X-Gm-Message-State: AOJu0YzHs3tWN3Lo1wpIaC0fn9DHM1jWdRKEd0uLvm5VV+fWShi8msTr
	I9GfUVHy0c33V8M+E7wSENvQ+T7bVXChA/idbWUzdewkIoD+Xtd/iDW/s/t1m7p7j51qdeWKbk6
	Ptx5+3LGF7lSQYj1q8f26b9ivWlDw+MY0EQ==
X-Gm-Gg: AeBDieu8b9dc43JnZNWv4Yx3fWpKyTAGT04vQlXJ2AphR7cpXRSbSs48QiO5uqbIdRa
	5lq5fiFw6v8hZsc+CfZnikKnHOoulMlwzwLxDa9l/ubQzmMboNEWYrUmWMqgpoqf8svfvADadYl
	erMml+xBxpCMfnDt+/H5N+Lz0P6iYm6DPBQ9yE4HGRT5+ykoKlYgDLn9LHg82kMSJnDzhh/BZ8+
	DkUM1Ksz+5n5CxOrv8vV2ClWnJ6AC8tm5UY/HKd8I8waKwHLAHzaDC6mPYgyVvj3XcfnTctJxng
	ZCAwo2p6k5fB1etzBnG1dcQi8JN0Q6LcmQ/DRGnmsrGWQy3L3H/X
X-Received: by 2002:a05:622a:a13:b0:50d:8903:ae6e with SMTP id
 d75a77b69052e-51461be03e2mr109305411cf.5.1778152693937; Thu, 07 May 2026
 04:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260507102353.43585-1-frezidok1@gmail.com>
In-Reply-To: <20260507102353.43585-1-frezidok1@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 May 2026 13:18:01 +0200
X-Gm-Features: AVHnY4L5lnzV3IJ5VrtprT_6wzj5dCbrY3bJISCZF1NBRxEUwC_Ue3YPtZB4J-Q
Message-ID: <CANNYZj_49KqbtAbzWvZ=2Y=qQGroFftdjp1wbAzD0bq14aOOnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] shadow-native: Change upstream status of disable_syslog.patch
To: frezidok1@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 11:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236577

On Thu, 7 May 2026 at 12:24, frezidok1 via lists.openembedded.org
<frezidok1=gmail.com@lists.openembedded.org> wrote:
> After they release v4.20 we can remove the patch and rewrite recipe with the configure option.

We don't need to wait for 4.20 to do that. You can replace the patch
below with a backport of what was accepted, and then tweak the recipe
to use the newly added option.

> -Upstream-Status: Inappropriate [Would upstream accept a configure option?]
> +Upstream-Status: Submitted [Merged to upstream's master, waiting for release]

Also this change isn't accurate: the patch that was submitted and
merged is not the same as this one. If this patch is kept, then the
accurate status would be:

Inappropriate [upstream has accepted a better patch at $link]

Alex

