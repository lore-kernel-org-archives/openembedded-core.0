Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3070574C97
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 13:45:46 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y3-v6so1899918wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 06:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JrCvEBjR6rHwV1aj+UYfpeN01/DD0FBjJtF4RSY8crc=;
	b=dEeHb8Jsi2xMEvBLCg0Dnp9kUFWebebur3YdR5qrcrpknEuMM9CxjoqBvcnzLw3ZYo
	DdQAI/P/mo813N4yXavH4mixb9dWMUmA+SCf/au2UFC95tCa6/5OrYVEGpcG05zKrHxP
	krsKvehlQs8x67L76wxdiTOFNCbpEuMPNrlIaXiTTrA9yp32C7aCD0M/xFrA6WsRDAja
	+1PCkTyC/jJDwV0sPVcJhbjfUNiKwhtBr96K004OFDPK5HlNnOpB5nOe5hBC6FF+xOOB
	a5T5rgKpG2wW7z6Ng8vmT6EhvDJjoRhfLfkdaB4ha+YJMZ/8RuASRWnV7Hxjp6A+mVaS
	vGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JrCvEBjR6rHwV1aj+UYfpeN01/DD0FBjJtF4RSY8crc=;
	b=XHY5CWnYLDae4Ool486fHOodMFP8C4fc46EalhjSgPZUmMxaJ/UEUP3sT597kyJrgD
	vaosO2Sn/iTgUhQtA/X0gtuDOXtBVhARIaMljJx+AIg5Th4IGDyBUidFYoBW09u6iKlF
	1xdLWVWw1vLi2M7YB3yaI+QlrhF+ptuNDwgBp8CDNMPBaJP7fRy6fMYVPrCzUnNAhhZY
	lG6WBjnEmCO54g9sxUgBF/xbxxcvqnEHbXVycAhLVY10T1tW2e2FSciC8NTQ+wKBHeku
	bLgtCHg2MVWngI0TCS7yvElx4EGVrRoSmoVWg18zk6XeVtg+O2e4GMpP7+YCnqqpHD88
	w/Tg==
X-Gm-Message-State: ABuFfoibj/4Dy0JvuEF91gN36CNY0p+1dJZPvtL7qvJnkZseJ6IA4g5G
	R8pbmp+ovuHwH2B18Nnde9ix1Prr9rM=
X-Google-Smtp-Source: ACcGV61WcLuJtsQC0bUSdo187f2nbD1GQte6zUAK5oqeKjW08GRC/qQgz8ZXbAYvWMVMQyn4O5EJbw==
X-Received: by 2002:a1c:1783:: with SMTP id
	125-v6mr1906181wmx.75.1538142346527; 
	Fri, 28 Sep 2018 06:45:46 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b138-v6sm2016405wmb.1.2018.09.28.06.45.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Sep 2018 06:45:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Sep 2018 14:45:41 +0100
Message-Id: <20180928134541.1370-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180928134541.1370-1-ross.burton@intel.com>
References: <20180928134541.1370-1-ross.burton@intel.com>
Subject: [PATCH 2/2] archiver: generalise task running when in configured mode
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
X-List-Received-Date: Fri, 28 Sep 2018 13:45:46 -0000

When in configured mode the archive will re-run configure itself, but that
doesn't work if there are other tasks that need to run such as cmake's
generate_toolchain_file.

Instead of hard-coding a list of classes and tasks, obtain the list of tasks
preceeding do_configure, filter out ones we don't want to re-run such as
do_patch and do_prepare_recipe_sysroot, and run those too.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/archiver.bbclass | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 7c3e701e704..a54cf948f3e 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -246,21 +246,27 @@ python do_ar_configured() {
         # do_configure, we archive the already configured ${S} to
         # instead of.
         elif pn != 'libtool-native':
+            def runTask(task):
+                bb.warn("running %s" % task)
+                prefuncs = d.getVarFlag(task, 'prefuncs') or ''
+                for func in prefuncs.split():
+                    if func != "sysroot_cleansstate":
+                        bb.build.exec_func(func, d)
+                bb.build.exec_func(task, d)
+                postfuncs = d.getVarFlag(task, 'postfuncs') or ''
+                for func in postfuncs.split():
+                    if func != 'do_qa_configure':
+                        bb.build.exec_func(func, d)
+
             # Change the WORKDIR to make do_configure run in another dir.
             d.setVar('WORKDIR', d.getVar('ARCHIVER_WORKDIR'))
-            if bb.data.inherits_class('kernel-yocto', d):
-                bb.build.exec_func('do_kernel_configme', d)
-            if bb.data.inherits_class('cmake', d):
-                bb.build.exec_func('do_generate_toolchain_file', d)
-            prefuncs = d.getVarFlag('do_configure', 'prefuncs')
-            for func in (prefuncs or '').split():
-                if func != "sysroot_cleansstate":
-                    bb.build.exec_func(func, d)
-            bb.build.exec_func('do_configure', d)
-            postfuncs = d.getVarFlag('do_configure', 'postfuncs')
-            for func in (postfuncs or '').split():
-                if func != "do_qa_configure":
-                    bb.build.exec_func(func, d)
+
+            preceeds = bb.build.preceedtask('do_configure', False, d)
+            for task in preceeds:
+                if task != 'do_patch' and task != 'do_prepare_recipe_sysroot':
+                    runTask(task)
+            runTask('do_configure')
+
         srcdir = d.getVar('S')
         builddir = d.getVar('B')
         if srcdir != builddir:
-- 
2.11.0


