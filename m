Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F651D591A3
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 16:32:29 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.45822.1731947541152970303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 08:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OqHeTeXI;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d410b5a94eso38416d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 08:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731947540; x=1732552340; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FzKKqEA2J2bkH0DohlbQWqpIBNgvIEevfgtWOm1WpZo=;
        b=OqHeTeXIvSTYPkOW1DG9xdqIlfozoBJsJaAp77aL+cGk2mJJeferRqp/0RvPdGxX7W
         ZN5pu1Fv5K5oyWZZ3f8fzIYQbuna2hPQ9NYNJgsvBDiVW0JNO5PoTsLiPbrPiHNXwnDj
         sLcvVd8wyCM9IOkrZwKIcGynTK4feHfvMTBkqIfnYfsy22EvJjpPXJOQ8jwd7d76RkEQ
         2abLOtY8+O/rHVCiwWenKk+wtKqwkV8LhyFZug6rLF43Cze2/eAOt1eD4HN4gqcqzf/e
         IrhrTDFsLMGiZQxpo7hqRWhqfiz7UHkvZD0C3ia04CZaQtRw4SyC2CcHuBIx7UTpF1Kx
         Vx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731947540; x=1732552340;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FzKKqEA2J2bkH0DohlbQWqpIBNgvIEevfgtWOm1WpZo=;
        b=La9yjPxX0wI6e2QcxTz1BX2+dUgnJJ9MPC+cYAQE+PXXt5hqQc2J66JfsUMCvAOs/s
         Gv1bGkz/a/PwVf7Q26ccumV6JTn4Y3zfHkJ1Sqcc+6zxeNtx98FLQ+VUaToSfNk9vgZI
         O8/1oREHseuZywwr43ICVyjBXmR8Szlrvu7O87X6S1JE4A7GzLJqiKn0rhIhiCEklNjm
         arjcEmtlmqom9nFM5wY0esVhUEzJx6RPvtzFrbG86PmFP9zHrrSlthB62aFW5UIVn2aU
         lMtchmLLDoxaGes/LMFDwDMbIwrfBatVmK7W9dpaxCb33dLhXGyhh93o4uHms68AW8D0
         snxg==
X-Forwarded-Encrypted: i=1; AJvYcCVrfX+8F4eTJ6dG/3kSM4ff3Qo0N+RI46pgVHZA57uvjuCrl3rfq5EDMT1K6wDCPOgKCFko2LIR9I43KurVNtkj/A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzomhEXxvvlKlwPTm/6AEmqYpb8O4V2BONZXIGhid816jmvGsxG
	R9q2QwVr2YMSIJop82mO2k84iYMYAx2MrCVl5TuV7qZ2cWqYKdrum5AQks/X1ETZpAMTUuuwxSs
	hHfuiB6oaK7RUnSjkZtP0CPnDqSM=
X-Google-Smtp-Source: AGHT+IHdD2S9FKseEQjBwBkXm0cnQe26qSmSKjpLdmL1t2peX/kynqOI9AUDT2EQlnYzQuWnUjaYwTLOWb/PZxX4LiI=
X-Received: by 2002:ad4:5d66:0:b0:6d4:1b2b:c836 with SMTP id
 6a1803df08f44-6d41b2bcfa7mr120918126d6.47.1731947539175; Mon, 18 Nov 2024
 08:32:19 -0800 (PST)
MIME-Version: 1.0
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
 <1731403483-21399-7-git-send-email-wangmy@fujitsu.com> <ZznjAnJKfH8f_mxL@bootlin-mathieu>
 <TYWPR01MB1186132D4B68C5FBF61008C73DC272@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <ZztpdwDKMBRDYfQx@bootlin-mathieu>
In-Reply-To: <ZztpdwDKMBRDYfQx@bootlin-mathieu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Nov 2024 17:32:08 +0100
Message-ID: <CANNYZj9Y7K556p_NvqRiwW3QSzHJzo-X=o_9xqfAZz-nkapqig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 07/47] gawk: upgrade 5.3.0 -> 5.3.1
To: mathieu.dubois-briand@bootlin.com, 
	"Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 16:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207226

I'd also note that the failure log shows where you can find the
detailed testimage log:
http://valkyrie.yocto.io/pub/non-release/20241115-76/testresults/qemux86-64-ptest/core-image-ptest-gawk/

There's a bit more detail there about the failure (and some strange
binary dump from tar that shouldn't be there).

Alex

