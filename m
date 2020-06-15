Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.261.1592258523884840052
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 15:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rETYzZmj;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: danismostlikely@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id g18so13950534qtu.13
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 15:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JNUUo9UlzJ1AyeHSQSyh3JrO19lx6vyOPSe/kTzyl2U=;
        b=rETYzZmj+Hvr7IkkFXKtLKy55/xEVV90L5qxhJ328fd3ONYLKqApmJcrm1x3YOSFyV
         1uwFZuX6zODxMG6mmTH8HmRJX9vXbRSczaJK7rb+HCSLcc+Q93yZZ1c5pA/2yfJ648VF
         NTSV97le8aEPiNvCMrKLTELN/s9ZEnyccsBo25XeGoMliddreCFPdRhvKt2bL21AcIg/
         12ozTbysFatki0ANih8nylO3LDPx8X7JbJ4EklpcToLS8dan7BjrI4fi4EGlUxhebHta
         F6U28FnOOcoApGKAiObWdLkb91v/jHhtWzDwc9TjsVUXOG1ECklHn72K8S0qp/eAjKzb
         706g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JNUUo9UlzJ1AyeHSQSyh3JrO19lx6vyOPSe/kTzyl2U=;
        b=mUqM5xH5H8hGsXxs/XrC2H4pmyB3/ruuPKIiCt2sxCD1p0XfyOPLjoaPCvdU4lcSNr
         MspPOeuncE0FVs2CoRzu3jFP/nOGPIFgjLKO0a74yeBiGTQnM1lE8UWusSwbpCGDHt8Z
         VgfIX33Jtf+g6O4QbR6TYicPLVSlmp2mtbTQLu4R0ibBH5fqmc87GE5O+ffKU28DnL5D
         v+iL8WAQXK+yPsacp4ptmpLyT9ttSY4nlZv0hYrg5qQ4Lpt+SPMqxg949bkzv8Ujr8xt
         UqS4Io+1SCBHeWQOnlCkAy5ci0NwcirG/azQ32jLAiveoW0hJHNE2xLg5ChuaPlI1seI
         Qtmw==
X-Gm-Message-State: AOAM532fn0l7pL+1LUKrPBRVVCoP1tTbgi3FrFqOYDYsD3nej5WQ4jlv
	fHVgCDdMwJdGhyPCkM4UMlNbvkQBXVM=
X-Google-Smtp-Source: ABdhPJxEIO8nfXwvtysgLU/Dw0iyNarf0yI7F4+Iiet28MCt+hWKuwtqRME1Is4yMvS1vKVU4L8hQA==
X-Received: by 2002:ac8:4b50:: with SMTP id e16mr18724042qts.159.1592258522923;
        Mon, 15 Jun 2020 15:02:02 -0700 (PDT)
Return-Path: <danismostlikely@gmail.com>
Received: from nebuchadnezzar.local ([2001:470:30f3:1:bafd:2698:c02f:136a])
        by smtp.gmail.com with ESMTPSA id 79sm12200056qkf.48.2020.06.15.15.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 15:02:02 -0700 (PDT)
From: "Dan McGregor" <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <danismostlikely@gmail.com>,
	Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 2/4] sign_rpm.bbclass: ignore thread count
Date: Mon, 15 Jun 2020 16:01:41 -0600
Message-Id: <20200615220143.4018104-3-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615220143.4018104-1-danismostlikely@gmail.com>
References: <20200615220143.4018104-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dan McGregor <danismostlikely@gmail.com>

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Similar to sign_ipk, ignore the number of threads used for signing
RPMs.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/classes/sign_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index 64ae7ce30e..73a55a512d 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -64,6 +64,7 @@ python sign_rpm () {
                      d.getVar('RPM_FSK_PATH'),
                      d.getVar('RPM_FSK_PASSWORD'))
 }
+sign_rpm[vardepsexclude] += "RPM_GPG_SIGN_CHUNK"
 
 do_package_index[depends] += "signing-keys:do_deploy"
 do_rootfs[depends] += "signing-keys:do_populate_sysroot"
-- 
2.27.0

