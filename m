Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2707EC624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 12:39:05 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12902.1788525544609484686
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 05:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f8cx70E9;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90e7c71f86eso6639326d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 05:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788525543; cv=none;
        d=google.com; s=arc-20260327;
        b=rLXJtI7/dpKz4wVIXWwKqlBDn/FGpbAYjjHLJDZyV3RGbLd0MXnvWtv9AzN/U9gg17
         xLLneefjHLaxp+eHnPJW88GWrJn7x2v2QXFBeCRSUUThzjh6Q2PqEYbMCL913t2aadsg
         Us5gNVfurgtLEVpcDvLFxAkv28hJJ/YZnhU/+Vjr0u+QXHxfq3pf3YHW/Dcm14fgzVch
         eLhrqBxPRKu/92+3wbtQLkPClrhFeVyMKOB3qZspd+kzWjcdw2zy7YqI7M066Vl1TgOT
         maFHTtHKWPEiZp/RGU5voTOjFkQs4VMiFOuxA2N463xyv/x430bQwG9W1UCg1vwfWQqR
         QoNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JSeweAP2mq0m+UgrW7sEXWEgxYK+HFmsTfzhhPnjwIQ=;
        fh=RCaApkehVtG2mSa1pwjcTQlzEkY7MxMmvHAaiXPP7bE=;
        b=JP7jrfhwv8yDNaM2OWGQ5K0DaLpdvjB9JG1azxUrSe+7UNsg0iV+qVc4DlikApKj23
         SqTIrqn6P0iD74Sp8+ppD+pSk0snrvpYO165KgioxF5CdtG8vqWDvh/yIsDIWmJzJ+Gl
         FIhSNx4NL2UyDEgp3Qggjw7XsQUD/OYO2bqigK0F6ukpmmS4v92d9ji8Zd735QNqcGd7
         sLTfriCk0eSx/5hF2XFhhRhjp/MH4rxrkPBeOs0JjfxTFzxwZfoLqdEOdpbxIrAU3VPs
         ZRDGyISfRuOwiXLQw7LioM1MXGD4R34ENpFlVk45cc900nY3iEa5JNf9i5+qBHzNcOGn
         B0kg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525543; x=1789130343; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JSeweAP2mq0m+UgrW7sEXWEgxYK+HFmsTfzhhPnjwIQ=;
        b=f8cx70E9IlElSkkRddx2Hp0P1NN94z4aZLdQWDVFRf0kb28F++Ir/l3RqdY3eyaFka
         SI1RVTqmEEPxrsOoMMAfM3YqTFscY8opITy6O25tXP8Dq4P/1GMxRR4823bSFgDwcim+
         p6TuScqD/JSzyqBMn9AqYURVx+OvjbHT8KUi9bHFkf50j15u4RWmUmt9r0F4CMvtreEF
         0sSaYmTOVBynDzlBzZqK8MJoz7fOlt+TLLMMf5dvGWJDxuty5vvnu3HVrhFl5Vbap2u6
         2h/g3orFDPzNqmJncNtOSx5Tk9CFdxbUBtepfwNVEY3hAJrxf8AuBVb6d7yBMm5THA4h
         UH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525543; x=1789130343;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JSeweAP2mq0m+UgrW7sEXWEgxYK+HFmsTfzhhPnjwIQ=;
        b=juX2hcibegaSeSArayJeYGtfGGH1yBIXKc64X+qKzK0c7+cG0xuDqN7ZL/fAttXBOX
         tb+QiWECHrGRn2dopHzBbIYc++re6F92yM75C0zeu87MKD/BEB6Ah0yzpiuwYIBtQpWH
         5sOw9uOHSkIw1uZlp/99tciu8oTYQ72d8UgdFmRqUi9l293eH4uggpBcENRm3pj6dFsH
         YZrO2c+//5fvjra0ZY9iPINoXX4p8BDVkuTh7z6QEP/Xd+H+j9ribXNDJYsw5CnCGf8P
         S7CPFG5I8Vhwvp1ldppcOR1aR1I32noWwjjL8AhosnKcuM/Bw9jspbKzlI2ceQ9fl/ua
         kbNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwp4K3gQTqy3pbvpI6l3rsoQ6v/cd38+pHkIV8Gol92VEu8guVdWVttVa27jn8kEPhp1TC9hpVoteRke7mhsToLJg==@lists.openembedded.org
X-Gm-Message-State: AFuF++k8U5FE9pbruu+VT5bU+r/VJZWcPRegzNOn2SvWPmHXLTuNF5cR
	w+Mzd+h+bF8aGY2RdPzZWs+Uh0GPn4xbA0vicmbDSbB1dze0HmCw7m5Ilm2ux8wYRgSAEKWO5oo
	d0pTKmCW513M2tIdjXVb8u3j39bWoUpw=
X-Gm-Gg: AYBFou1Rxu3StrS9KL3HUVbyFfTxujE0vn0HmEx7/KtWeEOYWl3gOC304oCDgNWburY
	pJB1Qe1u3xOuTEQqfbdT0M/0UMdJdT+doe0ZR6H0jt3OosrRzhQ4b/Q5sx0250VgRpjRYwCXed5
	BzDpJIuddSTCABpk1QyOvDyHojN9kpwD90JeOVcek16jLH1XVheCkhaHX1ZFrkoCGl+8VPlpz78
	F9Aj59aqDc36H1+JfUhmcFYkqtMgi5eXsoyhibwAzHg5GozOGlzhuvRo8vmkPdJ/AmKB0QXnRf1
	2R+QERHE6uKdeIVFt57HTUyUrtjakPP6H8S4w9ZI6tr7oK+m7v7834SusqLN4TSS8m/+nc8Va5A
	kjA8=
X-Received: by 2002:a05:6214:844c:b0:910:3455:53bc with SMTP id
 6a1803df08f44-9103efe264amr47516696d6.34.1788525543457; Fri, 04 Sep 2026
 05:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260823155741.2091982-1-peter.marko@siemens.com> <DL5Z475KF36A.2GWHJC82115IA@smile.fr>
In-Reply-To: <DL5Z475KF36A.2GWHJC82115IA@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 4 Sep 2026 14:38:51 +0200
X-Gm-Features: AcwNN1W6CMWqiVGsn2X4j0GV8tLIFT7XSF0zqw_Sy7eLkLg3t2vJQc5sANwe_nw
Message-ID: <CANNYZj8F6OBVu=cnCnEbAnCGVNBrex9uaTvkqtzwCFg=nKaByg@mail.gmail.com>
Subject: Re: [OE-core] [wrynose][PATCH 1/3] libslirp: fix upstream version check
To: yoann.congal@smile.fr
Cc: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 12:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245097

On Thu, 3 Sept 2026 at 22:45, Yoann Congal via lists.openembedded.org
<yoann.congal=smile.fr@lists.openembedded.org> wrote:
> Thanks for the series. But, with regrets, I don't think it is acceptable
> under the policy:
> * 1&3/3 are not bug fixes (UPSTREAM_CHECK_GITTAGREGEX is not used right
>   now on stables)

Being able to check upstream versions is a valid use case for stable
branches too, even if the functionality is not currently used by Yocto
project itself. Users can check what the latest (or latest stable,
if/when that support is backported) version is, and make their own
decision about updating it downstream.

It's a *very* low risk change as well, as it is used only in the
version check and nowhere in actual builds.

Alex

