Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 819D0771ED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 14:53:27 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id 1so149414949wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 07:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=LPaEyU3QMs/Ii80edtsGEZDx+Xf9k0D9sD7E89XFsGI=;
	b=ChRnHOjLqGZ0x0SfaU3c6oKimS7sY9YNlorvNJeDEx2EJNP1Ig7C/EdlLb2bHYVSS5
	Q43XtLQJ/tiVZPPskf4yKkJ+i6Avqcg/d2MYz1F2w6utS+BnryqEpjY7Ae/QIgIkrWFc
	JMqFyyxenJJF8VAjGtLL9q45Ei1BMbvWOrAdJUWOwLgptzX0dP0Ijz5C8tzsg8oHc4rF
	qHxPbYHN9jWNauOhgh74/qHZ2D7L8dSdp3NygzdlK83RM/4MawjQQ9rVBoCrAQeWpy0r
	Y0W8rNnUVSbftkT/Jt/qzXaHaX9VveN1QNtuamzBSizuJK7JN9fBlB31CXaDMVMV5i+Y
	H5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=LPaEyU3QMs/Ii80edtsGEZDx+Xf9k0D9sD7E89XFsGI=;
	b=XCAzBm3wfEQNmcNxLT3wHbzcU/6OCs+ZQDme8dy/RfAGIe9p8YnFFZsnpgBbiIEZMD
	5IvCe+aKywFNVJKmSGql2Tetnw66U8kWsaKsuInOWzr/dxT/ASiLkRHyGz7hKmSQ/Ot7
	QMzdSZ1EVVy3HfmTDPKid+5dS7EiRe7wSFCtzQdCToYIQVW9o1qqk8WB/rN4j+5I+VIj
	gWLMAdCF03P/pXIvbS/XMhE3uvgWdBToA8+LY6OEHVh3qoGbbuIzPt5iKuASj4VQtG0N
	MYLsP/KIhXklp3+yE3v83Fhgzxy23uJZoBEI12OhnJ0HxVmSBL3WS2AmESx21MUwq1yg
	gFFQ==
X-Gm-Message-State: AE9vXwNBwsFMd7wafdUiTlVi01IBhYmAIB++lFnyB+qEfc1q5cbC7Xl1ibCxsh6+n/tAi7Eg
X-Received: by 10.194.57.75 with SMTP id g11mr7353374wjq.17.1473692007004;
	Mon, 12 Sep 2016 07:53:27 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	ce6sm18239077wjc.27.2016.09.12.07.53.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Sep 2016 07:53:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2016 15:53:24 +0100
Message-Id: <1473692004-4536-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] rpm: remove redundant removals
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
X-List-Received-Date: Mon, 12 Sep 2016 14:53:27 -0000

These were noticed by the use of bashisms (rm *.{foo,bar}) and lots of these rm
commands are deleting files which don't exist in the first place.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.16.bb | 37 ---------------------------------
 1 file changed, 37 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 9f78dee..ee300a0 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -554,54 +554,19 @@ do_install_append() {
 	install -m 0755 ${WORKDIR}/pythondeps.sh ${D}/${libdir}/rpm/pythondeps.sh
 	install -m 0755 ${WORKDIR}/perfile_rpmdeps.sh ${D}/${libdir}/rpm/perfile_rpmdeps.sh
 
-	# Remove unpackaged files (based on list in rpm.spec)
-	rm -f ${D}/${libdir}/rpm/{Specfile.pm,cpanflute,cpanflute2,rpmdiff,rpmdiff.cgi,sql.prov,sql.req,tcl.req,trpm}
-
-	rm -f ${D}/${mandir}/man8/rpmcache.8*
-	rm -f ${D}/${mandir}/man8/rpmgraph.8*
-	rm -f ${D}/${mandir}/*/man8/rpmcache.8*
-	rm -f ${D}/${mandir}/*/man8/rpmgraph.8*
-	rm -rf ${D}/${mandir}/{fr,ko}
-
 	rm -f ${D}/${includedir}/popt.h
 	rm -f ${D}/${libdir}/libpopt.*
 	rm -f ${D}/${libdir}/pkgconfig/popt.pc
 	rm -f ${D}/${datadir}/locale/*/LC_MESSAGES/popt.mo
 	rm -f ${D}/${mandir}/man3/popt.3
 
-	rm -f ${D}/${mandir}/man1/xar.1*
-	rm -f ${D}/${bindir}/xar
-	rm -rf ${D}/${includedir}/xar
-	rm -f ${D}/${libdir}/libxar*
-
-	rm -f ${D}/${bindir}/lz*
-	rm -f ${D}/${bindir}/unlzma
-	rm -f ${D}/${bindir}/unxz
-	rm -f ${D}/${bindir}/xz*
-	rm -rf ${D}/${includedir}/lzma*
-	rm -f ${D}/${mandir}/man1/lz*.1
-	rm -f ${D}/${libdir}/pkgconfig/liblzma*
-
 	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/*.a
 	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/*.la
 	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/rpm/*.a
 	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/rpm/*.la
 
-	#find ${D}/${libdir}/perl5 -type f -a \( -name perllocal.pod -o -name .packlist \
-	#	-o \( -name '*.bs' -a -empty \) \) -exec rm -f {} ';'
-	#find ${D}/${libdir}/perl5 -type d -depth -exec rmdir {} 2>/dev/null ';'
-
-	rm -f ${D}/${libdir}/rpm/dbconvert.sh
-
 	rm -f ${D}/${libdir}/rpm/libsqldb.*
 
-	# We don't want, nor need the Mandriva multiarch items
-	rm -f ${D}/${bindir}/multiarch-dispatch
-	rm -f ${D}/${bindir}/multiarch-platform
-	rm -f ${D}/${libdir}/rpm/check-multiarch-files
-	rm -f ${D}/${libdir}/rpm/mkmultiarch
-	rm -f ${D}/${includedir}/multiarch-dispatch.h
-
 	rm -f ${D}/${libdir}/rpm/gstreamer.sh
 	rm -f ${D}/${libdir}/rpm/gem_helper.rb
 	rm -f ${D}/${libdir}/rpm/rubygems.rb
@@ -610,12 +575,10 @@ do_install_append() {
 	rm -f ${D}/${libdir}/rpm/macros.d/kernel
 	rm -f ${D}/${libdir}/rpm/macros.d/gstreamer
 	rm -f ${D}/${libdir}/rpm/bin/mgo
-	rm -f ${D}/${libdir}/rpm/bin/dbconvert
 	rm -f ${D}/${libdir}/rpm/bin/pom2spec
 
 	rm -rf ${D}/var/lib/wdj ${D}/var/cache/wdj
 	rm -f ${D}/${libdir}/rpm/bin/api-sanity-checker.pl
-
 }
 
 do_install_append_class-target() {
-- 
2.8.1


