Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EEBC61DC7
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 10:09:54 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33164.1787825392694930945
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 03:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HFGDN5O6;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52d590ce5cdso3852631cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 03:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787825391; cv=none;
        d=google.com; s=arc-20260327;
        b=Lu2dNNLJUrQE1hhrnJ7z1laikqshiJMBwa7fGgw7+uC4a8pfML4ozWuFieIBaVKono
         3W14RlKHpIYxZU/lWHLauOWCbq7fW/tmHLslMpO+CaByi693BR3bdjTWJwby7Yj2RHdR
         nLAziO+vqbQtrsvgmOF43kj8T6bOKqrQaYgVYiYSgJm3riOqBWR0zQD05QTsMSpzabyq
         Ud4KcdmVm5PUPNBDZaZzyOImgLBlMJ79/HtLs1oGxjaybcv4UlAlLqNDgebSNUDBB7nM
         AsN1DyzktIxj2SV/BxgBm6h7i50MF1d8k6z6qHMrcQDO4JxWGRwiEVtyQAx8I9zSmTMy
         ffQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zgrfousMYGBXz95ssw0zTJMdjuYJwrmzbA0RIHy1vCg=;
        fh=hrLIMLnLgn9lA4UjcABRY9PW9LZQM2JxdaLMYkWr4sM=;
        b=PnBjOnks95Y+/PXpsaWtCw/eG4O19G7PAHeRD3pZ1L5BgRkPbwj+RSNbR7LxluflEh
         TbnMuP8I/yM/Xc7N5WryO22WKaTvK2r6uIi6ERC2JzYF4JqNMzhEcjRvpxyOFApW/DTy
         F0b2Ov1YJLPDxr7r7pzMeWCCxezKoEsrLnY3zMNHXmLOFOEjtz5OedvA+Elxuz7K7TsE
         QiAlx8warGqSDfV4DR1S6DwiYt1Apn1dqz8uQFdr9a7TCjdfxWZZ1WV2avRPqMhEdNoX
         OmHILSVUBufyt3PtiXBdSvxknGhSIx9uM0NkCVrPSjfeEPsKsMoo/6HhaLL8WfgZeKcW
         xnBA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787825391; x=1788430191; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgrfousMYGBXz95ssw0zTJMdjuYJwrmzbA0RIHy1vCg=;
        b=HFGDN5O67Fo1+OpHhDb+VJZVdFMurcwly58uKAKYw6oaR23zQaAqXqaXIzMf0iJU+2
         6A/ZSs/Wr+DSQXwp+xst7JIY+iHz4cjASJwNqGCSJh6THRHbdT59i6jOm+gJRuQCUGzz
         NtRVbJQVI2xE2jHfmLz3UmzW8FZG5Z8DkjRCBQ9NW4KaCu0YMQSpDMuZ1BrUcmz6w7TV
         ah2g/IGV5+UGKK9TmSmg4Fgxlix0N3TJgGLf+dFsfe5lo9XD4ye4zJ5qSKsorIrCSGwg
         F+TY1YoV/f7/OR44JQtCx67ozbLkPH71Fs666+wQZuSolHMv65HxpmU8krfh3+OhMfoZ
         Iolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787825391; x=1788430191;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zgrfousMYGBXz95ssw0zTJMdjuYJwrmzbA0RIHy1vCg=;
        b=cDJ8Qpq4t888r8IxdvvCJWHWNq8cREVxYftb9fbaA80DCAccA73MiIx3RdPc8bu1RX
         +7dl9t717yrt5LDz4OwCPV2SczyvUufcbJmIKgA0hnpNrD0kOWyLsAk4Vlz93Fey74nZ
         FtIoXTCen99q88JfKk0dN8scoLcfBl9ChJGum38uwdu8Gh91xoQOUad0idS//eSlnm1v
         H6Hr9RHXInqrUs/cjh5SUxCb/2Cskmvc88NtqE3BDmPZ9/PH9xL5p4j67EGsIN+Za684
         tLxE2TExYeftij2pQrWCsewyhbfdh/RYNowP2LUrFwto+1DISIhzpQqNaMwIsI3nL8tc
         skBA==
