Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1396C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 10:43:36 +0000 (UTC)
Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12184.1789555414118643043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 03:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S5hC8PCM;
 spf=pass (domain: gmail.com, ip: 74.125.230.235, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb7692a57so8500471cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 03:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789555413; cv=none;
        d=google.com; s=arc-20260327;
        b=cHlOgOwHE3zQgZyu9031SjK6fwv4sa2l2rv5Su4HycpcnuKPmluo9QNpK7REBkD+Zl
         bg0gLF8vcQE4ay3nOBdiwHf6Z4V3pKPeiCEcYBUHzd8XW9CHhE48ffLUg+IP3X3HmXIG
         MF0OXuWTKR/1YUnPhr0TqexBzvXxAO621E64mtZR4ibXN82CyKydVGDJzDagMXYer2Ak
         5E9ZyCwROjo6C8ZwY/FeskeYf359pL582/4fc6ZSCcuJdkWxaHnHLlj0TLMobNNYx1PJ
         NnJtPy3HR0RHqrEFRDkSILYhDlJqk1HF4sbl3SqM5QdhlAyza8mgrLXN54BeUOPIlOQV
         eO0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+EmJRDKrJ4F7O8idezRAAS2G9IJy9wT/yHr03zdZHWQ=;
        fh=r3BrCSgBihh8fdgwNBOVnPtoVFulJ6jE9WcSAMjlSWE=;
        b=DU9sudYA8dHy0VrhX5jqhI5HfMaj4DKwZjq+zcJgXL1DA59UgWiWxf/6Jya0psGPgr
         oxhiUlzIQZ8qrvdNxc3UrTSp0Myf3ODpIK+Zp7GaMrzpb0vaX6U9xUp3ul10dbKM6vcL
         x8mewayMOloz336q3AyPFRXKkFEXzF4MsLopJAHJHWNPkjRSTrmKUktC9PU2dcV+/YxJ
         STqPasKNHLaGKh30fg+Xxrt7ZOU9a5tanN5nwFz91s+LqwMpIBpKZx8003ZT5OFBhDo0
         F0tf9tD+cmFQvwDtoMjdr0aueop+WvG5T5wP14CoscZeTK90VX2LRmMRPP+BnjCEMAyy
         tq8g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789555413; x=1790160213; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+EmJRDKrJ4F7O8idezRAAS2G9IJy9wT/yHr03zdZHWQ=;
        b=S5hC8PCM+DXgvlVeoninBPjgIRd9LXobKEN8SuQOakaWPHc167inOr1W6HCDc2DSh5
         +sUwFnr6rfqUrFaLDVvggsX7KKhcJ4G/TC4+IkTIEktPsasiukYp3N7Rht45CITl49n9
         Xw+xtQAx8JAbEjlmkwzQP6wt6t154zLc5kLTZeyYVadx1w1Zixw2jU3gOKXFM9dLfdnk
         foPzOT1eoKV/Gtq80x9q+sg6BgGI/nOWoOHIwp9+nNTjwamv2n+baVszl7WADRblySlm
         /aRwpUcqC15g8LG56ZzSA2W2DcZSw5LqEv6NfpzWtzN5fmgOh7Fd778EnD2Swfx9Jcm/
         cD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789555413; x=1790160213;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+EmJRDKrJ4F7O8idezRAAS2G9IJy9wT/yHr03zdZHWQ=;
        b=TgiBSbiN+1UXV6l59n3w0CD755Ab4fpOAUSzmOnSQVi0LSwVT3gzRTUgimuHwaF+4Y
         k9RKzi9i3qXPa60HX+AXVP5bl5MyE/ONt4SgPL150Gg3z2ams2seJFqqS3aGzxdGegF3
         n3jFuYFKNm5Hb56IQdpoHXswuA7l/2HNeOJ9O2QmcyPdV/+v3ettks/4/5a58CYZhMOh
         K+jxc/6dMf2dLmmDHJxlPGPZhGfyFlMnt3ojECWbgb2Z6KrMgZPtCsGAiOHOy4QKlQxD
         5BcTxNlmi+mbwIRbdgLbeNaZT6dXHZtVnoPCO1/kdk7d0yotv6IOSOiavGAbwW7n6r2Y
         y+xg==
X-Gm-Message-State: AFuF++nCg+ciq+zsZqci4cj140rpsQDsmq2cnE9eFJyreht9i7Rfmlzl
	NbdaZND9x3hnh1/n450elYrOE03Mpp5Q9vApIYR3vrKsi3hP0LtP3Af5C1FdM7QyeT1Mi4HZ4si
	Co0mnu2FDmt9Hl725kQEknwF7Uj3xCds=
X-Gm-Gg: AYBFou0cxJR48Bgg+8IbB+OZji2jrFK5pRx7N/mvAO4qOOLKTYbcfAJyqtBA8698+B/
	SAP47isRuzEH2BlCsViK2eNF+cmCvten6sa2lC1WjonstXTPF2MkTSPDhoPhBC/bzwkEcMrvSjt
	6S74QlyxXoMF2AUmomVfrmuldio3Umy0HZVvmFLkOkC0IPewSz6gpWrLYZ1HyVdLhIW3saT2UCz
	vc2ZFJrOMLJePrNCeVFCVjCPQf2gT+gC0ajZgsJvChLP9fz1rNXyK8W5Ybw/hWlREnqumIn0Xvx
	lYGtrnGr8NkJTkjJ7/pS2pGKl8jQQJVDlXXjyw7tDWmr38nxn1KdNLBx+0Abj6okaoFMy5DjXHq
	VWxQtfdhzRw7Qkw==
X-Received: by 2002:a05:622a:15c7:b0:530:3931:9c2b with SMTP id
 d75a77b69052e-5327ee5dfd8mr33592531cf.22.1789555412970; Wed, 16 Sep 2026
 03:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <93102958cda7288847f11ee797480f16ba36962f.camel@pbarker.dev> <20260916062028.2282187-1-dwagenknecht@emlix.com>
In-Reply-To: <20260916062028.2282187-1-dwagenknecht@emlix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 16 Sep 2026 12:43:20 +0200
X-Gm-Features: AcwNN1XwCGVZgpApoxEPZJR8GjFkahYfRmT-fb7NMJsLR1VqlkrrUACvJopG--8
Message-ID: <CANNYZj9nBkwDg0=O15BruyCwC1sr1gJ=VR-r4xr9xDq4UD049w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] classes: image-buildinfo: allow deploying
 the buildinfo file
To: dwagenknecht@emlix.com
Cc: openembedded-core@lists.openembedded.org, paul@pbarker.dev
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 10:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245950

On Wed, 16 Sept 2026 at 08:20, Daniel Wagenknecht via
lists.openembedded.org <dwagenknecht=emlix.com@lists.openembedded.org>
wrote:
> +# Deploy the file alongside the images.
> +IMAGE_BUILDINFO_DEPLOY ??= "0"

Do we need yet another variable and yet more conditional code paths
that are never tested? Why not just always deploy it?

Alex

