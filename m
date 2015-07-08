Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB696E5F6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 09:05:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t68953cJ014206
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 02:05:04 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 8 Jul 2015 02:05:03 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jul 2015 17:03:40 +0800
Message-ID: <4e6ff252db44e357cbdda2cdfcbd553defaf7958.1436346123.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1436346123.git.kai.kang@windriver.com>
References: <cover.1436346123.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 1/1] subversion: improve the regex of sed command of SVN_SERF_INCLUDES macro
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
X-List-Received-Date: Wed, 08 Jul 2015 09:05:06 -0000
Content-Type: text/plain

[Yocto #7474]

The regex of sed command is too simple, which mangles any "-D" in
strings, for example, a project name is "My-Demo", it will be removed
from the path by the sed regex, which causes a build failure. Improving
it to only delete the -D behind of a space or the -D at start of a
string.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../Improve_the_regex_of_sed_command_of.patch      | 31 ++++++++++++++++++++++
 .../subversion/subversion_1.8.13.bb                |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/Improve_the_regex_of_sed_command_of.patch

diff --git a/meta/recipes-devtools/subversion/subversion-1.8.13/Improve_the_regex_of_sed_command_of.patch b/meta/recipes-devtools/subversion/subversion-1.8.13/Improve_the_regex_of_sed_command_of.patch
new file mode 100644
index 0000000..626923b
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.8.13/Improve_the_regex_of_sed_command_of.patch
@@ -0,0 +1,31 @@
+Improve the regex of sed command of SVN_SERF_INCLUDES macro
+
+The regex of sed command is too simple, which mangles any "-D"
+in strings, for example, a project name is "My-Demo", it will
+be removed from the path by the sed regex, which causes a build
+failure. Improving it to only delete the -D behind of a space or
+the -D at start of a string.
+
+Reference:
+
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=7874
+
+Upstream-Status: Submitted [http://mail-archives.apache.org/mod_mbox/subversion-dev/201507.mbox/%3C559CDA70.8030403%40windriver.com%3E]
+
+Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+diff --git a/build/ac-macros/serf.m4.old b/build/ac-macros/serf.m4
+index 885c5a1..39969c6 100644
+--- a/build/ac-macros/serf.m4.old
++++ b/build/ac-macros/serf.m4
+@@ -143,7 +143,7 @@ AC_DEFUN(SVN_SERF_PKG_CONFIG,
+         if $PKG_CONFIG $serf_major --atleast-version=$serf_check_version; then
+           AC_MSG_RESULT([yes])
+           serf_found=yes
+-          SVN_SERF_INCLUDES=[`$PKG_CONFIG $serf_major --cflags | $SED -e 's/-D[^ ]*//g'`]
++          SVN_SERF_INCLUDES=[`$PKG_CONFIG $serf_major --cflags | $SED -e 's/[[:space:]]-D[^ ]*//g' -e 's/^-D[^ ]*//g'`]
+           SVN_SERF_LIBS=`$PKG_CONFIG $serf_major --libs` 
+           break
+         else
diff --git a/meta/recipes-devtools/subversion/subversion_1.8.13.bb b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
index a98be67..73ace61 100644
--- a/meta/recipes-devtools/subversion/subversion_1.8.13.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
@@ -12,6 +12,7 @@ inherit gettext pythonnative
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://disable_macos.patch \
+           file://Improve_the_regex_of_sed_command_of.patch \
 "
 SRC_URI[md5sum] = "4413417b529d7bdf82f74e50df02e88b"
 SRC_URI[sha256sum] = "1099cc68840753b48aedb3a27ebd1e2afbcc84ddb871412e5d500e843d607579"
-- 
1.9.1


