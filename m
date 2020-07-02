Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.3571.1593685417198389275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 03:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JfDOZIA3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id r12so27448075wrj.13
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2020 03:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5kpXhdskrE5b9GZqYydA0lM81Xwd0r6TY6uuH49VMcA=;
        b=JfDOZIA364alXwuluunVMzmVAHMzLYJx7ROWL/9etmHbt3rqc6OEMY1Po19hbM3YPL
         HbQdrtQx7FllpHNE5nu+aDIrG7vNM1Em/Hj+2NTZYai0JTompC/mQ9Ko7p3p8s/ZoH5B
         GacRZnpE7Y92RFFIpYVdT+23B9rMyJg+6TArI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5kpXhdskrE5b9GZqYydA0lM81Xwd0r6TY6uuH49VMcA=;
        b=a3NV5qA/mLg6rqu79grX63g0qQZWysXeodybKPAg0QaRQQXDGWyivcDKmjgndUQy4f
         AW6ZjfGsvVPOeJDVLL8mPD15sNQXOXhkJoXVjC6ovETf+TyKHlrrG9jbIMsu+ZpzfdEh
         rx/TghurN3kH1XlXlvrJ+xhaQjIOfn03q30EpV/97710E+rRir0oRMcHktwXImIv84bF
         o2aKw8rzHgg+64Xqf/aTz7Ep5RT+76dhhUZQhBWRCrqOSooV0rz98Lju8JUNc5Qk/+ya
         k4r391Spk8fQVvilrTOlKqJlA2G5Fjlbztp8UYqzBwdVyCdAwTDzB5MQDf1hH5KVHvQ+
         G3YA==
X-Gm-Message-State: AOAM533OlQS6IIwD4TQroCPm/czVwREf5aMLsbrBaRrBWN/qeK/pZP+U
	C4XmRqlzAbJM6NSPok6cierVkA==
X-Google-Smtp-Source: ABdhPJwN6zPrLzCDC8UC1BWBAYpNy3xk5Hj+geVg6fmSV8MChCF5gQYHY50D/LHlkV0aJP6UKI0sDg==
X-Received: by 2002:a5d:4202:: with SMTP id n2mr29969811wrq.171.1593685415690;
        Thu, 02 Jul 2020 03:23:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id j15sm1206209wrx.69.2020.07.02.03.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 03:23:34 -0700 (PDT)
Message-ID: <20d17c0008c372079747b7504da389c6403d1441.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/1 v3] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Xu, Yanfei" <yanfei.xu@windriver.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 02 Jul 2020 11:23:33 +0100
In-Reply-To: <ac5b5d5b-13df-5c4b-b293-fd0965e508ff@windriver.com>
References: <20200619114727.40142-1-yanfei.xu@windriver.com>
	 <20200619114727.40142-2-yanfei.xu@windriver.com>
	 <CADkTA4NApB19MmwAWP3Mgtf+zNEtsPuSxL7h19S8c3FNoC2o4Q@mail.gmail.com>
	 <144b99d5a5b327d660925ff5ee18139d7dc088c3.camel@linuxfoundation.org>
	 <7d7b57ca-5419-971d-6701-4cd2e8958960@windriver.com>
	 <b456775facefdc593552db94bf2de51f5725aa97.camel@linuxfoundation.org>
	 <77c7e877-527a-3e39-ad58-2b34c4cffa05@windriver.com>
	 <764ae03515c1e73c6eaa394a68b4b98877b38577.camel@linuxfoundation.org>
	 <777044a4-8a9b-ea9b-fc05-636caa004c3d@windriver.com>
	 <d2119fa2-2d1f-27c6-bf73-055422e6819b@windriver.com>
	 <CADkTA4NHXAF3Hfm9ryw5OvrM+pFM3FTjQNpvhpGfTyiiYEDb8g@mail.gmail.com>
	 <ec894ebd-6116-4e68-04b3-6be656108405@windriver.com>
	 <992d7721671aa464f6a59209d0346a55dc569db6.camel@linuxfoundation.org>
	 <ac5b5d5b-13df-5c4b-b293-fd0965e508ff@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-07-02 at 17:49 +0800, Xu, Yanfei wrote:
