Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164FBC77B7D
	for <webhook@archiver.kernel.org>; Sat, 20 May 2023 16:05:45 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.13415.1684598736825796674
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 May 2023 09:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Mo9kyxLz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-64d2467d640so3187879b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 09:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684598736; x=1687190736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GumG+LeRB/7sq6oP0bvk7i9ity3JnYBGXvfWPeAlkPA=;
        b=Mo9kyxLzY3Q/cku6Kg0ZtSs17DZSwba0uZ2lDUyv+CuoKsYKTqF8Or1QYlvO1wAw31
         vAbFHc9B5m/XbNnvCzy7K+2NeO2VHpHfO926BMJgQ72YF1BcB5DXG69wcqE/g4cNW1QD
         fLRpBaJyc9bNXCsSYUU71N5kkcyrnTY7eW02MIoBoIhXDrM4wAf2qfFTTKbr+d2R4OND
         X786LXxXuSWzOoGA62c6OPuuV/3Cd+bOh5yLVGb4DmDusXOkpuqGnsW/xATSM2Y6DfuL
         8WfWwH2PxoUBvFEXBLvhASnupLxhyt8mSuJ7eeN6okRpFZrc2Br/v7SH4GS22/S6D04R
         r1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684598736; x=1687190736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GumG+LeRB/7sq6oP0bvk7i9ity3JnYBGXvfWPeAlkPA=;
        b=PQPBFGtMbynqNrjCdtfh53I1tWnlRIHPtSAMvTFvi0YOlctBiLKPmnvIeTz0Q/wfPg
         RDcqgQIDNuggyKqpeD2V1JnPWTsN+DSzYHsWJBfHAvD0tZPF0aPLnOO99fOvq1Ush2NP
         hEY4HEpfNLLJ9j0T3LZhis7nMZvO71zxeL7RMdyA4WGq3EevIrkjWdGXJKRJ4l5EXTaA
         alR5w/lGYrRdR3fp3pMW59TnANFKr1LrD8sHBz5dw5Gh6mjbKpxpKXEToY1mpHykBvzL
         ZDkRKCqYWN69r5ZgIPM17S/amNCnKyBxaZreNOLBcMQyH4HiPwAIksPZr5Bwiksx94RQ
         taxQ==
X-Gm-Message-State: AC+VfDw5RZeQdqwQ45dUK7YeVJW2lEAmB5RQCPsPp0atawIl2BRcC62O
	bvO50Ij8zktQcE2Zmt+znq2j7LUNu4F7imLmv0I=
X-Google-Smtp-Source: ACHHUZ53/PsSY+qDy/NhQgC70Ol8GDz7VAhLnNHmO/DMnnr280onISTzb2m79wCpe8ZrbO0uXtp7qg==
X-Received: by 2002:a05:6a00:15c7:b0:62d:d045:392 with SMTP id o7-20020a056a0015c700b0062dd0450392mr8452802pfu.32.1684598735730;
        Sat, 20 May 2023 09:05:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a24-20020a62e218000000b00642f1e03dc1sm1457790pfi.174.2023.05.20.09.05.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 09:05:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/11] selftest: skip virgl test on ubuntu 22.10, fedora 37, and all rocky
Date: Sat, 20 May 2023 06:05:07 -1000
Message-Id: <e4b98a42970574296e0da06842691b9fc1ffc9a1.1684598568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684598568.git.steve@sakoman.com>
References: <cover.1684598568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 16:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181574

This test will fail any time the host has libdrm > 2.4.107

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 5439bd426b..d80f85dba2 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -177,6 +177,8 @@ class TestImage(OESelftestTestCase):
         distro = oe.lsb.distro_identifier()
         if distro and distro.startswith('almalinux'):
             self.skipTest('virgl isn\'t working with Alma Linux')
+        if distro and distro.startswith('rocky'):
+            self.skipTest('virgl isn\'t working with Rocky Linux')
         if distro and distro == 'debian-8':
             self.skipTest('virgl isn\'t working with Debian 8')
         if distro and distro == 'centos-7':
@@ -189,10 +191,14 @@ class TestImage(OESelftestTestCase):
             self.skipTest('virgl isn\'t working with Fedora 35')
         if distro and distro == 'fedora-36':
             self.skipTest('virgl isn\'t working with Fedora 36')
+        if distro and distro == 'fedora-37':
+            self.skipTest('virgl isn\'t working with Fedora 37')
         if distro and distro == 'opensuseleap-15.0':
             self.skipTest('virgl isn\'t working with Opensuse 15.0')
         if distro and distro == 'ubuntu-22.04':
             self.skipTest('virgl isn\'t working with Ubuntu 22.04')
+        if distro and distro == 'ubuntu-22.10':
+            self.skipTest('virgl isn\'t working with Ubuntu 22.10')
 
         qemu_packageconfig = get_bb_var('PACKAGECONFIG', 'qemu-system-native')
         sdl_packageconfig = get_bb_var('PACKAGECONFIG', 'libsdl2-native')
-- 
2.34.1


