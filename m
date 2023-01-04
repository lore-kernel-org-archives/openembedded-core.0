Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46001C54EF0
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:42 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.9379.1672830371113999238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IyL+PRBJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id w1so20448333wrt.8
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtHlXen/V20Y29oDXtWHMIUV+w6adrxcw+JAQKjommQ=;
        b=IyL+PRBJ9J38ugX/bUqHuEwTbgAfbS+QiR/P7qwMwH5ZhSt//Jk7MUnXi4hDAug6cf
         tt0RJ1Eh9+T1KHtcUdfYvnbmpAmE+zod+0G+9RZuSit0BRdqA5B092FIOYwcRRqKshRh
         4D9jCOc7FNg1UBeA8jn25fC+ia8cloUl7dXJpMtsLhLu9/WHbCT6iHY6iExeV+lO9DV7
         Qx2M5Uk5DOHCsiMtGa/f3HQHuaTITWgI9qVrzQetdoFaWyslQ4ec0hz4HtvUGJVdYx91
         Fb+zL0hWRnWxBI1ZTJ3MHDSWbTW+V6OPySZwJ3AMu3Bypr1PwYFHK6WAMxZmRdAcfonL
         vdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtHlXen/V20Y29oDXtWHMIUV+w6adrxcw+JAQKjommQ=;
        b=JqOnJcOcnI5wf3DG73TgzJBus5q9fCW9NxlzF77tSwAEgwapuS/GwuDz3asi6Abtn8
         4WXBFMvoGUS3xKrOzfSv8SWUk678/O46XQHBs9kb0sfqmy8qtDR/UI6vzXqpjBQtvAS4
         OX3JhkRKmrVuIREHAiXZlnoLi9RADiRKqeZg+0em0J6T149R9hU917mnlZNzmOeIo928
         G/5VotVc5RMfF9FvGbzLDLWawNsLkfZWpDbHoq1AaN476NMI1J3WrupOUKnUjXeB0PZI
         cboFzCmMJOL6Cih3+1yt8Z1Fx//94q1aJii9k/AVctv8dOg6GWDE4KGGIj4uPrk79fq6
         TIjA==
X-Gm-Message-State: AFqh2krRnpkY+mb+vs6gRpuSJx78BBUL0+7++gE5n7IOl4PQtl6gDk02
	QDT5meOPhpcLzt5bPk8/a7frAK4T0eY=
X-Google-Smtp-Source: AMrXdXsXPUcpSKtuUR7dD6xwLfLczHSt+lNJkgu1z04q/jfMWTh4v4Ng0PBghpKA8nuldNCc5cuBlg==
X-Received: by 2002:adf:9d90:0:b0:2a5:3a52:a034 with SMTP id p16-20020adf9d90000000b002a53a52a034mr892735wre.35.1672830393771;
        Wed, 04 Jan 2023 03:06:33 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 54/77] ruby: upgrade 3.1.3 -> 3.2.0
Date: Wed,  4 Jan 2023 12:05:25 +0100
Message-Id: <20230104110548.2537259-54-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175439

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...2-Obey-LDFLAGS-for-the-link-of-libruby.patch |  8 ++++----
 .../ruby/0006-Make-gemspecs-reproducible.patch  | 17 +++++++----------
 .../ruby/{ruby_3.1.3.bb => ruby_3.2.0.bb}       |  2 +-
 3 files changed, 12 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.1.3.bb => ruby_3.2.0.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index 4b954e439b..96ae86263b 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From 07fd1ada322eda6c05ac45c08fc814976f31b596 Mon Sep 17 00:00:00 2001
+From 21d8e7700fa0a9c4bf569dd366134060ae858832 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
@@ -11,10 +11,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/template/Makefile.in b/template/Makefile.in
-index f5a3149..5cc75ae 100644
+index 1456313..15b98a4 100644
 --- a/template/Makefile.in
 +++ b/template/Makefile.in
-@@ -114,7 +114,7 @@ ENABLE_SHARED = @ENABLE_SHARED@
+@@ -127,7 +127,7 @@ ENABLE_SHARED = @ENABLE_SHARED@
  LDSHARED = @LIBRUBY_LDSHARED@
  DLDSHARED = @DLDSHARED@
  XDLDFLAGS = @DLDFLAGS@
