Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD0DC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 10:19:06 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.4867.1745403539909855144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 03:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hWk2W/TM;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54b10956398so992336e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 03:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745403538; x=1746008338; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nn/3u/SoSl92rLevX4uC1cN0bmcenZegNbzprzek1F8=;
        b=hWk2W/TM8+kL+aKCPufu2zpr8HDcRmWFlbvQLiwD82QQUBk66qBxVARWHDhhTj/+0X
         BCym4Dfnjnq98C0mkYkWxsvSDldBMmzyIFyePpR+7+72NE0wrMjkLE+0zpkhCRJPbVjB
         83RjBI0p/vfX2UTFUedJESEP1bd2gzfWLTE7+XzXzfejiPiLaFqYkiq0UjF+TOf2xdxe
         OJ+tt1niyhb4PcGt2O2nPNd4Lyj4ggv0+fIZI1zn7P661ugBFn2zoxqSiQRNEJpXqDmY
         OKDDBuRkLVW4eVnre/rhuOWJrWWDXWSlrOErvOmO/sn+uynNwEw1RZiUk7Al9CvTGI6K
         4ceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745403538; x=1746008338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nn/3u/SoSl92rLevX4uC1cN0bmcenZegNbzprzek1F8=;
        b=p9fK54AXaUZWWTHn/p8cjiGRAbzZIMECrJsp7aHxPbIdNSE7P2k7kpyAnXiMIYr3EF
         4+TcvbEFO+1WQN1kURLVnGauktyXTSal/GchhFRvVJdirjoxDBdnK8GcnTwabKrQ+A+9
         kkdbOJ1vmJLAe9BZvToxHD6Agmlb32tc7/QdIZIBIwD75SVdb4YZVV4uay03+38qmtQB
         rRKAbHdClq2rLyv1tytpjPA+Vex/O8d0s+M3SQpV2GtA+36xiHH0flFkpdFVciPSFP9P
         cbecHh+X3wmX19lMYI/jNhu5ApaZ1tQWTPlAbfc+ZqLXSmMc4Gkr/qvFCZ8kG1xTrJiY
         Ohsw==
X-Gm-Message-State: AOJu0Yyy7mUc6b7RfiBSH/IHsiNL8y1z7tfbaiCiaIKXq1XvRKVaWBq9
	RkndPeNDLqZRBYz5NmL3x1BZG2Jcf1OKeUpXykdbYqtMVzCnStlc4/tSVUZ0eUk=
X-Gm-Gg: ASbGncuUqSXSYGDk8kTC9Gm4PcK3vo+04TvnxtOUcwnDK7M0yx6/cDiatfDf3ACwdll
	Vy9AkVMnmu6GZwNpQonQpPWel/nt4l6QJJE6sEvc8MmHMMPVGSu+m72vm+H5Pua16LyFfhwmfqP
	VEV1FDJF2l8H1Y3R296zm7ng6cQ+PF8QSDjrqhQTtUzAH8zzd4ih2KHcGsNMypiAK69InUAQdRI
	4G6SjFombNhD/G//cbbYFUv7RIlMlPK5dxKpJRMFfVdUopuTviiKPi3c4GGqmu6WimDvBcIB7Zo
	v3CrUiVz/udnOn5EtCYpQQtV4cwFqs+OPF/e6wFiBmoTnTC6pO9bZ6MVlT9VIQNOU5o3UFZq0BY
	0vDYKYBM4
X-Google-Smtp-Source: AGHT+IFr4Z2n/Sr6P/Xvo4DnnwZfKTk1nzk4a84bSpi6JbXutreyLd2ZT41GMP+7RXZKdu83/TEZ/Q==
X-Received: by 2002:a05:6512:31c6:b0:549:8ccd:4538 with SMTP id 2adb3069b0e04-54e76b09ab6mr802993e87.26.1745403537688;
        Wed, 23 Apr 2025 03:18:57 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e52534asm1457332e87.14.2025.04.23.03.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 03:18:57 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:18:56 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, bill.mills@linaro.org
Subject: Re: [PATCH RFC walnascar 1/3] systemd: enable getty generator by
 default
Message-ID: <aAi-kEIeR6mMYBBF@nuoska>
References: <20250422190053.3244331-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422190053.3244331-1-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 10:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215274

Hi Ross,

