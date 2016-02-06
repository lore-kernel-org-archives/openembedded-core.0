Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9A76E7724D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:25 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c10so6527703pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=UjV9/TGHRtEzfaRcJ3/On0gvEOZkNXTykFgmtE+wdZU=;
	b=QQ3plXLuKuRGyZYRMZ8MjBXc6qkHubfp6bIie0ik4+y8zIywpDsU1FrdQYCjK1q76w
	YMMV4Hh2km2Oj3ndZWcfQbFxC+adMGe3LvEAwaJaVNT/D804dnWCB9coqfSMpxwy1RrH
	QaK53QtmmgiDvF8XsCPmRAckAYNx74SBvlg/d/tHCvfUSVoY5xrFtWRwCHZ2oUIn2sot
	hSPKtGZ05+jY8le2mOHXxcomcMfueW6Xm738UvFso8iCtSZbBwe81uj9rB4yIKmF1/6k
	hpKHIciVBawlhbJZDp+WQtTKylywjXK8iLX5F9L94MhSLxYyY09GBY9TX860QOZwzFJY
	s8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=UjV9/TGHRtEzfaRcJ3/On0gvEOZkNXTykFgmtE+wdZU=;
	b=Ts4tiai3yTsyOO09IWQlPrLYsTlSlIm9+zqAM9sh+CowBLAgTgm4scJxdhC1bwvmtV
	/2jVAnEkeBDuDqHTls1cK4GnZIN69qZ63fJBhhzWyy5/aLNgT7zxOkpLoxK+XVsNM3Xj
	WC6JjnVktvr6YTm5m3ha38bJuyksl+kD862iJPMieEzWElddNfxV/v1B1+Mx3v2aj89A
	RsFmmbuEvPTihlzH1kV54CUmAn6chf50Zr7bPZLm9wppjMC1r0TFB/WtdApTBZmdrdjR
	jDefMeMvaYUfUcv7dG2XqF67rOtiniUPPkzdwIH2ZyCX7Q5DQwJtoFY+GTPCOKy3UpjR
	NX/Q==
X-Gm-Message-State: AG10YORfW0mTXSuUxM0CSTOo2wBlnRC1Hu8hfCLUAg77Vh+FFo+UYnJifbOrZsjk7pN0dQ==
X-Received: by 10.98.12.8 with SMTP id u8mr2114351pfi.36.1454800526677;
	Sat, 06 Feb 2016 15:15:26 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:14:49 -0800
Message-Id: <0a95cb6d6b689460e1bd19c81c2b6adbb3a37d7d.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 08/21] subversion: fix CVE-2015-3187
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:25 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

The svn_repos_trace_node_locations function in Apache Subversion before
1.7.21 and 1.8.x before 1.8.14, when path-based authorization is used,
allows remote authenticated users to obtain sensitive path information
by reading the history of a node that has been moved from a hidden path.

Patch is from:
http://subversion.apache.org/security/CVE-2015-3187-advisory.txt

(From OE-Core master rev: 6da25614edcad30fdb4bea8ff47b81ff81cdaed2)

(From OE-Core rev: e1e277bf51c6f00268358f6bf8623261b1b9bc22)

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../subversion-CVE-2015-3187.patch                 | 346 +++++++++++++++++++++
 .../subversion/subversion_1.8.11.bb                |   1 +
 2 files changed, 347 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.11/subversion-CVE-2015-3187.patch

