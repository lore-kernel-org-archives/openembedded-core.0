Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD97C021B4
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 16:20:07 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.724.1740068404611730086
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 08:20:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FsaiEpB7;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54622829175so1101994e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 08:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740068403; x=1740673203; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ltnrHllVregXNeHwmx0E0rHHA+veeIPJNkQgy4P1Obk=;
        b=FsaiEpB7ra/NKi54qlg0I7FbF31frR8+Sqt+6f1ZTTLUUkg9vUYo7AbFlcCIb2rkQ+
         FBqSRPk0bulthYKwMNsjz7j6Y7pJRQ5WHbLhLE5YMnM6i9koVCily6EwX/L8HpctbMiv
         arliOr0qwqoKfiJu7dYUPivt9nTLE/xZ+lqQyY820xN/yqZ/4/fALAwi+kh5fXzmNkc2
         9yCuHfXZA6sbpep6gBaK9D2T1IdzfD9F7NTRXC1oXbaP2oVWSoncCViC3S7cBLzLm8zS
         NLQLddwaP6KiYE1P/XJUN5oOyzhFmBKCfv1iSQswKXBWGUte3pCrcq8phFqwWaVuER3L
         FE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068403; x=1740673203;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltnrHllVregXNeHwmx0E0rHHA+veeIPJNkQgy4P1Obk=;
        b=ZbOiJLd4BpBNyTE7Dl2Mvth9sDwBO+brvjI5gYzLjPlBQKJogaPsg2I0HFrglceOGI
         uHFqHFIUHIoz/+pBRQ+PQ8Yh8+7+dpzXP53ULOcPtTnUHRjIkP51L3Gd9rEEUBRGfoye
         0+dovyEcqREcqNkxpQePINNEVmL7r1sFBVOjRtl+wqx8HHlSNzK+MOLQGvxBCFF74pgi
         wgDDwZq6SWImjiNaHTbHSSedDRPu8JlJq/VGZNOJmYhxyL/FWhFvrEV1f8F46hGt2zJD
         fcI4xV28xF9ix2+4tep0/lIxsPbvz7UQo8KHT0uooeKOL50/qQUHmLAwxr3P20kGotuz
         Mp1g==
X-Gm-Message-State: AOJu0YwDsDO+Cps8vGJKxbEn6co76YFRwi4yQ18IqjcEw7AqTmFWXhlx
	Oc42CNpbtGEy2fpa1YQj4Tj8LbQmtOXGi0cP2rFQktXeFefNWpiB0IWtjUWvPQs=
X-Gm-Gg: ASbGncsUJUHz/hy95qkMQE7jdanf3D7ULplixkp5jdZvCZ0uEXbxBa9OFMj7KDZC+rH
	jLGmx5dqLGzX2p3CZVzgxaM+lZbTYSRz+nZH+DQtsiXImwjEXLwO2DlIZ3/cikTvp1WnqJmJm8z
	KyMrkbVr2XecHwFSgNU+V0vnOwJ5nkcDBNfrYutm8azKNFxIKXx0V3FG0cbWjfY0+BF76+bwUxr
	DX6Qiv/UrH87DGz0aVRR4b4Ngtza1SVBzyFGEKgpPTVArIvI8nhlDWay5UuwJ7b0XKLobPPcLtS
	Yq0d2Bn/VjSqmurphdfwK8iQGz9MLZWFkFvdHEbB
X-Google-Smtp-Source: AGHT+IHcng0Gj1bn8vUyAni8hq3fvqkKgVETCgfbVVAiUkJ6wGU0aYFBNmanl2IC8vVSCmMnJtT33g==
X-Received: by 2002:a05:6512:3e07:b0:545:6a2:e58 with SMTP id 2adb3069b0e04-5452fe6fb9bmr9095480e87.32.1740068401323;
        Thu, 20 Feb 2025 08:20:01 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54523a223ccsm2292685e87.152.2025.02.20.08.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:20:00 -0800 (PST)
Date: Thu, 20 Feb 2025 18:19:58 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, poky@lists.yoctoproject.org,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Jon Mason <Jon.Mason@arm.com>, Ross Burton <ross.burton@arm.com>
Subject: Re: [poky] [PATCH 2/2] psplash: start via udev if framebuffer device
 detected
Message-ID: <Z7dWLjK7SqsewS92@nuoska>
References: <20250206144406.1328276-1-mikko.rapeli@linaro.org>
 <a7821314c57220b19a189530d48a64934c4b4820.camel@linuxfoundation.org>
 <Z7bpaerggUQ4vgqK@nuoska>
 <d3e2d988c109520827afe6a514375e5510075cc2.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3e2d988c109520827afe6a514375e5510075cc2.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 16:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211770

