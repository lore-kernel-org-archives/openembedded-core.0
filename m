Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web08.2279.1611608349510081180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 12:59:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GsTth0j3;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id p13so17087108ljg.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 12:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jCFDSnYUYyN3MErKf863KxDYsiy7UKwMSy+a2cW6cF4=;
        b=GsTth0j3jfHoLzsY6eGzhMfGZUvwW3FUJ+EtK/UbLuAdGj6Do11oc5oUU2POgujm/F
         fmWkNZXbq5/+ORpsjjP1M/YhiDfPpaYDsnpi5HuZkviDuRWHjeIQQDHtOgVXD587kM5Q
         NqYo0tiZxtrzFSdMrJUTiM8bhsdynNOMGLmG12K/4m85CTZYU5TLzwsg2OJS0vy1qpyn
         FFt26b2c6zUAapdF0l1COIVwoA3eaC1fs90b3eurdqTw9sOzpPj7UGJIAWzdc2XULRPr
         jzqDcvObU8lFsx15JIrUCdLH9MfsM2XJuNEpmsLPUFZcCzz4OMyHqAXA2oUrB8N5MuaD
         h5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jCFDSnYUYyN3MErKf863KxDYsiy7UKwMSy+a2cW6cF4=;
        b=qzUQSubtcuxKmq44SODihAUn6jmmsa0JzL90v4+zgJQgcMbQkTEv+ZfQh+/B3y7umg
         S/s63wdDmnVX3VNM5cIxV6dNEh/AcxVBHF8ibC5ZeFdpqJvePwlpQ1MiEFnkeSLKdsee
         /CCg1zD2tMyEEhHXJ9pH5b3deK+RIc0zRyOaWkdC0YLTswWl+EWrEU9mqGlEAoBGgDBb
         uflcI9K4/hRI0HidadhCr3MZ6eGfQB7CaVW7sE9/EHW6bEnaoR7vXEQ3cXD9mUpX4+4H
         UMAfkAcDCEoJXqqfLvecSXNUFJtS8Ja+ARvKwNJdzEaIr1GE3qsXiTyU/lNBVR7OUjL7
         98dg==
X-Gm-Message-State: AOAM533OQGO8qXiaqC+E9h9SoUgbgtHOFy7isUG9HDwbwItmHe1fHEc/
	kHOnBiQHrDNyP8LFHAsVTZHQnM8NMQo=
X-Google-Smtp-Source: ABdhPJzNaUnLYCmMVIZuZuETkBC97ovCOVsHN3pAa5qy6fHhNO6hUClw9HTB/E3spWkM/8uzeOxltw==
X-Received: by 2002:a2e:a366:: with SMTP id i6mr1106479ljn.21.1611608347402;
        Mon, 25 Jan 2021 12:59:07 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id b11sm2126533lfi.174.2021.01.25.12.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 12:59:06 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] externalsrc: Remove task dependencies to deleted tasks
Date: Mon, 25 Jan 2021 22:01:42 +0100
Message-Id: <20210125210142.8131-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The python3 recipe sets `do_create_manifest[depends] += "${PN}:do_patch"`
but do_patch is removed in externalsrc and fails with:
| ERROR: Task do_create_manifest in <PATH>/python3_3.8.2.bb depends upon
| non-existent task do_patch in <PATH>/python3_3.8.2.bb

It is safe to simply remove these dependencies since they should be
already covered.

[YOCTO #14151]

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/classes/externalsrc.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 7a7d31e311..8e164707e6 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -107,6 +107,9 @@ python () {
         for task in d.getVar("SRCTREECOVEREDTASKS").split():
             if local_srcuri and task in fetch_tasks:
                 continue
+            for bbtask in (d.getVar('__BBTASKS', False) or []):
+                if 'depends' in (d.getVarFlags(bbtask, False) or []) and ('${PN}:%s' % task) in d.getVarFlags(bbtask, False)['depends']:
+                    d.setVarFlag(bbtask, 'depends', d.getVarFlags(bbtask, False)['depends'].replace(('${PN}:%s' % task), ''))
             bb.build.deltask(task, d)
 
         d.prependVarFlag('do_compile', 'prefuncs', "externalsrc_compile_prefunc ")
-- 
2.30.0

