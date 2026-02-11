Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CD5E9E306
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 13:09:27 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18473.1770815360998476351
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 05:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jyd/FuSp;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-896f8feee14so37415146d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 05:09:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770815360; cv=none;
        d=google.com; s=arc-20240605;
        b=CoRNeLhcaoS2n4aEuJhi4F3Kcuc+fTxpv52DZq4n6TvtbyfiDOpGoQ0V79AABkdC7U
         KIAlHRXeFgfw03KyPROmSDxg6My/Bqr98O4W0/fpoPuvg0s1bMtQkcCZF052W3r2keRa
         gxmduNNQUHPGNrdkqD2xP/IJCtyBSP9dLtiuV/HHx5bVbRB1lG6RR4p96gcLhT/R4vLd
         M7SgQ9v3CD8MdMMhvOEnXGHPi3h1XYokhYmFSqq15kS0A61bV9MsK/jOSzwLLdPprJQI
         vqw/Gk7DnRiB51xEsTdPoDCPEOeGN/6sRX013G2ABEDiqV56dfl7KIIJwXAVpkfb2pRx
         B19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Kv9YfuQOAlPYuWy6pXJV9fM3al0HX0ofHUDMUrX7OZE=;
        fh=2t7TTomAO0aWxLEOylKBIMbQkH5Hjsgu14o9jMM4LAE=;
        b=icHQTu3xBm0yPNCKIoGzgJVR2lKUh/cPIFzmB1LBJjsPZgQ5CiVZjiszJQP88/M8zb
         fZGM4STOjUC/qsoc1icV6+VSWwrQT+IhFwhTw2NcsJH7qizqR+OA4rqwpBPkSVwLT8W+
         3kJEzsnn7rqWoHfGdT5G7P4YdaGFUTb39i2x5vgqTBaQRzrMWY9BLslZyAJPgdP9Nyqk
         LCjAXC6snyaVgINs4+HPI331zXtb2V8nWIEDPe/nAX3kw5FZAvHFvrzskcjmnk95a3Yz
         86zm7b3X8Plhw79VsUS9zHQOjuihBt8EefvlznywQcy4K50cSphJPwv0QUloFTLdlrjL
         jvCQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770815360; x=1771420160; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kv9YfuQOAlPYuWy6pXJV9fM3al0HX0ofHUDMUrX7OZE=;
        b=jyd/FuSp6Jgjgu7pYf1zNL+ZJM5UtkU2hxSGNVOo/SLgUk5dk+lQcB8M7hMEZiKsBg
         NFpOQt1cx8CUGaltav2+GebAqMD6r6/i4m5Heirm1nLxDQ7+yDCcu43gtcBe7mDE5lP0
         4rG2zDTAwfKzfdjHvepjAoL+/8RKBotO50/5mNQmhAoUx3DB/Oasj9eiOSAXmskel6Qm
         0ozkqw4qRtOtnBQZhf84rmpzbl/c+OB2fq1/aarqWiUkC2ZLvtaLaA6j3+sqN9PFTpHB
         oUFkL/S9ZA0k1RAt2z/L1sSqp2Po7w3a83fubazQZCGI96ZrFpHAbvpuOTxVHi7Czaf4
         vfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770815360; x=1771420160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kv9YfuQOAlPYuWy6pXJV9fM3al0HX0ofHUDMUrX7OZE=;
        b=F3ryYqSEve0UKxZ8NT/fKZ6cdx0/1393fpcQgSU7UBZ2nbbWKVueX6L3Jb4N3teLYg
         Ui3njePY5MleXkxo2yR4ktMEvVGccH/lXHke9yObar7BBba0VJnpwPhSkBySIZGdtNF6
         jVjvyId+feiTiDeKRYVP87MaJ4DCjkEOp9jnXjVsinsRJ1pXwd04G+XUs+AZO+6rjobM
         t73G9L1ykYfeCGRc61onDUmlpsodjH3g9kQ3F/xp5fO5uKqtMHgMNWrtpSmtvrJjtrLJ
         Er2RkPeGNOuCpu+RJG3Bbqok6cvKrCEsq3D0ijk/up+j6vGNn9mBCpZwePassKAhGT+X
         AWnQ==
X-Gm-Message-State: AOJu0Yz3dd3MhzbgxwY73TCoVxyHpsUclBYT8xUCqj0sktSIIsFffT/d
	wTcGEskxH4SeXAt68JweLv1ufn6kLyEx01CFBNYaDyCQzbKBxmksJHQZbvKDbuPs0yCE+2WWuCR
	tQN78O4XfFE6TQbmbgX4LC6FMp5mEEks=
