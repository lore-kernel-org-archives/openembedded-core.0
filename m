Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UIReR-0001ii-Qe
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 23:38:36 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so1246310dak.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 15:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=78fJ9PgAELfDzo9kxdbIzN0tyn+Q3MAm4UGOpvrivw4=;
	b=ZfNe6RSnhIGx2zrPjJ/BFjLnfHaH0bCW3Rdex15LlrdNca0BbFrrFATcMAvCFVmLOm
	jJjRQrfMwO3rKIYDr9mF1iHaAP2Hpj4rwXwMXwc0+lZARqQcIn8SptBBPYoiD+AsQ17F
	IRznQg/bfheGuveRk/1uPFvCU0hrLBE/OhKMKjLugo3YvUtn76TB4Whow0pEn4Xow6tg
	5dgz1UhMJJGopc17ikhtFDKM48XztJUyFWdOsmMe2Y9XK6dQykmIS0EpcWaIFV08tpkZ
	wrXmbX1LceMI/fg112tp1RfzWs9OMLB0PlvtLD9u+z//9rzHN4BbGYAmeHIXvuVSqMUd
	knCg==
X-Received: by 10.68.143.197 with SMTP id sg5mr11707175pbb.101.1363818099667; 
	Wed, 20 Mar 2013 15:21:39 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id in5sm3493991pbc.20.2013.03.20.15.21.36
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Mar 2013 15:21:38 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Mar 2013 15:21:30 -0700
Message-Id: <1363818091-22720-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.2
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/2] package_deb: don't install glibc-localedata-i18n separately
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
X-List-Received-Date: Wed, 20 Mar 2013 22:38:42 -0000

From: Christopher Larson <chris_larson@mentor.com>

This was removed from package_rpm and package_ipk years ago, and shouldn't be
needed, installing the packages from package_linguas should be sufficient.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/package_deb.bbclass | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 3174184..84b1c52 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -104,10 +104,6 @@ package_install_internal_deb () {
 	# Uclibc builds don't provide this stuff..
 	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then
 		if [ ! -z "${package_linguas}" ]; then
-			apt-get install glibc-localedata-i18n --force-yes --allow-unauthenticated
-			if [ $? -ne 0 ]; then
-				exit 1
-			fi
 			for i in ${package_linguas}; do
 				apt-get install $i --force-yes --allow-unauthenticated
 				if [ $? -ne 0 ]; then
-- 
1.8.2



