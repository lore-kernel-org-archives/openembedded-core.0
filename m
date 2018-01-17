Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EE77D78743
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 15:25:49 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0HFPnbx021657
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 17 Jan 2018 15:25:50 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ebpb3-0004l0-0Q; Wed, 17 Jan 2018 15:25:49 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 15:25:45 +0000
Message-Id: <1516202745-18231-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516202745-18231-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1516202745-18231-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 4/4] subversion: upgrade 1.9.6 -> 1.9.7
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
X-List-Received-Date: Wed, 17 Jan 2018 15:25:50 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../subversion/subversion/CVE-2017-9800.patch      | 136 ---------------------
 .../{subversion_1.9.6.bb => subversion_1.9.7.bb}   |   5 +-
 2 files changed, 2 insertions(+), 139 deletions(-)
 delete mode 100644 meta/recipes-devtools/subversion/subversion/CVE-2017-9800.patch
 rename meta/recipes-devtools/subversion/{subversion_1.9.6.bb => subversion_1.9.7.bb} (95%)

diff --git a/meta/recipes-devtools/subversion/subversion/CVE-2017-9800.patch b/meta/recipes-devtools/subversion/subversion/CVE-2017-9800.patch
deleted file mode 100644
index 0599c2b..0000000
--- a/meta/recipes-devtools/subversion/subversion/CVE-2017-9800.patch
+++ /dev/null
@@ -1,136 +0,0 @@
-------------------------------------------------------------------------
-r1804691 | danielsh | 2017-08-10 11:14:13 -0700 (Thu, 10 Aug 2017) | 18 lines
-
-Fix CVE-2017-9800.
-
-See: https://subversion.apache.org/security/CVE-2017-0800-advisory.txt
-
-* subversion/libsvn_ra_svn/client.c
-  (svn_ctype.h): Include.
-  (find_tunnel_agent): Pass a "--" end-of-options guard to ssh.
-    Expect the 'hostinfo' parameter to be URI-decoded.
-  (is_valid_hostinfo): New.
-  (ra_svn_open): Validate the hostname before using it.
-
-* subversion/libsvn_subr/config_file.c
-  (svn_config_ensure): Update the example configuration likewise.
-
-Patch by: philip
-Review by: danielsh
-           stsp
-           astieger (earlier version)
-
-Upstream-Status: Backport
-http://svn.apache.org/viewvc?view=revision&amp;sortby=rev&amp;revision=1804691
-
-CVE: CVE-2017-9800
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
-Index: subversion/libsvn_subr/config_file.c
-===================================================================
---- subversion/libsvn_subr/config_file.c	(revision 1804690)
-+++ subversion/libsvn_subr/config_file.c	(revision 1804691)
-@@ -1448,12 +1448,12 @@
-         "### passed to the tunnel agent as <user>@<hostname>.)  If the"      NL
-         "### built-in ssh scheme were not predefined, it could be defined"   NL
-         "### as:"                                                            NL
--        "# ssh = $SVN_SSH ssh -q"                                            NL
-+        "# ssh = $SVN_SSH ssh -q --"                                         NL
-         "### If you wanted to define a new 'rsh' scheme, to be used with"    NL
-         "### 'svn+rsh:' URLs, you could do so as follows:"                   NL
--        "# rsh = rsh"                                                        NL
-+        "# rsh = rsh --"                                                     NL
-         "### Or, if you wanted to specify a full path and arguments:"        NL
--        "# rsh = /path/to/rsh -l myusername"                                 NL
-+        "# rsh = /path/to/rsh -l myusername --"                              NL
-         "### On Windows, if you are specifying a full path to a command,"    NL
-         "### use a forward slash (/) or a paired backslash (\\\\) as the"    NL
-         "### path separator.  A single backslash will be treated as an"      NL
-Index: subversion/libsvn_ra_svn/client.c
-===================================================================
---- subversion/libsvn_ra_svn/client.c	(revision 1804690)
-+++ subversion/libsvn_ra_svn/client.c	(revision 1804691)
-@@ -46,6 +46,7 @@
- #include "svn_props.h"
- #include "svn_mergeinfo.h"
- #include "svn_version.h"
-+#include "svn_ctype.h"
- 
- #include "svn_private_config.h"
- 
-@@ -398,7 +399,7 @@
-        * versions have it too. If the user is using some other ssh
-        * implementation that doesn't accept it, they can override it
-        * in the [tunnels] section of the config. */
--      val = "$SVN_SSH ssh -q";
-+      val = "$SVN_SSH ssh -q --";
-     }
- 
-   if (!val || !*val)
-@@ -443,7 +444,7 @@
-   for (n = 0; cmd_argv[n] != NULL; n++)
-     argv[n] = cmd_argv[n];
- 
--  argv[n++] = svn_path_uri_decode(hostinfo, pool);
-+  argv[n++] = hostinfo;
-   argv[n++] = "svnserve";
-   argv[n++] = "-t";
-   argv[n] = NULL;
-@@ -811,7 +812,33 @@
- }
- 
- 
-+/* A simple whitelist to ensure the following are valid:
-+ *   user@server
-+ *   [::1]:22
-+ *   server-name
-+ *   server_name
-+ *   127.0.0.1
-+ * with an extra restriction that a leading '-' is invalid.
-+ */
-+static svn_boolean_t
-+is_valid_hostinfo(const char *hostinfo)
-+{
-+  const char *p = hostinfo;
- 
-+  if (p[0] == '-')
-+    return FALSE;
-+
-+  while (*p)
-+    {
-+      if (!svn_ctype_isalnum(*p) && !strchr(":.-_[]@", *p))
-+        return FALSE;
-+
-+      ++p;
-+    }
-+
-+  return TRUE;
-+}
-+
- static svn_error_t *ra_svn_open(svn_ra_session_t *session,
-                                 const char **corrected_url,
-                                 const char *url,
-@@ -844,8 +871,18 @@
-           || (callbacks->check_tunnel_func && callbacks->open_tunnel_func
-               && !callbacks->check_tunnel_func(callbacks->tunnel_baton,
-                                                tunnel))))
--    SVN_ERR(find_tunnel_agent(tunnel, uri.hostinfo, &tunnel_argv, config,
--                              result_pool));
-+    {
-+      const char *decoded_hostinfo;
-+
-+      decoded_hostinfo = svn_path_uri_decode(uri.hostinfo, result_pool);
-+
-+      if (!is_valid_hostinfo(decoded_hostinfo))
-+        return svn_error_createf(SVN_ERR_BAD_URL, NULL, _("Invalid host '%s'"),
-+                                 uri.hostinfo);
-+
-+      SVN_ERR(find_tunnel_agent(tunnel, decoded_hostinfo, &tunnel_argv,
-+                                config, result_pool));
-+    }
-   else
-     tunnel_argv = NULL;
- 
-
-------------------------------------------------------------------------
diff --git a/meta/recipes-devtools/subversion/subversion_1.9.6.bb b/meta/recipes-devtools/subversion/subversion_1.9.7.bb
similarity index 95%
rename from meta/recipes-devtools/subversion/subversion_1.9.6.bb
rename to meta/recipes-devtools/subversion/subversion_1.9.7.bb
index 532edeb..57735f7 100644
--- a/meta/recipes-devtools/subversion/subversion_1.9.6.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.9.7.bb
@@ -15,11 +15,10 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serf.m4-Regex-modified-to-allow-D-in-paths.patch \
            file://0001-Fix-libtool-name-in-configure.ac.patch \
            file://serfmacro.patch \
-           file://CVE-2017-9800.patch;striplevel=0 \
            "
 
-SRC_URI[md5sum] = "f27e00338d4a9f7f9aec9d4a3f8b418b"
-SRC_URI[sha256sum] = "dbcbc51fb634082f009121f2cb64350ce32146612787ffb0f7ced351aacaae19"
+SRC_URI[md5sum] = "05b0c677681073920f938c1f322e0be2"
+SRC_URI[sha256sum] = "c3b118333ce12e501d509e66bb0a47bcc34d053990acab45559431ac3e491623"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=af81ae49ba359e70626c05e9bf313709"
 
-- 
2.7.4


