Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web11.12152.1592318361891619357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 07:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FSVjiPLm;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id o5so22094206iow.8
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2020 07:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XSkEV80bsGVhbrlLx5jRKS5iDGa4HAk0hEFmUabsxx0=;
        b=FSVjiPLmqc58JsbRHFbKucMHKM9lHg+g10/sbZU+Xv6H39zms6haIWof4PgxYcnCpI
         hQaoilGqqGOasXc+3p2ElOwo+BuenBUS4r6pKWEUybMTTTKg9CF9JC6fC36MQ2EAF0ie
         IaAWRfTJ8wEj34pdEPMx8CILXPqGjiTEKPQ2ZJy3818TDpXKcAo0vRBbQn2vDvMJmN5d
         vXeozOolzrlEoE3DLFhFQluLmzAO8XOaT2qkJy2Vc6Klh03+SuzphC0PHG7GX5iBAUDD
         x8e3luQMOuvv7jXYbXrQ/uZ5tCkY+qAIQUGfv95uqqD+K9t6eOzOPnEzB2ORAuPrh0uB
         H2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XSkEV80bsGVhbrlLx5jRKS5iDGa4HAk0hEFmUabsxx0=;
        b=B8o5XEYgSwV90qvn3/xiUMv3kpLxST0Lb/4deRHdJDHISrl+YRaLL6r7usLtdgjcdW
         SVNjlfPEXsJbUwu0oK3Lsyw9uY+w5tFZ5j3RgJoNXlaHtq6+1MsZVGOXL4FebgTP13Kg
         0oCfArRJWxpzLIVsoLoN2w6oIul7Cu5G1gYiTGRHWPrN+HwxU7jv/rdXzoFASVtG4R+O
         7tw+5+uwmHO+04ch4bRAvh1uZiim5TN7xKjInriXXr++VcMHY/fjobO1trNmvFRHUjkV
         WYSY0AUNOiOVJkLwOraxV+QooPhwIOTmaNSvUF/4M9DLO0lMZe1YkstbHFI6hCFi1jM6
         65Cw==
X-Gm-Message-State: AOAM532sUyWrNA43bJO0G/9oqAN8JNAQcsJf3vyMtKeOHMz+/5apiIk3
	OHZeVOQLbJN3Bkgp/Kc7dL2BeeTI
X-Google-Smtp-Source: ABdhPJxpEgd4xJ3LR0FfVUcjryGDZhfX9p3JqaAPBi6QG4tPtlfvjaA7WVDTVVo3Od45AwHR0/zSZg==
X-Received: by 2002:a02:37d4:: with SMTP id r203mr26887638jar.121.1592318360979;
        Tue, 16 Jun 2020 07:39:20 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:28e0:c236:d6c3:296a])
        by smtp.gmail.com with ESMTPSA id h13sm3842221ile.18.2020.06.16.07.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 07:39:20 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/archiver: Create patched archive before configuring
Date: Tue, 16 Jun 2020 09:39:17 -0500
Message-Id: <20200616143917.34003-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_configure and do_preconfigure can modify source files, which causes
race conditions if these tasks run in parallel with do_ar_patched. Add
explicit task dependencies to ensure that do_ar_patched finishes before
these tasks start. Specifically, this fixes a race condition with
gcc-source where do_ar_patched races with do_preconfigure deleting
gcc/gengtype-lex.c

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index c2c049c343..e221fff695 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -583,7 +583,7 @@ addtask do_deploy_archives_setscene
 
 addtask do_ar_original after do_unpack
 addtask do_unpack_and_patch after do_patch
-addtask do_ar_patched after do_unpack_and_patch
+addtask do_ar_patched after do_unpack_and_patch before do_preconfigure do_configure
 addtask do_ar_configured after do_unpack_and_patch
 addtask do_ar_mirror after do_fetch
 addtask do_dumpdata
-- 
2.27.0

