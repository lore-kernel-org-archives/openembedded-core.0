Return-Path: <joel.stan@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0E59978D6E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 05:10:54 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id x5-v6so6569190pgp.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2018 22:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=F6f0T68fz6kwJN5cIMEJSp5V15yCSkdj0dZl6SrGQwo=;
	b=vgWb2gzkkPNFOtDgoPIBiQz3BTSUFcceEvLW6sYpT1sRN1DVUv3BQ575A8AnM9OKs6
	y/lZ4G6QR3XWkcgeCn5EZHY0iT7x96tSzRlTz2V1ACN3WpDHFxaX7jou0Z1VR5EwlTjh
	FXi9zVMBhC3nNYpLiWItwAZAarcbd5cO6aFku0pr3n+/a+Wj0AmiEetsLf3jNCQEUTMx
	JXGHmTajGqCzcK6GbGr1xa6lxxWMe04tloWv0u2QKQFHtDeqCGzPbu67A7SO/pBjWes+
	+UzSO5dP10YylcLX4RLBFc67nuk7V8wXvI/fI6fkAn4QuQKn7Jdu8RCrGXvQhplq5aHB
	jcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=F6f0T68fz6kwJN5cIMEJSp5V15yCSkdj0dZl6SrGQwo=;
	b=eNC0pCh42jTQ1o+H/mttGMZCrKqLE3+HsbZm9dOuyoW2x92ROemK6SkHizEirK53jx
	wx8zGjTFyr4RCo6B6Yhav4t0DAPCNxY16q+jNaBUnVHuQk2cFHFgPAOchg9qHR/qMx5y
	ddZvOD/PLKSQEKC+CiXCeHIZS9ZXlB8CFtXa0XEcc4M3EILVp6Dsy/GmsDTAKArzzaju
	sLqVJPAiHu+qtTaeljfpmPCkv+wg9iloZz8YokgG51z3M9BqY1Q1LNuKTgWk8ugGWf0Z
	86161pUlUyiyZHyfXj6lKuobJovEK6yw5Xxfi1f0kkWKb5o+1B8uRCG00VaePVmhtr/4
	BeQA==
X-Gm-Message-State: AOUpUlHKfD+APQB2pBmIFx5ruZTqYH3h1cRNNgO5xd2Qy1jmyBZPxA8t
	hBpbW3SME1xzZvQBgK9zUbiofu0K
X-Google-Smtp-Source: AAOMgpc2AsgSkEPaOa9Zv0CZBTpDZI/10esowXAPJ7gERx6ke9mqp91gPMt3QOD9WIy8Rju2Dbo+aw==
X-Received: by 2002:a63:1a20:: with SMTP id
	a32-v6mr14997953pga.446.1532927455674; 
	Sun, 29 Jul 2018 22:10:55 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	b67-v6sm16153689pfd.74.2018.07.29.22.10.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 29 Jul 2018 22:10:54 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Mon, 30 Jul 2018 14:40:50 +0930
From: Joel Stanley <joel@jms.id.au>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2018 14:40:28 +0930
Message-Id: <20180730051029.5530-2-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180730051029.5530-1-joel@jms.id.au>
References: <20180730051029.5530-1-joel@jms.id.au>
Subject: [PATCH v2 1/2] gcc-7.3: Fix build on ppc64le hosts
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
X-List-Received-Date: Mon, 30 Jul 2018 05:10:55 -0000

When building on ppc64le hosts that have GCC 8 (such as Ubuntu 18.10)
the GCC build bootstrap fails.

 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=86162

This is a fix that was applied to the upstream GCC 7 branch.

Change-Id: I7796d2a999ec420805dd1c6cf0a1ecba1de5a897
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 meta/recipes-devtools/gcc/gcc-7.3.inc         |  1 +
 ...c64le-build-Partial-backport-r256656.patch | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-ppc64le-build-Partial-backport-r256656.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
index b816f7d12f81..81320dc52a59 100644
--- a/meta/recipes-devtools/gcc/gcc-7.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
@@ -79,6 +79,7 @@ SRC_URI = "\
 BACKPORTS = "\
            file://0001-Fix-internal-compiler-error-in-testcase.patch \
            file://0001-PR-rtl-optimization-83030.patch \
+           file://0001-Fix-ppc64le-build-Partial-backport-r256656.patch \
 "
 
 SRC_URI[md5sum] = "be2da21680f27624f3a87055c4ba5af2"
diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-ppc64le-build-Partial-backport-r256656.patch b/meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-ppc64le-build-Partial-backport-r256656.patch
new file mode 100644
index 000000000000..122260f2bf1d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-ppc64le-build-Partial-backport-r256656.patch
@@ -0,0 +1,36 @@
+From aa65a43516da1d48011ef621ed5988289711d99b Mon Sep 17 00:00:00 2001
+From: marxin <marxin@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 29 Jun 2018 09:31:30 +0000
+Subject: [PATCH] Partial backport r256656
+
+2018-06-29  Martin Liska  <mliska@suse.cz>
+
+	Backport from mainline
+	2018-01-10  Kelvin Nilsen  <kelvin@gcc.gnu.org>
+
+	* lex.c (search_line_fast): Remove illegal coercion of an
+	unaligned pointer value to vector pointer type and replace with
+	use of __builtin_vec_vsx_ld () built-in function, which operates
+	on unaligned pointer values.
+
+Upstream-Status: Backport
+---
+ libcpp/lex.c  |  2 +-
+ 1 files changed, 1 insertions(+), 1 deletion(-)
+
+diff --git a/libcpp/lex.c b/libcpp/lex.c
+index 097c78002cbb..e0fb9e822c44 100644
+--- a/libcpp/lex.c
++++ b/libcpp/lex.c
+@@ -568,7 +568,7 @@ search_line_fast (const uchar *s, const uchar *end ATTRIBUTE_UNUSED)
+     {
+       vc m_nl, m_cr, m_bs, m_qm;
+ 
+-      data = *((const vc *)s);
++      data = __builtin_vec_vsx_ld (0, s);
+       s += 16;
+ 
+       m_nl = (vc) __builtin_vec_cmpeq(data, repl_nl);
+-- 
+2.17.1
+
-- 
2.17.1


