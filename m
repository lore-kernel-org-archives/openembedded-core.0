Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0A32D6B2FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 11:53:45 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id hf12so423055vcb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 04:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Jc37i5nqbE2X4uqdYn0rpevnEytAqTp9nsb//977ZIQ=;
	b=cr5GjaYdya5BdD7u1/sZD6XAE45Zh7U2LeTfStx/6/cUpanzLEuFvwmeDPmQRgAg6a
	b/MPXNvEhodBCedpWoDDz8tYaVRSLXcpbeM24y51VQA6SI4sCmR37nwkUzCDL5B2AGqT
	Kt7w0hAE2qZiu+NNAj11oSyPUztIoT7aRamkX76FJbN/sMlz53XiBbGUEqfqUBvCv0Zs
	Rd6Xk4ZyMP7qG+V9azyhA9LtcUBM9rRiZm4dc4dPDE0hv3tLAzxB/eEKwwuZlG/LcWoC
	t4VjwBUhDp33GV7IJOnxtJMzlr0ow/pjnv2+QzV3ymacUV2rQpT+WSBc9kWCnQXVoAmo
	yErg==
X-Received: by 10.58.76.130 with SMTP id k2mr19919417vew.24.1374839625820;
	Fri, 26 Jul 2013 04:53:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Fri, 26 Jul 2013 04:53:25 -0700 (PDT)
In-Reply-To: <51EF70F6.6060800@windriver.com>
References: <cover.1374643300.git.rongqing.li@windriver.com>
	<947336a1ef2b936328ba6fcf519d55a4eda7085d.1374643300.git.rongqing.li@windriver.com>
	<8651FFE5-8500-4151-A4DF-BE780516C6CC@gmail.com>
	<51EF70F6.6060800@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Jul 2013 12:53:25 +0100
Message-ID: <CAJTo0LZn5-59UwuM3byj-LgSr8-SxzSqGaLnrzMpEjmR_O2Ayw@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
X-Gm-Message-State: ALoCoQnIJF/sq9ldVhfZ89WhR4vvJcc54uZjOLGBHn3By2rUACvUx2iuDpiewp8IFK3a97QjSzWu
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: ignore qemu output, and check its return code
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jul 2013 11:53:47 -0000
Content-Type: text/plain; charset=UTF-8

On 24 July 2013 07:15, Rongqing Li <rongqing.li@windriver.com> wrote:
> qemu is not segfaulting, except error message, it returns 0,
> and udevadm hwdb finished its task.

A bit of googling takes you to
https://bugs.launchpad.net/ubuntu/+source/qemu-linaro/+bug/758424.
Key quote:

"We only implement the futex syscalls if CONFIG_USE_NPTL. This isn't
defined for the i386 target (the necessary support in target-i386 for
pushing atomic insns up to the linux-user top level loop isn't
implemented). The upshot is that running multithreaded programs in
linux-user i386-target isn't supported and this is just one of the
symptoms."

Not segfaulting != working when multithreaded programs don't have
futexs.  We'll be seeing this more in the future now that GLib assumes
you can thread.

Ross

