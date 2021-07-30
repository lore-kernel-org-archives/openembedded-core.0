Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.22855.1627645518535772077
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 04:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=emIg8WZi;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id b11so5615935wrx.6
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 04:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n4eYiahxnCRvi/ZW40MKWrzeiRYgu/+tSjfcu7fNbQM=;
        b=emIg8WZiV3oHPrVMCcTFHVdpyCA+LkvsqK9genDDyrmjuRgvq44jlN4rZm30/nJA3y
         znCywiuKtKTe9ZCReYHmX1RF3tOiBFXoG1PVfp2edHPLVFv9RtAQCnEWyJQH2S5NtQcg
         k/DaeN0RpaYG8EcL0Qf4Wb1G4dUL5JNYxz+UD2lLovs78D+8P2u71NyHyfyrkZ0kCahq
         55kpGfxd9ZoRM1r5bRpwGwiT2Fwx6gL9f5AaxiYI+j3VRhF6GHmsPOKHUxBGAroIFK9j
         OvhUIBjNyCbynck8vdTj8+9vBiiHS3atKuuuzYrc9DMFM9VlIF2Spa4XOnBkfumYOirk
         CeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n4eYiahxnCRvi/ZW40MKWrzeiRYgu/+tSjfcu7fNbQM=;
        b=guQknbThWlISBtjOTF3ynupq1nP+YEiEEjPZ1g57Q9AxvwjJdETrKT/9t0whkqQ65+
         dTLv35z0Y7Yj0Wa6/UByvc5ou9ilu78DPvAj8yftBoKvJzQIOBta1xeinrG58zbrSHTl
         ui2mzNIyTl8t4p8FB18x07aPHoSLzCr+xmuPqcPfVmfhac26tsdgTugJxnlyJSsF0lau
         QZGpdrraqaBSBbR2kFXxaXCBr/q/VTkcKpZZ63esj+ZNqAlFJuN4z80BSrnjvsPUFvIU
         +R4yWD2KrF9hrTeJOLV85bIj5fLPeq0kS+tCRn0nTMsiOxD1Xagpgvt02y8hXukJHZ7b
         vQAA==
X-Gm-Message-State: AOAM530U3/gNDZ7JQe1gQk5RwbOY6BlauQAghbC0d6/oteQj6OpM1GBw
	XpzHm95UhwOkPyPcSwvy4r0aPcK0ONk=
X-Google-Smtp-Source: ABdhPJyOv23HLKOw0XjWiu+w5T7cMk0J2a5sMztPrQ1OgxJqaNRW3u1AivxglvPE6jDs07Br5a3K8g==
X-Received: by 2002:a5d:640f:: with SMTP id z15mr2633285wru.325.1627645516969;
        Fri, 30 Jul 2021 04:45:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id s9sm1459792wra.80.2021.07.30.04.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 04:45:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 7/9] devtool: print a warning on upgrades if PREFERRED_VERSION is set
Date: Fri, 30 Jul 2021 13:45:05 +0200
Message-Id: <20210730114507.732448-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210730114507.732448-1-alex.kanavin@gmail.com>
References: <20210730114507.732448-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/lib/devtool/upgrade.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index da1456a01a..65e19853dc 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -583,6 +583,9 @@ def upgrade(args, config, basepath, workspace):
         logger.info('New recipe is %s' % rf)
         if license_diff:
             logger.info('License checksums have been updated in the new recipe; please refer to it for the difference between the old and the new license texts.')
+        preferred_version = rd.getVar('PREFERRED_VERSION_%s' % rd.getVar('PN'))
+        if preferred_version:
+            logger.warning('Version is pinned to %s via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken' % preferred_version)
     finally:
         tinfoil.shutdown()
     return 0
-- 
2.31.1

