Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D44EC04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:34:16 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.61068.1716212047620827421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=abfkhUd6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f490b5c23bso101692b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212047; x=1716816847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2HyNiVHbQA2VvL/+FnwoZp7nUow8kWeUUCbrjyiP0M=;
        b=abfkhUd61qexHq/IPMyj0CK39qoQvL3brJi3nyWDfq54udUU/4BxGhpT4r8K2KMh4S
         FZQdWq195nns7w5n4lJguo6L1/chpjkvKCKOakKvN7DAxcCPF6z65vwNci1Wt05tSU0G
         bFw5L7DdhKqVMHSGgAXMZp+QUpjcssGcCA9QwFBNLIEV72g+/0trn94pbQWapQF1/E/3
         BxXjz3z1La0kQbjyDykWb46aUKUB8A4B6ZVsMluRBDHd5tSf72euODCbRKwy96KTOrKi
         ozK2sm+A3iGTRY0rNPqjEk2LV1XOCrYBrTILPyPXT220l+mc5tpTVhHRSCuHPVCxHQm5
         PN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212047; x=1716816847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2HyNiVHbQA2VvL/+FnwoZp7nUow8kWeUUCbrjyiP0M=;
        b=UoYYUp4o88waQ1IJm0lQ3Asuum32jiq0sBgoYdg5/0YPnlJx3LvoCURhVs6AiIwoqf
         EfjtwsNLfvBO78j6XeHfVp6xiuvyBUlUMbBKm+FNOD3tl074SgdI4QboQYUZ4vqAEpwm
         DRyAZgRnkDGqZ9e/BQHp0SmaBu/nLRvFV8cCxg8Y912Sb1SMeuH6cDbAvojpf56oUxey
         BXOTofRfkFMFm46MdZBig1BA2967poFBcQ0FDIb6gyvUQj/q5gwusXq2vEWliO/yhZ4F
         unPxmb3EduX+wHU1Pbzf4Pmljq8+3lCN+RnMVpaqzIuw8ijIs3eUXigppndGQZ3+1/WY
         3nvQ==
X-Gm-Message-State: AOJu0Yy1hAQONnSH4X5LL5nZi1bDEQsF4e4eUHz1Ol4eTUnI0RnECx3n
	fV0vu+wCIvLDhlp+w1OVk4CRYlxe6UbbHJDwV+Rs7ADNaSpJ5fv2lNh48h8rsgGe/dauBX6iRcV
	1
X-Google-Smtp-Source: AGHT+IFRfgsVGobohDQEZ2u9IUWj5hdesdEBK/Gw0LkOWpN6B0fAKjd2r/P86qFhiELg0Y5Stj1ECA==
X-Received: by 2002:a05:6a00:188d:b0:6ea:afd2:b1dc with SMTP id d2e1a72fcca58-6f4e037e8acmr27978159b3a.29.1716212046762;
        Mon, 20 May 2024 06:34:06 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.34.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:34:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/21] lib/oe/package-manager: allow including self in create_packages_dir
Date: Mon, 20 May 2024 06:33:30 -0700
Message-Id: <20a6f55328733ad6f0c05b1353e8d525019aeea7.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:34:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199590

From: Ross Burton <ross.burton@arm.com>

This function is typically used to construct a limited feed for image
creation, but there are other cases when you might want a limited feed
and include the current recipe's packages in it.

To ensure that existing behaviour is preserved, add a boolean to control
this behaviour and default it to False.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aada7fda2b118152d82b1ab295d92b8251afe4ac)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package_manager/__init__.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 6774cdb794..d3b2317894 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -449,7 +449,7 @@ class PackageManager(object, metaclass=ABCMeta):
             return res
         return _append(uris, base_paths)
 
-def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencies):
+def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencies, include_self=False):
     """
     Go through our do_package_write_X dependencies and hardlink the packages we depend
     upon into the repo directory. This prevents us seeing other packages that may
@@ -486,14 +486,17 @@ def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencie
         bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")
     pkgdeps = set()
     start = [start]
-    seen = set(start)
+    if include_self:
+        seen = set()
+    else:
+        seen = set(start)
     # Support direct dependencies (do_rootfs -> do_package_write_X)
     # or indirect dependencies within PN (do_populate_sdk_ext -> do_rootfs -> do_package_write_X)
     while start:
         next = []
         for dep2 in start:
             for dep in taskdepdata[dep2][3]:
-                if taskdepdata[dep][0] != pn:
+                if include_self or taskdepdata[dep][0] != pn:
                     if "do_" + taskname in dep:
                         pkgdeps.add(dep)
                 elif dep not in seen:
-- 
2.34.1


