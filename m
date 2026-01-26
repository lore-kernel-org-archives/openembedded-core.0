Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D562DCF65EF
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:28:56 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18383.1769430529955882674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:28:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XEvc9jzQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8947ddce09fso40012386d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 04:28:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769430529; cv=none;
        d=google.com; s=arc-20240605;
        b=J68SqhZfpH/ehoJW05JzZLsW/JudJ/Ue4uKylaOfJz7imFzE9N0sXYNIB3gZEn1f/G
         XJP4sMqNBlB2TjLHPoVnnLenSXlCS1iHZqCZZfB+LZ6D6vP5XN45uxzJXUWJw07AXtlm
         wlLtzjQg1w9l9f1NwfXl5jDBsG9IW39nlyZX4zUnsnWB2M2hJr+goq/GE97670Fq/B6B
         bfzohwSC4T5H9CtSTdSe56HiGia+CMlCS7VJsQSzkanxfE/ZHV30d9dypWwtfrZNJvg7
         LNmBM3rPPnHtBaQ5wkUtm/MHP/jSVWhTMrGfjZqMCvGIA8h2e7BtCA4DD00rymRD1C0C
         N09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aOJ8uv3Icy0VyDkJ8P9pNbXFUSgEATiYT3zAwZrBdME=;
        fh=Ts2miz9THootZNYvcqGpy7vnj6UTS9hCaEvSRnRb+Rs=;
        b=kqoZ1wEutr909ijauGqQCu/GtShytC43MTzDedxvTM/8+qWeFP53J7q3sewg3N1d3V
         e2FkBNddXA9kfZuXvcUuzPpU43oJuvX98dBTj1ChITV2u1stfOflTojoOaOijQQFTWsG
         +qqrgRyMjyio5ESO5G6Y3k1NOpmpLGLLMF4Hh+DodaibJ404pRQ3cj+pg+pWCCfd8O5x
         NhvvDtqAS6wC2MVe4HlPBviwM4Ij8dXOWrLNMG3ROCyzRoJg7FuXI2PI+97Vsiet3aqD
         7GQ0UaQK/7+zANWv+ERWVlfs1Yg8U5RJhRv2v9ZWWaBSuBq/8XajfMJtwRVpqJDErkCE
         z3fA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769430529; x=1770035329; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aOJ8uv3Icy0VyDkJ8P9pNbXFUSgEATiYT3zAwZrBdME=;
        b=XEvc9jzQqSgfH3kktMOK3NGQGJRhpCpu2wFimdl+unT3R+mezPOwRFn7CmcOKZJpju
         o8Q1NR/Movvz4zuXm/LnKoJyFMY+1hR+Z9iGFLLw/jNYH/g9uUq+EaXPTx5vksQZVUE0
         Le6kezgpTRuXgOtaY3wwTNFWlqOy9ap4l5g+boh5sIvyPLb0vFyUj5rZt+ou0ESQjwXL
         KT9N968Ps3kHBMQhiOH8OnHZbXxP0OitAaIjd9IJg9EnQGIquk551B93t2qBlLebbFMS
         uOxyIvhvFeu+oNxhY9ghHe4a67gpZ1YIqUW1ifMRFfWGH9bmCV022sbNLbnJ62NTVBuK
         3XxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769430529; x=1770035329;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOJ8uv3Icy0VyDkJ8P9pNbXFUSgEATiYT3zAwZrBdME=;
        b=fYrlEpHaqLixSXCnMbFI0cNde0pfrsZjjrtEZrXzz2co0XjeBVYZd+/ng8awoOqRYz
         L/Q7EokBIHVcHfDcUFpFkD85QpUTFkFv/289/G8ldc0djPDCC4U0XohVPC8h49IFdHJq
         otdwyDx4a6aUBUDy9y7YNVPSPYboJIjQgj8OvLLEzGHUjIZO2F6tP96SyJK3KxRGlri3
         7wLp8YLctJmBpGv0DyjnFr/aifME1Npi4f2z6egI5uN6s4iXNs6/ZXjbU5QMhprl5Tkr
         a0GOCmZV8TSdOo0sPQl1VkM2MbdURjYi+iRegXyyd7BZ0fW7vbgwhX7VZJAOb8SDFfDq
         lXQA==
X-Forwarded-Encrypted: i=1; AJvYcCXRNoydkS1S0qfEE8wAahFVYROMWUUVmwE7tLJqlKlvO7fO98tFuE0ir4VWWtGA1faIGAiigFEhgt2XBWZTakRkaQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxj6ylkNRTsmhWD/Vei0WrHpv6IQ3PwFkEvz14FNvu63XVcggva
	vWlZSlCwfupr+jMdxt8AiHZoioQRSQAPkrlsb/OIRrSnT1s2lra7rdj6oyJ7S03I0JT/b+tGBKI
	IxHJ2G1lUGa1DBNZaue9oad/gbVBZASU=
X-Gm-Gg: AZuq6aJVvyxskZKQ2sgGXyBK+tlkS7wUI7QUQ4Nlq9ex7u5njMW8KEWSi+iJOM9U/iD
	VWqiRDhCQztEchinegGxNM+x1y7gIwMXuxdGYvsYayfAw5wLTf6ziUuYawUtR1652KYf2SD2mVz
	glRx1I2K0NZ6cLQjKG2mEMdqSXY4yU2+VIcSAyIzZzgwuia/uKrNKgcKtaQqMpxNAuFytEJl4UJ
	bKbnBaxYdcsDE+SNnnkLNuJDUlrzDoorWe5fTzZPLg1NHr4ftx70jovbkyKhlu/DqeozXanbMbf
	Sj2rw3zxVNpEcX2y0NA24HBP/ifHwg==
X-Received: by 2002:ad4:5ba5:0:b0:890:8252:96dc with SMTP id
 6a1803df08f44-894b06dca9amr49366466d6.15.1769430528877; Mon, 26 Jan 2026
 04:28:48 -0800 (PST)
MIME-Version: 1.0
References: <20260126073809.468495-1-adrian.freihofer@siemens.com>
 <20260126073809.468495-2-adrian.freihofer@siemens.com> <eba59226-122f-40c1-a83e-184df0e8ffcf@windriver.com>
In-Reply-To: <eba59226-122f-40c1-a83e-184df0e8ffcf@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Jan 2026 13:28:37 +0100
X-Gm-Features: AZwV_QiRK3icHei5zqJK6ypDRWdEw0yH3Uvc6fVylAPOfJGT5PQRWxLj6eAagrc
Message-ID: <CANNYZj9GrL4UTaMKz2gsmUFimRkFCqjyNmy8SPa8i_o9BqfNjg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/13] useradd_base.bbclass: do not use awk
To: Qi.Chen@windriver.com
Cc: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:28:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229983

On Mon, 26 Jan 2026 at 09:18, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>
> I have concern on this patch.
>
> You're modifying a basic bbclass to fix one case without finding out the
> root cause.
> By doing this, you're putting unnecessary restriction on the use of
> commands in this bbclass. Other commands with similar dependencies could
> potentially encounter the same issue in the future.
> I think if you find out the root cause, you'll come up with a better
> fix. This would not only resolve the current case but also prevent
> similar issues.

I agree, even before the search for the root cause, this does need
steps to reproduce, so others can also look properly into what the
issue is.

Alex

