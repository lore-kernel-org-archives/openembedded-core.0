Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304E6C433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:21 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.33504.1635699500497843734
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=kqAoPxAn;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 l10-20020a17090a4d4a00b001a678eed8abso974957pjh.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aIFyjR8OGSY+JUeWZ+q7/M+cvWXsGSq3vBWT3sVFNqc=;
        b=kqAoPxAndZY+w0qIC/HSRuV/ZIg+vdksnc2fOdxZk2Iv+O1InYhqdniiDhYxsc9DgS
         px0F6MvJHuHM/g/Vx3TaI5+7AIqtjnu9uD5uFTk/nlufYup5wQAxXpIH8AILWDMhuLXN
         MJZiPwAu1y20Kjt96Iru8BKWVPeih3KmCjvIq0lc7mHkc1nvqNwzIIR+BI6h5hwbIu82
         YMKhNSfBEOfh7PsmT+VfSVhb1kKwVoyB9x9DLyClzv4cJ9NYtLU1C0SD5zv/nauhpXAI
         TCrs7YZfcGND3KtrgQOsIFaHNMkm0oiNaDKU0q4Huv/ZqGRXtDiEjp3mYvPl5ZX8WdqS
         E5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aIFyjR8OGSY+JUeWZ+q7/M+cvWXsGSq3vBWT3sVFNqc=;
        b=FF50L9vLgpc0JNE/7Jp78BgUGIS0yQ/33m6vpdZqqsGqtFFBMb8xYF4PqHRCLFi07L
         4p7MTFAglNTStJADmAqLAymZUDvLT0VN+kQcTg14yjFTGE6zK9c4u6k8/cpL1oJtTvhI
         tzP6QJS4iePtQxJH+GRqWXp34D4YAjBXM8KLsZcPp6X8Erm/Zk5IufWMKOyR8MGeH8St
         +LEOnNNhclprlSGhh79U1VxIti9o78U6bFugLroJuBjV13qq56LRh2N6AOZnN5JKoNAf
         05RkVEXaoc0cdtdm+JJXOAw0D3lfFp53AckLbWTKst1eYM9o0QNj+c8nk2pZzDbld+0Z
         laWA==
X-Gm-Message-State: AOAM5336nG2gkxQ6IutmTLtkOUFouGtL66XkknXSBB/9phT6FDCoUukU
	Lod5qGyYE1JNRKv+v/BJlgWdwAsN/8hAcYMIg5g=
X-Google-Smtp-Source: 
 ABdhPJzC950Ch9kiS6yojpaliiM0RyB0WQqNtLJlOwkoV0IUkF8DL5D2VPWBQEEII2APJOOoqD2v1w==
X-Received: by 2002:a17:90b:224e:: with SMTP id
 hk14mr24598055pjb.224.1635699499581;
        Sun, 31 Oct 2021 09:58:19 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/29] oe/license: implement
 ast.NodeVisitor.visit_Constant
Date: Sun, 31 Oct 2021 06:57:28 -1000
Message-Id: 
 <18f10a51387cdee7c7058a3cb3f7c8c24c57c36a.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157667

From: Ross Burton <ross@burtonini.com>

Since Python 3.8 visit_Num(), visit_Str() and so on are all deprecated
and replaced with visit_Constant.  We can't yet remove the deprecated
functions until we require 3.8, but we can implement visit_Constant to
silence the deprecation warnings.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit abc93390a3f19bc4cc159c5690a478b9e2270906)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/license.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index c1274a61de..c4efbe142b 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -81,6 +81,9 @@ class FlattenVisitor(LicenseVisitor):
     def visit_Str(self, node):
         self.licenses.append(node.s)
 
+    def visit_Constant(self, node):
+        self.licenses.append(node.value)
+
     def visit_BinOp(self, node):
         if isinstance(node.op, ast.BitOr):
             left = FlattenVisitor(self.choose_licenses)
@@ -234,6 +237,9 @@ class ListVisitor(LicenseVisitor):
     def visit_Str(self, node):
         self.licenses.add(node.s)
 
+    def visit_Constant(self, node):
+        self.licenses.add(node.value)
+
 def list_licenses(licensestr):
     """Simply get a list of all licenses mentioned in a license string.
        Binary operators are not applied or taken into account in any way"""
-- 
2.25.1