diff --git a/meta/recipes-devtools/subversion/subversion-1.8.11/subversion-CVE-2015-3187.patch b/meta/recipes-devtools/subversion/subversion-1.8.11/subversion-CVE-2015-3187.patch
new file mode 100644
index 0000000..e300380
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.8.11/subversion-CVE-2015-3187.patch
@@ -0,0 +1,346 @@
+Fix CVE-2015-3187
+
+Patch is from:
+http://subversion.apache.org/security/CVE-2015-3187-advisory.txt
+
+Upstream-Status: Backport
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+
+Index: subversion-1.8.11/subversion/libsvn_repos/rev_hunt.c
+===================================================================
+--- subversion-1.8.11.orig/subversion/libsvn_repos/rev_hunt.c
++++ subversion-1.8.11/subversion/libsvn_repos/rev_hunt.c
+@@ -726,23 +726,6 @@ svn_repos_trace_node_locations(svn_fs_t
+       if (! prev_path)
+         break;
+ 
+-      if (authz_read_func)
+-        {
+-          svn_boolean_t readable;
+-          svn_fs_root_t *tmp_root;
+-
+-          SVN_ERR(svn_fs_revision_root(&tmp_root, fs, revision, currpool));
+-          SVN_ERR(authz_read_func(&readable, tmp_root, path,
+-                                  authz_read_baton, currpool));
+-          if (! readable)
+-            {
+-              svn_pool_destroy(lastpool);
+-              svn_pool_destroy(currpool);
+-
+-              return SVN_NO_ERROR;
+-            }
+-        }
+-
+       /* Assign the current path to all younger revisions until we reach
+          the copy target rev. */
+       while ((revision_ptr < revision_ptr_end)
+@@ -765,6 +748,20 @@ svn_repos_trace_node_locations(svn_fs_t
+       path = prev_path;
+       revision = prev_rev;
+ 
++      if (authz_read_func)
++        {
++          svn_boolean_t readable;
++          SVN_ERR(svn_fs_revision_root(&root, fs, revision, currpool));
++          SVN_ERR(authz_read_func(&readable, root, path,
++                                  authz_read_baton, currpool));
++          if (!readable)
++            {
++              svn_pool_destroy(lastpool);
++              svn_pool_destroy(currpool);
++              return SVN_NO_ERROR;
++            }
++        }
++
+       /* Clear last pool and switch. */
+       svn_pool_clear(lastpool);
+       tmppool = lastpool;
+Index: subversion-1.8.11/subversion/tests/cmdline/authz_tests.py
+===================================================================
+--- subversion-1.8.11.orig/subversion/tests/cmdline/authz_tests.py
++++ subversion-1.8.11/subversion/tests/cmdline/authz_tests.py
+@@ -609,8 +609,10 @@ def authz_log_and_tracing_test(sbox):
+ 
+   ## cat
+ 
++  expected_err2 = ".*svn: E195012: Unable to find repository location.*"
++
+   # now see if we can look at the older version of rho
+-  svntest.actions.run_and_verify_svn(None, None, expected_err,
++  svntest.actions.run_and_verify_svn(None, None, expected_err2,
+                                      'cat', '-r', '2', D_url+'/rho')
+ 
+   if sbox.repo_url.startswith('http'):
+@@ -627,10 +629,11 @@ def authz_log_and_tracing_test(sbox):
+   svntest.actions.run_and_verify_svn(None, None, expected_err,
+                                      'diff', '-r', 'HEAD', G_url+'/rho')
+ 
+-  svntest.actions.run_and_verify_svn(None, None, expected_err,
++  # diff treats the unreadable path as indicating an add so no error
++  svntest.actions.run_and_verify_svn(None, None, [],
+                                      'diff', '-r', '2', D_url+'/rho')
+ 
+-  svntest.actions.run_and_verify_svn(None, None, expected_err,
++  svntest.actions.run_and_verify_svn(None, None, [],
+                                      'diff', '-r', '2:4', D_url+'/rho')
+ 
+ # test whether read access is correctly granted and denied
+Index: subversion-1.8.11/subversion/tests/libsvn_repos/repos-test.c
+===================================================================
+--- subversion-1.8.11.orig/subversion/tests/libsvn_repos/repos-test.c
++++ subversion-1.8.11/subversion/tests/libsvn_repos/repos-test.c
+@@ -3320,6 +3320,245 @@ test_dump_r0_mergeinfo(const svn_test_op
+   return SVN_NO_ERROR;
+ }
+ 
++static svn_error_t *
++mkdir_delete_copy(svn_repos_t *repos,
++                  const char *src,
++                  const char *dst,
++                  apr_pool_t *pool)
++{
++  svn_fs_t *fs = svn_repos_fs(repos);
++  svn_revnum_t youngest_rev;
++  svn_fs_txn_t *txn;
++  svn_fs_root_t *txn_root, *rev_root;
++
++  SVN_ERR(svn_fs_youngest_rev(&youngest_rev, fs, pool));
++  
++  SVN_ERR(svn_fs_begin_txn(&txn, fs, youngest_rev, pool));
++  SVN_ERR(svn_fs_txn_root(&txn_root, txn, pool));
++  SVN_ERR(svn_fs_make_dir(txn_root, "A/T", pool));
++  SVN_ERR(svn_repos_fs_commit_txn(NULL, repos, &youngest_rev, txn, pool));
++
++  SVN_ERR(svn_fs_begin_txn(&txn, fs, youngest_rev, pool));
++  SVN_ERR(svn_fs_txn_root(&txn_root, txn, pool));
++  SVN_ERR(svn_fs_delete(txn_root, "A/T", pool));
++  SVN_ERR(svn_repos_fs_commit_txn(NULL, repos, &youngest_rev, txn, pool));
++
++  SVN_ERR(svn_fs_begin_txn(&txn, fs, youngest_rev, pool));
++  SVN_ERR(svn_fs_txn_root(&txn_root, txn, pool));
++  SVN_ERR(svn_fs_revision_root(&rev_root, fs, youngest_rev - 1, pool));
++  SVN_ERR(svn_fs_copy(rev_root, src, txn_root, dst, pool));
++  SVN_ERR(svn_repos_fs_commit_txn(NULL, repos, &youngest_rev, txn, pool));
++
++  return SVN_NO_ERROR;
++}
++
++struct authz_read_baton_t {
++  apr_hash_t *paths;
++  apr_pool_t *pool;
++  const char *deny;
++};
++
++static svn_error_t *
++authz_read_func(svn_boolean_t *allowed,
++                svn_fs_root_t *root,
++                const char *path,
++                void *baton,
++                apr_pool_t *pool)
++{
++  struct authz_read_baton_t *b = baton;
++
++  if (b->deny && !strcmp(b->deny, path))
++    *allowed = FALSE;
++  else
++    *allowed = TRUE;
++
++  svn_hash_sets(b->paths, apr_pstrdup(b->pool, path), (void*)1);
++
++  return SVN_NO_ERROR;
++}
++
++static svn_error_t *
++verify_locations(apr_hash_t *actual,
++                 apr_hash_t *expected,
++                 apr_hash_t *checked,
++                 apr_pool_t *pool)
++{
++  apr_hash_index_t *hi;
++
++  for (hi = apr_hash_first(pool, expected); hi; hi = apr_hash_next(hi))
++    {
++      const svn_revnum_t *rev = svn__apr_hash_index_key(hi);
++      const char *path = apr_hash_get(actual, rev, sizeof(svn_revnum_t));
++
++      if (!path)
++        return svn_error_createf(SVN_ERR_TEST_FAILED, NULL,
++                                 "expected %s for %d found (null)",
++                                 (char*)svn__apr_hash_index_val(hi),
++                                 (int)*rev);
++      else if (strcmp(path, svn__apr_hash_index_val(hi)))
++        return svn_error_createf(SVN_ERR_TEST_FAILED, NULL,
++                                 "expected %s for %d found %s",
++                                 (char*)svn__apr_hash_index_val(hi),
++                                 (int)*rev, path);
++
++    }
++
++  for (hi = apr_hash_first(pool, actual); hi; hi = apr_hash_next(hi))
++    {
++      const svn_revnum_t *rev = svn__apr_hash_index_key(hi);
++      const char *path = apr_hash_get(expected, rev, sizeof(svn_revnum_t));
++
++      if (!path)
++        return svn_error_createf(SVN_ERR_TEST_FAILED, NULL,
++                                 "found %s for %d expected (null)",
++                                 (char*)svn__apr_hash_index_val(hi),
++                                 (int)*rev);
++      else if (strcmp(path, svn__apr_hash_index_val(hi)))
++        return svn_error_createf(SVN_ERR_TEST_FAILED, NULL,
++                                 "found %s for %d expected %s",
++                                 (char*)svn__apr_hash_index_val(hi),
++                                 (int)*rev, path);
++
++      if (!svn_hash_gets(checked, path))
++        return svn_error_createf(SVN_ERR_TEST_FAILED, NULL,
++                                 "did not check %s", path);
++    }
++
++  return SVN_NO_ERROR;
++}
++
++static void
++set_expected(apr_hash_t *expected,
++             svn_revnum_t rev,
++             const char *path,
++             apr_pool_t *pool)
++{
++  svn_revnum_t *rp = apr_palloc(pool, sizeof(svn_revnum_t));
++  *rp = rev;
++  apr_hash_set(expected, rp, sizeof(svn_revnum_t), path);
++}
++
++static svn_error_t *
++trace_node_locations_authz(const svn_test_opts_t *opts,
++                           apr_pool_t *pool)
++{
++  svn_repos_t *repos;
++  svn_fs_t *fs;
++  svn_revnum_t youngest_rev = 0;
++  svn_fs_txn_t *txn;
++  svn_fs_root_t *txn_root;
++  struct authz_read_baton_t arb;
++  apr_array_header_t *revs = apr_array_make(pool, 10, sizeof(svn_revnum_t));
++  apr_hash_t *locations;
++  apr_hash_t *expected = apr_hash_make(pool);
++  int i;
++
++  /* Create test repository. */
++  SVN_ERR(svn_test__create_repos(&repos, "test-repo-trace-node-locations-authz",
++                                 opts, pool));
++  fs = svn_repos_fs(repos);
++
++  /* r1 create A */
++  SVN_ERR(svn_fs_begin_txn(&txn, fs, youngest_rev, pool));
++  SVN_ERR(svn_fs_txn_root(&txn_root, txn, pool));
++  SVN_ERR(svn_fs_make_dir(txn_root, "A", pool));
++  SVN_ERR(svn_fs_make_file(txn_root, "A/f", pool));
++  SVN_ERR(svn_test__set_file_contents(txn_root, "A/f", "foobar", pool));
++  SVN_ERR(svn_repos_fs_commit_txn(NULL, repos, &youngest_rev, txn, pool));
++
++  /* r4 copy A to B */
++  SVN_ERR(mkdir_delete_copy(repos, "A", "B", pool));
++
++  /* r7 copy B to C */
++  SVN_ERR(mkdir_delete_copy(repos, "B", "C", pool));
++
++  /* r10 copy C to D */
++  SVN_ERR(mkdir_delete_copy(repos, "C", "D", pool));
++
++  SVN_ERR(svn_fs_youngest_rev(&youngest_rev, fs, pool));
++  SVN_ERR_ASSERT(youngest_rev == 10);
++
++  arb.paths = apr_hash_make(pool);
++  arb.pool = pool;
++  arb.deny = NULL;
++
++  apr_array_clear(revs);
++  for (i = 0; i <= youngest_rev; ++i)
++    APR_ARRAY_PUSH(revs, svn_revnum_t) = i;
++  set_expected(expected, 10, "/D/f", pool);
++  set_expected(expected, 8, "/C/f", pool);
++  set_expected(expected, 7, "/C/f", pool);
++  set_expected(expected, 5, "/B/f", pool);
++  set_expected(expected, 4, "/B/f", pool);
++  set_expected(expected, 2, "/A/f", pool);
++  set_expected(expected, 1, "/A/f", pool);
++  apr_hash_clear(arb.paths);
++  SVN_ERR(svn_repos_trace_node_locations(fs, &locations, "D/f", 10, revs,
++                                         authz_read_func, &arb, pool));
++  SVN_ERR(verify_locations(locations, expected, arb.paths, pool));
++
++  apr_array_clear(revs);
++  for (i = 1; i <= youngest_rev; ++i)
++    APR_ARRAY_PUSH(revs, svn_revnum_t) = i;
++  apr_hash_clear(arb.paths);
++  SVN_ERR(svn_repos_trace_node_locations(fs, &locations, "D/f", 10, revs,
++                                         authz_read_func, &arb, pool));
++  SVN_ERR(verify_locations(locations, expected, arb.paths, pool));
++
++  apr_array_clear(revs);
++  for (i = 2; i <= youngest_rev; ++i)
++    APR_ARRAY_PUSH(revs, svn_revnum_t) = i;
++  set_expected(expected, 1, NULL, pool);
++  apr_hash_clear(arb.paths);
++  SVN_ERR(svn_repos_trace_node_locations(fs, &locations, "D/f", 10, revs,
++                                         authz_read_func, &arb, pool));
++  SVN_ERR(verify_locations(locations, expected, arb.paths, pool));
++
++  apr_array_clear(revs);
++  for (i = 3; i <= youngest_rev; ++i)
++    APR_ARRAY_PUSH(revs, svn_revnum_t) = i;
++  set_expected(expected, 2, NULL, pool);
++  apr_hash_clear(arb.paths);
++  SVN_ERR(svn_repos_trace_node_locations(fs, &locations, "D/f", 10, revs,
++                                         authz_read_func, &arb, pool));
++  SVN_ERR(verify_locations(locations, expected, arb.paths, pool));
++
++  apr_array_clear(revs);
++  for (i = 6; i <= youngest_rev; ++i)
++    APR_ARRAY_PUSH(revs, svn_revnum_t) = i;
++  set_expected(expected, 5, NULL, pool);
++  set_expected(expected, 4, NULL, pool);
++  apr_hash_clear(arb.paths);
++  SVN_ERR(svn_repos_trace_node_locations(fs, &locations, "D/f", 10, revs,
++                                         authz_read_func, &arb, pool));
++  SVN_ERR(verify_locations(locations, expected, arb.paths, pool));
++
++  arb.deny = "/B/f";
++  apr_array_clear(revs);
++  for (i = 0; i <= youngest_rev; ++i)
++    APR_ARRAY_PUSH(revs, svn_revnum_t) = i;
++  apr_hash_clear(arb.paths);
++  SVN_ERR(svn_repos_trace_node_locations(fs, &locations, "D/f", 10, revs,
++                                         authz_read_func, &arb, pool));
++  SVN_ERR(verify_locations(locations, expected, arb.paths, pool));
++
++  apr_array_clear(revs);
++  for (i = 6; i <= youngest_rev; ++i)
++    APR_ARRAY_PUSH(revs, svn_revnum_t) = i;
++  apr_hash_clear(arb.paths);
++  SVN_ERR(svn_repos_trace_node_locations(fs, &locations, "D/f", 10, revs,
++                                         authz_read_func, &arb, pool));
++  SVN_ERR(verify_locations(locations, expected, arb.paths, pool));
++
++  APR_ARRAY_PUSH(revs, svn_revnum_t) = 0;
++  apr_hash_clear(arb.paths);
++  SVN_ERR(svn_repos_trace_node_locations(fs, &locations, "D/f", 10, revs,
++                                         authz_read_func, &arb, pool));
++  SVN_ERR(verify_locations(locations, expected, arb.paths, pool));
++
++  return SVN_NO_ERROR;
++}
++
+ /* The test table.  */
+ 
+ struct svn_test_descriptor_t test_funcs[] =
+@@ -3367,5 +3606,7 @@ struct svn_test_descriptor_t test_funcs[
+                        "test filenames with control characters"),
+     SVN_TEST_OPTS_PASS(test_dump_r0_mergeinfo,
+                        "test dumping with r0 mergeinfo"),
++    SVN_TEST_OPTS_PASS(trace_node_locations_authz,
++                        "authz for svn_repos_trace_node_locations"),
+     SVN_TEST_NULL
+   };
diff --git a/meta/recipes-devtools/subversion/subversion_1.8.11.bb b/meta/recipes-devtools/subversion/subversion_1.8.11.bb
index 7893929..b2825d9 100644
--- a/meta/recipes-devtools/subversion/subversion_1.8.11.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.8.11.bb
@@ -13,6 +13,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://disable_macos.patch \
            file://subversion-CVE-2015-3184.patch \
+           file://subversion-CVE-2015-3187.patch \
 "
 SRC_URI[md5sum] = "766a89bbbb388f8eb76166672d3b9e49"
 SRC_URI[sha256sum] = "10b056420e1f194c12840368f6bf58842e6200f9cb8cc5ebbf9be2e89e56e4d9"
-- 
2.3.5


