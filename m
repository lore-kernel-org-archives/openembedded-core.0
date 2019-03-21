Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 312877CF44
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 12:31:18 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id f3so2533759wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 05:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=zj9vcaUs+6p6hQQDYDuGfPqGj1o9vdDJH02J+058srw=;
	b=Vxft811AqxZ397qSK5MPrJUKQmPU7CW8fqrd1losxZ1QWYtypJsivNcX+6tY8yoX6r
	xFV1w81yf6u4tYDtpaxckymjpiWacm2FV8XAxIQ5g5gCZJh8NIiGyRoiff7TzsBUQ8Zo
	PmLEk0R9Pzm6S6tYxmp6bPqAmp1BE07zxJwlmm7SaZOtnZifCnhjw13qOsnuXY4extnm
	OH9UVMfAhTv0nzTCvI8e3Aiyoe/mO31AksaBP7Jd8idUP83QP+QucQErq6nbwY3cEPYC
	dRQpsVo9unnacJSkJkAichWlarKymUxx8qexVHK8sRnZIOLV/cjyYRc+q2+8RwjpYlML
	uhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=zj9vcaUs+6p6hQQDYDuGfPqGj1o9vdDJH02J+058srw=;
	b=B9vFfdzXseU8SeuWrVrEkpHrzCtS+5UI9XVhdu9z4Ax52WN1FhxZf6Nc9mSzwg9G4K
	VJvFhl85ZJhtfFxWKY9DMePxrF9PNqgqJUZ9dzrYwyy+e6ONz30P5ZUUrMwfpPpXkihg
	ZtLDxzumArQDUWGO6R0ZthfBsBVgMYJ+xlLkWNx/xg25WwvHSjgvULWsJtvJccjCstrq
	c33ZHUfAT4/f5Qv0FiBCsBc0hH8SFP0oIpy/ieflQDrS5tZzUHWOrXAw3RdZzzmMAynD
	lTtVsaqT3rv8al955GqHiA/Ob1h3jIkbyabDswUEyAG/UbYLSGZSVVc+eTcmHK84FqeU
	F5FQ==
X-Gm-Message-State: APjAAAX6/gUexgTGWA5E3KVF6o6GpoPubHnLoqelqcR/atw/MzRKcfHm
	hbYgqdY76E6WXA/pg9esld4ajr5yZEA=
X-Google-Smtp-Source: APXvYqydxY+XkA+iW+ef/Um1klA5FFUiGpAtDIQd+GvdVnoAYiGM2jUw6lTD4faCzJteO3Id1tSq1A==
X-Received: by 2002:a1c:f10f:: with SMTP id p15mr2382063wmh.27.1553171478689; 
	Thu, 21 Mar 2019 05:31:18 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j13sm6191131wrx.74.2019.03.21.05.31.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Mar 2019 05:31:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 12:31:12 +0000
Message-Id: <20190321123112.3075-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] glibc: fix CVE-2019-9169
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
X-List-Received-Date: Thu, 21 Mar 2019 12:31:18 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch | 36 +++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.29.bb             |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
new file mode 100644
index 00000000000..bc40361c5d7
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
@@ -0,0 +1,36 @@
+CVE: CVE-2019-9169
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 583dd860d5b833037175247230a328f0050dbfe9 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Mon, 21 Jan 2019 11:08:13 -0800
+Subject: [PATCH] regex: fix read overrun [BZ #24114]
+
+Problem found by AddressSanitizer, reported by Hongxu Chen in:
+https://debbugs.gnu.org/34140
+* posix/regexec.c (proceed_next_node):
+Do not read past end of input buffer.
+---
+ posix/regexec.c |  6 ++++--
+ 2 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/posix/regexec.c b/posix/regexec.c
+index 91d5a79..084b122 100644
+--- a/posix/regexec.c
++++ b/posix/regexec.c
+@@ -1293,8 +1293,10 @@ proceed_next_node (const re_match_context_t *mctx, Idx nregs, regmatch_t *regs,
+ 	      else if (naccepted)
+ 		{
+ 		  char *buf = (char *) re_string_get_buffer (&mctx->input);
+-		  if (memcmp (buf + regs[subexp_idx].rm_so, buf + *pidx,
+-			      naccepted) != 0)
++		  if (mctx->input.valid_len - *pidx < naccepted
++		      || (memcmp (buf + regs[subexp_idx].rm_so, buf + *pidx,
++				  naccepted)
++			  != 0))
+ 		    return -1;
+ 		}
+ 	    }
+-- 
+2.9.3
diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
index db856c70adb..9184c5932cc 100644
--- a/meta/recipes-core/glibc/glibc_2.29.bb
+++ b/meta/recipes-core/glibc/glibc_2.29.bb
@@ -55,6 +55,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0029-inject-file-assembly-directives.patch \
            file://0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
            file://0001-x86-64-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch \
+           file://CVE-2019-9169.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.11.0


