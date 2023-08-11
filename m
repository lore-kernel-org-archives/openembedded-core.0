Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEADC0015E
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 06:31:11 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.37546.1691735465396711926
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 23:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mJvJqdOJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1bdba48eccdso1018875ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 23:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691735464; x=1692340264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lq1ttbZ6mX2Ki8HB8zEJVOCW7H3BvxeFkGkGrxiNmuA=;
        b=mJvJqdOJTGyXyC6SV+p1Elt95bfKdLUr8LbhdWhdUi8zDXfZpOM3e9ZqpQCNNkHd7R
         SuyWRjBj8jZ/QhLa4lXlwjg34zx2skzeT64kI7aPoly3mix3cZED8NQloFmZwFZAqLK8
         wYJ37obg70KcqkU+ZAPCubjfO4A0u6ymYJLOnb4XXJQivwQ5yY8j/eky0768+O8ULJtw
         nyIVYufOP9gjgU2W70MgwrMn+ao7TU291/X26SgZ377ytG2Gx0ZzWVt+vZYl3dtpNpfS
         Z9WVx+l6jML67dMVhGBRrPT38W2RBGWHVHotgyEUpe4PIt6LqtSoUDbOBrQ8hRIzqR1p
         KdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691735464; x=1692340264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lq1ttbZ6mX2Ki8HB8zEJVOCW7H3BvxeFkGkGrxiNmuA=;
        b=Enxqsqx5/IozT6y6hfrT8+aI3XltspdxmMlYdN0kk7isEeP+vthImLKdUB2Xat7qU/
         pVnNEih4WE/lHb1JviPX0dP6LIzqHs9GnbKexTbaegduxrHDVVqIjy16RVUpwrcPiB7I
         I+XRDBZP0i3RL3LjemoMZ0actZSoUJtts3c1M7BIzHcx0AgGcSL6H6binxJdvdBVhnYB
         sraoI4IL6f2Gsfp2+7QMq+chQuVpE4ZxAWJH79dG9v00khSU8r4xKyiOrlCz284rw+kW
         2LAI/tz/jlAoedIy6KqrZH8y5rs0Cx4P7JbqOUfDpFERW1BCp4oZaDX7BMU96V1v0mXd
         fvsg==
X-Gm-Message-State: AOJu0YzbCDW6v9iBQXd/Ir5KisdELlaDOtm7OGVxoOagUFxXag5qJ0gX
	eiljW+5rsHSd/+hJTQIkAbDGwGXVAIgCtQ==
X-Google-Smtp-Source: AGHT+IFvLZzL5NdHpYMCpXNxFIUcE8JGNItWvt3+xsbQJcqDX/5DGg/QYBtbFG+3AmdLUVQ2020r6Q==
X-Received: by 2002:a17:902:d503:b0:1bb:c7b6:493a with SMTP id b3-20020a170902d50300b001bbc7b6493amr1107037plg.21.1691735464354;
        Thu, 10 Aug 2023 23:31:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id m6-20020a170902db0600b001bc68602e54sm2952756plx.142.2023.08.10.23.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 23:31:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] systemd-boot: Fix build on musl
Date: Thu, 10 Aug 2023 23:31:01 -0700
Message-ID: <20230811063101.365985-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 06:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185828

systemd efi.h defines wchar_t from compiler provided __WCHAR_TYPE__
therefore we do not want it to come from alltypes.h in musl case which
otherwise will end up with conflicting definitions of wchar_t, defining
__DEFINED_wchar_t ensures that alltypes.h does not provide it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd-boot_254.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-boot_254.bb b/meta/recipes-core/systemd/systemd-boot_254.bb
index 4fee99beada..642a5fafe74 100644
--- a/meta/recipes-core/systemd/systemd-boot_254.bb
+++ b/meta/recipes-core/systemd/systemd-boot_254.bb
@@ -50,6 +50,8 @@ RDEPENDS:${PN} += "virtual-systemd-bootconf"
 # Imported from the old gummiboot recipe
 TUNE_CCARGS:remove = "-mfpmath=sse"
 
+CFLAGS:append:libc-musl = " -D__DEFINED_wchar_t"
+
 COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
 COMPATIBLE_HOST:x86-x32 = "null"
 
-- 
2.41.0


