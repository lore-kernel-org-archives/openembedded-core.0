Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34725C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 15:53:49 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.1850.1646841228136479840
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 07:53:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=GaRHVi+I;
 spf=pass (domain: burtonini.com, ip: 209.85.128.41,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f41.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so1777599wmf.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 07:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q5vfCzTffx062ewSttGBC2EafeMZeT9uR8Yo3PhLH3I=;
        b=GaRHVi+I4BX8i7zI5EVQEaAGwEU3Re/0xLeFPW7ugtIckYvZcyx0HPYKbhCrgV+qz7
         pW+sSZC+KDYzMBuma849iDArkzUwDLbzah9eZ1OdktY/zmF59yGogMRCAdNZSZKmyB7C
         maESQeObaOAjrD8vOmP0LqVGIPfq7FD2TeTQUf1a3cAKyM25nzhbdzetcGNzCCCemoLd
         nhsk0dFJwsDm2TdvMIc56E4ZSZRpi5r5ROJfoFyzxZS+EgCrw3cIxsxVTTRem+stej0z
         A4/86KuElfe2DDSiOz1PSGQZrSNtQwSc9AyQY94JyxjbHgQEplsTvaqiNX++GhEnOIMO
         6TRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q5vfCzTffx062ewSttGBC2EafeMZeT9uR8Yo3PhLH3I=;
        b=kW157YWXAZwnhOa0fltfzTs3vsg2xsQAN0fEqcMSaoxzI+8zsrXLsAphyqfCGaOZVg
         nfYcBz1ftVQ/j+BkoroAsNMJfrYqPPaXS2QHHItPVGz6qDQFc2lIEYtis7cjVFbqURRN
         rduwq9G55E+nomV6PrFITta3kMBsfUZsWNSq9CSYBmYjvjTlSLqQQOXgdMvOE8fyky6Q
         arOxEhg+ZSQCz2eIwCt8zyuBPOAnn5VvzATRgeztX2TKKdqjxbVmZh8eQl7UFny1ZCIm
         ZPEoysaPMlgs2pN7ciQw+xuN3YS6nB6/jOMxOe5zL2aqm4P6yDHf0mAlEE+opRm2Xc0r
         UOww==
X-Gm-Message-State: AOAM532FUNbDDbsIIHIvqebw77k725PNn0SW58IHd9mc2WbIpCJAbdHZ
	F5BQ/E/L/jvQVqgN4+KvMhfCFRC65ZSghs/qb7b4sA==
X-Google-Smtp-Source: 
 ABdhPJxeyd1Ci9hL/Uhn0CIdcxvimj3ubWCOZ8shabWUIH0eldI3Qn0fmOJJGyMH7cN0pGE1kMHFBz6hKiF8zX4mJmw=
X-Received: by 2002:a7b:c841:0:b0:389:864c:e715 with SMTP id
 c1-20020a7bc841000000b00389864ce715mr28075wml.72.1646841226189; Wed, 09 Mar
 2022 07:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20220309150224.2661618-1-ross.burton@arm.com>
 <AM9PR09MB4642C97B03C03260CDB40D66A80A9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642C97B03C03260CDB40D66A80A9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 9 Mar 2022 15:53:35 +0000
Message-ID: 
 <CAAnfSTspNY6Davnnh1A+E3awnz4q4_=E2OdCZx_VbVZeLMtQLg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pip_install_wheel: install wheel with a glob
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 15:53:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162967

On Wed, 9 Mar 2022 at 15:47, Konrad Weihmann <kweihmann@outlook.com> wrote:
> Can we, for the very unlikely case that do have more than one wheel in
> this dir, bbfatal out here as well - otherwise I'm worried that this
> will never get noticed

I'm undecided on this.  In the unlikely case (impossible, by design)
that a number of wheels are built for a single package, wouldn't we
want to install all of them as we're building the package?

Ross