@@ -22,4 +22,4 @@ index f5a3149..5cc75ae 100644
 +DLDFLAGS = @LIBRUBY_DLDFLAGS@ @LDFLAGS@ $(XLDFLAGS) $(ARCH_FLAG)
  SOLIBS = @SOLIBS@
  ENABLE_DEBUG_ENV = @ENABLE_DEBUG_ENV@
- MAINLIBS = @MAINLIBS@
+ MAINLIBS = $(YJIT_LIBS) @MAINLIBS@
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index 1e4a298317..0a87cae17f 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From 6e1dc610724a7aa8368cbcddf4bbe21cccc0f731 Mon Sep 17 00:00:00 2001
+From 3f60710bc29c1b08e128314d40101e87b7d2c9a1 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -17,19 +17,19 @@ Upstream-Status: Backport [debian]
  5 files changed, 5 insertions(+)
 
 diff --git a/ext/bigdecimal/bigdecimal.gemspec b/ext/bigdecimal/bigdecimal.gemspec
-index fd49c1b..5b8bb00 100644
+index d215757..5148d56 100644
 --- a/ext/bigdecimal/bigdecimal.gemspec
 +++ b/ext/bigdecimal/bigdecimal.gemspec
 @@ -4,6 +4,7 @@ Gem::Specification.new do |s|
    s.name          = "bigdecimal"
-   s.version       = "3.1.1"
+   s.version       = "3.1.3"
    s.authors       = ["Kenta Murata", "Zachary Scott", "Shigeo Kobayashi"]
 +  s.date          = RUBY_RELEASE_DATE
    s.email         = ["mrkn@mrkn.jp"]
  
    s.summary       = "Arbitrary-precision decimal floating-point number library."
 diff --git a/ext/fiddle/fiddle.gemspec b/ext/fiddle/fiddle.gemspec
-index a9c0ec4..89da078 100644
+index 8781093..efdca32 100644
 --- a/ext/fiddle/fiddle.gemspec
 +++ b/ext/fiddle/fiddle.gemspec
 @@ -8,6 +8,7 @@ end
@@ -41,10 +41,10 @@ index a9c0ec4..89da078 100644
    spec.email         = ["aaron@tenderlovemaking.com", "hsbt@ruby-lang.org"]
  
 diff --git a/ext/io/console/io-console.gemspec b/ext/io/console/io-console.gemspec
-index aa57f8a..ba7f8e5 100644
+index d26a757..cc88c55 100644
 --- a/ext/io/console/io-console.gemspec
 +++ b/ext/io/console/io-console.gemspec
-@@ -4,6 +4,7 @@ _VERSION = "0.5.11"
+@@ -4,6 +4,7 @@ _VERSION = "0.6.0"
  Gem::Specification.new do |s|
    s.name = "io-console"
    s.version = _VERSION
@@ -65,7 +65,7 @@ index 1f4798e..48743cf 100644
    spec.email         = ["knu@idaemons.org", "ume@mahoroba.org"]
  
 diff --git a/lib/rdoc/rdoc.gemspec b/lib/rdoc/rdoc.gemspec
-index 525a15f..f6d0e22 100644
+index 3c96f7d..fec0872 100644
 --- a/lib/rdoc/rdoc.gemspec
 +++ b/lib/rdoc/rdoc.gemspec
 @@ -7,6 +7,7 @@ end
@@ -76,6 +76,3 @@ index 525a15f..f6d0e22 100644
    s.version = RDoc::VERSION
  
    s.authors = [
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.2.0.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.1.3.bb
rename to meta/recipes-devtools/ruby/ruby_3.2.0.bb
index 85d6184a04..1981a7524c 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.2.0.bb
@@ -50,7 +50,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "5ea498a35f4cd15875200a52dde42b6eb179e1264e17d78732c3a57cd1c6ab9e"
+SRC_URI[sha256sum] = "daaa78e1360b2783f98deeceb677ad900f3a36c0ffa6e2b6b19090be77abc272"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.30.2


