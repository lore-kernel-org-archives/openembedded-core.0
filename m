Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4CCE8307A
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:10:24 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13347.1770113418971047770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:10:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=exDcBsGd;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8c6a0702b86so558252385a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:10:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770113418; cv=none;
        d=google.com; s=arc-20240605;
        b=dyV/8d5ihx+PiuZdPVRgyOHFbbp85hbmEdoZs9NsV+fAF/upfa7FCpqLTm+esl+7ek
         3N3V8EbTXL2ElDHyczk12//evjWDc+sXhP95Fn82L3grUOJAOnrkNCr8AsBeddaVDPzH
         Wg+Q80q8676DXQHmC+wt7WoN62lQsEPiCPHHXhdiOc/Lr8X2rjB0gXxtvAQzkoYZFT1T
         S2uDmcNTNfBsoRP/uMT4P+TUbXEzzMw5Yx7xc61eM3Ihe32/VSaB/MJ/wRYVx6afDdHo
         evwiYrumyOg69Q02kpVKlUH8JVg+w4bhhAIgqvOORyoDc2QBWoQn91ZEYtX+WQu3sviW
         MuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J+k6sPEe2adwy5GrMezqC0YbE3+9a8Fx9xaCEnqKglg=;
        fh=aeVgOLBsjgcqFRYJe0mtY4pVFdRFQeVKPHMiJkd2ckQ=;
        b=MpAtwDLdEdN9rYGPH06WxcKYTfVwAqPqtuEQBVX/bbrBxBK9bEjbDhYt9g+mx29x80
         58+FldM8FE635+UjMuySxeqw5erYZpTLcslF9CVxchmcJhDhtFYW0Lg/CgcZH+6Kx18u
         rmmjVFPFuRI58v6bEV4kqSmaw1IVesq6vnMGcnrzf8Km/cpn8aUzKWznXbL7zNDEABIZ
         kpuR11DfgjH4yosE9NMfYuKAjdAc+KyaHDVNJvXKVYI0rLex2Tp5r+vFcz707nS82Kgh
         mLHdHmSgXwcHvmtTznIckFrWHAe0ME8rR8r7kHlUyAE8452eo6S5tXo6tphFems/+2Lv
         EwXQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770113418; x=1770718218; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J+k6sPEe2adwy5GrMezqC0YbE3+9a8Fx9xaCEnqKglg=;
        b=exDcBsGdLlSPFrYPV67NDFUIfmcBpgyKPg2bblhG07+vUgGjM+yAG+tp4cNHlj8VU/
         WBoXS8GkoLMiGMhGnwU3UgGdZEg8E7b+uxvxRreQx74Td/6womu+KGgvoZChUoRYImZ3
         JtSMf1b887IqZMHfWiX9C5h91zYbTTRCvjtD7/qfuF96coMloK0+oxssNT8jV2qZXKv3
         p6SVhc4DlBuHRwFfqoozmzzZ9jTylCz+0Ds8adbEaCMU1CRP0N3dDtA1Q4yjaJha5jjk
         zCNau9aDJdANOYOs8j+SNWaVsX4aOAsfw4mk+dPa1syuk6NFgPNMxawBZkfxFgdRtPwy
         +lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113418; x=1770718218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+k6sPEe2adwy5GrMezqC0YbE3+9a8Fx9xaCEnqKglg=;
        b=JRJiEHRhXjDC2QHJjH0pUmQMA7781uo7/bXPUyc1nsLqJ2S6vfOc+mQWZ9h7d7oSu6
         m0F09UhXl9ASqgqsp2KOQc5GvHnvj54p4XJVtF0Gpp24iXJl7nDX4SUUeA0bypyUzbT3
         sAvJI2X6JefCOw1q+mKEhRI5C/oyZXSgrp4rTTTOQlASRTvnDwgHu9T3XGSrO10Y7a6l
         /BASAwOOJASguOLeufecJiSzQKbcF7rHUxtUvNTTbofQv9ETl7XdAu8O9hf+rCe8kFom
         ESRT8aQlWyxuKmbVCydwTVG+COxW1XafoaWz4Fnh/7inbGxNnlvukbEbnfqcKVGU2HAM
         et/Q==
X-Gm-Message-State: AOJu0YyHLdbZaTcGW2n3XtsfOwhtNwYeDKlPtuMzmnJM5CLoTzk++Lfc
	bnBQ1JSgAd7nssH3J1QYraiLNBZdvW+wREInTp+fs2FwLOGnZ1nZxVx7impSVSNefk67TAf6QUI
	SHhwCv/HCPzPTkR2hhivU9LoeMgjK14Y=
X-Gm-Gg: AZuq6aJ11QChcz+XeTuvoc0q8toi5xGSLv2M0vNo9mD15ols9OibQfeFxWAqqclaWUv
	bMZa/a07JKmaLas+Iy5jzvc+dHcBxt0uMixLKwoD8zLjLjI4JY/3lvf41tHuLkG4W3t1BEP8rCW
	/bdeMzsMryKAjpWKeA+d3qIOVPg1qWKiAiciA13OkKZ6o3XSdisrjGy441wctYbTVk/0jgF7W+t
	fAQW5g/DNYXFwiuOk8s5K+pQatD3Uf/eM50QcIN+4Zw6Z2ikZfBr1PNjdrZHJ2w1FBql0vq1jle
	7C3JS7KcVP3vl6MSDITgUQBAylSqdg==
X-Received: by 2002:a05:620a:2556:b0:8b2:f102:b904 with SMTP id
 af79cd13be357-8c9eb21594fmr1819691385a.12.1770113417772; Tue, 03 Feb 2026
 02:10:17 -0800 (PST)
MIME-Version: 1.0
References: <20260130030601.388697-1-Qi.Chen@windriver.com>
 <CANNYZj8YOfUnv23oOyX6o=BuyX=LRQqoQaeS4osuRRoW4yiS8w@mail.gmail.com> <CO6PR11MB5602CABDD265D0F875CDCB14ED9BA@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB5602CABDD265D0F875CDCB14ED9BA@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 3 Feb 2026 11:10:05 +0100
X-Gm-Features: AZwV_QheXR54zqDoErT3Ah4PEwm6UQ9mmE5lub7oakXzpuX2L60sAigsd1E1XxY
Message-ID: <CANNYZj_obj+rntV-c1XEs=09-y=kVdqBxoD5M82euQ=5iT3MkA@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2] runqemu: restore support to run without bitbake
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230427

On Tue, 3 Feb 2026 at 03:21, Chen, Qi <Qi.Chen@windriver.com> wrote:
> The steps for the test case should be simple and easy to reproduce.
> Do you have any suggestion how to fix this issue?
> Note that SDK does not have bitbake and OE metadata there.
>
> Or do you want me to first send out a patch to add an OEQA selftest case? Will that be accepted?

I would suggest that you develop that patch first, and send it as a
RFC (because it is expected to fail). I'd then be able to use the
patch to reproduce the failure locally, and come up with suggestions
(or maybe even patches) to address it. That would ensure the use case
is officially supported, and will guard it against future regressions.

Runqemu code is too complex and over-engineered, and to be honest,
needs to be somehow simplified and rewritten, so when we see
opportunities to simplify logic in it, we take it. Your use case fell
victim of that because there were no tests or other indication that
the code is necessary, but it wasn't intentional, and restoring
support for the use case should be fine, but this time it should come
with tests.

Alex

