Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA381C77B7F
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 16:57:48 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.2224.1692377864963422098
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 09:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QCtIwlzs;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4ff88239785so1645857e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 09:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692377863; x=1692982663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8k6oKeMzrtIk6B6pEU8NDwx4SCr5b/hv7moiofWa3Bk=;
        b=QCtIwlzs373ohpbS3Z5h/5/zxJYQSb99Uckvsk+mSDONSbPodSjYk61Z3EYOc/XPFQ
         K2EV6BZfzNLRGEdBFWSEDgxJzUvTQ7PM3fyL/kpxR5L+RnIvfjJNKaG42obJviZF+gss
         BOreoAcnz+jBfThWQHt2hjJpEn8TTjTYhnce/uzAwum93PP5kSByKfPhekSQzpAzq1Kw
         2icLjTvudgHAPjgIplmYii7eeB8Ea7qi/L2Y2iQNg3DUys5gsbF0My99hkxuKCnxqyLR
         sXUD8GADeCuawwsTvplASS9QOMnHWShqlPRmOjJuT0FDFtwetwXjYqBDInXGYnBZA9Vu
         2t7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692377863; x=1692982663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8k6oKeMzrtIk6B6pEU8NDwx4SCr5b/hv7moiofWa3Bk=;
        b=h9xkjPR1Qmu4Tjh5brzicpOP4tkoqJs+FgQYbRQym1fSffMyWSC6uJlfgUlpuTSF0u
         ow0Y0j8IAIBU4YVNJlYkcCiKKVRYbDV10bWU8bCd8M6+tK//Gjog5MJu5Cp/RRZSLr+u
         kgr/Q+G+w15qQ9TRB6jKxL1iFiskX/GdqlWihAeTHJRs6ojWOxx5PaSeYvsqaOSAQBEY
         jhygERP26DWp6ED0Jyp9x8/9Qz2pfCA26rXJmFx8XB8wqBDvy+u+rGxMR3/Pzth+5tcg
         /5u0Vg3Uo6o4r12BS/nkq2d2KbU41Hrdcl9Qw1yxGjN3CNGOA1zu+/aZBJYNcQJypc3V
         qb3g==
X-Gm-Message-State: AOJu0Ywyq1AZkG8Gm1l5/jOYunWPKBZgPDwOvr6TrTmDEblQ0iyAtJls
	NhCJIb654IPdbq3UMrNGIvy9nc//PvQ31HED35g=
X-Google-Smtp-Source: AGHT+IED/flHScoMapksd6J49hraytHioK0+UR5IzKO4hiiVRESCOfN239bteWqj4tyoRKiWr6O7+Q==
X-Received: by 2002:a05:6512:3f0f:b0:4ff:7e04:7575 with SMTP id y15-20020a0565123f0f00b004ff7e047575mr2640125lfa.14.1692377862704;
        Fri, 18 Aug 2023 09:57:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q28-20020ac24a7c000000b004fe10276bbfsm402478lfp.296.2023.08.18.09.57.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 09:57:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] mdadm: disable strace on rv32 arch
Date: Fri, 18 Aug 2023 19:57:38 +0300
Message-Id: <20230818165738.23592-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 16:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186381

strace program is not yet ported to RiscV 32 arch. Disable corresponding
dependency and test to remove dependency on the non-existing package,
which otherwise breaks building of core images:

ERROR: Nothing RPROVIDES 'strace' (but /oe/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb RDEPENDS on or otherwise requires it)
strace was skipped: incompatible with host riscv32-poky-linux (not in COMPATIBLE_HOST)
NOTE: Runtime target 'strace' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['strace']
NOTE: Runtime target 'mdadm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['mdadm', 'strace']
NOTE: Runtime target 'matchbox-terminal' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['matchbox-terminal', 'gtk+3', 'glib-2.0', 'util-linux', 'mdadm', 'strace']
ERROR: Required build target 'core-image-weston' has no buildable providers.
Missing or unbuildable dependency chain was: ['core-image-weston', 'matchbox-terminal', 'gtk+3', 'glib-2.0', 'util-linux', 'mdadm', 'strace']

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-extended/mdadm/mdadm_4.2.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index fa50325f1f71..82b8175b9d6e 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -126,3 +126,10 @@ RRECOMMENDS:${PN}-ptest += " \
 "
 
 FILES:${PN} += "${systemd_unitdir}/*"
+
+# strace is not yet ported to rv32
+RDEPENDS:${PN}-ptest:remove:riscv32 = "strace"
+do_install_ptest:append:riscv32 () {
+    echo "disabled, no strace" > ${D}${PTEST_PATH}/tests/07revert-grow.broken
+    echo "disabled, no strace" > ${D}${PTEST_PATH}/tests/07revert-inplace.broken
+}
-- 
2.39.2


