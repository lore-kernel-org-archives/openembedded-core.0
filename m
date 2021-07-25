Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.19344.1627229493612302976
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jul 2021 09:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MShgjHVC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id h14so54135wrx.10
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jul 2021 09:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pleVD02a/4AuYHRBbX7v4RH4pAHtVpNSwuumHQs6kbM=;
        b=MShgjHVCVmIlQFmldL63cs3W9bwo11LbNn+fLBw3ABDUayLw+vXl60gAcYUXdDCEG2
         +Mcl0sVm2dBD4Cn78WRQCAuSQjP8A1qgCviRbKIgSTazSebSlkra145oGkOjkacXLhjt
         5xtlEcpwSLXq+ZmMxsxi1T7x0a39PsA0NLZDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pleVD02a/4AuYHRBbX7v4RH4pAHtVpNSwuumHQs6kbM=;
        b=aPL4/1qJP6lh0CqSBm7GJcZ9bLTzQkRYdnZXNv11TujXpR7+A73l3eAS4TfHrtZtK3
         YCcsNnEPnY5QD6cObUEuBE6t41BQzvH43iW5C7jwIwVWNt02xzV8Pd73xIQl5gYzHAw7
         qCGBPMLQkRVbdDIuri7BaiWapTXpyr7y2S2YOXLRNbYip+DRLzGUC8t2Rq2Y+dEKrmkX
         UnhQqdffuIjUAyLvmoGk1iGliauVs0DjsPa8ncuRz1WoGMiIY1eicYxZg9L6OE5AFi+U
         qTz424QZczt3cD396gsRkzPzuGFg7m+oH+Cj//YMYy/3mTJEWl9jDrTd0HJI3IimtdCs
         1qrQ==
X-Gm-Message-State: AOAM533C6ftmWy17s3Z9gbDjjZO4OlLtDpXEmyXRcsuuIqM9Gbl5HhG3
	SDdEq0MfqtAVR9DQJaTORdI8sHWjp1NIPA==
X-Google-Smtp-Source: ABdhPJxvFhsOA628Mu6o1e8F1/I/hJoPQJqRpb08k+mQT3nwjuxUoyMv+PYYBaTC5skUvP+g1/Wskw==
X-Received: by 2002:adf:ef05:: with SMTP id e5mr14786717wro.232.1627229491771;
        Sun, 25 Jul 2021 09:11:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:a8d8:1657:c068:d9be])
        by smtp.gmail.com with ESMTPSA id 19sm33423250wmu.17.2021.07.25.09.11.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 09:11:31 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libubootenv: Drop defulat-env RRECOMENDS
Date: Sun, 25 Jul 2021 17:11:30 +0100
Message-Id: <20210725161130.3170919-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The link back to uboot's env is causing a ton of pain since it is making
this recipe machine specific. Some machines may use uboot, some may
not but you really want an architecture/machine neutral library.

Revert this part of the 0.3 upgrade (OE-Core rev:
02d55cd35aac15095fc44f0cf8f9e7a71638f485) so that we don't need some
of the horrible workarounds being seen in other layers. If a given
machine uses u-boot, the env can be pulled in by the machine directly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
index 306296922c3..488a9df7920 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
@@ -23,8 +23,4 @@ DEPENDS = "zlib"
 PROVIDES += "u-boot-fw-utils"
 RPROVIDES_${PN}-bin += "u-boot-fw-utils"
 
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-RRECOMMENDS_${PN}-bin_append_class-target = " u-boot-default-env"
-
 BBCLASSEXTEND = "native"
-- 
2.30.2

