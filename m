Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 832FE6B07F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 12:20:14 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id c14so15948865wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2019 04:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ocBemKmEMkZhU6Cq042ESzkRVAM9JItad2X1c25Ob9U=;
	b=Xvah80HlYhzd244mREHEc1HjLn/Nd6XWj0JX2YuwJGYfFG5PYWCxXTbXLgW3xueuP3
	rXipQjgwB83cCUyrs1ZiwwEZJFjX3uJGL57M0tqJHSdS05k5wytj8vbW+rxtWQ/cLqFS
	E44mRX61nfEeV0Oom2R9c55sSz/SXoSpiQp827W0Zmk/pOFQ+nv8btdbRF/KbZEHHjD+
	cTTzwnE8/qWDd+6rswDzE1qwSU0HCNkFsUZ9KrLot0RHctHmeQIgtB2pUcxqWwXxuTJF
	LN3QMOvrULS7t38Nl0pPUarFj4EBIk+HV1m/wq5Gdo9owYXSNHIRwhylXlylqKoUVTK3
	k0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ocBemKmEMkZhU6Cq042ESzkRVAM9JItad2X1c25Ob9U=;
	b=ZfQxOtI5NtBiE4+FBsDoGlLU2jWFRiJVTSyEGy5SQOcbUFGRDZQj6myIyM618/YPK0
	vth1wfBgWYo7r1UqB3uqfU0Pe914FI7W0T+PR8akJrRz5TtYnYhx8XS6JkN63xiz29N6
	v22Y474X00oT4d5iR9/GlKEnWRYRrskVj/0NUsGG3+k5k6wpIJoCvLmqSUO2fSjpEJAo
	a6npQfBUp6RUm1JYwYZZoKYon7rExK7+v1pW/dzvSDFPBQb0LYxjwVFnqzlIOgoM6CNH
	BWF3zo5jTLK7BMgeQOLII+esi9Eym2QdV1oQqC/gge/pTk6uu4nXA5DazKLxHm4nz8xg
	VCxA==
X-Gm-Message-State: APjAAAV+1UyWfTum34XXqiNfHIlt5op+tvu0JV2DHy7LJg03M6IQXWL9
	8FmP8dKoBg9LicMrgt8Xn8Wzs2hPfZM=
X-Google-Smtp-Source: APXvYqwY3wQ5kLsbKJ5gcY3KzV404yOBl+bIa9IwlUNGDcqBoXTibFhqJJ6ZD3TdaefOPzGYchRNbA==
X-Received: by 2002:adf:9427:: with SMTP id 36mr1904613wrq.166.1575894014891; 
	Mon, 09 Dec 2019 04:20:14 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id a3sm14611177wmh.5.2019.12.09.04.20.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 04:20:13 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2019 12:20:04 +0000
Message-Id: <20191209122007.13306-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/4] selftest-hardlink: don't RDEPEND on gdb explicitly
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
X-List-Received-Date: Mon, 09 Dec 2019 12:20:14 -0000
Content-Transfer-Encoding: 8bit

For easy of reuse and speed of building, don't RDEPEND on gdb
explicitly.  Instead put gdb.sh into ${PN} and explicitly install gdb
into the image if needed.

This means other tests that don't need to use gdb can reuse
this recipe without waiting for a target gdb to build.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-test/selftest-hardlink/selftest-hardlink.bb       | 4 ----
 meta/lib/oeqa/selftest/cases/package.py                       | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
index 842a9772cbe..8b336a04c9f 100644
--- a/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
+++ b/meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink.bb
@@ -24,7 +24,3 @@ do_install () {
 
 	dd if=/dev/zero of=${D}${bindir}/sparsetest bs=1 count=0 seek=1M
 }
-
-RDEPENDS_${PN}-gdb += "gdb"
-PACKAGES =+ "${PN}-gdb"
-FILES_${PN}-gdb = "${bindir}/gdb.sh"
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index b87f8dc3e2c..c6444062674 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -118,7 +118,7 @@ class PackageTests(OESelftestTestCase):
     def test_gdb_hardlink_debug(self):
         features = 'IMAGE_INSTALL_append = " selftest-hardlink"\n'
         features += 'IMAGE_INSTALL_append = " selftest-hardlink-dbg"\n'
-        features += 'IMAGE_INSTALL_append = " selftest-hardlink-gdb"\n'
+        features += 'IMAGE_INSTALL_append = " gdb"\n'
         self.write_config(features)
         bitbake("core-image-minimal")
 
-- 
2.20.1


