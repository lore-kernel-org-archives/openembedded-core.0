Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8261C38A05
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:39 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.5174.1649723963945800862
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 17:39:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gVpIX7CO;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id n18so15312348plg.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 17:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QekvGpIW6MmJ7P+cmHxD+1zbpMraUrgYR0Raf9LdwgY=;
        b=gVpIX7COe1069seqD/VCX0e3BCx/oIRgmSmrTbDTIgW9UQkFZeR6GpVthPzLPrZCtC
         nYOsI1eUZ+cei9dFz1py1QqCY+JPRyVOt5JqUFMcaJi5/G+PosgARgPmX4ASSazcc0V5
         qqj/Jw6ApH6hxpfgCcIbujCw4V3Cv7jsI0fgmpxcRxhYot5aLbpsBYG6bHrwaXthGCUd
         2lFTCwvl2XRxVHomz/9uSd63zr4MW0cr/GYkVt4XR21vbEksEW6vuHFMywa/979cqmae
         GYrEV/OdeCNyilrelvOvBpdgG9b+PI7p9+MEE6TVkDHofc+0SsEbzFzoNuJnw8rYu2MM
         AE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QekvGpIW6MmJ7P+cmHxD+1zbpMraUrgYR0Raf9LdwgY=;
        b=mNR4nHpnLy9AjWCfjcWDBtL0BxlKIUus+6sNGeoq/ZdM2KpW/bxmHdi64ukDTRT8rn
         4DQ/TfqnlmfXAtQj1KcDTihDbZ0nWFFDMPDVU5TKu5McaNbVw+iK6eFyn3J3rCub4cHV
         xsteZQTiMVY8S88tVGkNR74upwlFG/6+s7En31AyTgTR7v5eVTAqGNh2qtnVhvYZzSix
         jnWMtbwpf7E9MBr9Sx8mvum7j4o+ElfYKcRDfQSP8cv+h3PqIbL1lOhh8Czs7vXa2kXf
         pamsD10JuX+qvESGeMFDNbM7j0dyZSpYfsAwLHVPoxeYQ+Fpb6aST4OfB8uK7wW5iEsu
         K33A==
X-Gm-Message-State: AOAM530RTXEl6DRxjHB1FFOPJcxZSRVQBdgzvktCqtWPRUDyFWl8TFgP
	b3+BkDYVnPQbjRQWKlig6khzBfz5i5WHVg==
X-Google-Smtp-Source: 
 ABdhPJzx3pjgnERo6vnrFnWKxrmGCrVuOsHmvJTHq/Dtry8aKdbG8gvJm63xDkxmd6cRgzl7O39XKw==
X-Received: by 2002:a17:90a:410a:b0:1cb:a279:6679 with SMTP id
 u10-20020a17090a410a00b001cba2796679mr1980020pjf.211.1649723963252;
        Mon, 11 Apr 2022 17:39:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 j14-20020aa783ce000000b00505b64b82bdsm6190154pfn.10.2022.04.11.17.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 17:39:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] systemtap: Fix build with gcc-12
Date: Mon, 11 Apr 2022 17:39:17 -0700
Message-Id: <20220412003917.3593854-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412003917.3593854-1-raj.khem@gmail.com>
References: <20220412003917.3593854-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164247

Backport a patch to fix
| ../git/util.cxx:1766:56: error: 'std::pointer_to_unary_function<_Arg, _Result> std::ptr_fun(_Result (*)(_Arg)) [with _Arg = int; _Result = int]' is deprecated: use 'std::function' instea
d [-Werror=deprecated-declarations]
|  1766 |                        std::not1(std::ptr_fun<int, int>(std::isspace))));
|       |                                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ility-re-tweak-for-rhel6-use-functio.patch | 49 +++++++++++++++++++
 .../recipes-kernel/systemtap/systemtap_git.bb |  3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch b/meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch
new file mode 100644
index 00000000000..f885c444609
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
index 04f7e03ab50..ce86d5274dd 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -7,7 +7,8 @@ HOMEPAGE = "https://sourceware.org/systemtap/"
 require systemtap_git.inc
 
 SRC_URI += "file://0001-improve-reproducibility-for-c-compiling.patch \
-           file://0001-staprun-address-ncurses-6.3-failures.patch \
+            file://0001-staprun-address-ncurses-6.3-failures.patch \
+            file://0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch \
            "
 
 DEPENDS = "elfutils"
-- 
2.35.1


