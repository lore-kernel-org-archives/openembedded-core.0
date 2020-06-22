Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.4392.1592859613228713724
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 14:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZUSHgfBv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id a6so16195928wrm.4
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 14:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HmGZhpxX0yYy6CbFIzJdOuZ7hp3+Yh37F9ZnpzUuLEA=;
        b=ZUSHgfBvt96ox5+8GO7HcKncsgfA1bLD6wRXLHmvEoiLyIWMp0EFIaBiE10fExS0Ut
         bScXDbyHA3cKtH5DlqrwjjgTjgF0ZsF5jsnBaSD0/DosHxg3/GCHrw72Ft1NljfX+jcw
         etQ0pIiQGlr5h1IS+D/hCCJYi/yOyPOGMy+sI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HmGZhpxX0yYy6CbFIzJdOuZ7hp3+Yh37F9ZnpzUuLEA=;
        b=q4HycgZfCwAFeqIrTxG7r2Pm+Gub0HqaRN7guMqZNzUJkjmw0INc/EBHRDn1SAFraU
         cnVwfpitaOX8XnlPclGaQEBgpbrpEwvKhiyvJ5NFNkjkPq+jy1oQYsTpe7llMCNPtqRf
         QCG5A/frIDdYJQSOpito4DS2To6Tdsywgs7starnQEypff7AeS1EfjcTQonpygGV5uHZ
         bZqc44JNx/2BdhHPDxgdFfsgQjwW3c0kIkglMDG1eJeeQeVSkIdkfvWuJ8GWqreZkjH9
         h0F8jyIR0e59U59MjuW8q/W9zGZDYshWHd3bKXzTE84v5YhroGmuBHQ8kctLlzkf7ogn
         29yA==
X-Gm-Message-State: AOAM532XCjF3XR6KUFI58qnFAWRqL1xeXYE+vz07z1dM/r76QBcokLeR
	yJAawWzh3Kub1t8yRftYFzpN7g==
X-Google-Smtp-Source: ABdhPJzpUIoPVMF8ziDsIzb56v1jd3pZWCnFkUZu7EW1TNc0BfBVl7XUiw2uqfD8XtUkB3msTfr7EQ==
X-Received: by 2002:adf:ce8d:: with SMTP id r13mr18965154wrn.392.1592859611654;
        Mon, 22 Jun 2020 14:00:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id b10sm838987wmj.30.2020.06.22.14.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 14:00:10 -0700 (PDT)
Message-ID: <c954295945368b13368ea14ff92a025a21d207a2.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH V2] qemu: uprev v4.2.0 -> v5.0.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sakib Sajal <sakib.sajal@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: Joe Slater <joe.slater@windriver.com>
Date: Mon, 22 Jun 2020 22:00:09 +0100
In-Reply-To: <161AEE4AD64EFA55.6387@lists.openembedded.org>
References: <20200619181259.39059-1-sakib.sajal@windriver.com>
	 <161AEE4AD64EFA55.6387@lists.openembedded.org>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-06-22 at 18:36 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2020-06-19 at 14:12 -0400, Sakib Sajal wrote:
> > Major update after v4.2.
> > 
> > Changes:
> >   - os_find_datadir() was changed after the v4.2 release
> >     causing v5.0 to not find the bios and not boot the
> >     image. Fix is sent to upstream qemu.
> >     See: qemu/find_datadir.patch
> >   - v5.0 binary had host contamination for dynamically linked
> >     libraries, "--extra-ldflags='${LDFLAGS}'" in EXTRA_OECONF
> >     resolved the issue
> >   - bluetooth code was removed: qemu.git$ git show 1d4ffe8dc7
> >     hence removed PACKAGECONFIG[bluez]
> >   - -show-cursor qemu option is now deprecated, updated
> >     scripts/runqemu to use updated option instead
> >   - added PACKAGECONFIG definitions
> >   - added qemu-ptest to conf/distro/include/ptest-packagelists.inc
> >   - increased support for ARM architecture, cpu and board
> >   - removed patches merged upstream and refreshed
> >     existing ones
> > 
> > Testing:
> > Build core-image-minimal against the machines in
> > openembedded-core/meta/conf/machine and succesfully
> > booted with qemu v5.0
> > 
> > Ran qemu-ptest on x86-64 and arm64 with identical results:
> > PASS: 1166
> > SKIP:    0
> > FAIL:    0
> > 
> > Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> 
> This is in general looking good but we did see one error:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/2050
> 
> which is strange as its only on the edgerouter.

Its because qemu can't run on mips machines. We therefore need:

PTESTS_FAST_remove_mips64 = "qemu-ptest"

I can add this as a fixup to the patch.

Cheers,

Richard

