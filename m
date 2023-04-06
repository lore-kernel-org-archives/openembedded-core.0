Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA36C761A6
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:46 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.162529.1680796961067041969
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=BRgBXwB5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id iw3so37906861plb.6
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796960; x=1683388960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XlUz4EcGsVc9eC/VOcQGgF0ueyvCD1vEdjV9EIdYX0=;
        b=BRgBXwB5dqQcRwx/R2Kv6qZjbixK1bCdyWDgEoLsD6ZjjiRqsmDv0y/fUYJLQO/WJ4
         +b86S8Y+f7tM+I7Yt6mJf+jPrN4iI2mbsnO95hce1IvPCz0xvSOsP4f2tsmZECrE5jgB
         TNXj/0vsPVdx6VOzNzz3j2eXT4gemlLnNeH2a2LawLqRHah/qdV3k+wewoYZeo6j8hKz
         jaZIyuiguT6VPOtIbhCW3WSdU4e1indAmbZ83erXpfm5eUAgbh08SF+lRjY0E23Wb6If
         26Pu3hm+hu3q8vPDD5HRv3k+IWsacUYIRhGoy6HAVFeimBi4kbPYnfuNLqpOcs6+GFgy
         MKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796960; x=1683388960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XlUz4EcGsVc9eC/VOcQGgF0ueyvCD1vEdjV9EIdYX0=;
        b=Vyl8eUz2YSeXLTjAdWymRSrgeDiMBfRX7UNYrNClOzY5uBY8kdoSjlJl+lpn3F2IR6
         3DuvIwyiFjLbXdIpCGnKWBmQNxqKsSqYE5EJDL4E433n+f4vlqIKblVSj8XqoRxkpQFH
         fqyHIIAYmEL+JN8kxcIT0qWV+utf6iwPw+r4MH3bJiVrdFVO6dwtG6xL9ubr+s2sZAa5
         Yx6usutckFXKM4kOnjwCWqNjjMEOrskOXC8TWqWXanlRfsBVOwyQx+H4Zr9eGiYcbL24
         s6/86Uq+V+km8g8kG4LGaMwDToilMixUDXVG2WY1D9GNgUxfv8ML/2PMs0WGZszNy6ZI
         WPIQ==
X-Gm-Message-State: AAQBX9dtv7Sva4KNSJvOQEHWV9Yl/+uEapcgtvkQK8NqAXHwsnbO+Acw
	oVXY4vpPTxXEuhHY9vBMLVdk/Q2yuLvmSaoLu0g=
X-Google-Smtp-Source: AKy350bqVV05B2h004dCJEg5cgo8vZ8eB/B8ebgZqJt1HsjRnIiWb2CQtN2agNuSiy87zQKGJN5k6Q==
X-Received: by 2002:a05:6a21:8697:b0:d9:91d2:b81e with SMTP id ox23-20020a056a21869700b000d991d2b81emr3441640pzb.62.1680796960054;
        Thu, 06 Apr 2023 09:02:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 12/26] Revert "runqemu: Add workaround for APIC hang on pre 4.15 kernels on qemux86"
Date: Thu,  6 Apr 2023 06:01:39 -1000
Message-Id: <3479caf1eb1a67c53722ca774bfd94145b3669b5.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179790

From: Khem Raj <raj.khem@gmail.com>

This reverts commit 82e67b82ea8e12aa0b7b9db1d84fec0436dec71b.

It was commited as part of https://bugzilla.yoctoproject.org/show_bug.cgi?id=12301
for kernels < 4.15, as of now oldest builder kernel we have is 4.15 on
ubuntu 18.04 so we should not require this workaround. Moreover, this
fixes an smp problem with qemux86 where no matter what -smp <x> option
is used, qemu always starts with single core.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit fa8a7c0608fc800c48d0ff1cd832ad63c51eeab1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index db35d83fa9..efc135e535 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -591,11 +591,6 @@ class BaseConfig(object):
 
         if os.access(dev_kvm, os.W_OK|os.R_OK):
             self.qemu_opt_script += ' -enable-kvm'
-            if self.get('MACHINE') == "qemux86":
-                # Workaround for broken APIC window on pre 4.15 host kernels which causes boot hangs
-                # See YOCTO #12301
-                # On 64 bit we use x2apic
-                self.kernel_cmdline_script += " clocksource=kvm-clock hpet=disable noapic nolapic"
         else:
             logger.error("You have no read or write permission on /dev/kvm.")
             logger.error("Please change the ownership of this file as described at:")
-- 
2.34.1