On Mon, 18 Nov 2024 at 17:21, Mathieu Dubois-Briand via
lists.openembedded.org
<mathieu.dubois-briand=bootlin.com@lists.openembedded.org> wrote:
>
> On Mon, Nov 18, 2024 at 01:36:47PM +0000, Mingyu Wang (Fujitsu) wrote:
> > I didn't find ptest error of gawk from the log.
> > I did the ptest of gawk by running ptest-runner and there's no error occurred.
> > Can you tell me how to reproduce the error.
> >
>
> Ok, reproducing the ptest build locally is indeed not straightforward. I
> used the following procedure to reproduce something close to the setup we have
> on the autobuilder, and I did reproduce the ptest failure.
>
> First, if you want to use the exact same branch, you can take
> mathieu/master-next-e78c1f31b592 from
> git://git.yoctoproject.org/poky-contrib.
>
> Then, I created a new empty configuration and added entries in
> local.conf, to correspond roughly to what is described in
> https://git.yoctoproject.org/yocto-autobuilder2/tree/config.py. There is
> probably a lot of things not relevant here, but it was good enough to
> build and reproduce locally.
>
> rm -rf build
> source poky/oe-init-build-env
> QEMU_USE_KVM = 'True'
> INHERIT += 'report-error'
> PREMIRRORS = ''
> BB_GENERATE_MIRROR_TARBALLS = '1'
> BB_NUMBER_THREADS = '16'
> BB_NUMBER_PARSE_THREADS = '16'
> PARALLEL_MAKE = '-j 16 -l 75'
> BB_PRESSURE_MAX_CPU = '20000'
> BB_PRESSURE_MAX_IO = '20000'
> XZ_MEMLIMIT = '5%'
> XZ_THREADS = '8'
> ZSTD_THREADS = '8'
> BB_TASK_NICE_LEVEL = '5'
> BB_TASK_NICE_LEVEL:task-testimage = '0'
> BB_TASK_IONICE_LEVEL = '2.7'
> BB_TASK_IONICE_LEVEL:task-testimage = '2.1'
> IMAGE_CLASSES += 'testimage'
> TEST_QEMUBOOT_TIMEOUT = '1500'
> SANITY_TESTED_DISTROS = ''
> SDK_EXT_TYPE = 'minimal'
> SDK_INCLUDE_TOOLCHAIN = '1'
> ESDK_LOCALCONF_REMOVE:append = 'BB_HASHSERVE'
> BB_DISKMON_DIRS = 'STOPTASKS,${TMPDIR},1G,100K STOPTASKS,${DL_DIR},1G
> STOPTASKS,${SSTATE_DIR},1G STOPTASKS,/tmp,100M,30K
> HALT,${TMPDIR},100M,1K HALT,${DL_DIR},100M HALT,${SSTATE_DIR},100M
> HALT,/tmp,10M,1K'
> BB_HEARTBEAT_EVENT = '60'
> BB_LOG_HOST_STAT_ON_INTERVAL = '1'
> BB_LOG_HOST_STAT_CMDS_INTERVAL = 'oe-time-dd-test.sh -c 100 -t 3'
> BB_LOG_HOST_STAT_ON_FAILURE = '1'
> BB_LOG_HOST_STAT_CMDS_FAILURE = 'oe-time-dd-test.sh -l'
> SDK_TOOLCHAIN_LANGS += 'rust'
> BB_SERVER_TIMEOUT = '60'
> BB_LOADFACTOR_MAX = '1.5'
>
> TEST_SUITES = 'ping ssh ptest'
> INHERIT += 'image-buildinfo'
> IMAGE_BUILDINFO_VARS:append = ' IMAGE_BASENAME IMAGE_NAME'
> EOF
>
> Then built my image and ran ptests. The runqemu-gen-tapdevs might or
> might not be needed, more details in
> documentation/dev-manual/runtime-testing.rst.
>
> bitbake core-image-ptest-gawk
> sudo ${BUILDDIR}/../scripts/runqemu-gen-tapdevs 1000 4
> bitbake core-image-ptest-gawk:do_testimage
>
> And I got this output:
>
> WARNING: core-image-ptest-gawk-1.0-r0 do_testimage: There were failing ptests.
> Traceback (most recent call last):
>   File "/home/mathieu/projects/swat/builds/poky-contrib/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>            ^^^^^^^^^^^^^^^^^^^^^
>   File "/home/mathieu/projects/swat/builds/poky-contrib/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>            ^^^^^^^^^^^^^^^^^^^^^
>   File "/home/mathieu/projects/swat/builds/poky-contrib/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>            ^^^^^^^^^^^^^^^^^^^^^
>   File "/home/mathieu/projects/swat/builds/poky-contrib/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptestrunner_expectfail
>     self.do_ptestrunner()
>   File "/home/mathieu/projects/swat/builds/poky-contrib/meta/lib/oeqa/runtime/cases/ptest.py", line 120, in do_ptestrunner
>     self.fail(failmsg)
> AssertionError:
> Failed ptests:
> {'gawk': ['printf-corners']}
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207221): https://lists.openembedded.org/g/openembedded-core/message/207221
> Mute This Topic: https://lists.openembedded.org/mt/109531966/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

