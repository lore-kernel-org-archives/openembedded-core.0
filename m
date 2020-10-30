Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web09.19004.1604084643842544691
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 12:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IHo0AI7N;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id t14so6024159pgg.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 12:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f5INzwTjNIUKb3QCOF13nvsSwT+9yBEa2h0QMA2Whvk=;
        b=IHo0AI7NROUdZ8Az18cjhKQ/G0GOVUq2Qn3QplNPY1j4/X3RcAhz5PgoaVBHsBccV/
         bxtcVZqbHmsFDJTRakW/pcl5hwfB9zlJx/b0VPTn7Qf0mhjd/QZuVEtrgc122ypjEhqC
         Et6VFD8q0A1x9H858zlofvbAmtNr4ePV2Z9zjLppLTbmPJZY6EWdv/Ly9O/KjYL7k/ux
         PgQJvNA3/hEDOUec36xt6WzAT5nonyH167sIKXkNay+Y5UNaV0S+tF1Ps4IzSFq/tgll
         sgbxyDOhyaM8g+kCfe2+nmUsH1c2rzaX8pW04J2y8H4qfIyGIJosBdMa5MaEHGtW5DSC
         3dCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f5INzwTjNIUKb3QCOF13nvsSwT+9yBEa2h0QMA2Whvk=;
        b=qp3IJxhbGbH+/WRVzESOnSeQYj9kP+vAbf3aoAWPqg0xlFDMVbSI9QbwlBfWl8RuRz
         c6rSIkkvvaXmiogVieeuDi5XVmP41a+CgqvOqo2qF2bQFGJLWVsEyV5KffPOc+OH1gZu
         70ea07MzM4FtMFmxQKkErJfxaZ3+wpAJRXVMl7HzM6t3j+WuA2jZTzRsZ2W4LNCs2hts
         Ilr66hxuZDTMzYjRYWXDRO5vc3499l2+daUOjtA4+6FUguOAD8wGsQp7YGpdpR4bAifa
         vx3skwQhAsOr4MPoo1PCZ3kqH9NTjsWld4bkN/t6AwfpxD3ghqa7NtbnSA4mB3ehs8Lz
         HzQg==
X-Gm-Message-State: AOAM533iCAMwD5O1LqZuIXybyJ6Zk1RACdwJxrjIuaPnj2OfBJadlsEa
	mvUW+VumDHTi7VMYc+0Jg37SFhvjnIFNxw==
X-Google-Smtp-Source: ABdhPJxi1oyk+DGUHK6h8ijEPlxY2GumqZkQTXS3794LhEgom5uYSmqFsc6cMk74qz+k7DZYYrzCPg==
X-Received: by 2002:a17:90a:de5:: with SMTP id 92mr4452843pjv.179.1604084642880;
        Fri, 30 Oct 2020 12:04:02 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4874])
        by smtp.gmail.com with ESMTPSA id s22sm549896pfd.69.2020.10.30.12.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 12:04:02 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to latest
Date: Fri, 30 Oct 2020 12:03:59 -0700
Message-Id: <20201030190359.901176-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes pthread_condvars add support for SIGEV_THREAD_ID times

* 27b2fc9d fix missing-wake regression in pthread_cond_wait
* 7c71792e add support for SIGEV_THREAD_ID timers
* f70375df fix sem_close unmapping of still-referenced semaphore
* 613ccabe refactor setxid return path to use __syscall_ret
* ccba2345 ldso: notify the debugger when we're doing a dlopen
* 4209a7b1 fix setgroups behavior in multithreaded process
* 6ce91ef0 avoid __synccall for setrlimit on kernels with prlimit syscall
* 3437e478 fix reintroduction of errno clobbering by atfork handlers
* 2d0bbe6c fix pthread_cond_wait paired with with priority-inheritance mutex

Details are here [1]

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=0b87551bdfb74ac411caa335d8ad0b89a7f139c6..27b2fc9d6db956359727a66c262f1e69995660aa

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 504fdfe019..dcd7a389b2 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "0b87551bdfb74ac411caa335d8ad0b89a7f139c6"
+SRCREV = "27b2fc9d6db956359727a66c262f1e69995660aa"
 
 BASEVER = "1.2.1"
 
-- 
2.29.2