Hi,

On Thu, Feb 20, 2025 at 09:20:16AM +0000, Richard Purdie wrote:
> On Thu, 2025-02-20 at 10:35 +0200, Mikko Rapeli wrote:
> > On Wed, Feb 19, 2025 at 03:59:59PM +0000, Richard Purdie wrote:
> > > On Thu, 2025-02-06 at 16:44 +0200, Mikko Rapeli via lists.yoctoproject.org wrote:
> > > > psplash-start.service expected to find /dev/fb0 and failed
> > > > if device was not found. This failure breaks systemd
> > > > oeqa runtime test with "runqemu nographic". Starting
> > > > psplash based on detected framebuffer device fixes systemd
> > > > boot status and systemd oeqa runtime tests for qemu
> > > > boots with and without graphics support.
> > > > 
> > > > Note that psplash-systemd.service still depends on /dev/fb0
> > > > so startup with multiple framebuffer devices may not work
> > > > correctly. I don't have devices with multiple framebuffer
> > > > devices to test with.
> > > > 
> > > > On qemu machine with graphics, psplash displays yocto
> > > > logo correctly and boot progress bar as well. Once boot completes
> > > > to systemd "running" state, the logo is replaced by login prompt.
> > > > On qemu machine without graphics, boot completes without psplash
> > > > or failures and login over serial console works normally.
> > > > Tested with genericarm64 machine poky-altcfg distro and core-image-base
> > > > image on qemu. AMD kv260 tested as well but graphics stack is not yet
> > > > working there so boot is similar to qemu without graphics.
> > > > 
> > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > ---
> > > > �meta/recipes-core/psplash/files/fb.rules���������������� | 1 +
> > > > �.../{psplash-start.service => psplash-start@.service}��� | 5 ++---
> > > > �meta/recipes-core/psplash/files/psplash-systemd.service� | 8 +++-----
> > > > �meta/recipes-core/psplash/psplash_git.bb���������������� | 9 ++++++---
> > > > �4 files changed, 12 insertions(+), 11 deletions(-)
> > > > �create mode 100644 meta/recipes-core/psplash/files/fb.rules
> > > > �rename meta/recipes-core/psplash/files/{psplash-start.service => psplash-start@.service} (84%)
> > > 
> > > Unfortunately I think this has introduced an intermittent QA test
> > > failure showing up in meta-arm in particular. Examples:
> > > 
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/994/steps/22/logs/stdio
> > 
> > Feb 19 01:26:42 sbsa-ref psplash-systemd[261]: Error unable to open fifo
> > 
> > This means psplash.service did not start or did not yet create it. Can I somehow see the
> > build and boot configuration?
> 
> If you shorten the url you can see the list of steps taken:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/994
> 
> 
> The failure in this case is from sbsa-ref and the "Write config" just
> before that is step 20 which is:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/994/steps/20/logs/stdio
> 
> That at least gives you the config of the build. Step 21 builds it,
> then step 22 runs the tests which fail.

Thanks, this clarifies things.

