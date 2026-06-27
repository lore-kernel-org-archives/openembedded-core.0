Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5678BC44500
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 07:55:47 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51402.1782546944291163039
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 00:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=G3hoQY6y;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-46ee68c3b7aso1259809f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 00:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782546942; x=1783151742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yo5Xu9fetRPVlIFdzir9QmdfZ1Ebe4qD3Xw+OPEODmo=;
        b=G3hoQY6yVRQiiDG96I8pYbHsNSjBP8Fp0ej86QEkUkfeIvxt7Gz12A1q7Db77i+luU
         jel+ROMpYO8qYaiFv+t7qL6sQgDjA4eNWZdU+Px0zcDEnDW/stP1MlLciccO+Qgc/G0P
         UPHr0yYuu7/QReobBJTKaS03yhcT4EaU8hISfdH4fmhTh9kH5nJLU6niCK8lRGRfqRQa
         dJzP2TpFQeISiKeoiJEYTnhbsCL6Uq0ca6sZU3FAJq5eHm6L6ihlgPQDu8yVKu/5/Rkq
         1wMDH1UhqX4iLT0fW2AyWJaPt/Cnpz6uFjrdDFonLMUI/cEkTOok1cq6sgR/yNzkv8+L
         WuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782546942; x=1783151742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yo5Xu9fetRPVlIFdzir9QmdfZ1Ebe4qD3Xw+OPEODmo=;
        b=aPUQJZJy9pcoDOy15l3gHv6/9uNuQG/0R35ofXbIojI8SwyaSV5gJwEH0s2RERDBDa
         XPn9XTgNV28td1aJywnMZo0LyODCKr4KGrnX80nWZ3AvpjAg7weAhD9aS7eU2suEQ0jA
         zi3pr0A5UKetXD09fzlPiF+Xa9NSiPP4c+b09D0IwQFfa2OQ5nAF82HZpW9X4m+U3djC
         3WOj8Jen4WrJdpIm9lLCMDh4lS7l5oW4ryUFaAkjSkztTCR7+lyLUg21U59dVgPuPxcq
         oGgft09c7rP8tF0uqf3dEdC6yS1ucHNgT9PE7V26QUOAsZLKuGUHKDCfMENaTSl/zXNj
         LjCw==
X-Gm-Message-State: AOJu0YxEGLD6UyCuvv05HCMjtDs/6eK6LO5PpMlZtCJAbvw+M3AWlKd+
	WO1tcSZwMtNlW7RN1JGrdZO3rTm7xHCJjL3lFoJ/z9/PEII4FcRRsTRRsJbRCA5DnKo=
X-Gm-Gg: AfdE7cmd5wy6oe6cg5pAKi9YO8RS//KowFqTFnW88yHZbE9uI8Yg1LVL30S0GEz3X0P
	OI16Ke+dfeQ96MvQ2SeXaLW+uFJgwi330VS0RSc+bf+22jvbg8/Kt3b5uAu9XWGtjIeNZMYOXVm
	DZ/hDkCenjx0gQ5RDw9YsNiE1GIUmND/ZKI9Tn4aaKAwKylLxjZ4dqhvmV5n1mAmCyTHB3rAcbn
	HXt4sFWidz/5ib9jvPqirCQr3SxGJwpO6xwC9XOVImAZC/hjb4AHq4nrRFmpDxLueRlThr4Z4Wb
	pLlagi4Ram6r4BlSYgSrY2eqMQmLvsi/kNVb833o+GIvQsKlJbyeC0Q8ayXFhSVGcLTQoJ4e//8
	3Zmmh151api5qV+ziRahGJvWZhjIfKnCnrsGwCvqvEFAb1A1HrX71N8aHXlW9nEVNQqiR36aMj8
	YCsyLzrTiBH4+DQ5ren2EGYX6ApEsV+eIVueDvsedE2V+d8pH2
