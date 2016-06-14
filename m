Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id A78A26010D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 07:59:49 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id m124so110406375wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 00:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Hm4foD5MyiHT0rgoF2Hcw2nnW/4cXaGwqnE3xqf48aE=;
	b=sI+QR9NC+rGl0M6OOfhv6dYcJw3Y2+7sRuwZVmnPdcJj5kOyIw2SrNs1ha20Rh32r3
	sFnLFDM8O41R85nV87Wf77MBw6I6xqPVxl3td+Cs11+vsQI/Ib6K4sznvgD/D1sgfN09
	Arw7rzfgvFV7euV6ltplV4BelIay/wGx5XHH3z89M0NI6tXFF7R7HeihJXDqFH5v38Ci
	6yw7p6gD7SFHimx6rY8jg4xlo17PWuODIdnD/BobyEUoDkw5EQG58nt/A24sP7KbqIr5
	N4FHrIOZ0iqgMTpVV4Jau9atrWB7WGRFe3vHO202BOBqnMxiNktQuG8opH9gY0KpQadT
	WGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Hm4foD5MyiHT0rgoF2Hcw2nnW/4cXaGwqnE3xqf48aE=;
	b=AC2eLII7Ik/j7D2a1/iDOl0SMqdd1196Go/T2xhj6SBJsZ6GCEyPlplo54JHXfJ57o
	8Gvo5pnbEFZ5Jb7B9hYQJrWIyeWZXz2IQ4oWUzdwwGcM/52M0UkaoSZsJ6ITPlQAun67
	M8EV4Sk2KvWfJp4SSqYSojIxHMftO/ouzAlUNIR/43p8GL2IBcq92tVE+MsqkvMMFAZN
	QQniwBpf3YIZZ996asljlqVMnC/IV8Cl68Wb5gYQ8pF/Pao1dJTgojePfScse5ALcWhV
	pnpt+RDaCLHRcYMWcDDbaFMGDP31drrPORZKzR4XI2XhNQVLNs6l0VfQbRpzM/uqm0XA
	lsyA==
X-Gm-Message-State: ALyK8tIH9qMlqYfkdUOILkWqH2tyXMJfsQ1+gOi0CMnYmItLVread8P15tqOmQb4wWbAVqJu
X-Received: by 10.28.72.132 with SMTP id v126mr3198791wma.8.1465891189725;
	Tue, 14 Jun 2016 00:59:49 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e133sm2730425wma.6.2016.06.14.00.59.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jun 2016 00:59:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 08:59:37 +0100
Message-Id: <1465891179-20779-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1465891179-20779-1-git-send-email-ross.burton@intel.com>
References: <1465891179-20779-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/4] package_ipk: restore cwd after packaging
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
X-List-Received-Date: Tue, 14 Jun 2016 07:59:49 -0000

opkg-build needs to be executed in the root of the package, so save and restore
the current directory so this task doesn't modify the state.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/package_ipk.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 08f7020..1b5f4f5 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -21,6 +21,8 @@ python do_package_ipk () {
     import textwrap
     import subprocess
 
+    oldcwd = os.getcwd()
+
     workdir = d.getVar('WORKDIR', True)
     outdir = d.getVar('PKGWRITEDIRIPK', True)
     tmpdir = d.getVar('TMPDIR', True)
@@ -254,6 +256,7 @@ python do_package_ipk () {
         cleanupcontrol(root)
         bb.utils.unlockfile(lf)
 
+    os.chdir(oldcwd)
 }
 # Otherwise allarch packages may change depending on override configuration
 do_package_ipk[vardepsexclude] = "OVERRIDES"
-- 
2.8.0.rc3


