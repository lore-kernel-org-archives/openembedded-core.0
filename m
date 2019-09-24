Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8D3247E507
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 12:09:06 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n14so1647913wrw.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 05:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=K4qwo4oyBlgxWB+WStSU3AFy2bP2/QdGDQQNLEKw8bw=;
	b=QovnRow4BCpvlDXqWYzPtZ4bvVofOnoFDKdEu62uYHAW1uidE+qTc03yau4+OBenG8
	nYqJ8+uvqYl9I/ENkvgR/UBisgoh1iLkUXxye+G33MNXqPVXxxHF12G2e013hXxFjMk/
	ltuvRYepRTmPnWp7/xoyKh3rJPVrKWLklcTFI5Izr+P4x+u+Nbjsdn04a/oV2YWdeci9
	9lAuufOg3PulYtZkoFeJo4/xZV0AAMAvDj0mvGbp+GSVDIO1RtQmYiItg3XiCKaa+AbH
	0q/7K6rHkDgGePgq7Rg2KDM51VgwZblIflBJR3q6uydwqOzPyHU7F3lSpVZBJyYtP3r/
	Y9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=K4qwo4oyBlgxWB+WStSU3AFy2bP2/QdGDQQNLEKw8bw=;
	b=F37pxDeZsPY3hqYOHlT8pNm63s18/Tc4SHD/LURcRFEBb6C50NmJEGvAzip4kbaTvt
	CXeMysAbVN1zIVMkyfuMGU3VKte3iBBjzpMKSF53S4AJw+Te5SKl0lKl9EmWW3+z5rB2
	8c/LetvSrrDdE1qZpTlW/DNVunDksZY8/Fz7vcJGTS+3oz+DrW7l4AV5+kFgRl2pvDS0
	YeybHpMCKJd8+7sakwQ5uYjHzZDdLDtCk+zRPDbnxCkf2tSsevCFRQyAf7HV7h/FUFfQ
	YkG30YFWQWXYvFDUbiGykoNhizg4vfRQt2rokCgfmYr13PBxd13ERuvZTupfb0//oAmI
	45CA==
X-Gm-Message-State: APjAAAWn0mjTR9yDx8OizhKPyCFhy3xDHtCNoaS182+a6C1hZvNp1GKP
	W5yjXENlwH1VfEbn6iO/1hK8NUci
X-Google-Smtp-Source: APXvYqyCwXbyZYY7ZB+wLaIQIHiVa0GXBPvx2Ne2I2OxlJIjSbszw3Pi/fVydOChHDxWpMszLU6/4Q==
X-Received: by 2002:a5d:5381:: with SMTP id d1mr456305wrv.315.1569326947211;
	Tue, 24 Sep 2019 05:09:07 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	q66sm3110466wme.39.2019.09.24.05.09.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 05:09:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2019 14:08:48 +0200
