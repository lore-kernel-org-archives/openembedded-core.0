Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.37299.1593956678219311908
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2020 06:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison-systems.20150623.gappssmtp.com header.s=20150623 header.b=f3Ivq/Z0;
 spf=none, err=SPF record not found (domain: madison.systems, ip: 209.85.216.65, mailfrom: matt@madison.systems)
Received: by mail-pj1-f65.google.com with SMTP id f16so5488181pjt.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2020 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison-systems.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LHpj+e92lqLWeKV/QpPsbT7l0Imlg2dOm70Yvi4dHjY=;
        b=f3Ivq/Z0eEqEbJlShmX+F7kX1fHK9ayUgeiosVXFBmARnx8/6Z7I1jqjgnTgCGJjKB
         iIbv3COrOF6ri9dpjGW54CCY8OSP8jS1KZc1AxbjOhwvSmWV0dTnfEiblEN4mXm2Vp0r
         A5rd8yH7BejvacapjZwO+hLoJjU0MfK2UZDAPa6iIzMcwcVEpkvltsBNPXbOL5PdsuSG
         vm89J1MscBFM4fc44d4weHD1pHgnYHjT0e34H75B3eU+/ECGR1B1aoEKYh62gdkkSPDg
         JI8SfWXArOD2JfJVBxgzA64/l1dFWLa4g58o8jNDSZgjOj4BwegNSXl9+SkMKmagmcTP
         X7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LHpj+e92lqLWeKV/QpPsbT7l0Imlg2dOm70Yvi4dHjY=;
        b=BvFv2wPpHRGRdQLGh3vLUT1Aiwf67xOxslmNZzrvDhzCZ81rZUx3N/4RTsL7vrJfSv
         GZvUVZR9xG7Bob6T6Px6HfKzTM3YyAcTXDAlJwbFB92O3Cr9qQOlQb/dC8lOPIHSHV0q
         tRvtc+Vg1yWRYjzfdC29tIN1VJi3ILsCBcs3MfdHyWmx8xiiwyf1VfBh1DXVFG7GFNws
         USE3+H6oRj++IHH2S/Jkhb3RfbHZKbZaiEe3lqT+lYYQIJSxRxCf/8/EyP4gNr1+jcnr
         RJfvVHqtAUZzc6C2Wx58iRWIwVichrjCh67CybZQxpC+FMEiA0gJqtvqOALFwLyU/ErJ
         2NtQ==
X-Gm-Message-State: AOAM530LJ6xqKfZEuH49ytek+4KwrqCXQa5+5/gBkA7f1crWF0KSqHga
	MCg2XXX7Woo7vRxZHtoRpun3+qFYdS7laQ==
X-Google-Smtp-Source: ABdhPJx7+okLyEeXx9ZzalvTeHjOONfeoKdpqIoxjSKMxaQDhM5diSqGJtwGYR87ihXCsevNg9Ncow==
X-Received: by 2002:a17:90a:de0c:: with SMTP id m12mr34336590pjv.228.1593956677354;
        Sun, 05 Jul 2020 06:44:37 -0700 (PDT)
Return-Path: <matt@madison.systems>
Received: from legion.athrat.org ([2600:1700:87f0:9cff:2414:db63:c42a:e448])
        by smtp.gmail.com with ESMTPSA id b21sm16802972pfp.172.2020.07.05.06.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 06:44:36 -0700 (PDT)
From: "Matt Madison" <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Matt Madison <matt@madison.systems>
Subject: [PATCH] kernel.bbclass: add gzip-native to do_deploy dependencies
Date: Sun,  5 Jul 2020 06:44:32 -0700
Message-Id: <20200705134432.2044867-1-matt@madison.systems>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a modules tarball is created during kernel_do_deploy,
the tarball is compressed using gzip, but gzip-native is not
a dependency so the build host's gzip is being used for this.

Using gzip-native will, by default, use pigz instead of
single-threaded gzip, making this task less of a bottleneck
for builds with a large modules package.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 301e3b86b2..aef5e97892 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -7,7 +7,7 @@ PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel
 DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native bison-native"
 PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
 
-do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot"
+do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot gzip-native:do_populate_sysroot"
 do_clean[depends] += "make-mod-scripts:do_clean"
 
 CVE_PRODUCT ?= "linux_kernel"
-- 
2.25.1

