Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C29C43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 13:47:41 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.72411.1656942455287714750
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 06:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bJk7GYv+;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id t19so15258845lfl.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=teR4GtIgffvKFSOnFLBhesFHWedZT+k0skvJ01PUMDQ=;
        b=bJk7GYv+b/kB6I4nokgHOmVaM0CD61k/SsCxLqztXIlbhuEPK+UZaTB5GHgd/KFEaU
         mwE5bjJh69Y68FImm4E+9Vh4xL+GC3X+BuEwwm/1HilfYfmKfMOpBOMBCvPFZpiGBwCK
         MPr/PS00ZGfSxpQEZwDcqMEtqPl8/oPqrIR470PIHUMfQSo3lXtkujm8ytzICwfYgosW
         clWJZD3pbnhlru0arbQ5XewkcYvQvbWE/5EblrtlldzuuxpNga7eda5tbWKsSN3keGFi
         6ysH0/M+7Jwm7i/nEQmk93hc0SER1tUYpRrHlpLf0Byix7DCRvZTrDspFeY+bhE6CcU2
         BIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=teR4GtIgffvKFSOnFLBhesFHWedZT+k0skvJ01PUMDQ=;
        b=CtP+SqiFR6Z34DWQjtgGH7Sj/XNIZ8zBX916i56QDbyTdk6czurbEjXA3rnTm909HO
         WX6kcDeDdmWwisfnjRAGn40upN/Xrrudk6WrVoAwPf0DCnEgkjb/fFi2LEab96kIU/tu
         O1xlP/kVXspiRjCKltAJWbtwBQyxE3/ynbyqWgZgZnSjYh3TLNzSS9edxS1xWMrehemh
         kDUNPvbIGLPWTZXc3itl7O/WIVgkJO5Fn/Mg9oOc1oLOxcNwdCg4KAV5E6xBNJPtg7+d
         xN2GePbligUKS8gzn24pWv7YQnsToQzaWAwWeVpqYovo2dCkBJjHTvbUiscwjMtG7R1C
         Rjog==
X-Gm-Message-State: AJIora+h9rvE3HRL9qbqdx4vY5r1NRGPjEBXGzigBUyX/8X2+ODKnXbN
	C8UJcx6ahaMJgJr/6tNpRpnMss5oYkldarurWnE=
X-Google-Smtp-Source: 
 AGRyM1t0KusA3MsGlj3i0ux7cbzeoGQW8qyN6zUbHUzhd8ig8NvbDZM3mI90MT5N985oo1qv1oXtdBhE5AvB6ZdBJ+8=
X-Received: by 2002:a05:6512:3403:b0:481:60ae:7ebc with SMTP id
 i3-20020a056512340300b0048160ae7ebcmr11636850lfr.358.1656942453362; Mon, 04
 Jul 2022 06:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <16FE039DA287E43E.1980@lists.openembedded.org>
 <4770b1475916c1c4e8b7118dab2ba934af604c03.camel@linuxfoundation.org>
In-Reply-To: 
 <4770b1475916c1c4e8b7118dab2ba934af604c03.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Jul 2022 15:47:21 +0200
Message-ID: 
 <CANNYZj_vu9dY==pXQE6VMB_cYKuq3T0TK-g0U4jv2kKHTzuA+g@mail.gmail.com>
Subject: Re: [OE-core] Build paths/reproduibility issues in master - help
 requested
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 13:47:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167610

On Mon, 4 Jul 2022 at 15:35, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > With oe-core (systemd enabled):
> > stdio: WARNING: go-helloworld-0.1-r0 do_package_qa: QA Issue: File /usr/bin/go-helloworld in package go-helloworld contains reference to TMPDIR [buildpaths]
> > stdio: WARNING: glibc-tests-2.35-r0 do_package_qa: QA Issue: File /usr/lib/glibc-tests/ptest/tests/glibc-ptest/tst-timer4-time64 in package glibc-tests contains reference to TMPDIR
> > stdio: WARNING: systemd-1_251.2-r0 do_package_qa: QA Issue: File /usr/src/debug/systemd/1_251.2-r0/build/src/login/logind-gperf.c in package systemd-src contains reference to TMPDIR
>
> I think I have patches sent out which should address the above issues.

Can you send these patches upstream as well please?

Alex

