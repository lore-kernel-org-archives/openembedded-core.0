Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 733456C21C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 14:29:26 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id r63-v6so2208940wma.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 06:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Sldramz4jo6QKkvufvErrcdwusKZEB5+/ZIjs4AJLJ0=;
	b=K7d4Ypdta1hzrmHl4TVIZIj3uJItXofpOwq5UAZY2HCFe71/pQuMWLjbdDClhbHeq/
	nMsflV4UBKCJLhtaswEJsbZnoOZbo9MxJmYwJ1+a2SGujb0EnjV01oQukVVK7OgCI7Nk
	VvjpkeW6yGE+BSWnWQLFVZ7q55bn/28RkMOw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Sldramz4jo6QKkvufvErrcdwusKZEB5+/ZIjs4AJLJ0=;
	b=kttIzoTmue+YbYegCVVtX/a9tlmYlHAsf23fpWLOaLbvpo7YR+s/vcez2sKdisyBgD
	mDnSkWsoo1T4208XOsOaNrsy4Eb1cKxyW5gPMgdomUsBqdbFSanMRtRpkxMf2cHm7Key
	fhKCixSqUw8y05wWqOg32fsFmD7Cjis99lF5oBM2XG+5/PI7Ieh1w74HvOtN8V2SU8P6
	n2ChKqnoa9KHXasYSyL/uohzp5Ne+LsrCk5tMyXksnk0MrVQ/dgxDQd/CdCvmxhmcOHb
	14XfkXUtg4rZWEM1joOPP2FuDn7uFVuSjWJIZ3R93XndrMotTZlG0ebbyPwU8Stg7IOr
	ETMA==
X-Gm-Message-State: AGRZ1gLVeKmIFpBiRgMglK++l/uAhxY3wCRd1zl8pN0x5yDCqV7TDYLQ
	uhdtcZ7mrMpqtWMnH/6lO+SoblckroU=
X-Google-Smtp-Source: AJdET5eTNFwvXtxG0bc2E20gUSte/O9ygD/tAZ3w4j0PBJBs7eJUs4PT7CbCHG1iWGMN/oR6UbM6Bw==
X-Received: by 2002:a1c:d78b:: with SMTP id
	o133-v6mr1971990wmg.38.1541773766839; 
	Fri, 09 Nov 2018 06:29:26 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h16-v6sm7713764wrb.73.2018.11.09.06.29.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 06:29:26 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2018 14:29:12 +0000
Message-Id: <20181109142912.23102-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 12/12] image-buildinfo, oeqa/selftest/containerimage: Ensure image-buildinfo doesn't break tests
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
X-List-Received-Date: Fri, 09 Nov 2018 14:29:27 -0000

Having image-buildinfo enabled causes containerimage.ContainerImageTests.test_expected_files
to fail due to the presence of an unexpected file:
  ['./',
   './etc/',
-  './etc/build',
   './etc/default/',
   './etc/default/postinst',

Tweak the class to allow it to be disabled and disable it from the test just in
case it was enabled.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image-buildinfo.bbclass           | 2 ++
 meta/lib/oeqa/selftest/cases/containerimage.py | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index 213fb9cf9b6..87a6a1a4893 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -64,6 +64,8 @@ def buildinfo_target(d):
 
 # Write build information to target filesystem
 python buildinfo () {
+    if not d.getVar('IMAGE_BUILDINFO_FILE'):
+        return
     with open(d.expand('${IMAGE_ROOTFS}${IMAGE_BUILDINFO_FILE}'), 'w') as build:
         build.writelines((
             '''-----------------------
diff --git a/meta/lib/oeqa/selftest/cases/containerimage.py b/meta/lib/oeqa/selftest/cases/containerimage.py
index 99a5cc9e575..8deaae75d8a 100644
--- a/meta/lib/oeqa/selftest/cases/containerimage.py
+++ b/meta/lib/oeqa/selftest/cases/containerimage.py
@@ -39,6 +39,7 @@ class ContainerImageTests(OESelftestTestCase):
 IMAGE_FSTYPES = "container"
 PACKAGE_CLASSES = "package_ipk"
 IMAGE_FEATURES = ""
+IMAGE_BUILDINFO_FILE = ""
 """)
 
         bbvars = get_bb_vars(['bindir', 'sysconfdir', 'localstatedir',
-- 
2.17.1


