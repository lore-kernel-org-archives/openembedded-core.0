Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R7cOr-0005LA-7R
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 02:16:53 +0200
Received: by pzd13 with SMTP id 13so11329664pzd.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Sep 2011 17:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=vDQLoSUI2kZhosTgxHNd7pPuDPtAIp5Ggr/nR4Q+BgM=;
	b=Q5xOwgXc5xbSZqDVzWk1UtYvuAwUPDXOcBiHdRbSCg+uX0PSEMk3D5mMjJDPpLYTdZ
	FN6LbqQFEEiGgQrUq1p+ncnat0hKTnolyo/SMD4ndbLOVN8SQt+Drazunjv/pjm2FWH5
	Z4IvzWQ57mm9DBjdOIkVzIzln8xFuldcxPfRs=
Received: by 10.68.19.6 with SMTP id a6mr19423962pbe.46.1316909489810;
	Sat, 24 Sep 2011 17:11:29 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id ji3sm55372726pbc.2.2011.09.24.17.11.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Sep 2011 17:11:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Sep 2011 17:11:17 -0700
Message-Id: <1316909477-31924-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] intltool: inherit gettext to add missing dependency on gettext
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Sep 2011 00:16:53 -0000

Fixes the error like below

| configure: error: GNU gettext tools not found; required for intltool
| + bbfatal 'oe_runconf failed'
| + echo 'ERROR: oe_runconf failed'
| ERROR: oe_runconf failed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/intltool/intltool.inc       |    2 +-
 meta/recipes-devtools/intltool/intltool_0.40.6.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
index 23a1ee9..1e54feb 100644
--- a/meta/recipes-devtools/intltool/intltool.inc
+++ b/meta/recipes-devtools/intltool/intltool.inc
@@ -12,7 +12,7 @@ DEPENDS_virtclass-native = "libxml-parser-perl-native"
 RRECOMMENDS_${PN} = "perl-modules"
 RRECOMMENDS_${PN}_virtclass-native = ""
 
-inherit autotools pkgconfig perlnative
+inherit autotools pkgconfig perlnative gettext
 
 export PERL = "${bindir}/env perl"
 PERL_virtclass-native = "/usr/bin/env nativeperl"
diff --git a/meta/recipes-devtools/intltool/intltool_0.40.6.bb b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
index e9871fc..eae2b85 100644
--- a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
@@ -1,7 +1,7 @@
 require intltool.inc
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r5"
+PR = "r6"
 
 SRC_URI_append = " file://intltool-nowarn-0.40.0.patch \
                    ${NATIVEPATCHES} \
-- 
1.7.5.4



