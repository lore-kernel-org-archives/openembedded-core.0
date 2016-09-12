Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC89771F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 15:23:50 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id a6so59769866wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 08:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=206K/a0thY0r7zq4x2m9C4qsGct0Ttm2sgWqgsUTjHA=;
	b=DknUGEJvuSK//ns2RqTj8lH0yW+i/s5N1E3lkQxf/9bNRFbzZanCMrsikoCawnQHgT
	GRfJ9jlWHbkyJXVlVZl7fNFYCmmTzPkc+XrA4e3ebiFqTWr7eQJhktv49qqIi3LfRnQc
	cgtKiQJoq/2/FlRAXjFMX/62B/k0Pl9IgCPX8F0Lmjv0QFcKIxjd4uvtSAbNExzdGQsC
	fdVgwVWyZyVtqLF4o7A4vq0QjE+FolsImj2oYB1/JoGf3gQ1ZSiwm/j8u1NY6GSnGo/6
	9dp5j5q2m0Ic/wGv038RygtXKKEp5PFwfFb/7ra2CaJ0OXqZ5tZMJW+8dQvvO5exLQiL
	HEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=206K/a0thY0r7zq4x2m9C4qsGct0Ttm2sgWqgsUTjHA=;
	b=UaLJzua2qbcTbyMRtDlYo+QPEtlPKVWx5BmQCC1iE2buxsY1vWGxkjrfKnpcVe5JuW
	EzZ4uEUZOtQRRebyjp370ffMTtbr0n84jv1dJdG86H5RJvcg+UAC99/LJc9+Dq70UnZb
	9JRoQyCnAW1MmjGp15RWJNbGqux5l7+lU/z2DCoyAU46OgttN15zaEqEKEB6HvTSOHH9
	PuhzMQgT2RDuLOWRQ6ZL52wWyBo59iiGK8ea57QtSdidxa0xlM1L3vIu0G9iOGe0bYsF
	OUAndYDxEcoSo4uPo6DCL1ed0EQcbsYFommQ0Ci2iRdYf7cOqtqh/1BNRGPAt8c4+0Yq
	NUIQ==
X-Gm-Message-State: AE9vXwNjSbnEk5Dr//oPkzg3+IyzS8LOeMypCGIJUXcL2QYoV8mQB9HOnoHpEtuiKD5O+0D8
X-Received: by 10.28.29.19 with SMTP id d19mr431027wmd.75.1473693831060;
	Mon, 12 Sep 2016 08:23:51 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	ml1sm18278809wjb.46.2016.09.12.08.23.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Sep 2016 08:23:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2016 16:23:47 +0100
Message-Id: <1473693827-23099-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH][V3] rpm: remove redundant removals
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
X-List-Received-Date: Mon, 12 Sep 2016 15:23:51 -0000

These were noticed by the use of bashisms (rm *.{foo,bar}) and lots of these rm
commands are deleting files which don't exist in the first place.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.16.bb | 36 ---------------------------------
 1 file changed, 36 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 9f78dee..dd6e103 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -554,54 +554,20 @@ do_install_append() {
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
 	rm -f ${D}/${libdir}/rpm/dbconvert.sh
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
@@ -610,12 +576,10 @@ do_install_append() {
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


