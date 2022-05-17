Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED28C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 09:13:11 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.4950.1652778787205904357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 02:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Oa49qV23;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id ds11so5243068pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 02:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VJuOBfj2pAwXmipwiL1B8nja4YuqoLBr789g3CZJpVU=;
        b=Oa49qV23rMaSFSQ/epk02dnWXABtMw3ieWBpC034/5+16EXVordGwT1IC+AzyX593f
         B5ghHK4Y+0p0IeC/gHwDO9q3pDMSQKg0x/9omZDscFgAxZ0H/fMB2QTfCswMwexradpR
         d3/srVcKkcjST32PSCUb6Z+dHdEfQHiWoEVZA+kX15OrMdKBzwY6PWGBCcE3CiVcKHpu
         hO9gFXwrmUMKXaASiOdJWiK8CJ1HMkO09G5UFzj4qIVTQ3yzVCrxUEPGd9xD3D5TzePs
         g/fAoURY4a5uvD5jsWyj0aoKbE3ZaqzmQzThhUpS0OtEnSkbRptxQ4dQ4DUiH7+wQtrg
         WqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VJuOBfj2pAwXmipwiL1B8nja4YuqoLBr789g3CZJpVU=;
        b=YG67P8cFD2QJ1lKpaFRvwhMc3ATuZV820n3DMne9AXAl/Q3lWoRJuYpeIJbgqLAuCd
         yaM6I1wdgzn/SxkBvmlG5BI5YF3vOfjYmH1h6yvdOen+rPrxRvZGplHEghQSE4lN0vT9
         li2lZKVcQKSBBBXS4XijHN003VT1ocGnwXKYInzg9K7AWySNQzNNw+1VawMDGOKONFjk
         Sn6ZwML13Q/eTOz/vp5JOnplzsX1mJdGpGqDbc6JR2h32VGMahYTsS/ifrNdmQg0OKdl
         bP6JtBpRNJwxk9M5PUabWpt4qHcUjPIM8jM4ocyFhZNY59j5Znseg5CrAMkBxKSmBZp7
         p4nw==
X-Gm-Message-State: AOAM5337L1Xh4O+Zl6aosTn/L7i4Aq/7vXSDJhuXY4qKKq6wYcuddss/
	DWIM3+Pj0CRk/Zm0f8XV27WZNpACgtNbKyFAFDc=
X-Google-Smtp-Source: 
 ABdhPJxAFOx0wmEMZMGw0ck8RL0hsJlgrmU6GaQ244AfsRfKsofjgB4C9JExRA1ElblDutAa1cT0jYZc4/PnfVWKDGI=
X-Received: by 2002:a17:903:244d:b0:15e:a3a2:5a6f with SMTP id
 l13-20020a170903244d00b0015ea3a25a6fmr21060381pls.72.1652778786519; Tue, 17
 May 2022 02:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220511143613.25002-1-akash.hadke@kpit.com>
In-Reply-To: <20220511143613.25002-1-akash.hadke@kpit.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 17 May 2022 11:12:54 +0200
Message-ID: 
 <CAApg2=Q1STrbYF0PE_R9qZE9xRbM-su-iouWi=6CgEepGn--BA@mail.gmail.com>
Subject: Re: [OE-core] [poky][master][PATCH 1/3] cve_check.py: Add new method
 get_ignored_cves
To: akash.hadke@kpit.com
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 ranjitsinh.rathod@kpit.com,
	Akash Hadke <hadkeakash4@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 09:13:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165722

On Wed, May 11, 2022 at 4:37 PM akash hadke via lists.openembedded.org
<akash.hadke=kpit.com@lists.openembedded.org> wrote:
>
> Add new method get_ignored_cves in cve_check.py
> to get ignored CVEs from recipe by excluding distro-wide
> ignored CVEs from meta/conf/distro/include/cve-extra-exclusions.inc
>
> While calling this method use below code to get argument values
> paths = d.getVar('PATH').split(':')
> cves = d.getVar('CVE_CHECK_IGNORE').split()
>

Hello Akash,
While looking into this patch set I'm wondering what is your use case.
It seems to be to get a list
of ignored and patched CVEs. This is already available from the
cve-check output or from the create-spdx
output after some parsing. With the new JSON format for cve-check it
becomes very easy. If you could
elaborate more on the way you plan to use this data, I'm pretty sure
we can come with a simple
post-processing script to do the same.

BTW Why do assume people always include
meta/conf/distro/include/cve-extra-exclusions.inc ?
We don't do that at Oniro and we use our own judgement on outstanding CVEs.

Regards,
Marta

