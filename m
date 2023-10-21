Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D45C25B42
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 15:28:47 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.81415.1697902121973414354
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Oct 2023 08:28:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nUCatr2T;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.54, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-57de6e502fcso1136504eaf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 08:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697902121; x=1698506921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOMFsIv+aWQIRsxN9BF+HC64BGzKudQ9Z0XPZzPb5Kw=;
        b=nUCatr2Typ46WIr94FUrHonsqZ+LNs+wbDhY76i6tKKp39uTpKx46H47YeF31sjEFu
         wdNjEM1RT8IgerHgElfzLR33TBDa6ruA1B8xnDmylReQr2toKVEAdkUWNLXwm++iqAlp
         aAx/qe2coZPSI+LWNVOfpd65Fu9Z6Ujx/uESfZKOPI4VSHpBpEek9vFgcw1qYCBmb/pt
         cn3Sj1tdDggLeUGUVQsxBucucZw0QaGzv6HDqFWjT2oemn51AeOm5tQvNyZV2N49wpAS
         tjogkWbJvNSb+3inVDXpUjJKTRZ4V1DMmKF8qwF6hCP4yvBdDJdRytbTKBndesqUqDCd
         aWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697902121; x=1698506921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOMFsIv+aWQIRsxN9BF+HC64BGzKudQ9Z0XPZzPb5Kw=;
        b=RSZNZUPrnjQ1yH4NQEqil3cNbeSd87lWYuHPBHTIk6ukjGcIYwo1D9T6zmWFPEXYTe
         M8Q+dVEN5liFAx8bkd2YsX/6D4wXOe261nPYmHz4L7UircnbR25kB2Zi4vhelLD85R7E
         9gW8ShQYAXwJ4DkqsoWZ/MO16Wn2W9z8Ylne6R2eKfl7M18hFwl8CUXoJJXQACFKXyik
         lZRVM8DLL1SX2XYM2pbaKvqQubZ5jMjWNkdMZx+WLmk6cX5cr1V6pKnwwWK2Dm7NQdiV
         JY5tdeIIy/hP1ByyhrVOpTW8sf1HynBhHIpWeaHycXYePgjybaqwQcEqbV4hb5zoSrWi
         Cq8Q==
X-Gm-Message-State: AOJu0YwdxEynXFVDxV8OP0VeKO8cO3pfncFPxG6Bp5ydqHjWg/gKPyOE
	maDatJRXf1sGuwvNdCPQz8YEuma/UjoCE+qNsZU=
X-Google-Smtp-Source: AGHT+IG3YYff6yzocq191thMmbEs23B/G5wXW6qML5/PF78KRO/jXz+m+5Gy1+iKX0OPK7BWgZ13yQ==
X-Received: by 2002:a05:6358:9146:b0:13a:4855:d885 with SMTP id r6-20020a056358914600b0013a4855d885mr6680079rwr.10.1697902120708;
        Sat, 21 Oct 2023 08:28:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id by2-20020a056a02058200b0058c1383fa8bsm2876515pgb.0.2023.10.21.08.28.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 08:28:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/6] qemu: ignore RHEL specific CVE-2023-2680
Date: Sat, 21 Oct 2023 05:28:27 -1000
Message-Id: <a1256b8fa415002eee78427cc292b866570ee267.1697901991.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697901991.git.steve@sakoman.com>
References: <cover.1697901991.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 15:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189588

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5526eacb96..83bd5d7e67 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -125,6 +125,10 @@ CVE_CHECK_IGNORE += "CVE-2018-18438"
 # this bug related to windows specific.
 CVE_CHECK_IGNORE += "CVE-2023-0664"
 
+# As per https://bugzilla.redhat.com/show_bug.cgi?id=2203387
+# RHEL specific issue
+CVE_CHECK_IGNORE += "CVE-2023-2680"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.34.1


