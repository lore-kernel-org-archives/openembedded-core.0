Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DB2C624C6
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 13:28:31 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29489.1788182903524688702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 06:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GnGaV6TP;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso23636915e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 06:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788182902; x=1788787702; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElMT4vcJP5X1J//IzWh0WLVCAqR5bwE7oUu4kaGGkyk=;
        b=GnGaV6TP69Mcw398tGYiuwGc5z4D+me7N82DZqG0jn6UD7CdEu9xQukdIyHvT+EdKw
         F4GxNsDaIAnuU3ETbZfq/s9mfs8sDzvyA1cjekYbPnMCQLKvsizEcPM/CaKg+6wifcdP
         5FFdCKgAqzBtZnOoFOKW0OZoEEscLOa4nB4Q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788182902; x=1788787702;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElMT4vcJP5X1J//IzWh0WLVCAqR5bwE7oUu4kaGGkyk=;
        b=UKtbSPBpdU1e11RJMo2GQdswvPsPTwuKK0aXJRI/G4rdEvSX1Wl6H1s8bEi4/2+PUb
         zDP/Dk2x9B3oi5Vo6/Vnq9DFmqGyYzux0eIxnpwG+LifRjTfToXmlcCSW15A5jcdHYwW
         UG/TNrO5OvXhnAjuDDlWNpnIhW7Ff+cm/dAnQCjTW0A64G2OhM0yU5rS3KfmZNJU7gbM
         /v6rTLKgh6YBE0F8+EQld9NHD1RIrPtskpTQwbB2yb7DRfaJSJe7vnKeYuRpTtkTPo4k
         aqpLAJXEArev2vOlcyckez8yUnJTnVJuoA6M0y0lMAQQMMjjV8HT8IRNTyzOlE4Yux24
         L/lg==
X-Forwarded-Encrypted: i=1; AHgh+RqokCfI4zc3/OZsve5ZTYO28rBTK7Wm3bfnDJgAiXSFmu3wSiu2gpECI8troZy2T5S+Jmc4qZ56PNPgE43aXb3Hgg==@lists.openembedded.org
X-Gm-Message-State: AFuF++nHBT3Gmbvy2c/UVHCdPr9a6YscVj9KfyS1gUUUBzfsiyk937gz
	iqOBEiI+PgDd9lETc5PfC0bLNgS8/cjFvcS1Bo8x2bWKq/Mq1WjAi9IYzNqjx4avLI6WKBGLvAC
	a+V+msiE=
X-Gm-Gg: AR+sD13TJcNfSsBTbmUysdy8f5EZmRm9njTzQX5GAgXAdVA8sPeIwuOcQ/ArBPJFyyp
	1iHAjn++IFJ3VE1lHtzQIB93guizHZhUSZ3oAW+R4Hj9HFTwAtMazqEGQE1QAEbOtETx4s8ZORz
	iDGuJlN8R/2qwIQL71se1sbZ7X7V5eu4aYvOTfEYpE/rhENlJGX5Z3s9aC0kfFO1y//1TuIouK0
	bmerK8IuLMI8KDlnz5sOCIjob05b0rjCKIDu3hmhZx/NJFDSuwWNPbhclsLn2He0EK/G40HI0ae
	j1WXspRfFFEod1vi0lcv79tEg2nu2RedPMsl4NIAUmBPXe8EsmwfROg/Fy1og8JnpzDdFCq+u4D
	4IIze14ip9cX3pvIJ3WBNw0wwrQwfGZWYhB33M/E8NYTfqJ6hc/o8y8tWv6QolxJm6x93ILs8AC
	g3odgMmzD6hNi+7H+zKSfMYOew6zyqFN6JH7r1t1OmUx8QoDch/TsPrZa9Wq3EevTfsAWlJYEam
	tX+bDv2rkGvGlSAXCva1GXgbnGdv81JoaAOyay9YExoWgFj
X-Received: by 2002:a05:600c:c113:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-49cdc435d58mr10661725e9.9.1788182901704;
        Mon, 31 Aug 2026 06:28:21 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm345969355e9.4.2026.08.31.06.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 06:28:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 15:28:20 +0200
Message-Id: <DL35XNZB838H.X4I9ZPILT8R8@smile.fr>
To: <leonid.iziumtsev@est.tech>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] python3: fix CVE-2026-4360
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260729093726.426192-1-leonid.iziumtsev@est.tech>
In-Reply-To: <20260729093726.426192-1-leonid.iziumtsev@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 13:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244765

On Wed Jul 29, 2026 at 11:37 AM CEST, Leonid Iziumtsev via lists.openembedd=
ed.org wrote:
> Backport patch to fix CVE-2026-4360.
>
> Reference:
>   https://nvd.nist.gov/vuln/detail/CVE-2026-4360
>
> Upstream fix:
>   https://github.com/python/cpython/commit/eee3ddf0ca10283cc7fea724aae9cd=
8665f8d15e
>
> Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
> ---
>  .../python/python3/CVE-2026-4360.patch        | 148 ++++++++++++++++++
>  .../python/python3_3.12.13.bb                 |   1 +
>  2 files changed, 149 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4360.pa=
tch

Hello,

I plan to replace this patch by the 3.12.14 upgrade I received in the
meantime:
https://github.com/python/cpython/commit/0367912be336348b30572f8029cec4a282=
782d92
https://patchwork.yoctoproject.org/project/oe-core/patch/20260822172544.192=
7400-1-peter.marko@siemens.com/

Regards,
--=20
Yoann Congal
Smile ECS


