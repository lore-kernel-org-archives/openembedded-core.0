Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C82C433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 08:54:29 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.13266.1636707268622659840
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 00:54:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=deSGxBmN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id b12so14302445wrh.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 00:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=SJUjDG1gvMEg/MnjIBGYASW+kbRA4ff26UD53AUnlgc=;
        b=deSGxBmNOYWTIwAHdCMah+7Zf2LUdCwvA/nhtYNd+Pqeoc4YpPw4HKFN7+sL9xDDRp
         XFnlJKnpknq7O55edtESpcmE6J6tsNldrhXJuCjDuzeV3ZKynOJKJvzBGq1t12B+lOck
         T/zwdjm4I65ashBe6ul+a6AVUQ1WoneMwgwXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=SJUjDG1gvMEg/MnjIBGYASW+kbRA4ff26UD53AUnlgc=;
        b=gqhOOkLvPXcD8Kw6UZ2CXteQlRhdf9mJ+Vt5jbIsp8mQKRFu1k9WC1fKm8CzXY4krl
         i36sHvalvbIIEq9KYGjn54buuqbh76D3Vat/r0Fty4JBW9USQim82ROXR4Otktdf6IRC
         k0O4SC66gBBqZrBg1v+BjZSHQTndACNrIKO7ScN1kxjTotYoiYv2bK+8Lj4Cy+g7AzIK
         0SNAMgelqhbBoJFtF+pK3Rn336SC5qP9/PcXWo2f97oUO5nuNfqLR5D3QcmK76KvgpsF
         24T7piVCX0XOvzbMJktY2Q19XodC8p4E2SRZ7rBUlaM284D5qSgksx3PRcQ1BBCuH4uC
         lr2Q==
X-Gm-Message-State: AOAM531eHFf+nWNC8suqIJGpd7YOY62UiRaU/KMcyiPYOuoaZU8duPsH
	8DzUMoA9TB+iSFMaPpK8OmlR/w==
X-Google-Smtp-Source: 
 ABdhPJxrMsnITeY9Rzvaj/T+KfW1XCCiNsF9DGARK2VL4DIZoLlyxxO+RqZ27nFcXus8l+sv8smKFg==
X-Received: by 2002:a5d:4411:: with SMTP id z17mr16264076wrq.59.1636707267106;
        Fri, 12 Nov 2021 00:54:27 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c0bd:72b4:105a:2914?
 ([2001:8b0:aba:5f3c:c0bd:72b4:105a:2914])
        by smtp.gmail.com with ESMTPSA id
 m14sm7407076wrp.28.2021.11.12.00.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 00:54:26 -0800 (PST)
Message-ID: 
 <15d0a240c146628550e6867ca0e3c46ebfb14959.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4] glibc: ptest: Add running glibc time
 related test suite (Y2038) with ptest
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lukasz Majewski <lukma@denx.de>, Khem Raj <raj.khem@gmail.com>
Cc: Nathan Rossi <nathan@nathanrossi.com>, Adhemerval Zanella
	 <adhemerval.zanella@linaro.org>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Lee Chee Yang <chee.yang.lee@intel.com>,
	Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Nov 2021 08:54:25 +0000
In-Reply-To: <20211112094116.2509d8f3@ktm>
References: <20211109152851.8137-1-lukma@denx.de>
	 <CAMKF1spswf07YOPg4WOHmvnaTi4LQT09GAnXEukBObNawEMyBg@mail.gmail.com>
	 <20211112094116.2509d8f3@ktm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 08:54:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158212

On Fri, 2021-11-12 at 09:41 +0100, Lukasz Majewski wrote:
> Hi Khem,
> 
> > seeing this
> > 
> > https://errors.yoctoproject.org/Errors/Details/616955/
> 
> The error is about autoconf version:
> 
> DEBUG: Executing shell function do_configure
> aclocal.m4:6: error: Exactly version 2.69 of Autoconf is required but
> you have 2.71
> 
> aclocal.m4:6: the top level
> autom4te: error: m4 failed with exit status: 63
> 
> This is strange, as on my setup (qemuarm, qemuarm64, qemux86) the glibc
> and glibc-tests are built without any issues with autoconf version 2.71.
> 
> 
> I've built the glibc-tests without issues with:
> 
> Build Configuration:
> BB_VERSION           = "1.52.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "riscv64-poky-linux"
> MACHINE              = "qemuriscv64"
> DISTRO               = "poky"
> DISTRO_VERSION       = "3.4"
> TUNE_FEATURES        = "riscv64"
> meta
> meta-poky
> meta-yocto-bsp       =
> "glibc-ptest_v4:164923f0586ac189f01938a32fa102c2df7cc447"
> 
> DISTRO=poky MACHINE=qemuriscv64 bitbake glibc-tests
> 
> 
> Khem, could you help me with setting up environment to reproduce this
> issue?

The autoconf version message isn't a fatal error and if you look at your own
build logs you probably have that too. What looks like it is the issue is:

checking if riscv64-yoe-linux-clang -target riscv64-yoe-linux    -mlittle-endian -mno-relax -Qunused-arguments -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=TOPDIR/build/tmp/work/riscv64-yoe-linux/glibc-tests/2.34-r0/recipe-sysroot is sufficient to build libc... no

which I think leads to:

configure: error: 
*** These critical programs are missing or too old: compiler

Khem was implying this was a musl build, I can't see that from the logs but if
it is a musl build, it shouldn't be building glibc tests.

For that reason I did add:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=f54774199ef09b655de1b586045995e0f284925a

to master-next since I believe that was the remaining issue blocking the patch
apart from a typo Khem also mentioned which I meant to find and tweak.

I still am concerned about having duplication of tests but I don't see any way
around that since you want to get this patch merged and I don't have any
solution for that.

Cheers,

Richard



