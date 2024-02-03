Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC130C4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 23:52:54 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.28862.1707004372493064701
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 15:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mna7nEgR;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: petr.vorel@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3394bec856fso2665346f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 15:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707004371; x=1707609171; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJHlJgtz3LUC7vEiyyUkspq14b000tisFeCr/z/xTi4=;
        b=mna7nEgRfuOrIsWO2yRehCKe6jFZUz9rZI0aV3RZNWbEBnseTwwL4atfqUbQpAKhBA
         DsvYJBvY6vDOTPGdRqh4UrYGoCQIuE3wfCoeABgsAN8EIRqybFZ57doVK64RjpmKmzkF
         PsFfVTfNvC3vtTSWEWvfiyzZT+eMsr5ZwUFFVdmOkLySqqqhWq+lZSSed7OmqpfzeEzh
         FlC466+q9YqfCA+aXYZIFCgpPKctZvyi86V+j8C/YMfWtYLDZwkdW1x8x1Gy5d/6ZwBK
         t188JIARNAi/awK1k9+0fCTWWArnQbJJifwDlFzkSLTAbF1aYXVW4VWqpAYicfIMsIPa
         eNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707004371; x=1707609171;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJHlJgtz3LUC7vEiyyUkspq14b000tisFeCr/z/xTi4=;
        b=NYi+Yf3n0uoK6f1fCDjlqtgX1x44RCHdnyFWB2qtikIuKVrdsDWADf/opieQKMa/PO
         zXezb4QwIHcJ7KsTvePnZHdU/68gOMpi+DO8wLanmiXrrqc+GBUvtrm/G43IediaqUV5
         ct+NVEgcPTciQ+W5fmvODuyswbUAiTUmBZ7MiRJ6Yr6VndhrLqDmPcU97J5S5+geCGyA
         vTHlKpblKoO4wGzdzHhTSioEdt9zhHOqQOzNm7YeHjFRSwfFWar4M+RAhW7R9LNeQU+6
         xX1BWPWEjuFlF0KhJDC7VR41aohnH8sX8jDuNz0SBxFxZYpr2DtaXcszJhEiUNnXYmpj
         lnmA==
X-Gm-Message-State: AOJu0Yy4iQl6wc0QqcIC9G36VO/4eaWlac9kQTIcWr5Ky8KUjo3q05no
	VtmshqBoHA+z7P8c9pwdD9wcIU6B0daQJq9iQU8pssNTRtY0hLyQ
X-Google-Smtp-Source: AGHT+IE4v1WCY1RM8dPHfNff06VCwMSMYlsNlZ/iSNHZ2Jc+BOhfGi4KIT7tIP/pMoimPWbSSQNopw==
X-Received: by 2002:adf:f9cc:0:b0:33a:e2d8:aceb with SMTP id w12-20020adff9cc000000b0033ae2d8acebmr1683170wrr.9.1707004370501;
        Sat, 03 Feb 2024 15:52:50 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU4y4YabIyaMuaO0NJriu4uhA7i+NwrIwvYAgn2oGC2a1RFv7gvAfb71zrViCeUD6OHeQOewxRRELbJOlDPOXF+UBHmtDNEJNme2Q5xUKSIY5tKABb6fIf+ywaYBAaWeVxa2ln8pNQdRAbPRBhnp+XkrS19zz3SuwpLDD75PRE=
Received: from pevik (18.191-64-87.adsl-dyn.isp.belgacom.be. [87.64.191.18])
        by smtp.gmail.com with ESMTPSA id m27-20020a056000025b00b0033b11e91c0bsm4840944wrz.81.2024.02.03.15.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 15:52:50 -0800 (PST)
Date: Sun, 4 Feb 2024 00:52:47 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Daniel =?iso-8859-2?Q?D=EDaz?= <daniel.diaz@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: Update to 20240129
Message-ID: <20240203235247.GA163430@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20240131183243.30223-1-petr.vorel@gmail.com>
 <202402021507535468a87c@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202402021507535468a87c@mail.local>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 23:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194866

Hi Alexandre, all,

> On 31/01/2024 19:32:43+0100, Petr Vorel wrote:
> > Removed patch accepted upstream as
> > 8c53cc947 ("testcases/kernel/syscalls/fcntl: define _LARGEFILE64_SOURCE")

> > Rebase runtest/mm patch.

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> > Hi Richard, Daniel, Khem,

> > could anybody please test this update if build (it should).

> > Also, it'd be good nice to rerun proc01 -m 128 and report me with the
> > details, maybe we can fix it. If still problematic, it'd be nice to turn
> > disable_hanging_tests.patch into proper git patch (makes rebasing patch
> > on new LTP version easier).

> This fails on the autobuilders:

> https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/5957/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/5917/steps/12/logs/stdio


