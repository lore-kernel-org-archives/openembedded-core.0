Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4642971B99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:36:56 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id w126-v6so3133659oie.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5yMIe9+RHhkPhH/OB0imGjLYYmGeFDsUdz+UzHI60Mk=;
	b=ousAveD4PV6+Yu2LMIAmPkjDOp+TF7hKyvJ6ugT6aDm8yChgGxQlcAavYn2jnZJecQ
	mPR4Mzj7TvDgrstid05ka2KoHVwZMfMpzDYxaV6r63yoyW9J1DMBf0dyOOsmFgCViRdR
	M5TOCfOXx62u3njRgStSnFucmKJZuG+gRD5/tbv2w5hs9NB+6kVQZ0Ur3lX0pt3aQicG
	4RS+IMsyfaSym9oFVXF2UtZjp4SgMTNFZHgVg2tPpik283Y1L6k+QJOM9B0hwehJxMOO
	etueMSFP5pg0Lwgc1Nc8Sw8jeL0xNmJpOJ/KoJfMmebFBMdQk18n35QuDas6ttyJ8EA2
	T6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5yMIe9+RHhkPhH/OB0imGjLYYmGeFDsUdz+UzHI60Mk=;
	b=ijA+fBWalG2wUeemHyntxDvUiIxkdYcmG7ljbdIjqtA82YYkB4PVtR3YHsKyx/v3Vi
	dqkmBmk6Tzv4iNbJsaItwXDeRJYU3v1boKumy4d4uMxaDaXx+JD2YcJW04qwvqjms2iS
	K282OrXd+nwBrYSMAXMDrr6KOW+I0vH/NrLOKjsz4BHBhGbJVeHaPxnm1oMBdOXhyoeq
	8+4Y8DDRbveksha6Ji3fsiVHiah39rU4d8PEhxoMRLZqxw5s4mEXYoe6wu13EJkpbwAo
	bdeyLe0asjYDZEkda8wSwWIxjQopIW6evKw0bL36FuEzhjDQdRwFNvhJJp+SLiTMflhc
	XsdA==
X-Gm-Message-State: APzg51CSnc3Psmn6xtS6MRd0hfmVRyvMUOP5tUH4NVyfebe0tmVYkdVI
	GYNpYAYMkKBrgrOBjLchQQoCakVtYO8=
X-Google-Smtp-Source: ANB0VdYATNux3vHBdTzxuDLGTfMmwNJGVetQTT0eUzZLzaUQ5Pe/ZZjP62Vycd4ESeWrmXkaFHCtIA==
X-Received: by 2002:aca:7513:: with SMTP id
	q19-v6mr3733978oic.13.1534945017105; 
	Wed, 22 Aug 2018 06:36:57 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.36.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:36:56 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:29 +0530
Message-Id: <1534944940-21566-23-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 23/34] qemu: CVE-2017-18043
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
X-List-Received-Date: Wed, 22 Aug 2018 13:36:56 -0000

osdep: Fix ROUND_UP(64-bit, 32-bit)

When using bit-wise operations that exploit the power-of-two
nature of the second argument of ROUND_UP(), we still need to
ensure that the mask is as wide as the first argument (done
by using a ternary to force proper arithmetic promotion).
Unpatched, ROUND_UP(2ULL*1024*1024*1024*1024, 512U) produces 0,
instead of the intended 2TiB, because negation of an unsigned
32-bit quantity followed by widening to 64-bits does not
sign-extend the mask.

Broken since its introduction in commit 292c8e50 (v1.5.0).
Callers that passed the same width type to both macro parameters,
or that had other code to ensure the first parameter's maximum
runtime value did not exceed the second parameter's width, are
unaffected, but I did not audit to see which (if any) existing
clients of the macro could trigger incorrect behavior (I found
the bug while adding a new use of the macro).

While preparing the patch, checkpatch complained about poor
spacing, so I also fixed that here and in the nearby DIV_ROUND_UP.

Affects qemu < v2.11.0

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../qemu/qemu/CVE-2017-18043.patch                 | 63 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.10.0.bb          |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2017-18043.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2017-18043.patch b/meta/recipes-devtools/qemu/qemu/CVE-2017-18043.patch
new file mode 100644
index 0000000..955a24c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2017-18043.patch
@@ -0,0 +1,63 @@
+From 2098b073f398cd628c09c5a78537a6854e85830d Mon Sep 17 00:00:00 2001
+From: Eric Blake <eblake@redhat.com>
+Date: Thu, 14 Sep 2017 08:49:23 -0500
+Subject: [PATCH] osdep: Fix ROUND_UP(64-bit, 32-bit)
+
+When using bit-wise operations that exploit the power-of-two
+nature of the second argument of ROUND_UP(), we still need to
+ensure that the mask is as wide as the first argument (done
+by using a ternary to force proper arithmetic promotion).
+Unpatched, ROUND_UP(2ULL*1024*1024*1024*1024, 512U) produces 0,
+instead of the intended 2TiB, because negation of an unsigned
+32-bit quantity followed by widening to 64-bits does not
+sign-extend the mask.
+
+Broken since its introduction in commit 292c8e50 (v1.5.0).
+Callers that passed the same width type to both macro parameters,
+or that had other code to ensure the first parameter's maximum
+runtime value did not exceed the second parameter's width, are
+unaffected, but I did not audit to see which (if any) existing
+clients of the macro could trigger incorrect behavior (I found
+the bug while adding a new use of the macro).
+
+While preparing the patch, checkpatch complained about poor
+spacing, so I also fixed that here and in the nearby DIV_ROUND_UP.
+
+CVE: CVE-2017-18043
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commitdiff;h=2098b073f398cd628c09c5a78537a6854]
+
+CC: qemu-trivial@nongnu.org
+CC: qemu-stable@nongnu.org
+Signed-off-by: Eric Blake <eblake@redhat.com>
+Reviewed-by: Laszlo Ersek <lersek@redhat.com>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ include/qemu/osdep.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
+index 72b75bf044..9dd318a7dd 100644
+--- a/include/qemu/osdep.h
++++ b/include/qemu/osdep.h
+@@ -205,13 +205,13 @@ extern int daemon(int, int);
+ 
+ /* Round number up to multiple. Requires that d be a power of 2 (see
+  * QEMU_ALIGN_UP for a safer but slower version on arbitrary
+- * numbers) */
++ * numbers); works even if d is a smaller type than n.  */
+ #ifndef ROUND_UP
+-#define ROUND_UP(n,d) (((n) + (d) - 1) & -(d))
++#define ROUND_UP(n, d) (((n) + (d) - 1) & -(0 ? (n) : (d)))
+ #endif
+ 
+ #ifndef DIV_ROUND_UP
+-#define DIV_ROUND_UP(n,d) (((n) + (d) - 1) / (d))
++#define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
+ #endif
+ 
+ /*
+-- 
+2.13.3
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.10.0.bb b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
index a3cfb7c..48b8675 100644
--- a/meta/recipes-devtools/qemu/qemu_2.10.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://memfd.patch \
            file://0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch \
            file://CVE-2017-15119.patch \
+           file://CVE-2017-18043.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
-- 
2.7.4


