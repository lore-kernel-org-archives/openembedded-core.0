Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.190.1616596807081800357
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VbWMP+6i;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so1271155pjb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+YergFAIKP7FdEwwr2EI8BlEy1M/Zg8zXfKaBx8PZ1w=;
        b=VbWMP+6i7R4Ggfdc1LgISJlMswmXvkcOAaQO+xxlc22YhYB1EVrDCk11E4OQhegzgs
         IMjzLJkmH5G/ABoSWLL/Q0mMJJziXhmqMrcBVKY44Lzt31I+0TjaetuaO8u/WkTBrqG1
         fkPDVsr9/3nVlJjZIv7tCPkKl1T+Rw0fjX4kFOnFnjuEsGuS6e01CYB7YeI3g2bzbdby
         8RP0GPiJjbrE6/CsY4FNbCBaP9expAUAmIjnKJaiCHofgKdEgaj/8DhCq/dpNXhUK4R/
         JPl2+pCHOEHbn6vhL6rOIcwkvO98VVv6PtGzKSbvnwLcLIDCY6n+FrgPD71KXLCg2n3I
         r06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+YergFAIKP7FdEwwr2EI8BlEy1M/Zg8zXfKaBx8PZ1w=;
        b=pjtrFROCadN6eS+l+P+BuWvKr/z16yVCRH+R9urDY5dFmdpa6b2NbPY6onixwnGwI2
         k2QKcmOycojZo9cfl7+L7GlHzv/ctQKm+ZKy+1iPhaRn+0k+wnH/HIm71TStv9PKmMtR
         PcSqDSVs6C8GkTPAbd30NPpEw2BrLAtkLArFFZDISEwU7FnsHzjklJC1lqQdVw71LNJ8
         sKsgwiLH1P6VEDg4OvrQfogwDABVXYwsNtnReFeNtAOv5W5+MYLhHxL8FJsbNE3GfxaS
         T4mM14BMaGU4Ksml4lTd5L7DvmKRBJGclxl1jpOwVDbkHvEL3VZr9x+OWlTq96+rBUSx
         Z8qw==
X-Gm-Message-State: AOAM531hi+kpO+qTAJmwo+1TX8KR/s7qSL382OKX2b0sHswWNh2y1Hm3
	9E+ll4oqHn+XC7pzZp/P01nrHVJgnGiaZ+rN
X-Google-Smtp-Source: ABdhPJx/ZY2p3b+/z8DdjPwR7oDCy9L8fzaNMBSVPntoZp+NeuO9fEsHTHsUL8782XNECLrkBwHLrA==
X-Received: by 2002:a17:90a:1509:: with SMTP id l9mr3825286pja.163.1616596802789;
        Wed, 24 Mar 2021 07:40:02 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.40.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:40:02 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/21] initrdscripts: init-install-efi.sh install extra files for ESP
Date: Wed, 24 Mar 2021 04:39:07 -1000
Message-Id: <3be53035c567c06a09a36d68c41393482bd4789b.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chee Yang Lee <chee.yang.lee@intel.com>

Currently the install script copy only few hard coded item while
setting up target ESP, kernel artifacts, all .efi in EFI/BOOT,
grub & boot cfg and loader.conf.
While ESP can be much complex, eg: contain multiple initrd.

Add a ESP folder to carry any other files to setup onto ESP.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6eaca9cf20c42501fba27dea3a6446bad948e859)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index b6855b5aac..f667518b89 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -279,6 +279,11 @@ fi
 
 umount /tgt_root
 
+# copy any extra files needed for ESP
+if [ -d /run/media/$1/esp ]; then
+    cp -r /run/media/$1/esp/* /boot
+fi
+
 # Copy kernel artifacts. To add more artifacts just add to types
 # For now just support kernel types already being used by something in OE-core
 for types in bzImage zImage vmlinux vmlinuz fitImage; do
-- 
2.25.1