X-Received: by 2002:a05:6000:4913:b0:46d:8169:bb39 with SMTP id ffacd0b85a97d-46dc1b9c344mr14915524f8f.37.1782546942502;
        Sat, 27 Jun 2026 00:55:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f4ffc11d9sm11421952f8f.37.2026.06.27.00.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 00:55:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 8/8] oeqa: allow exceptions in buildpath HOME checks
Date: Sat, 27 Jun 2026 09:55:30 +0200
Message-ID: <20260627075532.3153679-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260627075532.3153679-1-alex.kanavin@gmail.com>
References: <20260627075532.3153679-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 07:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239692

From: Alexander Kanavin <alex@linutronix.de>

Sometimes upstreams hardcode directories that match
users' own home directories, which triggers a false
positive in the test:

https://lists.yoctoproject.org/g/yocto/message/66612

It's very hard to programmatically establish what is
hardcoded in the original source, and what is a genuine
build contamination, so this adds a way to specify such
occurences in recipes.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/insane.bbclass                   | 4 ++--
 meta/recipes-devtools/perl/perl_5.42.2.bb            | 2 ++
 meta/recipes-devtools/python/python3-numpy_2.4.6.bb  | 2 ++
 meta/recipes-devtools/python/python3-pytest_9.1.0.bb | 2 ++
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 4250331af1..a788817c89 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -445,9 +445,9 @@ def package_qa_check_buildpaths(path, name, d, elf):
         if tmpdir in file_content:
             path = package_qa_clean_path(path, d, name)
             oe.qa.handle_error("buildpaths", "File %s in package %s contains reference to TMPDIR" % (path, name), d)
-        if homedir and homedir in file_content:
+        if homedir and homedir in file_content and not homedir.decode() in (d.getVar("OEQA_BUILDPATHS_SKIP") or "").split():
             path = package_qa_clean_path(path, d, name)
-            oe.qa.handle_error("buildpaths", "File %s in package %s contains reference to the build host HOME directory" % (path, name), d)
+            oe.qa.handle_error("buildpaths", "File %s in package %s contains a reference to the build host HOME directory. If upstream hardcodes a directory path that matches your home, you can set OEQA_BUILDPATHS_SKIP = \"%s\" in the recipe." % (path, name, homedir.decode()), d)
 
 
 QAPATHTEST[xorg-driver-abi] = "package_qa_check_xorg_driver_abi"
diff --git a/meta/recipes-devtools/perl/perl_5.42.2.bb b/meta/recipes-devtools/perl/perl_5.42.2.bb
index f076431aff..f1f026579b 100644
--- a/meta/recipes-devtools/perl/perl_5.42.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.2.bb
@@ -448,3 +448,5 @@ SSTATE_HASHEQUIV_FILEMAP = " \
     populate_sysroot:*/lib*/perl5/config.sh:${TMPDIR} \
     populate_sysroot:*/lib*/perl5/config.sh:${COREBASE} \
     "
+
+OEQA_BUILDPATHS_SKIP = "/home/alex"
diff --git a/meta/recipes-devtools/python/python3-numpy_2.4.6.bb b/meta/recipes-devtools/python/python3-numpy_2.4.6.bb
index 2c892e9756..278e838820 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.4.6.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.4.6.bb
@@ -84,3 +84,5 @@ RDEPENDS:${PN}-ptest += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
+
+OEQA_BUILDPATHS_SKIP = "/home/alex"
diff --git a/meta/recipes-devtools/python/python3-pytest_9.1.0.bb b/meta/recipes-devtools/python/python3-pytest_9.1.0.bb
index 9180e7bf1f..b61e86cd00 100644
--- a/meta/recipes-devtools/python/python3-pytest_9.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest_9.1.0.bb
@@ -33,3 +33,5 @@ ALTERNATIVE_LINK_NAME[py.test] = "${bindir}/py.test"
 ALTERNATIVE_TARGET[py.test] = "${bindir}/py.test"
 
 BBCLASSEXTEND = "native nativesdk"
+
+OEQA_BUILDPATHS_SKIP = "/home/user"
-- 
2.47.3


