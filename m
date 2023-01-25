Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76771C27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 22:22:29 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.60241.1674685345338728776
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 14:22:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Si4rdDww;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so2183801wml.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sDrQ13cswbo6JlOpZxrSuAqKjgRzo3TiTGrNDtaWCI=;
        b=Si4rdDww/VxmdrnTDWawuFWLS63Scd6oR59D43eMxT+BnI2iKNvbVS5atqX9piiSu7
         Qlof5h3sH6hRfX2swTLaTZ2n0Xt/FmLd5REK2qmTYiETknwpC9GJkhR5ewEwYKLVUdRa
         SG/YG5KlBuhviu+dep2lmCHhNb0QOMLdC5ctM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sDrQ13cswbo6JlOpZxrSuAqKjgRzo3TiTGrNDtaWCI=;
        b=MyUEPq/GxE0IG7tqzFeqohxMKpzxAEctA2ArROreoi/aLoFQd5W4buulgOCzQHOOMD
         zcNc0RbpdZ8CZ2TWXOOdpAAzsxZbK6jLUeVnxZNpeTuMiCPvKHusg2UHMyjeE32Omy1F
         2i0Imn8jh+1N3+Zda7e00MVeOtpc/KMP84/NJdqUksbB66g5fl7L5sqqQsWpdukHV7FN
         8LFylZlYxWVvnOJPRgwvTD4i/Xp5Osy4w29+0oj9gV/v4/DXSyoL5Qn4U9Ki/3ArF6Ry
         QUiYmfeGJKut7QWzfC6leQpZY7d769Rkmqardvyv0C3kBAWb/Volf+UrpxEkWjNhdBS5
         YkFA==
X-Gm-Message-State: AFqh2kqZm8dG9uRQMQAiy1O3BUxFDesXkN0RvGWtzUqLRoLjy9K8H89B
	MD2zY0Xy91MiyojZmeS+yH5ZrF3bQEwKmYpT
X-Google-Smtp-Source: AMrXdXuNHzhW7dOzgYMU0RxxyEe8Bnn0R9DIW0oYBUCTcOnM0gKPotzVgOn1tN/1metkO8dy7X89yw==
X-Received: by 2002:a05:600c:c07:b0:3da:ff60:f5c9 with SMTP id fm7-20020a05600c0c0700b003daff60f5c9mr32458445wmb.40.1674685343446;
        Wed, 25 Jan 2023 14:22:23 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f2d7:e330:f537:35d8])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c500d00b003db2b81660esm3154986wmr.21.2023.01.25.14.22.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 14:22:22 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] native: Implement BBCLASSEXTEND PACKAGES_DYNAMIC handling
Date: Wed, 25 Jan 2023 22:22:20 +0000
Message-Id: <20230125222221.2462169-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230125222221.2462169-1-richard.purdie@linuxfoundation.org>
References: <20230125222221.2462169-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 22:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176379

Recipes that use native BBCLASSEXTEND and set PACKAGES_DYNAMIC will
currently see PREFERRED_PROVIDER warnings. Some recipes work around this
but lets fix the core code to handle remapping PACKAGES_DYNAMIC correctly
so the workarounds aren't necessary any more.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/native.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 1e94585f3e3..cfd299d0c8c 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -139,7 +139,7 @@ python native_virtclass_handler () {
     if "native" not in classextend:
         return
 
-    def map_dependencies(varname, d, suffix = "", selfref=True):
+    def map_dependencies(varname, d, suffix = "", selfref=True, regex=False):
         if suffix:
             varname = varname + ":" + suffix
         deps = d.getVar(varname)
@@ -148,7 +148,9 @@ python native_virtclass_handler () {
         deps = bb.utils.explode_deps(deps)
         newdeps = []
         for dep in deps:
-            if dep == pn:
+            if regex and dep.startswith("^") and dep.endswith("$"):
+                newdeps.append(dep[:-1].replace(pn, bpn) + "-native$")
+            elif dep == pn:
                 if not selfref:
                     continue
                 newdeps.append(dep)
@@ -171,6 +173,7 @@ python native_virtclass_handler () {
         map_dependencies("RPROVIDES", e.data, pkg)
         map_dependencies("RREPLACES", e.data, pkg)
     map_dependencies("PACKAGES", e.data)
+    map_dependencies("PACKAGES_DYNAMIC", e.data, regex=True)
 
     provides = e.data.getVar("PROVIDES")
     nprovides = []
-- 
2.37.2


