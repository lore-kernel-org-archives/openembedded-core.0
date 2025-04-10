Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8459BC369A4
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 09:04:49 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.30027.1744275888414890172
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 02:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LWq6U7KV;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso2955818a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744275887; x=1744880687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sfbac3oQqPpAw1XS7GoaA0U323th0Bl+cynPWLMkwQk=;
        b=LWq6U7KVGm4PCnOsD2Fr70fyVkE1/Yvc3klWWa3JcWOndiY+ZAsKx8W/5sixWl/W51
         mHfI4NNvklpuPDLSETGsJ11XvlFCTeDvOMifzibWt7ljEZ5ITZh7ZEj8eNczRpSG0H0N
         sxderzFOJZALvqGJQKmZ73ulpMUEab4KuJxiX/l5n1HDubIOXL//iNysW5SdMl2yuOy1
         Ft3EYj4QL1LtH7RDQJSs4z9wegfhuvZCWk0JFCel+LWOqnLLyNyCpQhJv9hDtYQqfBHK
         TryA5e4eASgywfcjzfli3fDZPEXD2NAmcY62O03XLQGhGKtLKdkyqhozIi3GfcbJFy97
         dd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744275887; x=1744880687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sfbac3oQqPpAw1XS7GoaA0U323th0Bl+cynPWLMkwQk=;
        b=kQUXQmP4c+JlcLazfUXZtJwCLcf0brFLv5QrcyDDSOyPnY6IlWFd/q/0YkdN68CL4Z
         +BjC6Qe+gVK92vvDyve9YgkcB+H7mRYK+X8NrxA5Xh6wrfKr2PAF4nbEKUwn8AP2llrh
         8lQ5LvMutS8988frUOXziWmt7STVZtGVREvJLloIv5Rj3HEEJB2KigaVlI3lpr9i4yZB
         ygtLEdRJgSBF6eBZAmwhCT0ZPMHxBrQEROCwlmisGz2pZPjRS9kvcKL2xE++8GzK+LXi
         mVKWYZ45Hi2joTwtKn3QGSMY2stG2hJaTDlwDld5ESsZAt+rqSF9Hmx6ClQ9Lggev2mv
         0xnA==
X-Gm-Message-State: AOJu0Yz0rS07KHPhDH5E2upb9ADI6B2l1xzY2WqHIPUgwjfNy+CbJ3R2
	6qqfUGr9hf7fG74akUUODdYB2uexrZ8FeoWqIK078mZ0WCH8UUemibSLqQ==
X-Gm-Gg: ASbGncsYTlaxRP76Y42KJAzpz0YOKkO/Pip9doTJxcA1BBWbvCrNWA8yLseUXT4q9x1
	R7/gvDtuzZG5ACYVmJBnz70/LN/q8NUHdn/KQUJl7dmKMWQa7VAWhYrE5NrBq9ZBmgjoZAkck+l
	KCxhPRvyCqjC/nPouMVtHAdEkmaed0q721tyGZs9eqNlrXBVKQ67AJl1z74lMZ5vCZyYthE1BVf
	+2ymkCyc/HOAvnWHnHh2DnUapxK14o1zN/kanWMoZrSguVgyFOIDt2HYX+ciYMe/NloVV2DpPsL
	prFiOCJyDeXA/OmhvEZ+99n1f3x/My6NunaZktDf0V5G1IJdNAqgFhGNCIQ=
X-Google-Smtp-Source: AGHT+IF2C8/sjmByGIahZTt0ELCT2n6zF930yG4fZ2VEShrdoFW3O2DmbTZWhZRbfE8poic1PTcadA==
X-Received: by 2002:a05:6402:13cb:b0:5e5:ba77:6f42 with SMTP id 4fb4d7f45d1cf-5f329f7e1b7mr1519272a12.4.1744275886623;
        Thu, 10 Apr 2025 02:04:46 -0700 (PDT)
