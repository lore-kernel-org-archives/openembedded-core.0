Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 384796A4AB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 06:13:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r576DVgg001691
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Jun 2013 23:13:31 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 6 Jun 2013 23:13:29 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Jun 2013 14:13:55 +0800
Message-ID: <4caf51c1d2225dc66aeef8326ba0616d97f7c691.1370585547.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1370585547.git.Qi.Chen@windriver.com>
References: <cover.1370585547.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/8] busybox: remove the postinst part of the recipe
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
X-List-Received-Date: Fri, 07 Jun 2013 06:13:29 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Remove the pkg_postinst_${PN} from this recipe, as it's redundant.
It basically wants to do the same thing as the update-alternatives
does. But it doesn't do it well.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc |    8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index c8908b0..f4efeb8 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -265,14 +265,6 @@ python do_package_prepend () {
     f.close()
 }
 
-pkg_postinst_${PN} () {
-	# If we are not making an image we create links for the utilities that doesn't exist
-	# so the update-alternatives script will get the utilities it needs
-	# (update-alternatives have no problem replacing links later anyway)
-	test -n 2> /dev/null || alias test='busybox test'
-	if test "x$D" = "x"; then while read link; do if test ! -h "$link"; then case "$link" in /*/*/*) to="../../bin/busybox";; /bin/*) to="busybox";; /*/*) to="../bin/busybox";; esac; busybox ln -s $to $link; fi; done </etc/busybox.links; fi
-}
-
 pkg_prerm_${PN} () {
 	# This is so you can make busybox commit suicide - removing busybox with no other packages
 	# providing its files, this will make update-alternatives work, but the update-rc.d part
-- 
1.7.9.5


