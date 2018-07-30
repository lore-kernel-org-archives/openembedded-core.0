Return-Path: <joel.stan@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6E09978D56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 04:42:16 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id y4-v6so6525396pgp.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2018 21:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=caA7v7h9d67aCcrbng+ADP5UAw8/Xtig69vzXzWOxhM=;
	b=l92H4D4RAyrinQt+8VBY+Kfpwui2nctunkm7wXz52cSt7NomtddqJYPLX+qFJqIYUW
	cX2XiyFLfS+JPXWqvsWtZnIucVIs1JoPNV2CmAqy+tpSVd/6pLBIg/jds1QXNz6A89D1
	GwieNBsE4bhNRw28ubkYbl3WqPYo9YzKbQVHiGtY5/CL7FexCEHDsNV7OwnFYG7xPmMw
	To/2RQCG1DRKQE1xeiR24LnJrc9Jm9X1uK95uXnCadQNVAs6gy+i3jhcEs/NEPGz2asn
	mJE7VNkD3xSlOcsRYxlzsRqdTLJGAE3LRpw8mhNUg5SziZp+Es9yst8t9KcerWJU8H40
	0quA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=caA7v7h9d67aCcrbng+ADP5UAw8/Xtig69vzXzWOxhM=;
	b=Q2Tx6cgOf90qMkmHgmHXCTX9FzysgzyI9V+jJVH70Kjulf+iq8gkstMbsnHdbSW7u5
	dFBEHQHtwSSExk747oqKUrWEouAYdL4SyfyTCH830oehNOg+6+YLPt98xoZAqSDxLC6i
	yVNOD7f2rqufvr7ZeMxQWf+0rubJj/2tgTj1LPquvLeQOWuCn6IneisrFkXDWGzBaoFy
	4bIqbg2VtgKU/VQ17ythzbZEMv1wKGwdPGc6s0Z0ey633gHTDeqvr9txSTCtAxNTT3W+
	tDF0oXuahdSouNzpIVI1JFNm7HniQadSnZqWbwoVLKF2jJhPEndUvvuQOq+OF3i6k5Ym
	7A8Q==
X-Gm-Message-State: AOUpUlHA2gozwhl4fTC/wYxEYMPYq0APH6wTZdbw+DmFr+2Yr93HZimy
	8RGxXswXg/s/lIzhszF+du/+4yHs
X-Google-Smtp-Source: AAOMgpfWr32h2IOkDEaYaJZybTC7MjAUmriSspnyRC/SGm9DV78HoPKfai8T6L6Lg6hxJaVoremHMw==
X-Received: by 2002:aa7:84c2:: with SMTP id
	x2-v6mr16252048pfn.220.1532925737278; 
	Sun, 29 Jul 2018 21:42:17 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	t12-v6sm14115606pgg.72.2018.07.29.21.42.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 29 Jul 2018 21:42:16 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Mon, 30 Jul 2018 14:12:11 +0930
From: Joel Stanley <joel@jms.id.au>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2018 14:11:59 +0930
Message-Id: <20180730044200.3164-2-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180730044200.3164-1-joel@jms.id.au>
References: <20180730044200.3164-1-joel@jms.id.au>
Subject: [PATCH 1/2] gcc-7.3: Fix build on ppc64le hosts
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
X-List-Received-Date: Mon, 30 Jul 2018 04:42:16 -0000

When building on ppc64le hosts that have GCC 8 (such as Ubuntu 18.10)
the GCC build bootstrap fails.

 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=86162

This is a fix that was applied to the upstream GCC 7 branch.

Change-Id: I7796d2a999ec420805dd1c6cf0a1ecba1de5a897
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 meta/recipes-devtools/gcc/gcc-7.3.inc         |  1 +
 ...c64le-build-Partial-backport-r256656.patch | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
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
index 000000000000..5d8ffb7babca
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-ppc64le-build-Partial-backport-r256656.patch
@@ -0,0 +1,40 @@
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
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch@261621 138bc75d-0d04-0410-961f-82ee72b054a4
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch@262243 138bc75d-0d04-0410-961f-82ee72b054a4
+Signed-off-by: Joel Stanley <joel@jms.id.au>
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


