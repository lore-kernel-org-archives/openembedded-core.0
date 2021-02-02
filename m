Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.48460.1612244058134667125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: /jboWuav3u7NHJd7CP8lP6dCB9Ii/qH70oOPUCpq8R+ZZU5HFUU2BK0kiKQjthUcnr+OzE6CG+
 y2BxDawtTKIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876874"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876874"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:18 -0800
IronPort-SDR: Q7Ujr+Q57jAdrd4VpSXIBB8BRfU8Dk1HQC/n2QKrBRYbUs+peXTPJwOW76mu1tj5c/+1qZT5tm
 +NV/Ov7rXpdA==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370360880"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:17 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 04/25] p11-kit: upgrade 0.23.21 -> 0.23.22
Date: Tue,  2 Feb 2021 13:33:47 +0800
Message-Id: <f500435958fd676a00757a64572f06f5cb16c251.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

https://github.com/p11-glue/p11-kit/releases/tag/0.23.22

Release notes:
Fix memory-safety issues that affect the RPC protocol (CVE-2020-29361, CVE-2020-29362, and CVE-2020-29363), discovered and fixed by David Cook
anchor: Prefer persistent format when storing anchor [#329]
common: Fix infloop in p11_path_build [#326, #327]
proxy: C_CloseAllSessions: Make sure that calloc args are non-zero [#325]
common: Check for a NULL locale before freeing it [#321]
Build and test fixes [#313, #315, #317, #318, #319, #323, #330, #333, #334, #335, #338, #339]

https://github.com/p11-glue/p11-kit/commit/c4e75e10021ce86ab42682ea4936dce94ced2f77
patch to fix trailing newline using custom_target() caused error
with DISTRO_FEATURES api-documentation due to meson bugs, enable
manpages PACKAGECONFIG should prevent this error.
| warning: failed to load external entity "../version.xml"
| ../p11-kit-docs.xml:11: parser error : Failure to process entity version
| 		<releaseinfo>for p11-kit &version;</releaseinfo>
| 		                                  ^
| ../p11-kit-docs.xml:11: parser error : Entity 'version' not defined
| 		<releaseinfo>for p11-kit &version;</releaseinfo>
| 		                                  ^
| unable to parse ../p11-kit-docs.xml

(From OE-Core rev: b112ba291835061640123c13784e2b33cc73f17d)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 59b07a71f32c84e592d66595a2a7e1ae9c7ebef8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../p11-kit/{p11-kit_0.23.21.bb => p11-kit_0.23.22.bb}     | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.23.21.bb => p11-kit_0.23.22.bb} (75%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
similarity index 75%
rename from meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
index b1fd2334b2..c539ecdbc6 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
@@ -2,17 +2,18 @@ SUMMARY = "Provides a way to load and enumerate PKCS#11 modules"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=02933887f609807fbb57aa4237d14a50"
 
-inherit meson gettext pkgconfig gtk-doc bash-completion
+inherit meson gettext pkgconfig gtk-doc bash-completion manpages
 
 DEPENDS = "libtasn1 libtasn1-native libffi"
 
 DEPENDS_append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-SRC_URI = "git://github.com/p11-glue/p11-kit"
-SRCREV = "fd8b56f3ee971f94dc6fc95411fc01e1c12153ab"
+SRC_URI = "git://github.com/p11-glue/p11-kit;branch=0.23"
+SRCREV = "bd97afbfe28d5fbbde95ce36ff7a8834fc0291ee"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
+PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
 PACKAGECONFIG[trust-paths] = "-Dtrust_paths=/etc/ssl/certs/ca-certificates.crt,,,ca-certificates"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
-- 
2.29.2

