Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3946C32771
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 07:20:00 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web08.3643.1663744792382674388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 00:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=dXhL6FTW;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663744792; x=1695280792;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=plspSOpJMrQiBEmMal1dNqIjbyycuzKb6aGeZQZJZTs=;
  b=dXhL6FTWY/f0s+puIUHnQdawHwFRFoevC5BEfwNISkQUXNSBvfNu+c5b
   0pqCY8XVu90PPQ6wu1sG8MkgDMGRrv1qTl4Kxp1vyYK/nnbOGXGXRQFLE
   Eef/C5tAkKsM4psgZU/mjUrUJjmQc3kdM+SrfieoXUmsDbk2QjHIARQyf
   dtBnrIk7u3UF7QihuiT7N3gWgpgpLTS7TwpEjSvjGrmgrVQ79WJQALsbn
   384HEZw4jR9dV1oU6ZF+zEnDLN5DOzIZL5CFze9aWsypqhM5lt5lV6GHE
   547JGzfgOXU83Cj4LifkFaMobd8Heuf84UraeOqEBWvl+cXsQDba5S789
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="286995276"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200";
   d="scan'208";a="286995276"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 00:19:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200";
   d="scan'208";a="652420872"
Received: from cheeyang-desk1.png.intel.com ([10.158.87.104])
  by orsmga001.jf.intel.com with ESMTP; 21 Sep 2022 00:19:50 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH] subversion: fix CVE-2021-28544
Date: Wed, 21 Sep 2022 15:18:36 +0800
Message-Id: <20220921071836.1031932-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 07:20:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170932

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../subversion/CVE-2021-28544.patch           | 146 ++++++++++++++++++
 .../subversion/subversion_1.13.0.bb           |   1 +
 2 files changed, 147 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion/CVE-2021-28544.patch

