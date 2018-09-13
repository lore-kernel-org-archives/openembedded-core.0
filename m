Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 28C56798EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 13:15:45 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id 20-v6so5538854wrb.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 06:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=lA7IYZ3vDZRziUXP6svuO71tS3dir1HRHHupuiBmPY8=;
	b=BZpqOYShuVKV65dSks1YMocmUW8ISIySs5sw2cU4vXxwUv8U6qlnqDKVB7A6utSK/R
	vGQbXPZKOe4mrWlUNdpJ3OSKIZhOkD9nGAQkMiRniHDhbApsco3R27dtMXSKgB2bPacJ
	vwM+5TM+FkYrQV8gy2DYPEe4KtFT7WIIZjrMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lA7IYZ3vDZRziUXP6svuO71tS3dir1HRHHupuiBmPY8=;
	b=Yj6X+4Ygu3qh7VmQH2fGLSMh8oPHk71srM/zKIpgKC1FEWiPHXC2i+OCPgO/IQQJ58
	z0MwLEXLCVS0bcpn5atFwgsTy/wTZZ/nqnIYn8Jt+ZL7hRgP6DUwHLDVxaiyKwnTcEpE
	ojHxiXPmfliE979F+kAykZ0ktxVb26gTD87LfssKCyUORjw9PO4RvS4eqc7+Qkou1mR2
	iv/td4f2rKJQYrSqRQFAaSTBn7f3TjNYzn4MN+NpQ8loZEgTgZJBo/c2QvHAz++1aj/P
	uz//IJ7sx/txOrropoE7b+jyo/bqyuRWkMjVqFFUDeyxImBdfmuOo5gxOb7oBRQlJvIu
	iJ6w==
X-Gm-Message-State: APzg51DhWE+oxUGiQdRE5CxaFH3OT0xsLIFr0TigNuYhHXCgVFquERa5
	QAy0Rc5YIxTGThpM7cYLgEenmDB2X7I=
X-Google-Smtp-Source: ANB0VdYR1IL584udWnC13pPWNfErlmKYv7yrwJXtdl/3+N0jA/juZSUDvVqrOB/gHTPxG4J3xkCuzg==
X-Received: by 2002:a05:6000:1291:: with SMTP id
	f17mr5580501wrx.215.1536844546417; 
	Thu, 13 Sep 2018 06:15:46 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t9-v6sm5061wmf.1.2018.09.13.06.15.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Sep 2018 06:15:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2018 14:15:44 +0100
Message-Id: <20180913131544.20812-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] oeqa/selftest/runtime_test: Ensure we build/use gnupg-native
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
X-List-Received-Date: Thu, 13 Sep 2018 13:15:46 -0000

Without this, we see errors if gpg is missing from the host system
for "oe-selftest -r runtime_test.TestImage.test_testimage_dnf".

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index abd0723146f..906e460d4f8 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -149,10 +149,12 @@ class TestImage(OESelftestTestCase):
         features += 'EXTRA_IMAGE_FEATURES += "package-management"\n'
         features += 'PACKAGE_CLASSES = "package_rpm"\n'
 
+        bitbake('gnupg-native -c addto_recipe_sysroot')
+
         # Enable package feed signing
         self.gpg_home = tempfile.mkdtemp(prefix="oeqa-feed-sign-")
         signing_key_dir = os.path.join(self.testlayer_path, 'files', 'signing')
-        runCmd('gpg --batch --homedir %s --import %s' % (self.gpg_home, os.path.join(signing_key_dir, 'key.secret')))
+        runCmd('gpg --batch --homedir %s --import %s' % (self.gpg_home, os.path.join(signing_key_dir, 'key.secret')), native_sysroot=get_bb_var("RECIPE_SYSROOT_NATIVE", "gnupg-native"))
         features += 'INHERIT += "sign_package_feed"\n'
         features += 'PACKAGE_FEED_GPG_NAME = "testuser"\n'
         features += 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "%s"\n' % os.path.join(signing_key_dir, 'key.passphrase')
-- 
2.17.1


