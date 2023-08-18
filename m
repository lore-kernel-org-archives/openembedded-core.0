Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0984C001DE
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 10:50:21 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.8606.1692355818401284915
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 03:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yuluZ6TY;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4fe55d70973so912684e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 03:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692355816; x=1692960616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jYa6Bt+lAoivigIe/De7wRZ0oSjUEH2xQaQrv0f9Oa0=;
        b=yuluZ6TYo8rjiBRAGnPFFH9OmHuMvoXAaVKwrG4gdINWOf5iM+JRVjPmqOEBZFolzK
         +smzoJa8DYK2Mf5dF8jvMowF56ufMjgSDemKjTjtELzSK/8SHGAtQwKzB+KxA5+XSnl+
         lzGS6mVK8I5EKGAsc9lQ3w30R2xcheQfMHJKeRiWuUapqIlV1MF7mPdbBrC2OLQUt5al
         VvyfGG0VM4jInsLImCFT4FzQWPTdpLeZuYOUY8gy5j8TMOEUHN1xuweHcw7hlit4hWi5
         34Lo9nz3xYOyfJAftjcgZS/3xl3qTDmCrvcLiLF1DYQxbPTVZf6jRG8QnikfEW9FdmQz
         WTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692355816; x=1692960616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jYa6Bt+lAoivigIe/De7wRZ0oSjUEH2xQaQrv0f9Oa0=;
        b=S3Wtn2ShIgKMIN83/AGtabZ1j3KqXtB666ydEs2nPInhdeBBrMcWLmxOC0jLFelMTD
         gBmqSl6PMVItvin+LJRqXjkfIwvbixGL1cSVow3bn9CnG8rKMRMEL1jwyZdLH2ZcH7Ax
         DY+RBKX2DKRughD8NZD4SO41HNh6uVdlccM8Qhog/faCpH8Fo8Uaj3QyWrEtSt0I//ox
         wvkttITfx+PNjv5mn5DSQoZv2q4xexR8noLc9koy7NwpqEUZRatR+hiWQPy4kyisb0X0
         zezZaokY9WXiLk4jS0eiBZtw4qHOj0/ydo39z+W3IFU9Z+FgzsRHKJBydBlua98TTk5D
         SkFw==
X-Gm-Message-State: AOJu0YxDUTprY5ACiYBFVfX/ee06vZo9Sp+JmI32da05vaRr5J62LF4i
	RgO7REbADlKZBixWu4eLNAOBzeWtC4+deoZ+FaE=
X-Google-Smtp-Source: AGHT+IGjcAN3NiBj5bT0FuLzmtrc+9vlVrL42HvA/20XKQh6l6l+saBrH78ezKx0reH4uKBqqkicXA==
X-Received: by 2002:a19:7018:0:b0:4f8:6ac4:1aa9 with SMTP id h24-20020a197018000000b004f86ac41aa9mr684175lfc.21.1692355816019;
        Fri, 18 Aug 2023 03:50:16 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id ep8-20020a056512484800b004fe48a27fa1sm293764lfb.114.2023.08.18.03.50.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 03:50:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mdadm: disable strace on rv32 arch
Date: Fri, 18 Aug 2023 13:50:08 +0300
Message-Id: <20230818105008.16113-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 10:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186357

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
 .../mdadm/files/broken-strace-rv32.patch               | 10 ++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb               |  4 ++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/broken-strace-rv32.patch

diff --git a/meta/recipes-extended/mdadm/files/broken-strace-rv32.patch b/meta/recipes-extended/mdadm/files/broken-strace-rv32.patch
new file mode 100644
index 000000000000..a58495008605
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/broken-strace-rv32.patch
@@ -0,0 +1,10 @@
+Index: mdadm-4.2/tests/07revert-inplace.broken
+===================================================================
+--- /dev/null
++++ mdadm-4.2/tests/07revert-inplace.broken
+@@ -0,0 +1,5 @@
++fails on RiscV32
++
++Fails with the following message:
++    strace -o /tmp/str ./mdadm -A /dev/md0 --update=revert-reshape /dev/<...>
++    tests/07revert-inplace: line 40: strace: command not found
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index fa50325f1f71..3085222061f0 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -126,3 +126,7 @@ RRECOMMENDS:${PN}-ptest += " \
 "
 
 FILES:${PN} += "${systemd_unitdir}/*"
+
+# strace is not yet ported to rv32
+SRC_URI:riscv32 += "broken-strace-rv32.patch"
+RDEPENDS:${PN}-ptest:remove:riscv32 = "strace"
-- 
2.39.2


