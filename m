Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3B3F532D6
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 05:02:55 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13326.1774328568359693008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 22:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DVfZF0Al;
 spf=pass (domain: mvista.com, ip: 74.125.82.172, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so2863759eec.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 22:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774328568; x=1774933368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XtL9N0JVLAVmbhPZbtqQNwxOxLnV47mdvWylCe/s4uU=;
        b=DVfZF0AlbQyVEbR8VJ0AOollUM+d3a/k7FfUkwAwHzYaXGX1ZWGXsy9QIZuBm5LxU/
         k9oIWtU5fuHnimGuGLt/VX1qt1rDYy7ObvEKZqnVnVwMwzzDdvihfwAx8RjBDWTfheMd
         529nJeOoJ9Qxj8tt8FyR8rsc9BvQ9rIU7BHuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774328568; x=1774933368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtL9N0JVLAVmbhPZbtqQNwxOxLnV47mdvWylCe/s4uU=;
        b=a1R0JvsLd3txim8Us0nrRW1mmKA9G3D58vZ8qJc8EZVs9v1OAgAXH79WmMoM2MJw50
         qBxNPXHDMW0KuaZvWdgHkCNP6byQwCXqILvumzMxDVoWo7ZdqH8/KPmY7BzZ+zbG/eHs
         1bL04Mv6i6cIBvQwseoBgRqiuHHVPeOFJ5vuwPEXlumhefZ6E/8Qx5zNmFuka+FMuYMf
         T++1+0v1kW0Mc7tCwHINUZ1VeWCZomDSRCTcT3UfwwLvtJ8owI6KZr+USk+7dKguxFmo
         qpeypudVXzMsLt5IbagZfAX9y++gT2Uj5j4A2wf9oUTfpwajhCPg9KAgnYE3zZHKI36l
         ioKw==
X-Gm-Message-State: AOJu0YxNY2tJbgpbfSjweah7vNyeLuv/S9c8lgOjPAxhgWBoC5BIHO29
	cToThVtsCMomoVm/FmcmpcRN5sp+sREqmjGZR3NiKz4CkJSUzWaaIqOhbNQMpPZjSEdM5LRZJA6
	XBTvi
X-Gm-Gg: ATEYQzx5jy5yG2c/ytcvnAJwzOjp9kAJmdr3tyUXKgVt0cp2uFnMBSTEcsl5FmaGETV
	4CsXZXA6YEVXln/oDGHcu+DqUu0UzNOtDFSxGgGDn6TTw0B+I4JqcsVASAxweg2z/+gF0ndVIN8
	+5GgKs2lrjNrX0Y1IjkkxJngSeSrIEu/9PIYeXHc1rlcx3yWqBjTHmJhX3JJ6cG10dgSZX40stL
	b3GQ/8STPXygZssHHCepLwNDPAwpv6kQMQYPnTlbsSU+9ZHhCIqqnooYxuXnsh045i9C/EAUSH4
	fqflDIEj1Uktah+V0wrXPJ12q3y7EmYB5RY46UQK3TA58WcH5aQ82FSXA10R1vqimKjp9PJsPQB
	a5d98WslGyF275nX5iaDJvzxshnelDvRluq0kqVy29+eV6/U2L6WZvgw5YZtBVvTwdT5SBwHaYB
	JqPafUD29lRnw4vU2IJLIZjPCpuUH9SSMEWYmgVLwJ5ZPCw9w=
X-Received: by 2002:a05:7300:e788:b0:2c0:dea7:a03 with SMTP id 5a478bee46e88-2c1097ab203mr6065381eec.32.1774328567478;
        Mon, 23 Mar 2026 22:02:47 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10aefd778sm19200254eec.0.2026.03.23.22.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:02:47 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] libxml-parser-perl: fix for CVE-2006-10003
Date: Tue, 24 Mar 2026 10:32:27 +0530
Message-ID: <20260324050227.41834-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 05:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233773

Pick patch from [1].

[1] https://security-tracker.debian.org/tracker/CVE-2006-10003

More details :
https://nvd.nist.gov/vuln/detail/CVE-2006-10003

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libxml-parser-perl/CVE-2006-10003.patch   | 73 +++++++++++++++++++
 .../perl/libxml-parser-perl_2.47.bb           |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch b/meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch
new file mode 100644
index 0000000000..e9a4b692d2
--- /dev/null
+++ b/meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch
@@ -0,0 +1,73 @@
+From 08dd37c35ec5e64e26aacb8514437f54708f7fd1 Mon Sep 17 00:00:00 2001
+From: Toddr Bot <toddbot@rinaldo.us>
+Date: Mon, 16 Mar 2026 22:16:11 +0000
+Subject: [PATCH] fix: off-by-one heap buffer overflow in st_serial_stack
+ growth check
+
+When st_serial_stackptr == st_serial_stacksize - 1, the old check
+(stackptr >= stacksize) would not trigger reallocation. The subsequent
+++stackptr then writes at index stacksize, one element past the
+allocated buffer.
+
+Fix by checking stackptr + 1 >= stacksize so the buffer is grown
+before the pre-increment write.
+
+Add a deep nesting test (600 levels) to exercise this code path.
+
+Fixes #39
+
+Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
+
+CVE: CVE-2006-10003
+Upstream-Status: Backport [https://github.com/cpan-authors/XML-Parser/commit/08dd37c35ec5e64e26aacb8514437f54708f7fd1]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ Expat/Expat.xs   |  2 +-
+ t/deep_nesting.t | 22 ++++++++++++++++++++++
+ 2 files changed, 23 insertions(+), 1 deletion(-)
+ create mode 100644 t/deep_nesting.t
+
+diff --git a/Expat/Expat.xs b/Expat/Expat.xs
+index dbad380..f04a0cf 100644
+--- a/Expat/Expat.xs
++++ b/Expat/Expat.xs
+@@ -499,7 +499,7 @@ startElement(void *userData, const char *name, const char **atts)
+     }
+   }
+ 
+-  if (cbv->st_serial_stackptr >= cbv->st_serial_stacksize) {
++  if (cbv->st_serial_stackptr + 1 >= cbv->st_serial_stacksize) {
+     unsigned int newsize = cbv->st_serial_stacksize + 512;
+ 
+     Renew(cbv->st_serial_stack, newsize, unsigned int);
+diff --git a/t/deep_nesting.t b/t/deep_nesting.t
+new file mode 100644
+index 0000000..8237b5f
+--- /dev/null
++++ b/t/deep_nesting.t
+@@ -0,0 +1,22 @@
++BEGIN { print "1..1\n"; }
++
++# Test for deeply nested elements to exercise st_serial_stack reallocation.
++# This catches off-by-one errors in the stack growth check (GH #39).
++
++use XML::Parser;
++
++my $depth = 600;
++
++my $xml = '';
++for my $i (1 .. $depth) {
++    $xml .= "<e$i>";
++}
++for my $i (reverse 1 .. $depth) {
++    $xml .= "</e$i>";
++}
++
++my $p = XML::Parser->new;
++eval { $p->parse($xml) };
++
++print "not " if $@;
++print "ok 1\n";
+-- 
+2.50.1
+
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
index 803164f713..6a36b763a8 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
@@ -8,6 +8,7 @@ DEPENDS += "expat"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/T/TO/TODDR/XML-Parser-${PV}.tar.gz \
            file://0001-Makefile.PL-make-check_lib-cross-friendly.patch \
+           file://CVE-2006-10003.patch \
            "
 
 SRC_URI[sha256sum] = "ad4aae643ec784f489b956abe952432871a622d4e2b5c619e8855accbfc4d1d8"
-- 
2.50.1


