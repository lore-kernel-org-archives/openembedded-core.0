Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72038C54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 10:09:22 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.21054.1709201360562592540
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 02:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f/02ctJX;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-512f54fc2dbso562755e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 02:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709201359; x=1709806159; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HoQV4YPKQ9VCRuwi+5ibuH2lDTcApAMF1gbkWP5jjOA=;
        b=f/02ctJXNblR+Wqb7k5HYyfWLe4D3mvFveLthOCdotDeNRwG0YSmdaH2WvjXBDJntY
         0e0v0Mv95/2DcUiHri7ik3A32T8BuWKUU+877v/bhXgJbfc6J2BnvWHp0CCDXM1kjcy4
         +O295mjBn0Dc2GcAZTMXCX/iFuT4Fhyoc6Gj3E42NrEC0CAVu/K8Wg/Ry2JTQFqrtsS/
         oPv/rw7GcKucJ21LU1VLzrEKE1WVI2ChQEsFbqqgyWU6ttUXAniQqKfmwUKfrcTdXTWD
         W0JYJXIJuwV/2Zr2RiOl1z40Dq1k0ZJMJVr27zWtCYv+rjqhtwm/CqygD5fqKiNSC/3s
         vv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709201359; x=1709806159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoQV4YPKQ9VCRuwi+5ibuH2lDTcApAMF1gbkWP5jjOA=;
        b=ksDjquateAKHIcHNJY7H5knuPaz2dBJbzpyGSu0m5nGwXyGx6fBx1keM7xKGcFPPb2
         o1K+MC5iP2Xt9GYJkLHGbgaKsawk2d3p4qQ8n6RVMzwJ9rUD/RdonbnGUtEqssitkrgN
         eFJLyHnpn+Ft9xwYMptgLGP5HFtnJglKmGUl1Uf42pN+kM208zuPK54KVwR4Myy+0UB+
         b7RHbY5pS9zXxDEk17LX+jjDhdBxMY5i+ZTTc1kv9osMYHXP8WQaIiPzK2sUu9V3Aw2L
         ERdhoHX8BcLHAToiJaXwhsI26AlOBxWfkcfmQCRv44Pygy0w8FwcZMhuowDfHtBcw8IC
         /8rg==
X-Gm-Message-State: AOJu0Ywjz9CUeI4/xT+nBf395u3mpoh+opVBWjhn9VDXnz/5X7TQ3HGN
	iZT0uT2iHhpEamr0Hzr/oWP1NTbUTAfPZB/hVwW8p1cn2WjQICuR+n+gDacb+ScRtgSxHGf9fis
	NWCPNSzfOq1N9pXdy0cylCAL2bZy1rNMk
X-Google-Smtp-Source: AGHT+IG/nceSRP2VC9VcovMdtyNzuuoX1BU+pzL6V/95UmLM/hR1T5AMrSvwn55PUTnUqnBnzXYI+vyc+h/yo+Vhop4=
X-Received: by 2002:ac2:51b5:0:b0:513:26e7:1b13 with SMTP id
 f21-20020ac251b5000000b0051326e71b13mr695327lfk.14.1709201358492; Thu, 29 Feb
 2024 02:09:18 -0800 (PST)
MIME-Version: 1.0
References: <20240227085722.2025994-1-xiangyu.chen@eng.windriver.com>
 <CANNYZj_uUATQFE54rkXaCiUqPRyaRvRWDJdhH0gGwBd9WHiLjA@mail.gmail.com>
 <4823ed44-2ba4-4d18-86c2-e6dc426e0a46@eng.windriver.com> <CANNYZj-FRp6uO9zVW-82JXBcArSQ6EMB7S444Wff5RNOtv6U1w@mail.gmail.com>
 <baece317-a250-4e8c-adb3-1e3227d0e9a6@eng.windriver.com>
In-Reply-To: <baece317-a250-4e8c-adb3-1e3227d0e9a6@eng.windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 29 Feb 2024 11:09:06 +0100
Message-ID: <CANNYZj-gAZjoAAMUVLhS5NPOz_Lh+NHdCB+pT+ifM2+sPnUGZA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] bash: add locale alias for ja_JP shiftjis in run-ptest
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 10:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196426

On Thu, 29 Feb 2024 at 11:00, Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:

> And also i met a problem, most of cases are comparing test log with
> pre-test log from maintainer as the test result that line
> number/space/path/new line is produced causes diff failed,
>
> but in fact they are not a real test failure, the result still need to
> verify by manual, seems cannot do the automation test, any suggestion on
> that?

All of this seems to indicate that the bash test suite is not meant
for independent execution, and is only intended for bash maintainers.
Perhaps you should clarify this with them first, and then also point
out specific problems you are facing. Basically, engage with bash
upstream, and see if they're interested in helping you to improve
tests to the point where we can re-enable them. If there's no such
interest, we shouldn't have to continuously add fixes and workarounds.

Whether the whole effort is worth your time is a question I leave for
you to answer :)

Alex

