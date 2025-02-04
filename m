Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CFDC02198
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 11:25:37 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.113877.1738668330252326358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 03:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GlfpvzPG;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b6ed0de64aso468340285a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 03:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738668329; x=1739273129; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oi6/XKd30iboEjV9iRP5Kkqn6FIpnhhnmFwM5g1yPCo=;
        b=GlfpvzPGe86KJeUYMr742AKtjfDEerO24jkv49p9JRmOcPQPfXJnTDj38SL9OTTQGQ
         E0UkXo7ULqafs86NsaQQl5uW11pKfWdT2Ep62r7XECrnizWBH8gZ7jOoX9JK7M0adUzO
         jtbbYOOmpF5c5yLIeGYVHIERetKmSyQl9QnN632eA6d+hlRYbIKpi7sDGekzaROT+A0k
         bdw2w7MIJuCqWaT98+1Lk5E6dKZD8YQ3WPf/8ICAihSq2UNKtHSu2EA5NNpcLIzsrRya
         lHRydT0CUI1L5/AY+6G7n8awi3pe7oHhxa4aHnhDQmted9p9iwCB0J/hREPtKK8khVFH
         HzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738668329; x=1739273129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oi6/XKd30iboEjV9iRP5Kkqn6FIpnhhnmFwM5g1yPCo=;
        b=KPIBJsf65xBBV56HyTAQ8DEQPkfbDRA4Lm/r7s8ZN1lN4R/3n7vdyUzn7lBvlru8tN
         dQLkUC1w+4Iadd9c8SLrd804wp/yAhRs2/mJqaT9Dt4Bu3tABccVp/2hQDKnxQcJRSPp
         ma/pNxWMO/WQvkwe5sX3lFFj58F0tiIoE/uz0A13O8yThPg54xqBLIUYjBv4CbNJVtHv
         iL1DPHuaIk8yBFkvl4Z/UMno49RsP5qmUSwlatEnKn459djbhY4ZnQNGljT+es0Si7Rb
         k+TQ4y5PtHvcgxQWrYr/rxb0QapzHnGOO/WYOIRfXba6adJUj5hldJ8dJjq/BJ0oeUWp
         6bKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUObY6z5wD5XyWvd8iPhAgtOZkGJoEK78puMeAZBunSJnpInZqjLH3JfV909yLtAT6w4kNAFn+TcsH6ihYxPJVtAQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx0LhcOn4tJ2Ckh5AN8WJ1Jqi8/pgHJzXLPHsHVmczL2MMAXR+S
	wlod3PKYfHEGlsoBKOObceaKfrmQdFnylaHtOPM+4FXyzz1sznNK6JOTp4nc2w97ZlLZX/Xa5d/
	0I09KvwGw9CkFSzEQFVgC6jqLbvk=
X-Gm-Gg: ASbGnctFzG34u7ASIicYhtulVLq2OvPYN1biT1X6BN3H/UiLI/vYC8xrQz+GMekLktV
	0irrgDScK3Uqo8gf2ClOZd+4fgvnfCu8FYlVsYLA14z7b4LEUCm8J/qwU+FnDrzF/CaJVH0fSX1
	QzOvS/apMpTPjqgc28jr/MSOFqDnj942E=
X-Google-Smtp-Source: AGHT+IEjVbq1tB8aMOPhHYZlnsL/wvvQIPgswRstw8gtjp0rRbCiTOae/Mb10kkRGT78dYdCd0RFCfmUoroAQ1C2B7s=
X-Received: by 2002:a05:620a:288e:b0:7b6:dd11:5e5f with SMTP id
 af79cd13be357-7c02ec320b9mr458889485a.13.1738668329249; Tue, 04 Feb 2025
 03:25:29 -0800 (PST)
MIME-Version: 1.0
References: <DM8PR12MB543086C50EF71EBADF83E63D8BF52@DM8PR12MB5430.namprd12.prod.outlook.com>
 <9c3a268725aa40db3cab0578208017733bd24f57.camel@linuxfoundation.org> <DM8PR12MB54300A067D077BCEED12ADF58BF52@DM8PR12MB5430.namprd12.prod.outlook.com>
In-Reply-To: <DM8PR12MB54300A067D077BCEED12ADF58BF52@DM8PR12MB5430.namprd12.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Feb 2025 12:25:17 +0100
X-Gm-Features: AWEUYZlhYKc2ApzFEY_6BPJ5LjA58DhHM8UjcE4tfnVW20qssogl3wBXt5q2MYM
Message-ID: <CANNYZj8PqRNNMCRh5KaKH9x9xY+c+4H11u6MufYa+KLY7SpnDw@mail.gmail.com>
Subject: Re: [OE-core] Strange behavior in sstate-diff-machines.sh
To: chris.laplante@agilent.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"Openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 11:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210772

On Mon, 3 Feb 2025 at 23:19, Chris Laplante via lists.openembedded.org
<chris.laplante=agilent.com@lists.openembedded.org> wrote:
> Would this be the kind of thing that is best ported to bitbake-diffsigs, maybe as some kind of recursive mode? (Just asking out of curiosity - I don't yet have a strong enough grasp of all the caching/signature stuff)

We do have recursive sstate lookup to help finding out where things
diverged, but it's in 'bitbake -S printdiff' command, not in
bitbake-diffsigs (unfortunately it's not as easy to disover). If you
can experiment with that (from scarthgap onwards), and come up with
enhancements, would be great!

Alex

