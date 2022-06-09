Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC00C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 09:28:31 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.8589.1654766905213140783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 02:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=00bg7oC8;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.43,
 mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f43.google.com with SMTP id y19so46268560ejq.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 02:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=+FqWEZk7JmCzDYMdNg6E+gPnpMcUkQJhWHRZAebKpVQ=;
        b=00bg7oC84p0qYALmuOgaAY4d4FlcaKJl1dGQM8LtIlJEsbUiTy0B28HqEW1JmGu+3D
         r5paymPkJJil1jS7oDlQ2zCRWJdMl+3X0npq0BhOCf+jxde60MPRSwxlqhtTZ8JRx8lP
         3JHK1UE7TwjMLvzOLQOFt7WqCnolllZU3q8QX86kgsI1REEf3e+D8tTsdIa/CUfc74ZG
         7Hg8pkno5hYrJALNdaJm+eWsilJpP4hRraO1uLKVFxFtBFSk8O0BfBGPEOo4d+02Jh+u
         1Eg/6exUnSB5M+B04awf7ALeKO03Qs+C7qTVC0f2kywYTV+JLeC7DspR2qEMLMTVMhEP
         DkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=+FqWEZk7JmCzDYMdNg6E+gPnpMcUkQJhWHRZAebKpVQ=;
        b=BVFcZ2Y+ciD89sFhKjCxUwmCNFN7K51T1JdYsuPBeuYJ/OwBSKRM6jYefeUuxeC8bn
         TNZ7IzNyxpEvlAEpEzKRyGB2T5GHjByIhOesF3TFrBERpRBN0MPPONnFyDHHxA/cm/R0
         05IEg7P/xZjlQpP1AIr6SmxM99+3PXsip2WfTz5bBzV/ajyCqi+Qp+KRw2J7/06WmGex
         /oBRnvj9oTlVMTWHuPnt/7zc218uTt/MA7tt2kN/prlSQpFqwUc9MvKksr/UN8hzlWt9
         bV4WOTRXvpHoKU10zMuvvQ80NNhBMqwrJQdHXL0o3Zi5uQhVUI7FeyxAP8yJNLRdiErj
         TE4w==
X-Gm-Message-State: AOAM530K1Zmpa8+EIrXc/XyijX/AcS4yIjB4H4ofhSXJlcIjpM1VULLA
	wtori0ivKY/6RL5/M97GanmDUl5O8frvvhtMBJ6loVRjpPQjHg==
X-Google-Smtp-Source: 
 ABdhPJwgvR0da0hA5GjeuO8Su6fM31OUnb375JbG4gspJqwmZi0vGrUNeUtvRUhY/EP6JIH0/zQynDSliKYgfGZdNZQ=
X-Received: by 2002:a17:906:fc12:b0:711:d2e9:99d9 with SMTP id
 ov18-20020a170906fc1200b00711d2e999d9mr17355487ejb.734.1654766903226; Thu, 09
 Jun 2022 02:28:23 -0700 (PDT)
MIME-Version: 1.0
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 9 Jun 2022 11:28:12 +0200
Message-ID: 
 <CAMRc=Md3LRW3OZ-AOkG5g1iNrH_k_gQdP3y03cKahgMN7aXF0A@mail.gmail.com>
Subject: [meta-java] icedtea7-native build fails on kirkstone and in master
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Henning Heinold <henning@itconsulting-heinold.de>,
 Otavio Salvador <otavio@ossystems.com.br>,
	Richard Leitner <richard.leitner@skidata.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 09:28:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166766

Hi!

I'm trying to build java support with the following configuration:

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta
meta-poky            = "kirkstone:45d7615dfef8093a2467d52ca1130e62db6a1187"
meta-oe              = "kirkstone:fcc7d7eae82be4c180f2e8fa3db90a8ab3be07b7"
meta-java            = "kirkstone:1a8059f6b257ebe6fcae6416e499784d976afd24"

---

PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"

---

The build fails for icedtea7-native but it's hard to tell why exactly
from the logs. Here is the full output: https://pastebin.com/3dRt6J0Y

It seems to be failing here:

| Checking for mapfile use in:
/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build-boot/lib/amd64/libmanagement.so
| Library loads for:
/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build-boot/lib/amd64/libmanagement.so
| make[5]: Leaving directory
'/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/jdk/make/java/management'
| make[5]: *** [../../common/Library.gmk:225:
/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build-boot/lib/amd64/libmanagement.so]
Error 1
| make[4]: Leaving directory
'/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/jdk/make/java'
| make[4]: *** [Makefile:63: all] Error 1
| make[3]: Leaving directory
'/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/jdk/make'
| make[3]: *** [Makefile:247: all] Error 1
| make[2]: Leaving directory
'/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot'
| make[2]: *** [make/jdk-rules.gmk:79: jdk-build] Error 2
| make[1]: Leaving directory
'/home/brgl/workspace/target-build-yocto/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot'
| make[1]: *** [Makefile:244: build_product_image] Error 2
| make: *** [Makefile:2252: stamps/icedtea-boot.stamp] Error 2

But not sure why.

Thanks in advance for any help.
Bart

