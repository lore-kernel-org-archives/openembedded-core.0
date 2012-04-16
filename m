Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SJun7-0007tQ-G2
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 00:53:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3GMhZdF011929
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 15:43:35 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 16 Apr 2012 15:43:32 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 17:45:08 -0500
Message-ID: <4a7761893ed6941245a4dea326dc9bbc5fef5673.1334616144.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1334616144.git.mark.hatle@windriver.com>
References: <cover.1334616144.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 05/17] openssh: Use update-alternatives
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
X-List-Received-Date: Mon, 16 Apr 2012 22:53:01 -0000
Content-Type: text/plain

Use the MANUAL_ALTERNATIVE_LINKS to ensure the update-alternative
references are properly added to the packages provides.

Also fix the RPROVIDES, as they are package split specific!

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh_5.9p1.bb |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_5.9p1.bb b/meta/recipes-connectivity/openssh/openssh_5.9p1.bb
index 749f89e..6ed1276 100644
--- a/meta/recipes-connectivity/openssh/openssh_5.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_5.9p1.bb
@@ -7,12 +7,13 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=bae9a689be41581503bcf95d8fb42c4e"
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-RPROVIDES = "ssh sshd"
+RPROVIDES_${PN}-ssh = "ssh"
+RPROVIDES_${PN}-sshd = "sshd"
 
 CONFLICTS_${PN} = "dropbear"
 RCONFLICTS_${PN}-sshd = "dropbear"
@@ -29,7 +30,7 @@ PAM_SRC_URI = "file://sshd"
 SRC_URI[md5sum] = "afe17eee7e98d3b8550cc349834a85d0"
 SRC_URI[sha256sum] = "8d3e8b6b6ff04b525a6dfa6fdeb6a99043ccf6c3310cc32eba84c939b07777d5"
 
-inherit useradd update-rc.d
+inherit useradd update-rc.d update-alternatives
 
 USERADD_PACKAGES = "${PN}-sshd"
 USERADD_PARAM_${PN}-sshd = "--system --no-create-home --home-dir /var/run/sshd --shell /bin/false --user-group sshd"
@@ -99,6 +100,8 @@ RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 DEPENDS_${PN}-sshd += "update-rc.d"
 RDEPENDS_${PN}-sshd += "update-rc.d ${PN}-keygen"
 
+MANUAL_ALTERNATIVE_LINKS = "${bindir}/scp ${bindir}/ssh"
+
 pkg_postinst_${PN}-scp () {
 	update-alternatives --install ${bindir}/scp scp scp.${PN} 90
 }
-- 
1.7.3.4