> 
> On 7/2/20 3:46 PM, Richard Purdie wrote:
> > On Thu, 2020-07-02 at 10:43 +0800, Xu, Yanfei wrote:
> > > On 7/1/20 9:42 PM, Bruce Ashfield wrote:
> > > > On Wed, Jul 1, 2020 at 4:22 AM Xu, Yanfei <yanfei.xu@windriver.com>
> > > > wrote:
> > > > > 
> > > > > On 6/28/20 8:21 PM, Xu, Yanfei wrote:
> > > > > > On 6/25/20 12:18 AM, Richard Purdie wrote:
> > > > > > > On Wed, 2020-06-24 at 23:57 +0800, Xu, Yanfei wrote:
> > > > > > > > On 6/24/20 9:08 PM, Richard Purdie wrote:
> > > > > > > > > On Wed, 2020-06-24 at 09:47 +0800, Xu, Yanfei wrote:
> > > > > > > > > > On 6/24/20 5:51 AM, Richard Purdie wrote:
> > > > > > > > > > > On Tue, 2020-06-23 at 10:31 -0400, Bruce Ashfield
> > > > > > > > > > > wrote:
> > > > > > > > > > > > On Fri, Jun 19, 2020 at 7:47 AM <
> > > > > > > > > > > > yanfei.xu@windriver.com>
> > > > > > > > > > > > wrote:
> > > > > > > > > > > > > From: Yanfei Xu <yanfei.xu@windriver.com>
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Some filesystems don't support symlink, then you
> > > > > > > > > > > > > will get
> > > > > > > > > > > > > failure
> > > > > > > > > > > > > when
> > > > > > > > > > > > > you install or update the kernel rpm package. Now
> > > > > > > > > > > > > we use a
> > > > > > > > > > > > > copy
> > > > > > > > > > > > > of
> > > > > > > > > > > > > image for these filesystems instead of symlink.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Suggested-by: Bruce Ashfield <
> > > > > > > > > > > > > bruce.ashfield@gmail.com>
> > > > > > > > > > > > > Suggested-by: Richard Purdie <
> > > > > > > > > > > > > richard.purdie@linuxfoundation.org>
> > > > > > > > > > > > > Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com
> > > > > > > > > > > > > ---
> > > > > > > > > > > > >       meta/classes/kernel.bbclass | 19
> > > > > > > > > > > > > ++++++++++++++++---
> > > > > > > > > > > > >       1 file changed, 16 insertions(+), 3
> > > > > > > > > > > > > deletions(-)
> > > > > > > > > > > > > 
> > > > > > > > > > > > > diff --git a/meta/classes/kernel.bbclass
> > > > > > > > > > > > > b/meta/classes/kernel.bbclass
> > > > > > > > > > > > > index 20a0135fc9..1269b54343 100644
> > > > > > > > > > > > > --- a/meta/classes/kernel.bbclass
> > > > > > > > > > > > > +++ b/meta/classes/kernel.bbclass
> > > > > > > > > > > > > @@ -94,6 +94,22 @@ python __anonymous () {
> > > > > > > > > > > > >               d.appendVar('RDEPENDS_%s-image' %
> > > > > > > > > > > > > kname, ' %s-
> > > > > > > > > > > > > image-
> > > > > > > > > > > > > %s' %
> > > > > > > > > > > > > (kname, typelower))
> > > > > > > > > > > > >               d.setVar('PKG_%s-image-%s' %
> > > > > > > > > > > > > (kname,typelower),
> > > > > > > > > > > > > '%s-
> > > > > > > > > > > > > image-
> > > > > > > > > > > > > %s-${KERNEL_VERSION_PKG_NAME}' % (kname,
> > > > > > > > > > > > > typelower))
> > > > > > > > > > > > >               d.setVar('ALLOW_EMPTY_%s-image-%s' %
> > > > > > > > > > > > > (kname,
> > > > > > > > > > > > > typelower),
> > > > > > > > > > > > > '1')
> > > > > > > > > > > > > +        d.setVar('pkg_postinst_ontarget_%s-
> > > > > > > > > > > > > image-%s' %
> > > > > > > > > > > > > (kname,typelower), """
> > > > > > > > > > > > 
> > > > > > > > > > > > You were previously concerned about boot issues if
> > > > > > > > > > > > the
> > > > > > > > > > > > unversioned
> > > > > > > > > > > > image link/copy was deferred until boot. I don't
> > > > > > > > > > > > see a
> > > > > > > > > > > > summary of
> > > > > > > > > > > > why
> > > > > > > > > > > > that's no longer a concern in the v3 of the patch.
> > > > > > > > > > > > Can you
> > > > > > > > > > > > confirm
> > > > > > > > > > > > that it isn't an issue ? Is it simply because the
> > > > > > > > > > > > booted
> > > > > > > > > > > > image
> > > > > > > > > > > > isn't
> > > > > > > > > > > > installed via this package, and hence we are fine ?
> > > > > > > > > > > 
> > > > > > > > > > > I'm suspecting this patch is why we're seeing
> > > > > > > > > > > selftest
> > > > > > > > > > > failures:
> > > > > > > > > > > 
> > > > > > > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1055
> > > > > > > > > > > 
> > > > > > > > > > > 
> > > > > > > > > > Do you mean this patch has been applied? and introduce
> > > > > > > > > > new
> > > > > > > > > > issues?
> > > > > > > > > 
> > > > > > > > > Yes, I reverted it and retested and confirmed this patch
> > > > > > > > > causes the
> > > > > > > > > selftest failure in the link to the build above.
> > > > > > > > > 
> > > > > > > > OK, I am trying to analyse the log. But I haven't figured
> > > > > > > > out what
> > > > > > > > cause
> > > > > > > > it fialed， and how to reproduce it on my mechine. I'd
> > > > > > > > apprecate any
> > > > > > > > information.
> > > > > > > 
> > > > > > > The command to reproduce should be:
> > > > > > > 
> > > > > > > oe-selftest -r efibootpartition.GenericEFITest.test_boot_efi
> > > > > > > 
> > > > > > I've addressed this failure why due to boot partation in wic
> > > > > > doesn't
> > > > > > contain no-versioned image. This result is different from the
> > > > > > previous
> > > > > > I verified, because of the different configuraions in wks.
> > > > > > 
> > > > > > "--source" field in wks decides where the files in boot
> > > > > > partation come
> > > > > > from. So no-versioned image may come from ${IMAGE_ROOTFS}/boot
> > > > > > which is
> > > > > > installed by rpm package. Blow is the wks used by 'oe-selftest
> > > > > > -r
> > > > > > efibootpartition.GenericEFITest.test_boot_efi'
> > > > > > 
> > > > > > bootloader --ptable gpt
> > > > > > part /boot --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/boot
> > > > > > --fstype=vfat --label boot --active --align 1024 --use-uuid
> > > > > > --overhead-factor 1.0
> > > > > > part / --source rootfs --fstype=ext4 --label root --align 1024
> > > > > > --exclude-path boot/
> > > > > > 
> > > > > > Hence we still should keep the no-versioned iamge in kernel-
> > > > > > image*.rpm
> > > > > > which is like the previous v2 patch.
> > > > > > 
> > > > > Any opinions? It does cause the kernel rpm larger. However, the
> > > > > kernel
> > > > > image is not always large, only a few MB. And it will be changed
> > > > > to
> > > > > symlink when installed on targe. So this patch's only negative
> > > > > effect
> > > > > is the little increasement about update payloads.
> > > > 
> > > > I'm trying to follow the description that you had about the
> > > > oe-selftest and I'm missing something.
> > > > 
> > > > Can you describe it again ? In a way that someone not familiar with
> > > > that the selftest is seeing as a failure can grok ?
> > > > 
> > > > i.e. in the selftest configuration are we not getting the
> > > > (un)versioned kernel image because the symlink (or copy fallback)
> > > > is
> > > > in an on-boot post install hook ? And the test is looking for the
> > > > versioned/unversioned kernel image at image construction time ?
> > > > 
> > > > So that leaves us at either installing both the versioned and
> > > > unversioned, or some sort of package install time testing of the
> > > > target filesystem ? Does that partition exist at package install
> > > > time
> > > > ? Is that the approach we tried in v1 of the patch (I know v2 was
> > > > keeping both as copies in the package, and converting it to a
> > > > symlink
> > > > on boot).
> > > 
> > > Sorry for the uncleared discription.
> > > 
> > > For the os-selftest failure: The failure happened at qemu booting
> > > with
> > > its wic image. Qemu could not find the unversioned kernel image in
> > > wic
> > > image for booting itself ,then caused the test failed.
> > > 
> > > Why the booted partition in wic image doesn't contain the unversioned
> > > kernel image? Cause the wks can decide where the unversioned kernel
> > > images in wic image comes from. For this test, it comes from
> > > ${IMAGE_ROOTFS}/boot which is installed by kernel rpm package.
> > > Actually
> > > it didn't get unversioned kernel image because the symlink（or copy
> > > fallback） is in an on-boot post install hook.
> > > 
> > > Hence we should keep a unversioned kernel image in kernel rpm
> > > package.
> > > And patch v2 did it.（ v1 and v2 are similar, but v2 improves print
> > > messages.）
> > 
> > This does bring us to a bit of an impasse as I don't really like the
> > idea of duplicating the kernel binaries twice in the packages just to
> > work around fat filesystem limitations.
> > 
> > Today its this file, you could argue we have to replace a load more
> > files with duplicate copies and postinstalls which would seem to be the
> > wrong direction to go in.
> 
> Yes, I agree that duplicate copies is not a good way to solve these
> symlink problems for normal rpm. Users should be awared the
> disadvantages of vfat filesystem. But kernel rpm maybe more important
> than others rpm? so we could make its compatibility more all-around?
> 
> > Which tools does the extraction of the files onto this fat system?
> > Could we ignore the symlink errors there and rely on a postinstall to
> > create if not already created?
> 
> It may not. Cause if the extraction of the files runs failed, the
> postinstall of this rpm package won't excute. So...

I wonder if the preinst could check for vfat and do something like a
temporary mount to work around the issue?

Cheers,

Richard

