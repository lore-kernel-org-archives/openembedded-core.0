Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 865E26FE55
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 10:24:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7LAOFws026787
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 03:24:15 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 21 Aug 2014 03:24:14 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Aug 2014 18:24:42 +0800
Message-ID: <7211f8ccf6146628f0731d19cf9c4b6f01cb771f.1408616635.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408616635.git.Qi.Chen@windriver.com>
References: <cover.1408616635.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] sudo: remove volatile configuration file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Aug 2014 10:24:20 -0000
Content-Type: text/plain

The new version of sudo has fixed the problem and will create the
directory if it doesn't exist. So the configuration file is no longer
needed.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sudo/files/volatiles.99_sudo |    1 -
 meta/recipes-extended/sudo/sudo_1.8.10p3.bb        |    7 ++-----
 2 files changed, 2 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/sudo/files/volatiles.99_sudo

diff --git a/meta/recipes-extended/sudo/files/volatiles.99_sudo b/meta/recipes-extended/sudo/files/volatiles.99_sudo
deleted file mode 100644
index ecb576e..0000000
--- a/meta/recipes-extended/sudo/files/volatiles.99_sudo
+++ /dev/null
@@ -1 +0,0 @@
-d root root 0755 /var/run/sudo none
diff --git a/meta/recipes-extended/sudo/sudo_1.8.10p3.bb b/meta/recipes-extended/sudo/sudo_1.8.10p3.bb
index 46d4781..4c53032 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.10p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.10p3.bb
@@ -2,7 +2,7 @@ require sudo.inc
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-           file://volatiles.99_sudo"
+          "
 
 PAM_SRC_URI = "file://sudo.pam"
 
@@ -22,9 +22,6 @@ do_install_append () {
 	chmod 4111 ${D}${bindir}/sudo
 	chmod 0440 ${D}${sysconfdir}/sudoers
 
-	# Explicitly remove the ${localstatedir}/run directory as we can
-	# manage it by a configuration file under ${sysconfdir}/default/volatiles/
+	# Explicitly remove the ${localstatedir}/run directory to avoid QA error
 	rmdir -p --ignore-fail-on-non-empty ${D}${localstatedir}/run/sudo
-	install -d ${D}/${sysconfdir}/default/volatiles
-	install -m 644 ${WORKDIR}/volatiles.99_sudo ${D}/${sysconfdir}/default/volatiles/99_sudo
 }
-- 
1.7.9.5


