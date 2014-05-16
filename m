Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4055F6A57B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 06:00:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4G607DZ010642
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 23:00:08 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 15 May 2014 23:00:07 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 May 2014 14:00:01 +0800
Message-ID: <111823f6abd966eeb2fd904b03f3ef419a760cc5.1400219191.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400219191.git.rongqing.li@windriver.com>
References: <cover.1400219191.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] subversion: fix for Security Advisory CVE-2013-1849
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
X-List-Received-Date: Fri, 16 May 2014 06:00:09 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Reject operations on getcontentlength and getcontenttype properties
if the resource is an activity.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../subversion/subversion-CVE-2013-1849.patch      |   25 ++++++++++++++++++++
 .../subversion/subversion_1.6.15.bb                |    3 ++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1849.patch

diff --git a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1849.patch b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1849.patch
new file mode 100644
index 0000000..734f9b0
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1849.patch
@@ -0,0 +1,25 @@
+Upstream-Status: Backport
+
+--- a/subversion/mod_dav_svn/liveprops.c
++++ b/subversion/mod_dav_svn/liveprops.c
+@@ -410,7 +410,8 @@ insert_prop(const dav_resource *resource
+         svn_filesize_t len = 0;
+ 
+         /* our property, but not defined on collection resources */
+-        if (resource->collection || resource->baselined)
++        if (resource->type == DAV_RESOURCE_TYPE_ACTIVITY
++            || resource->collection || resource->baselined)
+           return DAV_PROP_INSERT_NOTSUPP;
+ 
+         serr = svn_fs_file_length(&len, resource->info->root.root,
+@@ -434,7 +435,9 @@ insert_prop(const dav_resource *resource
+         svn_string_t *pval;
+         const char *mime_type = NULL;
+ 
+-        if (resource->baselined && resource->type == DAV_RESOURCE_TYPE_VERSION)
++        if (resource->type == DAV_RESOURCE_TYPE_ACTIVITY
++            || (resource->baselined
++                && resource->type == DAV_RESOURCE_TYPE_VERSION))
+           return DAV_PROP_INSERT_NOTSUPP;
+ 
+         if (resource->type == DAV_RESOURCE_TYPE_PRIVATE
diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
index f225671..919624b 100644
--- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
@@ -7,12 +7,13 @@ HOMEPAGE = "http://subversion.tigris.org"
 
 BBCLASSEXTEND = "native"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://subversion.tigris.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://disable-revision-install.patch \
            file://libtool2.patch \
            file://fix-install-depends.patch \
+           file://subversion-CVE-2013-1849.patch \
           "
 
 SRC_URI[md5sum] = "113fca1d9e4aa389d7dc2b210010fa69"
-- 
1.7.10.4


