Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.4542.1588176702692457430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 09:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ufD9LXKH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 7so2448877pjo.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 09:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Hro4A217StppwiM0tY4n33RQEiywDHQ/hXvWTMzF3wQ=;
        b=ufD9LXKHnYlZoBqFrk6/1keU3EJPtzB3fFpDTERrNyWK/JG4JDxF2Glus1sdsYXKaV
         Chy70LCdONddJAyUj/2WvhGebWcH+9hUoc/dfmRF92+LnZZbWDcyG9RPtILgcfU0g55N
         5q5pc8n5CjwpyJO0dn9gkE5qG9M9tnRdxLmbD/lgeoI725bNNnzj2I/qHriSqDTBVyqO
         rGpu/hD0JXKOUAAixMNo7dADmGJQR1kIYnpujalTQOanECSIFqyVs6ZNulNhXFGr+ZgQ
         8eudE0WSMQ/RiKpHylMDHOJjATieEtjGEY9dQ8LbknDDPsKWhBAr/SuRMUMvt6GG3uur
         ksNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Hro4A217StppwiM0tY4n33RQEiywDHQ/hXvWTMzF3wQ=;
        b=VHCBfanfRYqLS3IBndKG3NAmUCZ1HkTFdZgauKup/0428phRK2qTUKNdSph++MW+s9
         6OOeztgkzr/H4ExgSGRIItXeWVTQdS6pJPeOlyAndw3Su/ZGDl4ABMdEV0L01tv1HuKj
         OkyhjSB0k6GR3+Ip1PP9Xdt46gAAkeUv+JfRLQCL5IpNUO4TKcSxP8zmL3Rf5KpKShHe
         ch0+PG7YJUBWtx47WF8qGZn8zz46JlXG3WH68GaSrBBG2DuzsaCiRRwlU2PoQ1/7OCvL
         xyiszWu2c10ZyVaRHTHurwBlv13Zj9MeZmhZVe+57Js9CSdc0fGI21AOUr2WDGyIlZIl
         cJXw==
X-Gm-Message-State: AGi0PuYA3r0pUvWzUqU+AEF299nnax7SV2a2wJsCELotljMA6A9WFL7w
	y539q3fsP9dIkOHlc5wtxNch4XVBuvCIhg==
X-Google-Smtp-Source: APiQypIvl4HEXmd2akGKXHg8JhSqOtV2gBJ0Gj0AOo4AJoBdmw4hF+F86uOGCQQcSoIXmy7FKomt1Q==
X-Received: by 2002:a17:902:bcc4:: with SMTP id o4mr10656486pls.275.1588176701570;
        Wed, 29 Apr 2020 09:11:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o1sm4833062pjs.39.2020.04.29.09.11.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:11:41 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/16] kernel-yocto.bbclass: Fix deps when externalsrc is used
Date: Wed, 29 Apr 2020 06:10:48 -1000
Message-Id: <0526ca2cc2f9494a2fe3091f7692f85daef08aa4.1588175775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588175775.git.steve@sakoman.com>
References: <cover.1588175775.git.steve@sakoman.com>

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

