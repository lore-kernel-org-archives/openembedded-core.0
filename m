Return-Path: <gthomas@mlbassoc.com>
X-Greylist: delayed 323 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 12 Feb 2016 04:03:56 UTC
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 32F44731D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 04:03:56 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id C484768A01C; Fri, 12 Feb 2016 03:58:33 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 4C4A468A019;
	Fri, 12 Feb 2016 03:58:33 +0000 (GMT)
Received: by zeus.mlbassoc.com (Postfix, from userid 1000)
	id EA92C674058F; Fri, 12 Feb 2016 04:58:32 +0100 (CET)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 04:58:27 +0100
Message-Id: <1455249507-30989-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 2.5.0
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH] ffmpeg: Add -dbg packages for all libraries
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
X-List-Received-Date: Fri, 12 Feb 2016 04:03:57 -0000

Improve the packaging of the libraries built by this recipe.  These
are created using special code in the recipe and the debug (-dbg)
packages were not being created.  Adding these packages allow the
libraries in question to be debugged using GDB.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb
index 7107803..524b5cb 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb
@@ -75,7 +75,7 @@ do_configure() {
 }
 
 RSUGGESTS_${PN} = "mplayer"
-PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|swscale).*"
+PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|postproc|swresample|swscale).*"
 
 python populate_packages_prepend() {
     av_libdir = d.expand('${libdir}')
@@ -108,4 +108,12 @@ python populate_packages_prepend() {
                       prepend=True,
                       allow_links=True)
 
+    # Debug packages (-dbg)
+    do_split_packages(d, av_libdir, '^lib(.*)\.so$',
+                      output_pattern='lib%s-dbg',
+                      description='libav %s debug package',
+                      extra_depends='${PN}-dbg',
+                      prepend=True,
+                      allow_links=True)
+
 }
-- 
2.5.0


