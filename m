Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BD7C83F1A
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 02:27:10 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.3344.1753324019782016431
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 19:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=b2SwUryz;
 spf=pass (domain: underview.tech, ip: 209.85.128.45, mailfrom: vince@underview.tech)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so5344335e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 19:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1753324018; x=1753928818; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkwLnOFTjJ9EfytMMaiHlFIGtS1ylt7pQQyWWoWQHk4=;
        b=b2SwUryzqWAxSxqE7MDCqTdjN09UoA8tHfKrtl/kpmR+KLD1FqZlWu+v9vaCOhrAxy
         TjmXqd7XrxfB8pDkOdbe8L7U4jidpj51doSGdmg47THTK+31du1egtd0vUBb/WWh1zD1
         ECKRvE9iXtQkW2c/ecABqZ8kDBwHfOn9FwLaUwb/hLnN+PwF2iY97c194nxMRNUmd/EY
         Nwr35zn/CUEq29cHEvCtwClofUhvbv3f+iohxyw0ICiSMQW0PRloGaIICYE3rUfyHUV1
         2AGN1tIkSk5PGsgtaCUOEH249+XCGsw2+I80kaqc+fJal7Hz2GrYBN898FBekmjFbjHj
         g2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753324018; x=1753928818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkwLnOFTjJ9EfytMMaiHlFIGtS1ylt7pQQyWWoWQHk4=;
        b=KyrdwHXIANvZlNbnerFU16y1K+EZoM8vXBOynl/D8lo6PFq6U1WsR6Ss+maUSi4dqU
         OMzSjLsM2vJporLFYrGoMQGtFrtpmSZLClMyeTtHQbwPsmhVunXDIJKJl3KR/+zoQk9E
         TEahVNlzx/QvLac75H5Ea8lFl9PJ0L1i7MtT6ZI4sENWgeZ5XclM7Uo/jj1RjEpxRfsi
         +H6IF9ovmf6IbhUn3k9EvPhsp8i9ItNyMVK+QUDl89yvg1WHwyMQufKqdJQaFBuy5b9e
         HX+Xd2SxYV72VviV76UqgULZUROid1x5ZXHcfS/4M6uL9319uzaX4kMKGNFzTGDL8Mlu
         1Jjw==
X-Gm-Message-State: AOJu0YxaWic8IQCbb6blzY9gr+Ciau+V3G1IuG8ih1fmbxGEvIBtgsBJ
	cu0PGbinrfIExuFcFtltIPelk8PeOcc8JVJTn16fYw3InIdpDBB4F8tPQvFb8k6nyzu3+FQwrKU
	2aNhx9ptA4CvdrrY32ciSYms9j4HedfxzU7CNBEQ6IA==
X-Gm-Gg: ASbGncsXpeqJAf8jdgOJtp/cwE04n0UgDVFIFau2xVeO8boTI63jSpa8Stdw1XkNpz5
	rmGEiLdbm6sYDc06Uq+q9ZgnP64KKoLdf9hrcOdi35HOSoPlm+7yhm/3WPHW4pyXRm2WgGlDk4U
	Q03exJQgaJ9LRoRXOb159kxGESxYrIpWuwe/C1rJ06ngc4u+/r2tVCnzvxHJ0wQfd7sZ53s0NaK
	AWbZBCunt/EKXihwwWMMw+UBvLMYGco2mzzeBo=
X-Google-Smtp-Source: AGHT+IEgc7l2EXD04OgDYm4tpigFsoUVzK3QRXyxFi7Nw2jXzmE12EAXOXKSCe2xgjKMi2R1qG1x6PAYew4ef+85Wgs=
X-Received: by 2002:a05:6000:4211:b0:3a4:f7e3:c63c with SMTP id
 ffacd0b85a97d-3b768c57b33mr3278362f8f.0.1753324017347; Wed, 23 Jul 2025
 19:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250721015141.3599063-2-vince@underview.tech> <DBJ72I6DNDD2.2K9W47CYQ5ZZ7@bootlin.com>
