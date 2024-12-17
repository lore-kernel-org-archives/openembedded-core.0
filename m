Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16E8E7718A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 20:55:30 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.91803.1734468923504652962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 12:55:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yg0ZyGl7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-725e71a11f7so76456b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 12:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734468923; x=1735073723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGuO1kIe2VkHlZOFZUuUBzDMghj3MDM/w6g5xSf+pog=;
        b=yg0ZyGl7w0uzyAgSyVk+TniZ+G5pkCxkbvDSinjJBBXjAEf7w0MV/cSfATR8oaeoHL
         FHliLmEsd7uPQt97WlbeG7VP6hi45On7ZbpuvRhBRapYXVTkm31WgTPpV30xY3o2NCvl
         ZNOAzQGQBGDG0npakXieKQhf2zCJu08DFB0m5r5pOq9+J7KMMH2vc/M6aPyoCVMQ0Qiw
         9Ael6Lp9Gvn73lI1p6G4OL6sm+ZzF6UWIDK+ZOCUVYZyiTvgLjO32wK3wlrbUFzIsyZG
         Krn5kEsQIjT2uS+M7J2OOBbxQ9P4d0AnmeskyyXTkghmzvMSi7G7dOCmdvrvqA5T28AF
         dAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734468923; x=1735073723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGuO1kIe2VkHlZOFZUuUBzDMghj3MDM/w6g5xSf+pog=;
        b=uqsScEVn2ybGiYNmxbWmetM2gJEDNK1TW9+00NteInEu2KumtX+5tVX6Z5TXv/hudP
         y75BxlFd/OmT+frPkoaDVa8FLk9zmW5eQCA1/iW/crZ+3VFo98veYNsf3O86ErvaEKrX
         4gMh3pqAgCJssBzxMcEzAeToE/2y7ghhLoUWanLBATaUQ8RelhUw8PeK42nZ4MlkVcDW
         2oenub2F9vrovPBrL6VlkYP2GUC3gSAlIEnhglnH50STbshbEffKHN+bTZiW+vksv12S
         X1x8wWtWtyeS0S/d3bBhIWQclCJQPTCoTk0O/mQea4uXyWDdKfrzgQrdcYtGHwLMsRBD
         Vabw==
X-Gm-Message-State: AOJu0YxpUn/S+5R2GYGK2MlS3nx5n2Ced6ykxYemcz5duCrp79SrWx18
	KPLlzG6b7sqvGirjONVGumgA23jQuQIQp87I2fZYxsFwqmsBxezV2OqOS+i3sFF/hBH6Hn4Sjg/
	c
X-Gm-Gg: ASbGncsfdebOA5hVEjsrW8PVch81VOwfvn0FfeiptYhcBoLKP42fOuuRNz2GbBvgCAc
	YuG/MhZcx7tLszC5cJr664xQ6s6tsTMSA49ID1HPVADP8zPVuG1h867BuuMSgY11pKsmAzdz9HD
	YdLfQw0+J+Xtu7AbHiIMY/kBEljoTM+2AX68u1s0X/Z0b5kqKZ1SBP+6euPwicRHMy9BCDf9q8a
	hONjitUdMXt3Zx5lBf+GPi5qP0aKqz3SEhAFAe+tOheSw==
X-Google-Smtp-Source: AGHT+IG1TWPt77W0OHan5e5u2sStcPv+WJC8LOUfOOgZx7+/Tx2cJnKpvOWUnoLsJfs/HDlGhMbg7Q==
X-Received: by 2002:a05:6a20:9f46:b0:1e1:b0e8:11dc with SMTP id adf61e73a8af0-1e5b5a799e5mr346648637.21.1734468921217;
        Tue, 17 Dec 2024 12:55:21 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7353294b3a.69.2024.12.17.12.55.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 12:55:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/9] subversion: fix CVE-2024-46901
Date: Tue, 17 Dec 2024 12:54:53 -0800
Message-Id: <1ecab37b4c3cdc8a45b267f4da203daf9abac77a.1734468756.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734468756.git.steve@sakoman.com>
References: <cover.1734468756.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 20:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208849

From: Jiaying Song <jiaying.song.cn@windriver.com>

