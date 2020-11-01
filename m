Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.14345.1604235185670673350
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2020 04:53:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PBfsuuXq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id s9so11411394wro.8
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2020 04:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=frlPpoIViN/BU6AHyK5Vj/cl5bQzOJantvyFbL39HfE=;
        b=PBfsuuXqLDFQqBA4YrwlZqcJMQnyQYtuoE8KfJpLMJqUjrkvKeUVBQcINrYVfckHyU
         eTVQysRYJF97EWl+Qp+bmXqDdEkRhGlPUbhnzm6vlu675au2HHDYBH4lO57Ozl38poVI
         QL6uyysrvNdrAe/UDo29dH+1anw1BxlikkGZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=frlPpoIViN/BU6AHyK5Vj/cl5bQzOJantvyFbL39HfE=;
        b=O8IALdB3YSyN0x4dfB+5qwA0lM75r4pY8zpv/71xFVsHPkCy4mdTqTOyxcN8Q6X6wS
         PEKbNnCrJB+56lLxleJDJC3i9TDWXOH1W96YJTsRVrzwXotjbMBIg85j6fGyfHFA/pR/
         HzZKFEprlcENm9ckxVWsg0P51knsVaWk+ph3gcOCSY9qKMEkMwark3hSu05RhCYmERFQ
         r1yAHOXYOwN1LFIrr2mayYIAim6SU6BT43/NQzxF5d68exbB0EzwrfVJVt6meaRZ5bn6
         IQp2b19rAyY2HFofzuIMFrqR8UnLfJfKrePQ72eZkpVe5r38KTK79NgUA1s+S5NSx9KG
         AIlA==
X-Gm-Message-State: AOAM531oHduTftPCVb1PHq5CkkL1nNVlU+vDb9Pzm2ubXK38K+om+LU4
	OSvKQypBGGi/cdqDuadO4Vq50Te4ID937w==
X-Google-Smtp-Source: ABdhPJzhcjFtHU+w1lsX8Uuv8E/ylhatp3DKk3GklEjP/SArW+cKCdA9UXBnhw3u5WapxGu/RZpElg==
X-Received: by 2002:adf:e681:: with SMTP id r1mr13996687wrm.181.1604235184214;
        Sun, 01 Nov 2020 04:53:04 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id v123sm11806735wme.7.2020.11.01.04.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 04:53:03 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Viswanath Kraleti <vkraleti@codeaurora.org>
Subject: [PATCH 1/2] sstate: Promote do_install to an sstate test
Date: Sun,  1 Nov 2020 12:53:01 +0000
Message-Id: <20201101125302.350160-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201101125302.350160-1-richard.purdie@linuxfoundation.org>
References: <20201101125302.350160-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow sstate to be generated for do_install tasks.

FIXME: Needs sstatesig rule mappings to be added for do_install as builds
from sstate currently install *everything* and shouldn't. do_install
rules are missing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass    | 10 ++++++++++
 meta/classes/staging.bbclass |  2 +-
 meta/lib/oe/sstatesig.py     |  2 +-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 5a0b0c6b3e2..cb854ed6601 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -339,6 +339,14 @@ base_do_install() {
 	:
 }
 
+SSTATETASKS += "do_install"
+do_install[sstate-plaindirs] = "${D}"
+
+python do_install_setscene () {
+    sstate_setscene(d)
+}
+addtask do_install_setscene
+
 base_do_package() {
 	:
 }
@@ -511,6 +519,8 @@ python () {
         d.appendVarFlag('do_install', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_install', 'fakeroot', '1')
         d.setVarFlag('do_install', 'umask', '022')
+        d.setVarFlag('do_install_setscene', 'fakeroot', '1')
+        d.appendVarFlag('do_install_setscene', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
         d.appendVarFlag('do_package', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
         d.setVarFlag('do_package', 'fakeroot', '1')
         d.setVarFlag('do_package', 'umask', '022')
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index f0a619b35bd..11eadf18062 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -326,7 +326,7 @@ python extend_recipe_sysroot() {
     # Create collapsed do_populate_sysroot -> do_populate_sysroot tree
     for dep in taskdepdata:
         data = setscenedeps[dep]
-        if data[1] not in sstatetasks:
+        if data[1] not in sstatetasks or data[1] == "do_install":
             for dep2 in setscenedeps:
                 data2 = setscenedeps[dep2]
                 if dep in data2[3]:
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 4ea29cbdfc3..15391255b83 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -480,7 +480,7 @@ def OEOuthashBasic(path, sigfile, task, d):
     if "package_write_" in task or task == "package_qa":
         include_owners = False
     include_timestamps = False
-    if task == "package":
+    if task == "package" or task == "install":
         include_timestamps = d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1'
     extra_content = d.getVar('HASHEQUIV_HASH_VERSION')
 
-- 
2.25.1

