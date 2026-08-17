Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260D8C5DF66
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 11:21:45 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28067.1786965703081671986
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 04:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HOvGZC86;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so4653817e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 04:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786965701; x=1787570501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y9cYMxoROB0cy/gL7DFPe7uc7+7xJe+4I4GR3/Ohk7w=;
        b=HOvGZC86NvlhUF9MoGsaDmvbRtYX7/bez9Chr4+fIdHgKeL5VLK3iZ5AYB0qLChByv
         D/quACgVQQaQgMSfNmQk7V7ZqQWey9GAe70sHvLGMVTt2B1XJvfz5MciNKFO8oe0EOuw
         YQ0OUUk78jpI92xoDa87Kk0maCVEWNu5eWv6zvOZnBd5ALQzwxmpOK5ycipioev2rDwf
         1JQn70gtSFuAmPWPU7A9ZPMa1C0R+ubXeJO/vboVVv32Yemo43/+wisMAd5LSaBv6+gC
         9W87VmK/Spu0cPgxA2ymfQEoPHPwjkkOYWTo03ZLDwYoOnSKWCc7/pUfM5wx+JxECDup
         4PCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786965701; x=1787570501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9cYMxoROB0cy/gL7DFPe7uc7+7xJe+4I4GR3/Ohk7w=;
        b=oiVheXGlz1A8fw8orjFQaqMylhqq6TosNWK4B7xnxUD9oBBRemL+8VbTvszglPHt2L
         mZ52SGujAdKG5mfeMimHqp+nOd2FYnciZVtPTZSm4NALA1aJ27/i75fk/uNvhE2i2p5h
         9bCr52/Dr+UXROtILCSsrJFibCk0rORqqxPIXFXL2MQS5UJbp0t1KhNeEv4CH/I+d0bz
         Jd/nkm322hZHwOL93cjyTJJLJjywSUpXtou98oaDTu/95ChdR5W2Go+8Oi/MbxA8ycX/
         ogQJInB2AmJ8ku7JwlRsrBy8AkasTFoDY5zb3Cl45W6JvrFRBlqY+Zo/0sYf5iif80Ge
         nooQ==
X-Gm-Message-State: AOJu0Yx/zPpOOGBbjVPL2IDrkg6IxcTDp0nQF+g8DeE7sM/U2db7mldC
	3fpdXU5Hvp1kY6agmtRnLW4X57kbWTT+DFC4uSKOmpee74vdB0+c6R7HZCPtr+uSOAzp18Q8bFg
	crXb/
X-Gm-Gg: AR+sD13LgWqE9SWxC6vNG/AUf2xbzOthgt/lof0cpLWtIn51J6bKfhPKm1xEgIYJYOV
	cDmAb17EN7j4+Rp4X+024KYDH3hAz1WZekhYYm4LQE8ZEWMlnZIyACPbK0m4JXMCXFLI6NEVGd+
	8FXj074m1EDKW3QJOzUh/mQSHwtq20bgJ+6X6YWcvmi3WeN4BxYPcov5IrlLqe8xr0ddOvV7I76
	2oNzYEwPc/+ZRLfYj8BFQRaXbywMPd7wP9p8U3fMGCvVUnigLcuzzCYNP7FxpWFCDBjbDE+OD7c
	j15C36Wrdgks8nXC1GuTGARHtzW5dswF64Yr/TCWTCBQEAESMMNB10iFwxWP6isvnVmF90/aGsh
	00qhAq8+lxNnLHLMLQm25nMGnC6AF/P9bAC1N+y1kgrqAKqYEGoe+MKywGsN/BP01uraGnKV8ux
	h3ORWp/+lwQp0mAs5mWQNuDHwXU3TGj1BVyelwtrnCMpMRgTNLrtWMqxYzifD0nhINOkvLqF6nQ
	ai7sLdNG+ic5dA=
X-Received: by 2002:ac2:4ecd:0:b0:5ae:ba88:5443 with SMTP id 2adb3069b0e04-5b458f5fda1mr3267636e87.16.1786965700930;
        Mon, 17 Aug 2026 04:21:40 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa0e5esm318180e87.25.2026.08.17.04.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:21:40 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH v2 0/4] Fixes for kernel 7.2
Date: Mon, 17 Aug 2026 14:21:25 +0300
Message-ID: <20260817112129.1271154-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 11:21:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243613

v2: apply fixes to lttng-modules as patches instead of update to rc,
    copy only kernel/sched/ext/ext.h to kernel-devsrc

v1: https://lists.openembedded.org/g/openembedded-core/message/243418

These fixes are needed for Linux kernel 7.2-rc7 currently in linux-yocto-dev.
Tested with genericarm64 machine and core-image-sato-sdk image and oeqa
runtime tests on AMD KV260:

https://ledge.validation.linaro.org/scheduler/job/165060

2026-08-17 10:06:28,562 - runtime - INFO - SUMMARY:
2026-08-17 10:06:28,562 - runtime - INFO - runtime () - Ran 76 tests in 842.586s
2026-08-17 10:06:28,563 - runtime - INFO - runtime - OK - All required tests passed (successes=39, skipped=37, failures=0, errors=0)

Mikko Rapeli (4):
  lttng-modules: fix build with kernel 7.2
  testexport.bbclass: capture meta/lib/oe
  kernel-devsrc: copy gen-kernel-hwcaps.sh on arm64
  kernel-devsrc: copy kernel/sched/ext/ext.h

 meta/classes-recipe/testexport.bbclass        |   5 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |   6 +
 ...ix-x86-msr-Remove-rdmsrl-wrmsrl-v7.2.patch | 100 ++++++++++++
 ...-Rename-kvm_cache_regs.h-regs.h-v7.2.patch |  54 +++++++
 ...-sk_skb_reason_drop-sock-parameter-v.patch |  61 +++++++
 ...oints-pass-a-transaction-handle-to-t.patch |  63 ++++++++
 ...oints-add-in_fsync-field-to-transact.patch |  41 +++++
 ...oints-trace-transaction-states-durin.patch |  68 ++++++++
 ...-Remove-strncpy-from-the-kernel-v7.2.patch | 153 ++++++++++++++++++
 .../lttng/lttng-modules_2.15.2.bb             |   9 +-
 10 files changed, 557 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-x86-msr-Remove-rdmsrl-wrmsrl-v7.2.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-KVM-x86-Rename-kvm_cache_regs.h-regs.h-v7.2.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-net-constify-sk_skb_reason_drop-sock-parameter-v.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-btrfs-tracepoints-pass-a-transaction-handle-to-t.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-btrfs-tracepoints-add-in_fsync-field-to-transact.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-btrfs-tracepoints-trace-transaction-states-durin.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-string-Remove-strncpy-from-the-kernel-v7.2.patch

-- 
2.55.0


