Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RyS1q-0002la-V4
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 18:55:31 +0100
Received: by yenr5 with SMTP id r5so1935134yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2012 09:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=2+gt5cpNqU++pzi5NaEZJj8d2IT7j6I3Ze2MGgd1AOg=;
	b=TkvzSF0M3KThkoiayqW4moN7T4lmNnpiceyGtVvgdvyKnASVx2d7+XchHBU3CjJW3Q
	OrVWECysSt128aYYPqsiwWRrCabGKjpPICF3wYSDnk6C0KtGtDlpBiqsKUEChf7B72ea
	M3wTBkgrjI7/xFTIx1UyWaCzViCn/Xq0DM6YQ=
Received: by 10.236.177.74 with SMTP id c50mr10796425yhm.130.1329500836238;
	Fri, 17 Feb 2012 09:47:16 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id e45sm24123959yhk.2.2012.02.17.09.47.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Feb 2012 09:47:15 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Feb 2012 17:47:04 +0000
Message-Id: <5b0cfff77008235fbfb87833349ed7ff6247d0fa.1329500798.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1329500798.git.otavio@ossystems.com.br>
References: <cover.1329500798.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1329500798.git.otavio@ossystems.com.br>
References: <cover.1329500798.git.otavio@ossystems.com.br>
Subject: [PATCH 2/3] rootfs_ipk.bbclass: fix status file location in rootfs
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
X-List-Received-Date: Fri, 17 Feb 2012 17:55:31 -0000

This fixes runtime requirement checking and read-only-fs checking.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/rootfs_ipk.bbclass |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 5342035..2df8ca4 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -76,7 +76,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 	${ROOTFS_POSTINSTALL_COMMAND}
 	
 	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
-		if grep Status:.install.ok.unpacked ${IMAGE_ROOTFS}${opkglibdir}status; then
+		if grep Status:.install.ok.unpacked ${STATUS}; then
 			echo "Some packages could not be configured offline and rootfs is read-only."
 			exit 1
 		fi
@@ -88,9 +88,8 @@ fakeroot rootfs_ipk_do_rootfs () {
 	${ROOTFS_POSTPROCESS_COMMAND}
 	
 	rm -f ${IMAGE_ROOTFS}${opkglibdir}/lists/*
-
 	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
-		if ! grep Status:.install.ok.unpacked ${IMAGE_ROOTFS}${opkglibdir}status; then
+		if ! grep Status:.install.ok.unpacked ${STATUS}; then
 			# All packages were successfully configured.
 			# update-rc.d, base-passwd are no further use, remove them now
 			opkg-cl ${IPKG_ARGS} --force-depends remove update-rc.d base-passwd || true
-- 
1.7.2.5



