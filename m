Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.20669.1628502556008614266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 02:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fGdqlK9U;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id k4so10140761wms.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 02:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oye8RDFNNQk9l1p6FChQo/dk64Azq9Cnhvc7uj1c6vM=;
        b=fGdqlK9UMRP/BX+2VR/aIcUohSJ2e045q0kcItgy/iX2iotdT8lcQ9eHUdtXWbTiqz
         6jAMSd+VSerOPUPifTAdltS9E8DjXME1QsEYoBPB4GXCW5JMN3mLHdiEQ5mPY/yJm9nb
         TKC27f/G+/PdrrY9sLgytWUIvFlK/HzBz5FaBLE5C+ALnQMVo24QRnte2D5S1v9GPNo4
         +V3CturYsbsQ/3W+29p80Isj1S8RrHjmsyVM1igFftn6rdEDPTB1eWR1MkHX5qbiS3cI
         FSUr5ejwjSbe3nHhQ1m3AAfI8Zf83nLQWRcHNlqIscglwqt9fZBPe7xfkfG9I3nNzrwq
         9SXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oye8RDFNNQk9l1p6FChQo/dk64Azq9Cnhvc7uj1c6vM=;
        b=PoQ1k2I15hiGMF2HNCHRbw7Gnckv1BKjGcxCdA7eHozqBq97PXolP7EbmUNgdKdsNe
         EEEIgjBixkxEMTfnuIU3aFQ5ltbYIT1Mu9y/xi+UDOFJyakTjHZgcuMw4WLsJnfoaDPv
         V+blRVxHh60lPciwmAwDekpkrOqhiIv9+shreWFYUNd3dmQIAUhiGuJ40qUQsxX9G2pK
         0z4Vv5luCja4P5QFVRmxJp0720pE9T4Y5qXTTmyjInkZ3/dlk6H3JAOcAEC48BAEyi9F
         Hbres5z2iO8W/gh5uXJbsNyvv+bDpXododmXSykS4l9wVE8tzCDSBiMn/e7eqfMx0XqG
         XzMQ==
X-Gm-Message-State: AOAM532UA18GKpMoB0ZoU25EWGm/Wp8+iD1WRcO0wx793d2KSdIbwwdh
	daxk0V/qz9T5nIL5Mn6QOxUNcVl/4fo=
X-Google-Smtp-Source: ABdhPJxzU4RuEyI6+LMuWlLMxeLVwj5Wtnje3xK9NSA6ipHc0UVEZq4njX/S5+pWSjJSbEYK5ohPYw==
X-Received: by 2002:a1c:a7c2:: with SMTP id q185mr5500295wme.91.1628502554407;
        Mon, 09 Aug 2021 02:49:14 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id c190sm17314303wma.21.2021.08.09.02.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 02:49:14 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 4/5] sstate.bbclass: disable thread lock if we don't have events
Date: Mon,  9 Aug 2021 10:48:52 +0100
Message-Id: <20210809094853.3619155-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210809094853.3619155-1-quaresma.jose@gmail.com>
References: <20210809094853.3619155-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit f2053844958325496a9387874a8f3182400b71ca
'classes/sstate.bbclass: Enable thread lock when checkstatus'
adds a thread lock to don't lose the events from multiple threads
that runs on the ThreadPool.

commit 1444b8a2ae226829e719d3d184fca27e5940ae0d
'sstate.bbclass: Only show sstate mirror progress bar for >= 100 objects'
disable the events if we don't have a minium number of objects.

So we can only use the thread lock when we have the events in place.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 63085a7f3a..948779386d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -969,17 +969,17 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             if len(tasklist) >= min_tasks:
                 msg = "Checking sstate mirror object availability"
                 bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)), d)
+                bb.event.enable_threadlock()
 
-            bb.event.enable_threadlock()
             pool = oe.utils.ThreadedPool(nproc, len(tasklist),
                     worker_init=checkstatus_init, worker_end=checkstatus_end)
             for t in tasklist:
                 pool.add_task(checkstatus, t)
             pool.start()
             pool.wait_completion()
-            bb.event.disable_threadlock()
 
             if len(tasklist) >= min_tasks:
+                bb.event.disable_threadlock()
                 bb.event.fire(bb.event.ProcessFinished(msg), d)
 
     inheritlist = d.getVar("INHERIT")
-- 
2.32.0

