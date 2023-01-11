Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA055C5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 11:03:39 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.21011.1673435014338363846
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 03:03:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cFFGPwaP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so12321914wms.4
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 03:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=e4TB7TulIiPnezEjsjfiW8KocKt1KVLLmz0GWfSUxnI=;
        b=cFFGPwaP+Zpo9NIuQVfoENryWTmXFzkBSrpNc/jwhSaIIUToiAapRKXog1FTa6rhmP
         sQfyzvBBQo5sW0sY5WyIxYI4+syi/HXfmW0dRnkwBa/apMCowQOfGDUKK06oZWQBYP8d
         k8tr5HVwZp9H1P30NmuvcTq0CxkeWA0JXSpbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e4TB7TulIiPnezEjsjfiW8KocKt1KVLLmz0GWfSUxnI=;
        b=1RUfISCuXDX82A2+R6HRFOfHxiwDPtotWsvBQWZz8Qkn/YMLg34dy0uaFyROAFfLUS
         y0/PU2QpYrG/lmgARZxrAdEzdzDeVF75KWj9nLlkHQxUcp9Pctfo1UaarrHCwbPG4wKO
         W0kF/xBxZTBenX1gGOV4QEUsYL4uMEPxHA98y9LJEyXuhpWPS1IOrCMN3jECNHMLnhjU
         2W3PqvU8Dlpe1MSw3S9+PGWJgKSxNWTViPqTMgU0X7UCq3vW8ja6ktcy23nNyzdJlM9U
         X+bArEVclpD+nLGkxzk59olJqizzEVgVs3ZGXqkMaldvxC0siMShap74RMx3PLD4Aoa+
         PjKQ==
X-Gm-Message-State: AFqh2koXtcdzyPXFHp71Bbycq6mg2xjWA7H/5Ff/vtqIi1aqjhg7GtUF
	wRUYP8XUoqd+SFZJo5rcIN2iLA8zqqPHaCBE
X-Google-Smtp-Source: AMrXdXuvzJeuBHxpKAhfHBP2l/6jPTjCc28okGs88pmnPl1maL9JtfkKIDSDKZFwXSzK4Vlh2sqfeQ==
X-Received: by 2002:a05:600c:2844:b0:3da:4e:8dfe with SMTP id r4-20020a05600c284400b003da004e8dfemr2840560wmb.38.1673435011841;
        Wed, 11 Jan 2023 03:03:31 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a11f:4d56:748b:c178])
        by smtp.gmail.com with ESMTPSA id m13-20020adfe94d000000b002714b3d2348sm13509195wrn.25.2023.01.11.03.03.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 03:03:31 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemux86-64: Reduce tuning to core2-64
Date: Wed, 11 Jan 2023 11:03:30 +0000
Message-Id: <20230111110330.1507634-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 11:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175729

Effectively revert "qemux86-64: build for x86-64-v3 (2013 Haswell and later) rather than Core 2 from 2006"
(commit 6f2af1e5d1537b4d31e14946292bf58f0fd76fc9)

Much as I'd love us to use the latest tuning, we do have some autobuilder
hardware which isn't ready for this yet which breaks KVM and some qemu
user mode usage as there appear to be TCG bugs too. I suspect we're not
the only ones with such hardware.

Drop the tune back to core2-64, anyone can easily customise it
themselves if they need it. We can revisit this in a year or two
as we should be ready then. It has beena  good test of the rest of the
support which all seems ready.

I'd have preferred to use corei7-64 but that causes
runqemu.RunqemuTests.test_boot_machine_iso to hang.

Leave the newer tune file inclusion so people can change tunes
more easily.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/include/x86/qemuboot-x86.inc | 4 ++--
 meta/conf/machine/qemux86-64.conf              | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc b/meta/conf/machine/include/x86/qemuboot-x86.inc
index 31db1b2a61f..3953679366d 100644
--- a/meta/conf/machine/include/x86/qemuboot-x86.inc
+++ b/meta/conf/machine/include/x86/qemuboot-x86.inc
@@ -4,8 +4,8 @@ QB_SMP = "-smp 4"
 QB_CPU:x86 = "-cpu IvyBridge -machine q35,i8042=off"
 QB_CPU_KVM:x86 = "-cpu IvyBridge -machine q35,i8042=off"
 
-QB_CPU:x86-64 = "-cpu Skylake-Client -machine q35,i8042=off"
-QB_CPU_KVM:x86-64 = "-cpu Skylake-Client -machine q35,i8042=off"
+QB_CPU:x86-64 = "-cpu IvyBridge -machine q35,i8042=off"
+QB_CPU_KVM:x86-64 = "-cpu IvyBridge -machine q35,i8042=off"
 
 QB_AUDIO_DRV = "alsa"
 QB_AUDIO_OPT = "-device AC97"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index d355375f13c..14873a3b4f2 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -9,7 +9,7 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
 
 require conf/machine/include/qemu.inc
-DEFAULTTUNE ?= "x86-64-v3"
+DEFAULTTUNE ?= "core2-64"
 require conf/machine/include/x86/tune-x86-64-v3.inc
 require conf/machine/include/x86/qemuboot-x86.inc
 
-- 
2.37.2


