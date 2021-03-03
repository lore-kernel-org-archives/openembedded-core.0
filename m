Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.209.1614796187174703011
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 10:29:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Yyk8LjwF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id b130so13392165qkc.10
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 10:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K3KzbSY9zc3V46FjTTwqFhdbXqMbOMIoYhLeEFGGR/E=;
        b=Yyk8LjwF2jWXexMA0c7zYU+sVGCNxdKjaENzvLscQqfW24POfCu85TSZwZnDCeIuQm
         sZ86EE98pX5jH2NtxM3VUUONcA+NjFHEcSLTNefbuAWcir4otCoHaU8TFY+oodUiwHU1
         0MZhIZmODo2BPv8GzyXkgOi/uemc3IxsA25eqIrTpIdeuuyuR4OyKT/vZp1HRAh3WSrD
         Sx6gYvDgikvAjrQRRREOTDo0vfUBIdF1UjM++MFlxTod4nLmvohRc3eVHBr+UUpOYUCP
         haOfkRX89TzOk/EXrrhahvLuw53JL7r8wFVVljpBdERKogUowYBjW7YdUdE0buPPIYpV
         yHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K3KzbSY9zc3V46FjTTwqFhdbXqMbOMIoYhLeEFGGR/E=;
        b=G1VHoAX21JVsOTgqQ6xaK8HZeXtqrsC2z49d+7ZpvzmbJk6T119vCNGmKqpg7Ij8u5
         pq3k+5N7xJt2TuWcgJJuxtJEIY9b6EofIxif6LYg/JgXYkB2+CZRwvZiDSLrjddxh/+Z
         jKei3CbQE0J+mJrzqRXo85HibixWZCxDnLmLA2Adv+rHGXX1qbpaA23Z7mp5dUDhvJ7g
         K622/964mM/7NWijX1e46eLDSOGbSyvnnlM2CjKXKLYO34cto7fq6PlxVSQssEibQ0mn
         EDbs4rhd2RGBkTfxVvkxwD4w6AfMFp7kWXFutYwq+WnF4sC9SuIdgTtUGMR3fHg1QhMP
         4YbQ==
X-Gm-Message-State: AOAM530muCHP2vbnNMo3jgITMNp8oYvWoWeY8+kOJKqxQwsY5V86iPyu
	I1DwkztbUfWx1UsNklufso4zuCwrrYyHPriI
X-Google-Smtp-Source: ABdhPJyY25xFYFj2OVomPsOH82u4csf46oabSn1VAFLWeAVrjnGd6mKPuUvh6yRt6t0h2eroKRl0NQ==
X-Received: by 2002:a05:620a:24c7:: with SMTP id m7mr265112qkn.219.1614796186137;
        Wed, 03 Mar 2021 10:29:46 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a62f:6d00:74b0:bf66:d1c4:6ecb])
        by smtp.gmail.com with ESMTPSA id x7sm15656154qti.14.2021.03.03.10.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 10:29:45 -0800 (PST)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Cc: Jon Mason <jon.mason@arm.com>
Subject: [PATCH v2] runqemu: use "raw" instead of "bin" for ovmf
Date: Wed,  3 Mar 2021 13:29:45 -0500
Message-Id: <20210303182945.8904-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jon Mason <jon.mason@arm.com>

bin is not an acceptable format for qemu and will throw an error is set.
The correct format in this case is raw.

Signed-off-by: Jon Mason <jon.mason@arm.com>
Change-Id: I9d78e356d39ecb15bef886c19870b029d9badd65
---
 scripts/runqemu | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 532f2e338d52..cf64ca149c53 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1345,6 +1345,8 @@ class BaseConfig(object):
 
         for ovmf in self.ovmf_bios:
             format = ovmf.rsplit('.', 1)[-1]
+            if format == "bin":
+                format = "raw"
             self.qemu_opt += ' -drive if=pflash,format=%s,file=%s' % (format, ovmf)
 
         self.qemu_opt += ' ' + self.qemu_opt_script
-- 
2.20.1

