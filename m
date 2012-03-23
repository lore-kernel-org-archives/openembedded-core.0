Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBDAB-00075m-Ri
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 23:40:51 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so3010738wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 15:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=WKQGxXBOeSstGPoYDl0vWzOMzWHSbbpYddDWLxJlb0I=;
	b=PaT/WPKBsi0nXdU+580uCxtpgYd3yyiZdZGSu4z97uyImdp+jnN2ocP968Q/wQjGyN
	H5el0tzj92oXwP+edcP1be+AUwupo3j/jp1vgfNjiB6webNmQXxO/ENPGEadTdmXYO2I
	Dco2jtksNZPF4/hGQm4U/qEpPX6BqmgPPVM7to/fhHIyvoLEJzAcVeqwt7Q8PT8A9co6
	jilrrtd279MQqGa243Y+t2Jj/ZpLeEWP6DqHh3tjZoeesDy+TAGa6/NiJ34eKf5C6FYG
	CnWPYWvDxj5O9UbS44LICutUJXjYnDn0dJ2vsQTHE270nXNa+irTEaDa7wXWjGyDGVZJ
	yu2Q==
Received: by 10.216.52.14 with SMTP id d14mr7645058wec.35.1332541917599;
	Fri, 23 Mar 2012 15:31:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 17sm18038991wis.0.2012.03.23.15.31.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 15:31:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 23:30:49 +0100
Message-Id: <f5729dee0c8d33a3974907320af54bdb62f4904e.1332541342.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
References: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332541342.git.Martin.Jansa@gmail.com>
References: <cover.1332541342.git.Martin.Jansa@gmail.com>
Subject: [PATCHv 10/10] rootfs_ipk: replace 3 opkg-cl calls with one in get_package_filename
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
X-List-Received-Date: Fri, 23 Mar 2012 22:40:51 -0000

* || true is needed for cases where grep doesn't find anything
* and quotes around info are needed to keep line breaks

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/rootfs_ipk.bbclass |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 2df8ca4..13bd4bf 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -127,9 +127,10 @@ list_installed_packages() {
 }
 
 get_package_filename() {
-	name=`opkg-cl ${IPKG_ARGS} info $1 | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk '/^Package/ {printf $2"_"}'`
-	name=$name`opkg-cl ${IPKG_ARGS} info $1 | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk -F: '/^Version/ {printf $NF"_"}' | sed 's/^\s*//g'`
-	name=$name`opkg-cl ${IPKG_ARGS} info $1 | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" | awk '/^Archi/ {print $2".ipk"}'`
+	info=`opkg-cl ${IPKG_ARGS} info $1 | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" || true`
+	name=`echo "${info}" | awk '/^Package/ {printf $2"_"}'`
+	name=$name`echo "${info}" | awk -F: '/^Version/ {printf $NF"_"}' | sed 's/^\s*//g'`
+	name=$name`echo "${info}" | awk '/^Archi/ {print $2".ipk"}'`
 
 	fullname=`find ${DEPLOY_DIR_IPK} -name "$name" || true`
 	if [ "$fullname" = "" ] ; then
-- 
1.7.8.5



