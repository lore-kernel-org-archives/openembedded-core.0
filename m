Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 029ADC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 13:44:57 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.7215.1644587095928814824
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 05:44:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ryiu0vLe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id u1so1591466wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 05:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x2Uek6JzQkUHHwU5ohjfbUrlD0RN4Zp64OjQ1GWYAgA=;
        b=Ryiu0vLeRQCNNpNB6V8BkmYpdwfoN+4VWvlpVTZTWnXe4LX9AqOdxvMhHofOna0HOH
         EkBvVfY1SjWDn/x5UnD40kjhA5ycuP6hGB+PakdT3rKWKD2+mMZFW3GS5sgGgx02Jv5I
         GkZgCQ33+wdvZOEI50tILg/lPEk+SgNJ3fFuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x2Uek6JzQkUHHwU5ohjfbUrlD0RN4Zp64OjQ1GWYAgA=;
        b=mxaJDvu1tMJvDWqO3xx6HLO92ae4u+W7xggsrFCcm3/CKHrM3Kiy0z8jYV/WjNlJU5
         ZPpj4DXTUm/r/3V3BgaeYsQkgzqHbqwdgtUkpoLuvWYGiXCPH4DE/wZPPmMuC8GPsj4f
         RlWpisL5e48qyaECKxuxgTZn5H/hhci+/GqJat1tdeVAt9NJFs2uuu4u1DEvcRqrcRmu
         MsoRqBMy8UDdoCnZstgSShsK0nli9rjk3k7fddbe2w3PS9+QSFVaiao2SRHyea7mgUgg
         WayBTyHFVph2BF0OskQydhebCC9ty4YuYNrEyolOmEZM1aiqa6UXAq5N0a32iUJ3UxJc
         mT0A==
X-Gm-Message-State: AOAM530em4ZhQWcW9SU1EI5nivNozxfO5yIQCabwz58zoOGfjwg29akR
	IwF5GfXrYpAqpTbpdLZeDD56AKBgy1DlFafi
X-Google-Smtp-Source: 
 ABdhPJwWLcZr6qSMxRIAS6IK6IvK4+iN+S8tRdbd7lJWjImWAbRQwuA3SnUCE9NQALAP8td0XxlIEA==
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr1466453wrq.66.1644587093893;
        Fri, 11 Feb 2022 05:44:53 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e5fe:2e7c:731b:5924])
        by smtp.gmail.com with ESMTPSA id
 p27sm4243295wms.39.2022.02.11.05.44.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 05:44:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] patchelf: Fix corrupted file mode patch
Date: Fri, 11 Feb 2022 13:44:52 +0000
Message-Id: <20220211134452.2720976-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 13:44:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161650

The recent patchelf upgrades corrupted the file permissions patch we
carry as upstream inserted an early exit to the funciton.

This showed up as corrupted file modes when testing a new uninative tarball
containing this patchelf.

Rework and tweak the patch to fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../patchelf/handle-read-only-files.patch     | 36 ++++++++++++-------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch b/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
index 8d9a50a6979..b755a263a4a 100644
--- a/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
+++ b/meta/recipes-devtools/patchelf/patchelf/handle-read-only-files.patch
@@ -14,11 +14,11 @@ Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
  src/patchelf.cc | 16 +++++++++++++++-
  1 file changed, 15 insertions(+), 1 deletion(-)
 
-diff --git a/src/patchelf.cc b/src/patchelf.cc
-index 1aeae88..6b77afe 100644
---- a/src/patchelf.cc
-+++ b/src/patchelf.cc
-@@ -534,9 +534,19 @@ void ElfFile<ElfFileParamNames>::sortShdrs()
+Index: git/src/patchelf.cc
+===================================================================
+--- git.orig/src/patchelf.cc
++++ git/src/patchelf.cc
+@@ -534,9 +534,19 @@ void ElfFile<ElfFileParamNames>::sortShd
  
  static void writeFile(const std::string & fileName, const FileContents & contents)
  {
@@ -39,17 +39,27 @@ index 1aeae88..6b77afe 100644
      if (fd == -1)
          error("open");
  
-@@ -564,6 +574,10 @@ static void writeFile(const std::string & fileName, const FileContents & content
-     if (errno == EINTR)
-         return;
-     error("close");
+@@ -551,8 +561,6 @@ static void writeFile(const std::string
+         bytesWritten += portion;
+     }
+ 
+-    if (close(fd) >= 0)
+-        return;
+     /*
+      * Just ignore EINTR; a retry loop is the wrong thing to do.
+      *
+@@ -561,9 +569,11 @@ static void writeFile(const std::string
+      * http://utcc.utoronto.ca/~cks/space/blog/unix/CloseEINTR
+      * https://sites.google.com/site/michaelsafyan/software-engineering/checkforeintrwheninvokingclosethinkagain
+      */
+-    if (errno == EINTR)
+-        return;
+-    error("close");
++    if ((close(fd) < 0) && errno != EINTR)
++        error("close");
 +
 +    if (chmod(fileName.c_str(), st.st_mode) != 0)
 +        error("chmod");
-+
  }
  
  
--- 
-2.25.1
-
-- 
2.32.0


