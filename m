Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdjPI-0003XY-T8
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 16:18:41 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so5205782eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 07:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2rlHcHLxxBgZBTgH07hWQkBz0ZsRD1PuwKzPd9FpWOw=;
	b=qy8jyMNt+COAS//3EHmZMh1gtCbwWiBz32y+pUBx3mFt5bG46wR9ZhjVePGFxYsicO
	uOn6OofS4fZB+RwRUQUzIBPryL954RMXYU+iOXx/uZDl+uVk0SrbAnyHY9CHTULsvwIe
	rYPz3Uc8DZnGcd3YEDjf6+KFbys3yeLHCh3Tu6mB+YhO1i4QSqG2tDkcrWAxzLNKD5Z3
	UXgkCwxtBL9yal29nB65QXXby5bmeq3+fMzQ7p7xPhGq62lN4rIZQkwzhaVuG+ykZ3iy
	tuo5vCa5/rTLd3P+fmkZRIjCR4a3LOFZdUx+cP66irYuw5v2XJdA147GEKwy4Q6wtmT7
	WJKQ==
Received: by 10.14.209.6 with SMTP id r6mr70595132eeo.34.1354115062631;
	Wed, 28 Nov 2012 07:04:22 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w3sm26735961eel.17.2012.11.28.07.04.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 07:04:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2012 16:04:18 +0100
Message-Id: <1354115058-6847-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [RFC][PATCH] rootfs_ipk, package_ipk: drop --force-overwrite
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
X-List-Received-Date: Wed, 28 Nov 2012 15:18:41 -0000

* it was introduced in 2010 by 8c3a7ebac8bed700bcc37f778d5a883cfeee8de8
  but doesn't seem needed anymore
* also such do_rootfs failure is good indication that runtime packages
  installed are not sane, ignoring this error in do_rootfs just
  transfers the issue to end user when he does "opkg upgrade" later
  on device
* tested on SHR images with whole feed included and only issue was
  gstreamer/gst-plugins-* locale packages (and there is patch for this
  on oe-core ML)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package_ipk.bbclass | 2 +-
 meta/classes/rootfs_ipk.bbclass  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 4bf1b10..f916cf5 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -139,7 +139,7 @@ package_install_internal_ipk() {
 
 	mkdir -p ${target_rootfs}${localstatedir}/lib/opkg/
 
-	local ipkg_args="-f ${conffile} -o ${target_rootfs} --force-overwrite --force_postinstall --prefer-arch-to-version"
+	local ipkg_args="-f ${conffile} -o ${target_rootfs} --force_postinstall --prefer-arch-to-version"
 
 	opkg-cl ${ipkg_args} update
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 8b04bcd..9cdf96e 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -15,9 +15,9 @@ do_rootfs[vardepsexclude] += "BUILDNAME"
 
 do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
 
-IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} --force-overwrite --prefer-arch-to-version"
+IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} --prefer-arch-to-version"
 # The _POST version also works when constructing the matching SDK
-IPKG_ARGS_POST = "-f ${IPKGCONF_TARGET} -o $INSTALL_ROOTFS_IPK --force-overwrite --prefer-arch-to-version"
+IPKG_ARGS_POST = "-f ${IPKGCONF_TARGET} -o $INSTALL_ROOTFS_IPK --prefer-arch-to-version"
 
 OPKG_PREPROCESS_COMMANDS = "package_update_index_ipk; package_generate_ipkg_conf"
 
-- 
1.8.0



