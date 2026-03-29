Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C912FC9812
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:38:19 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38383.1774823893781486595
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KwvHSxye;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43cf3ee0fc1so744802f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774823892; x=1775428692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DSvP/NvN1t3/9H433a5MGzhTzF836fHRYB0mpjq3vhs=;
        b=KwvHSxye8z1GmLBvbjUwsYcHSUDX43Fy0UVvRbfaupbGf+pKuGFJqrMOW1zeNFh85B
         4qspu9Y35pss0GJxBDYcqqWxQv6PtiB7S+DeaCuFePPcIzuQMeysFymPEEBRKD2088Z/
         fvqVgtdJ3MsGPuh1PvU7YhcnlYou01IlTj8Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774823892; x=1775428692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DSvP/NvN1t3/9H433a5MGzhTzF836fHRYB0mpjq3vhs=;
        b=lhFaz3cOGlQio7GOKXHGgE7jxbFBAzeWRQDXgDERuFzmiGap1GYtAPSyip9hODT58N
         bqNUQAZhOl9HFod6u2vKCvVwpvqpaD/ia8fdIHZfReksrxoBMqb5hb4d7eewLVKwpHhP
         YmtKnWqZBzVr/dTEf6xiQAu1ie3n3Ghp5EPfEHB3Rdsk6iNugVHXhS3xqsx3CZocJzKs
         0verPkpvY7v2QR3tniH1YcbniGXjbD3ZqFhZ0PMBMANs8GxpN8j9bDLmav/pUiOEWa25
         OQzwdWsWeTNrBSekjD+ofEv3qaKm3gzdW8Usb/jAsoKJ4GqMil2oX4hzzK0jmbkk8rKn
         xAhA==
X-Gm-Message-State: AOJu0YyhCNlF19u/c3eDJnofPZwUHv2dk3LbSfht05KIfGJq84eAd7wX
	/xYmaRgRyBNO+PqKHhST+sWISPGVh7smTbm4hstAg4CFo+OMwMz/Y2RQiTltMddeIJPMUDvCOBY
	EkPDa/jo=
X-Gm-Gg: ATEYQzx1GZLfF92WxTJdTGRINizhmvumDYHphA4Jrlvne2aWYaiWGurAxQWLd/3khTF
	iyXOigWv66Kby318tmtcw0imEPZDGKPYOAnyPIBZcjF4VBjzoXJJvMEp3WIvs0eUWvT6ZQVkITh
	sxKIQhLdV1Lodf9G4Vm5cMktn/VbzqnjzI+xpkuENWNjA4QYRwJNXCl5pGqHoGrGbDzYYQsXTrd
	lBD6YjxPxAui8Aar+OhfbPzWAuUFX2cGQpCcjZ4XNowhFYPR5mQ1es+VLhV/wP6i9apVlKqu0+l
	uxrkYrBXn7EP0era9Bz14RsFN7I1IsuehVq/pEKEDNUMzN89QJ1i7YnjSUYL+Nv+2IowYTJ02X5
	iOQeeRNAwcHzJXiAq0vJKUJMjgDJXYPaGxBK6qORz+T2YcgIoBvgRzAOKVZXR6m9AZ/SlZ8MnZ8
	l+kFKDVzn2/mzMHpoCoFgBmgYeD9TySvUrxqlthlZITqoprUVUjnmWY8J9do4R0gQcRuhlkepLK
	IR8wkdzl1XzdsLIMXqw9LCCL7w=
X-Received: by 2002:a5d:5d81:0:b0:43a:4e0:1774 with SMTP id ffacd0b85a97d-43b9eb10f60mr18264485f8f.16.1774823891947;
        Sun, 29 Mar 2026 15:38:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm13038542f8f.29.2026.03.29.15.38.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:38:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/16] libxml-parser-perl: fix for CVE-2006-10003
Date: Mon, 30 Mar 2026 00:37:46 +0200
Message-ID: <3841818496f190e76351efeb38c6427c03977cd8.1774823430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774823430.git.yoann.congal@smile.fr>
References: <cover.1774823430.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234172

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

