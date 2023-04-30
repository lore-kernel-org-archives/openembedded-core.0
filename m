Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3441C77B60
	for <webhook@archiver.kernel.org>; Sun, 30 Apr 2023 05:20:39 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.63716.1682832035455682426
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 22:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hoRSG0Ee;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-64115eef620so20865676b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 22:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682832035; x=1685424035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yXo+4Z+/kgdt2vY9Rj0wRy+aAEweD5uCfpkddi95nqs=;
        b=hoRSG0EeOA9iwWnaFqko23fFB3IDnlK58lHR0mRLDOCHDydOHFkV0f6zSUIyrF9d/s
         7/o68OHEHeptCIrSIY/qyfBiLCon6bXYSd6mx6o6B7Ixph03u2AcfSDhsv0y9P2DWk3e
         DDzTdEnKq9b17RPlqY7vP9oODuNYRjkQtimPMZGZ03gDjMRmXEz6bPBO/Btqxd3tohJW
         oHFw5PJJyNw56OGQSdvBy0kq/s+ZkiKppulDVkwaTjYMoUr4knQeVJT4zCiLqMQ+CRN2
         e6UyxaoArUCf9ow3wkKR5Ql9PihvENRe/rVyD8sY4ymJlbgWCrmjAp8bg3ES+p6NnInd
         iMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682832035; x=1685424035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXo+4Z+/kgdt2vY9Rj0wRy+aAEweD5uCfpkddi95nqs=;
        b=MlFMRSt00CfTufp3DAcEEJAlte3jJ7lD+yOl6M9L5huhSmWq/muL5vjT7rslnouJHH
         Ne+3fH5moiJ8deQYRKiL6q25f08IGMVIRZ6Cs5SYretRImedJVtL95jPcupcqmlldu0w
         AGoLzTVM0RWcHedi3sjMjg7Q90HwKGqEcW8+FYoEom4WYEdYJ081XuwNSDcKC5uyqMCL
         KWCwRuGENXUPmujBgDgzP4vAWC8TNMxLMlhdhEHq2FJhAISU63PeLEYoFzCFJ2kTGJeo
         RRJFIGmrqBvYVIaiST8wRFbCPjwY83tCePMLWcfWCxZCOU3RXUSkx1qIgMQJewwiQlZ9
         rtLw==
X-Gm-Message-State: AC+VfDyuXLkME4bJhf7xwpkQpQmN6r4jSvPVwvqnrPGn7Wj2M8H0YWHV
	/dmonKpAu35DGNrt0I19aveZ1TMv4Hrh7A==
X-Google-Smtp-Source: ACHHUZ63z45fgdgtQAEpUxfJuNekYr3lp5oQpJWma/J4tIKgdP9w5ThRlfItRrQxbhSFvDJ15p5TXw==
X-Received: by 2002:a17:90b:90b:b0:246:aeee:e61c with SMTP id bo11-20020a17090b090b00b00246aeeee61cmr13244481pjb.11.1682832034402;
        Sat, 29 Apr 2023 22:20:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id bx19-20020a17090af49300b0024b6a90741esm13748513pjb.49.2023.04.29.22.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 22:20:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qtwebkitgtk: Backport a build fix for GCC 13
Date: Sat, 29 Apr 2023 22:20:31 -0700
Message-Id: <20230430052031.3102466-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 05:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180565

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0b55f52ff8b883296f4845269e2ed746acb3.patch | 37 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.38.5.bb  |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/93920b55f52ff8b883296f4845269e2ed746acb3.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/93920b55f52ff8b883296f4845269e2ed746acb3.patch b/meta/recipes-sato/webkit/webkitgtk/93920b55f52ff8b883296f4845269e2ed746acb3.patch
new file mode 100644
index 0000000000..762de40995
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/93920b55f52ff8b883296f4845269e2ed746acb3.patch
@@ -0,0 +1,37 @@
+From 93920b55f52ff8b883296f4845269e2ed746acb3 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Fri, 31 Mar 2023 12:24:09 -0700
+Subject: [PATCH] Fix build of SourceBrush.cpp
+ https://bugs.webkit.org/show_bug.cgi?id=254821
+
+Unreviewed build fix.
+
+* Source/WebCore/platform/graphics/SourceBrush.cpp:
+(WebCore::SourceBrush::setGradient):
+(WebCore::SourceBrush::setPattern):
+
+Canonical link: https://commits.webkit.org/262434@main
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/93920b55f52ff8b883296f4845269e2ed746acb3]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/WebCore/platform/graphics/SourceBrush.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/Source/WebCore/platform/graphics/SourceBrush.cpp
++++ b/Source/WebCore/platform/graphics/SourceBrush.cpp
+@@ -65,12 +65,12 @@ Pattern* SourceBrush::pattern() const
+ 
+ void SourceBrush::setGradient(Ref<Gradient>&& gradient, const AffineTransform& spaceTransform)
+ {
+-    m_brush = { Brush::LogicalGradient { WTFMove(gradient), spaceTransform } };
++    m_brush = Brush { Brush::LogicalGradient { { WTFMove(gradient) }, spaceTransform } };
+ }
+ 
+ void SourceBrush::setPattern(Ref<Pattern>&& pattern)
+ {
+-    m_brush = { WTFMove(pattern) };
++    m_brush = Brush { WTFMove(pattern) };
+ }
+ 
+ WTF::TextStream& operator<<(TextStream& ts, const SourceBrush& brush)
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
index 36c6233b33..f7fa6dfb98 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reproducibility.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://d318bb461f040b90453bc4e100dcf967243ecd98.patch \
+           file://93920b55f52ff8b883296f4845269e2ed746acb3.patch \
            "
 SRC_URI[sha256sum] = "40c20c43022274df5893f22b1054fa894c3eea057389bb08aee08c5b0bb0c1a7"
 
-- 
2.40.1


