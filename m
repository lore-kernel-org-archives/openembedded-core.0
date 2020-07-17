Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.10732.1594990603314366387
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 05:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QGxLXesJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id k18so7463190qtm.10
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 05:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pM2wLEWfq0Rolqfc5Lei2Nrj+1ELnef+kaaTGi0aaJM=;
        b=QGxLXesJxMxvypKSr26Q2nXjXKtrOXBDMYO5qb860F/ptaWAEMvjySnE6NHZEsmMEc
         yNgfQyUi1P1VWZ7r8RDnkYNyUEIicpUlaTlmfuha2HtQ3nTMW8ieGsxJ6Qsbkdg/WqJ0
         vPEq5IOv+WEhIOpxrKF+eO+mu1qwbiVwt0DnTIh6h0iZTPKHYiY/taGb84md6mzH/PZM
         kr/rBns/NHV0ZIRyYr8Y1B6DkiXGOmU0j/XUVVkaOn9eezU2JDxdTXJTazXFunX2GWzR
         jr55aEdZgKr25JimZtQYP3LnS41h+edPMJyhnCmG82TPZ9eXv1tjNeRfEVL0/7oQiDm5
         BFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pM2wLEWfq0Rolqfc5Lei2Nrj+1ELnef+kaaTGi0aaJM=;
        b=RkjSIGiFRFx+NQBea/dzcupAQD1ZBjyI4A4PM2ZK46QGNRgPaR1/R97NqnerRYbFnY
         Cei7YoXaWArnI5iJwOZfyforgl9V7Uy28i9Y326KSlUK3Dauvh6T1N5J/1PrRadud1FA
         BlRVJfsgHpbAsPiuiAhGbDQGDNoMNXT6WYfK/W182OxUy4JQHOc1O3GwRuR0BMW7ni6l
         AWF+UX0lmuVxCzer1jRCGRq+ngHBQGqX/7Ocpv8gmHXru8wSP08EADb+pu95aixKMS9x
         Loo7PDmdIwYb93DIdh0xFMbZk0u3XN4gfwGvhcw+ztqZaCEE7OBoJ2hASxk7J2sArR14
         3sOQ==
X-Gm-Message-State: AOAM531BcKUlYkIAiisK18mQ0rFDtVm+rxvv0PDkMrnNCoO8g6FwD2OX
	qxrzGbXHOsdYDbIq7ZXbOYs=
X-Google-Smtp-Source: ABdhPJyKcVqSsQuejB95BuU4R3vUUppez7eIUF+9CoOE9DUIsgWap3k4l9FxHfbU1dnmghfrhm3d+A==
X-Received: by 2002:ac8:bc2:: with SMTP id p2mr10625466qti.374.1594990602403;
        Fri, 17 Jul 2020 05:56:42 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 79sm10431808qkd.134.2020.07.17.05.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 05:56:41 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] kernel-devsrc: fix on-target module build for v5.8+
Date: Fri, 17 Jul 2020 08:56:34 -0400
Message-Id: <55137b76cd20b3ac080ad0897e3da53d08fd80e0.1594989620.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1594989620.git.bruce.ashfield@gmail.com>
References: <cover.1594989620.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The kernel build is now more sensitive to changing build inputs,
like the compiler, linker, source tree location, versions, file
timestamps, etc.

When a difference is detected, the kernel build invokes a syncconfig
to update/regenerate files as required. That process may prompt, and
hence breaks automated tested and other workflows.

By default, we don't want this to happen so we make sure that auto*
timestamps are newer or equal to the .config timestap, we ensure that
autoconf.h is in the filesystem and that we've substituted the
cross tools used to build the kernel with the names that will be
on the target.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 5940cc90ea..0c98535f75 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -108,6 +108,11 @@ do_install() {
 	fi
 
 	cp -a include $kerneldir/build/include
+
+	# we don't usually copy generated files, since they can be rebuilt on the target,
+	# but without this file, we get a forced syncconfig run in v5.8+, which prompts and
+	# breaks workflows.
+	cp -a --parents include/generated/autoconf.h $kerneldir/build 2>/dev/null || :
     )
 
     # now grab the chunks from the source tree that we need
@@ -249,6 +254,17 @@ do_install() {
     # Copy .config to include/config/auto.conf so "make prepare" is unnecessary.
     cp $kerneldir/build/.config $kerneldir/build/include/config/auto.conf
 
+    # make sure these are at least as old as the .config, or rebuilds will trigger
+    touch -r $kerneldir/build/.config $kerneldir/build/include/generated/autoconf.h 2>/dev/null || :
+    touch -r $kerneldir/build/.config $kerneldir/build/include/config/auto.conf* 2>/dev/null || :
+
+    if [ -e "$kerneldir/build/include/config/auto.conf.cmd" ]; then
+        sed -i 's/ifneq "$(CC)" ".*-linux-gcc.*$/ifneq "$(CC)" "gcc"/' "$kerneldir/build/include/config/auto.conf.cmd"
+        sed -i 's/ifneq "$(LD)" ".*-linux-ld.bfd.*$/ifneq "$(LD)" "ld"/' "$kerneldir/build/include/config/auto.conf.cmd"
+        sed -i 's/ifneq "$(CC_VERSION_TEXT)".*\(gcc.*\)"/ifneq "$(CC_VERSION_TEXT)" "\1"/' "$kerneldir/build/include/config/auto.conf.cmd"
+        sed -i 's/ifneq "$(srctree)" ".*"/ifneq "$(srctree)" "."/' "$kerneldir/build/include/config/auto.conf.cmd"
+    fi
+
     # make the scripts python3 safe. We won't be running these, and if they are
     # left as /usr/bin/python rootfs assembly will fail, since we only have python3
     # in the RDEPENDS (and the python3 package does not include /usr/bin/python)
-- 
2.19.1

