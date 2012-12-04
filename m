Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw57-0008KB-81
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:15:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H0Th9008467
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:29 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:29 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:50 -0600
Message-ID: <80b64152c386ce75c3d97b9954017d7439f9d9c6.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 18/22] shadow: add runtime dependency on base-passwd
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
X-List-Received-Date: Tue, 04 Dec 2012 17:15:12 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

This fixes an issue where the shadow package was sometimes getting
installed before base-passwd during rootfs construction with Smart,
which meant the postinstall scripts could not find /etc/passwd and
/etc/group and failed as a result.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index eb00bf0..91410d8 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -8,8 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
                     file://src/passwd.c;firstline=8;endline=30;md5=2899a045e90511d0e043b85a7db7e2fe"
 
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-RDEPENDS_${PN} = "shadow-securetty ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
-PR = "r12"
+RDEPENDS_${PN} = "shadow-securetty ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)} \
+                  base-passwd"
+PR = "r13"
 
 SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://login_defs_pam.sed \
-- 
1.7.3.4



