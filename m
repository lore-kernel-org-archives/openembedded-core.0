Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEF4E7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 07:20:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10687.1734074440495774005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 23:20:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2077a2fd5d=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD6es5G021674
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 07:20:39 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cx4xestj-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 07:20:39 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 12 Dec 2024 23:20:38 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 12 Dec 2024 23:20:37 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [scarthgap][PATCH] subversion: fix CVE-2024-46901
Date: Fri, 13 Dec 2024 15:20:37 +0800
Message-ID: <20241213072037.2194638-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: YTNmGA-gmqseQZQqUPJNvyEWz-WKS8-a
X-Proofpoint-ORIG-GUID: YTNmGA-gmqseQZQqUPJNvyEWz-WKS8-a
X-Authority-Analysis: v=2.4 cv=Y/UCsgeN c=1 sm=1 tr=0 ts=675be047 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=PYnjg3YJAAAA:8 a=mV9VRH-2AAAA:8 a=t7CeM3EgAAAA:8 a=uNPT8g5FifnVF2vmFNIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-13_02,2024-12-12_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2412130050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 07:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208669

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
2.25.1