Received: from localhost.localdomain ([185.164.143.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbbac93bsm2003741a12.7.2025.04.10.02.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:04:46 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
Subject: [PATCH] kernel-module-split: Allow for external conf files
Date: Thu, 10 Apr 2025 11:04:45 +0200
Message-ID: <20250410090446.937536-1-michalwsieron@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 09:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214633

Some recipes might provide conf files produced during build phase or
simply tracked in the VCS instead of generating them with Yocto.
In such cases those conf files wouldn't be assigned to correct packages.
With this change, if user wants to generate a conf file they still can,
but not generating them won't prevent assigning the file to proper
package given the file exists.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 .../kernel-module-split.bbclass               | 25 +++++++++++--------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 9487365eb7..6da3cb7fc7 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -99,9 +99,9 @@ python split_kernel_module_packages () {
             bb.warn("module_autoload_%s was replaced by KERNEL_MODULE_AUTOLOAD for cases where basename == module name, please drop it" % basename)
         if autoload and basename not in autoloadlist:
             bb.warn("module_autoload_%s is defined but '%s' isn't included in KERNEL_MODULE_AUTOLOAD, please add it there" % (basename, basename))
+        conf = '%s/%s.conf' % (d.getVar('modulesloaddir'), basename)
+        name = '%s%s' % (dvar, conf)
         if basename in autoloadlist:
-            conf = '%s/%s.conf' % (d.getVar('modulesloaddir'), basename)
-            name = '%s%s' % (dvar, conf)
             os.makedirs(os.path.dirname(name), exist_ok=True)
             with open(name, 'w') as f:
                 if autoload:
@@ -109,31 +109,34 @@ python split_kernel_module_packages () {
                         f.write('%s\n' % m)
                 else:
                     f.write('%s\n' % basename)
-            conf2append = ' %s' % conf
-            d.appendVar('FILES:%s' % pkg, conf2append)
-            d.appendVar('CONFFILES:%s' % pkg, conf2append)
             postinst = d.getVar('pkg_postinst:%s' % pkg)
             if not postinst:
                 bb.fatal("pkg_postinst:%s not defined" % pkg)
             postinst += d.getVar('autoload_postinst_fragment') % (autoload or basename)
             d.setVar('pkg_postinst:%s' % pkg, postinst)
 
+        if os.path.exists(name):
+            conf2append = ' %s' % conf
+            d.appendVar('FILES:%s' % pkg, conf2append)
+            d.appendVar('CONFFILES:%s' % pkg, conf2append)
+
         # Write out any modconf fragment
         modconflist = (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()
         modconf = d.getVar('module_conf_%s' % basename)
+        conf = '%s/%s.conf' % (d.getVar('modprobedir'), basename)
+        name = '%s%s' % (dvar, conf)
         if modconf and basename in modconflist:
-            conf = '%s/%s.conf' % (d.getVar('modprobedir'), basename)
-            name = '%s%s' % (dvar, conf)
             os.makedirs(os.path.dirname(name), exist_ok=True)
             with open(name, 'w') as f:
                 f.write("%s\n" % modconf)
-            conf2append = ' %s' % conf
-            d.appendVar('FILES:%s' % pkg, conf2append)
-            d.appendVar('CONFFILES:%s' % pkg, conf2append)
-
         elif modconf:
             bb.error("Please ensure module %s is listed in KERNEL_MODULE_PROBECONF since module_conf_%s is set" % (basename, basename))
 
+        if os.path.exists(name):
+            conf2append = ' %s' % conf
+            d.appendVar('FILES:%s' % pkg, conf2append)
+            d.appendVar('CONFFILES:%s' % pkg, conf2append)
+
         if "description" in vals:
             old_desc = d.getVar('DESCRIPTION:' + pkg) or ""
             d.setVar('DESCRIPTION:' + pkg, old_desc + "; " + vals["description"])
-- 
2.49.0


