Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.57281.1629303863529616293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 09:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AySuPUJO;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id w21-20020a7bc1150000b02902e69ba66ce6so2162282wmi.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 09:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VOkcPtrbmC4xKDTaBY1bKhtEtcVqxRnVT9fosri2p+A=;
        b=AySuPUJOb8A5/QIifu+s8ccwSaoJjjoYNBRxXvwvolWpgbQIen1AZU4GEpJlKmoT+I
         jIdfIZGP9+IDiWf1nUGrcAZK+Cg7yETPHB0dW75T+NOJPp934gqETRQ7Fl4ksQAZ0hKK
         4wyUc4fK5E3Vkxx1ER5mJTobPnln/0UJ3HleosrF0ki7zwIcICF56u+5IqLJ4RwV/KDI
         lYYOvVztT+3ZpEo4Wtf78v4a1v+miRyD9UHo4WePxgbpxrp8P0OeXC8OI1FD2Me1Lolt
         GgwLu2ikw5Ga0hDtjwKMPDo8j2HRxz2zkleZW7UYfzg5/EYCNgdKA4GuoynhHRSKsPMJ
         P8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VOkcPtrbmC4xKDTaBY1bKhtEtcVqxRnVT9fosri2p+A=;
        b=bTE3ewHBIMwLdL3RFbTO55x5CU6aooVtkp+hDNxEbPrc7JnnGBDxISBDy1rBAyp1PJ
         JzIwdfgrZnDoacWgmX1yOH4NjvNT6/JUGIzALeLZdFscRtooQANUZY2xtcKv6cB0AM4M
         COTgz5KfFHKBMOllrs/D0Yh9BTLnMJkTQRHMDkH+X8AmR50YRI4ssGF0Z1mIx6mOuWWF
         o3kfz/o76HHKHvFZc0n0+in+TZY+tw9n2+5gxNFJjiwdWy7nOZU0DFRuDOa7WzG9l2s6
         A0OdB/rCdHAUq0v8crZtze/Msf7mOGrfzAQbg4PyQqew+PU7Jvzr25tmictt9tD/4pgZ
         JLyA==
X-Gm-Message-State: AOAM533ksWW4wQzesJumqzhnVDO+ECezoo2LU03NDacjaZ2eep89FF68
	eQceOznJ8jBvykcjuSFc65wC1VrRKMA=
X-Google-Smtp-Source: ABdhPJwsA7k5MpO9MxhpvFH/bemKzuT/XIzL72/f42kuW6yMh1bSl9v2uhrMlfuU7rnNQWFBhCgqTw==
X-Received: by 2002:a7b:c8d7:: with SMTP id f23mr4152928wml.127.1629303861898;
        Wed, 18 Aug 2021 09:24:21 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id g35sm6086688wmp.9.2021.08.18.09.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 09:24:21 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 3/4] sstate.bbclass: get the number of threads from BB_NUMBER_THREADS
Date: Wed, 18 Aug 2021 17:24:03 +0100
Message-Id: <20210818162404.130067-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210818162404.130067-1-quaresma.jose@gmail.com>
References: <20210818162404.130067-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- bitbake BB_NUMBER_THREADS uses cpu_count from oe utils that uses
the python os.sched_getaffinity and it is more acurrate.

 grep -nH ^BB_NUMBER_THREADS meta/conf/bitbake.conf
 meta/conf/bitbake.conf:806:BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"

- multiprocessing.cpu_count() returns the number of CPUs on the host,
not the number of usable CPUs on the host. If the user is using
scheduler affinity then the number of usable CPUs may be less,
so when determining how many cores we can use check the affinity instead.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c3c145e7f3..bc14b5e264 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -964,13 +964,12 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             tasklist.append((tid, sstatefile))
 
         if tasklist:
+            nproc = min(d.getVar("BB_NUMBER_THREADS"), len(tasklist))
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

