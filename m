Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4441060746
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 09:55:29 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id m186so176282511ioa.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 02:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=uuqcfPbinYWhb8vLelq+51Y5S3Gw9hotY7h2AxCaraA=;
	b=pcNSY1VFE1TNcAe3P9GR81hGAjzHvzbzEKEwertIiFqDIhsRY0Kp9cPH65N6SQLolO
	uABGPk33H+y2KcqzgXy9N0JmK30nw8I/tN3WsO1wf1bUWqz8hmO3Rj0OmCBvfFTKOS1y
	RqGqmnGOms981zeGSH8rUZ4C9bodoVCVYITDCXPG+RuH5Ce2XrtEc8r5OfSV3+QurOLw
	Zfg2j+3EEtcY2MoCponZ7aGB6X830W8/PLT7mXmpDF9zYORt8TgBFU/Ep7KYi+uGsJnz
	9+fy3aIIwHNoDkXYmNEDHWL8u+HiehGGVj27AmUpt72DFVNiMKMEw5ptq0DzBBVynxQz
	CH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=uuqcfPbinYWhb8vLelq+51Y5S3Gw9hotY7h2AxCaraA=;
	b=KthP/Y309WwM2MxapRMrmfaZV+BOYJl4Dm5cSqu+F6NgcNPhaSVmsxrGoEdfgC8ly/
	y+d/zxEYgb9aHDMgdwzHgw+p+eWSUafOXMqSTjIOefs81b/AoTTft4K74EGsISEkp0yB
	keoNCYNNB0bV6iVcjhfN21giSALh5n5Mxu23LBIRlyuZdv33qdNCjEApRki6sHgNyp/B
	RJTS9Ur/QI+Kme1l4szecmYdZ9s/tgVi+fk1KK3YQA2ttqFBSYCpMOKujRf9VnXOavGO
	/umlcrajFR18P3Qkuxxa/eIWylD4Vh8MYDWmmGzEnq0A8RlLWj4Pfpjy+nTzoEQpfTPE
	GFQg==
X-Gm-Message-State: AA6/9Rn1ebYA7TjwmBt02k2J3vXHvGqrG2n/Ez9yi1UAzSQlhvxb8GR4vaa4TO+JG0+N0u3S
X-Received: by 10.107.6.141 with SMTP id f13mr7634505ioi.129.1474883730921;
	Mon, 26 Sep 2016 02:55:30 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8EA4A.dip0.t-ipconnect.de.
	[93.232.234.74])
	by smtp.gmail.com with ESMTPSA id u62sm7984577iod.6.2016.09.26.02.55.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Sep 2016 02:55:30 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2016 11:55:16 +0200
Message-Id: <a4fade6d0d1f7dd22d442c8cd2a8db412cdc8962.1474882990.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <28afdfb29b4b8f7da3b48ca1829041a575bfa96b.1474882990.git.patrick.ohly@intel.com>
References: <28afdfb29b4b8f7da3b48ca1829041a575bfa96b.1474882990.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1474882990.git.patrick.ohly@intel.com>
References: <cover.1474882990.git.patrick.ohly@intel.com>
Cc: philippe.coval@osg.samsung.com
Subject: [PATCH 2/2] archive.bbclass: fix do_ar_original archiving of multiple source repos
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
X-List-Received-Date: Mon, 26 Sep 2016 09:55:30 -0000

When a recipe uses more than one source which isn't a plain file (for
example, multiple git repos), then do_ar_original created the source
archives using the same filename and thus only archived one source.

The "name" parameter is used as file suffix to create unique names for
each source, leading to archives following this pattern:
deploy/${TARGET_SYS}/${PF}/${PF}[-<name>].tar.gz.

The ${PF} part is a bit redundant, which may or may not be
desirable. The patch is more localized this way (no need to modify
create_tarball()).

For example, meta-oic's iotivity_1.1.1.bb uses:

   url_iotivity = "git://github.com/iotivity/iotivity.git"
   branch_iotivity = "1.1-rel"
   SRC_URI = "${url_iotivity};destsuffix=${S};branch=${branch_iotivity};protocol=http;"

   url_tinycbor = "git://github.com/01org/tinycbor.git"
   SRC_URI += "${url_tinycbor};name=tinycbor;destsuffix=${S}/extlibs/tinycbor/tinycbor;protocol=http"

   url_hippomocks = "git://github.com/dascandy/hippomocks.git"
   SRC_URI += "${url_hippomocks};name=hippomocks;destsuffix=${S}/extlibs/hippomocks-master;protocol=http"
   SRC_URI += "file://hippomocks_mips_patch"

   url_gtest = "http://pkgs.fedoraproject.org/repo/pkgs/gtest/gtest-1.7.0.zip/2d6ec8ccdf5c46b05ba54a9fd1d130d7/gtest-1.7.0.zip"
   SRC_URI += "${url_gtest};name=gtest;subdir=${BP}/extlibs/gtest"

   url_sqlite = "http://www.sqlite.org/2015/sqlite-amalgamation-3081101.zip"
   SRC_URI += "${url_sqlite};name=sqlite3;subdir=${BP}/extlibs/sqlite3;unpack=false"

These now get archived in deploy/sources/*/iotivity-1.1.1-r2/ as:

gtest-1.7.0.zip                      iotivity-1.1.1-r2-recipe.tar.gz    sqlite-amalgamation-3081101.zip
hippomocks_mips_patch                iotivity-1.1.1-r2.tar.gz
iotivity-1.1.1-r2-hippomocks.tar.gz  iotivity-1.1.1-r2-tinycbor.tar.gz

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/archiver.bbclass | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 5f9c91d..1d8e863 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -151,6 +151,7 @@ python do_ar_original() {
         encoded = bb.fetch2.encodeurl(decoded)
         urls[i] = encoded
     fetch = bb.fetch2.Fetch(urls, d)
+    tarball_suffix = {}
     for url in fetch.urls:
         local = fetch.localpath(url).rstrip("/");
         if os.path.isfile(local):
@@ -158,7 +159,21 @@ python do_ar_original() {
         elif os.path.isdir(local):
             tmpdir = tempfile.mkdtemp(dir=d.getVar('ARCHIVER_WORKDIR', True))
             fetch.unpack(tmpdir, (url,))
-            create_tarball(d, tmpdir + '/.', '', ar_outdir)
+            # To handle recipes with more than one source, we add the "name"
+            # URL parameter as suffix. We treat it as an error when
+            # there's more than one URL without a name, or a name gets reused.
+            # This is an additional safety net, in practice the name has
+            # to be set when using the git fetcher, otherwise SRCREV cannot
+            # be set separately for each URL.
+            params = bb.fetch2.decodeurl(url)[5]
+            name = params.get('name', '')
+            if name in tarball_suffix:
+                if not name:
+                    bb.fatal("Cannot determine archive names for original source because 'name' URL parameter is unset in more than one URL. Add it to at least one of these: %s %s" % (tarball_suffix[name], url))
+                else:
+                    bb.fatal("Cannot determine archive names for original source because 'name=' URL parameter '%s' is used twice. Make it unique in: %s %s" % (tarball_suffix[name], url))
+            tarball_suffix[name] = url
+            create_tarball(d, tmpdir + '/.', name, ar_outdir)
 
     # Emit patch series files for 'original'
     bb.note('Writing patch series files...')
-- 
2.1.4


