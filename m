Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tdjxy-0004xh-Dx
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 16:54:26 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so7420858eei.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 07:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=0NCgfSdQhAbg5XdaME0t4Nl2lp/HGF6zfgouha+BUyE=;
	b=qA8jDmZYzm7FO5OHLbVEc8/UjNaasoPDe7SATLmdHP/2UUBzlHaMeqnc3wOYcXT5yc
	2/KC5zyawY2tUi8O6PSvLDIrVTmo7AhHMJYY33vPtiG6XFa/RkDivX+Kjw5gHqi3aABo
	B04zcgDieKSzvWip0zT80XQD8gRKOkFBo3/gCUO7AhN9pyI6s9THAhEdw4mXiip0Ogq7
	wbLXA7jLyGeVPwdqknhC/2U46qcQaRPzt1ljk+9NBFrFwtkNNc++IfpUTGIB/QOEYUOA
	qlDSpG5HJF5DXmSdPwsF6xvQXYot5+RSu+Sxih4Xa0vUAwQSxZmS7V1sNwqK86kUM3nJ
	uIgQ==
Received: by 10.14.209.193 with SMTP id s41mr33476880eeo.9.1354117212080;
	Wed, 28 Nov 2012 07:40:12 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm47729998eeg.4.2012.11.28.07.40.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 07:40:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2012 16:40:07 +0100
Message-Id: <1354117207-24728-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1354115058-6847-1-git-send-email-Martin.Jansa@gmail.com>
References: <1354115058-6847-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [RFC][PATCHv2] rootfs_ipk, package_ipk: drop --force-overwrite
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
X-List-Received-Date: Wed, 28 Nov 2012 15:54:26 -0000

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

v2: rebase after --force_postinstall was added in master

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
index 21fe40c..1c7136a 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -15,9 +15,9 @@ do_rootfs[vardepsexclude] += "BUILDNAME"
 
 do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
 
-IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} --force-overwrite --force_postinstall --prefer-arch-to-version"
+IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} --force_postinstall --prefer-arch-to-version"
 # The _POST version also works when constructing the matching SDK
-IPKG_ARGS_POST = "-f ${IPKGCONF_TARGET} -o $INSTALL_ROOTFS_IPK --force-overwrite --force_postinstall --prefer-arch-to-version"
+IPKG_ARGS_POST = "-f ${IPKGCONF_TARGET} -o $INSTALL_ROOTFS_IPK --force_postinstall --prefer-arch-to-version"
 
 OPKG_PREPROCESS_COMMANDS = "package_update_index_ipk; package_generate_ipkg_conf"
 
-- 
1.8.0



