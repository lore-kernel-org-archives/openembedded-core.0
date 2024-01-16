Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71827C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 08:24:33 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.8365.1705393470969641780
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 00:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QU0y9/TP;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33770772136so5581110f8f.3
        for <Openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 00:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705393469; x=1705998269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UXV3OfWGbYuxMUonLRy130I4B5lOhS5MWWL1Ga39/tk=;
        b=QU0y9/TPDsXk3kCXU/AoxUq1mVyS/+YuELb13rZ7GIEXTokWvV+EFejcJJmKIcAiSf
         56GAhVe2ejCkLjHitOz0yKpkmqXwwf0AIQakrUykeV6+eUgtKOnfXpEThv++vI/XOIJY
         xOODh9u9ISMU4KbzSnOc6y/9+wSQjAGEpkl499yTpmE7KiwlylobnndwYzUkF/+b/28S
         8IgqaznUweK/b+mkOEY6KDjK5qouFqXSYlePLntMbWBotonGBd00fg0tpiYlNW/D1Gup
         OBvDn09smYF6RHLMElffSHdSvqLJ+p8eH5X+Uk8s2ICFurUftD4sjKXvPnQwzn45N71z
         Tqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705393469; x=1705998269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXV3OfWGbYuxMUonLRy130I4B5lOhS5MWWL1Ga39/tk=;
        b=TMpaQ2wx8v0zKK7dykVj6erX3QNbqml5RwL99tuImTZjSE70HgFaH5BWW1kgoqWWst
         jo3NsPkiHbNkJwzIPBNZ2WEK0F3FcEHsInZM2sakbeDhRduV/1DnuiWAcGftNiiRwyq5
         CBFdNf3y3xdFHAkb9L5rqy3UOa5y44LNomcqWcK6PAFw9Lzm/qR8jEhpPfxM+VLrvGKx
         +ey65WrShmsV3HnvrYTGJdOo39r0goFjbWJUHk5akU5VHl8Sw24Yreqm4ZIyxSjs6pgs
         tooivi/kKHpvLESrMhNkZhcbl9DfifOyEjszBHGl1cNsU7BLboXk9IbHJdNiCDM9KE3m
         L8Rg==
X-Gm-Message-State: AOJu0Yxi3Z4MnNSEVaBfuZ/SX4CY+om25vUDPKp8e7zBQ2gAMjucBUAu
	MjxlUvQxImePbSYsc5X0S+2ltfEVScNTQw==
X-Google-Smtp-Source: AGHT+IHSrYhtTp1rdRHeFty7IDtZ2tw8vfIokL1u1PA8m2GiFJpnu+l8D7fCOTBkxjSG/2cyymHUuQ==
X-Received: by 2002:a5d:4b05:0:b0:336:6900:96e2 with SMTP id v5-20020a5d4b05000000b00336690096e2mr3192387wrq.72.1705393468867;
        Tue, 16 Jan 2024 00:24:28 -0800 (PST)
Received: from slackware.local ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id dv1-20020a0560000d8100b00337b55ed9afsm1091923wrb.95.2024.01.16.00.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 00:24:28 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Lukas Funke <lukas.funke-oss@weidmueller.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 1/9] recipetool: Don't fail on local go modules
Date: Tue, 16 Jan 2024 09:23:19 +0100
Message-Id: <20240116082327.128990-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193824

Local modules are usually referenced with a 'replace' directive in
go.mod file. If that's the case, remove them from populating SRC_URI.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 scripts/lib/recipetool/create_go.py | 36 ++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool/create_go.py
index 21dcb41271..668a24b8dd 100644
--- a/scripts/lib/recipetool/create_go.py
+++ b/scripts/lib/recipetool/create_go.py
@@ -504,7 +504,7 @@ class GoRecipeHandler(RecipeHandler):
 
         return inline_fcn, commit
 
-    def __go_handle_dependencies(self, go_mod, localfilesdir, extravalues, d):
+    def __go_handle_dependencies(self, go_mod, srctree, localfilesdir, extravalues, d):
 
         src_uris = []
         src_revs = []
@@ -525,6 +525,27 @@ class GoRecipeHandler(RecipeHandler):
 
             return src_rev
 
+        # we first go over replacement list, because we are essentialy
+        # interested only in the replaced path
+        if go_mod['Replace']:
+            for replacement in go_mod['Replace']:
+                oldpath = replacement['Old']['Path']
+                path = replacement['New']['Path']
+                version = ''
+                if 'Version' in replacement['New']:
+                    version = replacement['New']['Version']
+
+                if os.path.exists(os.path.join(srctree, path)):
+                    # the module refers to the local path, remove it from requirement list
+                    # because it's a local module
+                    go_mod['Require'][:] = [v for v in go_mod['Require'] if v.get('Path') != oldpath]
+                else:
+                    # Replace the path and the version, so we don't iterate replacement list anymore
+                    for require in go_mod['Require']:
+                        if require['Path'] == oldpath:
+                            require.update({'Path': path, 'Version': version})
+                            break
+
         for require in go_mod['Require']:
             path = require['Path']
             version = require['Version']
@@ -534,17 +555,6 @@ class GoRecipeHandler(RecipeHandler):
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
 
@@ -693,7 +703,7 @@ class GoRecipeHandler(RecipeHandler):
 
             self.__rewrite_src_uri(lines_before, ["file://modules.txt"])
 
-            self.__go_handle_dependencies(go_mod, localfilesdir, extravalues, d)
+            self.__go_handle_dependencies(go_mod, srctree, localfilesdir, extravalues, d)
             lines_before.append("require ${BPN}-modules.inc")
 
         # Do generic license handling
-- 
2.35.1