diff --git a/meta/recipes-devtools/subversion/subversion/CVE-2021-28544.patch b/meta/recipes-devtools/subversion/subversion/CVE-2021-28544.patch
new file mode 100644
index 0000000000..030ead6c66
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/CVE-2021-28544.patch
@@ -0,0 +1,146 @@
+From 61382fd8ea66000bd9ee8e203a6eab443220ee40 Mon Sep 17 00:00:00 2001
+From: Nathan Hartman <hartmannathan@apache.org>
+Date: Sun, 27 Mar 2022 05:59:18 +0000
+Subject: [PATCH] On the 1.14.x-r1899227 branch: Merge r1899227 from trunk
+ w/testlist variation
+
+git-svn-id: https://svn.apache.org/repos/asf/subversion/branches/1.14.x-r1899227@1899229 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2021-28544 [https://github.com/apache/subversion/commit/61382fd8ea66000bd9ee8e203a6eab443220ee40]
+Upstream-Status: Backport
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ subversion/libsvn_repos/log.c           | 26 +++++-------
+ subversion/tests/cmdline/authz_tests.py | 55 +++++++++++++++++++++++++
+ 2 files changed, 65 insertions(+), 16 deletions(-)
+
+diff --git a/subversion/libsvn_repos/log.c b/subversion/libsvn_repos/log.c
+index d9a1fb1085e16..41ca8aed27174 100644
+--- a/subversion/libsvn_repos/log.c
++++ b/subversion/libsvn_repos/log.c
+@@ -337,42 +337,36 @@ detect_changed(svn_repos_revision_access_level_t *access_level,
+       if (   (change->change_kind == svn_fs_path_change_add)
+           || (change->change_kind == svn_fs_path_change_replace))
+         {
+-          const char *copyfrom_path = change->copyfrom_path;
+-          svn_revnum_t copyfrom_rev = change->copyfrom_rev;
+-
+           /* the following is a potentially expensive operation since on FSFS
+              we will follow the DAG from ROOT to PATH and that requires
+              actually reading the directories along the way. */
+           if (!change->copyfrom_known)
+             {
+-              SVN_ERR(svn_fs_copied_from(&copyfrom_rev, &copyfrom_path,
++              SVN_ERR(svn_fs_copied_from(&change->copyfrom_rev, &change->copyfrom_path,
+                                         root, path, iterpool));
+               change->copyfrom_known = TRUE;
+             }
+ 
+-          if (copyfrom_path && SVN_IS_VALID_REVNUM(copyfrom_rev))
++          if (change->copyfrom_path && SVN_IS_VALID_REVNUM(change->copyfrom_rev))
+             {
+-              svn_boolean_t readable = TRUE;
+-
+               if (callbacks->authz_read_func)
+                 {
+                   svn_fs_root_t *copyfrom_root;
++                  svn_boolean_t readable;
+ 
+                   SVN_ERR(svn_fs_revision_root(&copyfrom_root, fs,
+-                                               copyfrom_rev, iterpool));
++                                               change->copyfrom_rev, iterpool));
+                   SVN_ERR(callbacks->authz_read_func(&readable,
+                                                      copyfrom_root,
+-                                                     copyfrom_path,
++                                                     change->copyfrom_path,
+                                                      callbacks->authz_read_baton,
+                                                      iterpool));
+                   if (! readable)
+-                    found_unreadable = TRUE;
+-                }
+-
+-              if (readable)
+-                {
+-                  change->copyfrom_path = copyfrom_path;
+-                  change->copyfrom_rev = copyfrom_rev;
++                    {
++                      found_unreadable = TRUE;
++                      change->copyfrom_path = NULL;
++                      change->copyfrom_rev = SVN_INVALID_REVNUM;
++                    }
+                 }
+             }
+         }
+diff --git a/subversion/tests/cmdline/authz_tests.py b/subversion/tests/cmdline/authz_tests.py
+index 760cb3663d02f..92e8a5e1935c9 100755
+--- a/subversion/tests/cmdline/authz_tests.py
++++ b/subversion/tests/cmdline/authz_tests.py
+@@ -1731,6 +1731,60 @@ def empty_group(sbox):
+                                      '--username', svntest.main.wc_author,
+                                      sbox.repo_url)
+ 
++@Skip(svntest.main.is_ra_type_file)
++def log_inaccessible_copyfrom(sbox):
++  "log doesn't leak inaccessible copyfrom paths"
++
++  sbox.build(empty=True)
++  sbox.simple_add_text('secret', 'private')
++  sbox.simple_commit(message='log message for r1')
++  sbox.simple_copy('private', 'public')
++  sbox.simple_commit(message='log message for r2')
++
++  svntest.actions.enable_revprop_changes(sbox.repo_dir)
++  # Remove svn:date and svn:author for predictable output.
++  svntest.actions.run_and_verify_svn(None, [], 'propdel', '--revprop',
++                                     '-r2', 'svn:date', sbox.repo_url)
++  svntest.actions.run_and_verify_svn(None, [], 'propdel', '--revprop',
++                                     '-r2', 'svn:author', sbox.repo_url)
++
++  write_restrictive_svnserve_conf(sbox.repo_dir)
++
++  # First test with blanket access.
++  write_authz_file(sbox,
++                   {"/" : "* = rw"})
++  expected_output = svntest.verify.ExpectedOutput([
++    "------------------------------------------------------------------------\n",
++    "r2 | (no author) | (no date) | 1 line\n",
++    "Changed paths:\n",
++    "   A /public (from /private:1)\n",
++    "\n",
++    "log message for r2\n",
++    "------------------------------------------------------------------------\n",
++  ])
++  svntest.actions.run_and_verify_svn(expected_output, [],
++                                     'log', '-r2', '-v',
++                                     sbox.repo_url)
++
++  # Now test with an inaccessible copy source (/private).
++  write_authz_file(sbox,
++                   {"/" : "* = rw"},
++                   {"/private" : "* ="})
++  expected_output = svntest.verify.ExpectedOutput([
++    "------------------------------------------------------------------------\n",
++    "r2 | (no author) | (no date) | 1 line\n",
++    "Changed paths:\n",
++    # The copy is shown as a plain add with no copyfrom info.
++    "   A /public\n",
++    "\n",
++    # No log message, as the revision is only partially visible.
++    "\n",
++    "------------------------------------------------------------------------\n",
++  ])
++  svntest.actions.run_and_verify_svn(expected_output, [],
++                                     'log', '-r2', '-v',
++                                     sbox.repo_url)
++
+ 
+ ########################################################################
+ # Run the tests
+@@ -1771,6 +1825,7 @@ def empty_group(sbox):
+               inverted_group_membership,
+               group_member_empty_string,
+               empty_group,
++              log_inaccessible_copyfrom,
+              ]
+ serial_only = True
+ 
diff --git a/meta/recipes-devtools/subversion/subversion_1.13.0.bb b/meta/recipes-devtools/subversion/subversion_1.13.0.bb
index 34c0dbe5b8..5643191569 100644
--- a/meta/recipes-devtools/subversion/subversion_1.13.0.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.13.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-Fix-libtool-name-in-configure.ac.patch \
            file://serfmacro.patch \
            file://CVE-2020-17525.patch \
+           file://CVE-2021-28544.patch \
            "
 
 SRC_URI[md5sum] = "3004b4dae18bf45a0b6ea4ef8820064d"
-- 
2.34.1


