Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RFmlq-0005yy-8r
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 14:58:22 +0200
Received: by bkat8 with SMTP id t8so5735236bka.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 05:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=HvdPayQgzrbigT7AIR9KKLEZoCxZe2v+rFwtqE+1Ssk=;
	b=h3SjkdDHgesWO11pivqxc8P3jp61ItRwl48v4+2Dn9/wyFGtR+156Vt66Do0d9Im2C
	FOBUqYofJvezz7XZ5eYYoWgMBzO1OCl3RucSmnlaUnblczbX03o2xnrrAICnWbyOjgZv
	9BCgsuxNOBZlBFcsOalb2VjX95IeUq27HKK5M=
Received: by 10.204.140.22 with SMTP id g22mr14142496bku.69.1318855953109;
	Mon, 17 Oct 2011 05:52:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a27sm17050759bku.9.2011.10.17.05.52.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 05:52:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2011 14:52:22 +0200
Message-Id: <1318855942-8677-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [RFC] bitbake.conf: include only ${libdir}/${BPN}/*${SOLIBS} not whole ${libdir}/${BPN}/* in FILES_${PN}-dev
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
X-List-Received-Date: Mon, 17 Oct 2011 12:58:22 -0000

* ie syslog-ng has a lot of .so and .la files in ${libdir}/${BPN}/ and
  fails with this QA check:
| ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: syslog-ng path
'/work/i586-oe-linux/syslog-ng-3.2.2-r6.1/packages-split/syslog-ng/usr/lib/syslog-ng/libafsocket.so'
* I haven't tried to rebuild from scratch to check if this changes is
  creating more QA issues about unpackaged files then what is trying to
  fix (ie in syslog-ng), that's why it's RFC

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e2c1b6f..772c09e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -262,7 +262,7 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS}
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* \
             ${base_libdir}/*${SOLIBS} \
-            ${datadir}/${BPN} ${libdir}/${BPN}/* \
+            ${datadir}/${BPN} ${libdir}/${BPN}/*${SOLIBS} \
             ${datadir}/pixmaps ${datadir}/applications \
             ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
             ${libdir}/bonobo/servers"
@@ -271,7 +271,7 @@ FILES_${PN}-doc = "${docdir} ${mandir} ${infodir} ${datadir}/gtk-doc \
             ${datadir}/gnome/help"
 SECTION_${PN}-doc = "doc"
 
-FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
+FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/${BPN}/*${SOLIBSDEV} ${libdir}/*.la \
                 ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
                 ${datadir}/aclocal ${base_libdir}/*.o"
 SECTION_${PN}-dev = "devel"
-- 
1.7.7



