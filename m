Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2208E6A533
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 13:13:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4SDDrTS016100
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 06:13:53 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.146) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 28 May 2013 06:13:51 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 May 2013 21:13:48 +0800
Message-ID: <7310117a341c8389bf66c80ad9aec87b38e1fe12.1369654710.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369654710.git.hongxu.jia@windriver.com>
References: <cover.1369654710.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python-scons-native: fix invoking scons failed on Fedora-17
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
X-List-Received-Date: Tue, 28 May 2013 13:13:51 -0000
Content-Type: text/plain

While the destro didn't install scons, build scons by python-scons-native,
and invoke it with the error:
...
$scons -h
Traceback (most recent call last):
  File "/buildarea2/hongxujia/build-20130520-udev-emenlow/tmp/sysroots/x86_64-linux/usr/bin/scons", line 188, in <module>
    import SCons.Script
ImportError: No module named SCons.Script
...

1, While building scons as default, scons's lib will be install in the dir of
`scons' or `scons-2.3.0' if the option `--install-lib' is not set explicitly.

2, While build python-scons-native, `--install-lib' is explicitly set, and
scons's lib was not installed in the dir of `scons' or `scons-2.3.0'.

3, While invoke scons-native, the scons searches the lib in ${STAGING_DIR_HOST}/
${PYTHON_SITEPACKAGES_DIR}/scons, ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}/
scons-2.3.0 rather than ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}.

Use create_wrapper to relocate scons-native to add `${STAGING_DIR_HOST}/${PYTHON
_SITEPACKAGES_DIR}' to PYTHONPATH, so scons-native could find out the lib.

[YOCTO #4562]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/python/python-scons-native_2.3.0.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python-scons-native_2.3.0.bb b/meta/recipes-devtools/python/python-scons-native_2.3.0.bb
index 1e4ec27..067ed61 100644
--- a/meta/recipes-devtools/python/python-scons-native_2.3.0.bb
+++ b/meta/recipes-devtools/python/python-scons-native_2.3.0.bb
@@ -2,3 +2,7 @@ require python-scons_${PV}.bb
 inherit native pythonnative
 DEPENDS = "python-native"
 RDEPENDS_${PN} = ""
+
+do_install_append() {
+    create_wrapper ${D}${bindir}/scons  PYTHONPATH='$PYTHONPATH:${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}'
+}
-- 
1.7.10.4


