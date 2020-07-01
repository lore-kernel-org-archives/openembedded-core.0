Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web12.13039.1593571776415736962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 19:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vOe0eHnv;
 spf=pass (domain: gmail.com, ip: 209.85.166.195, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f195.google.com with SMTP id q3so9030087ilt.8
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 19:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3l9dBWXRpYYdUOMjsPewS6oFT0nAJBqb7rBak9OY9cM=;
        b=vOe0eHnvqkDLqVu/gfjoMi2rk0Dsi2i+fN70wx6ok1CSi5S/i+TJsvrEO5LKDCgKly
         xGJx5GZI5fk4tQQ9oGRDPXIe3A8mTJ6zDh4Teqwrhu5jgxbsvoyMj5vBhUcR5Kp60GoF
         /ZXg7rK+NFOoH6bLc+x9c4/LqbkG4hl4gc5Y9IIRXY3N9NYz/EtI5vQgE1b/1xDGxT38
         svhyacrNheEifoikk0O1xmp7VTdAJBVNGI0DitG50pZfXyT2gM5R2EDz4Ox3Xeyy3Jjy
         0LYQTXbIxRaJkHLMWPuUiQoIwT7Eerd9J0p011qhzQsJf+Uj0ambmjhCUHfcRNlI8VqN
         hmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3l9dBWXRpYYdUOMjsPewS6oFT0nAJBqb7rBak9OY9cM=;
        b=clOqC9xNGGc7KzPmDmPlDoS4HxfZq3PbThWf5Ka2V5Bz62u9YrYXdRw//uHOeS3g3k
         3/dQBLWmAQUlrDXskn0Afgs3NdN+kt1k/ZB0LjS4rcwl0GvDJvcG0HWfrzf3EiUKOS4V
         xvxWur2ONr88rlzYDgljPXZvNZRPXUAXaEtJq3PiVhvQIBPVAr1NbPLPjzTaODjzY/9D
         AkHuVByysq5fYAh7B8iTRsOB1zkvyN4ZOO8qhym84mAPRnmpDT0Nkxw7OKVayPDKuuX4
         F+LoH6bUITWnNZt0Gi0sizPm89TQ+4nxnKQICrMRUu0lZOWRSGlt/hT14LI+KrxALBZH
         idjQ==
X-Gm-Message-State: AOAM531HV0BB58MmqMaKFOZhtOPHFh8gx9LEF4dNafPVd8ATIHft8vQ8
	5CgTVdHRVk1cXgjYw8or72DX0Vh7Q9w=
X-Google-Smtp-Source: ABdhPJwH7Ox/A+HqXofswybR/yojfb/BXqIJEO634TtfE5xbPyrOxO2cBA6ELuKjMoAHfoTzuUFnkw==
X-Received: by 2002:a92:d705:: with SMTP id m5mr5936389iln.288.1593571775601;
        Tue, 30 Jun 2020 19:49:35 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:1c9b:3646:316:137a])
        by smtp.gmail.com with ESMTPSA id a9sm2337859ioq.51.2020.06.30.19.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 19:49:35 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mabnhdev@gmail.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/archiver: run do_unpack_and_patch after do_preconfigure
Date: Tue, 30 Jun 2020 21:49:23 -0500
Message-Id: <20200701024923.31190-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit 8a7c779487 ("classes/archiver: Create patched archive before
configuring") fixed a race condition when using the archiver, but
introduced a bug where the GCC source would occasionally be deleted due
to the archiving code running before do_preconfigure. Instead, make sure
the archiving code runs after do_preconfigure by making
do_unpack_and_patch depend on it. This makes more sense anyway since
do_preconfigure is effectively an extension of do_patch.

This fixes errors like:

 cat: .../gcc/defaults.h: No such file or directory

when making certain configuration changes

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/archiver.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index e221fff695..0744089f74 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -582,8 +582,8 @@ do_deploy_archives[sstate-outputdirs] = "${DEPLOY_DIR_SRC}"
 addtask do_deploy_archives_setscene
 
 addtask do_ar_original after do_unpack
-addtask do_unpack_and_patch after do_patch
-addtask do_ar_patched after do_unpack_and_patch before do_preconfigure do_configure
+addtask do_unpack_and_patch after do_patch do_preconfigure
+addtask do_ar_patched after do_unpack_and_patch before do_configure
 addtask do_ar_configured after do_unpack_and_patch
 addtask do_ar_mirror after do_fetch
 addtask do_dumpdata
-- 
2.27.0

