Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7C5E77173
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 09:24:31 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.96924.1733736263967814631
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 01:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CK0Xr3Kx;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6d8e8cb8605so17500336d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 01:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733736263; x=1734341063; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pZsdg6E/ToDGEUdloXd+FgZhuBHantDqnzyX+k23j8Q=;
        b=CK0Xr3Kx6sEjGVf1hmA/bCfaBu/qThEHT6MlrWsLqEDf2oTPmUPw4qQ/cQztWcSYYU
         59xR/IxyX3pIJmzjMPc9UYNZuy2z6IP6jFn3gRTarueOAx+j3ShJsQ2OYoCZhBndG/BY
         DG2H8BXIUb09RygAIx+ywKu4WSdtynTtWzO1Kky2WzaeyEmbuAAyRlqqvaT4knCFLxDe
         Gn4ge4fWLtiKOtgvZsbHOzOczE1j4jch4reunraz7pqiu0ziDUE5A1gaSANE9fE1TkXs
         BXahUXhVHKHgRAXHInnbEhsauro8El0Zg/JFlNt4vaE7QToehELRB9Thx+BeygXucDeR
         6rBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733736263; x=1734341063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZsdg6E/ToDGEUdloXd+FgZhuBHantDqnzyX+k23j8Q=;
        b=TEQ+qn+cpKUgeWNaxB10Svrljf1ZNYjHKTkoSHuVCamTIwv9qPNxjzPUoGqZ6fVQJt
         sGQAsat//xcZ3TjDBlOiz6MKMPsknxq6a1M/mF1h4SyGSj8Pt/RCeFk+DjcENGKICSke
         MYTaYOPmOiOqinzRFQi7mW6HsZBkBUXSk/dDyKrqf3OLuFi3CirirOaXRRbgCgWNEeLU
         Wix+vucfgfDiflXxFruyUAQScujKCkSbtE4yWzzehfLyFSRzDtuoksZBg0EEdjXkJFrP
         eRlzxR3fgT5YgP8zudUz38XoSZHGVUuBh68P/y17LwGz+2zEw4No83uizWVpV4A/6Ypi
         SiSg==
X-Gm-Message-State: AOJu0Yz2/rjeeu+wbrfOB9XuMEGsf8acTbGKW22+4+CecQ0I1uCl42SV
	L3S7qmdsHMMMNBd/epcit3ndaKlLw95yoW+ij8aFw6fkopqZNpf1hiL2NqrsqsWpWDEIcy3QACP
	anxw6lQl/rDk4w0x/PzVXjeH/rXFAWg==
X-Gm-Gg: ASbGncsuW+9hcfhrvUu3XBva1Ta58ocpNSipKhzRdaFJmIfpGDBLpAMfb3FDttm8VnI
	CGiOcnl4zh1htCgX85/mDf6jiUQbzrXiT6WPFt2RGhfT7flwRdY7jf+LWsxSXJbOhKg==
X-Google-Smtp-Source: AGHT+IGDVVGR3PcQdYdfY/+5DdX4sKBQ1Qu3n1JnkwnoXzw4D5S3wCjSgIUsubHutkfRTLkXjA6sWiXlUo/onQREk44=
X-Received: by 2002:ad4:596c:0:b0:6d8:b189:5419 with SMTP id
 6a1803df08f44-6d8e70d5df9mr186475386d6.8.1733736262919; Mon, 09 Dec 2024
 01:24:22 -0800 (PST)
MIME-Version: 1.0
References: <20241209084142.939432-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20241209084142.939432-1-jamin_lin@aspeedtech.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Dec 2024 10:24:12 +0100
Message-ID: <CANNYZj_i1OCJMUT6oc9fSo0=eb=P+zS8zj=W-aP=aVhOjoekcA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v1] python3-pyhsslms: Add 2.0.0 recipe
To: jamin_lin@aspeedtech.com
Cc: openembedded-core@lists.openembedded.org, troy_lee@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 09:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208476

Hello,

I'd like to better understand the use case for this recipe. What makes
it important enough to be included in oe-core, and not, for example,
in meta-python under meta-oe? If it is indeed broadly useful, should
it have tests that ensure it works?

Alex

On Mon, 9 Dec 2024 at 09:41, Jamin Lin via lists.openembedded.org
<jamin_lin=aspeedtech.com@lists.openembedded.org> wrote:
>
> This recipe was placed in meta-arm meta layer,
> https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
>
> However, users may want to build this python module but do not want to add
> "meta-arm" layer. To make this recipe more flexible, move this recipe from
> meta-arm to OpenEmbedded-Core/meta layer.
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  .../python/python3-pyhsslms_2.0.0.bb               | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
>
> diff --git a/meta/recipes-devtools/python/python3-pyhsslms_2.0.0.bb b/meta/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
> new file mode 100644
> index 0000000000..b18d1c8e86
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "Pure-Python implementation of HSS/LMS Digital Signatures (RFC 8554)"
> +HOMEPAGE ="https://pypi.org/project/pyhsslms"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=bbc59ef8bf238c2902ca816b87b58571"
> +
> +inherit python_setuptools_build_meta
> +
> +# Maintainer refused to upload source to pypi.org, but said he would in a future release.  In the meantime, do github
> +SRC_URI = "git:///github.com/russhousley/pyhsslms.git;branch=master;protocol=https"
> +SRCREV = "c798728deed6d3f681c9e6bfd7fe8a6705f5638b"
> +
> +S = "${WORKDIR}/git"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208475): https://lists.openembedded.org/g/openembedded-core/message/208475
> Mute This Topic: https://lists.openembedded.org/mt/110002797/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

