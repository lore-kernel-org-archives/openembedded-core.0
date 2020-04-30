Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web12.2381.1588286276390428554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 15:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fb65MVUb;
 spf=softfail (domain: sakoman.com, ip: 209.85.217.49, mailfrom: steve@sakoman.com)
Received: by mail-vs1-f49.google.com with SMTP id 1so5287115vsl.9
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 15:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Hro4A217StppwiM0tY4n33RQEiywDHQ/hXvWTMzF3wQ=;
        b=fb65MVUbMqakeCxKuu629LDN8gkYqMnI2C+PmRIcv4YrjEHEQMDaEP15Q4vPtmBA5G
         bQpB8uSImGJioet9iL90iq9e18eNXEAuHrtC4BGf6da8akLZEwaOnn0vR+LV94wU5zQi
         liqrfcQEZTq6lB0NcoG7JfILGxD7so/FJlr6pOjxKDLsl7GUGJGQRl0gpqiQgbJstWY6
         aU660D20COeJECEH++LRU1EbO+wXzHnxmUd7/F1BAVPWbNTmOl3zGrhmCvWzsHGigXlm
         d+adW97v2E9hwpTslDfXmRzHCrs2Ad6sXyoH8qFrZa+B3MF9sgWs+C1AILeyBAL+OPA2
         f7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Hro4A217StppwiM0tY4n33RQEiywDHQ/hXvWTMzF3wQ=;
        b=tN8/f98hNizTYMtWhc7Xva7tF/5qVOl9AtH7i9dycJnZj+5Is/y19f10wx4G6uNcti
         pjX9jiqw47FMtBhsnRvv8Bs31b3LRhzyYNGyK8IX6jXHP1xW8XKLhb6GYSV1GNsqlS5Z
         h87iqKehQfUHXrdxNyBwPCyq39ac4lxD9gQdcji/vcEslRMDh9jBLuMIKPQ/+Sg20I93
         6yO68lAjurtni7Rg8evIOEyVFM3aGq7SZ3GojPHD1gaU4sJD01ZbYIsNlsvQfvTv941o
         sJPqmrTG5LTRbUBTzyy5kCc/p7dTqApoQUlfAWKjYgVTwjJBKJ1xdqYhk8j15qSa5yae
         867A==
X-Gm-Message-State: AGi0Pubuh7JlAQ7/Sy757y8pbYM3Cdl2vvc1l1WIXZoLuy83z6752ng1
	EOjmcKptV4o56+pevJG4GIpyQ5b5P8oy9g==
X-Google-Smtp-Source: APiQypI9LRA5KiukvNDLSG6ZR2g0n+gQc1UJKb5LDwBJidqPwLeBixsU+AzVPSGGBOnFguEx4FUS1A==
X-Received: by 2002:a17:902:ac97:: with SMTP id h23mr1254358plr.89.1588285859449;
        Thu, 30 Apr 2020 15:30:59 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d124sm646011pfa.98.2020.04.30.15.30.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 15:30:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 02/14] kernel-yocto.bbclass: Fix deps when externalsrc is used
Date: Thu, 30 Apr 2020 12:30:07 -1000
Message-Id: <75b47388fb18aaf58db311e570c009350d64084f.1588285073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588285073.git.steve@sakoman.com>
References: <cover.1588285073.git.steve@sakoman.com>

From: Paul Barker <pbarker@konsulko.com>

do_kernel_configme was recently removed from SRCTREECOVEREDTASKS so this
task still runs when externalsrc is used. This task normally runs after
do_patch but when externalsrc is used, do_patch is removed and this ordering
restriction does nothing. This allows bitbake to execute do_kernel_configme
too early, causing races with do_unpack.

This is fixed by adding in a dependency on do_unpack when externalsrc is
used.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-yocto.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 6792c9a233..5bc627066e 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -489,6 +489,12 @@ python () {
     # If diffconfig is available, ensure it runs after kernel_configme
     if 'do_diffconfig' in d:
         bb.build.addtask('do_diffconfig', None, 'do_kernel_configme', d)
+
+    externalsrc = d.getVar('EXTERNALSRC')
+    if externalsrc:
+        # If we deltask do_patch, do_kernel_configme is left without
+        # dependencies and runs too early
+        d.setVarFlag('do_kernel_configme', 'deps', (d.getVarFlag('do_kernel_configme', 'deps', False) or []) + ['do_unpack'])
 }
 
 # extra tasks
-- 
2.17.1

