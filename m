Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADAE8D1F9A2
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:51:10 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.4783.1729018263770644795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xn8yoYXZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso2046408b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018263; x=1729623063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fyu0BJXC2Xhje3ifuya7XT7eepCZnL7ypb3nNV8clYY=;
        b=xn8yoYXZqmMlRefkDfZyHcqufjXr+eSOjIsj+UkRv1wDQWNA0BjG05U+qqcfgNPrmo
         LuJ8OH3u9mthbkGXdl2TkeGrcM3rebhUuNICMTA8z+ymhRUSiQltzr+Sa9onL78+A1pM
         vqujlpOp5pILOKut97qKFxoNi49f7iUiiQQ/UnsqaEyyNViiSgcq2/Jt74+G8Z6JjiUC
         Pg3Pd/5dLyHrDCBbC5Tciy4DH9RpqwfhmaoFSgl1hVhvz8+21mz/EmaJ2SLWvYDo36lu
         Jytqdl2VsXb5Ukgs/cstr49bvEeafbvl/TOsiTLA0TvnQ0uiNnTLaW8j3J5lbR8q6Wxx
         KYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018263; x=1729623063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fyu0BJXC2Xhje3ifuya7XT7eepCZnL7ypb3nNV8clYY=;
        b=Cg53JOfGllXY7Yk8OLO9mj9szeAWdgKx3jOOMUK08XLHHopzX64i5EzdXV0haWGCuA
         iKXQQwDwhEmdCk1bNA7GBByiQf/nyBZ/eqV+O/6DCSZ4QtrBgK7yNZxmIXrXhYiLDVEr
         jhQFGnouUjDu4u3TrRq8lIhuEwpYWh2G6DxSI6hetP2ZHXMTp+5tCk/xtWoVEza2J/0H
         wXAK9he9oPCKlUbDS7yZB8QMnZMz+wj5XyS6vKZlXS9fliiaQOXQTSW2VCiUWK/rzDSU
         vYMXsBlEno5v4Vyj5kaBToikOTCIrI0sBj+qX2SaZDCiWjrZXgKhrq3W96bZMAsBqPrl
         6xzQ==
X-Gm-Message-State: AOJu0Yx3kgBau1UQmhOS3R1o5EOJQaCXnAxCqv2A+u/VB7COSO6KHx/Q
	v2JebJPHCmmeWisu0hfuuFY/+daTqqS7mrwi2+u4WiwfgGCY7K7vMVOMExBX4ayhtYTXFQqWdGY
	Z
X-Google-Smtp-Source: AGHT+IEBLzui2OHgEIXJqHH6sMOHuB2uuWmxiHbxz2DTnEazLHxP7kTzd06nKTkCS3CppID+ScqBPg==
X-Received: by 2002:a05:6a21:3946:b0:1d4:eb96:8685 with SMTP id adf61e73a8af0-1d8c96c2cc2mr21985855637.45.1729018262831;
        Tue, 15 Oct 2024 11:51:02 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/18] rust: ignore CVE-2024-43402
Date: Tue, 15 Oct 2024 11:50:37 -0700
Message-Id: <6ed9968bf3e35aca316227ee23294c683f77055d.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205925

From: Peter Marko <peter.marko@siemens.com>

This CVE was created because fix for CVE-2024-24576 was incomplete.
Ignore the new CVE in the same way as the old one.

See https://nvd.nist.gov/vuln/detail/CVE-2024-43402

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/rust-source.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index b14221b6cb..8a8e48b8ca 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -22,3 +22,4 @@ UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-metho
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
 
 CVE_STATUS[CVE-2024-24576] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2024-43402] = "not-applicable-platform: Issue only applies on Windows"
-- 
2.34.1


