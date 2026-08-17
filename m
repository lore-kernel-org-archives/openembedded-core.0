Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2B9C5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 11:09:25 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27726.1786964960391096925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 04:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aBXeEvSr;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51a868b6962so32632991cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 04:09:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786964959; cv=none;
        d=google.com; s=arc-20260327;
        b=oBLdqvLIXuqOPGh5SeBIQbkQJWdwEBu/YQDXdrqXK4UOHbwNmoyl5fVlLQAQ4zdstj
         4+JzlM+prMROwGaS99xWgQGp1GQeSsi4DCCRfdfQvBes4uyDc5UMGluKW/gR3YZsuU9D
         f2zZSg6PxytDLN3M7AHo97dCvSGRIhonjl3QcMqIrxFSHgtKHwJlo/EZGQSDLo5/pmJl
         pAb/5lctRtKjgu75YPurmay6SdswjVIy1JXktd5a8P6MmhNo2bVedtGjJcv50jXAZcYk
         3dS8/u2RI/HumWcGyv/sfAyyQ/oy58VE20bZ1ft2I1mQQOa/M6/jJIS6pPNVZJtZWT5q
         NnWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RkKhyskQ7SUlq2/bhAuY9lNeuYYSa9qaOwFAOzzSObk=;
        fh=6Z4xUuTqkcxNv6cvnn0HdSGcZYvnhz2BRm++iEwx924=;
        b=f7dwsuntnE76l1AcrEn5BIR86PPFjOtUlN4MSuO/YNBYn8/s5p19PIBRShlNdirXIo
         Aowo4gQlJ5rwdS+vo4BC/Lz4s0SXeHc/6TUueWHi+8ZzbtAxaalkqZDU/DKxGr3IZt7d
         azz3jIccLifG6tXPLBdUh1yffWzCMTHWIK1uvH6Y7cM/5R/om7HumgfI5Z4nGr9DAU/Y
         shEu7G5awung1Z6hK93HURwiNZ5gSNEjopMY42Eikz6yD/MTixRNm0lau8AAnOfk0UOS
         BoSTph3B3UXhaRoYQop0pFS7TuYc246pN2S/yTKVBpNQYwezi8UT9+VgOl5Z9gp5Yn1r
         RDCQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786964959; x=1787569759; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RkKhyskQ7SUlq2/bhAuY9lNeuYYSa9qaOwFAOzzSObk=;
        b=aBXeEvSrHk472kDAqqyZ3taVy0PvGMe+c5M466pdFoPemAIp3FQS0QhwjJBVxFpYJo
         vctiBc9JJKZGFJGd6aLxcGgABbyse9k9qVM3aX0g5S1LbJZ6va+OJPNyOK/SH+ej0+iL
         u1Yo7v70yPEAv5RMwyOSNJPJs2QasPN96h3+SLT7JDdEHMGTilPzruyVlKfjz29pB1/B
         LwDwCZML0oT7ZtMqY7Ji81NNss6ID51ajWkhil2xxbl9L+0156Q3YtVurmqPpk0AKQpx
         a4SOXugI8E2pwCRL9ZECbYRhF5GmrG/QkZE8WcwApUMYu7R3xuh2x9KmkZuDJ02rcfJj
         69Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786964959; x=1787569759;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RkKhyskQ7SUlq2/bhAuY9lNeuYYSa9qaOwFAOzzSObk=;
        b=L/u3k53edkDxsrfxZKb2BFTxWQOMbD2Wti3xRRRfRqLHfbF+zYip7h2JFwXQyaXfr/
         LQQ+82Ce6KpLKwpyBG3POIBbrquBdnIIyIhPbmLfJTyF3viFF693BSfDQLIGGh69//jX
         fbW5fNFYBIgkR1KhhMVltkhBT4m7ok7wrCVRk+lAbwj2G8G8BEfR5Kc5pBuu3oVyG/EI
         HDH6EM5P26zh+kda+iZWfvdyxkKpXkZQpqfc+xLeAIXhMM5lpgD14VEfBgJfioxU3mud
         BTsZYGKuddPA2lxyTHUseDZMZlJZUDF8Qn35fH5zKmM1B4CmW5z4/i6WXdY6OaJqChME
         vV5Q==
X-Gm-Message-State: AOJu0YzQHfG4xVC+oSqeQo7C/yslSHQgiSWm8EPZvHbSeZpnyfS3oUYr
	wRptSRDzrz5SxM+v7kSMo88ZE8iVpPYBUBSenQbvgGDc4brwEk04ZDra90kzjI4h8sv18IVBYO1
	iZ6EOt+t1fjKNCkosvm2C3Hr4WnkSGeFBVQ==
X-Gm-Gg: AR+sD10ZSs473wqvCcAotnsAqmUoGWObcxETMH8fswITWSnr0Kj2oGwCvkBCiLhdT8e
	q/gXsYWObYywUBMlTyCDY/wBc2Shz5Ew6kUz9zIDWntJEpwE0yPMBGHtH6BPYU2xb5RL1D7LbR0
	remg00Av9GV4ov8z0MSegdHuxMjvCkCKNQAoSvgnjkgQ9ihEEUuKxqQyaWIq+iBBpOSohvXDsga
	Ka/6TBvbvpsbWlNMpyKLCyEiFaMKDEbUO6AemN0YKovdPTyF3MVI8xTSaBoyDPcO7EFW0Vd1L8n
	18nY+InJrbaMsPFcIBN6QT1Kw/MlF5pvgD6eN22AzCHyUDizgEKR71Q/WDWEOLIsRzxck2t4CW4
	hS5HNhSCkZXYBmw==
X-Received: by 2002:a05:622a:410f:b0:51c:103:fb56 with SMTP id
 d75a77b69052e-52d853cc0a0mr267442161cf.15.1786964959154; Mon, 17 Aug 2026
 04:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260816162611.41933-1-jaipaul.cheernam@est.tech> <20260816162611.41933-3-jaipaul.cheernam@est.tech>
In-Reply-To: <20260816162611.41933-3-jaipaul.cheernam@est.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Aug 2026 13:09:07 +0200
X-Gm-Features: AcwNN1WRLzLwSZm4DfWQp4x62IJGmffpXmkwDAkmhdIS6732ijZd7P98m0Q4cAs
Message-ID: <CANNYZj_pOq7-E-5BbF_1UE8FSR6xvmoc7=8kfGxzokyLqcrXSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] boost: upgrade 1.91.0 -> 1.92.0
To: jaipaul.cheernam@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 11:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243612

> +        # Remove boost_predef b2 check tooling - not needed for runtime or
> +        # cross-compilation, and was never installed in previous versions
> +        rm -rf ${D}${datadir}

Removing all of datadir is excessive. There might still be useful
pieces in there, if not now, then in future versions.

Also, why remove something that upstream has started to install? Say
something is 'not needed' or gives 'permission errors' is too vague,
and not a sufficient reason,

If they deem something useful, then we should not go against it; if
it's not useful in the package it currently goes into, then we should
find a better package, or make a separate new package for it.

Alex

