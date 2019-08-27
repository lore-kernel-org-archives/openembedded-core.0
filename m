Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id 260577EB41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 19:34:18 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id z3so956092iog.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 12:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ITUBtMl9qfwrOGClguxTD/I+gBvvKjgk6R9wCIyMi10=;
	b=KYG6lTXJOL6qVjAaq35Hgk5iQZ28p7kYFgv6ltUIv28YG+tWnyY37CvRhBLpTaNrgU
	3bby+CJ+L4qjNo6PQRUi9HXRypIJlqhnM9aqiFrrY8jnt+esMPUhzueAE0lfiIt4tNiY
	yZneA+tl/05LV15HannFq7tDkicwJvHoF+94ArAN1AUHM2uBup4WoJJ6J0qQYlsHNrKL
	4u4SE5Z7ZdEz/0oRoTJSfR15Iwrmf3rw0gkMJ5qiwVJHq92aBk6sMXr7cUFFgnYJWhga
	r2at7DOy6wt0IBM5oaaluPlJiL2Jde0jcokrRGn1qliNRRBOrGRFSad/KLVhTCpTSjQp
	p7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ITUBtMl9qfwrOGClguxTD/I+gBvvKjgk6R9wCIyMi10=;
	b=dEt5gppIgGFBgLHNz8vca08AC47Os8xlcWzl3ejrnXLRzNzolXvtjh4MlkI+jF7yr1
	U80O7ZjHp2ZlNCjCZboguW3P51QDEg1nStzEBYHVFJbQfO0j5d6phrYUfIq64iNaMJkL
	8EFr/iywEV0z5NMzyQsghR2BwVe2FHfQFwYazUHMZhNY1c+D/KBjIhSKirfICxuv7P/V
	7teNNlW+I1l+GUeVE8Eeu48OluTQoh77ALo5bnxRyO49qB86izt/1nUijaldt4M6fp7K
	nkm/kgTB8J2GNzzLcrFmo/u3NpwJRy/e+ywadz6nk8mhw4LLKooc8XaHalvDITyyEuGx
	FCiA==
X-Gm-Message-State: APjAAAUtPfc2GsxBlQMv5crWC/8kBsmdZZSpZGLlqIBw2H0BltFdiJC6
	PqB8RKQRV0vshc7oVbLC5NraZOTM
X-Google-Smtp-Source: APXvYqwSisbGMJTTU+Acrqi3IITOf1j9bQMz4U4UfAgUech0Tq14AY4d1D6uXdnUqSpQvvMFgjQLKg==
X-Received: by 2002:a6b:f910:: with SMTP id j16mr5741838iog.135.1566934458960; 
	Tue, 27 Aug 2019 12:34:18 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id 8sm47288ion.26.2019.08.27.12.34.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 12:34:18 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 14:33:46 -0500
Message-Id: <20190827193349.23254-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190827193349.23254-1-JPEWhacker@gmail.com>
References: <20190827193349.23254-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] oeqa: reproducible: Use subTest for packages
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
X-List-Received-Date: Tue, 27 Aug 2019 19:34:18 -0000
Content-Transfer-Encoding: 8bit

Runs each package class reproducibility test in a separate sub-test.
This allows the other sub tests to still run in the event that one
fails.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 21 ++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 74d94fb20dd..2b8b4e9e88e 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -134,7 +134,7 @@ class ReproducibleTests(OESelftestTestCase):
 
         reproducible_tmp = os.path.join(self.topdir, 'reproducible', 'tmp')
         if os.path.exists(reproducible_tmp):
-            bb.utils.remove(reproducible_tmp)
+            bb.utils.remove(reproducible_tmp, recurse=True)
 
         # Perform another build. This build should *not* share sstate or pull
         # from any mirrors, but sharing a DL_DIR is fine
@@ -150,18 +150,19 @@ class ReproducibleTests(OESelftestTestCase):
         # kept after the build so it can be diffed for debugging.
 
         for c in self.package_classes:
-            package_class = 'package_' + c
+            with self.subTest(package_class=c):
+                package_class = 'package_' + c
 
-            deploy_reference = vars_reference['DEPLOY_DIR_' + c.upper()]
-            deploy_test = vars_test['DEPLOY_DIR_' + c.upper()]
+                deploy_reference = vars_reference['DEPLOY_DIR_' + c.upper()]
+                deploy_test = vars_test['DEPLOY_DIR_' + c.upper()]
 
-            result = self.compare_packages(deploy_reference, deploy_test, diffutils_sysroot)
+                result = self.compare_packages(deploy_reference, deploy_test, diffutils_sysroot)
 
-            self.logger.info('Reproducibility summary for %s: %s' % (c, result))
+                self.logger.info('Reproducibility summary for %s: %s' % (c, result))
 
-            self.append_to_log('\n'.join("%s: %s" % (r.status, r.test) for r in result.total))
+                self.append_to_log('\n'.join("%s: %s" % (r.status, r.test) for r in result.total))
 
-            if result.missing or result.different:
-                self.fail("The following %s packages are missing or different: %s" %
-                        (c, ' '.join(r.test for r in (result.missing + result.different))))
+                if result.missing or result.different:
+                    self.fail("The following %s packages are missing or different: %s" %
+                            (c, ' '.join(r.test for r in (result.missing + result.different))))
 
-- 
2.21.0


