Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 403CC601B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 08:30:54 +0000 (UTC)
Received: by iofh3 with SMTP id h3so46878631iof.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 00:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=UnNlOI0NCoNEkeUcJhjax5tVO49bWDTCxdsM2tHHkYc=;
	b=ag1NrXNxFkpMEoDAEQoV5fSBESUo00YWx/LoeUF9OhNqHq7UKAfB/OSB9mNlh5yAei
	fMmUMnfFGI+SIWq95iwDVKe/R04a/99Z9640p5MdqnIue7vRaxiMJVm4igZmceIgSxps
	AWmkmNK5g/7S81vjvSEdF1+u177aVh9ji2wEn92Ks2EAk73aAyELvYxYZzJ5ELb2x8kI
	uIbvpkHSnL/zUsakt8NL6L32EY2ZUYQ3JyxgtXNNRuGu19T8Kex6qlchTQawQbpfe6aV
	KqzicsMepTjXUNvU1QVT2PoZz+Ivko/IReCGIH80/yMWJt+2Q80soFuZv+r+yoWYjO7x
	QI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=UnNlOI0NCoNEkeUcJhjax5tVO49bWDTCxdsM2tHHkYc=;
	b=cAN3SzyKTbx2PW3o+rBVpzycumCgYPRIqPKyobnf21EQoGxli/40SCGMta3Aa9lUhy
	RNzG0pdII9S4O8E9jMybUa8++Fw4t5JcV3HMiBPtWP7zpN5nkHERAnsW8OpZ6gRqWHxA
	BOPtmqra7sdj9fYVsR6IApUYwTqfS4EAJShBHDKQ9kOsTIpUDvS82S2P+5F7QRqq3LFA
	lSK43Buc3aKYZChkmtCbt0LdIN+3SHXadnxvSG6kc5JNaxnMemvq70JZC+qnou7JOmCv
	ZXGFXgX7c/EPonureSIiYF2wCcMjWxC5bd98IFoPh+egio6FZgTy4H2MZD/DeKjTc757
	jQDw==
X-Gm-Message-State: ALoCoQlS+5Q/cR4V/Vn6ACoDtT88qZI52UeE7IPPuhOK9IHivqiKb4l3Kww0G2HQxeqA/XnQAfZQ
X-Received: by 10.107.136.210 with SMTP id s79mr40671068ioi.140.1448440255687; 
	Wed, 25 Nov 2015 00:30:55 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56CC0.dip0.t-ipconnect.de.
	[87.165.108.192]) by smtp.gmail.com with ESMTPSA id
	i69sm8398302iod.27.2015.11.25.00.30.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Nov 2015 00:30:55 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Nov 2015 10:30:29 +0100
Message-Id: <0157b51950228d3096c2acdba823020ba9fec413.1448442869.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1448442869.git.patrick.ohly@intel.com>
References: <cover.1448442869.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1448442869.git.patrick.ohly@intel.com>
References: <cover.1448442869.git.patrick.ohly@intel.com>
Cc: paul.eggleton@linux.intel.com, alexander.kanevskiy@intel.com
Subject: [PATCH 1/4] buildhistory-extra.bbclass: store more information about a build
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
X-List-Received-Date: Wed, 25 Nov 2015 08:30:55 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

When distributing a distro, it may be useful to also have additional
information about the sources used for creating a build. YOCTO #8138
specifically mentions:
- set of recipes that we used in builds, including information like
  checksum, originated layer(s), .bbappend and other overrides.
- information about source/patch files used in recipes (URLs, layers
  originating from, checksums).
- for images, links to source recipe names/versions that was used in image.

[Code from Paul, commit message from Patrick]

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/buildhistory-extra.bbclass | 86 +++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 meta/classes/buildhistory-extra.bbclass

