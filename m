Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.37669.1593958102552281995
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2020 07:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P9uHmXW4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id a6so37938391wrm.4
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2020 07:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Usmi2exRRs4Ja9eWlwd7H+PZChtIGVaNrY8q/dg6ckE=;
        b=P9uHmXW4BM+e2mUhPXTcLbT+hMGKrhZsTee9rKMMaeAtxZIgZIV6rrl6liqd9rHT4Q
         EA/wx43ouY2k7dfejCopPsA3dxC4VTkKWzK0dk2tV7pudj5W6sFwty/mhQsiOItd7vCD
         1eH2mLovtKWY2uzansHECIoEdj6Ty2wmWCIxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Usmi2exRRs4Ja9eWlwd7H+PZChtIGVaNrY8q/dg6ckE=;
        b=VYePqHLCsMKHEPvinK9GPOqc1ui1c0Wm5ucEJ01umOfIPqwls0MafKo1n26w8C/FXF
         dW6nc8zQeiKXUyI7u4j05ArIZdIH/J0E2jfxJChdsHsgvgzd2xOTWveX1gaK26lTDSlA
         R3jo5VxP7ZOVLbnR8ipE6iB8/pF2rlduKqAqTp4d2TqD6uMYp/Sj3cFoBHJ3MP2g/Jab
         bOeeWB4doixfQLvm2kwoq1HhTgB9tsqmsCZXMsGQQFYW53zQPYndw0SQrBaNKzu1JsPj
         c37FhI1FytjdQFBLfJywnUA2InNsw+QMHT9j1PiRcDqFxRc7s4diXHzdmRxQWay5EM//
         /Bcg==
X-Gm-Message-State: AOAM531I2Vn56e4nth6EE7UOvD7/ujr7wjie8FOZYEU1Qrg1AiFl2mAQ
	DChRtjc9xEwYmyeTrrEoizH8Fw==
X-Google-Smtp-Source: ABdhPJyKu7plRbsi65YHEvbrtnBHeutZOu7EZ9JPz2UQpvEDTp9ExNrsVsdbj2KDvm8FcCWycz/9zQ==
X-Received: by 2002:a05:6000:1143:: with SMTP id d3mr33300137wrx.235.1593958100905;
        Sun, 05 Jul 2020 07:08:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id r8sm20031810wrp.40.2020.07.05.07.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 07:08:20 -0700 (PDT)
Message-ID: <d4a663fb040f6461ff6c75d09f5aa26e888b0c94.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] kernel/yocto: fix search for defconfig from src_uri
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Sun, 05 Jul 2020 15:08:19 +0100
In-Reply-To: <CADkTA4Nkdw+4bUx1L35eabSMCF7OmmZt4S7HAqvsYOdfSc1oug@mail.gmail.com>
References: <20200701145825.3743-1-andrey.z@gmail.com>
	 <161DAA31FCE43A8C.29179@lists.openembedded.org>
	 <CADkTA4Nkdw+4bUx1L35eabSMCF7OmmZt4S7HAqvsYOdfSc1oug@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-03 at 22:51 -0400, Bruce Ashfield wrote:
> On Wed, Jul 1, 2020 at 11:22 AM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> > On Wed, Jul 1, 2020 at 10:58 AM Andrey Zhizhikin <
> > andrey.z@gmail.com> wrote:
> > > Fetcher provides full paths to defconfig and scc files, which awk
> > > comparison operator does not catch during construction of
> > > src_uri_defconfig and sccs_from_src_uri lists. This causes the
> > > src_uri_defconfig variable to come out empty, and fails further
> > > validation if defconfig is only supplied via SRC_URI.
> > > 
> > > Replace comparison operator with awk match function which
> > > searches for
> > > sub-string during filtering, effectively placing defconfig from
> > > SRC_URI
> > > into src_uri_defconfig and scc files in sccs_from_src_uri
> > > respectively.
> > > 
> > > Fixes: 23dcff0d396c (kernel/yocto: ensure that defconfigs are
> > > processed first)
> > 
> > v2 passes my testing as well.  The autobuilder gets the final say,
> > but
> > I can't see this causing any issues.
> > 
> 
> Richard,
> 
> I didn't see this on master-next, and we got a different patch for
> this on the list .. this is the preferred fix for readabilty.
> 
> I just wanted to make sure you weren't waiting for me to send it in
> my
> next pull request. I can absolutely do that if you want.

I was waiting for some indication on your thoughts, I'll queue it :)

Cheers,

Richard

