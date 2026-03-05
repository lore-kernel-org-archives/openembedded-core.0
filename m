Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289AEEEF32F
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 08:55:51 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39956.1772700949047341643
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 00:55:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jkKB9Tp6;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4807068eacbso64801405e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 00:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772700947; x=1773305747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f44y10boasrVvjD7pLzjbdEOwWhty8Ztk3YLro0e3mY=;
        b=jkKB9Tp6jVqZvqlMBJpcZqNljZAdiyYuH1ladd4WfizXKjUBJHSY8bD2Of74BSadDF
         4YRRQffv8HagmvouDEY0cDREvG+TI8QkmyNGcWwss0OnjN3wzxrdUKh5TRaU9Gojed7i
         lmmmpyLLdIVpKZJODvZn9h5pWw4HPiLNMHc84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700947; x=1773305747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f44y10boasrVvjD7pLzjbdEOwWhty8Ztk3YLro0e3mY=;
        b=lFdfcDeOkjiouvJnt3irS38XkbedeP6IO4kpo6OkeD3Cim9cQeUJ8QAFuAHPpCZ53N
         ObQGg4XdXZKtdAelc7JDzg+eQ4N0iBgrsPrCKLZs1EpPdFnN7ml0OuyT5Su5BYxBbQ6t
         3tvREcmb8j0d4CjTp07qpip2V99Pd4QwY6XBmzGB4t1DaGDra6k5iR3HVwl7Cccodvz/
         Pt/7OH6B5phFFOo3qJVpmWH9kfgT+NPOO44Pf+iske3yiR3TWwwOxgGoym75htUC9Faj
         Zzgn0n2WjN4R36Dhri8WWZf1nS9laHLA07GKSIndiHMOgPFTmm3jzVBNVrKpchQsbtSZ
         N7sA==
X-Gm-Message-State: AOJu0YxXI6D84Iy3qMfpux2s6Pv+TtnG5RYS8OYfwMJUg+6leJinIKQT
	4LhW37i2oIljnylq4UOM13o6FLDHLf16gPjeuEotwRIRO3OYRv3j/tE9ZIlsU7Qhq2DCvwIrwUV
	RpHED
X-Gm-Gg: ATEYQzygOY4a4OpoPowiobStvnIvmejrZ0N0YGbQWozMU1bCFv6DKvcfU2hLwPz8fQS
	K4tVfglhmWd+9as//Uml+Yko6xGJZQIJB+aXVWt8E5z/cVMAuRORyohhluebYFPCndTuguMyijT
	in/vdfU9fgaimrA2o+/C6s+83w0MMhaord5EEFq1Ty5dElLQVYZoyf3dB8w8617DhikuJ0Ba2NU
	ABuMCdE/xdR4wDr0ldLQcHbeG48SokOtw9RRj96SSeKyqvtG8eiznXBJwaCW2N8sdA62Kd19JfX
	2xl/8/7nL4HppoQH0RmG+PlX6ivjloUBfH4SRZ2Dm+nfUMFlb2a2GQBrMjbmzRorCDFoSTvQXf+
	gwhFn+3Yfa+/BPcLin5zlATJsPdSew/KWZUiw4V42VS3ZzQ5BvCjv8sP1aLrilQRCELaDfuX4cZ
	maCSthUSCv0jgvevOn1krxI5ncxc2v3LbhXHLjofr5sfsgV8aaWieF+6d9sjbmyHZzFG5M2V9+1
	EVshMn8V+51sF6h23ToCIM2P/e6
X-Received: by 2002:a05:600c:3d90:b0:483:bf23:1915 with SMTP id 5b1f17b1804b1-48519849d24mr90935475e9.2.1772700947071;
        Thu, 05 Mar 2026 00:55:47 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm59405175e9.9.2026.03.05.00.55.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:55:46 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 02/12] wireless-regdb: upgrade 2025.10.07 -> 2026.02.04
Date: Thu,  5 Mar 2026 09:54:51 +0100
Message-ID: <6560f78f56a50581cc769c12d29f1795c9dc39cc.1772700454.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772700454.git.yoann.congal@smile.fr>
References: <cover.1772700454.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 08:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232454

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ireless-regdb_2025.10.07.bb => wireless-regdb_2026.02.04.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.10.07.bb => wireless-regdb_2026.02.04.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
index 68ae3b0464c..2f7c8160434 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d4c872a44154604c869f5851f7d21d818d492835d370af7f58de8847973801c3"
+SRC_URI[sha256sum] = "0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6"
 
 inherit bin_package allarch
 