Message-Id: <20190924120848.25479-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190924120848.25479-1-schnitzeltony@gmail.com>
References: <20190924120848.25479-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [sumo][PATCH v2 4/4] cross-localedef-native: Fix build for hosts with recent glibc
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
X-List-Received-Date: Tue, 24 Sep 2019 12:09:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes:
| argp-help.c:(.text+0x1f51): undefined reference to `_IO_fwide'
| collect2: error: ld returned 1 exit status
| make: *** [Makefile:60: localedef] Error 1

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../glibc/cross-localedef-native_2.27.bb      |  1 +
 ...ll-_IO_fwide-if-_LIBC-is-not-defined.patch | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0032-argp-do-not-call-_IO_fwide-if-_LIBC-is-not-defined.patch

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
index 5e92eb71d55..a999d35201a 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.27.bb
@@ -35,6 +35,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-eglibc-Install-PIC-archives.patch \
            file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
+           file://0032-argp-do-not-call-_IO_fwide-if-_LIBC-is-not-defined.patch \
            file://archive-path.patch \
 "
 # Makes for a rather long rev (22 characters), but...
diff --git a/meta/recipes-core/glibc/glibc/0032-argp-do-not-call-_IO_fwide-if-_LIBC-is-not-defined.patch b/meta/recipes-core/glibc/glibc/0032-argp-do-not-call-_IO_fwide-if-_LIBC-is-not-defined.patch
new file mode 100644
index 00000000000..edeb27da0c1
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0032-argp-do-not-call-_IO_fwide-if-_LIBC-is-not-defined.patch
@@ -0,0 +1,78 @@
+From 3a67e81d7527363a96af095a5af03b6201b82e9d Mon Sep 17 00:00:00 2001
+From: Charles-Antoine Couret <charles-antoine.couret@essensium.com>
+Date: Thu, 29 Nov 2018 17:56:55 +0000
+Subject: [PATCH] argp: do not call _IO_fwide() if _LIBC is not defined
+
+_IO_fwide() is defined in libio.h file. This file is included only
+when _LIBC is defined.
+
+So, in case of compilation of these files without _LIBC definition,
+the compilation failed due to this unknown function.
+
+Now this function is called when libio.h file is included.
+
+(Change merged from gnulib.  Tested on x86_64.)
+
+	* argp/argp-fmtstream.c (__argp_fmtstream_update): Use [_LIBC]
+	conditional on calls to _IO_fwide and putwc_unlocked.  (Merge from
+	gnulib.)
+	* argp/argp-help.c (__argp_failure): Likewise.
+	
+Upstream-Status: Backport [1]
+
+[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=3a67e81d7527363a96af095a5af03b6201b82e9d
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ ChangeLog             | 7 +++++++
+ argp/argp-fmtstream.c | 4 ++++
+ argp/argp-help.c      | 2 ++
+ 3 files changed, 13 insertions(+)
+
+diff --git a/argp/argp-fmtstream.c b/argp/argp-fmtstream.c
+index e43a0c7cf1..e9e4c0e5cc 100644
+--- a/argp/argp-fmtstream.c
++++ b/argp/argp-fmtstream.c
+@@ -149,9 +149,11 @@ __argp_fmtstream_update (argp_fmtstream_t fs)
+ 	      size_t i;
+ 	      for (i = 0; i < pad; i++)
+ 		{
++#ifdef _LIBC
+ 		  if (_IO_fwide (fs->stream, 0) > 0)
+ 		    putwc_unlocked (L' ', fs->stream);
+ 		  else
++#endif
+ 		    putc_unlocked (' ', fs->stream);
+ 		}
+ 	    }
+@@ -312,9 +314,11 @@ __argp_fmtstream_update (argp_fmtstream_t fs)
+ 	      *nl++ = ' ';
+ 	  else
+ 	    for (i = 0; i < fs->wmargin; ++i)
++#ifdef _LIBC
+ 	      if (_IO_fwide (fs->stream, 0) > 0)
+ 		putwc_unlocked (L' ', fs->stream);
+ 	      else
++#endif
+ 		putc_unlocked (' ', fs->stream);
+ 
+ 	  /* Copy the tail of the original buffer into the current buffer
+diff --git a/argp/argp-help.c b/argp/argp-help.c
+index 2b6b0775d6..a17260378c 100644
+--- a/argp/argp-help.c
++++ b/argp/argp-help.c
+@@ -1873,9 +1873,11 @@ __argp_failure (const struct argp_state *state, int status, int errnum,
+ #endif
+ 	    }
+ 
++#ifdef _LIBC
+ 	  if (_IO_fwide (stream, 0) > 0)
+ 	    putwc_unlocked (L'\n', stream);
+ 	  else
++#endif
+ 	    putc_unlocked ('\n', stream);
+ 
+ #if _LIBC || (HAVE_FLOCKFILE && HAVE_FUNLOCKFILE)
+-- 
+2.21.0
+
-- 
2.21.0


