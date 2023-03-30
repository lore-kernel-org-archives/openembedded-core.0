Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D502AC7619A
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:14:33 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.38936.1680210865224618909
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 14:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=y/W9p+UC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id d10so12192112pgt.12
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680210864; x=1682802864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LClND6+2qpo+ODzkkORkw+IMqGh96VJVoDABgpDuvsk=;
        b=y/W9p+UCWHEUUSga68gZs5fdj6he6o6uN2lP5IssaMTyGAc4sJP226IwRTk8x4kxSf
         zN8gs88qYT/5quEHRMmpGc5DPosjhmiRAllspUV7aJ7dCDKDCfk/FMjbHImuykwPBNYD
         bkQlqnrTmJ1pcHbC0BVQByxiOkDI0xmIG+pNSfutZLnkk1t4b1KV+Js07S6Y+49bdqwX
         1fnrUEWdXKGeZHBLACtfuzzE13pxf6dl1GkXi2NBxG1NQHIopp21HI13/1q1IC5xYTpN
         76yMAtcEStC1/MNavAnIo97HPLiKmYUzgHvoMy5D1JvBMVQnlKDSJwMk3HBdlDYuyOT+
         AcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680210864; x=1682802864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LClND6+2qpo+ODzkkORkw+IMqGh96VJVoDABgpDuvsk=;
        b=a8u+shfyE4aMiHUIiT39N82q9lg6bAVOIqDnboYuzW6E1n+xHOqZX3tdAvJ/pmM8Hr
         1mQw9rtnBSj2OYujsx6ATdGnGelClSriaEAWSeZClWVQfi3I/TTyLje3sJxW83LSUBRH
         W2ZojW51dBz3T1CgiZDPdK6ZrtzryhIeHg93NT9bQheY+4EKbmI5h+vob8cFKpiVSGdg
         ADdAitQ4f+WCDT5qonA4GIXDNQc7O38SXvvxPwfuojK34JXobUH+FWHgeEmsNzVgYvFO
         tPq3z0V5n3I//TYC9MSyXPZxLo5wCldQoKzPsBYMU0BimtInn7U8y3MeLTxzH9AhZ3q8
         +kyg==
X-Gm-Message-State: AAQBX9ewUV+9lNTlJK4UwJ6f0peAqMgXtyS2lP1YxV2nGhrg29MdlVo5
	jJWN0CK22BoznxA95euESjcFayvi0hWyVGPK1s4=
X-Google-Smtp-Source: AKy350arUVheROjySYCX5NH/eXfY3YiK9XU7GfAmhQMOokczzBqfsDAgV+XnxcJWr3sKwHliUI6TzA==
X-Received: by 2002:aa7:98d2:0:b0:627:f0e5:6ea5 with SMTP id e18-20020aa798d2000000b00627f0e56ea5mr24045622pfm.7.1680210864229;
        Thu, 30 Mar 2023 14:14:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c30-20020a631c1e000000b0050301521335sm250661pgc.11.2023.03.30.14.14.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:14:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 09/14] kernel-devsrc: fix mismatched compiler warning
Date: Thu, 30 Mar 2023 11:13:51 -1000
Message-Id: <a122e5b914d59ceaa10ddb66e8611c31f0fb958d.1680210378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680210378.git.steve@sakoman.com>
References: <cover.1680210378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 21:14:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179368

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When building a module on target, we use the native compiler
(always "gcc") versus the same compiler, but named in a cross
compiler manner, for the kernel build.

The kernel captures the compiler string in several places,
some of which we are already fixing, but others we are not
(as they don't cause issues).

But when building an on target module, the main kernel Makefile
compares compiler strings and outputs a warning similar to:

  warning: the compiler differs from the one used to build the kernel
    The kernel was built by: x86_64-poky-linux-gcc (GCC) 11.3.0
    You are using:           gcc (GCC) 11.3.0

We drop the cross compilation prefix from the captured compiler
string, and we avoid the warning.

RP: tweaked one sed expression to fix quoting issue with 5.15
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 70419f281a4571d01975bd79a47a6ed7ae70b1ae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 46d706b955..17ae744d0d 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -308,6 +308,13 @@ do_install() {
     # external modules can be built
     touch -r $kerneldir/build/Makefile $kerneldir/build/include/generated/uapi/linux/version.h
 
+    # This fixes a warning that the compilers don't match when building a module
+    # Change: CONFIG_CC_VERSION_TEXT="x86_64-poky-linux-gcc (GCC) 12.2.0" to "gcc (GCC) 12.2.0"
+    #         #define CONFIG_CC_VERSION_TEXT "x86_64-poky-linux-gcc (GCC) 12.2.0" to "gcc (GCC) 12.2.0"
+    sed -i 's/CONFIG_CC_VERSION_TEXT=".*\(gcc.*\)"/CONFIG_CC_VERSION_TEXT="\1"/' "$kerneldir/build/.config"
+    sed -i 's/#define CONFIG_CC_VERSION_TEXT ".*\(gcc.*\)"/#define CONFIG_CC_VERSION_TEXT "\1"/' $kerneldir/build/include/generated/autoconf.h
+    sed -i 's/CONFIG_CC_VERSION_TEXT=".*\(gcc.*\)"/CONFIG_CC_VERSION_TEXT="\1"/' $kerneldir/build/include/config/auto.conf
+
     # make sure these are at least as old as the .config, or rebuilds will trigger
     touch -r $kerneldir/build/.config $kerneldir/build/include/generated/autoconf.h 2>/dev/null || :
     touch -r $kerneldir/build/.config $kerneldir/build/include/config/auto.conf* 2>/dev/null || :
-- 
2.34.1


