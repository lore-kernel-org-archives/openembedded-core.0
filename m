Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.26634.1590715767480874479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 18:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YKpapzBH;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id g28so121759qkl.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 18:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3oq1Qk7Jas/2CHU3zWcGRYnW1cweYOM07ln8b8+s/ZE=;
        b=YKpapzBHOxFURvKnYGRpt31e4nzbWCFKoR6zEYULqqUeuVGeFkoP5MPjVvHg3TiaWS
         KWPGBVEPgAfFS61SjDboS+Ma8tqBIBD1xnVxztGNvwyst3NclU8sIy9gR03hr19tvVwk
         aaNgwDUYeBVhWq2Srcfmy/klQJ9BN3ycquLFH7nNCnK5gQi5g8XA7D2rfAw4XzK/bxYB
         fsgaenFjWT+94R7GgDjTfgQH8WAxcKb5a9/WkM+LxOtV1IcGAdEDk0elPwk5uyZ692q9
         wxAZk3+PAVorhTWZh3WCmajrwup/zVTfKE/VP1EnP/7x0AbaSYVcY8N/qwsBLgWibUEB
         wL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3oq1Qk7Jas/2CHU3zWcGRYnW1cweYOM07ln8b8+s/ZE=;
        b=MVEA7Uy06pDFQPrIwp/qWjxiwWw46gsn6kSDPXEh73M98kziImMIMuJBzagglfpC06
         RVmMlAbsYf1hvrMqCnwmqZJUF7uQtet3t+TMi3Jp+WFA/FcrndI/nr8s1j/p439RmXRC
         Xh9M+6GPiaQmaMYiCmleED4Voj0q/JfiI9PgCg4haHb5WDvM3ZOzBCk7kDjWLrKU0PsD
         Y9BDUhr4fQqCgXDAWwXymJfKoaH0+Zn/4+FOHe8KDKdWIomHxiQxXDWYx+9l7fDjhu3g
         XoZzgdeMuZPQcWhECyvdIHtmadLHgf0skzyvs/wl3fSflYGIDU1lQyFs4+/9tcGd/BDN
         Xg5w==
X-Gm-Message-State: AOAM532wAM96llnEbMqCtOBcX6KslydGdXUVV73tCYZdJpgQnfWdtGlQ
	dw5AilLzF/Fxf5q4rXN1zGM=
X-Google-Smtp-Source: ABdhPJzAydNN9j/x3jPg5b0eM1HaX6jn8ejTMkce/8V/nkfEzT8yqauet+LNkcstNHejCFVRlcP9CA==
X-Received: by 2002:a37:9ec4:: with SMTP id h187mr5711182qke.72.1590715765572;
        Thu, 28 May 2020 18:29:25 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id c16sm4101292qko.100.2020.05.28.18.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 18:29:25 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/5.4: temporarily revert IKHEADERS in standard kernels
Date: Thu, 28 May 2020 21:29:17 -0400
Message-Id: <98e26b8434453020a82b966cd289140d83e243f7.1590715483.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1590715483.git.bruce.ashfield@gmail.com>
References: <cover.1590715483.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We had a commit that enabled IKHEADERS, since bpf requires them on
target.

This is still causing incremental reproducibility errors during the
module compilation phase of the build.

We are temporarily turning this off, so we can integrate -stable
and other related changes. A replacement feature "reproducibility"
is also being added to this can be conditionally enabled while
we debug.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 760ded446a..e6366ee36d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3d70f110c590b38219843a3a0815a232fd542cec"
-SRCREV_meta ?= "2647d22ea8ac2d3af6fe3b0d635cf84ee06f95e3"
+SRCREV_meta ?= "6d128007a79cdbecb66c5d8d186c0bbc41496526"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 1645906034..4a37c758b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "80606f0432a35225e7bff188a890b836018bae61"
 SRCREV_machine ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
-SRCREV_meta ?= "2647d22ea8ac2d3af6fe3b0d635cf84ee06f95e3"
+SRCREV_meta ?= "6d128007a79cdbecb66c5d8d186c0bbc41496526"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 068cebca2c..2bba72df77 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
 SRCREV_machine_qemux86-64 ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
 SRCREV_machine_qemumips64 ?= "2da40cf3f065512eea3729172f8e3f0cf1857160"
 SRCREV_machine ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
-SRCREV_meta ?= "2647d22ea8ac2d3af6fe3b0d635cf84ee06f95e3"
+SRCREV_meta ?= "6d128007a79cdbecb66c5d8d186c0bbc41496526"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

