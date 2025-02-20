Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAA8C021B2
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 08:36:11 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.45111.1740040560541279031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 00:36:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fyijBPqO;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5452c29bacfso811401e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 00:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740040559; x=1740645359; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IXuHRIj/zAYvsT+dPBFzM+vi5aSycPpsR49oR4Zm3K0=;
        b=fyijBPqOGrKrfA8gXFd9B94ODc9lidCZOZaqgK41796viHtlYmDp0nQ0YBFK0ZxnAt
         R/Us8vkcIVYK+aWHSUXwmx2KnMpuemZ0Bl61KbDcMJgFV8kT/OLHFdhzzEXmb1U9PW51
         TL0ceSL1/29JD1UAhmlFDktki72vdDjEuyKvFftnEQnYlqc/x2StUH/xyYpdtrudOBLy
         0AkuIevpUMlmPAstsPMLx0BloDTO/olgInw9yJ4BicNsull/kludXKQud5h4oDLVMme5
         +QaY5W6fQRR5O1pXGi7vpHyaCe9YA4tFI48nsYznL0W3do3QAXtv9wH9rpOALuwH50R6
         ftlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740040559; x=1740645359;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IXuHRIj/zAYvsT+dPBFzM+vi5aSycPpsR49oR4Zm3K0=;
        b=ORDhMWS/7dpO95FYhNHHqv/fzpknFiYtCyCtyW8b7wwTYAVlHeXnX+wztQ3pS+Xq7v
         DfUR1uDXIE2G61MDtoWLMRNu+p0mzEBxwhx29hasMOflijCkBMyL1jNJ1gEJbL+o5JvL
         l7otUMSTtgM7sHQZF6uG1Hi8mHDeIeARTqLJcVzqdo06BZ283pK2rh51EpVtVSEO98q2
         6Gam8wa/2RSF++c2H4A8i3koCneWNrC2utBRIrHE4qJfy6chwl6fZynzgfVQ8GblwC4Q
         Q4Uz62CIzdPkYZ9gW4fCjXriH4vCNW7LTV3cedIC411g9wpGOzyBa6wegl9b+vSCZc2a
         OjUg==
X-Gm-Message-State: AOJu0YwEFvFa4mOnKgngRFFydq3F35zXD/JfKgO+UsEj9jZZhrj1SM73
	47aexWWrBIx+C2kJJcwL5xsgB563s2Cik79ZP9OdiLLKEhIlt3u+TCLfFSag0Wg=
X-Gm-Gg: ASbGncu73+co6++2o8z9v70CBCs1YbSSTOZVaPyakU8cN56DtqjU9MJH/7W2XOiA5O8
	zqVCZ43GM+fKnQbMSVh2zvAXa2tREpm/6zHWgJbQaxoDt/fqXAmuh33jWGIdfpV2j0OY6rMVxOm
	VRgBtgbpHSytikbj7KBEcFvujZf9F8HEJ7YYdCTsyIc1MmIZFOmFOzlNRT0o0ApxWPpKeFzmJGT
	q6ZrCoLASmK5+tWIb3HSHcloRWTO4UnNK8OEI88uAOclAfRItp9hHypJP9tsHEHpg4E2uhqLZtT
	XhJPcEFqaJWI3YQjM8hsMSbyNgbGKNkBXyqPtA6J
X-Google-Smtp-Source: AGHT+IEhdCM+kkp/WaEBkgmXnvQdNmuJc9ZRbhXBr7Cu1y8XQHaiW6FZJohK1HvGT6wWuVhZteD1tA==
X-Received: by 2002:a05:6512:31d3:b0:545:2b24:c711 with SMTP id 2adb3069b0e04-5452fe3f5b4mr7223275e87.21.1740040558427;
        Thu, 20 Feb 2025 00:35:58 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452860d6cesm2036519e87.145.2025.02.20.00.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 00:35:56 -0800 (PST)
Date: Thu, 20 Feb 2025 10:35:53 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, poky@lists.yoctoproject.org,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Jon Mason <Jon.Mason@arm.com>, Ross Burton <ross.burton@arm.com>
Subject: Re: [poky] [PATCH 2/2] psplash: start via udev if framebuffer device
 detected
Message-ID: <Z7bpaerggUQ4vgqK@nuoska>
References: <20250206144406.1328276-1-mikko.rapeli@linaro.org>
 <a7821314c57220b19a189530d48a64934c4b4820.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7821314c57220b19a189530d48a64934c4b4820.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 08:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211743

Hi,

