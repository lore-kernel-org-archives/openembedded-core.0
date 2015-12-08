Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 19FDF6FFCE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 09:56:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tB89uumT018893
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Dec 2015 01:56:56 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 8 Dec 2015 01:56:55 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Dec 2015 01:56:42 -0800
Message-ID: <e1e277bf51c6f00268358f6bf8623261b1b9bc22.1449568553.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1449568553.git.liezhi.yang@windriver.com>
References: <cover.1449568553.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 14/15] subversion: fix CVE-2015-3187
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
X-List-Received-Date: Tue, 08 Dec 2015 09:56:55 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The svn_repos_trace_node_locations function in Apache Subversion before
1.7.21 and 1.8.x before 1.8.14, when path-based authorization is used,
allows remote authenticated users to obtain sensitive path information
by reading the history of a node that has been moved from a hidden path.

Patch is from:
http://subversion.apache.org/security/CVE-2015-3187-advisory.txt

(From OE-Core master rev: 6da25614edcad30fdb4bea8ff47b81ff81cdaed2)

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../subversion-CVE-2015-3187.patch                 |  346 ++++++++++++++++++++
 .../subversion/subversion_1.8.13.bb                |    1 +
 2 files changed, 347 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3187.patch

diff --git a/meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3187.patch b/meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3187.patch
new file mode 100644
index 0000000..494e11c
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3187.patch
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
+Index: subversion/libsvn_repos/rev_hunt.c
+===================================================================
+--- a/subversion/libsvn_repos/rev_hunt.c	(revision 1685077)
++++ b/subversion/libsvn_repos/rev_hunt.c	(working copy)
+@@ -726,23 +726,6 @@ svn_repos_trace_node_locations(svn_fs_t *fs,
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
+@@ -765,6 +748,20 @@ svn_repos_trace_node_locations(svn_fs_t *fs,
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
+Index: subversion/tests/cmdline/authz_tests.py
+===================================================================
+--- a/subversion/tests/cmdline/authz_tests.py	(revision 1685077)
++++ b/subversion/tests/cmdline/authz_tests.py	(working copy)
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
+Index: subversion/tests/libsvn_repos/repos-test.c
+===================================================================
+--- a/subversion/tests/libsvn_repos/repos-test.c	(revision 1685077)
++++ b/subversion/tests/libsvn_repos/repos-test.c	(working copy)
+@@ -3524,6 +3524,245 @@ test_load_r0_mergeinfo(const svn_test_opts_t *opts
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
+@@ -3573,5 +3812,7 @@ struct svn_test_descriptor_t test_funcs[] =
+                        "test dumping with r0 mergeinfo"),
+     SVN_TEST_OPTS_PASS(test_load_r0_mergeinfo,
+                        "test loading with r0 mergeinfo"),
++    SVN_TEST_OPTS_PASS(trace_node_locations_authz,
++                       "authz for svn_repos_trace_node_locations"),
+     SVN_TEST_NULL
+   };
diff --git a/meta/recipes-devtools/subversion/subversion_1.8.13.bb b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
index 9505247..68934b7 100644
--- a/meta/recipes-devtools/subversion/subversion_1.8.13.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
@@ -15,6 +15,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://disable_macos.patch \
            file://serf.m4-Regex-modified-to-allow-D-in-paths.patch \
            file://subversion-CVE-2015-3184.patch \
+           file://subversion-CVE-2015-3187.patch \
 "
 SRC_URI[md5sum] = "4413417b529d7bdf82f74e50df02e88b"
 SRC_URI[sha256sum] = "1099cc68840753b48aedb3a27ebd1e2afbcc84ddb871412e5d500e843d607579"
-- 
1.7.9.5


