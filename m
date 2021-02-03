Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.4353.1612322653834654277
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 19:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R0xxO3NJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id a19so22164790qka.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 19:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+AJvUG0hJ0nWyf+fNzc9K11Ek6eX/8wA5B8D2JyAcNc=;
        b=R0xxO3NJ73iDFhlCUzqiMmoCVC/Ip+v/QeG5ws+dNBPILNh//wQ+xlv7L8M6F8ht9C
         PAvlATrqf5fASA4wTAMNgpGQZGyPB/FuuG0LxYbHPkxG65NIIuiMHcJioIkkVhCxkblw
         RWDGpQ9cig4U0ybzEBNQQLnL4rfVT/3vtR0vnfmfqi5mDFBlM8jicVyhsr6NAgqUdWn4
         pNXZZsZGFZVqiF2CJdDRBJxQXjn3kl9f0rD8OHtTDWo37CgmnnNkNDviH6S6UEEpS2ZY
         bWEpUTECf/ghBzxkr3ccieH5jB7wm5aA+5vYFGGo0B59amtFPt50oEAOh+GSpBXS4oSM
         mOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+AJvUG0hJ0nWyf+fNzc9K11Ek6eX/8wA5B8D2JyAcNc=;
        b=tkdqE5znhRfgM//DYAP6RVeonkvbRsB4JOq/nzWYnBUr268JzvkIsCE6RwX0+ML8vj
         04MuvfDnWu+nOwcy1dei+8gxsP+KMusfPQGkJ0p9W/eekO8B5tIjcOSX4ukddouVY62P
         8T1NVhaabsEjsWfYSD/w+7E+LWu/4IF4pRTGZ+NzEQP6oZ0ITaGVVeN5SG1EyIfN7GUI
         bv1ZLhNZrg+I0vSlda1+H9VUG8RiACdOmIlP4JbMxdq13Zg6Xuskn1iTF8xBpoPX1Sbi
         Fzc/vS4KuORvldLpRjQ5QLnIgPIOb14O2UXjX3L0WMauprczvE4he6ranuFTsCYR96lA
         J/RQ==
X-Gm-Message-State: AOAM5324aJH4iLZ9c6fP93aJBQMrA4WvDQcpvMIEQFgc9aB6hSPyXevr
	6CIyUR4CSMjpDBMpetkEXE0=
X-Google-Smtp-Source: ABdhPJzLMCvWnP+pPEoT+VJctNiZOa3wmQI7UOlY7kjOOUsgmt14TAcfhY3L/ClTupFNo3XIlycE9Q==
X-Received: by 2002:a37:4ecd:: with SMTP id c196mr846341qkb.264.1612322653004;
        Tue, 02 Feb 2021 19:24:13 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id v12sm721821qkg.63.2021.02.02.19.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 19:24:12 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-yocto-rt/5.10: fix 5.10-rt build breakage
Date: Tue,  2 Feb 2021 22:24:01 -0500
Message-Id: <86d05af958c61ee90048b7f2eb8d8a5411e1c034.1612322536.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1612322536.git.bruce.ashfield@gmail.com>
References: <cover.1612322536.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

5.10-stable included a backport of:

  Author: Eric W. Biederman <ebiederm@xmission.com>
  Date:   Thu Dec 3 14:11:13 2020 -0600

    rwsem: Implement down_read_interruptible

    [ Upstream commit 31784cff7ee073b34d6eddabb95e3be2880a425c ]

    In preparation for converting exec_update_mutex to a rwsem so that
    multiple readers can execute in parallel and not deadlock, add
    down_read_interruptible.  This is needed for perf_event_open to be
    converted (with no semantic changes) from working on a mutex to
    wroking on a rwsem.

    Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
    Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
    Link: https://lkml.kernel.org/r/87k0tybqfy.fsf@x220.int.ebiederm.org
    Signed-off-by: Sasha Levin <sashal@kernel.org>

We implement a -rt variant to fix the build issues.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index c3c3325c5d..c855496fa2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9c3ab79db8ac20dac05125ef6e2a5f50ed7ebacf"
+SRCREV_machine ?= "7fa491ad298d663a0cb15570c00cfc203b041e83"
 SRCREV_meta ?= "31aece53a1ae191fc0efe41f53c342293f654d04"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1

