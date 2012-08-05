Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy71E-0005Ex-NU
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:44 +0200
Received: by wibhq4 with SMTP id hq4so974714wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=OtfQldPbC2L2Itwz5A/PzqEuZhKTg+V5wsRRxYqd/7o=;
	b=Tpb+URjXst32X94UPU7SOrti92Dq3V2VxOCGExVBbN2WEM2VGvpPBMjZTlXcuaUEFE
	cP8tb64/Dah8aHh4NFE1GrkyXoXAUM6OlJp5gk2fYJp66pbAXbhtQMVDdOKArMhNuusc
	EzOVeeB1k6lkyXzr7ezOfa07V/KUSlF+2U1wU6jQC6myBNdNN34NX0NmUdHjBsgo9Fpw
	fkQzaOFwy15bqkHE7KhymBJMtxXAU46MQLTYIGe6iv2zNHwHueGmIWPaf0nG4A62mLr3
	CpTKIsCBMFX7xxqUF9Vd68uUef48k7Q+qVgIc0uk5WTB8srt1KqadW3mtJCmAWBgMYs8
	NOFA==
Received: by 10.216.122.203 with SMTP id t53mr4660553weh.5.1344196201145;
	Sun, 05 Aug 2012 12:50:01 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.49.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:50:00 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:42 +0200
Message-Id: <1344196136-7643-15-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQmeP+/ezzD767oV3b+uQ3KJ6Or1dC0k/X8I1aodQ3emsc5L07sobcVyDgzjUYEq1pr3nIRh
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 14/28] rpm: use ${localstatedir} and ${libdir} instead of /var and /usr/lib
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
X-List-Received-Date: Sun, 05 Aug 2012 20:01:44 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index e276cc3..60541f4 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file"
-PR = "r46"
+PR = "r47"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -421,8 +421,8 @@ do_install_append() {
 	rm -f ${D}/${libdir}/rpm/bin/dbconvert
 	rm -f ${D}/${libdir}/rpm/bin/pom2spec
 
-	rm -rf ${D}/var/lib/wdj ${D}/var/cache/wdj
-	rm -f ${D}/usr/lib/rpm/bin/api-sanity-checker.pl
+	rm -rf ${D}${localstatedir}/lib/wdj ${D}${localstatedir}/cache/wdj
+	rm -f ${D}${libdir}/rpm/bin/api-sanity-checker.pl
 }
 
 do_install_append_virtclass-native() {
-- 
1.7.7.6



