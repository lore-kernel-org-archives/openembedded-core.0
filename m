Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69323C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 05:03:51 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.13177.1744693429589787617
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 22:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Ybd+XDZc;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-549967c72bcso6464447e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 22:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744693427; x=1745298227; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kZ6NzqXs82Dtt8r+RcUYYW5+gO/xZKZxmcr1I7R1yFU=;
        b=Ybd+XDZcwG7bs2s9hnTKqJdRtdHdNKh7rrQl7VRbAx3c//cbxOZmk8MZosofplJwgA
         83oQWMxnmqTltlBYPyEu6s1Eio/FHzqmpE2UpX9GNiymSHLXxLWu/o9scosict+Tg36x
         I220FmULNiz4QEGlL9JNK+qhjp34+L0luE+F6Cy8989Y79fl6AnJTFTAQ2Kzw9IZVLf4
         goVBF59Al+9/1CpyxTvCGr8VzI2+kBTH/xsobiqoSfN4zsGHeITbta1RoXicaO/BM/iL
         LwtQniodrVpsijjVV6InkJE0TPRvu7NPeqZOKM++ourEGW0mwAmHFOwk1qL+yZmAkoJ5
         MtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744693427; x=1745298227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZ6NzqXs82Dtt8r+RcUYYW5+gO/xZKZxmcr1I7R1yFU=;
        b=aRruVK4NyHOQIMtu4MEerCpTGY4OW7g/H29UDp8JpBsMZgAy8bI5FiXssJk1ss4W8e
         yZ7sxQTJk/GMljuBBSVM4qKLpZfVX4mxJrhTnguU3JWjXlCGY6mZCsNO25b+1pxCHCC3
         R8ffZVHxuTobXAyQV98PUY6KQ8uttdIRxwBi3bduwZAoXKbOKQo1KUMcECrTNlgE+737
         pkzMunhsOZ7xg0UwTX5zxY4bPHi+qCAN03I5HXkVq38VvNhD5p03h1dV6WILb/yL4dHt
         NqyELmuhZhmalEDNQktmHgGHsN7AbspNT5l6+LNflDLe+7b+CC/mPwIjGQupftNXQ9z8
         0I1Q==
X-Gm-Message-State: AOJu0YyGcMEI++LCJt82bMHAuhSgEmhTS3p7hkbOoyalmEelqUOjd4xj
	+qcFnPsQbKMyvZF7Gtu1gtp+Ml5kd6YKiL9mLzm5Un0TUw2i+YHdc/zv1EPmZ2mK0m7xq5/UR/g
	Zdsg=
X-Gm-Gg: ASbGnctOYDRNfyf4DtWdjkzESCMuemVqgi2OjoV58zlASd5xYBJdGnC9OIdaJYAUakS
	oLEw0TfH/mMX6/8kJiffA7Y7iJQgqsEUMGPBndvMmHdMX+mUUg726qljWJ9nl7CQd7afljCYUSH
	F1Plh+/CD0/WptA15KeTZBOgM1IpZDHNRQdBxYhRDKMDMoZ6CMCUxUtMzp2+CaqPAV//asCBW91
	w1Qac6lXqgoNgq84032pLvandfu80n50s72lQtMYXKPj2QzbUfmC9hzdQ2N4ilwInw7iTauOjnn
	SthGRBrFwmHLpL4L2xVmj3T8/gneJGL8q+Tm2IAWb0MBPIROPP/9F+6VxADHz3JuLd+Dhsnuqg=
	=
X-Google-Smtp-Source: AGHT+IHRN7r9wzpG2/YVDBBzIo6p0zIDJWazfZpgCeGYPFcBOG0kp2FhkSeTwydbPhs7APhMJ7s0Vw==
X-Received: by 2002:a05:6512:3d1c:b0:545:ea9:1a1d with SMTP id 2adb3069b0e04-54d4528c4dfmr3877757e87.1.1744693427476;
        Mon, 14 Apr 2025 22:03:47 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123e52sm1298516e87.6.2025.04.14.22.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 22:03:47 -0700 (PDT)
Date: Tue, 15 Apr 2025 08:03:45 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 10/11] wic bootimg-efi.py: fail build if no
 binaries installed
Message-ID: <Z_3osZPJY0nbMlVh@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-11-mikko.rapeli@linaro.org>
 <20250414205118.GC9290@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414205118.GC9290@localhost>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 05:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214820

Hi,

On Mon, Apr 14, 2025 at 04:51:18PM -0400, Trevor Woerner wrote:
> On Fri 2025-04-04 @ 07:29:31 PM, Mikko Rapeli via lists.openembedded.org wrote:
> > With systemd-boot, some builds included correct EFI
> > bootloader binaries and some not. Thus some builds
> > booted and some not. Check that some boot binary
> > was installed so that build fails if none were installed.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  scripts/lib/wic/plugins/source/bootimg-efi.py | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> > index 96c710bf77..20b1c36a46 100644
> > --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> > +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> > @@ -341,6 +341,9 @@ class BootimgEFIPlugin(SourcePlugin):
> >                      cp_cmd = "cp -v -p %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[8:])
> >                      out = exec_cmd(cp_cmd, True)
> >                      logger.debug("systemd-boot files:\n%s" % out)
> > +                # must have installed at least one EFI bootloader
> > +                out = exec_cmd("ls %s/EFI/BOOT/boot*.efi" % (hdddir), True)
> > +                logger.debug("Installed systemd-boot files:\n%s" % out)
> >              elif source_params['loader'] == 'uefi-kernel':
> >                  kernel = get_bitbake_var("KERNEL_IMAGETYPE")
> >                  if not kernel:
> 
> At first glance I do not see how this code is checking for an invalid
> scenario, and then failing the build should it be detected. Or are you
> expecting the build to fail if the "ls" fails?

Yes, the shell commands run in "set -e" and failing "ls" will fail the build.

Cheers,

-Mikko

