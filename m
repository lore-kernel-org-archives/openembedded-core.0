Return-Path: <Florin.Sarbu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E17D7610F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 12:10:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAFCActJ011853
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 04:10:39 -0800 (PST)
Received: from otp-fsarbu-l1.corp.ad.wrs.com (128.224.171.138) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Fri, 15 Nov 2013 04:10:37 -0800
From: Florin Sarbu <florin.sarbu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Nov 2013 14:10:11 +0200
Message-ID: <1384517411-27854-1-git-send-email-florin.sarbu@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [128.224.171.138]
Subject: [PATCH] systemd: Fix packaging of pam config files.
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
X-List-Received-Date: Fri, 15 Nov 2013 12:10:36 -0000
Content-Type: text/plain

Removed early FILES_${PN} += for the pam config
files which would subesequently be overwritten by
a FILES_${PN} = .

Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
---
 meta/recipes-core/systemd/systemd_208.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
index 8c70fe5..66e6bee 100644
--- a/meta/recipes-core/systemd/systemd_208.bb
+++ b/meta/recipes-core/systemd/systemd_208.bb
@@ -160,8 +160,6 @@ FILES_${PN}-kernel-install = "${bindir}/kernel-install \
 FILES_${PN}-rpm-macros = "${exec_prefix}/lib/rpm \
                          "
 
-FILES_${PN}  += "${@base_contains('DISTRO_FEATURES', 'pam', '${sysconfdir}/pam.d', '', d)}"
-
 FILES_${PN}-zsh = "${datadir}/zsh/site-functions"
 
 FILES_${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
@@ -213,6 +211,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 /lib/udev/rules.d/71-seat.rules \
                 /lib/udev/rules.d/73-seat-late.rules \
                 /lib/udev/rules.d/99-systemd.rules \
+                ${@base_contains('DISTRO_FEATURES', 'pam', '${sysconfdir}/pam.d', '', d)} \
                "
 
 FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
-- 
1.8.3.2