In-Reply-To: <DBJ72I6DNDD2.2K9W47CYQ5ZZ7@bootlin.com>
From: Vincent Davis <vince@underview.tech>
Date: Wed, 23 Jul 2025 22:26:45 -0400
X-Gm-Features: Ac12FXxOHB9YWxhDkV2SeRSyVL5X8rm2d3u1OrSvJ7R3NsPYOBOL7N5JNa3Tjf0
Message-ID: <CAPQx_gORJDSdFP8sS9ft705BS+uiFGvi_ZnDBDNxTdqepDAsgw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/3] bootimg_pcbios: support grub legacy bios boot
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 02:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220816

Was able to replicate after downloading poky.

Weird that STAGING_LIBDIR isn't set.

I have a hack to locate the target specific grub modules folder, but I
don't want to push that.

Asking for help on how we can set STAGING_LIBDIR as it should be set?
Appears to be contained in WIC_VARS.

Or should we consider updating SourcePlugin class functions parameters
to include both native_sysroot and target_sysroot?

On Wed, Jul 23, 2025 at 1:44=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Mon Jul 21, 2025 at 3:51 AM CEST, Vincent Davis Jr wrote:
> > Due to the bootimg_biosplusefi source_params['loader']
> > had to be named source_params['loader-bios'] so not
> > to create conflict in the wics plugin.
> >
> > Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> > ---
>
> Hi Vincent,
>
> Thanks for your patch.
>
> It looks like this is breaking oe-selftests:
>
> 2025-07-22 16:34:57,116 - oe-selftest - INFO - wic.Wic.test_grub_install_=
pcbios (subunit.RemotedTestCase)
> 2025-07-22 16:34:57,119 - oe-selftest - INFO -  ... FAIL
> ...
> 2025-07-22 16:34:57,120 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeq=
a/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>            ^^^^^^^^^^^^^^^^^^^^^
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeq=
a/selftest/cases/wic.py", line 243, in test_grub_install_pcbios
>     runCmd(cmd)
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeq=
a/utils/commands.py", line 214, in runCmd
>     raise AssertionError("Command '%s' returned non-zero exit status %d:\=
n%s" % (command, result.status, exc_output))
> AssertionError: Command 'wic create /tmp/tmpfwvxcjfz.wks -e core-image-mi=
nimal -o /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-5967=
88/wic-tmp' returned non-zero exit status 1:
> ...
>
> ERROR: _exec_cmd: export PATH=3D/srv/pokybuild/yocto-worker/oe-selftest-d=
ebian/build/build-st-596788/tmp/work/core2-64-poky-linux/wic-tools/1.0/reci=
pe-sysroot-native/sbin:/srv/pokybuild/yocto-worker/oe-selftest-debian/build=
/build-st-596788/tmp/work/core2-64-poky-linux/wic-tools/1.0/recipe-sysroot-=
native/usr/sbin:/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-=
st-596788/tmp/work/core2-64-poky-linux/wic-tools/1.0/recipe-sysroot-native/=
usr/bin:/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-59678=
8/tmp/work/core2-64-poky-linux/wic-tools/1.0/recipe-sysroot-native/usr/bin/=
x86_64-poky-linux:/srv/pokybuild/yocto-worker/oe-selftest-debian/build/buil=
d-st-596788/tmp/work/core2-64-poky-linux/wic-tools/1.0/recipe-sysroot-nativ=
e/bin:/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-596788/=
tmp/hosttools:$PATH;grub-mkimage         --prefix=3D/boot/grub         --fo=
rmat=3Di386-pc         --config=3D/srv/pokybuild/yocto-worker/oe-selftest-d=
ebian/build/build-st-596788/tmp/deploy/images/qemux86-64/embed.cfg         =
--directory=3DNone/grub/i386-pc         --output=3D/srv/pokybuild/yocto-wor=
ker/oe-selftest-debian/build/build-st-596788/tmp/deploy/images/qemux86-64/g=
rub-bios-core.img boot linux ext2 fat serial part_msdos part_gpt         no=
rmal multiboot probe biosdisk msdospart configfile search loadenv test retu=
rned '1' instead of 0
> output: grub-mkimage: error: cannot open `None/grub/i386-pc/moddep.lst': =
No such file or directory.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2009
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1941
>
> Can you have a look at these failures please?
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

