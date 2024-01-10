Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682FEC4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 11:54:48 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.9919.1704887687763808980
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 03:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cSupHIpD;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e4d515c9aso26752025e9.0
        for <Openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 03:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704887685; x=1705492485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I2ymAF5Gunrel+hCNy/JexGAEeGtvdWNfCT40ImT4ZA=;
        b=cSupHIpDcVgiDd5C4PJK364q/KKplFBc/jSvTkpn65fyz0Qf7HfhdDudNMHcHlA0Eu
         PLJ6ywAG15doEqNPXJwpI3Wr74MG4u/FiUjLATP8At9l2CDHsxR8r9jwrNKyBRP0oLDP
         uiR1LIPVhPu7gIDSveyFlBhZ5vVfNGh1m4mk3NWLqFHEzmiC5ntaBFgohBfdrBywDIFq
         XVFVnXmSceLTwrnnXIrNKIENvYtv3cBn4jQ2HxZUGe11r2UYs+s5D3T04a2ysd9dYh0m
         7Ck4i68WiHcayVKcoUSTNOl3THPy/yjphedaTvH4IpyzprFWQkNtiP3oF9ZIeoCjQOwy
         acYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704887685; x=1705492485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2ymAF5Gunrel+hCNy/JexGAEeGtvdWNfCT40ImT4ZA=;
        b=rT6V0V3vkyh2SV0Nr0aKPRnmNt3vPiw+kXbfewd0wiPjSwI/zB6yGA4TTan6VhYXU6
         JmXwYDHTs3tH0ReqKZXqi7HXjwRdjAV3Sj2zmVSgST6/Uzl0r0UM+DR1iWMOn653Gg6Z
         Y535EllobWCI1q91ZOIiSCoPMW0ZqVYXv/Nuv5BqgHaDNwy+efU5HlPdIrVxRCucoPDL
         ecVRHvgJefOFAQkFP9NK+59W2hoFoF9W9EU8vU+3/hEKMjUQZOAv9+XWrQe8t+AU9ycw
         ekotITALNcXj9pMsKHf413WJdBu2vZLniU8Tm2pLNKYncZOflWICEJrwzocJUfoa3fFX
         lzDQ==
X-Gm-Message-State: AOJu0YwduWw15CUpsazO88bNBrwn9rIzqfl1LhP7aC6Kaj+jvibnu1US
	pHS5YkE65D7LlIocKIzYqYk49sTf8CAlbw==
X-Google-Smtp-Source: AGHT+IHy8QgQuvxwDZmnVgUAaZgELMwVLlWgB5Y5vHkWe/5aFVs+WGDJPSU+edmaBPjLCwAjqAPAHg==
X-Received: by 2002:a1c:7502:0:b0:40e:556e:5f2c with SMTP id o2-20020a1c7502000000b0040e556e5f2cmr560222wmc.63.1704887685081;
        Wed, 10 Jan 2024 03:54:45 -0800 (PST)
Received: from slackware.local ([154.47.27.146])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c500d00b0040e5a0515aesm44191wmr.14.2024.01.10.03.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 03:54:44 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Lukas Funke <lukas.funke-oss@weidmueller.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH 1/3] recipetool: Don't fail on local go modules
Date: Wed, 10 Jan 2024 12:53:33 +0100
Message-Id: <20240110115335.92914-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 11:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193493

Local modules are usually referenced with a 'replace' directive in
go.mod file. If that's the case, remove them from populating SRC_URI.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 scripts/lib/recipetool/create_go.py | 32 +++++++++++++++++------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool/create_go.py
index 21dcb41271..bd20b07f91 100644
--- a/scripts/lib/recipetool/create_go.py
+++ b/scripts/lib/recipetool/create_go.py
@@ -504,7 +504,7 @@ class GoRecipeHandler(RecipeHandler):
 
         return inline_fcn, commit
 
-    def __go_handle_dependencies(self, go_mod, localfilesdir, extravalues, d):
+    def __go_handle_dependencies(self, go_mod, srctree, localfilesdir, extravalues, d):
 
         src_uris = []
         src_revs = []
@@ -525,6 +525,23 @@ class GoRecipeHandler(RecipeHandler):
 
             return src_rev
 
+        # we first go over replacement list, because we are essentialy
+        # interested only in the replaced path
+        if go_mod['Replace']:
+            for replacement in go_mod['Replace']:
+                oldpath = replacement['Old']['Path']
+                path = replacement['New']['Path']
+                if 'Version' in replacement['New']:
+                    version = replacement['New']['Version']
+
+                if os.path.exists(os.path.join(srctree, path)):
+                    # the module refers to the local path, remove it from requirement list
+                    # because it's a local module
+                    go_mod['Require'][:] = [v for v in go_mod['Require'] if v.get('Path') != oldpath]
+                else:
+                    # Replace the path and the version, so we don't iterate replacement list anymore
+                    go_mod['Require']['Path'] = path
+
         for require in go_mod['Require']:
             path = require['Path']
             version = require['Version']
@@ -534,17 +551,6 @@ class GoRecipeHandler(RecipeHandler):
             src_uris.append(inline_fcn)
             src_revs.append(generate_src_rev(path, version, commithash))
 
-        if go_mod['Replace']:
-            for replacement in go_mod['Replace']:
-                oldpath = replacement['Old']['Path']
-                path = replacement['New']['Path']
-                version = replacement['New']['Version']
-
-                inline_fcn, commithash = self.__generate_srcuri_inline_fcn(
-                    path, version, oldpath)
-                src_uris.append(inline_fcn)
-                src_revs.append(generate_src_rev(path, version, commithash))
-
         pn, _ = determine_from_url(go_mod['Module']['Path'])
         go_mods_basename = "%s-modules.inc" % pn
 
@@ -693,7 +699,7 @@ class GoRecipeHandler(RecipeHandler):
 
             self.__rewrite_src_uri(lines_before, ["file://modules.txt"])
 
-            self.__go_handle_dependencies(go_mod, localfilesdir, extravalues, d)
+            self.__go_handle_dependencies(go_mod, srctree, localfilesdir, extravalues, d)
             lines_before.append("require ${BPN}-modules.inc")
 
         # Do generic license handling
-- 
2.35.1


