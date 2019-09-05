Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 322F77F2D9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 14:41:42 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q10so1912360pfl.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 07:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=n3ghXFbGaL60ayE7NXbXQtwHtbrjjrQLqobejdjnKCI=;
	b=VH1ldKVq/8RMrrbKEZdKfB9h+bJZkBOv6ByRdBHMotLq3T6a8CfOyE8h5b00FURrow
	6Enz+qAkBNrhf7Q+/Lyb+OTx7OdinYIAZ4P7LXArr4Wwn4sPQaHSG1yv+NN/VyFCA5JW
	RKnSGj5iO2CBCPuMEUMnqJ/afOAxVT1Y4gYXeitIc/uCKSQJ3YJYv0ksVFeL5XGk8WHy
	OqiRRiFi6QP/u9W1QJSMsncqsUypo9aFDhvj2RGDDg9tWs6L1loSsF0TkYUnEP6JhjQa
	CZP8YhEyvNqNebop6AmshCbwEs2hWqFTFUgnIuzJtpVPqzz/MJKNhim2eKpvCYqREgG0
	vsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=n3ghXFbGaL60ayE7NXbXQtwHtbrjjrQLqobejdjnKCI=;
	b=WHEGcSUz3zNdDMSyyhD7VKTh1xI36aUy7tL4qGR3MBVaeP6tWJwGobXzOA7YP7KlPb
	aNibxzoVvD5O3sKaznfgF3OUpHFbrnnVCDNuiz0EF4rH/HA1BKrSqD7PeVTjALvEHfRZ
	SDRd9zyt8LudhIDhaoSYj8A6Oio5j3VqyCaxGPE/1y+oMUl9UjUxHuWCfOCDxoYAVD4R
	I5whaspqdgcxRYH1+qAyVyaYWbrV81y59ftVBynyN5YGfXSimLQPyXPkAEpTIH8ZKh05
	dDybxBt5xDKeZEcYke51tAr+U4ykenrviPwI66gJG3PazhCEtmYAQC03B04yNkUCPJ6W
	GqQQ==
X-Gm-Message-State: APjAAAW6d6YyEmwoUXdyOqj6a1UXXJBSf+eMUSqBZr8VOmAk1CDhtqj5
	8Rg8l43iuOwtyFdB9nq1Ffcey0YZqzZ7hg==
X-Google-Smtp-Source: APXvYqzdJ85LDKVJdtoBNFCi04Q1j6dwDzKwFLS3vMxC1VKOBBlooori17318s/NDsW0njydOFMC0A==
X-Received: by 2002:a63:5a4d:: with SMTP id k13mr3405025pgm.174.1567694502648; 
	Thu, 05 Sep 2019 07:41:42 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	d10sm3136848pfh.8.2019.09.05.07.41.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 07:41:40 -0700 (PDT)
Date: Thu, 05 Sep 2019 14:41:31 +0000
Message-Id: <20190905144131.31209-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] archiver.bbclass: Do not archive srpm's if there are no package tasks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Sep 2019 14:41:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Do not attempt to archive recipes which have no packaging tasks (e.g.
inherits nopackages).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/archiver.bbclass | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index af9f010dfc..13b05bb5f2 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -78,6 +78,9 @@ python () {
         bb.debug(1, 'archiver: %s is excluded, covered by gcc-source' % pn)
         return
 
+    def hasTask(task):
+        return bool(d.getVarFlag(task, "task", False)) and not bool(d.getVarFlag(task, "noexec", False))
+
     ar_src = d.getVarFlag('ARCHIVER_MODE', 'src')
     ar_dumpdata = d.getVarFlag('ARCHIVER_MODE', 'dumpdata')
     ar_recipe = d.getVarFlag('ARCHIVER_MODE', 'recipe')
@@ -98,9 +101,6 @@ python () {
 
         # There is a corner case with "gcc-source-${PV}" recipes, they don't have
         # the "do_configure" task, so we need to use "do_preconfigure"
-        def hasTask(task):
-            return bool(d.getVarFlag(task, "task", False)) and not bool(d.getVarFlag(task, "noexec", False))
-
         if hasTask("do_preconfigure"):
             d.appendVarFlag('do_ar_configured', 'depends', ' %s:do_preconfigure' % pn)
         elif hasTask("do_configure"):
@@ -118,7 +118,11 @@ python () {
 
     # Output the SRPM package
     if d.getVarFlag('ARCHIVER_MODE', 'srpm') == "1" and d.getVar('PACKAGES'):
-        if "package_rpm" in d.getVar('PACKAGE_CLASSES'):
+        if "package_rpm" not in d.getVar('PACKAGE_CLASSES'):
+            bb.fatal("ARCHIVER_MODE[srpm] needs package_rpm in PACKAGE_CLASSES")
+
+        # Some recipes do not have any packaging tasks
+        if hasTask("do_package_write_rpm"):
             d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_package_write_rpm' % pn)
             d.appendVarFlag('do_package_write_rpm', 'dirs', ' ${ARCHIVER_RPMTOPDIR}')
             d.appendVarFlag('do_package_write_rpm', 'sstate-inputdirs', ' ${ARCHIVER_RPMTOPDIR}')
@@ -133,8 +137,6 @@ python () {
                 d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_ar_patched' % pn)
             elif ar_src == "configured":
                 d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_ar_configured' % pn)
-        else:
-            bb.fatal("ARCHIVER_MODE[srpm] needs package_rpm in PACKAGE_CLASSES")
 }
 
 # Take all the sources for a recipe and puts them in WORKDIR/archiver-work/.
---
2.23.0.rc1

