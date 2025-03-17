Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3912C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 12:20:49 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.50935.1742214045787993278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 05:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=G6QxSRFe;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-307bc125e2eso49035481fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 05:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742214044; x=1742818844; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EUPdoc/XVg5AW29Zy44xrwBjacNrgckoAp3JEb8CUiw=;
        b=G6QxSRFe5NrdMknOsnoXHoNpiDxo5k4IuGkPlB8Sa5JUwsT8/q0t3tLt4k2/iOO6Zm
         qpRqF2jF10boQUzG+m/2NwUJk7v/hbESM5/FdI96H+TA86vBPmCPT9vlPKkd4tJOTgH+
         qnDWWtH5T6o2EvtGcXZbMGZ0tXvbqeQUqIIPm16xqvGd0RuTvHKqhbvoGztg1uTr3HOm
         y+x59FD2VJ4d8PrYiqHcM2wFCfxpr+eQMghU/8fij8WWtNLvn5Q6wljZRJMl5HbiSFNQ
         4+Fn+OuFnQXix4LOtkVfiRZUJ0So/ZjQ9xC6NoQlkykkydqCV7bsOBQ5fcYuNgep8GsU
         EQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742214044; x=1742818844;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EUPdoc/XVg5AW29Zy44xrwBjacNrgckoAp3JEb8CUiw=;
        b=bz+rSgLNZoTrd0hvic+ENLdgQ3A0AoMWNRIKvvQneo7pOPgaXdCbAGtVApR+CvMRre
         SiWaIhaGpVNJlLGEz24qcxXFAHiNwZjFdEq1lv0q7kyWoiUQ79xUkFcMl4BcYqrxWwOa
         +O1N2Fl6i2JVApmf/0bCXxC2ny2VdXpK5DRINEfuKNsqW1C5FRY6Y1g4KxnXVWzOVCTN
         1pDeAMxS2VFjC/tDI5kVrMPG4bnjKxsH+42UpUYdH2n6TnhZnNpDfYBxumXc4qVfeeAw
         DyhLL0+eD6kDetwHioAK9aPB8oqcYm5CSfMTU3XQ/OGXGzepxpjD0KAG9TSfzlqNFV9D
         mBWQ==
X-Gm-Message-State: AOJu0YwFtsYaeyZGgbIg6HOWvE0c4Lwrvp6dcssXIuu4U1Zd+F67AHx4
	l+D/oXSQgeQvVrIC0DCjCF8Bt4maHo3iISrAF+a11fKzlwsrHJ9QpQPoBUFfRcQ=
X-Gm-Gg: ASbGncvhb9OG5xTRziVYdsEyUqZNKW5x1QY3hpCe6iNIFFXi+MNUEHHn6wY5+P7XSvm
	S7lW0tF/BRdVk8MDPrlkWlhljFRsF/2mSu8+UmjZvOmvrLsCch0ZZKhylDwyacNFLETJcsBMj2f
	4+E1ZBGvAfvxJt86jKDJNRcQTQ+yH2vtKFcvJkPMTpb+1fe939D+nOfxY8HatsseKnUSzFWtyyp
	NYh4h2F5JxSc20nF5ceePwz8CARb7T0Rm+FN9zvSLSQaReHJ5Ue7l54vn7NA3TnoQfjPAT4hffW
	uWOdPFlRkP0BHk3kZgxepsFKKCyWrJbsqTuJAiYq/Ijb05j8o43sgptJfMR+gWU9h4AJ/Ahi
X-Google-Smtp-Source: AGHT+IFGRZceAKGot3W+DDRVXJDFUfh6MHPz5vhhCyY8DSbcUjYuwHForSamisTyAuKZj4S2UW62/w==
X-Received: by 2002:a05:6512:3f16:b0:545:60b:f38c with SMTP id 2adb3069b0e04-549c396eed9mr5992404e87.41.1742214043734;
        Mon, 17 Mar 2025 05:20:43 -0700 (PDT)
