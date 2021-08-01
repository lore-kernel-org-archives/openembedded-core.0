Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.7626.1627827829921581469
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Aug 2021 07:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B3INr0PM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id m12so13443391wru.12
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Aug 2021 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YtMr0nH3e5EuFQQdXAEH2ShytpnvaQenkb+jlj1fIE0=;
        b=B3INr0PMAe/U/CZaQK0ekV3AR0TyuOLCa6N6kmW9P9kFtxmXm2+8HVkFeLItd4S4lv
         YAtKFzp5muuXjdsUMpJH5TXbjRZ67/qNQpzQxzTkv8LrPwvE0rM0TSXf34kzIhCX2Lw2
         VjVDbFzeDHbS+F8n5aY+3f1axcIkkscP10QhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YtMr0nH3e5EuFQQdXAEH2ShytpnvaQenkb+jlj1fIE0=;
        b=iG9KkfbWbgF5j3xzmsADk2h0UAF4fjMJf7G6PWNPPNe4JZotwOuBofh5AZy8watrJT
         o9u01tG92B0fQwCnbn3QYyI8OHdfGfeYlnpUT6UsyA1Of0M+vl0gqC1LxvJ+X1Xg9vjH
         UuhXc44uaMT50szF/7ipBLlt/cNFYuGkesQniUOdnxT05RVittRPjbojp+XWffAYLcPA
         1MKgqtxFVJFOE/DZ+LpWn6WOqy9dAh4ThujeF0NmP4bc4cJPSvweJ010q1n7HPdDxY3t
         DklNXFxIUiWHnWwxoTsYBr1LSvkin2Qc6vmMNsRQk/CUGxaFHZ/5JwKOzpOjBR8QlwZ1
         WHNw==
X-Gm-Message-State: AOAM531tMF+5/0iVIyYYAdQrhIU+RT0nyJ/Z2mOJxZWmTZb53Lm2ejm1
	jgT86oLYozln1F4z0kw+X/I3Sq8ngeuQZw==
X-Google-Smtp-Source: ABdhPJwBdXEeAO2HKFZ+HoF0THm9jMGYAU5li5HvVkdo/0EhqvSxovb3DfI9pZpEbY4yhzg2mseZsA==
X-Received: by 2002:a5d:4dc7:: with SMTP id f7mr13340761wru.118.1627827827919;
        Sun, 01 Aug 2021 07:23:47 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9bc2:7fed:cd2f:1c0f])
        by smtp.gmail.com with ESMTPSA id d24sm7609767wmb.42.2021.08.01.07.23.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 07:23:47 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] populate_sdk_ext: Fix handling of TOOLCHAIN_HOST_TASK in the eSDK case
Date: Sun,  1 Aug 2021 15:23:46 +0100
Message-Id: <20210801142346.3418341-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current way TOOLCHAIN_HOST_TASK is handled within eSDK builds is
causing much confusion, even to people who should understand the code.

For a normal SDK, some layers append to TOOLCHAIN_HOST_TASK unconditionally
which is fine, until the eSDK tries to override the variable to it's own
values. It does not support or use packages installed using this variable
and would use native recipes instead, it is a very different approach.

In the referenced bug, binaries are added but not relocated leading to
confusing errors.

To fix this, add a new variables for the eSDK TOOLCHAIN_HOST_TASK
to be explict and force the eSDK code to use this instead. The setVar
in non-parsing context will clear out any appends resolving the current
issues. The patch also gets rid of some dubious task override use.

[YCOTO #14047]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_ext.bbclass | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 10f3265e91b..35679208bcd 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -2,15 +2,11 @@
 
 inherit populate_sdk_base
 
-# NOTE: normally you cannot use task overrides for this kind of thing - this
-# only works because of get_sdk_ext_rdepends()
-
-TOOLCHAIN_HOST_TASK:task-populate-sdk-ext = " \
+# Used to override TOOLCHAIN_HOST_TASK in the eSDK case
+TOOLCHAIN_HOST_TASK_ESDK = " \
     meta-environment-extsdk-${MACHINE} \
     "
 
-TOOLCHAIN_TARGET_TASK:task-populate-sdk-ext = ""
-
 SDK_RELOCATE_AFTER_INSTALL:task-populate-sdk-ext = "0"
 
 SDK_EXT = ""
@@ -755,6 +751,10 @@ fakeroot python do_populate_sdk_ext() {
     if d.getVar('BB_CURRENT_MC') != 'default':
         bb.fatal('The extensible SDK can currently only be built for the default multiconfig.  Currently trying to build for %s.' % d.getVar('BB_CURRENT_MC'))
 
+    # eSDK dependencies don't use the traditional variables and things don't work properly if they are set
+    d.setVar("TOOLCHAIN_HOST_TASK", "${TOOLCHAIN_HOST_TASK_ESDK}")
+    d.setVar("TOOLCHAIN_TARGET_TASK", "")
+
     d.setVar('SDK_INSTALL_TARGETS', get_sdk_install_targets(d))
     if d.getVar('SDK_INCLUDE_BUILDTOOLS') == '1':
         buildtools_fn = get_current_buildtools(d)
@@ -800,12 +800,7 @@ do_sdk_depends[dirs] = "${WORKDIR}"
 do_sdk_depends[depends] = "${@get_ext_sdk_depends(d)} meta-extsdk-toolchain:do_populate_sysroot"
 do_sdk_depends[recrdeptask] = "${@d.getVarFlag('do_populate_sdk', 'recrdeptask', False)}"
 do_sdk_depends[recrdeptask] += "do_populate_lic do_package_qa do_populate_sysroot do_deploy ${SDK_RECRDEP_TASKS}"
-do_sdk_depends[rdepends] = "${@get_sdk_ext_rdepends(d)}"
-
-def get_sdk_ext_rdepends(d):
-    localdata = d.createCopy()
-    localdata.appendVar('OVERRIDES', ':task-populate-sdk-ext')
-    return localdata.getVarFlag('do_populate_sdk', 'rdepends')
+do_sdk_depends[rdepends] = "${@' '.join([x + ':do_package_write_${IMAGE_PKGTYPE} ' + x + ':do_packagedata' for x in d.getVar('TOOLCHAIN_HOST_TASK_ESDK').split()])}"
 
 do_populate_sdk_ext[dirs] = "${@d.getVarFlag('do_populate_sdk', 'dirs', False)}"
 
-- 
2.30.2

