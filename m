Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.4533.1599043686325238837
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 03:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VRPRPGZl;
 spf=pass (domain: linaro.org, ip: 209.85.221.66, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f66.google.com with SMTP id e16so4724147wrm.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 03:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9B1trdK5JbKONXlUaRkeijoTCZDmQB1M+gEQmZeH+p8=;
        b=VRPRPGZlXfk0UVsRE9Qc5xc3OT8qrT/EQRoRNGS3hxV/Be0FY8W9Qsa51qVQy5clyK
         UW3js1+Q9L4XSIY3aPZlulkMZuf9bYnew3oyLT52iu6mqc1JGHWKGQLpBSbCaPZ8pv08
         LgnKgJ7yvWezHaxJTyCQwyrNq507tX+WjNfhLfgRIob9huSgwIUXCgj+p6yCWeV+pTPZ
         yroZswsTnSoGPDKCefeybAJ5+YD7ueSciiqC46iIqyiFmffKJnDk2M1UFRYghJThBEmO
         DiXNYo7mzaO0/ObvJNBgj6KCkeg+hRaaS6n9tKUk8tKTFFDmwuuSMWXmHXlKlQscOMui
         VBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9B1trdK5JbKONXlUaRkeijoTCZDmQB1M+gEQmZeH+p8=;
        b=EiIYYDJ8btlPkoh3anAF+0jkPBZwIKMhKT0HuBAQGQnibZCFMty7W7iyCNohsjO7dg
         LqH4zMHXStz74z4THFJRWYCrFShQJf+O1Rs3vp8i61wPUa/UT3S0oXq8fwcT+gQmVc3l
         3TCpaj2Q4ma2kag3sOrCON7QrpmlIoDU76/N8AQI5TDrV0ZpNHncCB3v+5xF53TIx50w
         d3YGy/DP6eCrK9VuqLFOKRMn7IimBeiaDt7WHA2TAjmzehbmszNZn5r57K03mb/N8CdM
         LIeMtR8PJjdCFWlEvL0WdUY4qgKC5J06kAWfxO92qv8iMRXjuCquNG5TEiM9LT4tAkp7
         KJUA==
X-Gm-Message-State: AOAM530aj+vupR3dJsMKC2sf54VVfpcB4X1PWBTT3gcrzqQ25x4rCNWz
	6Mh6nSNLc0CZZq6VgXmVUjS/p15zblA/tA==
X-Google-Smtp-Source: ABdhPJwvGABlyFvnBfrhC+ewgXwwB3wBP8al4S93MH30RxnrYphvdcGYURWGRgEHAV25kc+KGEM7NA==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr6402004wrv.318.1599043683889;
        Wed, 02 Sep 2020 03:48:03 -0700 (PDT)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from nikaia.localdomain ([2a01:e0a:1b9:3e10:d6af:c5d9:8b6e:b994])
        by smtp.gmail.com with ESMTPSA id v17sm4389002wrr.60.2020.09.02.03.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 03:48:03 -0700 (PDT)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] linux-libc-headers: kernel headers are installed in STAGING_KERNEL_BUILDDIR
Date: Wed,  2 Sep 2020 12:47:44 +0200
Message-Id: <20200902104744.378272-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since 'fido', kernel headers are installed in STAGING_KERNEL_BUILDDIR,
not STAGING_KERNEL_DIR. So this message in the linux-libc-headers
recipe is slightly misleading.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index b1cb553c75..3bceac40cc 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -16,7 +16,7 @@ LICENSE = "GPLv2"
 # and have a machine specific libc.
 #
 # But you have some kernel headers you need for some driver? That is fine
-# but get them from STAGING_KERNEL_DIR where the kernel installs itself.
+# but get them from STAGING_KERNEL_BUILDDIR where the kernel installs itself.
 # This will make the package using them machine specific but this is much
 # better than having a machine specific C library. This does mean your
 # recipe needs a
-- 
2.28.0