Insufficient validation of filenames against control characters in
Apache Subversion repositories served via mod_dav_svn allows
authenticated users with commit access to commit a corrupted revision,
leading to disruption for users of the repository. All versions of
Subversion up to and including Subversion 1.14.4 are affected if serving
repositories via mod_dav_svn. Users are recommended to upgrade to
version 1.14.5, which fixes this issue. Repositories served via other
access methods are not affected.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-46901

Upstream patches:
https://subversion.apache.org/security/CVE-2024-46901-advisory.txt

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../subversion/CVE-2024-46901.patch           | 161 ++++++++++++++++++
 .../subversion/subversion_1.14.2.bb           |   3 +-
 2 files changed, 163 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/subversion/subversion/CVE-2024-46901.patch

diff --git a/meta/recipes-devtools/subversion/subversion/CVE-2024-46901.patch b/meta/recipes-devtools/subversion/subversion/CVE-2024-46901.patch
new file mode 100644
index 0000000000..4b28a58507
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/CVE-2024-46901.patch
@@ -0,0 +1,161 @@
+From 149e299cd7eaadc8248480300b6e13b097c5b3fa Mon Sep 17 00:00:00 2001
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+Date: Fri, 13 Dec 2024 12:19:43 +0800
+Subject: [PATCH] Fix CVE-2024-46901
+
+It has been discovered that the patch for CVE-2013-1968 was incomplete and unintentionally left mod_dav_svn vulnerable to control characters in filenames.
+
+Upstream-Status: Backport
+[https://subversion.apache.org/security/CVE-2024-46901-advisory.txt]
+
+CVE: CVE-2024-46901
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ .../include/private/svn_repos_private.h       |  8 +++++
+ subversion/libsvn_repos/commit.c              |  3 +-
+ subversion/libsvn_repos/repos.c               | 10 +++++++
+ subversion/mod_dav_svn/lock.c                 |  7 +++++
+ subversion/mod_dav_svn/repos.c                | 29 +++++++++++++++++++
+ 5 files changed, 55 insertions(+), 2 deletions(-)
+
+diff --git a/subversion/include/private/svn_repos_private.h b/subversion/include/private/svn_repos_private.h
+index 1fd34e8..1d5fc9c 100644
+--- a/subversion/include/private/svn_repos_private.h
++++ b/subversion/include/private/svn_repos_private.h
+@@ -390,6 +390,14 @@ svn_repos__get_dump_editor(const svn_delta_editor_t **editor,
+                            const char *update_anchor_relpath,
+                            apr_pool_t *pool);
+ 
++/* Validate that the given PATH is a valid pathname that can be stored in
++ * a Subversion repository, according to the name constraints used by the
++ * svn_repos_* layer.
++ */
++svn_error_t *
++svn_repos__validate_new_path(const char *path,
++                             apr_pool_t *scratch_pool);
++
+ #ifdef __cplusplus
+ }
+ #endif /* __cplusplus */
+diff --git a/subversion/libsvn_repos/commit.c b/subversion/libsvn_repos/commit.c
+index 515600d..aad37ee 100644
+--- a/subversion/libsvn_repos/commit.c
++++ b/subversion/libsvn_repos/commit.c
+@@ -308,8 +308,7 @@ add_file_or_directory(const char *path,
+   svn_boolean_t was_copied = FALSE;
+   const char *full_path, *canonicalized_path;
+ 
+-  /* Reject paths which contain control characters (related to issue #4340). */
+-  SVN_ERR(svn_path_check_valid(path, pool));
++  SVN_ERR(svn_repos__validate_new_path(path, pool));
+ 
+   SVN_ERR(svn_relpath_canonicalize_safe(&canonicalized_path, NULL, path,
+                                         pool, pool));
+diff --git a/subversion/libsvn_repos/repos.c b/subversion/libsvn_repos/repos.c
+index 2189de8..119f04b 100644
+--- a/subversion/libsvn_repos/repos.c
++++ b/subversion/libsvn_repos/repos.c
+@@ -2092,3 +2092,13 @@ svn_repos__fs_type(const char **fs_type,
+                      svn_dirent_join(repos_path, SVN_REPOS__DB_DIR, pool),
+                      pool);
+ }
++
++svn_error_t *
++svn_repos__validate_new_path(const char *path,
++                             apr_pool_t *scratch_pool)
++{
++  /* Reject paths which contain control characters (related to issue #4340). */
++  SVN_ERR(svn_path_check_valid(path, scratch_pool));
++
++  return SVN_NO_ERROR;
++}
+diff --git a/subversion/mod_dav_svn/lock.c b/subversion/mod_dav_svn/lock.c
+index 7e9c94b..d2a6aa9 100644
+--- a/subversion/mod_dav_svn/lock.c
++++ b/subversion/mod_dav_svn/lock.c
+@@ -36,6 +36,7 @@
+ #include "svn_pools.h"
+ #include "svn_props.h"
+ #include "private/svn_log.h"
++#include "private/svn_repos_private.h"
+ 
+ #include "dav_svn.h"
+ 
+@@ -717,6 +718,12 @@ append_locks(dav_lockdb *lockdb,
+ 
+       /* Commit a 0-byte file: */
+ 
++      if ((serr = svn_repos__validate_new_path(resource->info->repos_path,
++                                               resource->pool)))
++        return dav_svn__convert_err(serr, HTTP_BAD_REQUEST,
++                                    "Request specifies an invalid path.",
++                                    resource->pool);
++
+       if ((serr = dav_svn__get_youngest_rev(&rev, repos, resource->pool)))
+         return dav_svn__convert_err(serr, HTTP_INTERNAL_SERVER_ERROR,
+                                     "Could not determine youngest revision",
+diff --git a/subversion/mod_dav_svn/repos.c b/subversion/mod_dav_svn/repos.c
+index 8cbd5e7..778ae9b 100644
+--- a/subversion/mod_dav_svn/repos.c
++++ b/subversion/mod_dav_svn/repos.c
+@@ -2928,6 +2928,15 @@ open_stream(const dav_resource *resource,
+ 
+   if (kind == svn_node_none) /* No existing file. */
+     {
++      serr = svn_repos__validate_new_path(resource->info->repos_path,
++                                          resource->pool);
++
++      if (serr != NULL)
++        {
++          return dav_svn__convert_err(serr, HTTP_BAD_REQUEST,
++                                      "Request specifies an invalid path.",
++                                      resource->pool);
++        }
+       serr = svn_fs_make_file(resource->info->root.root,
+                               resource->info->repos_path,
+                               resource->pool);
+@@ -4120,6 +4129,14 @@ create_collection(dav_resource *resource)
+         return err;
+     }
+ 
++  if ((serr = svn_repos__validate_new_path(resource->info->repos_path,
++                                           resource->pool)) != NULL)
++    {
++      return dav_svn__convert_err(serr, HTTP_BAD_REQUEST,
++                                  "Request specifies an invalid path.",
++                                  resource->pool);
++    }
++
+   if ((serr = svn_fs_make_dir(resource->info->root.root,
+                               resource->info->repos_path,
+                               resource->pool)) != NULL)
+@@ -4193,6 +4210,12 @@ copy_resource(const dav_resource *src,
+       if (err)
+         return err;
+     }
++  
++  serr = svn_repos__validate_new_path(dst->info->repos_path, dst->pool);
++  if (serr)
++    return dav_svn__convert_err(serr, HTTP_BAD_REQUEST,
++                                "Request specifies an invalid path.",
++                                dst->pool);
+ 
+   src_repos_path = svn_repos_path(src->info->repos->repos, src->pool);
+   dst_repos_path = svn_repos_path(dst->info->repos->repos, dst->pool);
+@@ -4430,6 +4453,12 @@ move_resource(dav_resource *src,
+   if (err)
+     return err;
+ 
++  serr = svn_repos__validate_new_path(dst->info->repos_path, dst->pool);
++  if (serr)
++    return dav_svn__convert_err(serr, HTTP_BAD_REQUEST,
++                                "Request specifies an invalid path.",
++                                dst->pool);
++
+   /* Copy the src to the dst. */
+   serr = svn_fs_copy(src->info->root.root,  /* the root object of src rev*/
+                      src->info->repos_path, /* the relative path of src */
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.2.bb b/meta/recipes-devtools/subversion/subversion_1.14.2.bb
index ba208d922f..35da95f39d 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.2.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.2.bb
@@ -10,7 +10,8 @@ DEPENDS:append:class-native = " file-replacement-native"
 
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serfmacro.patch \
-           "
+           file://CVE-2024-46901.patch \
+          "
 
 SRC_URI[sha256sum] = "c9130e8d0b75728a66f0e7038fc77052e671830d785b5616aad53b4810d3cc28"
 
-- 
2.34.1


