Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC696C87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 08:15:24 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.43540.1754900121253303946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 01:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=cdprGaAm;
 spf=pass (domain: snapchat.com, ip: 209.85.218.54, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-af968aa2de4so750198466b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 01:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1754900119; x=1755504919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AF+18gSdxDx+AhrPRoVdMAc5CHbB3NISAaThT0Eqo50=;
        b=cdprGaAmc69q+ie+7WsFvKMH97XeHBg2E3uRHYfQON3T7FXt+aJfM1en39P93b3Pr5
         fC5YVUZ4qAug+4Pzm2qRp95P148N3T3SviksnPT0kl/Z9WUnS3hOz7xPGBt5Eq6s7FnS
         p8FAfOnpRVrkJLYToRfcrMYlPrAVvK3ZrTckc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754900119; x=1755504919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AF+18gSdxDx+AhrPRoVdMAc5CHbB3NISAaThT0Eqo50=;
        b=txnYpZVJvXRPrtaGIQaOWBMKHT3EdDwGpucjduvCtlWdh08eCThRB7+/UPZv4IH5zw
         duoPBaiMTqOB9yN6Q71DsU3w2IERckv+5yo146dz9fhb6VVICIG9L8WxxNclc4lA6WrI
         0SqJCylhDuLIDwug0TwVzMTYLkU3clsd4kcVfQacGA7XZkmf/tmmo+k2LibyyMfwF7i0
         XOgtSIVZUv0Ui+U1Bifcq+mDD7SlBBUULAbzpFd5BbbHmpHgoWENApg6dMz0bxOYwbi9
         jQpLKSbpUiOkSyrRmCx/kG4uab+3nvb3czpgfmIQfULMzklk8lTS4XPRCk6th/zPAdLG
         SRBA==
X-Gm-Message-State: AOJu0YxLUaT+ZQYb02+pQKkBGSoacUDZT6TQ9AnaQrO/3EnBqn9X92g8
	YcNGH6n/LeIGS9GqkUTGRgQwHypBQ7szOF/9YjxTQ/q+iwNWAqlWxSeBgByo7/RtUWdmlvfi679
	gC5Q4zd8=
X-Gm-Gg: ASbGncvERPosp6wsDegVYoi9hJjWPnb4zd+/UO6O2XJywotC8c6LfzbFTi+fZxEv+tA
	BaqTbeeB3Py9tOCCZCq9AJJ80sRgga5kSkeWpBYKonKiWTiDebMx5mdwGYwA9ka60Nyb/DZeSDa
	Xwu27v0cyOU1tql2UAjFyZS0fzYZuQXPfUZs0PifHYBFPg8K8LQdMw1e6YuGEuMiAa1yxd0STMd
	3yjCNqkPjnbVN78TNIt0w/vISBUypPr37KGfRnR5lhRJY31wbV7A858hwW4945xDaF5i1mVk9nn
	n3b0JXbIXP6nD2Qpv7YoAzZ+HpUKzcCALMyhhPl3qBF0pqPFHM4hqyqBHlUlc0LfahQIqlGyUMQ
	t91C5Ui5w3mVve8Ny4mO7kGCvUxvqmSiV2Uc=
X-Google-Smtp-Source: AGHT+IH9OyL+ce2aMxuwXQ68w64QARatDDXK7Yw7eW0dO/V2BFBK5vtzgTdHl5m807BaPNfcbb52VQ==
X-Received: by 2002:a17:906:9fc5:b0:af9:7a90:6750 with SMTP id a640c23a62f3a-af9c63b0afemr1250057666b.3.1754900119252;
        Mon, 11 Aug 2025 01:15:19 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0766e2sm1973621966b.27.2025.08.11.01.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 01:15:18 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] Revert "qemux86-64: Reduce tuning to core2-64"
Date: Mon, 11 Aug 2025 10:15:10 +0200
Message-ID: <20250811081510.2777752-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 08:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221722

From: Etienne Cordonnier <ecordonnier@snap.com>

This reverts commit 3d67b6c60fa968cd36b51c63e2a7f11bb87dd315 which mentions "We can revisit this in a year or two
as we should be ready then.".

Reverting this commit allows perfetto to work out of the box with qemux86-64. At the moment perfetto prints this error on qemux86-64:
```
root@qemux86-64:~# tracebox --txt -c /tmp/config.pbtxt -o /tmp/perfetto-trace.pb
This executable requires a x86_64 cpu that supports SSE4.2, BMI2 and AVX2.
Rebuild with enable_perfetto_x64_cpu_opt=false.
```
---
 meta/conf/machine/include/x86/qemuboot-x86.inc | 4 ++--
 meta/conf/machine/qemux86-64.conf              | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc b/meta/conf/machine/include/x86/qemuboot-x86.inc
index 6ae03633aea..82ef4a0b732 100644
--- a/meta/conf/machine/include/x86/qemuboot-x86.inc
+++ b/meta/conf/machine/include/x86/qemuboot-x86.inc
@@ -4,8 +4,8 @@ QB_SMP ?= "-smp 4"
 QB_CPU:x86 ?= "-cpu IvyBridge -machine q35,i8042=off"
 QB_CPU_KVM:x86 ?= "-cpu IvyBridge -machine q35,i8042=off"
 
-QB_CPU:x86-64 ?= "-cpu IvyBridge -machine q35,i8042=off"
-QB_CPU_KVM:x86-64 ?= "-cpu IvyBridge -machine q35,i8042=off"
+QB_CPU:x86-64 ?= "-cpu Skylake-Client -machine q35,i8042=off"
+QB_CPU_KVM:x86-64 ?= "-cpu Skylake-Client -machine q35,i8042=off"
 
 QB_AUDIO_DRV = "alsa"
 QB_AUDIO_OPT = "-device AC97"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 62108b703b6..8aac7634b75 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -3,7 +3,7 @@
 #@DESCRIPTION: Machine configuration for running an x86-64 system on QEMU
 
 require conf/machine/include/qemu.inc
-DEFAULTTUNE ?= "core2-64"
+DEFAULTTUNE ?= "x86-64-v3"
 require conf/machine/include/x86/tune-x86-64-v3.inc
 require conf/machine/include/x86/qemuboot-x86.inc
 
-- 
2.43.0


