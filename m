Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8A1357719D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 16:24:11 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id c200so179801003wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 08:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=QNiS/zriyDiF1t3AhGs2brQMKuUAgpRddvslJgu9sHs=;
	b=iV0sFqyBQa2+i+zn+bccbLJBuDXKRq6mG7iNsyFU+GcaLlDXADkzSIdSgmfnh2YJOZ
	KpsHCLTIQWLznHxiI4N1JC+WwLkStT5xUMg+mBLeNT3uGdhCayG25dbaRzMIwQcb/KTL
	Ep17hJpzdcDVna7RjzyQXgRBieOJCxpyhpI9pDv05o0MqRv9aknHJJXa1zZOyPQXaEKI
	rBhiJZ+AEIWWUWYODYGU+suzvr+trues29HX7vJRX4mILMpyPZj/KEez0VkWV+FVwkNr
	o3CaalPGrDm0ioMa+ZTF7hB96oSB6Zq4BhJpDJipOyPpr5yV5zjHd+dvDGB0RVIIQvu1
	CM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QNiS/zriyDiF1t3AhGs2brQMKuUAgpRddvslJgu9sHs=;
	b=dOqQRq8WT1gopPcLZndesTj1qxScVt3fAcxES+dsLzDt2Hr09i2DtvVc1Pz2WsIDQn
	FoJfb6+rfpZSJ/oCRv2DNzSPgGkU3SMcuGcWr6sqdPYa1DwUw3om6cYaVbcbTqoQ2rt9
	MHdm0Gsktn2X21iSXGL/O0mG+9HfzrseQOJ6IFxSSy6WVWcqy6FLVWSphw30h160Ym12
	nmtLzH+KFEtyhn9X56indPimAJG+j6qEvZrRNQPyLEF54WctSBCTapbZNBqbGLvvoMda
	59NdleHTUQHSPDSQg8O3BSQH9qY+jkyCsI9jwBy5Q3IDAEtz5lxJvPPyDjO95sbagVMX
	/bRw==
X-Gm-Message-State: AG10YOREwtIlnhrns3MC3lTJkFVs4CZ4gax3dpG/um64zDqLF9oljULIysSCTTas5ALs+Axd
X-Received: by 10.28.14.140 with SMTP id 134mr12824986wmo.39.1456158251875;
	Mon, 22 Feb 2016 08:24:11 -0800 (PST)
Received: from flashheart.burtonini.com (94.197.121.248.threembb.co.uk.
	[94.197.121.248]) by smtp.gmail.com with ESMTPSA id
	ll9sm25347960wjc.29.2016.02.22.08.24.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 08:24:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 16:24:07 +0000
Message-Id: <1456158247-13942-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] oeqa/selftest/buildoptions: build -minimal instead of -sato images
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
X-List-Received-Date: Mon, 22 Feb 2016 16:24:11 -0000

When checking enabling buildhistory doesn't change anything but rootfs stamps,
just build core-image-minimal instead of -sato to reduce the time this test
takes.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 602d95f..e2d12c3 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -147,12 +147,12 @@ class BuildhistoryTests(BuildhistoryBase):
 
         features = 'TMPDIR = "%s"\n' % tmpdir1
         self.write_config(features)
-        bitbake('core-image-sato -S none -c rootfs')
+        bitbake('core-image-minimal -S none -c rootfs')
 
         features = 'TMPDIR = "%s"\n' % tmpdir2
         features += 'INHERIT += "buildhistory"\n'
         self.write_config(features)
-        bitbake('core-image-sato -S none -c rootfs')
+        bitbake('core-image-minimal -S none -c rootfs')
 
         def get_files(d):
             f = []
-- 
2.7.0


