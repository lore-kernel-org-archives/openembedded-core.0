Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 932F66E778
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 10:39:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0HAdRNC014755
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 02:39:28 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 17 Jan 2014 02:39:28 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jan 2014 18:39:25 +0800
Message-ID: <4764905b11d75125b6a164942e2f5234578b9158.1389955027.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1389955027.git.Qi.Chen@windriver.com>
References: <cover.1389955027.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 5/5] at: add systemd support
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
X-List-Received-Date: Fri, 17 Jan 2014 10:39:27 -0000
Content-Type: text/plain

Add systemd support for at.

This patch mainly comes from meta-systemd.

[YOCTO #4420]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/at/at_3.1.14.bb      |   10 +++++++++-
 meta/recipes-extended/at/files/atd.service |    9 +++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/at/files/atd.service

diff --git a/meta/recipes-extended/at/at_3.1.14.bb b/meta/recipes-extended/at/at_3.1.14.bb
index 0a13157..480e732 100644
--- a/meta/recipes-extended/at/at_3.1.14.bb
+++ b/meta/recipes-extended/at/at_3.1.14.bb
@@ -22,6 +22,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
     file://posixtm.h \
     file://file_replacement_with_gplv2.patch \
     file://S99at \
+    file://atd.service \
     ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://pam.conf.patch \
@@ -37,7 +38,9 @@ EXTRA_OECONF += "ac_cv_path_SENDMAIL=/bin/true \
                  --with-atspool=/var/spool/at/spool \
                  ac_cv_header_security_pam_appl_h=${@base_contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)} "
 
-inherit autotools
+inherit autotools systemd
+
+SYSTEMD_SERVICE_${PN} = "atd.service"
 
 PARALLEL_MAKE = ""
 
@@ -53,6 +56,11 @@ do_install () {
 	install -m 0755    ${WORKDIR}/S99at		${D}${sysconfdir}/init.d/atd
 	ln -sf ../init.d/atd ${D}${sysconfdir}/rcS.d/S99at
 
+	# install systemd unit files
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/atd.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/atd.service
+
 	if [ "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
 		install -D -m 0644 ${WORKDIR}/${BP}/pam.conf ${D}${sysconfdir}/pam.d/atd
 	fi
diff --git a/meta/recipes-extended/at/files/atd.service b/meta/recipes-extended/at/files/atd.service
new file mode 100644
index 0000000..6dc8445
--- /dev/null
+++ b/meta/recipes-extended/at/files/atd.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Job spooling tools
+After=syslog.target
+
+[Service]
+ExecStart=@SBINDIR@/atd -f
+
+[Install]
+WantedBy=multi-user.target
-- 
1.7.9.5


