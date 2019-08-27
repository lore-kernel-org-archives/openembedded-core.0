Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2BEEE7E97A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 19:34:19 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id t6so863692ios.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 12:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ve4GtRub10Fq1Vh2pT4vIBg1M7C1nr5gj+2bBuvQVdw=;
	b=C5946ddodfeLp4RWX/PHb+Kg2pyfmwnaAjrcDjGWcZrzVrfZ4V6musa3A1O5Rk3YuS
	/xYXLj9+QGz0n7KZsQHE1mDVbPbZQlKSRp19NTidq6ybFfPuiTnxt7m0hobY9Vopk5HL
	z10qPA6+cSVEs7/5Gr9CkpJeIM9P0YwhdFEPOSfG2UGlvsPDzTE6qjNuFjGh6tIRkEgn
	uUpDiH2g6Agg14ajn8ZgPm11xRGbntsaM6TQcBaYQFNhm8kf6Nd0UWDvTxmZ3Nj3FZCy
	YY6l5Vmpa3mr5XjHde340z20f4YTP/yj2GiDjOQebhE7ZYABWgoQkhCu76s3ZTEU77rG
	/jGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ve4GtRub10Fq1Vh2pT4vIBg1M7C1nr5gj+2bBuvQVdw=;
	b=qy2apn/V6+TGyAkNuWJclcACr4e4fgyOFdP7EKOH4DiHmmXm/ifnAF3H8bh3E8XKCk
	qpW789zqS/wcHmjnkgWrc9sf72hbKRKZEdguHeY5UyMD+aVuEelqRUv+J94jDT7V/lQf
	Hs0EStUsorOVzhO1Sz6K6TuxWFDyPcYDMibZOTFqIeAJ/6dQu0ovwYIc46BkseDAw6j5
	0yvEM7qH8lwam+ZQsM3TZs3bAiV28gnjxftmdVtMc63A80J52ysYn3Yt2l1gMxAV0AVe
	NADAU1xwC0hxN2bwlUYXVITmglosGnEIXlteT4jk2NrnkMAs8/oWlZZZ/RVLMi5EFDTS
	mP+Q==
X-Gm-Message-State: APjAAAUNiqKOAyDS4GDwwF3l8ACEbH++xrkYdxB7tneLg69eg/udJcFz
	3CeKvqp+bANW24vBCOePhDyWHPZi
X-Google-Smtp-Source: APXvYqyaQ5L396AH4eZE0GxPNaXYJyDFMSozc0vbZn1QK0doMiB/Z2WtYSMWTkNcvfh4i5GJg8IqPg==
X-Received: by 2002:a6b:6a15:: with SMTP id x21mr24149294iog.40.1566934459920; 
	Tue, 27 Aug 2019 12:34:19 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id 8sm47288ion.26.2019.08.27.12.34.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 12:34:19 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 14:33:47 -0500
Message-Id: <20190827193349.23254-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190827193349.23254-1-JPEWhacker@gmail.com>
References: <20190827193349.23254-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] oeqa: Set LD_LIBRARY_PATH when executing native commands
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
X-List-Received-Date: Tue, 27 Aug 2019 19:34:19 -0000
Content-Transfer-Encoding: 8bit

Some commands like to look for libraries at runtime manually (e.g.
Python's ctype.utils.find_library() function). For this to work
properly, the libraries in the native sysroot must be findable. To
accomplish this, set LD_LIBRARY_PATH to search library paths in the
native sysroot.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/utils/commands.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 7140bc73d24..800160ee7e7 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -172,8 +172,11 @@ def runCmd(command, ignore_status=False, timeout=None, assert_error=True,
     if native_sysroot:
         extra_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin" % \
                       (native_sysroot, native_sysroot, native_sysroot)
+        extra_libpaths = "%s/lib:%s/usr/lib" % \
+                         (native_sysroot, native_sysroot)
         nenv = dict(options.get('env', os.environ))
         nenv['PATH'] = extra_paths + ':' + nenv.get('PATH', '')
+        nenv['LD_LIBRARY_PATH'] = extra_libpaths + ':' + nenv.get('LD_LIBRARY_PATH', '')
         options['env'] = nenv
 
     cmd = Command(command, timeout=timeout, output_log=output_log, **options)
-- 
2.21.0


