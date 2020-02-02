Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id C26ED60B5A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Feb 2020 16:52:49 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id s10so13311514wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Feb 2020 08:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/afuJp5pPj7axHhaUSIER7YqkEipCKr/cd+O3n3038E=;
	b=hQXp0Zkei5NZNeSlPlRpLbxo8TTBZLoMadFd/tIvDOVzwiw8vyOCyz+ILmbNrOclot
	s2iuTQ/MB5SZ0goGaSzRibt2hlB1Ud7NwzWgj9KZ+ROT/JTOl0x60Ubf8kDFut1UrzHV
	PcEgyvgHQag+aUspHr2Bdu65hWMDmu/sxMT/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/afuJp5pPj7axHhaUSIER7YqkEipCKr/cd+O3n3038E=;
	b=JCRc3KE7yo65CGTxWmZWPOFdSOX2r3yMx7UJR9OpC/vdPTlm2mx5Eq22kK7oGvyA2C
	g1eJcOa3L9+L76B1x6xX8KN/RLGS4gttvJLI7be+Gto+xTsr3lxGKsXjhSUFGZVhRIA2
	Phu06lsroVJvxYFxgzk3EDIpDnRJstWlUeNepej6WUxU0qthoptEX7LfaZJviyF4M2kD
	feoumoObQxlRPPV4LFn5upep07PlrDCX1xGKiFlc86cFgNYkdgHGhEEMjADHxwCsdKvd
	ZuuNZ1als07JhhEQlMO+zOczhyZt/fioIuKiY/9Cumvb9L7gkmwbsEWm/4Y9UGwpSAQm
	R4eQ==
X-Gm-Message-State: APjAAAUEUzINm+kGIWCqmlKKne/T62u3o8nk0Ct0XOeoj7kHLgEOarJa
	tY5gXj5+9nJPB05Q4Tu6fzQtyTBobMQ=
X-Google-Smtp-Source: APXvYqwRpCEnrbhduCyibBtukJQCS0i9aixXC0lRuQtJS8TTMHZSgfQ3yBVjZdzIB8bkFtN7FFhIUw==
X-Received: by 2002:a05:600c:21c5:: with SMTP id
	x5mr25040932wmj.72.1580662369851; 
	Sun, 02 Feb 2020 08:52:49 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v8sm21657035wrw.2.2020.02.02.08.52.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 02 Feb 2020 08:52:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Feb 2020 16:52:48 +0000
Message-Id: <20200202165248.21554-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] reproducible: Allow configuration of saved debug output
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
X-List-Received-Date: Sun, 02 Feb 2020 16:52:50 -0000
Content-Transfer-Encoding: 8bit

If OEQA_DEBUGGING_SAVED_OUTPUT is set in the environment, use this location
to store reproducibile build failure output. This aids debugging on the
YP autobuilder in particular.

Use a date in the directory name to make it easier to find failure output.

Also clean up empty directories as they're unnecessary distracting noise.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 9c715ef8ebd..c2610766664 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -15,6 +15,7 @@ import tempfile
 import shutil
 import stat
 import os
+import datetime
 
 MISSING = 'MISSING'
 DIFFERENT = 'DIFFERENT'
@@ -80,6 +81,9 @@ class ReproducibleTests(OESelftestTestCase):
     package_classes = ['deb', 'ipk']
     images = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline']
     save_results = False
+    if 'OEQA_DEBUGGING_SAVED_OUTPUT' in os.environ:
+        save_results = os.environ['OEQA_DEBUGGING_SAVED_OUTPUT']
+
     # This variable controls if one of the test builds is allowed to pull from
     # an sstate cache/mirror. The other build is always done clean as a point of
     # comparison.
@@ -168,7 +172,9 @@ class ReproducibleTests(OESelftestTestCase):
         diffutils_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "diffutils-native")
 
         if self.save_results:
-            save_dir = tempfile.mkdtemp(prefix='oe-reproducible-')
+            os.makedirs(self.save_results, exist_ok=True)
+            datestr = datetime.datetime.now().strftime('%Y%m%d')
+            save_dir = tempfile.mkdtemp(prefix='oe-reproducible-%s-' % datestr, dir=self.save_results)
             os.chmod(save_dir, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROTH | stat.S_IXOTH)
             self.logger.info('Non-reproducible packages will be copied to %s', save_dir)
 
@@ -204,3 +210,8 @@ class ReproducibleTests(OESelftestTestCase):
                     self.fail("The following %s packages are missing or different: %s" %
                             (c, ' '.join(r.test for r in (result.missing + result.different))))
 
+        # Clean up empty directories
+        if self.save_results:
+            if not os.listdir(save_dir):
+                os.rmdir(save_dir)
+
-- 
2.20.1