Received: from nuoska (85-76-96-35-nat.elisa-mobile.fi. [85.76.96.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7a82e2sm1333778e87.36.2025.03.17.05.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 05:20:41 -0700 (PDT)
Date: Mon, 17 Mar 2025 14:20:38 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/6] systemd based initrd and modular kernel
 support
Message-ID: <Z9gTlqM4WDBVZiSW@nuoska>
References: <20250314111942.304800-1-mikko.rapeli@linaro.org>
 <d9313e60692d537081323a532bd154493efc5975.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9313e60692d537081323a532bd154493efc5975.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 12:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213082

Hi,

On Mon, Mar 17, 2025 at 11:50:58AM +0000, Richard Purdie wrote:
> On Fri, 2025-03-14 at 13:19 +0200, Mikko Rapeli via lists.openembedded.org wrote:
> > systemd based initrd supports more security, encryption etc features
> > than custom shell script ones but oe-core lacks support for it.
> > Convert core-image-initramfs-boot to create systemd based initrd
> > if "systemd-initramfs" is set in DISTRO_FEATURES. Includes a test
> > for this initrd to mount rootfs via Unified Kernel Image uki.py.
> > 
> > Sadly the boot time is really slow, e.g. over 30 seconds with
> > systemd based initrd. One of the major reasons is the large
> > amount of kernel modules built into the linux-yocto kernel and
> > processing of their udev events in userspace. Thus add
> > kernel-initrd-modules meta package to easily install
> > subset of all kernel modules to initrd. The subset
> > supports "mount rootfs from any block device" but
> > doesn't include graphics, UBS etc support. Without this
> > generated meta package, initrd recipe needs to manually define
> > which exact kernel modules to include which breaks if
> > those modules are built into the kernel. Thus the initrd
> > becomes machine and kernel config specific and hard to maintain.
> > With this meta package a generic initrd can be created.
> > 
> > Separate changes to linux-yocto compile a lot more drivers
> > as modules but they depend on these initrd changes.
> > 
> > Mikko Rapeli (6):
> > � systemd: use serial-getty-generator on genericarm64
> > � systemd: enable efi support if in MACHINE_FEATURES too
> > � uki.bbclass: drop serial console from kernel command line
> > � kernel.bbclass: add kernel-initrd-modules meta package
> > � core-image-initramfs-boot: add option to build systemd based initrd
> > � oeqa selftest uki.py: add aarch64/arm test with systemd based initrd
> > 
> > �.../recipes-core/systemd/systemd_%.bbappend�� |� 3 +
> > �.../kernel-module-split.bbclass�������������� | 46 +++++++++++
> > �meta/classes-recipe/kernel.bbclass����������� |� 5 +-
> > �meta/classes-recipe/module.bbclass����������� | 37 +++++++++
> > �meta/classes-recipe/uki.bbclass�������������� |� 2 +-
> > �meta/lib/oeqa/selftest/cases/uki.py���������� | 76 +++++++++++++++++++
> > �.../images/core-image-initramfs-boot.bb������ | 28 ++++++-
> > �meta/recipes-core/systemd/systemd_257.3.bb��� |� 1 +
> > �8 files changed, 193 insertions(+), 5 deletions(-)
> > �create mode 100644 meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend
> 
> Unfortunately this series seemed to result in oe-selftest failures on
> both aarch64 and x86-64:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1242
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1110/steps/14/logs/stdio

Thanks, I will investigate these. I ran into various issues when executing
selftests on my aarch64 build machine.

Is the basehash error related to this series or something else?

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/1782873/raw_inline

stdio: ERROR: When reparsing /tmp/selftest-fetchoxfe4t0p/test.bb:do_checkuri, the basehash value changed from 84b9e23a83a764e7a5d8a96ee523199e2b1c604f4280a45030e248de0ff52962 to 4123da244f465feffecb2b4fd2b132b64851981ec2fb70bf9445df8b0ea6a69e. The metadata is not deterministic and this needs to be fixed.
stdio: ERROR: The following commands may help:
stdio: ERROR: $ bitbake test -cdo_checkuri -Snone
stdio: ERROR: Then:
stdio: ERROR: $ bitbake test -cdo_checkuri -Sprintdiff
stdio: ERROR: When reparsing /tmp/selftest-fetchoxfe4t0p/test.bb:do_fetch, the basehash value changed from 6d55d6743729b615749dc016857d7e5f9c884a8b92f0d57f68e743f4910333d3 to fa7d6ea0563b60362418d2a6c5e41a6684183d01ec578b65abd0c64a9cfba7cf. The metadata is not deterministic and this needs to be fixed.
...

There are a lot of these.

If there are any boot failures in qemu then I will have a look. The changes were not
supposed to change existing rootfs or initrd images. The new test in uki.py
may fail on some configurations which I did no manage to test.
Maybe "uki.bbclass: drop serial console from kernel command line" is breaking
serial console prompt on some machines. I'll try to reproduce.

Did the test run contain the linux-yocto changes which build a lot of kernel
drivers as modules? I don't think that is ready for AB testing yet, hence RFC in
https://lists.yoctoproject.org/g/linux-yocto/message/14866
The changes were sent out in-reply-to this thread so it's possible some tool
picked them up. That could explain shell script based initrd boot error message:

ERROR: There's no '/dev' on rootfs.

Cheers,

-Mikko

