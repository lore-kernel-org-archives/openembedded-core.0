Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 89813731AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 15:33:11 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u1FFXB8w014134; Mon, 15 Feb 2016 09:33:11 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016021509331118-999816 ;
	Mon, 15 Feb 2016 09:33:11 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 17:32:48 +0200
Message-Id: <1455550368-13842-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/15/2016 09:33:11 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/15/2016 09:33:11 AM,
	Serialize complete at 02/15/2016 09:33:11 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-15_07:, , signatures=0
Cc: Ben Shelton <ben.shelton@ni.com>
Subject: [PATCH v2 1/1] ruby: break out ri-docs and rdoc into separate packages
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
X-List-Received-Date: Mon, 15 Feb 2016 15:33:11 -0000

The ri (Ruby Interactive) documentation for the Ruby standard library
consumes a significant amount of space on disk. It is useful to
developers, but is usually not necessary for users who just want to run
applications written in Ruby.  Break it out into a separate package so
Ruby can be installed without it.

Also break out the rdoc documentation generator in its own package.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-devtools/ruby/ruby_2.2.2.bb | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/ruby/ruby_2.2.2.bb b/meta/recipes-devtools/ruby/ruby_2.2.2.bb
index 9b807a7..6715023 100644
--- a/meta/recipes-devtools/ruby/ruby_2.2.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.2.2.bb
@@ -31,7 +31,16 @@ do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }
 
-FILES_${PN} += "${datadir}/rubygems \
-                ${datadir}/ri"
+PACKAGES =+ "${PN}-ri-docs ${PN}-rdoc"
+
+SUMMARY_${PN}-ri-docs = "ri (Ruby Interactive) documentation for the Ruby standard library"
+RDEPENDS_${PN}-ri-docs = "${PN}"
+FILES_${PN}-ri-docs += "${datadir}/ri"
+
+SUMMARY_${PN}-rdoc = "RDoc documentation generator from Ruby source"
+RDEPENDS_${PN}-rdoc = "${PN}"
+FILES_${PN}-rdoc += "${libdir}/ruby/*/rdoc ${bindir}/rdoc"
+
+FILES_${PN} += "${datadir}/rubygems"
 
 BBCLASSEXTEND = "native"
-- 
2.7.0


