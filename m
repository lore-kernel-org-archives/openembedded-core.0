Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.20668.1628502555156769818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 02:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gh2Delly;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id k5-20020a05600c1c85b02902e699a4d20cso466270wms.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 02:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cp8e5+4YkHnur6gpzb9huZmL6aftzy4F5vIbNS0dd6c=;
        b=gh2DellyscELL1+BdAMDay3XDiP4Yu6fo4QZxsqta89Ne4iBpeqgmUzZ6Dp0Qm7DUM
         54ZAXUxxzSqqWH809KEBsmulyw5jhuYoe26zMohI5jBCa65rZWPFMYQSiGQsXhlpo4aQ
         YvNnJX+6x/yxQchnroLA2DdO5uukxnETvYQG8sVrkW7A9AbhexDcTpjTcc4I4Vd0tYkv
         PYPSHge13zdokMhUzIl4DoeEK3Esup9rlYhzxELwGEilo212EbmvyuN+1ufpu1VIBkth
         FkplVjSV4NaG611g1rBcHtsWTHhQxO4T6OOCJ+adADSiHOc12cYrHlTkD9GrV6ohRnMK
         5W4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cp8e5+4YkHnur6gpzb9huZmL6aftzy4F5vIbNS0dd6c=;
        b=aDX+2P/fdss6FXFLLABGVSnhyreqlbkG5Yjk6jBJ2SKOl+FQ9RHjhAsVeO1uutZaJ5
         boV0AMUmrbqIN5w/RAA5KMewISYjbcLiHghsPfdpCGE4EKLKYyRcdjxKeXh8U5kZ/SsX
         O3Bf+BQH1mDoZF8t+Ns5CP4V7I0yY4vEk7610kbfU6XMI1StpVvBtwnsMwQ6eKa2O/Ql
         P9W8S3CR1hBz4wpU/fyM0N3A6LepAoVlgrDg8y5RjSNI2vc+epbTzXDJqQiDIr16DjW+
         L2lw0NhO2+RNVBhX8uwAx48UssVYU2Hkkm3F5yyOIl0D+08cOVMkDiNPkO8Ao9hKmIGS
         CzMA==
X-Gm-Message-State: AOAM533sz2v7fMGbTbU9YOqS2EfYgEVtDV3BdzyUEsVJ1aVDcp/0Y5CL
	622FP5f2xEhqxTTwIX5u3RIUWnIuFPI=
X-Google-Smtp-Source: ABdhPJwEHM8+4N3gfdumn8AaHGLBZWKCV3kqZ26V6iWiGnGHil14ah+JM+prA0rivbZ1cuTZX8HmuQ==
X-Received: by 2002:a05:600c:242:: with SMTP id 2mr2451243wmj.167.1628502553172;
        Mon, 09 Aug 2021 02:49:13 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id c190sm17314303wma.21.2021.08.09.02.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 02:49:12 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 3/5] sstate.bbclass: get the number of threads with cpu_count from oe utils
Date: Mon,  9 Aug 2021 10:48:51 +0100
Message-Id: <20210809094853.3619155-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210809094853.3619155-1-quaresma.jose@gmail.com>
References: <20210809094853.3619155-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It uses the python os.sched_getaffinity and it is more acurrate

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c3c145e7f3..63085a7f3a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -964,13 +964,12 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             tasklist.append((tid, sstatefile))
 
         if tasklist:
+            nproc = min(oe.utils.cpu_count(), len(tasklist))
+
             if len(tasklist) >= min_tasks:
                 msg = "Checking sstate mirror object availability"
                 bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)), d)
 
-            import multiprocessing
-            nproc = min(multiprocessing.cpu_count(), len(tasklist))
-
             bb.event.enable_threadlock()
             pool = oe.utils.ThreadedPool(nproc, len(tasklist),
                     worker_init=checkstatus_init, worker_end=checkstatus_end)
-- 
2.32.0

