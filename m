Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.6816.1593767956703134235
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 02:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A7RN/AAJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id q15so31362126wmj.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 02:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=UIAKVRkMLbS0muxaXvs6QYBrnoUSuYDSsEn2YOEyRGQ=;
        b=A7RN/AAJH0fc+UVSJM5cJDlmpXi6kiEJvQR67g3NF/RN5z3Z4N0fiXPl9BjV6c8ODm
         S80tVZZjZiMQA/a6toA9UitnS4sT3zgjG81Fu5359KZs225p/oX5AbTZGr09eTVi8E9f
         VOftlTeyyxzltMLba2p4g3dHBBLtJNwtwAJb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UIAKVRkMLbS0muxaXvs6QYBrnoUSuYDSsEn2YOEyRGQ=;
        b=h7hMeIhx2RsGgY+argeBoZrvXV+TQy23ougAVQFRyjat8fqhcrW0/BqWMu2IbxbHKU
         PGbaZllcySrwY/dmolTzkwB1MdiiuS88e2AsAo9vdytSHEMUPGRDbJ9IY+hNJp2dAttP
         sR1Lau1PlJ7psvovfdhmgpapnfqLRw7Mu0ZGvrWQXotMHPAAsZMvZ23aI2o8PMQi0Wb0
         4IqaPWzFNqwMfL1LvqVPnBeT1iR6/O2W5cl7dYEJdhzSVGDaOXkBEib7SiGBdkEeQrBL
         e2KUtlghzHLUJX7oJ27v/WQtnQdbzb05KIAxmCBKx8YHe6JDPBDnldyySgUDKYVy/+fK
         7PtQ==
X-Gm-Message-State: AOAM533D4mHX+hzZWuSF17Bgv67VUMuGe7TxKtbwA51iZXm3lpQeq8GQ
	GGqE7ffhejScAoLy4R5owhtorA==
X-Google-Smtp-Source: ABdhPJzJd8EHZc9V69K1RaQfOOBtpf25mjbybzcloVAM3oym7GqjD05LZ71AmC+XfvqdbXjoJBUqVA==
X-Received: by 2002:a05:600c:204d:: with SMTP id p13mr35439798wmg.88.1593767955065;
        Fri, 03 Jul 2020 02:19:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 59sm13932889wrj.37.2020.07.03.02.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 02:19:14 -0700 (PDT)
Message-ID: <64b8f2c4fbc20ea866a83844d117816de59082dc.camel@linuxfoundation.org>
Subject: Re: [PATCH][dunfell] coreutils: don't split stdbuf to own package with single-binary
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Bunk <bunk@stusta.de>
Date: Fri, 03 Jul 2020 10:19:13 +0100
In-Reply-To: <20200703073631.16530-1-rasmus.villemoes@prevas.dk>
References: <20200703073631.16530-1-rasmus.villemoes@prevas.dk>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-03 at 09:36 +0200, Rasmus Villemoes wrote:
> Commit 992cec44 (coreutils: Move stdbuf into an own package
> coreutils-stdbuf) breaks package-qa when the single-binary
> PACKAGECONFIG is used:
> 
> ERROR: coreutils-8.31-r0 do_package_qa: QA Issue: /usr/bin/stdbuf
> contained in package coreutils-stdbuf requires /usr/bin/coreutils,
> but no providers found in RDEPENDS_coreutils-stdbuf? [file-rdeps]
> ERROR: coreutils-8.31-r0 do_package_qa: QA run found fatal errors.
> Please consider fixing them.
> ERROR: Logfile of failure stored in:
> /mnt/ext4/projects/deif/pdsystems/yocto/tmp-glibc/work/ppce300c3-oe-
> linux/coreutils/8.31-r0/temp/log.do_package_qa.5594
> ERROR: Task (/mnt/ext4/projects/deif/pdsystems/yocto/meta-
> poky/meta/recipes-core/coreutils/coreutils_8.31.bb:do_package_qa)
> failed with exit code '1'
> 
> With that PACKAGECONFIG, /usr/bin/stdbuf is just a simple "script"
> containing the single line
> 
>   #!/usr/bin/coreutils --coreutils-prog-shebang=stdbuf
> 
> Since there's no point splitting stdbuf to its own package when all
> the functionality is in the single big coreutils binary anyway, fix
> this by not creating the separate stdbuf package for the single-
> binary
> case.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
> The same issue exists in master, which has been bumped to 8.32, but
> other than that the patch should apply cleanly there as well.

Does this problem exist for other packages in coreutils? I'd suspect it
does in which case why is stdbuf special? Whilst I realise there is a
problem here is the correct fix not:

RDEPENDS_coreutils-stdbuf_class-target += "${@bb.utils.contains('PACKAGECONFIG', 'single-binary', '', 'coreutils', d)}"

?

As Alex says, this would need to be merged in master before we can even
consider it for dunfell.

Cheers,

Richard

