Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C1AC43217
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:06 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.3489.1652871539620739912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KjPEDgOt;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id wh22so2896707ejb.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YFd1PPCWSacI5oxBEstQjmAO2xthDUKaxoaI+oM8nkk=;
        b=KjPEDgOtpwNH4A3Bq4D5wOWaFfi/hRiahmxfJUeSijOtr8DtF0YN+5OSW7+E9hAhv7
         i0HAOkEQdgwjPknpYsfXe+nHbe84PqYVqbhlLrDYSDCOEw5wLMsYETYRHFnTHvGJRNns
         1G0myiGbCRiEq2DGtOoDaEAoF5taS42f+CwsbOnpnoOEXY8JCzO7sZrGvPcVpcOweXtg
         u7dtdvQASTHg7gX+zT8cTRS4CfRVLZM8AODqc+dPNOKD2z5AmmPBs6FtVGXmoTciBU4l
         6JYHN3Byj7Y0Kke2VxiFlLj8nlO7+RlxkUl59EOxagOZbVZNn17DZ7a2VHVWnqKxson1
         nd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YFd1PPCWSacI5oxBEstQjmAO2xthDUKaxoaI+oM8nkk=;
        b=Lp0q6MjA45tDEGH6zU+cT+Zdly60AZ3ZrYs1TijJa4xp7vCtGX1o+r12+OKe/PyxnO
         D3/h55DD+qSSiKgKhBiBUiBZgL8NJbW38T9lKEK4Iqxv27eMV1jIWMpfYBUIYBR3mgkM
         LqCoBld+GxgBZnhtvB/+eUnVmqu9P2MLFp4ugZVpfvjtPy+U03EyPGJZwzZj0G9ehAeV
         pXOVfQjIZC4dF62xwQkKcydP9du2KkiTZfBgaEyTBP264dCfojxZvsBOQwzu0o37sJrR
         rTi1pp+oALV/47zk3/JEb+PmyIUqve8vILZkNBhandSi1CBYewLy2yfGvedqrsPRsCOC
         kweA==
X-Gm-Message-State: AOAM530J+R6LnR33XX2jmPBZP1hfJ5W7ejMuVZGSRSvmuUKgvBafVmNV
	uYscbWEodppSVXWJJUg0xVn4ypBVlrw=
X-Google-Smtp-Source: 
 ABdhPJxQYq8FplC0Hty91DhGLmk3jaYWdVjn24SoZfNQH4QcUHSEZpM/wT+iTNZ+uaPgKfYuk7KB2A==
X-Received: by 2002:a17:907:6eac:b0:6f8:61c4:4cb3 with SMTP id
 sh44-20020a1709076eac00b006f861c44cb3mr22953419ejc.597.1652871538126;
        Wed, 18 May 2022 03:58:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:58:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/49] systemtap: update 4.6 -> 4.7
Date: Wed, 18 May 2022 12:58:05 +0200
Message-Id: <20220518105843.3299331-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165808

