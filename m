Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9168EE77197
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 11:47:33 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.36753.1736077644775240140
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jan 2025 03:47:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SVga1Yic;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3022c6155edso77335101fa.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jan 2025 03:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736077642; x=1736682442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztXHlcJSQMWkrVqRgm4erP0BCf76p0M3Hgl2RkMo8dk=;
        b=SVga1YicQeSEDzwJ9zx48qDV35AMeAV5wn+k5D/T2a0LTgyD4HQ8kpEiecREbEhNLH
         eTzFhnvRKxfE9TjLq8yInjNOd0qEXZJD+sVxGlw9ux7xEVdJBco1r4vH/Rpgqie49ZTK
         Ga4vlefSq1tVQ1Jdg+lDgDUTwco2TM959O2bh82eTfl50GeA4FgDnfBtQ4m2+8xTEhP5
         1/in2nCWPs4iHOWFkvL9X4BTaGes0Dtz9vwajdQEkFLtxla2HbNpjRIH1NXp7fr2c1SJ
         YHnIZmSp8x3LdmcTvSZsTbcvZ7ssl/5/zL+e3myH8CBwWRUlv/dEYGG+E4bz/EPgw5nH
         R/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736077642; x=1736682442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztXHlcJSQMWkrVqRgm4erP0BCf76p0M3Hgl2RkMo8dk=;
        b=V/eyxddrl7jjYuzFLn67QAgZ6qhcducAQmad2r0zOMUFY47XJKBQBo5llRR+OroM8f
         6R5LKc9kvVfkLeY7hsRzZP7y9fUthAzqdPzhA53PTPHUQ+18moF5j7rGkTrrv+wYC4Sy
         mwUscbZv1MaS6j+kCz7DqDTNvKu6wis9HBgaEB5pQRekQYDw+pMaXotUAB8JQxgrksxU
         QVv8oRUDtQzb3A5kNczixH7ONaty/soGhtaGfopDAM85sxCzQwAbRc7QOi7k1+IceDEK
         kDrwrU8jv+r50mzncoxsG8RpbzOsynovLYx9i/OdRXOmqE5DhoancH9GevJS+18DiBqi
         tkJQ==
X-Gm-Message-State: AOJu0YxNg4KJrfwDTIT3h1uT1qBrhzOg16zeYd920tdfrboA47F1EHMZ
	2pZ+0TKEKT+99VnWwSi687wfNw+FexCg3sVRXlpoHvYohGI5v10+5WhqXw==
X-Gm-Gg: ASbGncu3V+FCUJhqIg/VRql3MTeqjmUN8n6zHeEMmr7vQJTDpHV5n4+Ce7iW1b49odB
	s8Q3BKZUUz7TVB8DujobeoHppqOF9MuYnbv8TXTJuFKjfHjYgIwBsXwaS6ddzes0gelONuLvmJ4
	BCzyYVE9/bIqJe0QsamYxNRo7Qj0Q1QQM3j/nhiBd49S7X9DQQ20JTzesraGzS3dx/voX1ZRAlh
	9YRz4AgZtLhB6vL+WE15ZJS/1TM44dxY3DKl76dqQGJvH7H1NGqh+LGOncNKMXX3nrlGv2C0MB/
	myPSeP67xDkEWQ/VAx7pqmmGBpdDxu0EPf5IqF8=
X-Google-Smtp-Source: AGHT+IFgjHsPWo3NkRvR5GG4FNdaPCvFvrzkXBWZ0Bvheemh5U+u4AOInsN+PBsh21/3wUEHX3rH5A==
X-Received: by 2002:a05:6512:1044:b0:542:218a:71a with SMTP id 2adb3069b0e04-5422953ac6bmr14866786e87.26.1736077641855;
        Sun, 05 Jan 2025 03:47:21 -0800 (PST)
Received: from peterliu-Precision-5680.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223821665sm4612817e87.177.2025.01.05.03.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 03:47:20 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [kirkstone] [PATCH] create-spdx.bbclass: fix patch error for recipes that inherit dos2unix
Date: Sun,  5 Jan 2025 12:47:16 +0100
Message-ID: <20250105114716.7188-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jan 2025 11:47:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209416

For the recipes inheriting dos2unix, do_patch will fail if
do_convert_crlf_to_lf not run before it.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/create-spdx.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 349ecfe6ab..26d586744e 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -810,6 +810,8 @@ def spdx_get_src(d):
 
         # Make sure gcc and kernel sources are patched only once
         if not (d.getVar('SRC_URI') == "" or is_work_shared_spdx(d)):
+            if bb.data.inherits_class('dos2unix', d):
+                bb.build.exec_func('do_convert_crlf_to_lf', d)
             bb.build.exec_func('do_patch', d)
 
         # Some userland has no source.
-- 
2.43.0


