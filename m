Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9A9FF8844
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:25 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32004.1777064236594046486
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IJnUTzyF;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso68160645e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064235; x=1777669035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UO0K0p/Yul7hDYiqXLYgopA3S2wKEZJQfL3Sid1hJy0=;
        b=IJnUTzyFoEiRTGV/FIap0BURzJXmydnFaUqrcKPcex8BbtJGgzWid9KHMJ5uWaRGs2
         rD17W/oPRMFWTefXWyvA5Hijk+0PE3QBe2PYIfsDPbWXRZI8Dg1WLzNqxeOAm0+8rwd0
         EfQFndEFeXCPQmrbUzaR2tec40+RH+NU+doGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064235; x=1777669035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UO0K0p/Yul7hDYiqXLYgopA3S2wKEZJQfL3Sid1hJy0=;
        b=l4DqLcwfzUj5IpA0wK0ty4tqxLFAa2eIX13J4QV1LHGGKXx2G6Ccv2mKFtNDnNtYdk
         JXCscECeUiwc8MyiQtHz/GErxw0A9Kt5BzXMpKwRmmdGjj+vxkXnBaO2udLPkFBsltig
         fwxok8l0gHXFr421fCe+l5LtF4W1yq3ZVGfbVtNkEdZVYXSr73yTNe40h+fZ925T6xo0
         J4mjVGEu3cIm0cn6NL74yh/vOp+gQQnHOkFVbKine0fq+F2MP60NkcKKU0F3uU2U0HUQ
         dnUHaMis8al4jq64+hTDegV06dL2l4Q6XC69ic14MRbszJczPaiDuqPkbMqEVAGZtp0a
         mj7w==
X-Gm-Message-State: AOJu0YxUSsEoIbLX6r5CpVdIJcj5op4YnH6j1lbT9FE4RlO4wrhcvxhc
	r1cT6DjjutqcH4lXb5uZ+YVMOFkz37K4CX97mlqPI8ulFcvvUbxbC2Uq9MUE31QBkwSgbr0oVdq
	B6TOVLjPJZWa/
X-Gm-Gg: AeBDiesm0OP8c6k/OtFYsKFVNr2Nxkv0k6bYevAxETBPYIMhtZh3ALfglEYIoIuXTa8
	eyOhKnOnvhrNfXInZ/XlwGoCL7P5FcpOA7axNlJCf/GhepomnRxTd+8ODa5NMDHBIqAS+GK+r2/
	tcGpBkVSfCquOqeTOEJTXADmTsn81H9Si5C0tOUREKBldEYqBr487inkotWZRstwSwohLjm2FNZ
	YVtduePGLv4UB+2IrjZZBMWEt0irgAt9CSl/ljcB6SQJXmUlnMI0ZcwmtyI+DcQUHnUIDbdMHmO
	jOCOSqoo/nVyTVbfNbTCyBEoMlkwqaW8CqmaDf7rRxVau6d9CuwVc0Z3YFrfK4wERJyQ9rcqzGm
	qk7WvLANBeR0C/VbG/1dp/HFBt0hzgGdlqiTPp9XaQavxXldKXsKkEfdhB46S7/x2CBYltpiGdH
	hAz6wfscBFZmmXp28T82SVAeAitrlBAg7Pe9ZQrXcrVDh5g/1PggsB30DKFzVQyorPbxor7pmwp
	2+wZAgu66C48vJ4GSCKpbdWVg6jXIAlORme/Q==
X-Received: by 2002:a05:600c:6289:b0:488:f941:aab2 with SMTP id 5b1f17b1804b1-488fb78a561mr463376325e9.30.1777064234735;
        Fri, 24 Apr 2026 13:57:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 66/66] liburcu: upgrade 0.14.0 -> 0.14.2
Date: Fri, 24 Apr 2026 22:56:05 +0200
Message-ID: <dc2df90b1d4f71023169d492f3819326e0e6c055.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235938

From: Daniel Turull <daniel.turull@ericsson.com>

Changelog for liburcu: 0.14.0 -> 0.14.2
============================================================

2026-01-26 Userspace RCU 0.14.2
	* Fix: Only include linux/time_types.h when __NR_futex_time64 is defined
	* Use __NR_futex_time64 in futex syscall wrapper
	* Cleanup: Remove useless declarations from urcu-qsbr
	* src/urcu-bp.c: assert => urcu_posix_assert

2024-08-28 Userspace RCU 0.14.1
	* Fix: missing typename in URCU_FORCE_CAST
	* Allow building with GCC >= 13.3 on RISC-V
	* pointer.h: Fix the rcu_cmpxchg_pointer documentation
	* Adjust shell script to allow Bash in other locations
	* fix: handle EINTR correctly in get_cpu_mask_from_sysfs
	* Relicense src/compat-smp.h to MIT
	* ppc.h: use mftb on ppc
	* Fix: allow clang to build liburcu on RISC-V
	* Fix -Walloc-size
	* urcu/uatomic/riscv: Mark RISC-V as broken
	* Fix: urcu-bp: misaligned reader accesses
	* LoongArch: Document that byte and short atomics are implemented with LL/SC
	* Add LoongArch support
	* tests/regression/rcutorture: Add wait state
	* urcu-wait: Initialize node in URCU_WAIT_NODE_INIT
	* Fix: urcu-wait: add missing futex.h include
	* Adjust shell scripts to allow Bash in other locations
	* Add support for OpenBSD
	* Revert compiler.h: Introduce caa_unqual_scalar_typeof
	* rculfhash: Use caa_container_of_check_null in cds_lfht_entry
	* compiler.h: Introduce caa_container_of_check_null
	* compiler.h: Introduce caa_unqual_scalar_typeof
	* Avoid calling caa_container_of on NULL pointer in cds_lfht macros
	* Fix: revise urcu_read_lock_update() comment
	* Fix: uatomic powerpc comment about lwsync
	* fix: aarch64: allow RHEL7 gcc 4.8.5-11
	* fix: warning 'noreturn' function does return on ppc
	* Fix: use __noreturn__ for C11-compatibility

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../liburcu/{liburcu_0.14.0.bb => liburcu_0.14.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/liburcu/{liburcu_0.14.0.bb => liburcu_0.14.2.bb} (91%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.14.0.bb b/meta/recipes-support/liburcu/liburcu_0.14.2.bb
similarity index 91%
rename from meta/recipes-support/liburcu/liburcu_0.14.0.bb
rename to meta/recipes-support/liburcu/liburcu_0.14.2.bb
index f03c9906326..12916dd0c3d 100644
--- a/meta/recipes-support/liburcu/liburcu_0.14.0.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.14.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "ca43bf261d4d392cff20dfae440836603bf009fce24fdc9b2697d837a2239d4f"
+SRC_URI[sha256sum] = "1337c49658367ca6df3c09a7c02303f752e2d964aa98518f4593f7781ad7aac2"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header

