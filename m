Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Top4E-00076h-Cz
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Dec 2012 06:35:04 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so5036855dak.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2012 21:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=NQ31kD726zsm4srA7xZ0/5QMJROAHxRr8nwawDloVT8=;
	b=c9DV0E+henxGo7O1pD4GBB6evIFFOmgU7lFWjNbSSpkJZM9e2pmpG9yr86UmKUIl/O
	aTuYyj1RgjVKOHHFRVS834pa7cTh5oEWn4IF2sw0yx9TUydS2pqY7EhGqI/TWAYBa10q
	ktgNwYIW6fjXjQnP4lU/hp2yKYAE99zAcZCLyb7iNWcaja26eEYsf4yRlG/gpXdvFLWK
	oaym6VfYb2EZvCIuOQe+grwXwrWZgybsYo+AieyxmZTO8MRIlho+zBEpr5mpOUgZW/Vl
	B5uKKR4gzjl98tL6J0T685wlos28hyRtxFn8sQGJuHCla3AvUMV5ExsSsJo0K00Ynu67
	NCJw==
X-Received: by 10.68.225.232 with SMTP id rn8mr109974838pbc.34.1356758385218; 
	Fri, 28 Dec 2012 21:19:45 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id vs3sm20848581pbc.61.2012.12.28.21.19.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Dec 2012 21:19:43 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 22:19:26 -0700
Message-Id: <a961a3a9f4687c9de87a489b1814a2382590b0cb.1356758000.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1356758000.git.chris_larson@mentor.com>
References: <cover.1356758000.git.chris_larson@mentor.com>
In-Reply-To: <cover.1356758000.git.chris_larson@mentor.com>
References: <cover.1356758000.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/6] chkconfig: obey sysconfdir, base_libdir
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
X-List-Received-Date: Sat, 29 Dec 2012 05:35:23 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index 7915594..df9b193 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
 DEPENDS = "libnewt popt"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2"
 
@@ -31,6 +31,12 @@ EXTRA_OEMAKE = "\
     'MANDIR=${mandir}' \
 "
 
+do_unpack[postfuncs] += "obey_variables"
+do_unpack[vardeps] += "obey_variables"
+obey_variables () {
+	sed -i -e 's,/etc,${sysconfdir},; s,/lib/systemd,${base_libdir}/systemd,' leveldb.h
+}
+
 do_install() {
 	oe_runmake 'DESTDIR=${D}' 'INSTALLNLSDIR=${D}${datadir}/locale' install
 	mkdir -p ${D}${sysconfdir}/chkconfig.d
-- 
1.8.0