On Tue, Apr 22, 2025 at 08:00:51PM +0100, Ross Burton wrote:
> Until recently, even when the getty generator was disabled in the
> systemd recipe it was actually still active.  This was because the old
> behaviour was to delete the serial-getty template unit if the generator
> was disabled, but the systemd-serialgetty package shipped then shipped
> the same files so the generator continued to run.  This was a bug in the
> original commit[1] so this behaviour has been present since 2016.
> 
> My recent fixes[2] changed this: if the getty generator was disabled
> then the generator itself is deleted. This makes the actual behaviour
> match the intention, but the consequence was to demonstrate that some
> modern platforms were relying on this unexpected behaviour: specifically
> the genericarm64 BSP which intends to support a number of virtual and
> physical boards with a number of serial console ports that are not
> really suitable to be hardcoded into SERIAL_CONSOLES:
> 
> - ttyS0
> - ttyAMA0 (AMBA PL011 uart)
> - ttyS2 (BeagleBone Play, S0 and S1 are internal)
> - hvc0 (KVM)
> - ttyPS1 (AMD KV260)
> - And most likely more
> 
> Restore the existing behaviour by explicitly enabling the serial getty
> generator: this means that systemd will automatically bring up a getty
> on the first serial console it finds.

Is there a need to be backwards compatible this much? Many things may break
or get refactored on master branch between releases and this is just one of them.

Then with these patches there still is the bug/issue seen in previous state too
where systemd tries to start agetty on all SERIAL_CONSOLES defined
at build time which slows down boot to "running" or "degraded" state
by more than one minute. This happens also on qemu where core-image-base
(I've added systemd-analyze with dependencies there to measure these):

root@genericarm64:~# journalctl -b -a|grep tty | tail -15
Apr 23 09:39:31 genericarm64 systemd[1]: dev-ttyS1.device: Job dev-ttyS1.device/start timed out.
Apr 23 09:39:31 genericarm64 systemd[1]: Timed out waiting for device /dev/ttyS1.
Apr 23 09:39:31 genericarm64 systemd[1]: Dependency failed for Serial Getty on ttyS1.
Apr 23 09:39:31 genericarm64 systemd[1]: serial-getty@ttyS1.service: Job serial-getty@ttyS1.service/start failed with result 'dependency'.
Apr 23 09:39:31 genericarm64 systemd[1]: dev-ttyS1.device: Job dev-ttyS1.device/start failed with result 'timeout'.
Apr 23 09:39:31 genericarm64 systemd[1]: dev-ttyS0.device: Job dev-ttyS0.device/start timed out.
Apr 23 09:39:31 genericarm64 systemd[1]: Timed out waiting for device /dev/ttyS0.
Apr 23 09:39:31 genericarm64 systemd[1]: Dependency failed for Serial Getty on ttyS0.
Apr 23 09:39:31 genericarm64 systemd[1]: serial-getty@ttyS0.service: Job serial-getty@ttyS0.service/start failed with result 'dependency'.
Apr 23 09:39:31 genericarm64 systemd[1]: dev-ttyS0.device: Job dev-ttyS0.device/start failed with result 'timeout'.
Apr 23 09:39:31 genericarm64 systemd[1]: dev-ttyS2.device: Job dev-ttyS2.device/start timed out.
Apr 23 09:39:31 genericarm64 systemd[1]: Timed out waiting for device /dev/ttyS2.
Apr 23 09:39:31 genericarm64 systemd[1]: Dependency failed for Serial Getty on ttyS2.
Apr 23 09:39:31 genericarm64 systemd[1]: serial-getty@ttyS2.service: Job serial-getty@ttyS2.service/start failed with result 'dependency'.
Apr 23 09:39:31 genericarm64 systemd[1]: dev-ttyS2.device: Job dev-ttyS2.device/start failed with result 'timeout'.

root@genericarm64:~# systemd-analyze 
Startup finished in 2.405s (firmware) + 5.109s (loader) + 10.315s (kernel) + 1min 34.041s (userspace) = 1min 51.872s 
multi-user.target reached after 1min 34.035s in userspace.

Thus I think this breaking change is fine for master branch and upcoming
release and that anyone expecting different, more robust behavior should just use
the systemd agetty generator.

For genericarm64 I think https://lists.yoctoproject.org/g/poky/message/13592
is the way to go to fix both completely missing agetty
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15830
and the slow boot time. Both this series and
https://lists.yoctoproject.org/g/poky/message/13592 applied does not
seem to work since SERIAL_CONSOLES is now used all the time, so delayed
boot issue remains unfixed.

The boot time is important because testing on target HW should not start
before system is a stable state which for systemd is "running" when all services
succeed or "degraded" when something went wrong. Spending one minute or more, doubling
the boot time, due to tty detection timeouts is not nice when udev has already scanned
all buses and loaded needed drivers (multiple times, once in initrd and once in
main rootfs).

For manually detecting this without systemd-analyze, login to target over serial
console once prompt appears and see that "systemctl status" shows "starting"
status for a long time after everything already calmed down, and
"journalctl -b -a" eventually shows the tty timeout messages. The issue happens
on qemu and on real target HW like AMD KV260.

Cheers,

-Mikko

