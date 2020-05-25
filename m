Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web11.35174.1590426440173332038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 10:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YeMWnfbK;
 spf=pass (domain: linaro.org, ip: 209.85.210.67, mailfrom: daniel.diaz@linaro.org)
Received: by mail-ot1-f67.google.com with SMTP id d7so14258162ote.6
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 10:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R/EukZ3MDPfSKkV5S5/BO4d8+f66B5AID8I1zxQYj8s=;
        b=YeMWnfbKWz5LXRqb7T7ctf8yxk+FpT0QV7ZFZp0RKAp1rfXvr7iIxysYFcdydswyf9
         m8m/67FTFrGzS9AWWtqJrhoMfYONZNK0vB9AVScbH6fz+2nhjTQJq4Tyn12CcF0hIm7P
         ENdgWSqU7LRG86CMgd2aoS+Vf0h2D3zb0+ZUt/27g2XrzFZ8XiKF7k23EyFfjzAecRw2
         qOHK+HwbiXSRBTiHpHqpUBKyqLLhVMqJ5cIyTgaOglB16C30K72zkyFDiMZZuWQkH2Av
         RURjy42xPmC2F3S2G/KGVUp5rEzeJEZIjB6F0H5D1wtc1BaccUHphEhNCT0sYGb6Zqe2
         DfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R/EukZ3MDPfSKkV5S5/BO4d8+f66B5AID8I1zxQYj8s=;
        b=pVxi3+kVXpKe2wh6WsJFOp8YnQ32q3pGWEiR6Xx7hVoKxntT2AnN7R3Hhqmg+NTXYY
         VpMrmH2AjQ5bGE4trvk4y17ayPWjkRUxR2bmCAUkdkR1pbSj+0htYEEurDwECFp6mkMV
         hcmVtugZtWHUZjeLv6HjbI5l6DQ1lG7aUmj57h2qfSTBSIP7QEIbdInYNWeQU9ZiQfl0
         UwlNHsdueNtfZ+kgNKeO0+kj7G4TNNF3hIJV+y3U//auUqNtySrPsCNwnZi3AZz2wsue
         uobbQ4blgSjcnG3boiW5+VwJuiDPwTNr8ZWopWdwEFH18kRDRMFwYfRWF1T1tSWvriUJ
         05Aw==
X-Gm-Message-State: AOAM5330/2BQ1PzNvkKPxhGm463NR8gNz7VUbqMNAkB1YIwi1IC02+W9
	yimUAA9URE5g0ORXMKQcDVyrSizVfn4zYw==
X-Google-Smtp-Source: ABdhPJy2EtFuERNfux3drUEX67BmWnETtLf7zAgCbXCsVZHNyaaiMdcg2sYugQ8rKo8BLhQs7Le8Ww==
X-Received: by 2002:a05:6830:4d6:: with SMTP id s22mr13705061otd.330.1590426439105;
        Mon, 25 May 2020 10:07:19 -0700 (PDT)
Return-Path: <daniel.diaz@linaro.org>
Received: from alago.cortijodelrio.net (CableLink-189-219-75-147.Hosts.InterCable.net. [189.219.75.147])
        by smtp.googlemail.com with ESMTPSA id k18sm5239408otn.51.2020.05.25.10.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 10:07:18 -0700 (PDT)
From: "Daniel D?az" <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
Subject: [PATCH] ltp: Add net-tools as rdependency
Date: Mon, 25 May 2020 12:07:06 -0500
Message-Id: <20200525170706.14494-1-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The version of ifconfig provided by Busybox is not enough for
some tests. Here's an example of how it fails with test
netns_breakns_ns_exec_ipv4_ioctl:
  ifconfig: bad address '192.168.0.2/24'
  ifconfig: bad address 'inet6'

This works with net-tools' ifconfig.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 meta/recipes-extended/ltp/ltp_20200515.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ltp/ltp_20200515.bb b/meta/recipes-extended/ltp/ltp_20200515.bb
index e82f6b33a1..317a4e461a 100644
--- a/meta/recipes-extended/ltp/ltp_20200515.bb
+++ b/meta/recipes-extended/ltp/ltp_20200515.bb
@@ -89,6 +89,7 @@ RDEPENDS_${PN} = "\
     ldd \
     libaio \
     logrotate \
+    net-tools \
     perl \
     python3-core \
     procps \
-- 
2.20.1

