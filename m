Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524EFCD98FB
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:45:40 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10388.1781682331838765260
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bBCvxLTY;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-462cdb88d01so173072f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682330; x=1782287130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DSvP/NvN1t3/9H433a5MGzhTzF836fHRYB0mpjq3vhs=;
        b=bBCvxLTYUNIToRrZrril1XsW+QxPL/JTGMe3q0ex54Banarn1Abdqd+64jlONGr9gX
         7lqSnRmLKhPUGR4t0x7lYkVUVUS4oYsd2LL2c4hHKa8wYhD7VIQEz4QzI/i+m9H3Ige9
         r8wkx577vk1XhzN3ZrKA+PVFBlu2VuCuRj1/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682330; x=1782287130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DSvP/NvN1t3/9H433a5MGzhTzF836fHRYB0mpjq3vhs=;
        b=MYpWvMgFq3DohXMpGJwN7rxO+Xu6YS6R46nd2RK5uCELS9mi6X4WKNxYJKIqhx9LqP
         CbIM+g+sYoF5FfkjDUxGl+FaDROHK5WD32RPqTAppXbXr/bLKc9Za1Tg7hETX4OUlPqn
         ZyurUFbeJYUs4Xf9F6q1gmq4G+pMnemstaZqJkvMZR/5mwi0iojB9m7y4leOViMHgvUQ
         nkziTVC3K9Y5MgpxNdUJWWWIki+Ok0BTHGdwib+/ezrClOkMjwI8fd5s7K3ZswhICbmQ
         28ZUQqvYV98vPjr8a1jxsGrJQeYKtp1bHMnhOSOg3grcwMehQvGIF765VUM9s+ORsVgz
         Apeg==
X-Gm-Message-State: AOJu0YztfrPHYmY9NAEyAqg5ojXgLaCKZ509WD6QRCREOmut7b6yx/K1
	oXOzKD2GS0hkS78OCpLo3nJ1NSV0JJmMbS++dXYuPlH6OOpGL1DUC9vkfCrSKiVY+dVC7feaCdF
	rDypG
X-Gm-Gg: AfdE7ck+a/HVU8X+HQ9qXprqhorlxqpGSQuBGBe0BjVRw5NfgdNEcB3fur0OlgIclL2
	mo40EDWbx2FiF6EuqCFfgRObGibmJXBu7v5jyfAYJMKKI1qhD8miit73gY0lRJGTCvehDz1Qcqw
	USVBzMMdCJEaDh3lgSOLj6QDdw2pHrvHS08Slbirs1o+tKY60rdIdCC7ZjJ8rFDXfzI9J5bspOX
	KQ/jxv+GT+PeAz26pzl6O3uZA/iBT48rq/X06NJW6elYvnsNa2GDOGf8+HdUxKGb7M/32/BUqjE
	zvpRpc9ou205D/OoXyOTS/zYNDRI2JRn8N4tf8MZ6G+/SdJmAO6BC0X1k6eGY0kn76+pw5UQQ06
	URoNd5pkr5gywNxbdW9rXZ8o5uNS1GKX+/62iF9tvQsAQft2epykr5I0N3f+gUicBrCKmt/I0RM
	CEZuTW0JZF0MhLVT9oaYpofIBo+NMKFxNw06cSvzWXDWNJZcg0hlN423Wi664CMG2noTzj4bV/n
	jlQ/Ro8TRZdXrmFzOocKAt80AKQ
X-Received: by 2002:a05:6000:603:b0:463:1d06:ab33 with SMTP id ffacd0b85a97d-4631d06ab96mr206160f8f.27.1781682330101;
        Wed, 17 Jun 2026 00:45:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619b9b7750sm23483215f8f.6.2026.06.17.00.45.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:45:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/30] libxml-parser-perl: fix for CVE-2006-10003
Date: Wed, 17 Jun 2026 09:44:42 +0200
Message-ID: <2abf26e7551a8a306d6aaabc9653f655f66b15a1.1781682189.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:45:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238989

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1].

[1] https://security-tracker.debian.org/tracker/CVE-2006-10003

More details :
https://nvd.nist.gov/vuln/detail/CVE-2006-10003

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libxml-parser-perl/CVE-2006-10003.patch   | 73 +++++++++++++++++++
 .../perl/libxml-parser-perl_2.47.bb           |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch b/meta/recipes-devtools/perl/libxml-parser-perl/CVE-2006-10003.patch
new file mode 100644
index 00000000000..e9a4b692d2d
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
index 803164f713d..6a36b763a83 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.47.bb
@@ -8,6 +8,7 @@ DEPENDS += "expat"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/T/TO/TODDR/XML-Parser-${PV}.tar.gz \
            file://0001-Makefile.PL-make-check_lib-cross-friendly.patch \
+           file://CVE-2006-10003.patch \
            "
 
 SRC_URI[sha256sum] = "ad4aae643ec784f489b956abe952432871a622d4e2b5c619e8855accbfc4d1d8"