Thanks for testing this, you probably mean the warning before python stack trace:

scp: /opt/ltp/results/connectors: No such file or directory
WARNING: core-image-sato-1.0-r0 do_testimage: File could not be copied. Output: scp: /opt/ltp/results/connectors: No such file or directory

The problem is not due packaging, but simply runtest/connectors was removed [1],
thus your tooling has to be fixed not to expect it (not trying to run it).
I'm sorry, we sometimes do cleanup which brings incompatibility issue
(here it did not make sense to start SUT just for single test, thus we moved the
test to runtest/kernel_misc).

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/commit/9b642d89c0bcf5885b051c2d5768fa94b61d86cb

> > Kind regards,
> > Petr

> >  ...001-Remove-OOM-tests-from-runtest-mm.patch |  6 ++--
> >  ...-syscalls-fcntl-define-_LARGEFILE64_.patch | 28 -------------------
> >  .../ltp/{ltp_20230929.bb => ltp_20240129.bb}  |  3 +-
> >  3 files changed, 4 insertions(+), 33 deletions(-)
> >  delete mode 100644 meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
> >  rename meta/recipes-extended/ltp/{ltp_20230929.bb => ltp_20240129.bb} (97%)

> > diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
> > index 6d945700be..cc98079651 100644
> > --- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
> > +++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
> > @@ -14,10 +14,10 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> >   1 file changed, 6 deletions(-)

> >  diff --git a/runtest/mm b/runtest/mm
> > -index 6537666a9..e5a091a5a 100644
> > +index d859b331c..3c2962f44 100644
> >  --- a/runtest/mm
> >  +++ b/runtest/mm
> > -@@ -73,12 +73,6 @@ ksm06_2 ksm06 -n 8000
> > +@@ -74,12 +74,6 @@ ksm07 ksm07

> >   cpuset01 cpuset01

> > @@ -31,5 +31,5 @@ index 6537666a9..e5a091a5a 100644

> >   thp01 thp01 -I 120
> >  -- 
> > -2.33.0
> > +2.43.0

> > diff --git a/meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch b/meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
> > deleted file mode 100644
> > index dbe63f2170..0000000000
> > --- a/meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -From f4f75ce9218b469d91b536218de3323977edc529 Mon Sep 17 00:00:00 2001
> > -From: Alexander Kanavin <alex@linutronix.de>
> > -Date: Tue, 13 Jun 2023 15:10:33 +0200
> > -Subject: [PATCH] testcases/kernel/syscalls/fcntl: define _LARGEFILE64_SOURCE
> > -
> > -This is required for off64_t to be available on musl systems.
> > -
> > -Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/1047]
> > -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ----
> > - testcases/kernel/syscalls/fcntl/Makefile | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/testcases/kernel/syscalls/fcntl/Makefile b/testcases/kernel/syscalls/fcntl/Makefile
> > -index df663a50a..aac774111 100644
> > ---- a/testcases/kernel/syscalls/fcntl/Makefile
> > -+++ b/testcases/kernel/syscalls/fcntl/Makefile
> > -@@ -17,6 +17,6 @@ include $(abs_srcdir)/../utils/newer_64.mk
> > - 
> > - %_64: CPPFLAGS += -D_FILE_OFFSET_BITS=64
> > - 
> > --CPPFLAGS		+= -D_GNU_SOURCE
> > -+CPPFLAGS		+= -D_GNU_SOURCE -D_LARGEFILE64_SOURCE
> > - 
> > - include $(top_srcdir)/include/mk/generic_leaf_target.mk
> > --- 
> > -2.30.2
> > -
> > diff --git a/meta/recipes-extended/ltp/ltp_20230929.bb b/meta/recipes-extended/ltp/ltp_20240129.bb
> > similarity index 97%
> > rename from meta/recipes-extended/ltp/ltp_20230929.bb
> > rename to meta/recipes-extended/ltp/ltp_20240129.bb
> > index 5c43346883..5cd33bb6a3 100644
> > --- a/meta/recipes-extended/ltp/ltp_20230929.bb
> > +++ b/meta/recipes-extended/ltp/ltp_20240129.bb
> > @@ -24,12 +24,11 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"

> >  CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
> >  CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
> > -SRCREV = "110d3be6a9c58674de3e366b96a70f0129a5d299"
> > +SRCREV = "68737d20556d37364c95776044b1119c0912a36a"

> >  SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
> >             file://0001-Remove-OOM-tests-from-runtest-mm.patch \
> >             file://disable_hanging_tests.patch \
> > -           file://0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch \
> >             "

> >  S = "${WORKDIR}/git"
> > -- 
> > 2.43.0



> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#194532): https://lists.openembedded.org/g/openembedded-core/message/194532
> > Mute This Topic: https://lists.openembedded.org/mt/104081044/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-