diff --git a/meta/classes/buildhistory-extra.bbclass b/meta/classes/buildhistory-extra.bbclass
new file mode 100644
index 0000000..e9fea5d
--- /dev/null
+++ b/meta/classes/buildhistory-extra.bbclass
@@ -0,0 +1,86 @@
+# Provides some extra logging into buildhistory of some of the inputs
+# (buildhistory itself mostly concentrates on build output)
+#
+# Copyright (C) 2015 Intel Corporation
+# Licensed under the MIT license
+
+BUILDHISTORY_EXTRA_PKGVARS ?= "PACKAGECONFIG EXTRA_OEMAKE EXTRA_OECONF EXTRA_OECMAKE EXTRA_OESCONS EXTRA_QMAKEVARS_PRE EXTRA_QMAKEVARS_POST OE_FEATURES SUMMARY DESCRIPTION HOMEPAGE LICENSE"
+
+python buildhistory_emit_pkghistory_append() {
+    import codecs
+
+    relpath = os.path.dirname(d.getVar('TOPDIR', True))
+
+    # List sources
+    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
+    srcsfile = os.path.join(pkghistdir, "sources")
+    with codecs.open(srcsfile, "w", encoding='utf8') as f:
+        urls = (d.getVar('SRC_URI', True) or '').split()
+        for url in urls:
+            localpath = bb.fetch2.localpath(url, d)
+            if os.path.isfile(localpath):
+                sha256sum = bb.utils.sha256_file(localpath)
+            else:
+                sha256sum = 'N/A'
+            if localpath.startswith(relpath):
+                localpath = os.path.relpath(localpath, relpath)
+            f.write('%s %s %s\n' % (url, localpath, sha256sum))
+
+    # List metadata
+    includes = d.getVar('BBINCLUDED', True).split()
+    metafile = os.path.join(pkghistdir, "metadata")
+    with codecs.open(metafile, "w", encoding='utf8') as f:
+        for path in includes:
+            if os.path.exists(path):
+                sha256sum = bb.utils.sha256_file(path)
+                if path.startswith(relpath):
+                    path = os.path.relpath(path, relpath)
+                f.write('%s %s\n' % (path, sha256sum))
+
+    # List some extra var values
+    latestfile = os.path.join(pkghistdir, "latest")
+    vars = (d.getVar('BUILDHISTORY_EXTRA_PKGVARS', True) or '').split()
+    if vars:
+        with codecs.open(latestfile, "a", encoding='utf8') as f:
+            for var in vars:
+                value = oe.utils.squashspaces(d.getVar(var, True) or '')
+                if value:
+                    f.write('%s = %s\n' % (var, value))
+}
+
+python() {
+    if bb.data.inherits_class('kernel', d):
+        d.appendVarFlag('do_compile', 'prefuncs', ' buildhistory_extra_emit_kernelconfig')
+        d.appendVarFlag('do_compile', 'vardepsexclude', ' buildhistory_extra_emit_kernelconfig')
+}
+
+python buildhistory_extra_emit_kernelconfig() {
+    # Copy the final kernel config
+    # Unlike the rest of buildhistory this will only get run when the kernel is actually built
+    # (as opposed to being restored from the sstate cache); this is because do_shared_workdir
+    # operates outside of sstate and that running is the only way you get the config other than
+    # during the actual kernel build.
+    import shutil
+    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
+    shutil.copyfile(d.expand('${B}/.config'), os.path.join(pkghistdir, 'kconfig'))
+}
+
+buildhistory_get_image_installed_append() {
+	# Create a file mapping installed packages to recipes
+	printf "" > ${BUILDHISTORY_DIR_IMAGE}/installed-package-recipes.txt
+	cat ${IMAGE_MANIFEST} | while read pkg pkgarch version
+	do
+		if [ -n "$pkg" ] ; then
+			recipe=`oe-pkgdata-util -p ${PKGDATA_DIR} lookup-recipe $pkg`
+			pkge=`oe-pkgdata-util -p ${PKGDATA_DIR} read-value PKGE $pkg`
+			if [ "$pkge" != "" ] ; then
+				pkge="$pkge-"
+			fi
+			pkgr=`oe-pkgdata-util -p ${PKGDATA_DIR} read-value PKGR $pkg`
+			if [ "$pkgr" != "" ] ; then
+				pkgr="-$pkgr"
+			fi
+			echo "$pkg $version $pkge$version$pkgr $recipe" >> ${BUILDHISTORY_DIR_IMAGE}/installed-package-recipes.txt
+		fi
+	done
+}
\ No newline at end of file
-- 
2.1.4


