Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0EBC43334
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 11:52:00 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.9222.1654343512662700311
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 04:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q1z8TDsz;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id t25so16504103lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 04:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MpAJbxmf66zPOL16jpkWxgCGyPbSJUG6kYoziL3XH5I=;
        b=Q1z8TDszBadIM3lwb1COeMaaH17FS5vJ6TQvg5WKFUaDdHCMgkd+IFjOoINj3ESdwG
         F+aKSCgSkLW+d4kUXeUgWJ8rB6P3L7PgdM1LdSOcmXnHRui0owPf4MVjfaKZHN0v592n
         l4WGjCJKfpuGuJDTxJQaAfSufsNKvOcPeUSEh9MkL+WRdxgsKh6Xyf/DdUwEtDgwYMpc
         NYEQf1NdbSH/71fVawCJZXucTXEQA7rLT1vP5nsdBM4HUJ0FI2+dMoT5g7B1BltI/AVb
         afb5B86ekMLoksKOlsmLXZp8N8fN68yxZRvXIc480fQl+5wh6iQm6QbRd/D8RCEzE/iH
         RTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MpAJbxmf66zPOL16jpkWxgCGyPbSJUG6kYoziL3XH5I=;
        b=OyngtkjaetZEENWdDE/TE2jSQPADNpxiQHVT55EPYlnZwStKkZXW5y0zeziGYs3GFk
         PY2LT34dmOnR28RHafFJulta/TneQWI3psEV5ZK/1fahE25NTEUnvmYUBJ06Y1o2jNmP
         K7b0+rHLiYE+Ik6EePoJtc4jiE3feKFAiFdQCdC2OafGMtFHJ1HFLYWV7ZGdIKFBfLU6
         VGu0a0L8xR0vUZ+5B5/sZt8P8eSKEBmpyqFKooQpj01qoZnSpn681viy9lWG+7pXlgUy
         bgBOxqjEaNwikBrSuAFoTvJZ9fg85c6shI63RX1tozO76reMZjdZ0OdeOb3uK2x7IlbF
         rq9g==
X-Gm-Message-State: AOAM532dRtkZ/tRn8OZC47/LDAVd2TuVzuZZMTL2iniiIjYIxXOhpH3u
	ccp9PZYjzxjCthfPca3mSWSiyrCWnWqUt1w67n4=
X-Google-Smtp-Source: 
 ABdhPJxCFawpE2lnYfxw+ILOusEpTPl6t1AesTO+EoOUaaHvYErelYeMtDKaZD/FxQ32xvA2jpr1oj6Ftr/yUiXcNCE=
X-Received: by 2002:a19:650f:0:b0:478:fe97:f761 with SMTP id
 z15-20020a19650f000000b00478fe97f761mr13714540lfb.673.1654343510541; Sat, 04
 Jun 2022 04:51:50 -0700 (PDT)
MIME-Version: 1.0
References: 
 <8f3b92e25906a33c828d61941d45a26448ace79f.camel@linuxfoundation.org>
In-Reply-To: 
 <8f3b92e25906a33c828d61941d45a26448ace79f.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 4 Jun 2022 13:51:39 +0200
Message-ID: 
 <CANNYZj_+jtBR77R8pFONWjOCG31AhsSCHA98MLBV4tY7qvSpkw@mail.gmail.com>
Subject: Re: [OE-core] perl makefile race - any make experts who can help?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
 swat <swat@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 11:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166565

Here's something I didn't think of before. Has this occurred anywhere
else except Ubuntu 18.04?

Alex

On Sat, 4 Jun 2022 at 13:07, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi,
>
> Occasionally we see perl do_install failures on the autobuilder. It
> looks like some kind of make race. With the last failure I saved off
> the build directory and have spent a lot of time staring at it but I
> don't understand how what the logs say happened actually happened.
>
> The build failure is here:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5315/steps/11/logs/stdio
>
> and you can see it failed in do_install. The first error is;
>
> | Couldn't copy cpan/podlators/blib/script/pod2text to /home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/core2-64-poky-linux/perl/5.34.1-r0/image/usr/bin/pod2text: No such file or directory
> | Couldn't chmod 755 /home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/core2-64-poky-linux/perl/5.34.1-r0/image/usr/bin/pod2text: No such file or directory
>
> then
>
> installman: Can't open cpan/podlators/blib/script/pod2text: No such file or directory
> | ABORTED
>
> Looking at the build directory, cpan/podlators/blib/script/pod2text
> isn't there, cpan/podlators/script/pod2text is. I went digging in the
> compile log which didn't fail but is interesting in what it doesn't say
> nd the ordering. The full log:
>
> https://autobuilder.yocto.io/pub/failed-builds-data/perl-race/log.do_compile.25823
>
> or my edited down version:
>
> https://autobuilder.yocto.io/pub/failed-builds-data/perl-race/compile-cutdown.log
>
> and note it never actually builds cpan/podlators/blib/script/pod2text.
>
> If I go into the failed build dir, it does build it:
>
> https://autobuilder.yocto.io/pub/failed-builds-data/perl-race/manual-compile.log
>
> I tried a few variations of deleting and rebuilding files there just to show behaviour.
>
> The makefiles from the podlators directory:
>
> https://autobuilder.yocto.io/pub/failed-builds-data/perl-race/Makefile
> https://autobuilder.yocto.io/pub/failed-builds-data/perl-race/Makefile.PL
>
>
> What really puzzles me is the "Manifying 2 pod documents" message
> *before* it then generates scripts/pod2text from scripts/pod2text.PL in
> the do_compile log. It appears to run the scripts/pod2text late and
> never runs the $(INST_SCRIPT)/pod2text at all (hence no cp message and
> the missing file).
>
> The Makefile has default targets of pure_all and manifypods, that
> message comes from manifypods but manifypods depends on pure_all.
>
> pure_all is a double colon rule and I'm on less certain ground with how
> those behave.
>
> Are there any make experts out there who can spot the race in this
> makefile?
>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166564): https://lists.openembedded.org/g/openembedded-core/message/166564
> Mute This Topic: https://lists.openembedded.org/mt/91538663/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

