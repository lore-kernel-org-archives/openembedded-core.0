Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F53C55165
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 13:10:07 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11367.1785417002483491420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 06:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QIjiE5Qt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so19163295e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 06:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785417001; x=1786021801; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VGcQqQu7vggHlqgV4txBZ3xvdX/abVstXLyrpOhv2O4=;
        b=QIjiE5QtMcHg2PVFQ9ihbcuXTpG0mvh1TsADGY6AzoEIobYWnHR31Lbzvl2dshT7Gy
         mqVkZ23OqgrMtqQ0gy86+A84zdy9TzoOY6gC0aKaooGYIHe+KuZBmPbBiYl+ihmj0hQs
         Hnm2OUR3T2Wqk9y5dwDDmkByLEFdIy/Ho5PNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785417001; x=1786021801;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VGcQqQu7vggHlqgV4txBZ3xvdX/abVstXLyrpOhv2O4=;
        b=rmcX9G3eGuwd+q6z/ZRdRuH/wdWDXdwZ6O41AbHzCNQXAujHI48SjVey5Do9I18ebP
         nN//wRk8sfJYblcnFIbGhtKX8poRiGDJzY6fHDpnECDB0C/q7aNHMkvSH8kbhTWPNJAn
         9B3UDkz+xQRcFhnaMU/ytwxghWWvPIXWACvRpND2VSiXiiotIeku0jHlbq6FFNL3CBXM
         GhcuYIQnKtFMmM70UcQq/sVx0HzWh+N0ltrQEhmNQ47DIa3zfVdDWEOWeGf35eKj91TD
         AOvToR17Os6V9CAwi75ivGqdvSrViPV5HhynZVuaJ3i8T8H0WHWG18hPSqxg/vw3l8Lv
         Lesg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3VnDC3WCD7XMqqHq6k8U3mAeqZn3agJZ144BjG/Y5zYGW2jQRD0/DvOBVFcWPnjx0eZsRbJ8oM5x3L6dW/7YehA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzjltT0++7TPMPqWg492qcGiLLGEZvD9w97phvccxaH1cWPSiBT
	LDmZsCFELM5gJa+NxIlxRE6M3HB/cL6rHkSvDLB+mF7j0OdD9P4h8S+AgKKig/3ZJcU=
X-Gm-Gg: AR+sD10tUg45lO7MVYdE49Q5ERMdk8AXsZPchUwlIKlR1IqKkcEK7k1QFyZp9Ay0S8D
	5G+wc1RCXHqRYN3BegGgy7gzPewnWBnhCzOxETIO5T29JFlXcINJebNpzhjJGepR33V5bb+Kjcm
	5CJgheIojSkvz8SB3Qluk1Edqa+0+JaT+Rev/DscEH4/9oBzTJdB5OvfQ3J7CWMRDRa8bL8Ioe0
	H+QY8Qz0Rzbcnp6voeGSJ/teXqEh4sWzAs5mOVKq4Jydm411manJCRUnCqhADAlwZiHWkOkyFuR
	9pxlJktTk1jaxwDRUBFIMynsMTOZaNNFEz5bbu9nHs/YQr3yTSONCJFeapHysxmBSNjTyPq3N4U
	+wpXJb7n52UlmRw1y+y95xJ3sYXW6F3UKxLH0q1N8g88ZHq9G0DDEOHcB1swGhRlb3TxqVYSBwl
	0+NXzkjVnDUbayWK5p4CGsjGIls7UJTjzDkvbrIB7r9nugokmnzxdNfHG6InVZ9O//Ve0B+aZsG
	PB/sBi+NlwHiznMQwWxT/43ioJNVP1cewl/exMpdwHHdwOkHGQ=
X-Received: by 2002:a05:600c:350e:b0:497:ff73:68d5 with SMTP id 5b1f17b1804b1-49800e1fe0emr37860085e9.0.1785417000420;
        Thu, 30 Jul 2026 06:10:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:75e2:b8ae:3bb9:d96? ([2001:8b0:aba:5f3c:75e2:b8ae:3bb9:d96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010a05a6sm68482685e9.10.2026.07.30.06.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:09:59 -0700 (PDT)
Message-ID: <d446f5a1d61eb3b5e9c832e8bc717bb869ba8ceb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/3] kernel-uboot: move FIT_KERNEL_COMP_ALG
 to image-fitimage.conf
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>, 
	openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com
Date: Thu, 30 Jul 2026 14:09:58 +0100
In-Reply-To: <b0b1e1501a23b315704c5a6ef99a2c826408a56c.camel@ew.tq-group.com>
References: <20260727090601.489155-1-nora.schiffer@ew.tq-group.com>
		 <20260727090601.489155-2-nora.schiffer@ew.tq-group.com>
		 <f0ab7f4d7d6c72feb2b1b8122a4434db98799370.camel@linuxfoundation.org>
	 <b0b1e1501a23b315704c5a6ef99a2c826408a56c.camel@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 13:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242352

On Thu, 2026-07-30 at 13:15 +0200, Nora Schiffer wrote:
> On Thu, 2026-07-30 at 11:43 +0100, Richard Purdie wrote:
>=20
> Okay, new plan: Change uboot_prep_kimage to accept the compression algori=
thm as
> an argument, so we can use different variables when calling it from kerne=
l-
> uimage.bbclass and kernel-fit-extra-artifacts.bbclass. kernel-uimage.bbcl=
ass
> could then use a separate variable UBOOT_MKIMAGE_KERNEL_COMP_ALG instead =
of
> reusing the FIT one.
>=20
> A more radical approach would be to skip the deprecation of using a linux=
.bin
> generated by the kernel recipe as a FIT image's kernel and drop support
> immediately.

Can you see from the commit history who might have been using that? Do
you think there are many people relying upon it? If that functionality
doesn't make much sense and wouldn't or shouldn't be used by people,
I'm fine with actually removing it, as long as we're clear about why it
likely isn't needed or is inefficient (or whatever) and what the
alternative is.

A lot of the time I think we support too many code paths when we should
try and encourage people to do the "best" known things.

Cheers,

Richard

