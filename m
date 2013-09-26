Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id C98A36B389
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 10:41:41 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id t61so938293wes.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 03:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pYgvLg6PH6Tyzr3BIWMg08IWinon1RMlFjWcVYpGtWk=;
	b=JAwHxil5pHiHJ4oltcFBgp0wbcKRy2WNq7nb+mZmhkTrwdwhCGhYhB9EbD0B+h88pO
	A6BAav2KNMcv4hZvdbpHlZu3M2i8/xAEgiCLQLrhVQSHbcs5Q9JU3JSNxuEUW/2I8FqP
	B6RSVJemNN2gTi9A2kEd1ioaHLuq80rnpFeruH6vSy06yvi23EtOLsrgFxbv3dl+wVPO
	+qc5w0UocSxzRV66lZx9todSmIceAohaDGTK1xB4/7RFBmABWMi1BPZbqIJxT4EjDxIq
	e4NQbQr6MUL5Juvrsq/zmj2iK0PwY+zZ/Ps5D2V7S3MASvBuadBP8LV0oD4TDsAD8JnZ
	ZvTA==
X-Gm-Message-State: ALoCoQmKmhKe5e2pBmcacg7jVjX4Ox3vlAEYT59XzCWDHcT55fM8Y5Ps3v/82u6nK2VMuz0smp+P
X-Received: by 10.180.12.243 with SMTP id b19mr262120wic.18.1380192103350;
	Thu, 26 Sep 2013 03:41:43 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id i8sm2167817wiy.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 26 Sep 2013 03:41:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2013 11:41:36 +0100
Message-Id: <1380192096-19856-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1380192096-19856-1-git-send-email-ross.burton@intel.com>
References: <1380192096-19856-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] pseudo: warn twice if the 32-bit toolchain appears broken
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
X-List-Received-Date: Thu, 26 Sep 2013 10:41:43 -0000

Putting a warning at the top of do_compile is useful but not everyone reads the
file from beginning to end, so use a trap to put the message at the bottom too.

[ YOCTO #4919 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index a287629..0471cd6 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -56,9 +56,7 @@ maybe_make32() {
 	fi
 	if $make32; then
 		if ! [ -e "/usr/include/gnu/stubs-32.h" ]; then
-			bbwarn "Can't find stubs-32.h, but usually need it to build 32-bit libpseudo."
-			bbwarn "If the build fails, install 32-bit developer packages."
-			bbwarn "If you are using 32-bit binaries, the 32-bit libpseudo is NOT optional."
+			warn_32bit_missing
 		else
 			bbnote "Attempting to build 32-bit libpseudo.so for ${PN}."
 		fi
@@ -68,6 +66,12 @@ maybe_make32() {
 	fi
 }
 
+warn_32bit_missing() {
+	bbwarn "Can't find stubs-32.h, but usually need it to build 32-bit libpseudo."
+	bbwarn "If the build fails, install 32-bit developer packages."
+	bbwarn "If you are using 32-bit binaries, the 32-bit libpseudo is NOT optional."
+}
+
 # Two below are the same
 # If necessary compile for the alternative machine arch.  This is only 
 # necessary in a native build.
@@ -83,7 +87,10 @@ do_compile_prepend_class-native () {
 		make ${MAKEOPTS} distclean || :
 
 		./configure ${PSEUDO_EXTRA_OPTS} --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite-lib=${baselib} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32 --without-rpath
+		save_traps=$(trap)
+		trap 'warn_32bit_missing' 0
 		oe_runmake ${MAKEOPTS} libpseudo
+		eval "$save_traps"
 		# prevent it from removing the lib, but remove everything else
 		make 'LIB=foo' ${MAKEOPTS} distclean 
 	fi
-- 
1.7.10.4