On Wed, Feb 19, 2025 at 03:59:59PM +0000, Richard Purdie wrote:
> On Thu, 2025-02-06 at 16:44 +0200, Mikko Rapeli via lists.yoctoproject.org wrote:
> > psplash-start.service expected to find /dev/fb0 and failed
> > if device was not found. This failure breaks systemd
> > oeqa runtime test with "runqemu nographic". Starting
> > psplash based on detected framebuffer device fixes systemd
> > boot status and systemd oeqa runtime tests for qemu
> > boots with and without graphics support.
> > 
> > Note that psplash-systemd.service still depends on /dev/fb0
> > so startup with multiple framebuffer devices may not work
> > correctly. I don't have devices with multiple framebuffer
> > devices to test with.
> > 
> > On qemu machine with graphics, psplash displays yocto
> > logo correctly and boot progress bar as well. Once boot completes
> > to systemd "running" state, the logo is replaced by login prompt.
> > On qemu machine without graphics, boot completes without psplash
> > or failures and login over serial console works normally.
> > Tested with genericarm64 machine poky-altcfg distro and core-image-base
> > image on qemu. AMD kv260 tested as well but graphics stack is not yet
> > working there so boot is similar to qemu without graphics.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �meta/recipes-core/psplash/files/fb.rules���������������� | 1 +
> > �.../{psplash-start.service => psplash-start@.service}��� | 5 ++---
> > �meta/recipes-core/psplash/files/psplash-systemd.service� | 8 +++-----
> > �meta/recipes-core/psplash/psplash_git.bb���������������� | 9 ++++++---
> > �4 files changed, 12 insertions(+), 11 deletions(-)
> > �create mode 100644 meta/recipes-core/psplash/files/fb.rules
> > �rename meta/recipes-core/psplash/files/{psplash-start.service => psplash-start@.service} (84%)
> 
> Unfortunately I think this has introduced an intermittent QA test
> failure showing up in meta-arm in particular. Examples:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/994/steps/22/logs/stdio

Feb 19 01:26:42 sbsa-ref psplash-systemd[261]: Error unable to open fifo

This means psplash.service did not start or did not yet create it. Can I somehow see the
build and boot configuration?

Feb 19 01:27:12 sbsa-ref systemd[1]: /usr/lib/systemd/system/psplash-systemd.service:8: Unknown key 'ConditionFileExists' in section [Unit], ignoring.
Feb 19 01:27:26 sbsa-ref systemd[1]: /usr/lib/systemd/system/psplash-systemd.service:8: Unknown key 'ConditionFileExists' in section [Unit], ignoring.

psplash.service is of type notify and fifo is created before systemd is notified, but
the fifo creation could also fail due to other reasons which I can't see from the logs.

Fixing the condition will fix the systemd test failure but plsplash and progress
bar may have functional failures.

I will send a patch.

> https://gitlab.com/jonmason00/meta-arm/-/jobs/9155263483

This looks like something completely different:

2025-02-17 22:43:20 - INFO     - AssertionError: 3 != 0 : SYSTEMD_BUS_TIMEOUT=240s systemctl status --full --failed
2025-02-17 22:43:20 - INFO     - x dev-disk-by\x2duuid-38d0b388\x2d9989\x2d4744\x2d8a0a\x2d3e6be1135f5a.swap - /dev/disk/by-uuid/38d0b388-9989-4744-8a0a-3e6be1135f5a
2025-02-17 22:43:20 - INFO     - Loaded: loaded (/etc/fstab; generated)
2025-02-17 22:43:20 - INFO     - Active: failed (Result: exit-code) since Mon 2025-02-17 22:41:32 UTC; 20min left
2025-02-17 22:43:20 - INFO     - Invocation: 6e51ad1d846f4e8cbb129f05d75ac240
2025-02-17 22:43:20 - INFO     - What: /dev/disk/by-uuid/38d0b388-9989-4744-8a0a-3e6be1135f5a
2025-02-17 22:43:20 - INFO     - Docs: man:fstab(5)
2025-02-17 22:43:20 - INFO     - man:systemd-fstab-generator(8)
2025-02-17 22:43:20 - INFO     - Mem peak: 1.7M
2025-02-17 22:43:20 - INFO     - CPU: 198ms
2025-02-17 22:43:20 - INFO     - 
2025-02-17 22:43:20 - INFO     - Feb 17 22:41:32 sbsa-ref systemd[1]: Activating swap /dev/disk/by-uuid/38d0b388-9989-4744-8a0a-3e6be1135f5a...
2025-02-17 22:43:20 - INFO     - Feb 17 22:41:32 sbsa-ref swapon[210]: swapon: /dev/sda3: swap format pagesize does not match.
2025-02-17 22:43:20 - INFO     - Feb 17 22:41:32 sbsa-ref swapon[210]: swapon: /dev/sda3: reinitializing the swap.
2025-02-17 22:43:20 - INFO     - Feb 17 22:41:32 sbsa-ref swapon[212]: mkswap: invalid option -- 'U'
2025-02-17 22:43:20 - INFO     - Feb 17 22:41:32 sbsa-ref swapon[212]: BusyBox v1.37.0 () multi-call binary.
2025-02-17 22:43:20 - INFO     - Feb 17 22:41:32 sbsa-ref swapon[212]: Usage: mkswap [-L LBL] BLOCKDEV [KBYTES]
2025-02-17 22:43:20 - INFO     - Feb 17 22:41:32 sbsa-ref systemd[1]: dev-disk-by\x2duuid-38d0b388\x2d9989\x2d4744\x2d8a0a\x2d3e6be1135f5a.swap: Swap process exited, code=exited, status=255/EXCEPTION
2025-02-17 22:43:20 - INFO     - Feb 17 22:41:32 sbsa-ref systemd[1]: dev-disk-by\x2duuid-38d0b388\x2d9989\x2d4744\x2d8a0a\x2d3e6be1135f5a.swap: Failed with result 'exit-code'.
2025-02-17 22:43:20 - INFO     - Feb 17 22:41:32 sbsa-ref systemd[1]: Failed to activate swap /dev/disk/by-uuid/38d0b388-9989-4744-8a0a-3e6be1135f5a.

So these could be fixed by adding util-linux-mkswap to the images instead of
relying on busybox?

I will send a patch.

> but it doesn't always fail. There were other failures if you look
> through the meta-arm builds.

Link to the builds?

Cheers,

-Mikko