Drop backports.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ing-tweak-for-sprintf-precision-para.patch | 45 ----------
 ...ault-stap-s-buffer-size-on-small-RAM.patch | 84 -------------------
 ...ility-re-tweak-for-rhel6-use-functio.patch | 49 -----------
 .../recipes-kernel/systemtap/systemtap_git.bb |  6 +-
 .../systemtap/systemtap_git.inc               |  6 +-
 5 files changed, 5 insertions(+), 185 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-PR28778-gcc-warning-tweak-for-sprintf-precision-para.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-PR28804-tune-default-stap-s-buffer-size-on-small-RAM.patch
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-PR28778-gcc-warning-tweak-for-sprintf-precision-para.patch b/meta/recipes-kernel/systemtap/systemtap/0001-PR28778-gcc-warning-tweak-for-sprintf-precision-para.patch
deleted file mode 100644
index 0801cb57ec..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-PR28778-gcc-warning-tweak-for-sprintf-precision-para.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From b0422e9e5a539164af75cddcaeb01bceca56bf12 Mon Sep 17 00:00:00 2001
-From: "Frank Ch. Eigler" <fche@redhat.com>
-Date: Thu, 13 Jan 2022 18:33:15 -0500
-Subject: [PATCH] PR28778: gcc warning tweak for sprintf precision parameter
-
-A precision=-1 sentinel value got interpreted as UINT_MAX in a
-context, leading to diagnostics like:
-
-/usr/share/systemtap/runtime/vsprintf.c:341:23: error: 'strnlen' specified bound 4294967295 may exceed maximum object size 2147483647 [-Werror=stringop-overread]
-
-Adding a clamp_t() around the parameter field to keep it limited to
-STP_BUFFER_SIZE (8K by default), which is apprx. the limit for a
-single printf.
----
- runtime/vsprintf.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/runtime/vsprintf.c b/runtime/vsprintf.c
-index cd31a938b..606f685e8 100644
---- a/runtime/vsprintf.c
-+++ b/runtime/vsprintf.c
-@@ -338,7 +338,7 @@ _stp_vsprint_memory(char * str, char * end, const char * ptr,
- 	if (format == 's') {
- 		if ((unsigned long)ptr < PAGE_SIZE)
- 			ptr = "<NULL>";
--		len = strnlen(ptr, precision);
-+		len = strnlen(ptr, clamp_t(size_t, precision, 0, STP_BUFFER_SIZE));                
- 	}
- 	else if (precision > 0)
- 		len = precision;
-@@ -410,7 +410,7 @@ _stp_vsprint_memory_size(const char * ptr, int width, int precision,
- 	if (format == 's') {
- 		if ((unsigned long)ptr < PAGE_SIZE)
- 			ptr = "<NULL>";
--		len = strnlen(ptr, precision);
-+		len = strnlen(ptr, clamp_t(size_t, precision, 0, STP_BUFFER_SIZE));
- 	}
- 	else if (precision > 0)
- 		len = precision;
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-PR28804-tune-default-stap-s-buffer-size-on-small-RAM.patch b/meta/recipes-kernel/systemtap/systemtap/0001-PR28804-tune-default-stap-s-buffer-size-on-small-RAM.patch
deleted file mode 100644
index 931310db53..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-PR28804-tune-default-stap-s-buffer-size-on-small-RAM.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-PR28804: tune default stap -s ## buffer size on small RAM machines
-
-Insert a forgotten division by num_online_cpu() to adjust downward the
-calculated bufsize.  Tweak normal defaults back to 128 * 2 * 64K
-(16MB) per CPU, as the stap man page indicates.  This may need further
-tweaking when balancing against staprun consumption performance, but
-at least we have the docs lined up with the code at the moment.
-
-PR28804: tune default stap -s ## buffer size on small RAM machines
-
-Use si_meminfo to limit default buffer size.  Note in the man page
-that the "-s ##" parameter is per-CPU.
-
-diff --git a/man/stap.1.in b/man/stap.1.in
-index 55dbc2c93..285a27b34 100644
---- a/man/stap.1.in
-+++ b/man/stap.1.in
-@@ -239,8 +239,8 @@ and average amount of time spent in each probe-point. Also shows
- the derivation for each probe-point.
- .TP
- .BI \-s " NUM"
--Use NUM megabyte buffers for kernel-to-user data transfer.  On a
--multiprocessor in bulk mode, this is a per-processor amount.
-+Use NUM megabyte buffers for kernel-to-user data transfer per processor.
-+The default is 16MB, or less on smaller memory machines.
- .TP
- .BI \-I " DIR"
- Add the given directory to the tapset search directory.  See the
-diff --git a/runtime/transport/transport.c b/runtime/transport/transport.c
-index 18ecccea2..44afff814 100644
---- a/runtime/transport/transport.c
-+++ b/runtime/transport/transport.c
-@@ -72,8 +72,11 @@ static inline void _stp_unlock_inode(struct inode *inode);
- #include "procfs.c"
- #include "control.c"
- 
--static unsigned _stp_nsubbufs = 256;
--static unsigned _stp_subbuf_size = 8 * STP_BUFFER_SIZE; /* 64K */
-+/* set default buffer parameters.  User may override these via stap -s #, and
-+   the runtime may auto-shrink it on low memory machines too. */
-+/* NB: Note default in man/stap.1.in */
-+static unsigned _stp_nsubbufs = 128;
-+static unsigned _stp_subbuf_size = 2 * STP_BUFFER_SIZE; /* 2 * 64K */
- 
- /* module parameters */
- static int _stp_bufsize;
-@@ -602,17 +605,30 @@ static int _stp_transport_init(void)
-         _stp_need_kallsyms_stext = 0;
- #endif
- 
--	if (_stp_bufsize) {
--		unsigned size = _stp_bufsize * 1024 * 1024;
-+        if (_stp_bufsize == 0) { // option not specified?
-+		struct sysinfo si;
-+                long _stp_bufsize_avail;
-+                si_meminfo(&si);
-+                _stp_bufsize_avail = (long)((si.freeram + si.bufferram) / 4 / num_online_cpus())
-+                        << PAGE_SHIFT; // limit to quarter of free ram total
-+                if ((_stp_nsubbufs * _stp_subbuf_size * num_online_cpus()) > _stp_bufsize_avail) {
-+                        _stp_bufsize = max_t (int, 1, _stp_bufsize_avail / 1024 / 1024);
-+                        dbug_trans(1, "Shrinking default _stp_bufsize to %d MB/cpu due to low free memory\n", _stp_bufsize);
-+                }
-+        }      
-+        
-+	if (_stp_bufsize) { // overridden by user or by si_meminfo heuristic?
-+		long size = _stp_bufsize * 1024 * 1024;
- 		_stp_subbuf_size = 65536;
-+                // bump up subbuf size from 64K to 1M to keep _stp_nsubbufs not too large
- 		while (size / _stp_subbuf_size > 64 &&
- 		       _stp_subbuf_size < 1024 * 1024) {
- 			_stp_subbuf_size <<= 1;
- 		}
- 		_stp_nsubbufs = size / _stp_subbuf_size;
--		dbug_trans(1, "Using %d subbufs of size %d\n", _stp_nsubbufs, _stp_subbuf_size);
- 	}
--
-+        dbug_trans(1, "Using %d subbufs of size %d\n", _stp_nsubbufs, _stp_subbuf_size);
-+        
- 	ret = _stp_transport_fs_init(THIS_MODULE->name);
- 	if (ret)
- 		goto err0;
diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch b/meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch
deleted file mode 100644
index f885c44460..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From f199d1982ef8a6c6d5c06c082d057b8793bcc6aa Mon Sep 17 00:00:00 2001
-From: Serhei Makarov <serhei@serhei.io>
-Date: Fri, 21 Jan 2022 18:21:46 -0500
-Subject: [PATCH] gcc12 c++ compatibility re-tweak for rhel6: use function
- pointer instead of lambdas instead of ptr_fun<>
-
-Saving 2 lines in ltrim/rtrim is probably not a good reason to drop
-compatibility with the RHEL6 system compiler.  Actually declaring a
-named function and passing the function pointer is compatible with
-everything.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=commit;h=f199d1982ef8a6c6d5c06c082d057b8793bcc6aa]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- util.cxx | 13 ++++++++-----
- 1 file changed, 8 insertions(+), 5 deletions(-)
-
---- a/util.cxx
-+++ b/util.cxx
-@@ -1757,21 +1757,24 @@ flush_to_stream (const string &fname, os
-   return 1; // Failure
- }
- 
-+int
-+not_isspace(unsigned char c)
-+{
-+  return !std::isspace(c);
-+}
-+
- // trim from start (in place)
- void
- ltrim(std::string &s)
- {
--  s.erase(s.begin(),
--	  std::find_if(s.begin(), s.end(),
--		       std::not1(std::ptr_fun<int, int>(std::isspace))));
-+  s.erase(s.begin(), std::find_if(s.begin(), s.end(), not_isspace));
- }
- 
- // trim from end (in place)
- void
- rtrim(std::string &s)
- {
--  s.erase(std::find_if(s.rbegin(), s.rend(),
--	  std::not1(std::ptr_fun<int, int>(std::isspace))).base(), s.end());
-+  s.erase(std::find_if(s.rbegin(), s.rend(), not_isspace).base(), s.end());
- }
- 
- // trim from both ends (in place)
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index ce86d5274d..072fcb310a 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -6,9 +6,9 @@ HOMEPAGE = "https://sourceware.org/systemtap/"
 
 require systemtap_git.inc
 
-SRC_URI += "file://0001-improve-reproducibility-for-c-compiling.patch \
-            file://0001-staprun-address-ncurses-6.3-failures.patch \
-            file://0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch \
+SRC_URI += " \
+           file://0001-improve-reproducibility-for-c-compiling.patch \
+           file://0001-staprun-address-ncurses-6.3-failures.patch \
            "
 
 DEPENDS = "elfutils"
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 5b5521b174..2b79aa8fca 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,14 +1,12 @@
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "2e9f2f6967e44ce2bf8f34932b5bdd738ece2161"
-PV = "4.6"
+SRCREV = "0c335a75a789ff44b514e567d458881e15cc283d"
+PV = "4.7"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
-           file://0001-PR28778-gcc-warning-tweak-for-sprintf-precision-para.patch \
-           file://0001-PR28804-tune-default-stap-s-buffer-size-on-small-RAM.patch \
            "
 
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64).*-linux'
-- 
2.30.2


