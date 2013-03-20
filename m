Received: from mail-pd0-f177.google.com ([209.85.192.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UIReU-0001il-K3
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 23:38:36 +0100
Received: by mail-pd0-f177.google.com with SMTP id y14so786050pdi.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 15:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=4IAGdmBOLiW20ztGlHp9P/pzeqDBV7+wshgYxHPcjFg=;
	b=Pz/Gp1a8ARoMT29bkO1ewbv6kp/5H/aDzQ7eZv6hCImM+rqS1YRv2VmxSlr6OPgufJ
	nRgyQG3bWfwIq7//Eq8SFSIevqxFmrLiq3nWhAjliKKPxRRaXuuDthZwn0ghyami/YbJ
	a8vT7o4NoQc0gqYboyrwXEtMlAz1AsFFwNs8oCkm2bmSIWkYrTfO+qkO8KPkgffFb8No
	S0PMcBGRa8f2EwxOgz4KzSutJ5fGt8G+bnuwDehsQ7GW0isPjD1uAuc49WDDdPegXsZP
	+Sq8+huyBHO6UTjeYqMUE9gGaR0a8BsuoO7wpZjjg45o6tZ/5lZ+Vnt96xI4VGH9mUPL
	dsgQ==
X-Received: by 10.68.132.42 with SMTP id or10mr11475067pbb.127.1363818102577; 
	Wed, 20 Mar 2013 15:21:42 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id in5sm3493991pbc.20.2013.03.20.15.21.39
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Mar 2013 15:21:41 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Mar 2013 15:21:31 -0700
Message-Id: <1363818091-22720-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.2
In-Reply-To: <1363818091-22720-1-git-send-email-kergoth@gmail.com>
References: <1363818091-22720-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/2] package_{ipk, deb, rpm}: drop the TARGET_OS conditional
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

The tclibc file for uclibc already empties IMAGE_LINGUAS, so there's no point
to this conditional as far as I can tell, and it can cause issues for certain
values of TARGET_OS.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/package_deb.bbclass | 17 +++++++----------
 meta/classes/package_ipk.bbclass | 11 +++--------
 meta/classes/package_rpm.bbclass |  5 -----
 3 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 84b1c52..4559199 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -101,16 +101,13 @@ package_install_internal_deb () {
 
 	apt-get update
 
-	# Uclibc builds don't provide this stuff..
-	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then
-		if [ ! -z "${package_linguas}" ]; then
-			for i in ${package_linguas}; do
-				apt-get install $i --force-yes --allow-unauthenticated
-				if [ $? -ne 0 ]; then
-					exit 1
-				fi
-			done
-		fi
+	if [ ! -z "${package_linguas}" ]; then
+		for i in ${package_linguas}; do
+			apt-get install $i --force-yes --allow-unauthenticated
+			if [ $? -ne 0 ]; then
+				exit 1
+			fi
+		done
 	fi
 
 	# normal install
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 094ba09..d003ae7 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -90,14 +90,9 @@ package_install_internal_ipk() {
 
 	opkg-cl ${ipkg_args} update
 
-	# Uclibc builds don't provide this stuff...
-	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then
-		if [ ! -z "${package_linguas}" ]; then
-			for i in ${package_linguas}; do
-				opkg-cl ${ipkg_args} install $i
-			done
-		fi
-	fi
+	for i in ${package_linguas}; do
+		opkg-cl ${ipkg_args} install $i
+	done
 
 	if [ ! -z "${package_to_install}" ]; then
 		opkg-cl ${ipkg_args} install ${package_to_install}
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index b6d76e7..12b4bfa 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -368,11 +368,6 @@ EOF
 		done
 	fi
 
-	# Uclibc builds don't provide this stuff...
-	if [ x${TARGET_OS} != "xlinux" ] && [ x${TARGET_OS} != "xlinux-gnueabi" ] ; then
-		package_linguas=""
-	fi
-
 	# Construct install scriptlet wrapper
 	cat << EOF > ${WORKDIR}/scriptlet_wrapper
 #!/bin/bash
-- 
1.8.2



