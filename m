Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id D0E867D391
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 11:13:27 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s15so12928241wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 04:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fbSt+j9LZdL/V8zQ2HFDJFxymT3IM9p4g2InVSjfZqw=;
	b=ah9MhhApDKNuXcGAZEi4V7KD/Y/O3wsAJ/dpsjTp19hSx2gIunvoRGUDxp+B9qwmYJ
	oVxZxtSoZfBYvD7l6LDMa2fm1+zioEV3rQhH3aa44SSTMYSCNujUkipTOTkanP0ra3o0
	yDRnIU4nb0uUu3WPSshR+0DZ6b3LLyOtkCSK+FthjFxiVl6pgBQPyHqqZuzyfZ1429uM
	dYvNoxoYedXXeY3J/iehNIxSAKHJ6Lel+lAx6DD/VXgCkzCEvdMhTiPyCt6o8HqOozbq
	Jhf9llBdglraNmB87sMyVDYv6BKf5nRykS48HKga6b1IlcyWitAwTQrpAAc2Zs8uFqlO
	oblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fbSt+j9LZdL/V8zQ2HFDJFxymT3IM9p4g2InVSjfZqw=;
	b=K2XefcsGzpHzQ6AUIKGXOogFYtUgXwrRc7uRgqX4cWIpSEyC3kB95mRUBCACnhY4OJ
	2WBjqlY5vQRoV3QR4d9idianuZOa8I2TKZYbJF1bh6aDXCBBAgakxEkcnsNNcElgAW2U
	Dd5DWDAXU2S2L5unpTQ9e896EpTyQlIsXM+pKZzMFhbX0W2WLY8CqA9XAgZPttDWFEV6
	tUz/zr1VCa1BXOIsZ1or2h8/yIrVU2+s6FreVkXiii0oIttEjSBOe4WLTXoK1qsv6hmP
	xNgZOhXIs3jCkPwY0Hc2L06NLBRCdWTjHzG3jHfyipTeEL7g4vxdljtQ6cIneTsBZhQ7
	rUAw==
X-Gm-Message-State: APjAAAU1BWgzXWhQ2hAEJsUpKnmJqpI4Kp2VEjqV/z26I8FPfky6yh7V
	QM7117xVlbdKo/rg/A0BuL+HJlGN1c0=
X-Google-Smtp-Source: APXvYqyt9KMf+G+A76DuVVN9ljZg5s0H+MC4KdrUb12GozWl+9ZNGDdgDVCpIYEqX5sTv3S/Ypdomw==
X-Received: by 2002:a7b:c7d7:: with SMTP id z23mr16138648wmk.46.1561374808223; 
	Mon, 24 Jun 2019 04:13:28 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id r2sm9748806wme.30.2019.06.24.04.13.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jun 2019 04:13:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2019 12:13:24 +0100
Message-Id: <20190624111324.8921-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190624111324.8921-1-ross.burton@intel.com>
References: <20190624111324.8921-1-ross.burton@intel.com>
Subject: [PATCH 2/2] oeqa/buildoptions: check that Fortran code actually cross-compiles
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
X-List-Received-Date: Mon, 24 Jun 2019 11:13:28 -0000

Don't just test that we can build the cross-compiler, but test that it actually
can cross-compile some Fortran.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/cases/buildoptions.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 3ad65b40341..6a5378d3ff6 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -162,17 +162,14 @@ class ArchiverTest(OESelftestTestCase):
         self.assertTrue((g.glob(src_file_glob) and g.glob(tar_file_glob)), "Couldn't find .src.rpm and .tar.gz files under %s/allarch*/xcursor*" % deploy_dir_src)
 
 class ToolchainOptions(OESelftestTestCase):
-
     def test_toolchain_fortran(self):
         """
-        Test whether we can enable and build fortran and its supporting libraries
+        Test that Fortran works by building a Hello, World binary.
         """
 
         features = 'FORTRAN_forcevariable = ",fortran"\n'
-        features += 'RUNTIMETARGET_append_pn-gcc-runtime = " libquadmath"\n'
         self.write_config(features)
-
-        bitbake('gcc-runtime libgfortran')
+        bitbake('fortran-helloworld')
 
 class SourceMirroring(OESelftestTestCase):
     # Can we download everything from the Yocto Sources Mirror over http only
-- 
2.11.0


