Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9C3C07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 19:30:46 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.15235.1664307043444696184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 12:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OWHc+019;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id r7so16558034wrm.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 12:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=Z1GF9tCznggUXHucQVxftamIJTHWBabltWMe66soT54=;
        b=OWHc+0195Swb/TNGGftzpQkXBZR1Jo38EF4kt5dWxFreYrx0M1sIXkknkIyIsWSp/T
         MjMrydN2c14mPbm0G2mMnEXSOrPZDxShYT9j+fl90PMPvhFlLkoksusTmGgHX6gZas2B
         p4ldaZBqCE0kshGGlHIT4nl8H+cmtGTt5xXmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=Z1GF9tCznggUXHucQVxftamIJTHWBabltWMe66soT54=;
        b=Mo1VtJECTJMIjyUEk4qCsCIZ+mZME2lq6/H4W2tpL3dJcSlaKmw9QZQtZBM4wGZgUU
         DO8HYvAL8g8vow9dI7xJVQXKjdyVb9CCXzS3XgPv25GQ2gh4MIuMV+jWTyxzGD7ZsQYY
         dODt8JEwO9+P84YB8uhYtvjYkrgofqt73aKeFvpU3P+KJZMZCRFX6w/evLxUo3YUAjh2
         gCiQntwRSnCgLcgxgVCxpT+veO8ERO3ikfP1uBew40N9Lssp3FHY3lvs7Ba43e5l0tqO
         3LT+qjHRCdz8R8FDC+m4THvVJPbKVlflwUhvG9ba7xbzoQ2tRSS52Y9iKHPB/iqfWX6V
         qHlA==
X-Gm-Message-State: ACrzQf2JLIG/L7oN1PzwCC1FFp4fNZMMAxo7aj3l/h6grYzuXSkeSWzw
	XKXvNbnxXSeadYkmauxmmlkY9LaGoRGx5g==
X-Google-Smtp-Source: 
 AMsMyM5Joos6qYNDvWGXul/5fqRN58xFUHovOEyLU2IUGQAabzEIBFhZilZ2hg+MFbSdJCsM2XREeg==
X-Received: by 2002:a05:6000:1849:b0:228:c848:2593 with SMTP id
 c9-20020a056000184900b00228c8482593mr18223321wri.557.1664307041051;
        Tue, 27 Sep 2022 12:30:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d4c9:c3bb:4c2d:18a5])
        by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c204b00b003b4f86b31dfsm15025919wmg.33.2022.09.27.12.30.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 12:30:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Add patch to address arm qemu upgrade issues
Date: Tue, 27 Sep 2022 20:30:39 +0100
Message-Id: <20220927193039.1978470-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 19:30:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171129

Upgrading qemu to 7.1.0 caused some issues in meta-arm for optee and
for zephyr as well:

https://github.com/OP-TEE/optee_os/issues/5551

Add in a patch being proposed to address the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/arm-cpreg-fix.patch             | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/arm-cpreg-fix.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 659e70c0f4b..612abd240a3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -28,6 +28,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
            file://0001-net-tulip-Restrict-DMA-engine-to-memories.patch \
+           file://arm-cpreg-fix.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/arm-cpreg-fix.patch b/meta/recipes-devtools/qemu/qemu/arm-cpreg-fix.patch
new file mode 100644
index 00000000000..071691f8ca5
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/arm-cpreg-fix.patch
@@ -0,0 +1,27 @@
+target/arm: mark SP_EL1 with ARM_CP_EL3_NO_EL2_KEEP
+
+SP_EL1 must be kept when EL3 is present but EL2 is not. Therefore mark
+it with ARM_CP_EL3_NO_EL2_KEEP.
+
+Fixes: 696ba3771894 ("target/arm: Handle cpreg registration for missing EL")
+Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg04515.html]
+
+---
+ target/arm/helper.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: qemu-7.1.0/target/arm/helper.c
+===================================================================
+--- qemu-7.1.0.orig/target/arm/helper.c
++++ qemu-7.1.0/target/arm/helper.c
+@@ -4971,7 +4971,7 @@ static const ARMCPRegInfo v8_cp_reginfo[
+       .fieldoffset = offsetof(CPUARMState, sp_el[0]) },
+     { .name = "SP_EL1", .state = ARM_CP_STATE_AA64,
+       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 1, .opc2 = 0,
+-      .access = PL2_RW, .type = ARM_CP_ALIAS,
++      .access = PL2_RW, .type = ARM_CP_ALIAS | ARM_CP_EL3_NO_EL2_KEEP,
+       .fieldoffset = offsetof(CPUARMState, sp_el[1]) },
+     { .name = "SPSel", .state = ARM_CP_STATE_AA64,
+       .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 2, .opc2 = 0,
-- 
2.34.1


