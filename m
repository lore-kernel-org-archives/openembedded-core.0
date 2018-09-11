Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5362F79855
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 09:37:47 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id s14-v6so16086043wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 02:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=4CWYX/2z/ESkYso4tDkc+j16dH+NQgHiOjfMfwKssbA=;
	b=iB5POn08Yw+SaQFLcw2LBg540X4FDU5hQFTjrXlFD9Eyh0CjF8k3pbtAOlJZPoKDR8
	k57dlm4X5AxVL8k8FrQLsYxgNfhqrYicMaJbulDSuMFDMfkLKGq5fQ+2Jbne9yGlZXTb
	IYq0I3yzd5BYhue8c+acx+knKvSJ/HLHw+FzjlclnorbKwjAkS7B9ptMkcbwy8sOMFVl
	GXaLUOmgVi4cjFmWm0f64hZV2e1SAWOsSXMHCiUvUfHTqfRFplvkR2g6C+AjmJvqN9+a
	z5D1CtmeZqp5M8UH1xr05abUvPSnGThIIT+lDsF/rJRguAMduHAATp0Oo8a+/AR4oPu7
	O9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4CWYX/2z/ESkYso4tDkc+j16dH+NQgHiOjfMfwKssbA=;
	b=rOzae3rVFmHnS1QuXfPN9fD/6KTN3c7LPuDsxAh3GDCEpPOYviCIvpj2ypadr41qmF
	WtlTF8/HrX8ySsI06pXDOxBTdIb18VlM19JK1laFDeLTc/lMLtXWbEVZ8dm4tQxGuUWw
	NMCTjGGHskel2Gx6XekEaVxoxYFBPy7u0ylXKkBD4BX1sNt3CuXAm6h/4G1jmQ0admF4
	yJRKqzgVYnuamqhAmlLt0sFyecvS0OBBOaZgqIFh3Q6SGv7PKwgmTP7ag3CLG8LxZ540
	D2Nb0+o7LTJxHq3zdi0ml9/EgLM7auIqqna5cS71Zv4RKrxB9EGnTEVC72M19G2BAGSu
	EHMA==
X-Gm-Message-State: APzg51Dik+HRD+T13sdxS2TWIcqEruf7YPjI3O0OC0OukP9hfFtwY/Fp
	0Q/gvGIQMVbnMGDq8ty1UIupGzAf1Yg=
X-Google-Smtp-Source: ANB0Vdas+EkA847bD6SU4UdBy4uM9XldSNt1TRLT5CbbgXbsuKWoZzlJ+CFQ+Gchm9majO7Ul/SXNg==
X-Received: by 2002:adf:c684:: with SMTP id
	j4-v6mr17551751wrg.243.1536658667694; 
	Tue, 11 Sep 2018 02:37:47 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a11-v6sm16636609wrr.81.2018.09.11.02.37.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Sep 2018 02:37:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2018 10:37:45 +0100
Message-Id: <20180911093745.5397-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] pkgconf: don't use alternatives
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
X-List-Received-Date: Tue, 11 Sep 2018 09:37:47 -0000

There's no need to do alternatives as pkgconf and pkg-config won't be installed
at the same time, and pkg-config doesn't do alternatives either.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/pkgconf/pkgconf_1.5.3.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.5.3.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.5.3.bb
index 2021d1ac602..415478d5cf9 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.5.3.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.5.3.bb
@@ -24,7 +24,7 @@ SRC_URI = "\
 SRC_URI[md5sum] = "c21743bca14c882c0f282746168a5edc"
 SRC_URI[sha256sum] = "d3468308553c94389dadfd10c4d1067269052b5364276a9d24a643c88485f715"
 
-inherit autotools update-alternatives
+inherit autotools
 
 EXTRA_OECONF += "--with-pkg-config-dir='${libdir}/pkgconfig:${datadir}/pkgconfig'"
 
@@ -46,8 +46,6 @@ do_install_append_class-native () {
     install -m755 ${B}/pkg-config-esdk ${D}${bindir}/pkg-config-esdk
 }
 
-ALTERNATIVE_${PN} = "pkg-config"
-
 # When using the RPM generated automatic package dependencies, some packages
 # will end up requiring 'pkgconfig(pkg-config)'.  Allow this behavior by
 # specifying an appropriate provide.
-- 
2.11.0