X-Gm-Gg: AZuq6aJ9YvwaXZuOxacrdMycOOgUf/rio6t+xi1lHsARtMBG+g5yMw1gN2kGadTI1Fk
	gfvrZg3kL/2IqrY6BFxhUv6l06eYaDk56LQwbPHk5PIcvHT3LVPRhYMHpcSgvui1Y6jTp4zTo1m
	PfatgvelkD62N2TiBmLim6xKm0tZkqyDRRM2rQuJNCbLKhUR6WtQc9GZCmRsghki8WeirJSuBP1
	79klPOMHzloY6dfulgdbS/aEU9RfCRZRYJCc8f6ixHszHzwwt8OwkdGLvd8rqHs4uo1mky4v40r
	7pTNp574FdpoAbWXfU3UT9Bijpyg22KaVeVKE7izl6BN1i59l65O
X-Received: by 2002:ad4:5aa7:0:b0:896:f42f:bf27 with SMTP id
 6a1803df08f44-8970e58c60emr87408266d6.58.1770815359615; Wed, 11 Feb 2026
 05:09:19 -0800 (PST)
MIME-Version: 1.0
References: <20260207051305.2363194-1-Qi.Chen@windriver.com>
 <CANNYZj-0=nQQOLY1h1w2SH9PFOa8K63+wELwNB9KKHuEPu6S9w@mail.gmail.com> <91e636fb-455c-47db-88dc-5fb634a4485c@windriver.com>
In-Reply-To: <91e636fb-455c-47db-88dc-5fb634a4485c@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Feb 2026 14:09:07 +0100
X-Gm-Features: AZwV_QiaE72Z-ab9BxFx9lvIMV9_oU_2OmKQ1yQgv6IfY_PCn9Nzh6j_ItsWQN8
Message-ID: <CANNYZj9ATceukEZynuEDfUc-GNcD8hLgdy-8dPx0GrY4qq0HHQ@mail.gmail.com>
Subject: Re: [OE-core][RFC][PATCH] oeqa/selftest/sdk: add test_sdk_runqemu
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 13:09:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230989

On Wed, 11 Feb 2026 at 07:11, ChenQi <Qi.Chen@windriver.com> wrote:
> I guess you were still in a bitbake build environment when testing
> runqemu in SDK manually.
> That's why your command 'runqemu kvm slirp snapshot
> /path/to/images/qemux86-64' worked.

Not quite. I provided the path to the original yocto build's deploy
directory, which does work. It stops working if you copy the image
directory to somewhere else.

The issue is that runqemu reads qemuboot.conf in that directory which
hardcodes build-specific paths:

staging_bindir_native =
../../../work/x86_64-linux/qemu-helper-native/1.0/recipe-sysroot-native/usr/bin
staging_dir_host =
../../../work/qemux86_64-poky-linux/core-image-minimal/1.0/recipe-sysroot
staging_dir_native =
../../../work/qemux86_64-poky-linux/core-image-minimal/1.0/recipe-sysroot-native
tune_arch = x86_64
uninative_loader =
../../../sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2

