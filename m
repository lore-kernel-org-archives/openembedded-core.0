Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C45E77188
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 22:02:38 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.117198.1734559356808776168
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 14:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Zcv2pL6A;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-728d1a2f180so132711b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 14:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734559356; x=1735164156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1s4RdZuyXknRgrySJ1RnHsbCZrT2rYbD/VplL4zpnw=;
        b=Zcv2pL6AYEKFEvJdawC5e8UBqxpFnUWwpBnCuqTRzQRkXukac4fLwuX+ijug8RNnnG
         31zimzBfwzwfXifHmmdptwHmGjWasdL0ePrpc+iA9pt/enie9mRaL1d3ghBiz1fryYqA
         qh699cHMMqptquySVQS8vEe6ODK7ACYXaFVta+KgkxEs4AEILSK18xpZbSI2Lc/fPIQJ
         91Vig7xDT/JeQXuQ6SseIZcTiKTgo/IEIEXfaCEdLC4kNRSNXstO53nkDPvTp++x4aEj
         bPvrb+0QaHy21Zb8P3AcvfDcjd2T+f0XS89jTP+Ysx+L90V4kkvZPvPOAYN0tBnfk4ML
         BrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734559356; x=1735164156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1s4RdZuyXknRgrySJ1RnHsbCZrT2rYbD/VplL4zpnw=;
        b=D6sIBvMh2QnAivGh0F1pv6YYo+xfWFvkObnspKFvCq66+l3RBKR44bGY7gBEIW/+3T
         vG1e0NMqyaVjPZUoYts53je16dwYZfHWtzGmhrlYFtvzav5r0I9ulY6+z6Qbi+0fsk3Z
         x30LVv9Xd/yXK+7mf3r8FeXDfC8nNjmbeg73nbyVjcrsSga+1H7h/yyrZiS4R7ITIsX7
         c/s009IFLuJcL5cSSHhl/mYM1Amhza5GoTpBlhVtQ/dFzb6M6YrrqA+IQlRyZU5O1m5x
         WIsKBrivMKQLFP1nhvaapiPKtCFPLMo4ESK24Fkvvtzf9X8a2UFg7hd0K4S38/MZfMZz
         Jy6g==
X-Gm-Message-State: AOJu0Yx1QRHMfGguDaspbKpEyc/MaZW7x6zYRSHGRz58Ww/wby5IrBXf
	H/ld2aPwge7x/iITaT6CCuSqtJYvuYu3jeXJWBuvW0wnRwEkm1f4NdLbyGSkQmVV77gb2KQFizt
	h
X-Gm-Gg: ASbGncvl75r8G/Ia9FQRu/x1S5NFedPg5Hy/v+61gu+64EMIYmgGz4NFQ30b/nhdhPn
	Iv9oFizbwH+Sv4D6xfoy4w08y/QRwg2jslMHOsy35ubGgI+3t6Z45nQP7ZDAULkWpcalmLD6f4r
	TaWu1D8brjjl2CPCj/UbxakZLAMoVrL1GUv2b0EwF3n/d/ZjgwX1p0zv36EM9qwYEAJOySTGC2w
	QoFK/feLK/eqxxgaVnY14bK6I2Ch4QVEhzmrXZ6ic2HAA==
X-Google-Smtp-Source: AGHT+IFP9gJHpaqEhAbwxO119CUXzyrkI5b27eKQKilJ/YeyMESgTg0yzgkQkYSpLvXgqTmj/Y7Q/Q==
X-Received: by 2002:a05:6a00:4ac4:b0:725:f359:4641 with SMTP id d2e1a72fcca58-72aa9a1a7b7mr1281140b3a.1.1734559356044;
        Wed, 18 Dec 2024 14:02:36 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5aa4b92sm7965116a12.13.2024.12.18.14.02.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 14:02:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/10] subversion: fix CVE-2024-46901
Date: Wed, 18 Dec 2024 14:02:06 -0800
Message-Id: <16c212bd9a9e9c35256ff308da72a518c76ce11d.1734553652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734553652.git.steve@sakoman.com>
References: <cover.1734553652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 22:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208882

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
 .../subversion/subversion_1.14.3.bb           |   3 +-
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
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.3.bb b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
index 1cf4e1734b..1ef3d498a5 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.3.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
@@ -10,7 +10,8 @@ DEPENDS:append:class-native = " file-replacement-native"
 
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serfmacro.patch \
-           "
+           file://CVE-2024-46901.patch \
+          "
 
 SRC_URI[sha256sum] = "949efd451a09435f7e8573574c71c7b71b194d844890fa49cd61d2262ea1a440"
 
-- 
2.34.1


