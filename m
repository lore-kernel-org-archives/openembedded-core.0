Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1048C48BF6
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 16:39:30 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.755.1710607169057225205
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Mar 2024 09:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HqXGVVNG;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d497d0c918so3979101fa.0
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Mar 2024 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710607167; x=1711211967; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1JNNVW6WMDg0fUz+uFyp/icNS2NbVXOpE/ypaORwBCM=;
        b=HqXGVVNG7gSHKUdmEqHoahmiMq3V7fIExZi57dEt5EtZP+gRFLRBUlxhKY0LUrQdtQ
         eNy1Ldlc7yv0ODoco2FWFZ3yIJbleNrcGx2JLKMehBaxebRYoJ+RIW/3Vi65Ke7hfXQJ
         wW6pQvMh/52JXk1LiBtXpUmCK+ZKpZZJAFaxqXypOnmCxBLuTQXF9Exw9CzmhDgjU83W
         ISi+RB1HgN3vC9MdMpz1ld4WOvqcMhNdhGf6jZvEXeloI+/i9CH9j2AcudIB+2leOffC
         bo7x3LsdtvT8j2pFM7Dt8dTAF6HOJQmmGUiogfKJTXldp+s+zRRVgr64AFWp4Ju2Rvxa
         WX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710607167; x=1711211967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1JNNVW6WMDg0fUz+uFyp/icNS2NbVXOpE/ypaORwBCM=;
        b=fyk5JMG2/Fzzm/CCcMm3wcF0rlq1EPCEhUL0I/Zk6Fl+Yef+rsshQlhBv7BqiPBiVL
         bk/acsAuRaUU9G9AnhtYo3NgDQ0clTPkUb+Cd4hfw8ouFx+7+VTYXQsM2iZWJFtLxvG/
         Jt1QDvn575qIk6fqc63ZCcdzYb1xi4Tpt0Gb2DPfNZnPEIkUpY4QCVKG00XkBnyLmtjh
         aDEMjFOcocrKT7Bkyha4iKbCOAYwjYolEq5kPl9rmg7HQPTdNgWvxCTx8bO3jl62fK+e
         t1+LMCBZgr0gtR8zruwNgkbDITr4ED7ht+vYDxjb6RO61xgF8pkme8rFho0kl92ZVPbN
         57RA==
X-Forwarded-Encrypted: i=1; AJvYcCUeUtoBW8YYq2Av+E7KxTRx4lgAtQBFcqogRp1Qotde9H2MBb5pywEGmYFtXpCDSN/rmgK+Ebd7sJ5c3/u3ozXkp4XpwiOG+4nAL5zO+U+c03sWluBnVXLE
X-Gm-Message-State: AOJu0Yw3KJjD70LjLiTlam34kO5+r96oozomB/ekLA3ET9GGhEdLLwYm
	hcoUxsFfpIa2RBlmKCT7CjUi6t0KvBYJjvpfZt6FMfTaI44I+Ei0mgMTu/xCJubWetb11VKSgI3
	th1H/9lyxm/OCYNBYAH83rVpl8fg=
X-Google-Smtp-Source: AGHT+IHFp+LN3XN9j+NDYNN5Gm4YwysGl9LVZMKHROQgSvYSRloqOseBeyCIIYQACr/y8uzeiM44DP1WUbCsVDyH4ak=
X-Received: by 2002:a2e:241a:0:b0:2d4:70e8:3630 with SMTP id
 k26-20020a2e241a000000b002d470e83630mr4164078ljk.48.1710607166931; Sat, 16
 Mar 2024 09:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240307091925.2324637-1-changqing.li@windriver.com>
 <CANNYZj9z1LUBB4sg7Z7tOg26qHsc6VZY2Ewj+vMrep0_cPBVpQ@mail.gmail.com>
 <CO6PR11MB560283393549E1690FCDD6CEED202@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CANNYZj8H+7o5mkHi78ve_rizZ+DO93SGvOeefsTenjEh9fJO=A@mail.gmail.com> <74240c6b-83cd-45fc-8b12-a3c14d5347fd@windriver.com>
In-Reply-To: <74240c6b-83cd-45fc-8b12-a3c14d5347fd@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 16 Mar 2024 17:39:20 +0100
Message-ID: <CANNYZj8BWaeV+_EiYJk6BRG-BNqyNYQ6suVfNWRxs18K+fFEjg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] dnf: remove log_lock.pid before exit
To: Changqing Li <changqing.li@windriver.com>
Cc: Qi.Chen@windriver.com, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Mar 2024 16:39:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197253

On Fri, 15 Mar 2024 at 02:43, Changqing Li <changqing.li@windriver.com> wrote:
> This issue only happened when dnf log rotate is happened. maybe install
> "a lot" packages can trigger reproduce this issue more quickly.

Maybe logrotate threshold can as well be adjusted to happen on small,
easily reproducible installations?

> Thanks for trying to help.  I had try to find the root cause when I opened the upstream issue, but unfortunately, not got the root cause,  I thought
>
> it should be a complicated one. After do more investigating recently, the root cause should be found, and I have send pull request [1] to upsteam dnf ,
>
> will backport the patch if upstream accept the fix.
>
> [1] https://github.com/rpm-software-management/dnf/pull/2065

Thanks, that looks roughly correct to me, let's see what upstream says.

Alex

