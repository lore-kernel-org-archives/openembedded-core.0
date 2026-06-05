Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C575CD6E5D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 09:13:52 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4562.1780650826096564946
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 02:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FbXrGrBZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso8191865e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 02:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780650824; x=1781255624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=m/sFfLqXzzj6CqtVc2VbwVlLx3iGyeeDc280WK5LagE=;
        b=FbXrGrBZKjaLKt+SMtr7ULZhPOYDqurHbiBczPl6FgMUyt6xLUYYDYbtvsbFQt6pMv
         VJ+n5ty+n/lVVn68g+FPe5MXwGFu54j66h33bic9O+H+kNyd3pK45GvfU5s/RoTAL9q3
         yXrWnUtFItgWYyF9CjK54pNRDTVK2WD0Crgc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780650824; x=1781255624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/sFfLqXzzj6CqtVc2VbwVlLx3iGyeeDc280WK5LagE=;
        b=Z9xTu22jZM/wNNWhd+JnEzEowMjTYaPHYCkXENxXoPQpszxSIXwZk+isTzlyu6kQRo
         srhFrM2wD4qAeRAR8xM+KzmE4gQ6Ys4iJS8KGLTM2eh9/6w2ovebEQpPQX3RoYptG8ut
         1ty3v8OAz38dSH7u50Yvvugd2a5bJO9J7kkUylbER1ohBjTJJyZzjZPLdJUDDCQ2+d7Z
         Ck0aQj9tkeXj4vaiO9VOo1ntQKiZJuguQ/V4q0ODBE52I2SKOcPQ4kFg6c7Jqi1C0TOB
         Rw2k6m3t6Tq9VTzpsQhE3Oemk8ftjPKp+D/x8HxGuxzHChSdfFJFwe8gPHSDkeRSNfEE
         oyMg==
X-Gm-Message-State: AOJu0YwZnscuhuyb4Dtdi8BGWMM7EC314Q3m786ADBG5a0PoL4HxGx4d
	IyGL+jZJfaWCk3o9/WuBdLdXofaUzsazVmoGbrH5dhpVR5P/S13tM8SaxhD/EPa/wHETyvxGx5b
	rPKzQ
X-Gm-Gg: Acq92OHhlOaE6REiT/L3SeRCWh4lgESAd7nq8J3hukcpmIER98jsT4+JeqE/w54r/Ut
	/QdQb6q2YJm3jiAm62pbv3v3g8k6Co639N6NM//wWtioaK86ek3LIwM8dfkakB4UYAjEqxcmjYC
	L6kBVJtKT949NJ8BOA9c9M+3uJMZz0lkf2AFY9SxVFwIGrFJHyb31EMAdYAGxIRBL2X0f+lHYcB
	YyP4ZEcUMBygfvXOXuaXYiGKvhVnju4WUiUOrQgjlSPopeaDWn4dvvfmkIZ5EK92/cGFuSAN5B0
	mXbx6ZBCkNax3lYTjqamarxEKJqlgY8sxjCxJyiMEBF8JhzbuSVPYV59mFsJlBRGT7ykQYzskod
	tweI4AJyOl3Nrjodp21buSnRnh+O8uJ/zumKtoZ0SFOqqnRcqM0Al3cmLUM1x6dxSJc1GOXL2Gb
	vvoEdO9sOOtkbDExZq0qlsRQjnlr3ARibZNkzEizTZnO89azNj9/rg9AcHdnKy3mY=
X-Received: by 2002:a05:600c:3e0e:b0:490:890a:da46 with SMTP id 5b1f17b1804b1-490c25898famr37356965e9.2.1780650824189;
        Fri, 05 Jun 2026 02:13:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:176b:6db2:d527:85f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3e59f5sm141510315e9.14.2026.06.05.02.13.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 02:13:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sysstat: Add missing xz-native DEPENDS
Date: Fri,  5 Jun 2026 10:13:42 +0100
Message-ID: <20260605091342.3248644-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 09:13:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238156

sysstat uses xz to compress man pages. The version from the host may vary
and hence make the output non-reproducible so we need xz-native in
DEPENDS to make the output deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/sysstat/sysstat_12.7.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.7.9.bb b/meta/recipes-extended/sysstat/sysstat_12.7.9.bb
index 3a06078e0e2..ffc7c0ac373 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.7.9.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.7.9.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRCREV = "b8f987807e7c7ba5c1b2ca8b7b1e9d80e61bce6c"
 
-DEPENDS += "base-passwd"
+DEPENDS += "base-passwd xz-native"
 
 # autotools-brokensep as this package doesn't use automake
 inherit autotools-brokensep gettext systemd

