Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 813737F8BD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 04:05:22 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id w11so5861561pga.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 20:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4L0hIa25kSF0xtxlKy0du1e6GIq9lb2CA6OFP95refM=;
	b=QPYiCEQHUPt2vX3R3U3mqh6Y5y2ydpwYYYLDS04WH8dkC3tUtbB93b88w3YGUXMUkf
	jSpcg8tf7nBnFRSb5mHCIzDjCdIVhrOcRKlG2pfVStLTggdUC4ltatk0WUElg7qt10zM
	m7othnYPYXupxwJiZxNNY1BThAhIGUO+39ULle3R+JDvX1A7XlshJAKt8mLdh+dWq09Y
	ChgXnWJglTng9rd7Y16NGVQCVrrvX5v4V/VDQMLV7U/iAflqchWG7Q59OxnTY4PbxkVz
	wg/q4hYqQskQKqhJMfaEXU9Vg4Z4V8y57L4+qv6u4pBKvW6V9K+JZv1oscsQG4lbLYGk
	IWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4L0hIa25kSF0xtxlKy0du1e6GIq9lb2CA6OFP95refM=;
	b=EfmVN65y8wTqGk9e30dt+lYF6ocaP79hbLGXOSTdfVU5INh3rkfPzX4s5Tc9dWB+u3
	LBnUx7mGrmlW+X5/OwT2HwgjSFZaIFv/I1hIbLITv35YcqPw2/e+3mdkTccaDz5hqVor
	4BiOyELnwD2dN1AzOtotE9b0vgYdpR92zPIPkw7ClzOtSAhymLTPpslm8glUzUQnGyrJ
	eXPoO5EQbufvawNJ7dxEi79R1/0khETW639OSoi35VRgOg81X/tCKnHecfw13bwCvNN2
	4m6q+3hyIpcI/Jdt/a9yogsejMdUJITy8Tc9+qh0cEhxM/TvBy+h1zFNQF9Y+pczqRri
	W8gA==
X-Gm-Message-State: APjAAAUFbhJDGtmKJtH0sgePcV6x0VuACwvgdg9q0e48OnyfSvwxyA0u
	h9vD4sPTVJlrfC72Kly5uDDr9mtIcLM=
X-Google-Smtp-Source: APXvYqyHsTgw74iDdpYyCCNHq5RjEk1sqGyrEk91+HRLN0zTCn9CBgKQLRQOVoqP7Gv/WKWHI6EHTQ==
X-Received: by 2002:a63:e009:: with SMTP id e9mr451256pgh.222.1573013122808;
	Tue, 05 Nov 2019 20:05:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::5caf])
	by smtp.gmail.com with ESMTPSA id
	c9sm30692877pfb.114.2019.11.05.20.05.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 20:05:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 20:05:08 -0800
Message-Id: <20191106040508.3172148-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] strace: Fix ptest build
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
X-List-Received-Date: Wed, 06 Nov 2019 04:05:22 -0000
Content-Transfer-Encoding: 8bit

include stdint.h since the test uses uintptr_t C99 type

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../strace/strace/uintptr_t.patch               | 17 +++++++++++++++++
 meta/recipes-devtools/strace/strace_5.3.bb      |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/uintptr_t.patch

diff --git a/meta/recipes-devtools/strace/strace/uintptr_t.patch b/meta/recipes-devtools/strace/strace/uintptr_t.patch
new file mode 100644
index 0000000000..6d3dd6fb98
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/uintptr_t.patch
@@ -0,0 +1,17 @@
+include stdint.h for getting uintptr_t definition
+
+fixes do_compile_ptest_base
+tests/fanotify_mark.c:191:23: error: 'uintptr_t' undeclared (first use in this function); did you mean 'intptr_t'?
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/tests/fanotify_mark.c
++++ b/tests/fanotify_mark.c
+@@ -18,6 +18,7 @@
+ 
+ # include <limits.h>
+ # include <stdio.h>
++# include <stdint.h>
+ # include <unistd.h>
+ # include <sys/fanotify.h>
+ 
diff --git a/meta/recipes-devtools/strace/strace_5.3.bb b/meta/recipes-devtools/strace/strace_5.3.bb
index 775a22fc62..db6004583b 100644
--- a/meta/recipes-devtools/strace/strace_5.3.bb
+++ b/meta/recipes-devtools/strace/strace_5.3.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
            file://ptest-spacesave.patch \
+           file://uintptr_t.patch \
            "
 SRC_URI[md5sum] = "84f5e72de813c9b1bb6057ee8ab428d8"
 SRC_URI[sha256sum] = "6c131198749656401fe3efd6b4b16a07ea867e8f530867ceae8930bbc937a047"
-- 
2.24.0


