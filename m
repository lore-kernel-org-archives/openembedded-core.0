Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFF3C761AF
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:09:07 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.103756.1679670538022691320
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ncj4alYm;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 31so1851630qvc.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679670537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZqEK35OnOSjT/1Mj33Qe+I67w3m5I+mfEO/hlZzpwc=;
        b=ncj4alYmcA4jR8sTK8kIRfS9OO0lBEWj27t2zOdG67czFGRM0pJ079L08Dm4h6o1/X
         WZ1tuEEqK9ne1p7maO2rXsVUvcZKwVWTWuJFN6VzMk3VXUlMyCPeZY2hmgqag8f50/K8
         J6aWBFvPvThEz0utGuCBiAyuupIVd+rmbWsmtacJ/KblVeRQKRfXzZdfnSQz6yyjGVl0
         HHvHDElqhyLYGGVhFiOdPxwnK/psE1Tk267F1W41V2Wd0qjyBO65ZZ8ubpusFgMeP4ey
         F9854wGRdR/uC722k1fbQAWJwZynSOA9HmlzuNMLRvV8oIOS4hwVNtx8tb4WyYlwtaJG
         Gp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679670537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZqEK35OnOSjT/1Mj33Qe+I67w3m5I+mfEO/hlZzpwc=;
        b=hj1rjzRAbnlSGqdVzNpsHJDB32pXThlGs5LNKQvNTWyBtMs2VQWZrxGGM5swuVuPpY
         JdKj0cg99Nuj5dbsZrCCb73RUkeOFtXZ+WNdxlu+SanJE5seVucKIK7k7cemUetgbP9x
         PiwbI1JkyQawUOYH0VMIWBjOdtP0QuZ55th8+T+Y04XDc8YMt0uMmtPMEVeKLGQZp/Hi
         R50lrr3X7KIQHTF/OXzpOUHcFHo+APOXOn2ih0KkbuLiuJaRyjqZ8M8fvmJLOums0seC
         su0eI8ofJB3h8udUywK8rnLYtU5yUGVHtAFYPLuL/gPBOtne3YoCMBI9XlVQEltxg9VR
         ZilQ==
X-Gm-Message-State: AAQBX9c1aAZAB0kYteNt8vdkhne6xFP8GmKTKrTztL8RNbY1A1di4J4c
	wO8Omycxr4hCTIFqEynEwrPvWr91/nWUmA==
X-Google-Smtp-Source: AKy350ayo3EplJWgmlV7fI3iv9SU9v0KbXa20SNZtRTJvjlYVcPssywUBnk1glS0UfSvvV6kxn+npw==
X-Received: by 2002:a05:6214:4114:b0:5aa:fd43:1fbe with SMTP id kc20-20020a056214411400b005aafd431fbemr4491130qvb.46.1679670536994;
        Fri, 24 Mar 2023 08:08:56 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id mf10-20020a0562145d8a00b005dd8b9345e8sm746219qvb.128.2023.03.24.08.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:08:55 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] kernel-devsrc: fix mismatched compiler warning
Date: Fri, 24 Mar 2023 11:08:46 -0400
Message-Id: <3829378cfecc7050e0ca09a43aa61c972398bae0.1679670268.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679670268.git.bruce.ashfield@gmail.com>
References: <cover.1679670268.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179046

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

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 683f182c43..6821efd38d 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -330,6 +330,13 @@ do_install() {
     # external modules can be built
     touch -r $kerneldir/build/Makefile $kerneldir/build/include/generated/uapi/linux/version.h
 
+    # This fixes a warning that the compilers don't match when building a module
+    # Change: CONFIG_CC_VERSION_TEXT="x86_64-poky-linux-gcc (GCC) 12.2.0" to "gcc (GCC) 12.2.0"
+    #         #define CONFIG_CC_VERSION_TEXT "x86_64-poky-linux-gcc (GCC) 12.2.0" to "gcc (GCC) 12.2.0"
+    sed -i 's/CONFIG_CC_VERSION_TEXT=".*\(gcc.*\)"/CONFIG_CC_VERSION_TEXT="\1"/' "$kerneldir/build/.config"
+    sed -i 's/#define CONFIG_CC_VERSION_TEXT ".*\(gcc.*\)"/#define CONFIG_CC_VERSION_TEXT "\1"/' $kerneldir/build/include/generated/autoconf.h
+    sed -i 's/CONFIG_CC_VERSION_TEXT=.*\(gcc.*\)/CONFIG_CC_VERSION_TEXT=\1/' $kerneldir/build/include/config/auto.conf
+
     # make sure these are at least as old as the .config, or rebuilds will trigger
     touch -r $kerneldir/build/.config $kerneldir/build/include/generated/autoconf.h 2>/dev/null || :
     touch -r $kerneldir/build/.config $kerneldir/build/include/config/auto.conf* 2>/dev/null || :
-- 
2.34.1


