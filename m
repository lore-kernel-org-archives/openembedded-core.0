Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 717CF731D8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 14:32:12 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id p65so31595235wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 06:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=au2TIiPWrJIX4yKLZm7d9NVgs4PELiBK2hH7MHplOUs=;
	b=pMV+M2WQYG2e9LdzNw4GGRJUSdiSjW98KcWvd+RTJCjQeOAP/7mps4EFjSUJa0uFVg
	NJHH18o4dwhkPwSxlx4BXBiOG02+VGOsBdRUubN94fgn0NsNiQhtwmHRA4FHajJCAkTU
	BJU+vX23k5git71t5nETvDAA8pQxxaTSymYUuwCorexcNisvcjV3mC34rFahr9v1ASTW
	RRQG2dxLZ2wUmKAq0k4VtzGu//zneoG2jyw7tl1PXqE1GZkfoeI+1voLMckTSZBiHTK5
	gVUkJ6/MtnfZDRBwlZHVV6egWEK2nopsTW65xFw5i/xEeM0mYiaiRf7GrX9rylmu3vUI
	zZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=au2TIiPWrJIX4yKLZm7d9NVgs4PELiBK2hH7MHplOUs=;
	b=NIeXNChKAnFojXDe2ObUrV4RwvVaDGe+1i9MrsDki3BoT2/UVaDB/dGsj/qbI2Yd5J
	ZHfELxvf7lyxxt7T6jJcOKZ5RS7XQQUetBkjMi2PYeLSzdke57vFPs7kUuQZGo5ORG8E
	DwVL8JNXGOxIwtIsg4ruRwWs2qLBWcbdqweVl3gVc6caM9Qt+LTIM4Ro5Psp7LVA7GQz
	LaZy/xVW8sIA6akicx5GHgIN3V+6BV3BAeWgPqh2o+VWQWCMNuHmQByNrT4CPf1ITgP6
	M+F3QR8HGqsZfj+RBeBiVsGWIW6enK3rfch7iFpgT/3eq3hVw8cDKzq06Js5MFh92y7C
	/vjw==
X-Gm-Message-State: AD7BkJK1HARAdegxZdDEtH4/I9WoRFxqIVAoRV6Zr+aaGUH6mRFYRqpSxLgfYvQH4QANvc1g
X-Received: by 10.194.91.205 with SMTP id cg13mr9123427wjb.166.1457101933269; 
	Fri, 04 Mar 2016 06:32:13 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e127sm3555115wma.20.2016.03.04.06.32.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Mar 2016 06:32:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Mar 2016 14:32:10 +0000
Message-Id: <1457101930-19513-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] populate_sdk_ext: specify where the uninative tarball is explicitly
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
X-List-Received-Date: Fri, 04 Mar 2016 14:32:13 -0000

Previously this class copied the uninative tarball to a certain directory in the
assumption that is where uninative.bbclass is looking for it.  However as this
is a variable in uninative.bbclass that can be changed, specify exactly where
the tarball is in the eSDK local.conf.

Also don't use string formatting to write the INHERIT for no reason.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 74d12eb..8d199f4 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -193,7 +193,9 @@ python copy_buildsystem () {
             # Write a newline just in case there's none at the end of the original
             f.write('\n')
 
-            f.write('INHERIT += "%s"\n\n' % 'uninative')
+            f.write('INHERIT += "uninative"\n')
+            f.write('UNINATIVE_DLDIR = "${COREBASE}"\n\n')
+
             f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION', False))
 
             # Some classes are not suitable for SDK, remove them from INHERIT
@@ -368,7 +370,7 @@ sdk_ext_postinst() {
 	# Warn if trying to use external bitbake and the ext SDK together
 	echo "(which bitbake > /dev/null 2>&1 && echo 'WARNING: attempting to use the extensible SDK in an environment set up to run bitbake - this may lead to unexpected results. Please source this script in a new shell session instead.') || true" >> $env_setup_script
 
-	# For now this is where uninative.bbclass expects the tarball
+	# We configure uninative.bbclass in local.conf to look in ${COREBASE} for the tarball
 	mv *-nativesdk-libc.tar.* $target_sdk_dir/`dirname ${oe_init_build_env_path}`
 
 	if [ "$prepare_buildsystem" != "no" -a -n "${@SDK_INSTALL_TARGETS.strip()}" ]; then
-- 
2.7.0