> > Feb 19 01:27:12 sbsa-ref systemd[1]: /usr/lib/systemd/system/psplash-systemd.service:8: Unknown key 'ConditionFileExists' in section [Unit], ignoring.
> > Feb 19 01:27:26 sbsa-ref systemd[1]: /usr/lib/systemd/system/psplash-systemd.service:8: Unknown key 'ConditionFileExists' in section [Unit], ignoring.
> > 
> > psplash.service is of type notify and fifo is created before systemd is notified, but
> > the fifo creation could also fail due to other reasons which I can't see from the logs.
> > 
> > Fixing the condition will fix the systemd test failure but plsplash and progress
> > bar may have functional failures.
> > 
> > I will send a patch.
> > 
> > > https://gitlab.com/jonmason00/meta-arm/-/jobs/9155263483
> > 
> > This looks like something completely different:
> > 
> > 2025-02-17 22:43:20 - INFO���� - AssertionError: 3 != 0 : SYSTEMD_BUS_TIMEOUT=240s systemctl status --full --failed
> > 2025-02-17 22:43:20 - INFO���� - x dev-disk-by\x2duuid-38d0b388\x2d9989\x2d4744\x2d8a0a\x2d3e6be1135f5a.swap - /dev/disk/by-uuid/38d0b388-9989-4744-8a0a-3e6be1135f5a
> > 2025-02-17 22:43:20 - INFO���� - Loaded: loaded (/etc/fstab; generated)
> > 2025-02-17 22:43:20 - INFO���� - Active: failed (Result: exit-code) since Mon 2025-02-17 22:41:32 UTC; 20min left
> > 2025-02-17 22:43:20 - INFO���� - Invocation: 6e51ad1d846f4e8cbb129f05d75ac240
> > 2025-02-17 22:43:20 - INFO���� - What: /dev/disk/by-uuid/38d0b388-9989-4744-8a0a-3e6be1135f5a
> > 2025-02-17 22:43:20 - INFO���� - Docs: man:fstab(5)
> > 2025-02-17 22:43:20 - INFO���� - man:systemd-fstab-generator(8)
> > 2025-02-17 22:43:20 - INFO���� - Mem peak: 1.7M
> > 2025-02-17 22:43:20 - INFO���� - CPU: 198ms
> > 2025-02-17 22:43:20 - INFO���� - 
> > 2025-02-17 22:43:20 - INFO���� - Feb 17 22:41:32 sbsa-ref systemd[1]: Activating swap /dev/disk/by-uuid/38d0b388-9989-4744-8a0a-3e6be1135f5a...
> > 2025-02-17 22:43:20 - INFO���� - Feb 17 22:41:32 sbsa-ref swapon[210]: swapon: /dev/sda3: swap format pagesize does not match.
> > 2025-02-17 22:43:20 - INFO���� - Feb 17 22:41:32 sbsa-ref swapon[210]: swapon: /dev/sda3: reinitializing the swap.
> > 2025-02-17 22:43:20 - INFO���� - Feb 17 22:41:32 sbsa-ref swapon[212]: mkswap: invalid option -- 'U'
> > 2025-02-17 22:43:20 - INFO���� - Feb 17 22:41:32 sbsa-ref swapon[212]: BusyBox v1.37.0 () multi-call binary.
> > 2025-02-17 22:43:20 - INFO���� - Feb 17 22:41:32 sbsa-ref swapon[212]: Usage: mkswap [-L LBL] BLOCKDEV [KBYTES]
> > 2025-02-17 22:43:20 - INFO���� - Feb 17 22:41:32 sbsa-ref systemd[1]: dev-disk-by\x2duuid-38d0b388\x2d9989\x2d4744\x2d8a0a\x2d3e6be1135f5a.swap: Swap process exited, code=exited, status=255/EXCEPTION
> > 2025-02-17 22:43:20 - INFO���� - Feb 17 22:41:32 sbsa-ref systemd[1]: dev-disk-by\x2duuid-38d0b388\x2d9989\x2d4744\x2d8a0a\x2d3e6be1135f5a.swap: Failed with result 'exit-code'.
> > 2025-02-17 22:43:20 - INFO���� - Feb 17 22:41:32 sbsa-ref systemd[1]: Failed to activate swap /dev/disk/by-uuid/38d0b388-9989-4744-8a0a-3e6be1135f5a.
> > 
> > So these could be fixed by adding util-linux-mkswap to the images instead of
> > relying on busybox?
> > 
> > I will send a patch.
> 
> Thanks, and sorry, I thought that was the same failure for some reason.

No worries, patches out for both. Hope that helps.

> > 
> > > but it doesn't always fail. There were other failures if you look
> > > through the meta-arm builds.
> > 
> > Link to the builds?
> 
> The builds for meta-arm can be found by going to the autobuilder main page:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/
> 
> then "Builds" on the LHS sidebar, "Builders", "meta-arm", i.e.:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75
> 
> where the failing builds are:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/986
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/991
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/992
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/994

These are psplash failures and patch is out.

> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1001
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1003

In these two ssh communication with target timed out:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/meta-arm/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/meta-arm/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/meta-arm/build/meta/lib/oeqa/runtime/cases/ssh.py", line 38, in test_ssh
    self.fail("ssh failed with \"%s\" (exit code %s)" % (output, status))
AssertionError: ssh failed with "
Process killed - no output for 30 seconds. Total running time: 35 seconds." (exit code -15)

Either target did not boot correctly or was slow to respond, or I've seen these also
when no sshd was on target at all, which is the default for core-image-minimal.
Thus something in build config must be adding them to target. dropbear was built
but I don't see

IMAGE_FEATURES += "ssh-server-dropbear"

in the build configuration
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/1545775/raw_inline

Also https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/1545905/raw_inline shows

"Test requires dropbear, or openssh-sshd to be installed"

To me this indicates that image doesn't have sshd at all.

For meta-arm kas builds this is added by ci/testimage.yml.
So this is a bit confusing to me. I don't think the target image has
any ssh daemon installed and thus all tests apart from ping and parselog prepare
fail. Some tests depend on ssh test but many just try to run ssh commands
which time out.

One way to fix this is to add sshd/dropbear to the images or make ssh test depend on either
one in the image. This is a bit problematic for anyone who tries to run these
tests for local builds. The default configs and images will fail tests.

Cheers,

-Mikko

