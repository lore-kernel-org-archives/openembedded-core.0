Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AEF79660F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 06:00:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4G609NX004232
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 23:00:09 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 15 May 2014 23:00:08 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 May 2014 14:00:02 +0800
Message-ID: <335704eb38b18946317718c282aa49e57178172c.1400219191.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400219191.git.rongqing.li@windriver.com>
References: <cover.1400219191.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] subversion: fix for Security Advisory CVE-2013-4505
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 May 2014 06:00:08 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The is_this_legal function in mod_dontdothat for Apache Subversion 1.4.0
through 1.7.13 and 1.8.0 through 1.8.4 allows remote attackers to bypass
intended access restrictions and possibly cause a denial of service
(resource consumption) via a relative URL in a REPORT request.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4505

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../subversion-CVE-2013-4505.patch                 |  130 ++++++++++++++++++++
 .../subversion/subversion-CVE-2013-4505.patch      |  125 +++++++++++++++++++
 .../subversion/subversion_1.6.15.bb                |    2 +-
 .../subversion/subversion_1.7.10.bb                |    1 +
 4 files changed, 257 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4505.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4505.patch

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4505.patch b/meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4505.patch
new file mode 100644
index 0000000..a54d694
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4505.patch
@@ -0,0 +1,130 @@
+Upstream-Status: Backport
+
+Index: tools/server-side/mod_dontdothat/mod_dontdothat.c
+===================================================================
+--- a/tools/server-side/mod_dontdothat/mod_dontdothat.c	(revision 1239695)
++++ b/tools/server-side/mod_dontdothat/mod_dontdothat.c	(revision 1542078)
+@@ -30,12 +30,15 @@
+ #include <util_filter.h>
+ #include <ap_config.h>
+ #include <apr_strings.h>
++#include <apr_uri.h>
+ 
+ #include <expat.h>
+ 
+ #include "mod_dav_svn.h"
+ #include "svn_string.h"
+ #include "svn_config.h"
++#include "svn_path.h"
++#include "private/svn_fspath.h"
+ 
+ module AP_MODULE_DECLARE_DATA dontdothat_module;
+ 
+@@ -161,26 +164,71 @@
+     }
+ }
+ 
++/* duplicate of dav_svn__log_err() from mod_dav_svn/util.c */
++static void
++log_dav_err(request_rec *r,
++            dav_error *err,
++            int level)
++{
++    dav_error *errscan;
++
++    /* Log the errors */
++    /* ### should have a directive to log the first or all */
++    for (errscan = err; errscan != NULL; errscan = errscan->prev) {
++        apr_status_t status;
++
++        if (errscan->desc == NULL)
++            continue;
++
++#if AP_MODULE_MAGIC_AT_LEAST(20091119,0)
++        status = errscan->aprerr;
++#else
++        status = errscan->save_errno;
++#endif
++
++        ap_log_rerror(APLOG_MARK, level, status, r,
++                      "%s  [%d, #%d]",
++                      errscan->desc, errscan->status, errscan->error_id);
++    }
++}
++
+ static svn_boolean_t
+ is_this_legal(dontdothat_filter_ctx *ctx, const char *uri)
+ {
+   const char *relative_path;
+   const char *cleaned_uri;
+   const char *repos_name;
++  const char *uri_path;
+   int trailing_slash;
+   dav_error *derr;
+ 
+-  /* Ok, so we need to skip past the scheme, host, etc. */
+-  uri = ap_strstr_c(uri, "://");
+-  if (uri)
+-    uri = ap_strchr_c(uri + 3, '/');
++  /* uri can be an absolute uri or just a path, we only want the path to match
++   * against */
++  if (uri && svn_path_is_url(uri))
++    {
++      apr_uri_t parsed_uri;
++      apr_status_t rv = apr_uri_parse(ctx->r->pool, uri, &parsed_uri);
++      if (APR_SUCCESS != rv)
++        {
++          /* Error parsing the URI, log and reject request. */
++          ap_log_rerror(APLOG_MARK, APLOG_ERR, rv, ctx->r,
++                        "mod_dontdothat: blocked request after failing "
++                        "to parse uri: '%s'", uri);
++          return FALSE;
++        }
++      uri_path = parsed_uri.path;
++    }
++  else
++    {
++      uri_path = uri;
++    }
+ 
+-  if (uri)
++  if (uri_path)
+     {
+       const char *repos_path;
+ 
+       derr = dav_svn_split_uri(ctx->r,
+-                               uri,
++                               uri_path,
+                                ctx->cfg->base_path,
+                                &cleaned_uri,
+                                &trailing_slash,
+@@ -194,7 +242,7 @@
+           if (! repos_path)
+             repos_path = "";
+ 
+-          repos_path = apr_psprintf(ctx->r->pool, "/%s", repos_path);
++          repos_path = svn_fspath__canonicalize(repos_path, ctx->r->pool);
+ 
+           /* First check the special cases that are always legal... */
+           for (idx = 0; idx < ctx->allow_recursive_ops->nelts; ++idx)
+@@ -228,7 +276,20 @@
+                 }
+             }
+         }
++      else
++        {
++          log_dav_err(ctx->r, derr, APLOG_ERR);
++          return FALSE;
++        }
++
+     }
++  else
++    {
++      ap_log_rerror(APLOG_MARK, APLOG_ERR, 0, ctx->r,
++                    "mod_dontdothat: empty uri passed to is_this_legal(), "
++                    "module bug?");
++      return FALSE;
++    }
+ 
+   return TRUE;
+ }
diff --git a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4505.patch b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4505.patch
new file mode 100644
index 0000000..5430540
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4505.patch
@@ -0,0 +1,125 @@
+--- ./contrib/server-side/mod_dontdothat/mod_dontdothat.c.old	2014-04-15 10:18:54.692655905 +0800
++++ ./contrib/server-side/mod_dontdothat/mod_dontdothat.c	2014-04-15 10:29:55.559603676 +0800
+@@ -25,12 +25,15 @@
+ #include <util_filter.h>
+ #include <ap_config.h>
+ #include <apr_strings.h>
++#include <apr_uri.h>
+ 
+ #include <expat.h>
+ 
+ #include "mod_dav_svn.h"
+ #include "svn_string.h"
+ #include "svn_config.h"
++#include "svn_path.h"
++#include "private/svn_fspath.h"
+ 
+ module AP_MODULE_DECLARE_DATA dontdothat_module;
+ 
+@@ -156,26 +159,71 @@ matches(const char *wc, const char *p)
+     }
+ }
+ 
++/* duplicate of dav_svn__log_err() from mod_dav_svn/util.c */
++static void
++log_dav_err(request_rec *r,
++            dav_error *err,
++            int level)
++{
++    dav_error *errscan;
++
++    /* Log the errors */
++    /* ### should have a directive to log the first or all */
++    for (errscan = err; errscan != NULL; errscan = errscan->prev) {
++        apr_status_t status;
++
++        if (errscan->desc == NULL)
++            continue;
++
++#if AP_MODULE_MAGIC_AT_LEAST(20091119,0)
++        status = errscan->aprerr;
++#else
++        status = errscan->save_errno;
++#endif
++
++        ap_log_rerror(APLOG_MARK, level, status, r,
++                      "%s  [%d, #%d]",
++                      errscan->desc, errscan->status, errscan->error_id);
++    }
++}
++
+ static svn_boolean_t
+ is_this_legal(dontdothat_filter_ctx *ctx, const char *uri)
+ {
+   const char *relative_path;
+   const char *cleaned_uri;
+   const char *repos_name;
++  const char *uri_path;
+   int trailing_slash;
+   dav_error *derr;
+ 
+-  /* Ok, so we need to skip past the scheme, host, etc. */
+-  uri = ap_strstr_c(uri, "://");
+-  if (uri)
+-    uri = ap_strchr_c(uri + 3, '/');
++  /* uri can be an absolute uri or just a path, we only want the path to match
++   * against */
++  if (uri && svn_path_is_url(uri))
++    {
++      apr_uri_t parsed_uri;
++      apr_status_t rv = apr_uri_parse(ctx->r->pool, uri, &parsed_uri);
++      if (APR_SUCCESS != rv)
++        {
++          /* Error parsing the URI, log and reject request. */
++          ap_log_rerror(APLOG_MARK, APLOG_ERR, rv, ctx->r,
++                        "mod_dontdothat: blocked request after failing "
++                        "to parse uri: '%s'", uri);
++          return FALSE;
++        }
++      uri_path = parsed_uri.path;
++    }
++  else
++    {
++      uri_path = uri;
++    }
+ 
+-  if (uri)
++  if (uri_path)
+     {
+       const char *repos_path;
+ 
+       derr = dav_svn_split_uri(ctx->r,
+-                               uri,
++                               uri_path,
+                                ctx->cfg->base_path,
+                                &cleaned_uri,
+                                &trailing_slash,
+@@ -189,7 +237,7 @@ is_this_legal(dontdothat_filter_ctx *ctx
+           if (! repos_path)
+             repos_path = "";
+ 
+-          repos_path = apr_psprintf(ctx->r->pool, "/%s", repos_path);
++          repos_path = svn_fspath__canonicalize(repos_path, ctx->r->pool);
+ 
+           /* First check the special cases that are always legal... */
+           for (idx = 0; idx < ctx->allow_recursive_ops->nelts; ++idx)
+@@ -223,6 +271,19 @@ is_this_legal(dontdothat_filter_ctx *ctx
+                 }
+             }
+         }
++      else
++        {
++          log_dav_err(ctx->r, derr, APLOG_ERR);
++          return FALSE;
++        }
++
++    }
++  else
++    {
++      ap_log_rerror(APLOG_MARK, APLOG_ERR, 0, ctx->r,
++                    "mod_dontdothat: empty uri passed to is_this_legal(), "
++                    "module bug?");
++      return FALSE;
+     }
+ 
+   return TRUE;
diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
index 919624b..660b563 100644
--- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://subversion.tigris.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://fix-install-depends.patch \
            file://subversion-CVE-2013-1849.patch \
-          "
+           file://subversion-CVE-2013-4505.patch"
 
 SRC_URI[md5sum] = "113fca1d9e4aa389d7dc2b210010fa69"
 SRC_URI[sha256sum] = "b2919d603a5f3c19f42e3265c4b930e2376c43b3969b90ef9c42b2f72d5aaa45"
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.10.bb b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
index acef3bd..011d51b 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.10.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
@@ -14,6 +14,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://fix-install-depends.patch \
            file://allow-updated-neon.patch \
            file://neon.m4-fix-includes-and-cflags.patch \
+           file://subversion-CVE-2013-4505.patch \
 "
 SRC_URI[md5sum] = "4088a77e14232876c9b4ff1541e6e200"
 SRC_URI[sha256sum] = "c1df222bec83d014d17785e2ceba6bc80962f64b280967de0285836d8d77a8e7"
-- 
1.7.10.4