X-Gm-Message-State: AFuF++lZmogTjVCoKOq4RsD9ArEXSH4G5oekgKGczx/8QfW01RgYXvKH
	dQp/tDPiIOnqBGMqjBJx/1p1nBCQLwfoFJxn7vFoBTyJSm+cKqk0ILmwkb+TQ8yCDu+i1es8H3F
	r9icY9qm4pfEe67bdV1gbbKw1ZCIA7nY=
X-Gm-Gg: AR+sD10CEIXXQUqorYGbGhbpnRLJH1tii9G56FPk0gkPdGjXkp1REinhesXTNwcj47F
	BQ1Y9/y/riO3ApUjNtHR3pP8b4UItgvpcrxAOcI5O6hLr+VZAZN+iWYLPStuyIJoWZYCv5IJQYO
	b/NE52AdoRVCKOm+aiOvIBK8weYKYIgZAs5UrIWojurqwZF/2kyVg6wdwasiFwiLyzNw1VPkYvU
	xdHXo2eJ0RZtpOPyUqgmWEOMJPuKf0Y2EoWnxd7Rxg/CPR7WWHR6eXQkkBYUMsQYUQxsQOqrbeN
	ajij+GvtpPnKWt/imG43syZ9Z5O1BfivaXQAO9j0krD92oNk1jKiOjyvxNs2bu1uE3y5IsVESCG
	ofrE=
X-Received: by 2002:a05:622a:991:b0:527:43a:2f31 with SMTP id
 d75a77b69052e-52e4228f57cmr152139911cf.15.1787825391600; Thu, 27 Aug 2026
 03:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260519090816.17783-1-pratik.farkase@est.tech> <20260826082716.15560-1-pratik.farkase@est.tech>
In-Reply-To: <20260826082716.15560-1-pratik.farkase@est.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Aug 2026 12:09:40 +0200
X-Gm-Features: AcwNN1UY0hwfAUZ6D6LUJPmGMaKjNwwkCNsfPljkKdZ6R2KqO4y044OnE1ArDEc
Message-ID: <CANNYZj9eY2mj9XoMdCmY80o+95btOvxp1g94RYn9VSAFD2tHAQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] zstd: add ptest support
To: pratik.farkase@est.tech
Cc: openembedded-core@lists.openembedded.org, pratik.farkase@ericsson.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 10:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244472

On Wed, 26 Aug 2026 at 10:27, Pratik Farkase via
lists.openembedded.org
<pratik.farkase=est.tech@lists.openembedded.org> wrote:
> +    # Remove tests incompatible with ptest environment:
> +    # levels.sh: --ultra/--max levels require >8GB RAM
> +    rm -f ${D}${PTEST_PATH}/tests/cli-tests/compression/levels.sh
> +    # window-resize.sh: 1GB window size requires >4GB RAM
> +    rm -f ${D}${PTEST_PATH}/tests/cli-tests/compression/window-resize.sh

Earlier versions of the patch adjusted RAM allocation for the image,
and this one removes the tests instead. Why was this changed?
Adjusting RAM is better, and it's standard procedure for ptests.

> +    # compress-file-to-dir-without-write-perm.sh: ptest runs as root,
> +    # which bypasses filesystem permission checks
> +    rm -f ${D}${PTEST_PATH}/tests/cli-tests/file-stat/compress-file-to-dir-without-write-perm.sh

This as well should not be done: rather run ptests as a regular user,
for example look at meta/recipes-extended/cpio/files/run-ptest.

> +    # cltools/: zstdgrep requires GNU grep --label option not available
> +    # in BusyBox grep
> +    rm -rf ${D}${PTEST_PATH}/tests/cli-tests/cltools

This can addressed by adding GNU grep to ptest's package RDEPENDS.

Alex

