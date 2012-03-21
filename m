Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SATMh-0002tN-Is
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 22:46:43 +0100
Received: by mail-wi0-f177.google.com with SMTP id hj13so1837592wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=WKQGxXBOeSstGPoYDl0vWzOMzWHSbbpYddDWLxJlb0I=;
	b=ACe4DfHFjVAftEuRT5ylFEih49tD16264IyC69J6Mhu7FPpodEGtXgOyPoJ1buMLIa
	zaaVC6L6VrHcSuypK2/bDqKNnXumSl3B5ZcXranlkSGTzP+Rc3Azy53XrL/zV0xPEQeE
	jgjvKVXGKymbiLJkzwBdESoGAZ9ytRyndnPgGEqyZTbPxZMP9u64wANd4quvMgCW3scF
	EArzp2sGGH810SdvB/FOBo2xpqXotEzVwVNxV2tVacbo2cEzTStjWBVhzJFbsVUaNHNX
	5Ku2L3/GnhUaEkld9cABtnlEVsBzfl0rTOVMsqE4KVo2QR+qBfbwLdQdBYOa62O9JYlY
	incA==
Received: by 10.180.84.164 with SMTP id a4mr12569996wiz.2.1332365871625;
	Wed, 21 Mar 2012 14:37:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fz9sm7695331wib.3.2012.03.21.14.37.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 14:37:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:36:18 +0100
Message-Id: <1d1113a5e6879788fce16a861072481b89ecdbdd.1332365336.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
References: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332365336.git.Martin.Jansa@gmail.com>
References: <cover.1332365336.git.Martin.Jansa@gmail.com>
Subject: [PATCH 13/13] rootfs_ipk: replace 3 opkg-cl calls with one in get_package_filename
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
X-List-Received-Date: Wed, 21 Mar 2012 21:46:43 -0000

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



