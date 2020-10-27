Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.889.1603821521552032588
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 10:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lnUW63Fe;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id 10so1363431pfp.5
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 10:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bHjRA32SxNGycdTccQXJv8BQIIPqHxM0vV70larwozA=;
        b=lnUW63FeUpejdWdKfZbhUkWLZxtLZEsjWnNW4WVH06kAEQZo5ssNJwL99j5YZ2SKMC
         VRQwI8KeuvrbKSDF68I1hONlJUADlIzX3KleDzr9n+ncu/Ytgc82OeAYgyWCqyfpN6M0
         MlnK6VCWhUlib6TVn6ciy5Bn0Kymi86m6F5AAzvuFgLopycdXQGDzrEmu9VTp18AIoiN
         Z/kfley6OVunGNw2v8gQoS63aJ319fsTQOkPuShUwtSKzJbWlQKNaHKxlaOY5z8nyNa+
         81gkzVmV1B+ykhRqHfmtKXPrzDDbaTP9Hta5blXAqKn+A6eNEXDMCJ1vK4Mma3PiE24L
         mN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bHjRA32SxNGycdTccQXJv8BQIIPqHxM0vV70larwozA=;
        b=Bu6edK4HTFaNXHSQvQ7qgW8c/d9TE24NRG11xvK50gG28JZg5g+Q8NJ5wAmK7uIUTI
         R4/nlnmKu0i7xrDIqRnNIdw3HJTP30LEip4saZRH2mf9P/nQQswMcqWF6oRw1jayg53J
         7PC8dQ6/vEEcXFpic1BnuB6yVuE6MMntSXsKLy2oMT/ZhTBRe6PjsNAvmppEiAZUT1ZT
         XDUF9HO/lp6m5euKs9naVIduSTV/U6a699nhhjRde3pbAC1X0aL4+yv3+NN2nE+riEDY
         Nlan67ZxWNh8Fmg+3x7lq0zq75bCUFmToqPI27VsngTAkIn8VWA1D6rIVPFXmqEMpFXP
         ilcQ==
X-Gm-Message-State: AOAM531l6pbqwPGqX5fH0sFDuK/xtjFBg2PV5Jr9MPyNOn1I4+s4KLCK
	aNIrVB1VYYr0dnrgq/VEIo/qeI2poj7vag==
X-Google-Smtp-Source: ABdhPJzIcVR7mdBmXABbc+xO+gQjEM0scUE0mEIKgHNtdcV3b76bouKjNk2UZtDvbETwSOA75MiFcg==
X-Received: by 2002:aa7:82ce:0:b029:142:2501:35cb with SMTP id f14-20020aa782ce0000b0290142250135cbmr3409019pfn.43.1603821520666;
        Tue, 27 Oct 2020 10:58:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::bc1e])
        by smtp.gmail.com with ESMTPSA id c10sm2873485pfc.196.2020.10.27.10.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 10:58:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to latest master
Date: Tue, 27 Oct 2020 10:58:37 -0700
Message-Id: <20201027175837.832068-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in this revision bump are
* 0b87551b (upstream/master) lift sigaction abort locking to fix posix_spawn child deadlock
* 99d5098a update crypt_blowfish to support $2b$ prefix
* 957c2763 remove unused weak definition of __tl_sync in membarrier.c
* 55767360 move aio implementation details to a proper internal header
* 37337660 remove long-unused struct __timer from pthread_impl.h
* 85e16aec drop use of pthread_once in timer_create
* 6ae2568b remove unused SIGTIMER handler in timer_create
* 47baa030 remove incorrect fflush from assert failure handler
* da845d52 fix getgrouplist when nscd reports an empty list
* b7bc9665 fix posix_spawn interaction with fork and abort by taking lock
* 25ea9f71 fix unintended observability of SIGABRT disposition reset via sigaction
* bd153422 implement _Fork and refactor fork using it
* e1e98d86 rename fork source file
* 50716702 ldso: use pthread_t rather than kernel tid to track ctor visitor
* 1efc8eb2 fix stale lock when allocation of ctor queue fails during dlopen
* 69a1b390 drop use of pthread_once in mutexattr kernel support tests
* b115bee4 fix missing synchronization of fork with abort
* 3cd3de61 move __abort_lock to its own file and drop pointless weak_alias trick
* 34904d83 fix fork of processes with active async io contexts

Details are here [1]

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=a5aff1972c9e3981566414b09a28e331ccd2be5d..0b87551bdfb74ac411caa335d8ad0b89a7f139c6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 9c0818cfa5..897e56e10f 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "a5aff1972c9e3981566414b09a28e331ccd2be5d"
+SRCREV = "0b87551bdfb74ac411caa335d8ad0b89a7f139c6"
 
 BASEVER = "1.2.1"
 
-- 
2.29.1

