Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.26553.1613945841943947633
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 14:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X0UOaR1K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id n10so12691279wmq.0
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 14:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WqTBNOaOxVjC8Zzejkt5etUvVJJectIChYm0rRcX5/E=;
        b=X0UOaR1KAWpFIMO908HyftIw38vKtnrHawxvZjHOxVD+iJ6cV3Nc9gnqUynck+4365
         5j1ffpfwRnWjNGQPsYdgwUYLSbLLpDbqcEaMr9COwcVRXLYGG35hnCa6qEpKJ3VA6nOm
         gPM3eka1K7PW7cyRQGwJmjDuW8f06WAukHbAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WqTBNOaOxVjC8Zzejkt5etUvVJJectIChYm0rRcX5/E=;
        b=bLjp9nnorQFfTjUKv5nML893FmxiENXMq1wqqxNYBilEyQyWNwxzqgLtMcF7B0pAFJ
         r08LY6G0KmAfqqRr8+QmaLhCL2li533GGTFxO7ovbKp8KRSGCdI6VDybatGy+nSne1bS
         ZArhyeIQ6KgHWLdomaGzWFGMm85DEwR1tGvWHwyVQUWLMsqJd0t4ksQHEvr4G1FlBdLM
         dDqPATOUbIqjFf0IA11UbC6G6ad+VHPUIXKV+wgvtZghy44iq+docjaiuyhx/uwkhM0M
         KOAV7LdWaAKD8HMftDzW2IAuSi3OkWkQYIuuCFIn6vNirnlWGuP5YNa4f4vsnQ9Dcr5p
         Iieg==
X-Gm-Message-State: AOAM532gUEckAJliS8ncyqugd8vb/ma7TwLYvun/LSx3WDRT4ZpUIy8e
	DdJsnZT0Hg0ejP2wWVG6Dl+h+pCGxJCqCg==
X-Google-Smtp-Source: ABdhPJzSgQXnfX3iIpZohUaTrkXVQMaCQs6mTwtyaiuzzEXe7mv7X42GEj/UHOem6f5xD6/gdQ3oVg==
X-Received: by 2002:a1c:6a17:: with SMTP id f23mr6345907wmc.73.1613945840496;
        Sun, 21 Feb 2021 14:17:20 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id m4sm10196612wrb.87.2021.02.21.14.17.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 14:17:20 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] ca-certificates: Clean up two patches and submit upstream
Date: Sun, 21 Feb 2021 22:17:16 +0000
Message-Id: <20210221221717.3714714-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210221221717.3714714-1-richard.purdie@linuxfoundation.org>
References: <20210221221717.3714714-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ca-certificates/sbindir.patch             | 10 +++++++--
 ...pdate-ca-certificates-support-Toybox.patch | 21 +++++++++----------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch b/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
index a113fa8b153..f343ebf16e0 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
@@ -1,6 +1,12 @@
-Upstream-Status: Pending
+sbin/Makefile: Allow the sbin path to be configurable
 
-Let us alter the install destination of the script via SBINDIR
+Some project sharing ca-certificates from Debian allow configuration
+of the installation location. Make the sbin location configurable.
+
+Also ensure the target directory exists
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Submitted [https://salsa.debian.org/debian/ca-certificates/-/merge_requests/5]
 
 --- ca-certificates-20130119.orig/sbin/Makefile
 +++ ca-certificates-20130119/sbin/Makefile
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch b/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
index 6e2171f7584..f78790923cb 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
@@ -1,14 +1,13 @@
-From 30378026d136efa779732e3f6664e2ecf461e458 Mon Sep 17 00:00:00 2001
-From: Patrick Ohly <patrick.ohly@intel.com>
-Date: Thu, 17 Mar 2016 12:38:09 +0100
-Subject: [PATCH] update-ca-certificates: support Toybox
+update-ca-certificates: Replace deprecated mktemp -t with mktemp --tmpdir
 
-"mktemp -t" is deprecated and does not work when using Toybox. Replace
-with something that works also with Toybox.
+According to coreutils docs, mktemp -t is deprecated, switch to the
+--tmpdir option instead.
 
-Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Submitted [https://salsa.debian.org/debian/ca-certificates/-/merge_requests/5]
 
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+[This was originally for compatibility with toybox but toybox now
+supports -t]
 ---
  sbin/update-ca-certificates | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
@@ -24,9 +23,9 @@ index 79c41bb..ae9e3f1 100755
 -TEMPBUNDLE="$(mktemp -t "${CERTBUNDLE}.tmp.XXXXXX")"
 -ADDED="$(mktemp -t "ca-certificates.tmp.XXXXXX")"
 -REMOVED="$(mktemp -t "ca-certificates.tmp.XXXXXX")"
-+TEMPBUNDLE="$(mktemp -p${TMPDIR:-/tmp} "${CERTBUNDLE}.tmp.XXXXXX")"
-+ADDED="$(mktemp -p${TMPDIR:-/tmp} "ca-certificates.tmp.XXXXXX")"
-+REMOVED="$(mktemp -p${TMPDIR:-/tmp} "ca-certificates.tmp.XXXXXX")"
++TEMPBUNDLE="$(mktemp --tmpdir "${CERTBUNDLE}.tmp.XXXXXX")"
++ADDED="$(mktemp --tmpdir "ca-certificates.tmp.XXXXXX")"
++REMOVED="$(mktemp --tmpdir "ca-certificates.tmp.XXXXXX")"
  
  # Adds a certificate to the list of trusted ones.  This includes a symlink
  # in /etc/ssl/certs to the certificate file and its inclusion into the
-- 
2.27.0

