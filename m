Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9472860043
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 19:04:10 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id b187so185614009wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 12:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=THMN6iRFR5pXIjAka6+EJF8MDiXdaArxTCGqPlRprNs=;
	b=0bxdwBW7Fh88BEuqMD6U2Ml7OOm2QqhA08S+ocJJ4LYMljJ7K7p/YFFXcqTG46CvDs
	hypUyYOB33KI7+YLc9zLSihzI8hKbKUJrr781pVZl03078E+srPT5YtzDLZhBIoXmtc3
	DRcb0zAcGf/GKX8NiAosACLzZKjOHwjitEUnvLztXzpj9sPDHsTlrRLCtSHluGZdWhbj
	5EuXZU04h9LGu0qhvfL2bPPFmedXQPsYm4s6UXZ5cR1KtQVmKSMIbNn96xEK4eiV+Uw6
	YpS6K6LWxTvtQnOlptQl4J7PP9MKfmmJIw3vG5dpnyigtVMFpwz0pOqhn6AfX2ISYu5w
	seHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=THMN6iRFR5pXIjAka6+EJF8MDiXdaArxTCGqPlRprNs=;
	b=f3h/kgJa4iJ0a1jOMTbbRHLwqhtUS8dCrG1lKOh1L4eVOAS3S1H61e7NF1qc46oMH1
	/ZTzzXKJ822Tr43dMBIYFerUq/RzmWiv6T/Q1GfLWQL63QxT/xwJd0KnM8DH8zFKNQNQ
	oyTvHvHpHqH6CGOz/5mLAJR6qUdFk4oZruYGU0D4CJ4zbpW1AkizBUhqGEFIA5g4auaQ
	uVA1Pob2oMcScmQLAcnNQMD1VU2YrcCu5oJ/vC54elKaGky0W+LED6mlbBvmq8cyCwU+
	ipuaympRbDiKdUwo0D1VetB3kmmyiugS/xj2l9Ac3DqCLWJ31qu/E4xaiC2C4oxT23lD
	bSlw==
X-Gm-Message-State: AE9vXwOp3Ud82YBnBWYLiHp3Y8u/vebRFGbF2o2lwh+X7vH/EDTM8fZrK9g3HmYVxWB9CJkM
X-Received: by 10.194.202.198 with SMTP id kk6mr1136812wjc.22.1473361450144;
	Thu, 08 Sep 2016 12:04:10 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	bt5sm5990078wjb.35.2016.09.08.12.04.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Sep 2016 12:04:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Sep 2016 20:04:07 +0100
Message-Id: <1473361447-11655-1-git-send-email-ross.burton@intel.com>
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
X-List-Received-Date: Thu, 08 Sep 2016 19:04:11 -0000

These were noticed by the use of bashisms (rm *.{foo,bar}) and lots of these rm
commands are deleting files which don't exist in the first place.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.16.bb | 45 ---------------------------------
 1 file changed, 45 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 9f78dee..2b8768c 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -554,54 +554,11 @@ do_install_append() {
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
-	rm -f ${D}/${includedir}/popt.h
-	rm -f ${D}/${libdir}/libpopt.*
-	rm -f ${D}/${libdir}/pkgconfig/popt.pc
-	rm -f ${D}/${datadir}/locale/*/LC_MESSAGES/popt.mo
-	rm -f ${D}/${mandir}/man3/popt.3
-
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
-	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/*.a
 	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/*.la
-	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/rpm/*.a
 	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/rpm/*.la
 
-	#find ${D}/${libdir}/perl5 -type f -a \( -name perllocal.pod -o -name .packlist \
-	#	-o \( -name '*.bs' -a -empty \) \) -exec rm -f {} ';'
-	#find ${D}/${libdir}/perl5 -type d -depth -exec rmdir {} 2>/dev/null ';'
-
 	rm -f ${D}/${libdir}/rpm/dbconvert.sh
 
-	rm -f ${D}/${libdir}/rpm/libsqldb.*
-
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
@@ -610,12 +567,10 @@ do_install_append() {
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


