Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9010676FF5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 12:20:32 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l6so62448974wml.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2016 05:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=KCNiULlI08wW1VdktvfeTcE+sGBCiq3pis7/Wr3iYQI=;
	b=NzC0DqEHC2j5WSjmYX+98g/nvrJp1k3lp75c2lWF4IWnxvn71U3ehp+RXS/FtWhiNr
	an4y6ISHo+xgpWvh7yp+70puPUi4ADo1dZbaoYAvu1IYrZqZ1IRyqHmz696JerzM8gKQ
	LkMhjaXn6FV1KeAB9sk+3F/5YGMoxaw+/Njg2zjxDMHW96plXTHXER25o5TwC67QNnf7
	T1JWsIUHFqNIOMwoK8qnCR2zSVdRaY8Auh2BQNMC0vfnSEg3XTpHAXEhV0JbTE+Ppkc7
	DF5rnibBdLl24K5e0gGEgxVgOnyrE8EC572JgTAgZGLWCpFL1Bl/EuSQkabOztglqAS4
	AS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=KCNiULlI08wW1VdktvfeTcE+sGBCiq3pis7/Wr3iYQI=;
	b=j3o411n72DVfGM0c52qlgiuO+EAkqQ8zyuSScmuveIZyD+4H+XfI02gySEHTVPeHIB
	x5EaIIHarTvogDE9UiZ4STXe3QcvPljYAKQRl0/+qln9ajSAWPo+tB0EPq7SuTSiXmTN
	I3X5I1JhSNBh3PZrNbZZpgL7fOYYJIBQVmvbGffgPsWks58c0jzz82/nsEGOe8YrUjIa
	SRPLPReu74AOYnRdKms70rbGFhh00X/ndynPQ8hzN3JSwvNqle5Lg/bpPqyvUwIjxnXW
	5zWaOQ0Zsw1VVQHSSS1XQYZsbYvtq8DPKPzyWufJi3fdaILQGLZYihIeeLby/7Gk0uyj
	wWkg==
X-Gm-Message-State: AD7BkJLuP0//S2xp5eBmEsJ9assgjyuVOF6XQIDBBu20K5uMbqlbAij+qDuI2p+kEuSZFuc/
X-Received: by 10.28.101.5 with SMTP id z5mr22745551wmb.59.1459945232751;
	Wed, 06 Apr 2016 05:20:32 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	ks5sm3035739wjb.13.2016.04.06.05.20.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 05:20:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Apr 2016 13:20:29 +0100
Message-Id: <1459945229-10663-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] rpm: brace expansion is a bashism
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
X-List-Received-Date: Wed, 06 Apr 2016 12:20:34 -0000

The constuct rm *.{a,la} is a bashism and as tasks are run under /bin/sh this
may not work as expected.  Expand the {a,la} to two separate calls, and remove
the architecture-specific macro deletion as they are not installed in the first
place anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb | 9 ++++-----
 meta/recipes-devtools/rpm/rpm_5.4.16.bb  | 9 ++++-----
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index bacdef5..c6c21b8 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -568,16 +568,15 @@ do_install_append() {
 	rm -f ${D}/${mandir}/man1/lz*.1
 	rm -f ${D}/${libdir}/pkgconfig/liblzma*
 
-	rm -f ${D}/${libdir}/python%{with_python_version}/site-packages/*.{a,la}
-	rm -f ${D}/${libdir}/python%{with_python_version}/site-packages/rpm/*.{a,la}
+	rm -f ${D}/${libdir}/python%{with_python_version}/site-packages/*.a
+	rm -f ${D}/${libdir}/python%{with_python_version}/site-packages/*.la
+	rm -f ${D}/${libdir}/python%{with_python_version}/site-packages/rpm/*.a
+	rm -f ${D}/${libdir}/python%{with_python_version}/site-packages/rpm/*.la
 
 	#find ${D}/${libdir}/perl5 -type f -a \( -name perllocal.pod -o -name .packlist \
 	#	-o \( -name '*.bs' -a -empty \) \) -exec rm -f {} ';'
 	#find ${D}/${libdir}/perl5 -type d -depth -exec rmdir {} 2>/dev/null ';'
 
-	# We don't want the default macro set
-	rm -rf ${D}/${libdir}/rpm/{i[3456]86*,athlon*,pentium*,x86_64*,alpha*,sparc*,ia64*,ppc*,s390*,armv[34][lb]*,armv[345]*,mips*,noarch*}
-
 	rm -f ${D}/${libdir}/rpm/dbconvert.sh
 
 	rm -f ${D}/${libdir}/rpm/libsqldb.*
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 7621f8f..d42724c 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -576,16 +576,15 @@ do_install_append() {
 	rm -f ${D}/${mandir}/man1/lz*.1
 	rm -f ${D}/${libdir}/pkgconfig/liblzma*
 
-	rm -f ${D}/${libdir}/python%{with_python_version}/site-packages/*.{a,la}
-	rm -f ${D}/${libdir}/python%{with_python_version}/site-packages/rpm/*.{a,la}
+	rm -f ${D}/${libdir}/python%{with_python_version}/site-packages/*.a
+	rm -f ${D}/${libdir}/python%{with_python_version}/site-packages/*.la
+	rm -f ${D}/${libdir}/python%{with_python_version}/site-packages/rpm/*.a
+	rm -f ${D}/${libdir}/python%{with_python_version}/site-packages/rpm/*.la
 
 	#find ${D}/${libdir}/perl5 -type f -a \( -name perllocal.pod -o -name .packlist \
 	#	-o \( -name '*.bs' -a -empty \) \) -exec rm -f {} ';'
 	#find ${D}/${libdir}/perl5 -type d -depth -exec rmdir {} 2>/dev/null ';'
 
-	# We don't want the default macro set
-	rm -rf ${D}/${libdir}/rpm/{i[3456]86*,athlon*,pentium*,x86_64*,alpha*,sparc*,ia64*,ppc*,s390*,armv[34][lb]*,armv[345]*,mips*,noarch*}
-
 	rm -f ${D}/${libdir}/rpm/dbconvert.sh
 
 	rm -f ${D}/${libdir}/rpm/libsqldb.*
-- 
2.7.0


