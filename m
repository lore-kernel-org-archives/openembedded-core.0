Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C71C79FAA
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:56:05 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6605.1788940563915685865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=INP/XAvd;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-52ff0eea420so53522451cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788940563; cv=none;
        d=google.com; s=arc-20260327;
        b=l3KSzl7ZtzGEseqdH+F1bVKsv9O1xGvxYxZJk6yjeL9cyLiQKw/C8D7WQejYZtXKJD
         DIsttldaRgvZqs5QzOdNyw10qhA/pXMhmOITgTZsI6hi5MEjlWdjfTcUjs/GtZ6AL3mi
         gZf9+z+iqePjGaIGyfUqHJ8zIa3TzZBJgUTM0BOY/3yMdNJ91PXxrw0blBEmHhgltkDg
         pkKi2v6AU9tToEoE7rvD6b0whUyD1KQuBoCaG38I1oPyRL34XdeybHdbV6UZ6sVOfzoU
         vkfOpmBK1UhiM/J2B4CF+exok/6UZ6UXD6IJURtj1NJxdFiYS4lYneq4gISurzwlzOex
         ElTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kj3lQvoeqYgEGf/58PYUbBJJbljvlwTX9i1rEr1W/XQ=;
        fh=Wqrx/CS5sdeIgND9qk4/+gMgwOawEnvIqc+docmpmzg=;
        b=ZeyLPWM1+xhG7tVdn3CAf2IcQMtMrCm0kHiaYBRDCGWBaR6QR/CCOkAZlhJDftCIwL
         9tP+uJ2U0330db7M4H3bJYzuMnYm1KyS0Q0e2/2D+VdS//oPuX1SxuVr/+idutN6TkhY
         C0WAEV2YZWPI7Szx3bjeanUQVwh39QVPjbyGpC6Uhgdr3quP1NFIUUlUZTB5lcBqG7C+
         egqcL0Ch40QNaawARWtCPys/Fa1AJWL1J5wKPAb4vGNU/MwrpP41o8bNtdGCuaJB6Sx4
         XgwfIF3XDSl/rdQwojeXq6WW1MXcYbbbBQENbPl6O8epWKcbofO7KmmBine77cm09LWr
         KlqQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940563; x=1789545363; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kj3lQvoeqYgEGf/58PYUbBJJbljvlwTX9i1rEr1W/XQ=;
        b=INP/XAvdSgMeZnavrOnHUXSzm90DMMNPXEWtzkrzyzI/HwPcU49yueY9pMxdFhibAV
         ewvC++2dNE007a1cKcAks3s/MZGqLLj0noV86H5nzO1JGY1l1LcCOhHGP/8MlUJMxfdg
         GX5u95vpU8s/VqGLJ+8+BTiWPJua5Jj75Z0cLsTe/N7FUUEZHxp8ERA8zaqB+4egfJka
         Q/qklI+ieCWEKTD1fxUDC6kmoUywvrShuSrWhq7jEZ4TU6m6DwsDDYMiZKD+Q2IP3DtR
         slT1k2G6lhiqZGD9nxH5dOrF0PbJmb8ETjmen3szFuHXKxrX5jcfgbnNA0RButwOT3u9
         B+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940563; x=1789545363;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kj3lQvoeqYgEGf/58PYUbBJJbljvlwTX9i1rEr1W/XQ=;
        b=qKkKwT7fUjNVc7J4xdK8Fvf798HN8QNXK/VDfX7GTndWdG0QxdA1W+ZcBsZ2xtCpBh
         tzHL5FN94f1LpBpbFMmdYRR1BzquFThP9k/4I4uWSjux8YiKTmbQXUBcf4PJPZwUtVlM
         8zNIVDnzzU8q9W+OK+3rHTIDygDG4kEvkQVspAkJVKxUPcBueaF5o/mTkgSkZKqKd5/w
         x7CUh1puoVpdWY90UA+54T7toErot6eHOjqqaYnELee4K2ojOycZlPqH8G+mUdNMbCz1
         zcW547hWueaiQCkLudWQkR9sx7mxWnjgcsVdKREMCnGktZ73nUi7RNZihdCuDEnAAQEI
         dYbg==
X-Gm-Message-State: AFuF++mhAjNj6wUv6LYfX+XsWNA0F2ZeAVP+b4GLxngUiDpb0COArWvI
	rZWTdArOjJFCwzsGkNcQURDcuHcnPenYdLrJjMBecsOpJcMULuOB38WqCUBcGx8BI5RVYk3kiDw
	lKSnUHWsf+JQhx3REn+d8cAnrsVhYF/s=
X-Gm-Gg: AYBFou0DCI/Y3IfKptZmzpDRbbnQ4XWn8jcSKiJpmOxiXODtYHglqkYTtt/7KkajCEt
	mBAIiv7StvbAdX0FEBYrm3JfDzzpN9ujzXGDaO4BsjPcxxLxoZObJbc0faVPx6n7l05YpLwVXSX
	BB0DkHuXE9l4VV71hvEVe5fO+3v1dw1HhRyBZqYMD5tKyHyh2RYhQlDTkQXSUCByILTyledSS5H
	RXhEEVnR9bN8Hsv5vuk/QH3C+cw/u5KZlzLPdPac+XzoUM/LcceLaYMt/HuDKIxT+0xO4L8ZcPL
	PRjvoUhOSE6r1q7GmRWrPcI6hmELBex4hkJxOe5KhR1MfDes3yw/hjm6qjX3wA7fqza78yrUVf9
	wRPW7PmvuHCak5A==
X-Received: by 2002:a05:622a:507:b0:530:90c8:d04 with SMTP id
 d75a77b69052e-53090c81816mr113714841cf.45.1788940562697; Wed, 09 Sep 2026
 00:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260907-sstate-cache-management-sstate-dir-v1-1-ed1a8ad1be0d@bootlin.com>
In-Reply-To: <20260907-sstate-cache-management-sstate-dir-v1-1-ed1a8ad1be0d@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Sep 2026 09:55:51 +0200
X-Gm-Features: AcwNN1UiEvMLLLp3heT4cl_lo_vm1DvlUVAqV0KErGXMETNJbsUEw4QLFh4yCZM
Message-ID: <CANNYZj9Q4XQSPnGFOiTzVDUXiaZnS3QXLTs8mc-sOrdrhefR6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate-cache-management: check also SSTATE_DIR
 environment variable
To: benjamin.robin@bootlin.com
Cc: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245450

On Mon, 7 Sept 2026 at 17:27, Benjamin Robin via
lists.openembedded.org
<benjamin.robin=bootlin.com@lists.openembedded.org> wrote:
> Support KAS users by recognizing the SSTATE_DIR environment variable for
> configuring the sstate cache directory, as documented in [1]. Yocto
> respects this variable since KAS includes it in
> BB_ENV_PASSTHROUGH_ADDITIONS.
>
> This improves usability for the many users relying on KAS.
>
> [1] https://kas.readthedocs.io/en/latest/userguide/env-vars.html#variables-glossary

It's still a non-standard way to set it. Shouldn't the script rather
obtain the final value used by bitbake by calling bitbake-getvar?

Alex

