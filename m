Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34375C44507
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:59 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9509.1783835514752677923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=gksYj9IC;
 spf=pass (domain: underview.tech, ip: 74.125.224.48, mailfrom: vince@underview.tech)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-664ce3000e6so2146777d50.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835514; x=1784440314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cuIwSoeUS+/39yVtgEtHRA9kSwASaEG3QtwRIUox8Oc=;
        b=gksYj9ICB/3uDnk3FaaFYT8YkvuX0jhsOQYMCL0uyjyy5yQc4H9F7BgIVJfv3NXYI/
         E75/nOLLjJupjNVLvHvyfjW5w+Duu5a9jxnR+cNs7XuUu+6vmYbIkNgU3RMs82uj8VSj
         hcOVbgiJu5zLpriMtPwv3kXet0Dlw26EWXfPfPCLLe1yOQdBjYamaeerFZVlXFNdRvWA
         qyTVe3/TZPj9U20BG2NzXaC0CfZsOIp8syI8HTolUmf5ISEahY6fiuJELoyHyDexjdYb
         mtyV1Gm+q508TK1uSZM/IUQ1BMhc26Wsp7M2TipnMq9dU7q2kYhJ5dceobk1BUepls3w
         Ghvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835514; x=1784440314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cuIwSoeUS+/39yVtgEtHRA9kSwASaEG3QtwRIUox8Oc=;
        b=mWKuTmCRWK03sAB5tMs8trrQBCeB8mi5rgFba0gfzorJ7BrRGX8BXDu2Wb6G22Lkul
         prMTrJlIT/3utrP+XeXiiNLDUyV+GXa1gaotPCVMlBhL9d99JcZM6CgbAE/UGA+RQ1YS
         T8ZD0veZTttYLe2GJD65VnCD44q1MYJjfr+oIj0kJO5jaGKCSVK9xHPnF9kGEO18nSQG
         zSjkdG6zMMbV4bG2C7gj7vZofCQpku3Y4VIWwVVJP5GfnrNcL1Ho++AtDtjVVG+x7Vl6
         dg2T9JLfiYWgPqfY6avrFDQPk3Ei+efoo0CAih8j+6yp4kRApjY7JRK0975xboHOUfOr
         RKeg==
X-Gm-Message-State: AOJu0YwxMICIa3nEnqlFk1BxIu1M2gprkLFS2eAULHCEROVlx9rRRVYf
	rbvth8AFdery4URi1NECeiJh5oWkXxHkSxt1DggV6slXW4oql03RZM4gae+w0Ak5OsLLGDq4KSv
	4txkCUE8=
X-Gm-Gg: AfdE7cmKtAmhoKBsOPYzIthGGtVZMByBlFNdBzZJ0vCwZKLJLNioSdkkowAy77lJoPK
	5Yaog6kcLYGO1/n9WoXaP+e5Bw9e66TBkSPLU5szSLPTD+Dk1HTaLVze1uTlX1yXDo2XGuRmpW6
	b9GjZl8fE3iQq8fwRfF3G/t9Am8rpOdjP2HnwzzbydSolHoGQcD2xF39sRgK8CVYJyf5JR8qALM
	x/Lqj7EXZXYsMHbTR+QFO5cohABxN3My9yS7J4jlDWu00gSBhEGSCqCbokVStQ1FakVjjhsdAul
	5un1eJrCap2+fvrH0M9AH7H5Hz91AqVPt+S+jtIfxlNq5WGKguINUPa+8ZiHZol9lxHmBSuRnZf
	Hsr73jTh7WMnHEkVuEnCEi3qFaLF8CGnb2W4ozLyUeSehgfMtYJJpzYkg5hYkAxrnW/5NN6J11n
	OXGO1DNtd49ifGng==
X-Received: by 2002:a05:690e:1209:b0:667:d918:a433 with SMTP id 956f58d0204a3-667d918a83fmr2869830d50.51.1783835513804;
        Sat, 11 Jul 2026 22:51:53 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:52 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 23/26] linux-kernel-base: locate virtual/kernel WORKDIR
Date: Sun, 12 Jul 2026 01:49:51 -0400
Message-ID: <20260712054954.4063745-23-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240748

If KERNEL_PACKAGE_NAME is not set to default
string "kernel" there's currently no way to
determine the WORKDIR of virtual/kernel.

Commit adds a way to determine virtual/kernel WORKDIR.
So, perf and make-mod-scripts builds.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/classes-recipe/linux-kernel-base.bbclass | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/classes-recipe/linux-kernel-base.bbclass b/meta/classes-recipe/linux-kernel-base.bbclass
index e2187a73f0..83fc075ced 100644
--- a/meta/classes-recipe/linux-kernel-base.bbclass
+++ b/meta/classes-recipe/linux-kernel-base.bbclass
@@ -54,6 +54,36 @@ def linux_module_packages(s, d):
     suffix = ""
     return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
 
+def set_kernel_staging_vars(d):
+    from pathlib import Path
+
+    kpn = d.getVar("KERNEL_PACKAGE_NAME")
+
+    # FROM: kernel.bbclass
+    # The default kernel recipe builds in a shared location defined by
+    # bitbake/distro confs: STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR.
+    # Set these variables to directories under ${WORKDIR} in alternate
+    # kernel recipes (I.e. where KERNEL_PACKAGE_NAME != kernel) so that they
+    # may build in parallel with the default kernel without clobbering.
+    #
+    # Due to this STAGING_KERNEL_DIR is changed from default defined in
+    # bitbake.conf. Currently there is no way to globally set a variable
+    # in a kernel recipe and no way to get the WORKDIR of the kernel
+    # recipe from within this recipe. So, folder path is determined
+    # using other pre-existing information.
+    if kpn != "kernel":
+        workdir = d.getVar("WORKDIR") + "/../../" + d.getVar("PREFERRED_PROVIDER_virtual/kernel")
+        src_path = Path(workdir)
+        # Helps acquire package version.
+        # Caller should only be using 1 version at given time.
+        for x in src_path.iterdir():
+            if x.is_dir():
+                staging_kernel_dir = os.path.join(workdir, "%s/kernel-source" % (x))
+                staging_kernel_builddir = os.path.join(workdir, "%s/kernel-build-artifacts" % (x))
+                d.setVar("STAGING_KERNEL_DIR", staging_kernel_dir)
+                d.setVar("STAGING_KERNEL_BUILDDIR", staging_kernel_builddir)
+                break
+
 export KBUILD_BUILD_VERSION = "1"
 export KBUILD_BUILD_USER ?= "oe-user"
 export KBUILD_BUILD_HOST ?= "oe-host"
-- 
2.43.0


