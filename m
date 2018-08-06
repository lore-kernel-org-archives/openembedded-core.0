Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8FA745BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 22:57:31 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id j8-v6so6225556pll.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 15:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=miJVhpZn7mpqXvQYQrSoFayAv9wVbUCM7NawS+nmzsc=;
	b=Mbc95jy1F6VdBml2Zn8ty2BpLmrxy/D28zc+Ixz6TquFGtZdK9YCkBM61OTKlmoFbt
	Wuna/jiPci71v8Sauhz7SnGNsmwaXSznGfXFBWCT5da60uWWpBTANJ9dIDTQuUV7mfQs
	RRZD14EgzGQNzS1Xbm0KDm6zpa2aOcGlS2/Ug5HVZ+yBGwZyC3Yrw6LPMlhCfMBwORVq
	+AkKJAZYDy9JF5y68Za4EQHet6wW0OZJt4qzPIXOMIPSO5LgdkH0ivzwJZVwcxn5BAdS
	B+mcLHnC/tlwj8wpbewA1DhXm0OeimjjSIbgDuXV/Oo7G410j2ZAnF5bfacCO9scJS1w
	4b8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=miJVhpZn7mpqXvQYQrSoFayAv9wVbUCM7NawS+nmzsc=;
	b=FeXLphsLPtDqFeLq45jfVTAdvHZTIJkMfue8BMPWDMDXLprHq7e8ixKXCcgSeucxbp
	hAQZWouw6owZPd/y1ulql7wEDxzwpBZyAZzDa41Iyy+Zem4AS+r/Hg3dH2hBPjN9GpE8
	6DF5xtYVPADHNvvfcY7jmeyUCYFeq17I1+A+CNm36IITL+V4ldKZWypd4eutVkRGjxrU
	jEoVPAUGREtDgZyfjtGkJjqqBVHhZFrSXIOxLaMn/lRIZ5fU/rVnL2Z4rrU93xtZyJdm
	7mQDQE1+y7x+wk8x0m1Vh3ScsbXDSI21wiq6AdxvjwxCGe/qt6Ui4rljX9cd+212UDtI
	zZGw==
X-Gm-Message-State: AOUpUlFtsxNVQgpi+3dOjae1rkj8rOOorNYK4R7LU2DtzOLp2lCcAIyc
	ZJvo9kGBcgcqVw/pmUVf1RKVK6Vi
X-Google-Smtp-Source: AAOMgpc1TnFIcUf1IEGKtFGLOL8RDlRsbwtSZEbqsBiXiY+20L021AHlCZ75xwrnbVVoJmOjMs1YQw==
X-Received: by 2002:a17:902:8e81:: with SMTP id
	bg1-v6mr15479947plb.129.1533596252837; 
	Mon, 06 Aug 2018 15:57:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm11993137pgr.59.2018.08.06.15.57.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 15:57:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 15:57:04 -0700
Message-Id: <d20cdb156db645ea59a53da6e0009de4b3d13e7c.1533595822.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533595822.git.raj.khem@gmail.com>
References: <cover.1533595822.git.raj.khem@gmail.com>
Subject: [PATCH 07/18] bison: Fix build break with glibc 2.28
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
X-List-Received-Date: Mon, 06 Aug 2018 22:57:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/bison/bison/gnulib.patch | 21 +++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.0.4.bb    |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/bison/bison/gnulib.patch

diff --git a/meta/recipes-devtools/bison/bison/gnulib.patch b/meta/recipes-devtools/bison/bison/gnulib.patch
new file mode 100644
index 0000000000..7eaf0ce0fa
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/gnulib.patch
@@ -0,0 +1,21 @@
+Fix gnulib issues found with glibc 2.28 libio.h removal
+
+see
+https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: bison-3.0.4/lib/fseterr.c
+===================================================================
+--- bison-3.0.4.orig/lib/fseterr.c
++++ bison-3.0.4/lib/fseterr.c
+@@ -29,7 +29,7 @@ fseterr (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+   fp->_flags |= _IO_ERR_SEEN;
+ #elif defined __sferror || defined __DragonFly__ /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin */
+   fp_->_flags |= __SERR;
diff --git a/meta/recipes-devtools/bison/bison_3.0.4.bb b/meta/recipes-devtools/bison/bison_3.0.4.bb
index 58728f5021..cc155f0fbe 100644
--- a/meta/recipes-devtools/bison/bison_3.0.4.bb
+++ b/meta/recipes-devtools/bison/bison_3.0.4.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://dont-depend-on-help2man.patch.patch \
            file://0001-src-local.mk-fix-parallel-issue.patch \
            file://add-with-bisonlocaledir.patch \
+           file://gnulib.patch \
 "
 
 # No point in hardcoding path to m4, just use PATH
-- 
2.18.0


