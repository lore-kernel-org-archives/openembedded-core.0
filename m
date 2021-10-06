Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5187C433F5
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 10:13:03 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.9979.1633515182075583532
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 03:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=vnO/Ynse;
 spf=pass (domain: burtonini.com, ip: 209.85.221.42,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f42.google.com with SMTP id t2so7173978wrb.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 03:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tz/noZdT4AsbHUHxZHNM+pkuz1pLpU9elYtlSGgXkHY=;
        b=vnO/YnseGiKufwfGLyTmed2I2sYPvmH4EOJsnM77S4LlOdV6I85KfG16HKDK6rBnvD
         iAcUqha0cTYlRZagsBmGgyRAhNeIKSzjdfF4CRdfNJvaSNj6tWfYkCLPjqieUeJsZyN+
         NV/BZYk2qeSBbzgkyehcGSBklrAI/Nfn7Ww0BCfo2Q6j46OPOCNf1NL81xEjtWV9mGrg
         pMN4i08vuPd3YdFGrISLIpeJNgTu78zWU9fvnWNQh7s7mpIw0rI8sWmu8z9h3YGw7JaT
         nXNLG9T2z0tIMxXUCC9117+sBhoJaKuGRLpyk6XzI9vuXXrefRYmMvWFD7YQS58IeZBI
         g5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tz/noZdT4AsbHUHxZHNM+pkuz1pLpU9elYtlSGgXkHY=;
        b=PBgYu2124TtzUtZU2ZTETgG/Xx6+oBI/pdtLiQe6DWh5/JGbng2y8PLEP+dbHkp9pt
         dgKGsFTnk81JetiH65uXyuDlis0M6EW1bDde46WCmcVyTfwdTHwJhSPHnOCWgH2FOeDy
         iVq6gZUGl96vCVxz6aZiZrOYCJdNMHotaWKdkHYAqIw9V+4WxFnrdKhPArzNDtkoA8Mb
         g1G4Y0woyB1q54JSiz8PNdLVFnW8+X3oryDFrEQKfX7SX2du7Rp1KfGwb1yr78Xg4RBx
         mpHRCmel/bDFzTpUV/d35JIpta314TC6+9vCzcTv/y5i8FR0tzVHv6kB+V3EX5esrFPQ
         XHDw==
X-Gm-Message-State: AOAM532TEHIggBOyPGLq84ZtlqjwFBqIgFuO7o1kPBr7jN/Qk9rlrRIq
	uRZPyRMki3ahk6UY736vRL77hELYM0mPbV2Ee4mdmero/YsUng==
X-Google-Smtp-Source: 
 ABdhPJzqzqVL/RLzyu3JSnh1qVwO5b71jBmKgAlV6y+Ht77jBUAMDT4BctmcGUbNp7RZlX5hCeoz4uTh07TKc4Gc+1E=
X-Received: by 2002:adf:97d4:: with SMTP id
 t20mr21157727wrb.174.1633515180451;
 Wed, 06 Oct 2021 03:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211005130411.2712850-1-ross.burton@arm.com>
 <CADkTA4NFGhRcQCj+sHLENM38eWEkjE4aLT1adj_KWoj=nKmpoA@mail.gmail.com>
 <CAAnfSTtg7NmNi6Hu0+-LK41ya7--BPnwpzACFipePOUFqyX6wA@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTtg7NmNi6Hu0+-LK41ya7--BPnwpzACFipePOUFqyX6wA@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 6 Oct 2021 11:12:49 +0100
Message-ID: 
 <CAAnfSTuMd+8YfuwcmTsU5+W30bPXHJrqcuHRM=Axo+=evv5z_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: add libmpc-native to DEPENDS
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 10:13:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156686

On Wed, 6 Oct 2021 at 11:10, Ross Burton <ross@burtonini.com> wrote:
> This depends on CONFIG_GCC_PLUGINS which I don't believe is enabled in
> any of the default configurations.  meta-arm builds a few kernels with
> defconfig, which does.

Sorry, brain still not warmed up yet.

CONFIG_GCC_PLUGINS needs to be enabled, but the real difference is
that using the normal GCC pulls libmpc into the sysroot via implicit
dependencies.  If you use an external toolchain (like
meta-arm-toolchain) this doesn't happen, and the dependency needs to
be explicit.

Ross

