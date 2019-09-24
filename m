Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B05597E584
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 10:59:43 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 3so1537929wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=K4qwo4oyBlgxWB+WStSU3AFy2bP2/QdGDQQNLEKw8bw=;
	b=Yj1YDV2X5E/RvHU2Bpsmu31u0hJeUdboE/4z8p3Y0NHifCYFC0ooeflFw43EI3oO+n
	Ix4eom/nGW9t2KHK0jMDY6sNw6qxBcL/6NjLuLHBURwCFzD7U+CRiz46w6FGGBBuHoJ5
	hjOtkaZrEBV6jOAiXQwsamGk50bEhPiDkAGbkZ3ThG6i01Tj60Q9xiQ0YcynpzLT2oQL
	7saO5bQ2JXxVmFGE95T2lSyJZeNmCcxiozS1GYQR3XQ44OL6l7Szw2QPBlopy7ni0eMY
	dUn74iVGN12L/6FYcwx+HxRjCRPor5DIIhUewYIEhOYse3g4sbLXDv+SvByhWZ3UxPnN
	Ld0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=K4qwo4oyBlgxWB+WStSU3AFy2bP2/QdGDQQNLEKw8bw=;
	b=CaXImp6/jFzzTNXN0V+BmGmiQU5iSo7iz69gV3N070rTj22jbF2a911fKzQ11hoNMh
	0amqorTKkurDI2RtCuKXbfFVszhL2zqvmu/1tT+0MbKHdckhAIZ1S74uZjJckD48qQRC
	+fgvzApr5aIKt6172Ly319mjs4MESS0uZJxHH6/rjnFrsOBwz+JgWmLBNLksznXKsINe
	atbRBxNJ3rcfzBrbnNLIIuGVVPBgXqvVomlYfW3+afIyRCoQlJA2h+5Ils09egyhhC3H
	TivvB5tSpoydYodz/JEliHO1O0djKVfefe7nkO4PiP+4fEYVq1x+ljj1j1B3DsHe5xnw
	3KDg==
X-Gm-Message-State: APjAAAUX8v3yUWl4AEEo76paGhA4TIW6RsFqI3s7iR86n/0GUCRdeV7E
	i63iljI/EisZElGNuLWiOX1Jv+S0
X-Google-Smtp-Source: APXvYqwsV2zdhnEQF8Ccv3e8QjfEGOw96WforXigPO9NMj8o1kqIm+VsYgQ56N49fyOlkXGR7SvE8Q==
X-Received: by 2002:a1c:cb05:: with SMTP id b5mr2120854wmg.79.1569322784094;
	Tue, 24 Sep 2019 03:59:44 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id n7sm1943753wrt.59.2019.09.24.03.59.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 03:59:43 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2019 12:59:25 +0200
Message-Id: <20190924105925.2287-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190924105925.2287-1-schnitzeltony@gmail.com>
References: <20190924105925.2287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [sumo][PATCH 4/4] cross-localedef-native: Fix build for hosts with recent glibc
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
X-List-Received-Date: Tue, 24 Sep 2019 10:59:44 -0000
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


