Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RHFu5-0005re-0s
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 16:16:57 +0200
Received: by yxj20 with SMTP id 20so1543129yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 07:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Sqy4avlm1a8d/Sr8+3Oa2XFB64lN+Vc7UPV1VZTjXes=;
	b=K+DRLa+yWLyq6zPEpwoMPsFio7Yh+K+L/eDOXsu9xJMfyZ073w9w3kmsPbUy9RkHvZ
	NjhSps0fJvO30ZCEjraBWBKZkUN6IrQE2Z5QZBHAnOKe55JBZPEKixRc4/rsIf86rykY
	If2gLFIL99X3auSUFZVA40GR553gKz3AV5thI=
Received: by 10.101.136.7 with SMTP id o7mr3314803ann.33.1319206262232;
	Fri, 21 Oct 2011 07:11:02 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id r9sm24713630anh.8.2011.10.21.07.11.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 07:11:01 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2011 14:10:45 +0000
Message-Id: <908ef7747e3391af158b7edb9f2b420b0016a7af.1319206126.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1319206126.git.otavio@ossystems.com.br>
References: <cover.1319206126.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1319206126.git.otavio@ossystems.com.br>
References: <cover.1319206126.git.otavio@ossystems.com.br>
Subject: [PATCH 3/4] base-passwd: move initial criation of group and passwd to preinst
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
X-List-Received-Date: Fri, 21 Oct 2011 14:16:57 -0000

To allow use and manipulation of users and groups at rootfs building
time, the '/etc/passwd' and '/etc/group' needs to be available as soon
as possible.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |   19 ++++++++++++++++++-
 1 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
index 137512d..aa90a6d 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Base system master password/group files."
 DESCRIPTION = "The master copies of the user database files (/etc/passwd and /etc/group).  The update-passwd tool is also provided to keep the system databases synchronized with these master files."
 SECTION = "base"
-PR = "r3"
+PR = "r4"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
@@ -37,6 +37,23 @@ do_install () {
 	install -p -m 644 debian/copyright ${D}${docdir}/${BPN}/
 }
 
+pkg_preinst_${PN} () {
+	set -e
+
+	# Used for rootfs generation. On in-target install this will be run
+        # before the unpack so the files won't be available
+
+	if [ ! -e $D${sysconfdir}/passwd ] && [ -e $D${datadir}/base-passwd/passwd.master ]; then
+		cp $D${datadir}/base-passwd/passwd.master $D${sysconfdir}/passwd
+	fi
+
+	if [ ! -e $D${sysconfdir}/group ] && [ -e $D${datadir}/base-passwd/group.master ]; then
+		cp $D${datadir}/base-passwd/group.master $D${sysconfdir}/group
+	fi
+
+	exit 0
+}
+
 pkg_postinst_${PN} () {
 	set -e
 
-- 
1.7.2.5



