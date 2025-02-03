Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB2EC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 12:24:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.86315.1738585490540945325
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 04:24:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mCkRDHaE;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436a39e4891so29331445e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 04:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738585488; x=1739190288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSmHFP1uIeBbfkwxAGwK1tkjYLstO991q/0QyrgZI8U=;
        b=mCkRDHaESRqDvZVsgEAKHwFXG70VPGpHrxuKF63ib1HAdOSRIVlfVAD44pnpGHGru9
         2gGVxjPG5URAkx4uOkMiDFKj1obdc6h+tyZiogCBQGxwpQQF7EgdqoWhErnltpt7k5js
         XR5GxdgVRDbyEg/3+c8j7r5JHZVYaS3f2LrX9SI+L83Cca2d6RFnNxKJBs8DNK8hoKhm
         7/gV0J7QWI0G1xqc2pajcJh2rre8LKzh1EFok8TaACtuesryJTRGR62/IVlcsX3OYRMm
         FyY1YoAL+0J65dCxy7cv9FsCRu7ggJ8mQRJYI/UdVb+OmrWDXo9/vhZSXDEXBJrEivbV
         s2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585488; x=1739190288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSmHFP1uIeBbfkwxAGwK1tkjYLstO991q/0QyrgZI8U=;
        b=kkkP4tSrT8QUyJC+TsIYh0+JIttdQ9TMRjXPAlsFSwg+vsFr6JkJGaU8ftmjukO94J
         4OhYEuTcOo/PVreCKYrkNCP5dZwjgcAC2WXi63VFoJSBQG3JvOk6JAmo5w4fWWJfwVjz
         aaNJtccYXbBeXcCMLMBVHlOst1/FlpIMkS/30ADlxyGcUh3aMSyKXTIHNruBT31QpR2t
         EGfm5+7kmN3OO5dJPEXosf7Ls71pTLIR5RWdCbFKP9+unsG/b0h7sdRP2EDKliiARD5k
         gbHM2JYw29ocZaPZdezSE75A914TPrFMQZbd8mJjGmxAoHiQYLDFNJSDmEgJ+bLz4e42
         xKyQ==
X-Gm-Message-State: AOJu0Yyab2VjjtVI40o/5JwhOsKNzAaU0oVq2h+d4n4Lqv+RMSYNcX21
	8kagupX1tOOcrfONJZ7f+pb1LCFT4H8cOH6XWGH6wx9riKlHx/7OUNs3Uw==
X-Gm-Gg: ASbGncs8ucNrQZZOWx6aTHY7Gk6I2Rk+l7uvPxC0c4ex3ReQ8zeuYfNVmEtlAExORwr
	tM7Fq2cnih7+YLQZRIFK1stxH3/SgyL8WC7E+A7KP7dczbmZfkHS+B08J/Dv749CZYRdEQc1P42
	fOATiU6y26cuPpKL9fwP//xnje3dr1lgGTOmACifr2f2gmBfRe3NZRC70c2ArIYt4f6Ct87RuBG
	nTmGAIL0tNs9LjLTJoAS0YJNleVpRCwR0spYClz8kHaBluQEf2+P3NQEA+6QXViuKorCU6qTf40
	0+L7AyWNw/Y0z8OsDZgW44LVy8GNh/63e2wl+MzxyvqToA==
X-Google-Smtp-Source: AGHT+IF2UBk0MHFmshZ04km91qtC94FckkpP3DQi8teZnBg5djuAe3wROAt8an5/rJWyDIMdKUpK1Q==
X-Received: by 2002:a5d:6da7:0:b0:382:49f9:74bb with SMTP id ffacd0b85a97d-38c520966dfmr20213472f8f.35.1738585488234;
        Mon, 03 Feb 2025 04:24:48 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec78esm12436878f8f.3.2025.02.03.04.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:24:47 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v5 2/2] oeqa/selftest/cases/signing.py: Re-enable self-test
Date: Mon,  3 Feb 2025 13:24:44 +0100
Message-ID: <20250203122444.1513238-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203122444.1513238-1-zboszor@gmail.com>
References: <D7H6P74CVGDM.3LTRAMF91XPEH@bootlin.com>
 <20250203122444.1513238-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 12:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210648

Enable building rpm with rpm-seqouia for the test.

Set SEQUOIA_CRYPTO_POLICY="" to use the default built-in
crypto policy.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/lib/oeqa/selftest/cases/signing.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 51d1c3fa64..9a820ebc72 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -71,7 +71,6 @@ class Signing(OESelftestTestCase):
         """
         import oe.packagedata
 
-        self.skipTest('This test requires rpm-sequoia support in rpm')
         self.setup_gpg()
 
         package_classes = get_bb_var('PACKAGE_CLASSES')
@@ -84,9 +83,14 @@ class Signing(OESelftestTestCase):
         feature += 'RPM_GPG_PASSPHRASE = "test123"\n'
         feature += 'RPM_GPG_NAME = "testuser"\n'
         feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
+        feature += 'PACKAGECONFIG:append:pn-rpm-native = " sequoia"\n'
+        feature += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'
 
         self.write_config(feature)
 
+        # Test rpm-sequoia's default built-in policy
+        os.environ['SEQUOIA_CRYPTO_POLICY'] = ''
+
         bitbake('-c clean %s' % test_recipe)
         bitbake('-f -c package_write_rpm %s' % test_recipe)
 
@@ -152,6 +156,9 @@ class Signing(OESelftestTestCase):
 
         self.write_config(feature)
 
+        # Test rpm-sequoia's default built-in policy
+        os.environ['SEQUOIA_CRYPTO_POLICY'] = ''
+
         with self.create_new_builddir(os.environ['BUILDDIR'], builddir):
 
             os.environ["PATH"] = nsysroot + ":" + os.environ["PATH"]
@@ -198,6 +205,9 @@ class LockedSignatures(OESelftestTestCase):
         feature += 'SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn"\n'
         self.write_config(feature)
 
+        # Test rpm-sequoia's default built-in policy
+        os.environ['SEQUOIA_CRYPTO_POLICY'] = ''
+
         # Build a locked recipe
         bitbake(test_recipe)
 
-- 
2.48.1


