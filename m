Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TdlLQ-0007Lv-UU
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 18:22:45 +0100
Received: from mail-lb0-f197.google.com ([209.85.217.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 28 Nov 2012 09:08:28 -0800
Received: by mail-lb0-f197.google.com with SMTP id go10so8114687lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 09:08:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=FcWwSRV891/fuIikMEUogumSQjKTGuzhxgQafv45tgw=;
	b=L8Z/JsNzvGB0eptuGUF6sdzuHZ2bH6U/pOrgwZ9mgajxq0865fEdn/C6aHFmJJiYwS
	TtBaw/uZYv63YFSACo/r4n2D/gvV/19xxhWP/Rlhcdn+NLnoU1FchTSF4+etfxy+Wbz0
	cROgI5GdFd9D50kt5xM7yc1VHKN062F0f4SbDfUspmeVBh2jiBauns5vH6KzamLXocgj
	0VujAPpsjkI4WocrzE7UszZWgm/zE4cKv3H0MovIsH+ESOxcujQc4/A6CSntT26u8N9h
	4CoJE3hnMEVVQbZwRhnguyWJbmIWFcgsmLbxwBVCDwmRDf8FcOvUMKTQmXubvXFP4rUC
	ovkg==
Received: by 10.180.86.39 with SMTP id m7mr33304947wiz.1.1354122505936;
	Wed, 28 Nov 2012 09:08:25 -0800 (PST)
Received: by 10.180.86.39 with SMTP id m7mr33304938wiz.1.1354122505804;
	Wed, 28 Nov 2012 09:08:25 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cf6sm7415357wib.3.2012.11.28.09.08.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 09:08:25 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2012 17:06:53 +0000
Message-Id: <1354122413-24028-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlOhQcvP3O7BE0u6De2dCSx1UdHe7+HzuvDnV4yMjokcFe6BnazDLM1hCHd9bJdZ8zGUnuQiNQTn09TcnMcigYoV0CbHRy0zn9JNtSXgzjek5D11mYL9c4z9jFBH0iCsoiPKKjt9hexfkQfuD8Lb2Xvn+yD+jv1PTcVGqEMHA88NQ+HanlG2xCRiwNhonab8GiE+Ucm
Subject: [PATCH V2] guile: fix bashism in script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 17:22:45 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/guile/guile_2.0.6.bb |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.6.bb b/meta/recipes-devtools/guile/guile_2.0.6.bb
index b5f55af..89fedcb 100644
--- a/meta/recipes-devtools/guile/guile_2.0.6.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.6.bb
@@ -28,6 +28,8 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
 SRC_URI[md5sum] = "3438cd4415c0c43ca93a20e845eba7e2"
 SRC_URI[sha256sum] = "3ece055145a5020dd36b84f5fbccd4b3846a671960dd5ee55931555f03200950"
 
+PR = "r1"
+
 inherit autotools gettext
 BBCLASSEXTEND = "native"
 
@@ -45,7 +47,7 @@ export GUILE_FOR_BUILD="${BUILD_SYS}-guile"
 
 do_compile_append() {
 	# just for target recipe
-	if [ "${PN}" == "guile" ]
+	if [ "${PN}" = "guile" ]
 	then
 		sed -i -e s:${STAGING_DIR_TARGET}::g \
 	               -e s:/${TARGET_SYS}::g \
@@ -71,7 +73,7 @@ SYSROOT_PREPROCESS_FUNCS = "guile_cross_config"
 
 guile_cross_config() {
 	# this is only for target recipe
-	if [ "${PN}" == "guile" ]
+	if [ "${PN}" = "guile" ]
 	then
 	        # Create guile-config returning target values instead of native values
 	        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
-- 
1.7.10



