Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id F21E56093D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 16:23:54 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id s66so591815wrc.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 08:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ixs4InwVn75caEwJdweZoyIdlWKP5I5mYLRQrhCcIGg=;
	b=O3bkykF4vsoyYOMiqmwEiGABR6ca8H/XANMpSSHBJsYSH1IHSs3A1Q5196s06I81Q7
	s0QUnU1MiaoV4J62jWz7UmLJKG0Eo63yMkeeBU8OoMPb8/4I8Y7kYg4sx7Dn78cWH4Wu
	l8aYV+aDYc6FLrX1KmnSdrWVx0b3KmdsgSC+srs1cV4WYlbsEf2sVkNfE+mU+0jHWGtN
	iCArZhAT+eQymoagivG22I3rlLW6B0rPbUqkiyEk8KXbbB+bqmf3BbSiRJGCWyRPSaog
	4rBj0ul4EYb5j4C4gjawIzuw3wesPX1CVE5O+drGpnPP6+WKEOzIlDIjz28+H7ReC/E7
	cZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ixs4InwVn75caEwJdweZoyIdlWKP5I5mYLRQrhCcIGg=;
	b=n8CwujbAaLLOPo2z8GaJOMn1U5RsGJvGfbHX/apU7XFcW+4BTklg0i4+/4JGQAf4pG
	zUnZpqg0wdlKpFZOFACyrI00IbsZ5MHCbzjACMOZmheJ4sruTqI4T33TyUTLSrNtB3AO
	//VLNoqs0Fvk+9oraCBLqv/pYRs8PJ2qVqWD+XRju7lPdMlCEo3q1ypAbah9NFq4FwAO
	rtyp9bLI2Dgz9QJApui7zJkRC6KFo0QDyhCQ+hxKSIfGCB7NOYd/5riatLt9drX0GMRk
	Ux1QFXabXVDNz7gqdDObaLM1mlmqoFTHdFTPTS6LFdCcKcpC0fJYFZVSdm7tPPN3Z/T5
	xGZg==
X-Gm-Message-State: AJaThX7Oqh8NoWKC/kjAWHlURVKVQhkK6ISkhRPP6N9nBdBvgdd7Dych
	LkpkV8SeJpXx+Cp3OdlPEQtJMDFk
X-Google-Smtp-Source: AGs4zMYMR7dIaPvMgfqHI18/DknUxkGPY6kwK8ih+87BIQi2r3Nc4bLJaIhAPeGqkCKSZUFywttPCw==
X-Received: by 10.223.153.162 with SMTP id y31mr35054682wrb.216.1511886235715; 
	Tue, 28 Nov 2017 08:23:55 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	l31sm55479775wrc.50.2017.11.28.08.23.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Nov 2017 08:23:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Nov 2017 16:23:52 +0000
Message-Id: <20171128162352.25156-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] site: consolidate ac_cv_func_mmap_fixed_mapped definitions
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
X-List-Received-Date: Tue, 28 Nov 2017 16:23:57 -0000

This is the cache variable used by AC_FUNC_MMAP, which is possibly one of the
worst autoconf macros to exist.

Apart from being a runtime test which silently claims that mmap() is broken when
cross-compiling, this is basically to verify that mmap() actually works, because
SVR4.0 (released 1988) was broken.  Thirty years later, everyone has a working
mmap().

common-glibc already has an assignment, so add a corresponding assignment to
common-musl and remove it from the machine-specific files.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/site/arm-linux   | 1 -
 meta/site/common-musl | 1 +
 meta/site/ix86-common | 1 -
 meta/site/nios2-linux | 1 -
 meta/site/sh-common   | 1 -
 5 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/site/arm-linux b/meta/site/arm-linux
index e6b9a726fb0..7bf073eb779 100644
--- a/meta/site/arm-linux
+++ b/meta/site/arm-linux
@@ -142,7 +142,6 @@ samba_cv_LINUX_LFS_SUPPORT=${samba_cv_LINUX_LFS_SUPPORT=yes}
 clamav_av_func_working_snprintf_long=${clamav_av_func_working_snprintf_long=yes}
 clamav_av_have_in_port_t=${clamav_av_have_in_port_t=yes}
 clamav_av_have_in_addr_t=${clamav_av_have_in_addr_t=yes}
-ac_cv_func_mmap_fixed_mapped=${ac_cv_func_mmap_fixed_mapped=yes}
 
 #dbus
 ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
diff --git a/meta/site/common-musl b/meta/site/common-musl
index 26fc1033191..1b4fc321353 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -12,6 +12,7 @@ ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
 ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
+ac_cv_func_mmap_fixed_mapped=${ac_cv_func_mmap_fixed_mapped=yes}
 
 # glib
 glib_cv_strlcpy=${glib_cv_strlcpy=no}
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index 4fbf58c0cfd..c5e354c073a 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -53,7 +53,6 @@ bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=missing}
 clamav_av_func_working_snprintf_long=${clamav_av_func_working_snprintf_long=yes}
 clamav_av_have_in_port_t=${clamav_av_have_in_port_t=yes}
 clamav_av_have_in_addr_t=${clamav_av_have_in_addr_t=yes}
-ac_cv_func_mmap_fixed_mapped=${ac_cv_func_mmap_fixed_mapped=yes}
 
 # cvs
 cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
index 5bae7484346..24bc5b033a1 100644
--- a/meta/site/nios2-linux
+++ b/meta/site/nios2-linux
@@ -372,7 +372,6 @@ samba_cv_LINUX_LFS_SUPPORT=${samba_cv_LINUX_LFS_SUPPORT=yes}
 clamav_av_func_working_snprintf_long=${clamav_av_func_working_snprintf_long=yes}
 clamav_av_have_in_port_t=${clamav_av_have_in_port_t=yes}
 clamav_av_have_in_addr_t=${clamav_av_have_in_addr_t=yes}
-ac_cv_func_mmap_fixed_mapped=${ac_cv_func_mmap_fixed_mapped=yes}
 
 #dbus
 ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
diff --git a/meta/site/sh-common b/meta/site/sh-common
index fc4d6ad792d..97c96934d71 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -227,7 +227,6 @@ with_broken_putenv=${with_broken_putenv=no}
 clamav_av_func_working_snprintf_long=${clamav_av_func_working_snprintf_long=yes}
 clamav_av_have_in_port_t=${clamav_av_have_in_port_t=yes}
 clamav_av_have_in_addr_t=${clamav_av_have_in_addr_t=yes}
-ac_cv_func_mmap_fixed_mapped=${ac_cv_func_mmap_fixed_mapped=yes}
 
 # libnet 
 ac_cv_lbl_unaligned_fail=${ac_cv_lbl_unaligned_fail=no}
-- 
2.11.0


