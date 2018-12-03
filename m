Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id ACFB56C543
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 20:35:20 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y139so7278124wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 12:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7uDvxSV36YkH4+WLU5sGeUx2rJAqW9e+YGSZ/dxmZJ4=;
	b=z1VJRRVcXp0wTKN4r7cEE4YkhHd9PxH8HBcP7YoD6Yun1XzXw6EtD10w93esnupKjK
	6qoRiw07Qh3MkhV3qFIftzmwQ0iFs6yak1kVEAsUi6nmO8lHoPwn4Jk5Gk/LlGWgT53F
	AfZSQQd6RAz+t3FYi9VKtonR9RbjGrfdEHJ6NBjpfAmQ/vgQjxR+S2y10Jcid3emenMr
	wI+PZR1juOBIGapixPUY/YQ3ikxsZaA8CXbk3vtBO1O+EZwbegqbWBoIRMATtKW566Bj
	cQh+DEh8/xeR2XHw9tPihLTfVhFa/uqauiWNFFdZ3/0gAc02qX8eTSrOzAwKy7BDatPG
	tY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7uDvxSV36YkH4+WLU5sGeUx2rJAqW9e+YGSZ/dxmZJ4=;
	b=VE09KQ+ukm9d9bCumj6kGvxjeNlRxr0XZT6nZR9TIfwRY9nTQtu5uKrFnTwvEQHfv1
	pakckD8S1RCrGXKbkUboAijKKZ4p3oma3uVBDDdpMpiqly4UUDlAw+x52qY+M+DrnSfr
	4EYnXh9VF/tYdPvV9i8h4SJiiJSNR0MoGSobGuLLzhEiBKo/nrYER6yEAYXh/EG2T8/3
	OSoYltFd1qCjpAESIUEG38RUP+1qcm97CKh879aXJF+1UzeGme5oBxPJi5wpmFNDX5YC
	0QUK+StcOFM5FkWjmzFzkgryty1p931gwBF0f3CUH5FMVF4adFtSSezwGA3rMjfLPVQb
	IOFQ==
X-Gm-Message-State: AA+aEWYkwame9WHjoMezu1X0yVFZ+uVGK/UUp7vsFzfOVTgpFuC1Cwd5
	OsqBFKnIJ7+U29XUHEak3YpWQvRJoXE=
X-Google-Smtp-Source: AFSGD/UbgL0iXMmi/4389ibj7sTSIpMAUEgekxId6onr3vcEJE+p3DUEtYOEyE7ScdaV83YxbjEqZA==
X-Received: by 2002:a1c:1348:: with SMTP id 69mr10253049wmt.71.1543869321136; 
	Mon, 03 Dec 2018 12:35:21 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q2sm15361570wru.56.2018.12.03.12.35.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Dec 2018 12:35:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Dec 2018 20:35:15 +0000
Message-Id: <20181203203516.26461-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181203203516.26461-1-ross.burton@intel.com>
References: <20181203203516.26461-1-ross.burton@intel.com>
Subject: [PATCH 2/3] oeqa/selftest/esdk: run selftest inside workdir not /tmp
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
X-List-Received-Date: Mon, 03 Dec 2018 20:35:20 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/cases/eSDK.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/eSDK.py b/meta/lib/oeqa/selftest/cases/eSDK.py
index d03188f2f75..14f75d8c09a 100644
--- a/meta/lib/oeqa/selftest/cases/eSDK.py
+++ b/meta/lib/oeqa/selftest/cases/eSDK.py
@@ -70,11 +70,12 @@ CORE_IMAGE_EXTRA_INSTALL = "perl"
     @classmethod
     def setUpClass(cls):
         super(oeSDKExtSelfTest, cls).setUpClass()
-        cls.tmpdir_eSDKQA = tempfile.mkdtemp(prefix='eSDKQA')
+        cls.image = 'core-image-minimal'
 
-        sstate_dir = get_bb_var('SSTATE_DIR')
+        bb_vars = get_bb_vars(['SSTATE_DIR', 'WORKDIR'], cls.image)
+        cls.tmpdirobj = tempfile.TemporaryDirectory(prefix="selftest-esdk-", dir=bb_vars["WORKDIR"])
+        cls.tmpdir_eSDKQA = cls.tempdirobj.name
 
-        cls.image = 'core-image-minimal'
         oeSDKExtSelfTest.generate_eSDK(cls.image)
 
         # Install eSDK
@@ -87,14 +88,14 @@ CORE_IMAGE_EXTRA_INSTALL = "perl"
         sstate_config="""
 SDK_LOCAL_CONF_WHITELIST = "SSTATE_MIRRORS"
 SSTATE_MIRRORS =  "file://.* file://%s/PATH"
-            """ % sstate_dir
+            """ % bb_vars["SSTATE_DIR"]
         with open(os.path.join(cls.tmpdir_eSDKQA, 'conf', 'local.conf'), 'a+') as f:
             f.write(sstate_config)
 
     @classmethod
     def tearDownClass(cls):
-        shutil.rmtree(cls.tmpdir_eSDKQA, ignore_errors=True)
-        super(oeSDKExtSelfTest, cls).tearDownClass()
+        cls.tmpdirobj.cleanup()
+        super().tearDownClass()
 
     @OETestID(1602)
     def test_install_libraries_headers(self):
-- 
2.11.0


