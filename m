Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F0CF532E6
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 06:23:26 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13813.1774333401487891531
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 23:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HUUxITc6;
 spf=pass (domain: mvista.com, ip: 74.125.82.172, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b4520f6b32so1086812eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 23:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774333401; x=1774938201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1x+luPat7OLRsy2n2fSz0XgbwqpMq37uE7ayyTp1LLw=;
        b=HUUxITc6wz49PtCdcDYcljsrgAQcHy75MZNt0hfrFsUAehhlyTCskf49YExmYxsvit
         dZeAwpKvw/TnKotVwH1B7Gv4lH+BOdiX/cB3l1TsxdHtvkN6mrhqCwmCtCftOAZsXcSE
         jM4SG8dTlmw+kGC4f+l8bbDuVwKlPIlcmuqQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774333401; x=1774938201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1x+luPat7OLRsy2n2fSz0XgbwqpMq37uE7ayyTp1LLw=;
        b=UXA7SHnAS1h8XC4CfH73OTqSdtPdwcf+fa9J8FHsK7W6fO36GLVoQQ+2IhM+pYi+/h
         +Zn+wgqifx4hq+Oey++5Q+NoCCQYRGeLPrZJKad87R2CesCxnuMyQOw1yC/JutehxwFk
         40nihN1ELYc3wiqritRFpucdgrWjR3SKt8wO2SMlMAX2SBr6Vg/VKTDtm7fM0MZLwYEv
         ETuxiXNjyefgy8vDIk06SA+mT633H+vAtfBelI9JliWgMGECJWK8lhL2WAbHqrgHDDKb
         JLt1qMw7Z8hPXGL330vEixJ4f8fI4UmHbYavVzMMQMS8GXk0j+F9IBRYLyShmfKATSbY
         qDOQ==
X-Gm-Message-State: AOJu0YyplGeXAa/EHjcQUYj/PvlsKnoZpQwuICkjKqxLae0C31QAWR9g
	aawNA+VIRj36oHaxV0DQaLiOpPsJ0a0l4zw+1Zfa57CNl+X00rjKL9UjwHRIUPS6j1GyojyE7Po
	FHtD/
X-Gm-Gg: ATEYQzx+Qj7hN4drSEEa+enUFSOMWYOgTjPFa+UpdjDCAmmv4j3y+8W7UU5cxLEzzcU
	MMPNGMncnNDPhRwQAoCo2e3iscV5v4b4eekV3IfvAuk3a5iZ6lGTHMpZ6UF9Jk7ENN1FGrr5pAC
	ORzEUhqQ2XpxapkJa6yBfGIqQ2KfpYPSf8/R9qdXd5U4tB45rbGWxtt5ON+oyetyKVQvvBtd0d3
	ou3RgW6+6i8cjZNc6elN97374vnWkDFYphucyTHRmd1R5Y3BFKSmR7cpSTL8+K/5an/7c7nBc77
	OyXE6qAjytmDjbyMFw9X28dJxrG9J0kTqKwx4medD5DKv7ugGgRno8c5xE4l/5Z0rC8jA9RwmaL
	rvtH/3/3kNztTWv2coU9zS4syR2JfIVr8q5Ag+DVyxOUI3+HhIcHF2J9DHhquWDcXfJz9xxFNDa
	cBxcnpvwLI3NIV6TDsiLS6MU2Ro8zGTBVuiVf5ANflYYXtVk4=
X-Received: by 2002:a05:7300:cb13:b0:2c1:6ee:a171 with SMTP id 5a478bee46e88-2c1097110demr6822888eec.18.1774333400523;
        Mon, 23 Mar 2026 23:23:20 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b29c757sm14377000eec.18.2026.03.23.23.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:23:20 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] libxml-parser-perl: fix for CVE-2006-10003
Date: Tue, 24 Mar 2026 11:53:04 +0530
Message-ID: <20260324062304.301181-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 06:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233774

Pick patch from [1].

[1] https://security-tracker.debian.org/tracker/CVE-2006-10003

More details :
https://nvd.nist.gov/vuln/detail/CVE-2006-10003

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../perl/files/CVE-2006-10003.patch           | 73 +++++++++++++++++++
 .../perl/libxml-parser-perl_2.46.bb           |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2006-10003.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2006-10003.patch b/meta/recipes-devtools/perl/files/CVE-2006-10003.patch
new file mode 100644
index 0000000000..e9a4b692d2
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2006-10003.patch
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
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
index 6cd40bd292..e4c4c2530c 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
@@ -9,6 +9,7 @@ DEPENDS += "expat"
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz \
            file://ptest-perl/run-ptest \
            file://0001-CheckLib.pm-do-not-attempt-to-run-a-cross-executable.patch \
+           file://CVE-2006-10003.patch \
            "
 SRC_URI[md5sum] = "80bb18a8e6240fcf7ec2f7b57601c170"
 SRC_URI[sha256sum] = "d331332491c51cccfb4cb94ffc44f9cd73378e618498d4a37df9e043661c515d"
-- 
2.50.1


