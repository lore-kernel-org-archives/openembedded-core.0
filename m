Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web10.9948.1593782203823908981
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 06:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HdTq/1FR;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id k6so27235163ili.6
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 06:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WcXnS1GI3tj5deISti0q7zP/yMqxnQ7Hc8OYdJHeVAo=;
        b=HdTq/1FRmhjr8M5IYTBc1m5Vl3Jty4gdB8QYyCcsw7wb6yfNC6vnaVjNpiqzaLrBcC
         Y6T0ihfRMWjYzVvzxgjlWonCna20xR8AQpu1yOU0T6RBRfi0d1V69LazYo+Elqf+wJLL
         R2AqKq0gNyWuLgAr7dI1qKC7Dz4phxghWwW1hXfgH3UXLRv4xM/cMdigfWF54/DnOnnM
         W2rVQbT7q/e93MjBpepB0QxoPLf8NqOo3Cu3j3gtgw03AAQj7ySpv+3HZlzZl3yoziNL
         cKXo/94+p/yecuc+YfLB3nHTYlBa16U5/zdA3SAfNuTInW1GnSsT6Kkjkc5NeNDqHeJg
         QkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WcXnS1GI3tj5deISti0q7zP/yMqxnQ7Hc8OYdJHeVAo=;
        b=QV+dfmkNoU8gz60b8aMGwh8KI0M/DoFeSfPPV4urwfmeiLf9kqK3Is78CJrDdTq1LB
         A90/PKMdNs3p2W7hTB0mpxC1WAITY+i7MV+wvg2x1Bpm2Al8Se+cFlnjwtXU+aR6K6LJ
         OjKAi7WhPsP82jzRo5zJy58Xiq74wdXSKlku2yTiLvc8aAkGaeUWTkLwF2UxtvWkyu+7
         vUeckwVUjcOt+e9zSpBngT82uGeYtFVkEdItfZsoJYKi2/x2SWrVxoCqqsMfy9R4huZk
         hvtbw/KW/q0S5jth9HBVUkQnR30aq6QkNhyW9nslVMaTGjeJtiJG2MpDq42hM3gAUogD
         p+fw==
X-Gm-Message-State: AOAM533OS+nGEaGsme5iNY3witt4yiBurwif20LB7lxf3158zaAmZ8GB
	Kf/kwwBn683ez1hpytoBhhrPLNROAtY=
X-Google-Smtp-Source: ABdhPJwR8dR73ubDFi3toNN7M/ZA/vtBXxvls1Kv+theuCFDXZmGmk9hr2Z8GVPlEPAL4fQ0fkMrLA==
X-Received: by 2002:a05:6e02:dc4:: with SMTP id l4mr17269274ilj.134.1593782202954;
        Fri, 03 Jul 2020 06:16:42 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:b47e:ad7e:5c16:f8b7])
        by smtp.gmail.com with ESMTPSA id g8sm6529619ilq.49.2020.07.03.06.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 06:16:42 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	mabnhdev@gmail.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/archive: do_configure should not depend on do_ar_patched
Date: Fri,  3 Jul 2020 08:16:37 -0500
Message-Id: <20200703131637.17377-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit d4be264061 ("classes/archiver: run do_unpack_and_patch after
do_preconfigure") correctly moved do_unpack_and_patch to depend on
do_preconfigure, but left do_ar_patched as a dependency of do_configure
introduced from 8a7c779487 ("classes/archiver: Create patched archive
before configuring"). Having do_configure depend on do_ar_patched is
blatantly wrong. Firstly, doing so causes the taskhash of do_configure
to change which is undesirable. Secondly, the anon python that sets up
the tasks carefully skips GCC recipes that depend on gcc-source to
provide their source code since running do_unpack_and_patch in them
would delete the source code. Adding in the dependency effectively
bypasses this and makes these recipes delete the shared gcc-source

This fixes errors (for real this time) like:

 cat: .../gcc/defaults.h: No such file or directory

when making certain configuration changes.

For posterity, you could easily reproduce gcc-source being erased by
running the commands (replacing aarch64 with your correct target arch):

 bitbake -c cleanall gcc-source gcc-cross-aarch64
 bitbake -c do_deploy_archives gcc-source

 # The following would fail because
 # gcc-cross-aarch64:do_unpack_and_patch erases shared source, so
 # do_configure after that fails.
 bitbake gcc-cross-aarch64

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 0744089f74..aff1f9dbb0 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -583,7 +583,7 @@ addtask do_deploy_archives_setscene
 
 addtask do_ar_original after do_unpack
 addtask do_unpack_and_patch after do_patch do_preconfigure
-addtask do_ar_patched after do_unpack_and_patch before do_configure
+addtask do_ar_patched after do_unpack_and_patch
 addtask do_ar_configured after do_unpack_and_patch
 addtask do_ar_mirror after do_fetch
 addtask do_dumpdata
-- 
2.27.0

