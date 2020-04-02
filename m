Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.40.1585847124010374104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2020 10:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pNd9cpYN;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id z14so91285wmf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2020 10:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fbFivhSURY9bxaQG+5YS+KRfY9J8fIDZ1u6Q1ITd2sY=;
        b=pNd9cpYNOQRhYkAH7ej0ZI09svANZ42hIpUZufChL5r3V2qZnt7dth+dPdNh7HjuTu
         lD2WNtduytAy8PbORYBIil+u/kpZ47aq49s8xw3C+woqNTeIXLJndSlkotgvEAf90fIo
         ShoLHZIfuOxWEcfBsExNETrmx6Zw38POhdaPRSfEEusEglD8RokIogA3KOyVtuNJZNcE
         ohg1fzbSXRlF4s8zaIiAnKkli7GjYh2iRJkqyYm1cbNiwxlbYWjTJ/IN3cOLfx1KWrSc
         Bp4bsUlRQ/WRtxJm09OruSIeLGU1SetZZnEN87KvodK8ys0jcquity1bCD4ygNYE9mnl
         zDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fbFivhSURY9bxaQG+5YS+KRfY9J8fIDZ1u6Q1ITd2sY=;
        b=CGsbEuK4oRgKOYnE8t19/g4DpQJl8ustJu4bIi96fms3DUFaLTQcWsv90W4rshyXdl
         sezwb7hO1P+hWtBC2Zg7z3pqfGZAQkYUis2vINbSWKhnlEQmluAxyctZsAkDQwQ/hZ0d
         7+40KSUpZzfv99RgbN0n/R5IOHk9Ux+d77Stfe1o1vGeVMcmuEl2j8NlnDVa7Nmg8QJA
         vVpL5lAt2l+5p3BVxByIZgEKC21n0VL4UW1lmmZYe9V5LbwS8F/rdCQfB0PMNAwFJbAC
         KmESBt8PZWolb29+a4aEIOmDHfTMP4mRH3ZYlHULeG5p2RkZs7j2e4Q14jH0j1hL2RzS
         jbKA==
X-Gm-Message-State: AGi0PuaBY8YRhf/WIvxKrr/R/bY3lFBrRVZrdgE7aVjKJ5pEvJ0s308N
	SFO0wV1Jy62rAd9nyc6TjPSoE27k
X-Google-Smtp-Source: APiQypLf5KpVCzBNQOyaI1SOtrJ8HUqUuwuvDcNx0r0h0UqcmWAquJYFk3kY7dRivU6BYMfZ66hNRg==
X-Received: by 2002:a1c:4e11:: with SMTP id g17mr4480162wmh.80.1585847122176;
        Thu, 02 Apr 2020 10:05:22 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q4sm12036951wmj.1.2020.04.02.10.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 10:05:21 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] prservice.py: fix do_package with newer Python in Ubuntu 20.04
Date: Thu,  2 Apr 2020 19:05:14 +0200
Message-Id: <20200402170514.1434362-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* with Ubuntu 20.04 which is using python 3.8 I'm seeing a lot of errors like:
  ERROR: libxml2-2.9.10-r0 do_package: Can NOT get PRAUTO, exception No module named '_sysconfigdata'
  not sure what caused this from python 3.8, but this seems to work
* PRserv is enabled with:
  PRSERV_HOST = "localhost:0"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/prservice.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index fcdbe66c19..2d3c9c7e50 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -3,6 +3,10 @@
 #
 
 def prserv_make_conn(d, check = False):
+    # Otherwise this fails when called from recipes which e.g. inherit python3native (which sets _PYTHON_SYSCONFIGDATA_NAME) with:
+    # No module named '_sysconfigdata'
+    if '_PYTHON_SYSCONFIGDATA_NAME' in os.environ:
+        del os.environ['_PYTHON_SYSCONFIGDATA_NAME']
     import prserv.serv
     host_params = list([_f for _f in (d.getVar("PRSERV_HOST") or '').split(':') if _f])
     try:
-- 
2.25.1

