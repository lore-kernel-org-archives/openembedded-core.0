Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7306C6AB4A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:53:08 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id p58so7010677wes.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 09:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=PZ5EyWZy6iRpxSpnBpudO0fDWCHq4UESxYdo9kTSS3g=;
	b=Meva+lmx0B1hSk+AvfGFy+vN80oM4McLWcWrkNXRbWM1J7k+aqeVuKrkqVAzKwtDc5
	LFAQOigg7vfkxHLngmFHSjK8xUJG7R07zCfE37y7BDc04S+wTwExcfqkSazqRpsMtICM
	/pxyHIEr+OpR+eMz3h49d3FFZkm6ipceiwoeqUaMFqHHPMaIfHyS95oiR6qA74yBPFHa
	HStHfI7w+ika+8lVc3vMI9AwzaMKpv09fU6+Bj8T/dsPa653puOCtc24jpHx6gn5uhJY
	1W4uYQuOuw/tn4HwtzWDGkbnMRpe/oax4eZlAdyG/ax1OfO1sd5RFye8/zjyKReV74Vs
	srpw==
X-Received: by 10.180.187.37 with SMTP id fp5mr5148276wic.5.1371055989091;
	Wed, 12 Jun 2013 09:53:09 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id m3sm4624419wij.5.2013.06.12.09.53.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 09:53:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 17:49:39 +0100
Message-Id: <9e66219b516879afe77ec253b0dc767fb39b7e2f.1371055550.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371055550.git.ross.burton@intel.com>
References: <cover.1371055550.git.ross.burton@intel.com>
In-Reply-To: <cover.1371055550.git.ross.burton@intel.com>
References: <cover.1371055550.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmEGhNpk8qnp4Ip4R0DekYsGHaIJPwgEPq3diqR56eSCbbcdch7SNqpj6k/XPENc3RnOk1C
Subject: [PATCH 1/4] dpkg: drop the usage of create_wrapper
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
X-List-Received-Date: Wed, 12 Jun 2013 16:53:08 -0000

create_wrapper was previously abused to invoke the Perl interpretter directly
instead of relying on #! parsing, which is read into a 128 byte buffer so breaks
with deep build directories.

However we already install a "nativeperl" binary into the native sysroot, so
use sed to change the #! line to /usr/bin/env nativeperl.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc |   10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 28c4f89..b9d4da1 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -45,21 +45,13 @@ do_install_append () {
 	if [ "${PN}" = "dpkg-native" ]; then
 		# update-alternatives doesn't have an offline mode
 		rm ${D}${bindir}/update-alternatives
+		sed -i -e 's|^#!.*${bindir}/perl-native.*/perl|#!/usr/bin/env nativeperl|' ${D}${bindir}/dpkg-*
 	else
 		mv ${D}${bindir}/update-alternatives ${D}${sbindir}
 		sed -i -e 's|^#!.*${bindir}/perl-native.*/perl|#!/usr/bin/env perl|' ${D}${bindir}/dpkg-*
 	fi
 }
 
-# Create a wrapper for the perl script to avoid the "bad interpreter"
-# error when the tmpdir is longer than 150.
-do_install_append_class-native () {
-	tmp=`find ${D}${bindir} -type f -exec grep -m 1 -l '#!/.*/perl-native/perl' {} \;`
-	for i in $tmp; do
-		create_wrapper $i ${STAGING_BINDIR_NATIVE}/perl-native/perl
-	done
-}
-
 pkg_postinst_${PN} () {
 #!/bin/sh
 if [ "x$D" != "x" ] && [ -f $D/var/lib/dpkg/status ]; then
-- 
1.7.10.4


