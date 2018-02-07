Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5F10A605BE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 01:41:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Feb 2018 17:41:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,471,1511856000"; d="scan'208";a="25315592"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga003.jf.intel.com with ESMTP; 06 Feb 2018 17:41:51 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Feb 2018 17:42:11 -0800
Message-Id: <1517967731-9068-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] autoconf-doc: improve reproducibility
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
X-List-Received-Date: Wed, 07 Feb 2018 01:41:50 -0000

autoconf-doc package contains autoconf.info.
This file contains date when this file was created, i.e:

     "This manual (31 January 2018) .."

Therefore, two builds done on two different days will show different dates for
otherwise identical files, hence breaking reproducibility.
The date is obtained from mtime of "autoconf.texi", unfortunately we patch this
file and change the mtime as a consequence.
The date serves as a document version identifier, so preserving the original mtime of
"autoconf.texi" would be misleading, as we actually did modify the document on purpose.
The fix is to set the mtime of "autoconf.texi" based on SOURCE_DATE_EPOCH.

[YOCTO #12524]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index df81bc6..f5156f7 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -48,6 +48,15 @@ do_configure() {
 	oe_runconf
 }
 
+do_compile_prepend_class-target() {
+	# mtime of autoconf.texi will end up as embedded date in autoconf.info.
+	# We patch autoconf.texi, so that modifies mtime each time.
+	# To ensure reproducibility, set the mtime to SOURCE_DATE_EPOCH
+	if [ -n "${SOURCE_DATE_EPOCH}" ]; then
+		touch -d @${SOURCE_DATE_EPOCH} ${S}/doc/autoconf.texi
+	fi
+}
+
 do_install_append() {
     rm -rf ${D}${datadir}/emacs
 }
-- 
2.7.4


