Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2887EC87FDA
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 09:14:34 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.13901.1754298864129257226
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 02:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qtV0g2YK;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55b829c7f1aso5012500e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 02:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754298862; x=1754903662; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fGlB2sCH3b3W7QTb0mt+YKdzvjyNYjIrT8k4GFTx9pg=;
        b=qtV0g2YKRAQfaLXxZPNYIHrkpEV03FbI6pxELviqueSabQo5/Xa5bmM+gYVXdggVi9
         FwT5ksHXl70ZjS26O0oYsB0wlGuxAYGjKwMZ/7PMehb/p36zFm342AoBsAUB90fVc9Zk
         KOwvGsYoxZZ3r5DeICygEqHzxG8F29C3L01Hyz1Fo39ZLCMwfH6vr6OV8dstQyCVTjDV
         x3XBmu2Lxafc6eNoMCovIwSAqCveCa7O9KZe9xOmDRGSWgJp1wSguNDiYC9LlHT8o4/l
         TdqVnMCqaoBM3mi0MtozY/NU2ZiYldSJMXg+faKPmreI4AXXgfKafS6Zw3O7LfmTeVfy
         VR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298862; x=1754903662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGlB2sCH3b3W7QTb0mt+YKdzvjyNYjIrT8k4GFTx9pg=;
        b=luSdffhDI98y6BHWtDnmljz8i2KpUu0mvrt2gEPzv+2yYzpGBFjnQTLwupf+WnGmG8
         iwn9adGbYAFt5RlBFIcIKJS/gj6fcBUEdbPf0Z63PNEdrL//LzsPJ3r5M6H0kKQQHxCw
         ElqzmQirhTbe9N1Z5b2XcozrJBhrKuvyjbTt2kZBMEUDdSqOtDHQIvOsCpU+FCXSNgjO
         EyDsBGfU+KCKXKkbcikabRndxxAHyHVcW7RO0CNFYfX0QY5pWbeBz+O5NUZRj/YVLWRY
         Q4jAxh1ljK8+tgfKw0kg68KBLFofWY68YaZWPKZufNnq1OB8JuqwwpfZCfAUh4+yAYcu
         olRg==
X-Forwarded-Encrypted: i=1; AJvYcCXgH2jFIgaswST8x+eSo4+KFttvx7Fc7e6uBfA0IWnoIxPcmkDa885/ufU6zweW6mRE96brQByuWGn/9lPZAVWxcQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyNIjSdNDJWjXGnOVzLrihTy1FKB2oJjUKNVTVCEs0+F7PMM0dg
	kL0+SMJeZeblB8I0Qgg1oh9QW9JiOd2eVEjaOb6ReGxnruiZPtDZfRtXuLSZjV/6xOg=
X-Gm-Gg: ASbGncs0CvXg8NFtuWc5+4xr25wRgdjnSFxkPgSmaJ6ZlEe9M/jjKmqEVKzzuGzBta2
	6lOV59qh1INm0KNQC1/9dPM7+F0SltEttezknpIWnpE46HWtE9xKo6JlQsiUY5Km5QLU28a9wtQ
	tL1pHqTM3e5BnebmUviJKR5iD8ygOkUlD0SSJ8aavVkXNkOAECruOLJritOVkx/aLuVNe9zgsGd
	RDdLQQkmFpbYO5BteXpbducO12jgvwyobV7QCWRCuFxcu03dIOTPMhadKBw9Fcfmtu0JUii/ha8
	4tMkzID1vi4ryr4nMSylxXIGyhf+AecBrVzgwq3hDPjAQZ3gPgw7jwDlJNrCpIicKjZITwX1JLw
	fpuz2LY3gy+/93BhLg+A9M1UbvEg/xTc0yLUCeADseyci41jQ9YbNRdk=
X-Google-Smtp-Source: AGHT+IEm4Ct2R6rS30TR8Rw0mX6IhUV+v9e5YCh+GB1DVW9ACij3MMRiN7MIDVDlZgOTVo5J9ffBpA==
X-Received: by 2002:a05:6512:3a85:b0:553:a77f:9c47 with SMTP id 2adb3069b0e04-55b97b7adaemr2357830e87.30.1754298861963;
        Mon, 04 Aug 2025 02:14:21 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a7edbsm1599271e87.58.2025.08.04.02.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:14:21 -0700 (PDT)
Date: Mon, 4 Aug 2025 12:14:19 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: mathieu.dubois-briand@bootlin.com
Cc: mingli.yu@eng.windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] ovmf: Don't define bool type if building in
 C23 mode
Message-ID: <aJB56yIIFrSvRX0e@nuoska>
References: <20250801102912.3219302-1-mingli.yu@eng.windriver.com>
 <DBTI0WV2IOR5.3A1LDH28GH3BS@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBTI0WV2IOR5.3A1LDH28GH3BS@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 09:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221421

Hi,

On Mon, Aug 04, 2025 at 10:26:23AM +0200, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> On Fri Aug 1, 2025 at 12:29 PM CEST, Mingli via lists.openembedded.org Yu wrote:
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > Backport a patch [1] to fix the below build failure:
> >  /buildarea/tmp/work/corei7-64-wrs-linux/ovmf/edk2-stable202502/sources/ovmf-edk2-stable202502/SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/LibspdmStdBoolAlt.h:13:17: error: two or more data types in declaration specifiers
> >  13 | typedef BOOLEAN bool;
> >  | ^~~~
> >   /buildarea/tmp/work/corei7-64-wrs-linux/ovmf/edk2-stable202502/sources/ovmf-edk2-stable202502/SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/LibspdmStdBoolAlt.h:13:1: error: useless type name in empty declaration [-Werror]
> >   13 | typedef BOOLEAN bool;
> >
> > [1] https://github.com/tianocore/edk2/commit/772fa11ac82579a8f6fa171e6b835f68af3f64be
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> 
> Hi,
> 
> Thanks for the patch, but it looks like the embedded patch does not
> apply cleanly:
> 
> ERROR: ovmf-native-edk2-stable202502-r0 do_patch: Applying patch '0001-SecurityPkg-Don-t-define-bool-type-if-building-in-C2.patch' on target directory '/srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86_64-linux/ovmf-native/edk2-stable202502/sources/ovmf-edk2-stable202502'
> CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86_64-linux/ovmf-native/edk2-stable202502/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-SecurityPkg-Don-t-define-bool-type-if-building-in-C2.patch
> patching file SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/LibspdmStdBoolAlt.h
> Hunk #1 FAILED at 10 (different line endings).
> 1 out of 1 hunk FAILED -- rejects in file SecurityPkg/DeviceSecurity/SpdmLib/Include/hal/LibspdmStdBoolAlt.h
> Patch 0001-SecurityPkg-Don-t-define-bool-type-if-building-in-C2.patch does not apply (enforce with -f)
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/1998
> 
> Can you have a look at this issue please?

ovmf and edk2 are notorious for using Windows newlines so patches over
mailing lists may break when applying. I suggest using git to pull the
changes or manually applying simple changes.

Cheers,

-Mikko

