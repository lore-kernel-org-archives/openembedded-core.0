Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1678C7D58A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 03:53:03 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id d126so632689pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2019 20:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oyLni5wH7x301OBizNqyIpTnmma64SsXJOtWb7XYsjE=;
	b=dkNtbR0a2mNUemUI4MW0NEqLxeSCNwcCkjelh8qaIe40uQ3hxDxxrUWMWyW27vac7s
	6d+RJOni2nS7lX34i9aSp/5MUdkMAlcvkMou1faSQ44IXNb6kOkgqxsvEcRv4AIxrCvc
	zw3ujSdbvJGU1CPmbQu/XpzOUfhnwUCu6tPzm8vAB3/yV36DnWcLqGzXajQvfQgqUmaw
	8CHMYGc60i5HXJ4KtCwOvKpfpcMQPHCxuLYJSsTrJjh8HTv4ymcjELevzcgyhjc8LC+B
	jazxw/DU7BpLVh5rTF5i4p/U+pNmwZ3LGT9YBIgDLJQNT9J6Wiefkus65R5MI3D3Rn+p
	sc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oyLni5wH7x301OBizNqyIpTnmma64SsXJOtWb7XYsjE=;
	b=HSZZE3nrEOykSEGizkIUykmILnmqHwztbzAMoaYqSwN9clBzeCfq9l2utpFLSPH/N6
	lvoOjrQ18NmCZ2EXP4vfcnqT4MueZOJLwCzZnH2U3Z8R/iDU07Zgs+9XulrUiIENRxSp
	gq5gCVTULX5tmw9iiVtICmb2nUfr7+vKne9Jf+cfeTfvnzB9MC74RYY79vz3sHaNFjNy
	r9zYsoSfZxvz3GyatMyOaACfJgZ7NnfAbG1jSCtsPhESys1Cb5yVyaFiSKMUZfVGYw9e
	xeBfLKkI/+tTAhj/9E7916YP0hlFsq0jbsPMvS+MKTxy9tBKJ7HVCuyd8BjZrZpu/G9v
	aqAA==
X-Gm-Message-State: APjAAAX313+cuM7Ts5akJw/t7lX3TRsdup75k3S6JIyiKB/JSIb+KiuL
	CpnhYuc+k88GRVMzN2IMr2GzBaPL
X-Google-Smtp-Source: APXvYqyA3IukxZGt/emkHomQ7HDYePSjuK5iqiq5ZRcM+0y+n2c/3m5cGUjGNwlVXe/s1YY9Pxy6Pg==
X-Received: by 2002:a63:4e07:: with SMTP id c7mr1333820pgb.350.1559793185065; 
	Wed, 05 Jun 2019 20:53:05 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:649f:275:809c:24d6])
	by smtp.gmail.com with ESMTPSA id i5sm448743pfk.49.2019.06.05.20.53.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Jun 2019 20:53:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2019 20:53:01 -0700
Message-Id: <1559793182-529-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559793182-529-1-git-send-email-akuster808@gmail.com>
References: <1559793182-529-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH 2/3] wget: Security fix for CVE-2019-5953
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
X-List-Received-Date: Thu, 06 Jun 2019 03:53:04 -0000

From: Armin Kuster <akuster@mvista.com>

Source: http://git.savannah.gnu.org/cgit/wget.git
MR: 89341
Type: Security Fix
Disposition: Backport from http://git.savannah.gnu.org/cgit/wget.git/commit/?id=692d5c5215de0db482c252492a92fc424cc6a97c
ChangeID: 1c19a2fd7ead88cc4ee92d425179d60d4635864b
Description:

Fixes CVE-2019-5953
Affects: < 1.20.1
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-extended/wget/wget/CVE-2019-5953.patch | 51 ++++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.19.5.bb          |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2019-5953.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2019-5953.patch b/meta/recipes-extended/wget/wget/CVE-2019-5953.patch
new file mode 100644
index 0000000..e43e8e5
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2019-5953.patch
@@ -0,0 +1,51 @@
+From 692d5c5215de0db482c252492a92fc424cc6a97c Mon Sep 17 00:00:00 2001
+From: Tim Ruehsen <tim.ruehsen@gmx.de>
+Date: Fri, 5 Apr 2019 11:50:44 +0200
+Subject: [PATCH] Fix a buffer overflow vulnerability
+
+* src/iri.c(do_conversion): Reallocate the output buffer to a larger
+  size if it is already full
+
+Upstream-Status: Backport
+http://git.savannah.gnu.org/cgit/wget.git/commit/?id=692d5c5215de0db482c252492a92fc424cc6a97c
+CVE: CVE-2019-5953
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/iri.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+Index: wget-1.19.5/src/iri.c
+===================================================================
+--- wget-1.19.5.orig/src/iri.c
++++ wget-1.19.5/src/iri.c
+@@ -151,8 +151,11 @@ do_conversion (const char *tocode, const
+   *out = s = xmalloc (outlen + 1);
+   done = 0;
+ 
++  DEBUGP (("iconv %s -> %s\n", tocode, fromcode));
++
+   for (;;)
+     {
++      DEBUGP (("iconv outlen=%d inlen=%d\n", outlen, inlen));
+       if (iconv (cd, (ICONV_CONST char **) &in, &inlen, out, &outlen) != (size_t)(-1) &&
+           iconv (cd, NULL, NULL, out, &outlen) != (size_t)(-1))
+         {
+@@ -187,11 +190,14 @@ do_conversion (const char *tocode, const
+         }
+       else if (errno == E2BIG) /* Output buffer full */
+         {
++          logprintf (LOG_VERBOSE,
++                    _("Reallocate output buffer len=%d outlen=%d inlen=%d\n"), len, outlen, inlen);
+           tooshort++;
+           done = len;
+-          len = outlen = done + inlen * 2;
+-          s = xrealloc (s, outlen + 1);
+-          *out = s + done;
++          len = done + inlen * 2;
++          s = xrealloc (s, len + 1);
++          *out = s + done - outlen;
++          outlen += inlen * 2;
+         }
+       else /* Weird, we got an unspecified error */
+         {
diff --git a/meta/recipes-extended/wget/wget_1.19.5.bb b/meta/recipes-extended/wget/wget_1.19.5.bb
index e37d8c7..920b74d 100644
--- a/meta/recipes-extended/wget/wget_1.19.5.bb
+++ b/meta/recipes-extended/wget/wget_1.19.5.bb
@@ -1,6 +1,7 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0002-improve-reproducibility.patch \
+           file://CVE-2019-5953.patch \
           "
 
 SRC_URI[md5sum] = "2db6f03d655041f82eb64b8c8a1fa7da"
-- 
2.7.4


