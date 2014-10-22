Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 095F560097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 07:37:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9M7bZx6024134
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 00:37:35 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 22 Oct 2014 00:37:35 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Oct 2014 03:37:29 -0400
Message-ID: <f848b3f65a042d7ef33e93261ff460008e1ea67f.1413963279.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1413963279.git.jackie.huang@windriver.com>
References: <cover.1413963279.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] subversion: Security Advisory - subversion - CVE-2014-3528
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
X-List-Received-Date: Wed, 22 Oct 2014 07:37:35 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Apache Subversion 1.0.0 through 1.7.x before 1.7.17 and 1.8.x before
1.8.10 uses an MD5 hash of the URL and authentication realm to store
cached credentials, which makes it easier for remote servers to obtain
the credentials via a crafted authentication realm.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-3528

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../subversion/subversion-CVE-2014-3528.patch      |   29 ++++++++++++++++++++
 .../subversion/subversion_1.6.15.bb                |    1 +
 .../subversion/subversion_1.8.9.bb                 |    1 +
 3 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch

diff --git a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch
new file mode 100644
index 0000000..23e738e
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Backport
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+
+diff --git a/subversion/libsvn_subr/config_auth.c.old b/subversion/libsvn_subr/config_auth.c
+index ff50270..c511d04 100644
+--- a/subversion/libsvn_subr/config_auth.c.old
++++ b/subversion/libsvn_subr/config_auth.c
+@@ -85,6 +85,7 @@ svn_config_read_auth_data(apr_hash_t **hash,
+   if (kind == svn_node_file)
+     {
+       svn_stream_t *stream;
++      svn_string_t *stored_realm;
+ 
+       SVN_ERR_W(svn_stream_open_readonly(&stream, auth_path, pool, pool),
+                 _("Unable to open auth file for reading"));
+@@ -95,6 +96,12 @@ svn_config_read_auth_data(apr_hash_t **hash,
+                 apr_psprintf(pool, _("Error parsing '%s'"),
+                              svn_path_local_style(auth_path, pool)));
+ 
++      stored_realm = apr_hash_get(*hash, SVN_CONFIG_REALMSTRING_KEY,
++                                  APR_HASH_KEY_STRING);
++
++      if (!stored_realm || strcmp(stored_realm->data, realmstring) != 0)
++        *hash = NULL; /* Hash collision, or somebody tampering with storage */
++
+       SVN_ERR(svn_stream_close(stream));
+     }
+ 
diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
index 6680ab6..b135bb7 100644
--- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://subversion.tigris.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://subversion-CVE-2013-1847-CVE-2013-1846.patch \
            file://subversion-CVE-2013-4277.patch \
            file://subversion-CVE-2014-3522.patch \
+           file://subversion-CVE-2014-3528.patch \
 "
 
 SRC_URI[md5sum] = "113fca1d9e4aa389d7dc2b210010fa69"
diff --git a/meta/recipes-devtools/subversion/subversion_1.8.9.bb b/meta/recipes-devtools/subversion/subversion_1.8.9.bb
index e1ab945..1ef59a0 100644
--- a/meta/recipes-devtools/subversion/subversion_1.8.9.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.8.9.bb
@@ -13,6 +13,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://disable_macos.patch \
            file://subversion-CVE-2014-3522.patch;striplevel=0 \
+           file://subversion-CVE-2014-3528.patch \
 "
 SRC_URI[md5sum] = "bd495517a760ddd764ce449a891971db"
 SRC_URI[sha256sum] = "45d708a5c3ffbef4b2a1044c4716a053e680763743d1f7ba99d0369f6da49e33"
-- 
1.7.9.5


