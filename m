Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10843.1620730753710592003
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 03:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: 3Y3HkqPhBoUuk0U2nHgpTvixPoVlGahOdbcZBuBGJbF35gmOYOtbIU9Vcy4ztp5ZaeQAJO9MR1
 k8h459g052gg==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179006556"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="179006556"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 03:59:13 -0700
IronPort-SDR: RR1pjzt3ND6Xoj1sotm3PjJcwv7nKUQRRwVZzLt+/TCnY48jqx8adxI7jbUlROHDqkjCnPTc0V
 YFTc2nmOzuKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="430252131"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga007.jf.intel.com with ESMTP; 11 May 2021 03:59:12 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 2/4] subversion: fix CVE-2020-17525
Date: Tue, 11 May 2021 18:59:08 +0800
Message-Id: <20210511105910.3052-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210511105910.3052-1-chee.yang.lee@intel.com>
References: <20210511105910.3052-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../subversion/CVE-2020-17525.patch           | 117 ++++++++++++++++++
 .../subversion/subversion_1.13.0.bb           |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion/CVE-2020-17525.patch

diff --git a/meta/recipes-devtools/subversion/subversion/CVE-2020-17525.patch b/meta/recipes-devtools/subversion/subversion/CVE-2020-17525.patch
new file mode 100644
index 0000000000..5bebde2a86
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/CVE-2020-17525.patch
@@ -0,0 +1,117 @@
+Upstream-Status: Backport [ https://subversion.apache.org/security/CVE-2020-17525-advisory.txt ] 
+CVE: CVE-2020-17525
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+  Remote unauthenticated denial-of-service in Subversion mod_authz_svn.
+
+Summary:
+========
+
+  Subversion's mod_authz_svn module will crash if the server is using
+  in-repository authz rules with the AuthzSVNReposRelativeAccessFile
+  option and a client sends a request for a non-existing repository URL.
+
+  This can lead to disruption for users of the service.
+
+Known vulnerable:
+=================
+
+  mod_dav_svn+mod_authz_svn servers 1.9.0 through 1.10.6 (inclusive).
+  mod_dav_svn+mod_authz_svn servers 1.11.0 through 1.14.0 (inclusive).
+
+Known fixed:
+============
+
+  mod_dav_svn+mod_authz_svn servers 1.14.1
+  mod_dav_svn+mod_authz_svn servers 1.10.7
+
+Details:
+========
+
+  A null-pointer-dereference has been found in mod_authz_svn that results in
+  a remote unauthenticated Denial-of-Service in some server configurations.
+
+  The vulnerability can be triggered by an unauthenticated user if the
+  Apache HTTPD server is configured to use an in-repository authz file,
+  with configuration directives such as:
+
+    AuthzSVNAccessFile "^/authz"
+    AuthzSVNReposRelativeAccessFile "^/authz"
+
+  The problem originates when sending a GET request to a non-existent
+  repository. The mod_authz_svn module will attempt to find authz rules
+  at a path within the requested SVN repository. Upon constructing this
+  path, the function svn_repos_find_root_path will return a NULL pointer
+  since the requested repository does not exist on-disk.
+  A check for this legitimate NULL pointer condition is missing, which
+  results in a segmentation fault when the NULL pointer is used.
+
+  The in-repository authz feature was first introduced in Subversion 1.8:
+  https://subversion.apache.org/docs/release-notes/1.8.html#in-repo-authz
+
+  The missing NULL check was first introduced during refactoring of the
+  authz code during development work leading up to Subversion 1.9.
+  Subversion 1.8 servers are unaffected.
+
+Severity:
+=========
+
+  CVSSv3 Base Score: 7.5 (High)
+
+  CVSSv3 Base Vector: CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+
+  Exploitation results in denial of service by crashing the HTTPD worker
+  handling the request. The impact of this differs depending on how the
+  Apache HTTPD server is configured, including the choice of MPM (Multi-
+  Processing-Module). If the worker shares its memory address space with
+  the main thread, as is the case with e.g. the Event MPM, the entire
+  HTTPD server process will terminate. If the pre-fork MPM is used, the
+  worker will terminate but the HTTPD server will stay up, and service
+  availability will depend on how frequently the attacker is able to
+  send malicious requests which target the vulnerability.
+
+Recommendations:
+================
+
+  We recommend all users to upgrade to a known fixed release of the
+  Subversion mod_dav_svn server.
+
+  Users who are unable to upgrade may apply the included patches.
+
+  As a workaround, the use of in-repository authz rules files with
+  the AuthzSVNReposRelativeAccessFile can be avoided by switching
+  to an alternative configuration which fetches an authz rules file
+  from the server's filesystem, rather than from an SVN repository.
+
+References:
+===========
+
+  CVE-2020-17525 (Subversion)
+
+Reported by:
+============
+
+  Thomas Åkesson, simonsoft.se
+
+Patches:
+========
+
+  Patch for Subversion 1.10, 1.14:
+
+[[[
+Index: subversion/libsvn_repos/config_file.c
+===================================================================
+--- a/subversion/libsvn_repos/config_file.c	(revision 1883994)
++++ b/subversion/libsvn_repos/config_file.c	(working copy)
+@@ -237,6 +237,10 @@ get_repos_config(svn_stream_t **stream,
+     {
+       /* Search for a repository in the full path. */
+       repos_root_dirent = svn_repos_find_root_path(dirent, scratch_pool);
++      if (repos_root_dirent == NULL)
++        return svn_error_trace(handle_missing_file(stream, checksum, access,
++                                                   url, must_exist,
++                                                   svn_node_none));
+ 
+       /* Attempt to open a repository at repos_root_dirent. */
+       SVN_ERR(svn_repos_open3(&access->repos, repos_root_dirent, NULL,
+]]]
diff --git a/meta/recipes-devtools/subversion/subversion_1.13.0.bb b/meta/recipes-devtools/subversion/subversion_1.13.0.bb
index 37b8ca3602..34c0dbe5b8 100644
--- a/meta/recipes-devtools/subversion/subversion_1.13.0.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.13.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://disable_macos.patch \
            file://0001-Fix-libtool-name-in-configure.ac.patch \
            file://serfmacro.patch \
+           file://CVE-2020-17525.patch \
            "
 
 SRC_URI[md5sum] = "3004b4dae18bf45a0b6ea4ef8820064d"
-- 
2.17.1

