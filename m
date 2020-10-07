Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.1311.1602095805422395058
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 11:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WY9w6SeG;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id y14so1927464pgf.12
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 11:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7k+IF5RnSfAm6a2ePYsmkU5IO35VqE9xwmanZziWdMM=;
        b=WY9w6SeGuVoBZvuhReORsIr9CfMH5g05lb62nFsJpGtYgmCNJjrKBMPPbO539YAwAo
         7xdv7/+dFIJlsZO1hJ5KRPLCQn6XiJK4VM+qz56GdyGyf8Ko2P3wv72SvnATBrg3P91+
         oOCr4E0SKpeIzQC13bqvdiY5Znq+eD9szwK75F9MCf9dd4Q8Ievdgl3prys6icc9E2N4
         6peWg1VAP3wkxgPaxtfvzfdniclzjslqnczquk/EGlyJJ3ulhPbfMRoR3FhwE6BAy6nJ
         KIYaKu6T5P5Fn9pIB9O9BghGbvVldEo/EbWzO2CMhjUfP69n8l03PkKawqvYsMIYLdtD
         Hqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7k+IF5RnSfAm6a2ePYsmkU5IO35VqE9xwmanZziWdMM=;
        b=BqKafXyJ3uwkOIk0v5a8jb7hpC+5tBTw7zzXQEYXnX0/ahCCG2fYLUkFDfQor/SAcM
         sGOMRvvJuUHi2Xn7VgoaAUns5TWrpk1PV94enbGSThVwT6/t5Gs9QY8UtgJ1jrKKcq0V
         OgOZw0NqlI0qp+nx2dCbKUCDwZ8torC9JS3gB8wxX2zVE9FeZ/DH1c56XbtGv3Lyh4hZ
         cnP4yI4ziZ+npycKIbqKHTKf306MIVblBtj66ddqBccWyG/g15XvyDh1TcRdkF4Ix3Ry
         yhDlKBmxfadF/bssyo2LfMA7CJ6lF9Wv2LxTXy5Cn9f/5lBfpRVtMQsV1L/u3e2zFdvW
         lifQ==
X-Gm-Message-State: AOAM5316bwSkT50cgvXz6r8ejkmZfVrm064h/FlNCDFjo5fLT9GiDQo+
	uF9iCC75Jz1F3EadlK/LAuXY0Gp+w9hDOg==
X-Google-Smtp-Source: ABdhPJxtSm4zUDuCV9nPeLEx6g6kl1s5RqLr+e9BZEaflOBfwtEkmBK7vRtp9TDFxLPXu70sPHYerw==
X-Received: by 2002:a05:6a00:887:b029:142:2501:396f with SMTP id q7-20020a056a000887b02901422501396fmr4208602pfj.52.1602095804637;
        Wed, 07 Oct 2020 11:36:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4467])
        by smtp.gmail.com with ESMTPSA id 78sm4037271pfz.211.2020.10.07.11.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 11:36:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to master
Date: Wed,  7 Oct 2020 11:36:41 -0700
Message-Id: <20201007183641.252029-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Brings following changes, supports linux 5.8 syscalls [1]

* a5aff197 avoid set*id/setrlimit misbehavior and hang in vforked/cloned child
* 55fb9a17 use new SYS_faccessat2 syscall to implement faccessat with flags
* f035c7b1 netinet/if_ether.h: add ETH_P_MRP from linux v5.8
* 6b1741aa elf.h: add .note.gnu.property related definitions
* 9b7ed970 bits/syscall.h: add __NR_faccessat2 from linux v5.8
* 616a8bf6 netinet/tcp.h: update to linux v5.7
* a6c302be sys/mman.h: add MREMAP_DONTUNMAP from linux v5.7
* 8adf42f7 sys/fanotify.h: update to linux v5.7
* 94ab68c2 aarch64: add new HWCAP2_ macros from linux v5.6
* 0296baff aarch64: add HWCAP2_ macros from linux v5.3
* 43b640c2 sched.h: add CLONE_NEWTIME from linux v5.6
* 3da18e69 sys/random.h: add GRND_INSECURE from linux v5.6
* 8f4aa78a sys/prctl.h: add PR_{SET,GET}_IO_FLUSHER from linux v5.6
* 1ab341e8 netinet/udp.h: add TCP_ENCAP_ESPINTCP from linux v5.6
* c6321616 netinet/tcp.h: update for linux v5.6
* 8fca0ea4 netinet/in.h: add IPPROTO_ macros from linux v5.6
* d9900903 add pidfd_getfd and openat2 syscall numbers from linux v5.6
* d4f29814 netinet/tcp.h: update tcp_info for linux v5.5

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=ffac0c229986725c0d0f3c806bafa7e3ca409f3b..a5aff1972c9e3981566414b09a28e331ccd2be5d
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index e72b05a36c..9c0818cfa5 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "ffac0c229986725c0d0f3c806bafa7e3ca409f3b"
+SRCREV = "a5aff1972c9e3981566414b09a28e331ccd2be5d"
 
 BASEVER = "1.2.1"
 
-- 
2.28.0

