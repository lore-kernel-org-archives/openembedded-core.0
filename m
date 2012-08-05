Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy71U-0004kh-HT
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:02:00 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so1441018wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=HZ0FZu6XPre8qarjp2c4bN4FWn0fhvLbEQ9g3TsfjwY=;
	b=ZHXJomsmfR2yvAHA3MM4vlYiFyP9DdCt1hc1jYptibZhrbHgCKey2VZ442bGw8UpZn
	G2UN2sh3gf/robp/8UrwriiBjmTH6nQYOBMwT9RmzF+LGgnpxdst5sT4RytckhAlD0HF
	W0hG+U8dLn92VrkEQIGQYc835I8foYh8q3cLU02DKCmGp/mH+LxKtomnQJ/1vvgxeKMy
	NqLKo6OIXxFh5rVnRiq+dCum4yUAqzl02Bw/zLS8oZBLKo04OLeZvX7GNRkGSHWBKQte
	fJP5xw/AUtQrDkcp9oD88rCQNNxsxoJipZSDf9qaVSsxQYXhqQG5m/C+STyG84zMhuLt
	fqPg==
Received: by 10.180.106.97 with SMTP id gt1mr12427039wib.5.1344196219136;
	Sun, 05 Aug 2012 12:50:19 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.50.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:50:18 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:48 +0200
Message-Id: <1344196136-7643-21-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQlIEceYVD8h/WYs3Z3A9/ZlCDs9DqfeJHAw9YmklJxPrVxQNSyeVlFFPllRoNZF1w2y7L+G
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 20/28] x11-common: use ${sysconfdir} instead of /etc for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 20:02:00 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-graphics/x11-common/x11-common_0.1.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/x11-common_0.1.bb b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
index ddb3a1d..2675145 100644
--- a/meta/recipes-graphics/x11-common/x11-common_0.1.bb
+++ b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Common X11 scripts and configuration files"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
-PR = "r44"
+PR = "r45"
 
 SRC_URI = "file://etc \
            file://gplv2-license.patch"
@@ -12,10 +12,10 @@ S = "${WORKDIR}"
 inherit allarch
 
 do_install() {
-	cp -R ${S}/etc ${D}/etc
-	chmod -R 755 ${D}/etc
-	find ${D}/etc -type d -name .svn -prune -exec rm -rf {} \;
-	find ${D}/etc -type f -name \*~ -exec rm -rf {} \;
+	cp -R ${S}/etc ${D}${sysconfdir}
+	chmod -R 755 ${D}${sysconfdir}
+	find ${D}${sysconfdir} -type d -name .svn -prune -exec rm -rf {} \;
+	find ${D}${sysconfdir} -type f -name \*~ -exec rm -rf {} \;
 }
 
 RDEPENDS_${PN} = "dbus-x11 xmodmap xdpyinfo xtscal xinit formfactor"
-- 
1.7.7.6



