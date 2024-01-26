Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C119C47DDF
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 14:21:22 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.17150.1706278877352082901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 06:21:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wCSDrgqr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-290da27f597so230880a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 06:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706278876; x=1706883676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lb+Umo3LGICSbiS+c1tqAOR5PWnRMuQM20z28T9pU7M=;
        b=wCSDrgqreKAXMBB8+URRzIujeuUKB/q4jpV0ACIvaxRpLw83idlE9a9r2lgsKklu2D
         xLzgrSWhgn8VvddYBtDPA02iATJYGxEQdGiiLn6Bdhwes8rj9uTAyaN2DSko6KUpgwGu
         pYtU3+8yY5/zFv1E9kX1w+8kKffcYRJXkW4lfCzAfIDl3bMQCx9H6j3tneKXo6eHFFE3
         SJ+V+CmfEVMjtLuEi/6jbkyGNEjPMVnVTZFKZjooVRpveInuuB+p4de0uPYQlHpJpstD
         UkKgUmz9JqLparQiWpGcngZQXMAeczMQx+pdqQloUM6ovPI2/R5zlnx/OU0rV21NDKsf
         8CHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706278876; x=1706883676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lb+Umo3LGICSbiS+c1tqAOR5PWnRMuQM20z28T9pU7M=;
        b=hrd4y/mppAsQ1Y8YOnmSLUA7By0pVR6VueXaZGtNPeEo4FPc1cTllmKwnzBH78PjJl
         YqnSHeI2/HfyrCL0HyNYjelmpNK5rtGTetgufQD/1Yfb28l5osDmJ/2WlA8oKo/jHp5V
         rh+ycsM2bywAg/TWA4ybfrfoxoxb9K92fZfzQe21EbFCeMvy4PMLdig+rY0KhD12u0Tv
         jQaV/RPhL5Jp1TowB8UaHiY8X061AgRjEEEJRLfY0qS5GhX24czOW9QG+SC8ubdfwdJ9
         i3MouGRn5jz+5s7xk5dVTjH2IvVLCpdZg3QxLNEUQMm2aC+FZs4PosJ9He3cVbXU30/k
         AQTg==
X-Gm-Message-State: AOJu0YwQltbptPX+IneszXQrA/wkyzEd4r/4pB5EyipltjIcDxmD805/
	QwVdsEZv34l4uEXP7W1ehUCHW8YZyJESIfruRli7FWVq8IYhEH4pGX1Ttnm2YLYsLMKmMAixIZk
	QD6w=
X-Google-Smtp-Source: AGHT+IFGsIpi2RfvXEpImmqjSn5wLLN58/Flurz1P0BoJSHT2Fchna/rIDZEHAe2SHipTPPOhPFAUA==
X-Received: by 2002:a17:90b:2290:b0:290:505:248e with SMTP id kx16-20020a17090b229000b002900505248emr794163pjb.67.1706278876005;
        Fri, 26 Jan 2024 06:21:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id rr14-20020a17090b2b4e00b0029095a896c8sm1136458pjb.40.2024.01.26.06.21.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 06:21:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 8/8] systemtap: Fix build with gcc-12
Date: Fri, 26 Jan 2024 04:20:41 -1000
Message-Id: <18ae4fea4bf8681f9138d21124589918e336ff6b.1706278642.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706278642.git.steve@sakoman.com>
References: <cover.1706278642.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 14:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194382

From: Khem Raj <raj.khem@gmail.com>

Backport a patch to fix
| ../git/util.cxx:1766:56: error: 'std::pointer_to_unary_function<_Arg, _Result> std::ptr_fun(_Result (*)(_Arg)) [with _Arg = int; _Result = int]' is deprecated: use 'std::function' instea
d [-Werror=deprecated-declarations]
|  1766 |                        std::not1(std::ptr_fun<int, int>(std::isspace))));
|       |                                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0b360d12203aafd8bf96433d11221a6ed910a11f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ility-re-tweak-for-rhel6-use-functio.patch | 49 +++++++++++++++++++
 .../recipes-kernel/systemtap/systemtap_git.bb |  4 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch b/meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch
new file mode 100644
index 0000000000..f885c44460
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch
@@ -0,0 +1,49 @@
+From f199d1982ef8a6c6d5c06c082d057b8793bcc6aa Mon Sep 17 00:00:00 2001
+From: Serhei Makarov <serhei@serhei.io>
+Date: Fri, 21 Jan 2022 18:21:46 -0500
+Subject: [PATCH] gcc12 c++ compatibility re-tweak for rhel6: use function
+ pointer instead of lambdas instead of ptr_fun<>
+
+Saving 2 lines in ltrim/rtrim is probably not a good reason to drop
+compatibility with the RHEL6 system compiler.  Actually declaring a
+named function and passing the function pointer is compatible with
+everything.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=commit;h=f199d1982ef8a6c6d5c06c082d057b8793bcc6aa]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ util.cxx | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+--- a/util.cxx
++++ b/util.cxx
+@@ -1757,21 +1757,24 @@ flush_to_stream (const string &fname, os
+   return 1; // Failure
+ }
+ 
++int
++not_isspace(unsigned char c)
++{
++  return !std::isspace(c);
++}
++
+ // trim from start (in place)
+ void
+ ltrim(std::string &s)
+ {
+-  s.erase(s.begin(),
+-	  std::find_if(s.begin(), s.end(),
+-		       std::not1(std::ptr_fun<int, int>(std::isspace))));
++  s.erase(s.begin(), std::find_if(s.begin(), s.end(), not_isspace));
+ }
+ 
+ // trim from end (in place)
+ void
+ rtrim(std::string &s)
+ {
+-  s.erase(std::find_if(s.rbegin(), s.rend(),
+-	  std::not1(std::ptr_fun<int, int>(std::isspace))).base(), s.end());
++  s.erase(std::find_if(s.rbegin(), s.rend(), not_isspace).base(), s.end());
+ }
+ 
+ // trim from both ends (in place)
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index bdd8fb83b0..a8b2cf1eac 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -6,7 +6,9 @@ HOMEPAGE = "https://sourceware.org/systemtap/"
 
 require systemtap_git.inc
 
-SRC_URI += "file://0001-improve-reproducibility-for-c-compiling.patch"
+SRC_URI += "file://0001-improve-reproducibility-for-c-compiling.patch \
+            file://0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch \
+           "
 
 DEPENDS = "elfutils"
 
-- 
2.34.1


