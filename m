Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 30591600BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 10:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Message-Id:Date:Subject:Cc:To:From;
	bh=QMZKA0I5p55CoJrmdMKyCc3TvpKQ6R2zbOntY27NKXA=; 
	b=RfWRD5DXRRo0ddt890Ny2kzmt5ZltZ5SsjA9QOJ28qWgDI/Z88zPezxwy2/reFCGaloQSyJ+S07CUMHEBW+DsFQ/4p+SsFsjE93g4j4Zp5WsIZPK1gJCI92sqCxxjzi9HmWD9KHEMyyI0Qy2YAnTAhckFmQXwvm4dlL8Ak2zrJ3fHwy17lAGt+nxPNL120Z3vLgrt4ZGkH9EIESVqchBFsEdkyTx0YbHpHi2BrETdgJ15BCtl83rc75bzg7THVPEG7LYOsynrS3BrRC43wdY0ek63GXv9DvWgtnAetmZYghWz+B13Ng+aTrmxAhT9Rhq9tmArKCmxB7+ALuu61ghLQ==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1cqHPj-0003wE-2w; Tue, 21 Mar 2017 12:53:19 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1cqHPj-00075e-1m; Tue, 21 Mar 2017 12:53:19 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 12:53:13 +0200
Message-Id: <1490093593-26558-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH] buildhistory.bbclass: add layer name to source recipe data
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
X-List-Received-Date: Tue, 21 Mar 2017 10:53:20 -0000

It is useful to know which layer provided a given recipe and its
binary packages.

Many projects combine a number of layers and some of them
also provide same recipe names in which case bitbake
can prioritize between them. buildhistory can record
the decision by saving the layer from where the recipe
was taken from.

Also, if a project is split to sub projects which maintain
recipes in different meta layers, then meta layer specific
summaries of e.g. disk usage can be calculated if
source recipes meta layer name is recorded for example in
buildhistory.

If source layer is not in build history, then layer providing
the recipe can be exported from build environment using
'bitbake-layers show-recipes', but it takes a long time to execute
since all recipes are parsed again and requires full source tree
with correct build configuration.

This patch exports the name of layer as configured in BBFILE_COLLECTIONS
append of its layer.conf. 'bitbake-layers show-recipes' exports the
meta layers directory path name. For several open source layers
these are different, e.g. meta-openembedded/meta-perl/conf/layer.conf
is perl-layer, poky/meta/conf/layer.conf is core,
poky/meta-skeleton/conf/layer.conf is skeleton etc.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/buildhistory.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index bf5789e..109b375 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -86,6 +86,7 @@ python buildhistory_emit_pkghistory() {
             self.depends = ""
             self.packages = ""
             self.srcrev = ""
+            self.layer = ""
 
 
     class PackageInfo:
@@ -186,6 +187,7 @@ python buildhistory_emit_pkghistory() {
     pe = d.getVar('PE') or "0"
     pv = d.getVar('PV')
     pr = d.getVar('PR')
+    layer = bb.utils.get_file_layer(d.getVar('FILE', True), d)
 
     pkgdata_dir = d.getVar('PKGDATA_DIR')
     packages = ""
@@ -225,6 +227,7 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.pr = pr
     rcpinfo.depends = sortlist(oe.utils.squashspaces(d.getVar('DEPENDS') or ""))
     rcpinfo.packages = packages
+    rcpinfo.layer = layer
     write_recipehistory(rcpinfo, d)
 
     pkgdest = d.getVar('PKGDEST')
@@ -303,6 +306,7 @@ def write_recipehistory(rcpinfo, d):
         f.write(u"PR = %s\n" %  rcpinfo.pr)
         f.write(u"DEPENDS = %s\n" %  rcpinfo.depends)
         f.write(u"PACKAGES = %s\n" %  rcpinfo.packages)
+        f.write(u"LAYER = %s\n" %  rcpinfo.layer)
 
 
 def write_pkghistory(pkginfo, d):
-- 
1.9.1


