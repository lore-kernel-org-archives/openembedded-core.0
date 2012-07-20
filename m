Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SsGvY-0004Dm-8e
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 19:23:44 +0200
Received: by yenl13 with SMTP id l13so3917902yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 10:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=l4d7PiGSpcUqAXBR7jrxi3RN2yQJCwzJ1q+jeJtwTnU=;
	b=E0+98Bf2GWTTcLJuTlf2zcvp4jwYfR3XDSK1yqwmCooJ/yGcXDMRxfBnmp53o1QSdx
	yDDCwKkGYZfMU/p9MSNn2cEk4ZH3MeEl0zE2CDWTlx++es1kZH6IW9xqFPd+7gofko8t
	OJaqpLrPaDQSZ06eq99pnUNz5nRdcgTAXDV922+UWwx1zzkJ9VzZr2Ko+qJnZXLazXNV
	x9HQlixP3cnbG4LF3HxN0gm3eLh3eLrtUmZD0SdDFBfafOy3yJV2PLc8XRIT8AZpV960
	hzEBQISUecnGp1UvVo81FWgu3uG8Tz1VlvBOJbNs5PsUYQALHaz4c7eLNYp0C9pimRr5
	N2Yg==
Received: by 10.101.142.31 with SMTP id u31mr1901566ann.85.1342804340539;
	Fri, 20 Jul 2012 10:12:20 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id u23sm10411397yhl.21.2012.07.20.10.12.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 10:12:19 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2012 14:12:09 -0300
Message-Id: <1342804329-5791-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1342804329-5791-1-git-send-email-otavio@ossystems.com.br>
References: <1342804329-5791-1-git-send-email-otavio@ossystems.com.br>
Subject: [PATCH 2/2] bash: fix warning about bashbug reference /usr/bin when installed in /bin
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
X-List-Received-Date: Fri, 20 Jul 2012 17:23:44 -0000

Change the installation process so we have bashbug in ${bindir} and
bash at ${base_bindir}.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-extended/bash/bash.inc    |   11 ++++++++---
 meta/recipes-extended/bash/bash_4.2.bb |    2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 6d7e930..a7f5f8f 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -9,9 +9,6 @@ DEPENDS = "ncurses bison-native"
 
 inherit autotools gettext update-alternatives
 
-bindir = "/bin"
-sbindir = "/sbin"
-
 EXTRA_OECONF = "--enable-job-control"
 export CC_FOR_BUILD = "${BUILD_CC}"
 
@@ -28,6 +25,14 @@ do_configure_prepend () {
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
index a28279e..50f2ff6 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -1,6 +1,6 @@
 require bash.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=yes;striplevel=0;name=patch001 \
-- 
1.7.2.5



