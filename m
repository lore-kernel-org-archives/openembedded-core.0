Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3309BC5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 06:32:03 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1412.1787121114392363059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 23:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tFqkpINQ;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c94fccf3eso7256701fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 23:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787121112; x=1787725912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8wJUqGgIILtRnJ7mVST9jN4PRGhRhG5n4LDWuVVNkYk=;
        b=tFqkpINQfn9yWPxm+UEqz/ZJ8FcyFPt+Tc5Q253lLvB/AbBQXF83/NUECFlNPheEpY
         BvLj9hsCGksxs1Wdqhq9ti6UK5QsIJ4etyrf2gPgBkGeOlVCf5iORBA3SJ4nWf3NSe2c
         3sQlY5e10OnEbKsPosvUX4cmhQZQbyaXN4vk9VgI1KsWXzm1QnCuDv4DxYUDxLqo6yRo
         vv5fcmfojvQYs2r6ocKNZHAI1vbb+C9lZxKnXpfKcbYJHKeKE+hnKsakEd0NKtiooaNT
         U8TOiTpydB3G/UCFKy4l6QNCcp6+xQvUrrHQMLu45xMBAC3uM5oA+Pl8xVeCX1BKG0ST
         IZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787121112; x=1787725912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8wJUqGgIILtRnJ7mVST9jN4PRGhRhG5n4LDWuVVNkYk=;
        b=cTzVQcYBc6Dc+gr1QVzc5eMzesfy0queZI3bYnQclepFl4RyT2JcsTOTDS5QDoY+j4
         P+eowYULYE+EjwljcWa2luVDQInzX5ss8A/btHHZEG+llJDLf8iBqc4N8M5JwY1V7/K0
         6YMZT61xoiUrHpKGr66mgRu7aVjFSYqdbUAHvUP2ggeWe1rcvUtUWc6z6Vlc1H7k0ABE
         adPF9t1GLuBk/VZVV1rWGcJM1hSERwsdDMfI3ws9sV0/2Jc85UMXYhIZdg4J83d5ivhG
         Lm/FUdq5K5Kjdr5MpwFOoUoZeXN/nZHRwjbkaeyOn5c59IoC/VOG0FSzKI0+GkryJlIN
         gQpQ==
X-Gm-Message-State: AOJu0YxXoR1QUESept6uXBHjwn21KZ/MxZXMmOsGmVq59ssXA1ryk/am
	JB/xJ5b8LeKGYthqeIzgW7I0t6TQhmVbglCuCCjvGKUBtSq4I0pfbDiFqd1PjuAqiVzJgcDpMbV
	3Smqq
X-Gm-Gg: AR+sD13Jb0Aj+iSCdSFyB5mpq9yMZGMbQSG0K3loPzr1hzr4nAE4oVCAEqYgOiJP0ke
	Cj42NPXZrX4rnE0wYLniqdrc6eglL4N8sq8R2RyV6GjGVlSVnHiCfdCfMRKH/YH50+nZvrWcFrh
	jT1Ywtl00o5retlmR6xSIfjC01i5drgS470cdonz105vBiLWaeltGYlHlPUqw9HLfpYiY5ZvyNM
	rBQFF/1B5XjN2IE/ZV70jMMw4O9LSukR7XdDo6pou51XH4nYGXAsHxUhiqKoGTe7kl3EP9lGOTq
	ruHliYwK1eRoZSukq2Fugp1HCT8CawFpKRsTQ1V7AqJjDqVcro0vkHlOXQpjSMQYpZHwJ6qwdyy
	dHShqEEXewkabECy6gTpfJNkOOCsE15jqkPENudXC8RyFy+YcymkZhKujhBlciDZuobtFZQ2Hqi
	okcxHjgFKdyZMAgngpJ+dh6IOzAPXtDpCAON75+50b9bw5NtATctrWmL1YYGKZgpbpm7pn/tQwD
	djZlP/6A22GUHw=
X-Received: by 2002:a2e:a994:0:b0:39b:1b6d:5027 with SMTP id 38308e7fff4ca-3a1899ffe8fmr3339951fa.11.1787121111968;
        Tue, 18 Aug 2026 23:31:51 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a18a8e8579sm1990351fa.0.2026.08.18.23.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 23:31:51 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH v3] lttng-modules: update to 2.15.3
Date: Wed, 19 Aug 2026 09:31:30 +0300
Message-ID: <20260819063130.1542492-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 06:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243713

Changes:

https://git.lttng.org/?p=lttng-modules.git;a=blob_plain;f=ChangeLog;hb=65c6bd5d4a9ef084a6c52d0728d61d10eedf9aa7

2026-08-17 LTTng modules 2.15.3
	* fix: backport: hrtimer: Reduce trace noise in hrtimer_start() (Ubuntu-6.8.0-136)
	* fix: string: Remove strncpy() from the kernel (v7.2)
	* fix: btrfs: tracepoints: trace transaction states during commit phase (v7.2)
	* fix: btrfs: tracepoints: add in_fsync field to transaction commit event (v7.2)
	* fix: btrfs: tracepoints: pass a transaction handle to transaction commit event (v7.2)
	* fix: net: constify sk_skb_reason_drop() sock parameter (v7.2)
	* fix: KVM: x86: Rename kvm_cache_regs.h => regs.h (v7.2)
	* fix: x86/msr: Remove rdmsrl() / wrmsrl() (v7.2)
	* fix: warning -Wordered-compare-function-pointers with LLVM
	* fix: warning -Wcast-function-type-strict with LLVM
	* Fix: ring buffer: zeroed UUID in populated empty packet headers

Fixes build error with kernel 7.2:

| lttng-syscalls.c: In function 'lttng_syscall_event_enabler_create_event':
| lttng-syscalls.c:612:17: error: implicit declaration of function 'strncpy' [-Wimplicit-function-declaration]
|   612 |                 strncpy(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
|       |                 ^~~~~~~
| lttng-syscalls.c:101:1: note: include '<string.h>' or provide a declaration of 'strncpy'
|   100 | #include <instrumentation/syscalls/syscalls_unknown.h>
|   +++ |+#include <string.h>
|   101 | #undef TRACE_SYSTEM
| lttng-syscalls.c:612:17: warning: incompatible implicit declaration of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
|   612 |                 strncpy(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
|       |                 ^~~~~~~
| lttng-syscalls.c:612:17: note: include '<string.h>' or provide a declaration of 'strncpy'
| lttng-syscalls.c:704:17: warning: incompatible implicit declaration of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
|   704 |                 strncpy(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
|       |                 ^~~~~~~
| lttng-syscalls.c:704:17: note: include '<string.h>' or provide a declaration of 'strncpy'

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../lttng/{lttng-modules_2.15.2.bb => lttng-modules_2.15.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.15.2.bb => lttng-modules_2.15.3.bb} (95%)

v3: update to 2.15.3 instead of patches

v2: change to patches over 2.15 release instead of an update to rc version
    since they are also in upstream 2.15 stable branch pending release

v1: https://lists.openembedded.org/g/openembedded-core/message/243419

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.15.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.15.3.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-modules_2.15.2.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.15.3.bb
index bfa1fc619a..0d9a872ab5 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.15.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.15.3.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
                 "
-SRC_URI[sha256sum] = "a8fbe5f76a89856505a4310c549952b7a47350b1115679c59fd303ac457444a8"
+SRC_URI[sha256sum] = "7dc7fdac82a42ce2ed78e00270b69d69e7418a620e8e30791191fe52f0fd3eda"
 
 export INSTALL_MOD_DIR = "kernel/lttng-modules"
 
-- 
2.55.0


