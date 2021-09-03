Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.1642.1630657426040953461
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 01:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YkLfUW4E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id m2so2971074wmm.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Sep 2021 01:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=znOxwon9/XhJEVO2j2i03Cu9SsYdPpHbeh3P5+HCNp4=;
        b=YkLfUW4EJlha4TvGAeQdTDRVmDZdTeWHiCRjgLwA+Z8ZY93LmAqN1IQMdL2aYGVuQU
         JlQ5E+uhxsrrzlsuJoPwFej479EKYv9N6kyyIAb8mXuT/PA0zAee4kH6V2+9GFRVXNdD
         ORqHBooDs2qru92if4bgk/i2lxvnxoOA75UIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=znOxwon9/XhJEVO2j2i03Cu9SsYdPpHbeh3P5+HCNp4=;
        b=RyUKCoSNvsWWh6mra1bd8SwuIGT5Urjb+DAt0iQHc11ZpT/GSgY5NEQBCuTPxaYpCg
         /VCEIeZGoxZjQkMNCwOUYT7S7hUx7CaWj8dOLR0C6dE3+V/Vmyp6QKx5LJEfvz5eN/vK
         FfLwY1xKH5dYmYoctO817Imnw8cXoTUJrhkGZEPSwjzGdYdVBhgA85MVn/QmnlrN3Z5T
         Wa2N4YBySxSvOSnaK+lU0bPJEmfSazFdOFN8xPJMbUi9SKtP41z2PFKXO9I1bkRGDRSC
         XgLcASJIDMlenawAFcQSNkS2bIFCAK/mhVrV7kwvqAedND5qHC/AJ4K7qoxCp5veg59C
         b6ZA==
X-Gm-Message-State: AOAM532RiKau37PCCUMXzxIiEfKIQP7qtqnR+hwP35XZpNp4HnttWSbA
	fsBYF+yNUTcxVic6e7/ED/XoNlKKPg+jPw==
X-Google-Smtp-Source: ABdhPJxM/D0OdfFDIfBvrLesaYm4THqNS5mm8nNHChA94uHH4NA9htWRrkqL0mAeVYpoaI6vcqzNtQ==
X-Received: by 2002:a05:600c:2058:: with SMTP id p24mr2081164wmg.108.1630657424062;
        Fri, 03 Sep 2021 01:23:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:748d:fb86:ebb2:cea5])
        by smtp.gmail.com with ESMTPSA id f20sm3625085wml.38.2021.09.03.01.23.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 01:23:43 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/parselogs: Make DVD ata error apply to all qemux86 machines
Date: Fri,  3 Sep 2021 09:23:43 +0100
Message-Id: <20210903082343.984744-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This log checking fix is needed for both qemux86 and qemux86-64 so move
to the common section.

[YOCTO #14528]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 5db02165975..2b8893d842d 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -91,6 +91,7 @@ qemux86_common = [
     "glamor initialization failed",
     "blk_update_request: I/O error, dev fd0, sector 0 op 0x0:(READ)",
     "floppy: error",
+    'failed to IDENTIFY (I/O error, err_mask=0x4)',
 ] + common_errors
 
 ignore_errors = {
@@ -98,7 +99,6 @@ ignore_errors = {
     'qemux86' : [
         'Failed to access perfctr msr (MSR',
         'pci 0000:00:00.0: [Firmware Bug]: reg 0x..: invalid BAR (can\'t size)',
-        'failed to IDENTIFY (I/O error, err_mask=0x4)',
         ] + qemux86_common,
     'qemux86-64' : qemux86_common,
     'qemumips' : [
-- 
2.32.0