Then the code checks them for existence, and tries to obtain them from
bitbake if they don't exist:

        # If the STAGING_*_NATIVE directories from the config file don't exist
        # and we're in a sourced OE build directory try to extract the paths
        # from `bitbake -e`
        havenative = os.path.exists(self.get('STAGING_DIR_NATIVE')) and \
            os.path.exists(self.get('STAGING_BINDIR_NATIVE'))

        if not havenative:
            if not self.bitbake_e:
                self.load_bitbake_env()

            native_vars = ['STAGING_DIR_NATIVE']
            for nv in native_vars:
                s = re.search('^%s="(.*)"' % nv, self.bitbake_e, re.M)
                if s and s.group(1) != self.get(nv):
                    logger.info('Overriding conf file setting of %s to
%s from Bitbake environment' % (nv, s.group(1)))
                    self.set(nv, s.group(1))

The above code indeed doesn't make sense: it gets STAGING_DIR_NATIVE
from bitbake (if bitbake is present), but then STAGING_DIR_NATIVE is
not used anywhere!

So going back to your proposed fix, is it possible to replace the
above sequence with something like this?

if not os.path.exists(self.get('STAGING_BINDIR_NATIVE')):
    logger.info('tell what is happening')
    if OECORE_NATIVE_SYSROOT is set:
      set STAGING_BINDIR_NATIVE from OECORE_NATIVE_SYSROOT + '/usr/bin'
      logger.info('tell what is happening')
    else:
      set STAGING_BINDIR_NATIVE from bitbake -e

This should cover all use cases:
- yocto or sdk environment or no environment at all, with image in
deploy directory (qemuboot.conf paths are valid)
- sdk environment with image in any directory (will set paths from
OECORE_NATIVE_SYSROOT)
- yocto environment with image in any directory (will ask bitbake -e for paths)

That way we can avoid reverting changes to run_bitbake_env: it should
either succeed or raise an error, and not just return nothing, as that
hides actual issues.

Alex




> See commands and output below (Pure SDK, no bitbake environment):
> """
> chenqi@HOST:/buildarea3/chenqi/SDK/Yocto [3][0] $ runqemu kvm snapshot
> slirp /buildarea3/chenqi/SDK/Yocto/qemux86-64/
> runqemu - ERROR - In order for this script to dynamically infer paths
>   kernels or filesystem images, you either need bitbake in your PATH
>   or to source oe-init-build-env before running this script.
>
>   Dynamic path inference can be avoided by passing a *.qemuboot.conf to
>   runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`
>
>   Bitbake is needed to run 'MACHINE=qemux86-64 bitbake -e  None', but it
> is not found in PATH. Please source the bitbake build environment.
> runqemu - INFO - Cleaning up
> runqemu - INFO - Host uptime: 16354810.08
>
> chenqi@HOST:/buildarea3/chenqi/SDK/Yocto [3][0] $ runqemu kvm snapshot
> slirp
> /buildarea3/chenqi/SDK/Yocto/qemux86-64/core-image-minimal-qemux86-64.rootfs.qemuboot.conf
>
> runqemu - ERROR - In order for this script to dynamically infer paths
>   kernels or filesystem images, you either need bitbake in your PATH
>   or to source oe-init-build-env before running this script.
>
>   Dynamic path inference can be avoided by passing a *.qemuboot.conf to
>   runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`
>
>   Bitbake is needed to run 'MACHINE=qemux86-64 bitbake -e  None', but it
> is not found in PATH. Please source the bitbake build environment.
> runqemu - INFO - Cleaning up
> runqemu - INFO - Host uptime: 16354858.44
>
> chenqi@HOST:/buildarea3/chenqi/SDK/Yocto [3][0] $ which bitbake
> chenqi@HOST:/buildarea3/chenqi/SDK/Yocto [3][0] $ echo $?
> 1
> chenqi@HOST:/buildarea3/chenqi/SDK/Yocto [3][0] $ which runqemu
> /buildarea3/chenqi/SDK/Yocto/sysroots/x86_64-pokysdk-linux/usr/bin/runqemu
> """
>
> Regards,
> Qi
>
> On 2/10/26 19:37, Alexander Kanavin wrote:
> > On Sat, 7 Feb 2026 at 06:13, <Qi.Chen@windriver.com> wrote:
> >> Add test case to ensure runqemu works in SDK.
> >>
> >> Using runqemu from SDK has been supported for many years. Add a
> >> test case to ensure we have no regression.
> > I set and ran this test. This indeed does not work:
> >
> > ====
> > alex@Zen2:~$ runqemu qemux86-64 kvm snapshot nographic
> > runqemu - ERROR - In order for this script to dynamically infer paths
> >   kernels or filesystem images, you either need bitbake in your PATH
> >   or to source oe-init-build-env before running this script.
> >
> >   Dynamic path inference can be avoided by passing a *.qemuboot.conf to
> >   runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`
> >
> >   Bitbake is needed to run 'MACHINE=qemux86-64 bitbake -e', but it is
> > not found in PATH. Please source the bitbake build environment.
> > ====
> >
> > The error makes sense, doesn't it? How would runqemu be able to figure
> > out where the image it needs to run is on the filesystem if all it has
> > is MACHINE value? We can try to hardcode something relative to SDK
> > installation, from some environment variable that SDK sets, but that
> > would be limiting: in the context of an SDK, images can be downloaded
> > and located anywhere.
> >
> > On the other hand, if you pass the path to the image directory to
> > runqemu, it works perfectly:
> >
> > ====
> > alex@Zen2:~$ runqemu kvm slirp snapshot
> > /srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/
> > runqemu - INFO - Decompressing
> > /srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-20260210110409.ext4.zst
> > to /srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-20260210110409.ext4
> > /srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-20260210110409.ext4.zst:
> > 43323392 bytes
> > runqemu - INFO - Continuing with the following parameters:
> > KERNEL: [/srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/bzImage]
> > MACHINE: [qemux86-64]
> > FSTYPE: [ext4]
> > ROOTFS: [/srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-20260210110409.ext4]
> > SNAPSHOT: [Enabled. Changes on rootfs won't be kept after QEMU shutdown.]
> > CONFFILE: [/srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-20260210110409.qemuboot.conf]
> > ....
> > ====
> >
> > So would it be okay to set the path to the image directory explicitly?
> > If you have several images in that directory, then you need to pass
> > the path to a particular some-image.qemuboot.conf file, and it will
> > still work:
> >
> > alex@Zen2:~$ runqemu kvm slirp snapshot
> > /srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-20260210110409.qemuboot.conf
> >
> > Alex
>
>

