Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Srse9-0001Jp-KI
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 17:28:09 +0200
Received: by ghbz2 with SMTP id z2so2662302ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 08:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=gXAwpXzLxvxGRvy1qca9Z02Ck+m+CsmRNN2/tJx+wHw=;
	b=OP+AKOvDyBxb5sGx5xBrUbMTOJ8NkrwwLO0cDTBqzzkOHzDVKPQMjzoBi+sfSysO9d
	CaKwYbBLceiXDztR0TagZeW+0jSr9/yCZSxp8Di3O8R2ju3rlJnHHwBGWsmaxI1GwD0J
	SGZBsAKNZuBOcotGYDhAzPBk2+9HcnEFjbffaVEyXxa+rlBTm5cLMLn1mbGVFtuQJKPA
	UgosuHO/h1XDA1zYZUdHuv9e2sFmTe5xkxsUrTNtUNU/LovucWPEiOZZG6NsxjciRIKK
	u8pX4AjIbsxpik7IznVY0ehaspg3tb7Q4tIyYKZSCakjzPkrfSwcsYHFVI7st2PZN4EN
	6ITA==
Received: by 10.236.200.167 with SMTP id z27mr1779052yhn.131.1342711007260;
	Thu, 19 Jul 2012 08:16:47 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id x4sm4126570yhh.2.2012.07.19.08.16.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 08:16:45 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 12:16:38 -0300
Message-Id: <1342710998-15446-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] bash: fix warning about bashbug reference /usr/bin when installed in /bin
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
X-List-Received-Date: Thu, 19 Jul 2012 15:28:09 -0000

We change the installation process so we have bashbug in ${bindir} and
bash at ${base_bindir}; we also build tested it many times in a 8 CPU
machine and had no problem building it in parallel so we dropped
PARALLEL_MAKE override.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-extended/bash/bash.inc    |   13 ++++++++-----
 meta/recipes-extended/bash/bash_4.2.bb |    2 +-
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index ff9b0ce..a7f5f8f 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -9,11 +9,6 @@ DEPENDS = "ncurses bison-native"
 
 inherit autotools gettext update-alternatives
 
-PARALLEL_MAKE = ""
-
-bindir = "/bin"
-sbindir = "/sbin"
-
 EXTRA_OECONF = "--enable-job-control"
 export CC_FOR_BUILD = "${BUILD_CC}"
 
@@ -30,6 +25,14 @@ do_configure_prepend () {
 	fi
 }
 
+do_install_append () {
+	# Move /usr/bin/bash to /bin/bash, if need
+	if [ "${base_bindir}" != "${bindir}" ]; then
+		mkdir -p ${D}${base_bindir}
+		mv ${D}${bindir}/bash ${D}${base_bindir}
+	fi
+}
+
 pkg_postinst_${PN} () {
 	touch $D${sysconfdir}/shells
 	grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >> $D${sysconfdir}/shells
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index e96709a..a28279e 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -1,6 +1,6 @@
 require bash.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=yes;striplevel=0;name=patch001 \
-- 
1.7.2.5



