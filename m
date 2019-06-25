Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4007BFB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 14:52:09 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p13so18216353wru.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eBolMsylZiz4kRXaQHcjtn7qE7LSjymyatHPNEjOD7U=;
	b=0uRry7MBkZmTjfXAf2E5sj6EHw5jBuXzGZLUirDXMmvRUzyajAkomuqqy60HWRwV1X
	ULTekwPq6oiL/Ija3vI62uzchqeS/ktJ6H2Tzm+3SCFvhMnNMwP1gcxvFwgrYTDyDHT/
	RYN0D0wTXGFKmMsj/0p7UsfiEl2x+TbqlX9w63khG+WaP2ibWYajZ1XaWGGprcLDO2o8
	io2v3QA5rU1joD6ku3OdQDFd2vlPg7LJJiSV4ovhP3Ejwr6vimIY+4xZPrrCQz9wGjb9
	Kvf9GNpQL6srt/LmjcGoQtbYjMQ2vBzKxupnKhpROhbN3iWmKQFFRMbXnqsaS7YR2GRu
	ayrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eBolMsylZiz4kRXaQHcjtn7qE7LSjymyatHPNEjOD7U=;
	b=hEBOrJXQ1fDtuzbt17cJLOmkuHXdgjLkKfVnGiIziJrSHOpvKQ7eduWAzWqH9DJESd
	CTvIHiC9GJPdEDJEXY1oQ0niDkZZxZy0FL1DQB7hzcqg477Y4PtN3tJxbpEPYMBXvcH7
	5fdl/REdGnefjxrWNSNhzXiuDHU8YoTprzcavXG/AVssqxrLF+3KUD9M0wVRYeEDiLCW
	eXNMB7MTRFEIc31KTkap3tAJBchGCKFPZY+SCvZ9+DXq3u9heEi+HWOtVDbg8g8eW3vR
	o2aUnNmj+m8Os03yxA7l4cW/Dc2UxN10+5Z4Qwy6/Lc6kB5hWR0x+R82hzNZA2ihNXK3
	rXqQ==
X-Gm-Message-State: APjAAAXKurwRhnGqUgdVNz6igr6i2i1xX4V/Vi1J03bwRCPwvKiYNU/H
	ObmVVyJJbLxgOCCPNjemqN6qjvNHor0=
X-Google-Smtp-Source: APXvYqzT0XBMYUQtTgM0qMq4/4xP9RvNJ529hj36ZullaSybyAX3Poo5TAw6o3fS8RuoXogsOKd6yA==
X-Received: by 2002:adf:ec12:: with SMTP id x18mr82143659wrn.145.1561474329844;
	Tue, 25 Jun 2019 07:52:09 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	p140sm2263877wme.31.2019.06.25.07.52.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jun 2019 07:52:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2019 15:52:03 +0100
Message-Id: <20190625145203.24342-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190625145203.24342-1-ross.burton@intel.com>
References: <20190625145203.24342-1-ross.burton@intel.com>
Subject: [PATCH v2 2/2] oeqa/buildoptions: check that Fortran code actually cross-compiles
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
X-List-Received-Date: Tue, 25 Jun 2019 14:52:09 -0000

Don't just test that we can build the cross-compiler, but test that it actually
can cross-compile some Fortran.

The quadmath dependency is now handled in gcc-runtime and isn't needed in this
test (as per local.conf.sample.extended changes).

There's also no need to build libgfortran explicitly, as fortran-helloworld depends on it.

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


