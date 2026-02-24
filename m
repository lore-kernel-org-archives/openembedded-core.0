Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4543FF357D5
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 17:12:35 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25438.1771953154165123400
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 09:12:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TrQRq2d8;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-899a615825fso12197496d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 09:12:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771953153; cv=none;
        d=google.com; s=arc-20240605;
        b=J0GJICC4H+EmbU3+psNwR92JaakPZKCY4mGZzooUE7+EKuT0jRHRnPVH0fMA4NpV1y
         RpuGpSdC1FMg+Qr6n7tz5ByKFKw/BuGdkRNWgCM6jnjC2d/JNwzLQgL+OSKH9bJcm8A0
         hqLvErU1k53G18XrN1nMItKsV8+PFbA2pekwT8CJPPszajE1tdI/fgk81cHwN1gmqml6
         Hu6JMXJO8zi7bBaL9YoNsnGS0TZPxS/OUjEkn0bfWOeUU6ZFNgY5s3FOCgO41FSBf+3w
         2/Ve4a2SgCFIlrybh2XpTkjPuGDqmwBC92TC0BlYhxkMmHP5U0M5sf8n0J3NV930c8Og
         r52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ECQHW0TIC3oWYbOK48QNS/6T9KjEudhyWhpYQ50jOic=;
        fh=mzl7DMsd7or2u9nqh+ETogsTLpLr5iP4cOH2zkNYCos=;
        b=hOjzWL85YDAvNOxD4MZ4szJ3CtgRbEs41ESgzw4sKAWrZbL9dpaZH6ey7QwC4Zz3TW
         +G86Vl5ejGfwBwOuHbMjYJtgOUkoTN4MRXTK94IhUGEbj6GNPlTAVGqb084OEv0iXcku
         ShtUjBiMTE4nSjWNXPAlQ5w1HgHWO35JIeNCo3kDVeE7C71mNsBSpLE1C6sYOSQ1fi2G
         0BcDwt9jHJL2Ji9J6VD1mNpT6DR4tSnDGnOA0GzUIXPxr4y+eHslqYKMBdbvclnWsPgJ
         1EZcdgVmwruQ8MP+jVcWCGxQ80GRBLM6JeHmKuHAYPGMqAWk8rmjQ24ZPh0rCBhTRO5/
         BsAA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771953153; x=1772557953; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ECQHW0TIC3oWYbOK48QNS/6T9KjEudhyWhpYQ50jOic=;
        b=TrQRq2d8+XFookACHzEG7zzLkqeBN3Wvtyv/bpAfV7P2OJknhlWUzQLmuQCtjBAAaz
         7JYIz0DtRZDgHkynDNXHbIQYt4MNozh+5+xQjwx+NA6c4DGlRHR3jmLwiyj11QNx8rHg
         DG+jCtkZ0iUHCX8RM8/McbtQOdjSvvKuLPBf1CeJHEHV0FwKi52WjoNeFLk+Mb/byA4n
         dqAjh7OoLtLi3d8ZUPxCCzKAVaP6D1CN67GuBd+QqePmmqAW4tG2hP4mmnJENRSpxUDU
         8oraP2bKBEmZixRDlkWxdcm6OQW5H15gFc5xm/dqnSfswX8PNkvq7bu65P5zFp9dgLRz
         UUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771953153; x=1772557953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECQHW0TIC3oWYbOK48QNS/6T9KjEudhyWhpYQ50jOic=;
        b=glknK0EbC6bvu28UyG7DRtVDyQwCU/U0H0FHaRGKKFM03pnq2a0q/xjv9Y+RQIycdF
         opMbKvMxAbXxuVZNPQt8Ok0RWd6JxTU/lHM1b2RNpc7/UAbuTMZ24wYb9Z7beu9n0UOy
         3fSKYo6eYTqpOEgfxnjxNzI8MpMeWD5kY5zWoh1MUg8DXrgq2fm5xDYW7rm+zhPm8a7B
         xPUL9K8QtouPPftTlefQOfp3YGWt/DEINumCIHd4zJ3xa4K1fRz6bzTAj3FwYRjmud8j
         fwa/jyDxYuDbYfAqxEK32gQqeubPYRv1niutCf4AUui8fFK2LKgnfklzHrKnrPn8Jg8b
         +Wuw==
X-Forwarded-Encrypted: i=1; AJvYcCV+cZPaFXYAJbejfdF7fCyO6YtSeVd6qPnQuVtaK4gBwQZzgxnU0VBsyEewqJ2FV1ZnEmXPvfQtnMzHmWoWcjiWfA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxpN7cDh8+ocTbaw91LI99glb/75VTTugsgpLvAuI2wW5xLJqRe
	2VlegZcf0FEWLU8iqae2lMuzP25fePeJ6InVWM1yA+MjXmlVdH4cohDakHSQ424i1SIAd58wWrr
	EoEXbBmOFGTRgez1b9JcWOv5jNMqbvmI=
X-Gm-Gg: ATEYQzzh1vY7WrDkqdXPuJ2dO+fxVMTDP6BWoZOMgssOPS6+3nS5vtYVkRAOXV09a5R
	1pKbPjFPNpv3kCnRtVxwsielFLsZx6O2pgf6b4x1c1S8wqFZcn1Ca7U98ephQ2DDa2vBaXWXgrh
	fNayJGKHynfLKhbMAWntLbtImoe98NNtUaOGvKMlOJm34kMUHwh27ROFP2DFuJa75IlFXYIFCzn
	l8czIpzpjt1Ao8o8FXxpknRYiOaezcnI3x+66ZUC82+TozW2z02SPyOofZYL/fPayOtp0v6lYva
	Zpdng/55eMS5LxH34fOHtdK2zfkGlopOdaD1q9Q/tw==
X-Received: by 2002:ad4:51c4:0:b0:899:ae9c:fac1 with SMTP id
 6a1803df08f44-899ae9cfd71mr17265956d6.7.1771953152843; Tue, 24 Feb 2026
 09:12:32 -0800 (PST)
MIME-Version: 1.0
References: <0101019c720ee382-b27e2993-68bf-4034-a5b8-1bc9fd0d4663-000000@us-west-2.amazonses.com>
 <6733c658-47d6-488b-8f0a-ea19bf20df47@windriver.com>
In-Reply-To: <6733c658-47d6-488b-8f0a-ea19bf20df47@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 24 Feb 2026 18:12:21 +0100
X-Gm-Features: AaiRm52wn4t9LraRKkW90JU8LorgW-oAr2exSSlYyHomi_cBGnGPU-jJgvDqYtg
Message-ID: <CANNYZj-X9xYo9_0bRJs96UVP33QqKDcWFw9NjbrsY2TMJSkPQA@mail.gmail.com>
Subject: Re: [OE-core] [AUH] python3-rdflib: upgrading to 7.6.0 SUCCEEDED
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Wang Mingyu <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org, 
	"Jia, Hongxu" <Hongxu.Jia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 17:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231894

On Tue, 24 Feb 2026 at 17:41, Randy MacLeod <randy.macleod@windriver.com> wrote:
> If not, Hongxu and maybe others at WR will work on that.
> I'm going to focus on the failed AUH upgrade set of recipes.

Thanks, that would be much appreciated. Most of the failures aren't
difficult to resolve (rebase conflicts, or newly appearing musl
fails), they just stack up to significant amount of work altogether.

Alex

