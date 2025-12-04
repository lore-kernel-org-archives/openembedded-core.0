Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9A1D1D893
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 08:04:04 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38349.1764835440957778529
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 00:04:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eaz7b8sW;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8823d5127daso5857246d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 00:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764835440; x=1765440240; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dt+5W1fy3vjLOPd3F2OmcK35Efja2K0x/ginYEh58mI=;
        b=eaz7b8sWhacCIQB1eMsDkgknZaVLU8LfSCa8/AMKTjSDBRgLHBbFNrkaC0ZPGETl6G
         lCEKtABlAxMXHtmLZAt6igEbUaKBzsrBz6JPe8lSmezrQV4OMdGZuQ5sPV+UwqdrVsjH
         tl5UzVU7bmbeEoDzpb+diC/xuUARm1ZmMy1VK9pIEjD34FDCqaFGiwMUR58Mr6mkaEPL
         /7Y0e1pIMPcCoum6vC+46dMWqVQTHqgp+NXaY/O4FMZ+uitEfNUAaDKlvbMzscIVZp3G
         iCaDIDD6B9pTJCX2sOYXqi90Bq74C+r0Ged0Ak42U74WYkPPGKdLuTOIKlqu5eQlEh9j
         f/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764835440; x=1765440240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dt+5W1fy3vjLOPd3F2OmcK35Efja2K0x/ginYEh58mI=;
        b=OHSLfd4Cu9i7M7lqHCT7mG4g8TBWSmmxgTuQZkm47eTfYl2iVSvXC40rVL6RPgNvYJ
         TDO1A1TyXwES7xIwSfTIqtvB8iRvPldF1c9uiaK/CZZYT1ECsn7y97V8H9ktnmrthEYB
         aq9PcQUyv26wq/ZYlnln95tirGZ2ZvZWNBb4gzB2c2d2+Lbo4u3ZQ9cc5W9p2sN0xSfD
         o9KN4T43kCnDmnLZG5XGqkotK/xd/tG9qjH2FzmkBlO6SngBBchPR/92KTf32pI2PYfB
         h6L7LxL7aU1JhS2mBlZ96sXJdE7HOeoQFSxVVXy8j5+Ei2Bkn4aamt2vXbDvekenk08I
         QE0g==
X-Gm-Message-State: AOJu0Yzr9cQ+wHl8ajxS0YonDoNxCcCTXQDnrAkV23KWkmCx/OmTeC4y
	5ljahrhr/MhOArjtjRPCSiF6Whuoys+QsxYO5K60s/Zl4aYMOidYGmK3342hIjMotaA5Hk9Y+rq
	rdWgx5S5ITGyA26WGKTsFv2/qUDg+qAb4dw==
X-Gm-Gg: ASbGncuwDviz1YQxhySkJhlD+3UQGHqo7K4Zdj3pWGh1OGTivYAzRPjabwQTBdSCuap
	nPoIDS/l/87xSLsrljpoD+8aLUVRVfuYDk4bugoOzqBfE1jadR82NYZZuxRHU/4wd3X0H3zvstB
	Ljcxl2FJtDJsO02/tQQA98jpt9jDe/9JNyQqeLdlSnx2R7nxbU3PIvHYbIi7KG+UkEICqQLQX/Y
	zVsr/YoYh4we6BPhpkHYs+H9MIBJJuTfJmMuUZHZ0pTkFKXfQS2p05+tT98CmDfzSRelRIIGQuQ
	dkpSKGh01RMCifqqDZHrq7y7KYj70A==
X-Google-Smtp-Source: AGHT+IEB1EaP/Bb8GzP0ioILSPj23urWtAVz+l37Mv7Zwgu/IRQc1OAY3NXjfJhUIyRXcvpf0Evl2LFawpOSWJWj/Bw=
X-Received: by 2002:a05:6214:3202:b0:87c:a4f:afd3 with SMTP id
 6a1803df08f44-8881949cd08mr70274126d6.16.1764835439908; Thu, 04 Dec 2025
 00:03:59 -0800 (PST)
MIME-Version: 1.0
References: <20251204004929.2617318-1-dmitry.baryshkov@oss.qualcomm.com> <20251204004929.2617318-2-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251204004929.2617318-2-dmitry.baryshkov@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Dec 2025 09:03:49 +0100
X-Gm-Features: AWmQ_bn7nSGZyBO_NuvvCiL6Y3Fr-o91E_FaQdZ37FK20TrNmwbFOEulZ0M8WmY
Message-ID: <CANNYZj_rG8-h5_zqjUNgsWkGeLuNdd2bim4GwWnk0y9cqU75eQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 2/2] mesa: drop freedreno-fdperf PACKAGECONFIG
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 08:04:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227274

These two patches are already in master, so can you rebase this
version on top of it to see if there are any followups needed that
were missed by merging some previous version of the patchset?

Alex

On Thu, 4 Dec 2025 at 01:49, Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
>
> With libconfig being a part of OE-Core, we can now drop separate
> freedreno-fdperf config option and merge the dependency into other
> freedreno tools dependencies.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 3124db09864c..9624ce12cbb9 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -147,11 +147,7 @@ TOOLS .= "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
>  TOOLS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
>
>  # dependencies for tools.
> -TOOLS_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libxml2 ', '', d)}"
> -
> -# the fdperf tool requires libconfig (a part of meta-oe) so it needs special
> -# treatment in addition to the usual 'freedreno tools'.
> -PACKAGECONFIG[freedreno-fdperf] = ",,libconfig"
> +TOOLS_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libconfig libxml2 ', '', d)}"
>
>  PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"
>  PACKAGECONFIG[xmlconfig] = "-Dxmlconfig=enabled, -Dxmlconfig=disabled, expat"
> --
> 2.47.3
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227245): https://lists.openembedded.org/g/openembedded-core/message/227245
> Mute This Topic: https://lists.openembedded.org/mt/116605208/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

