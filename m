Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 804867F2ED
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 19:34:46 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id q10so40128448pff.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 12:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/y8Rw5BjL4SSnJIvDgTYY62MZo/gEoqNXiA3nNaGgj8=;
	b=W/OxY661AdbZJODQn7DqXCfjGsPKJ94VCj6JiFl4uy3cTiIW4TjvQxsKY6zdQtVb7L
	ml5eDYsYrJQPIzXlc87CPes7pWQ6HM4LF8Oa3Pee+n0rQlX1WIAXep0AKlr4fA9iX0B6
	gkqYpZslKad0nR1XmrFhPuNyLah0pxmRuv9/O1n/WeMs8QnZC48JIJt1YtvuMqSxW8hN
	4/ZbmXJaIne7v6bYHuz5GCza1UYUJBxoeIuyG/r4ASSpydya4MEfSLVj0jrVVa1B3ZRw
	AXCQcgTOMM0R6AIMKRIqiQoBcTmwCu9AYA7jHPd+7Y/OvXurQXEy6fQYaWDYRFhwkrW5
	+/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/y8Rw5BjL4SSnJIvDgTYY62MZo/gEoqNXiA3nNaGgj8=;
	b=umv8FWHi85x2k2gzJvu2HuEV9gPSzjYdntt6qNbFCj26uhFCPPUqrqEVeFJeoi0tMY
	lr+v/WSwlmtfUI38+s5HokMqR+RyJnq6RCKZYSslddffmKdm78llqkN7QXyalzch6xZZ
	XuH0koNiUs01+iBY7o3t8V3ybX4xQeFAC8fPSloKGTeIAiabK1yEFD+KB0l3UN+2Edf3
	L2tFig50Ab9UNbCOWlY5z8/64a7giPYyLs+H0c8IdLrB9jl+JsAYaEvjueq1fgMiUBL0
	6RqPLxFvHExvav2jpna+kXiGjcpOCGVDK1bfvQpdxBw2w1rM7pWFg3DOTygSVCQcqhRp
	zZ1A==
X-Gm-Message-State: APjAAAWUEnCBgH3RrEdVM7RLGbRG2oGozTzZMdttNDmk/cL8Uz8JzTGX
	Zi6Vwyh4ts1j2a5MSgU77WvmlX5oXoc=
X-Google-Smtp-Source: APXvYqxixm6V5vD4/Zj4HparNkXdJonhm9JuoiwmYiSRt/hP8SJ0KLxTpNU/EL7pTCOdGjMowVx0EQ==
X-Received: by 2002:a63:e807:: with SMTP id s7mr133600638pgh.194.1565033687016;
	Mon, 05 Aug 2019 12:34:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	j10sm51904961pfn.188.2019.08.05.12.34.46
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 12:34:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2019 12:34:30 -0700
Message-Id: <20190805193431.32053-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805193431.32053-1-raj.khem@gmail.com>
References: <20190805193431.32053-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] musl: Fix clock_gettime on 32-bit archs without vdso
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
X-List-Received-Date: Mon, 05 Aug 2019 19:34:46 -0000
Content-Transfer-Encoding: 8bit

This was seen in x86 code being run via qemu-user ending in

(process:883): GLib-ERROR **: 22:28:34.117: GLib requires working CLOCK_MONOTONIC
qemu: uncaught target signal 5 (Trace/breakpoint trap) - core dumped

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...n-clock_gettime-on-32-bit-archs-with.patch | 30 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0001-fix-regression-in-clock_gettime-on-32-bit-archs-with.patch

diff --git a/meta/recipes-core/musl/musl/0001-fix-regression-in-clock_gettime-on-32-bit-archs-with.patch b/meta/recipes-core/musl/musl/0001-fix-regression-in-clock_gettime-on-32-bit-archs-with.patch
new file mode 100644
index 0000000000..d89fcee4f3
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0001-fix-regression-in-clock_gettime-on-32-bit-archs-with.patch
@@ -0,0 +1,30 @@
+From 192c8e18c0f502fe8269b075c21e58290f875182 Mon Sep 17 00:00:00 2001
+From: Rich Felker <dalias@aerifal.cx>
+Date: Mon, 5 Aug 2019 12:01:13 -0400
+Subject: [PATCH] fix regression in clock_gettime on 32-bit archs without vdso
+
+commit 72f50245d018af0c31b38dec83c557a4e5dd1ea8 broke this by creating
+a code path where r is uninitialized.
+
+Upstream-Status: Submitted
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ src/time/clock_gettime.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/time/clock_gettime.c b/src/time/clock_gettime.c
+index 63e9f9c8..3e1d0975 100644
+--- a/src/time/clock_gettime.c
++++ b/src/time/clock_gettime.c
+@@ -73,6 +73,7 @@ int __clock_gettime(clockid_t clk, struct timespec *ts)
+ #endif
+ 
+ #ifdef SYS_clock_gettime64
++	r = -ENOSYS;
+ 	if (sizeof(time_t) > 4)
+ 		r = __syscall(SYS_clock_gettime64, clk, ts);
+ 	if (SYS_clock_gettime == SYS_clock_gettime64 || r!=-ENOSYS)
+-- 
+2.22.0
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index bf6f983dc0..87eec31a0f 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -15,6 +15,7 @@ PV = "${BASEVER}+git${SRCPV}"
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
+           file://0001-fix-regression-in-clock_gettime-on-32-bit-archs-with.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.22.0


