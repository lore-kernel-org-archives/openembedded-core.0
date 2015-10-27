Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 817D87570D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 10:09:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9RA9CU5003282
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 03:09:12 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 27 Oct 2015 03:09:11 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Oct 2015 18:00:18 +0800
Message-ID: <42dd4c126caab3f9cdfa5dd600365787b3491671.1445939838.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1445939838.git.kai.kang@windriver.com>
References: <cover.1445939838.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] openssh: enable X11Forwarding if distro feature x11 is set
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
X-List-Received-Date: Tue, 27 Oct 2015 10:09:12 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When distro feature x11 is set, it is better enable X11Forwarding for
ssh daemon. For contrast, dropbear enable X11 forward by default.

It does NOT need to modify ${WORKDIR}/sshd_config, so drop the modification.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh_7.1p1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.1p1.bb b/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
index 40938cc..d81127c 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.1p1.bb
@@ -88,7 +88,11 @@ do_compile_ptest() {
 do_install_append () {
 	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
 		install -D -m 0644 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
-		sed -i -e 's:#UsePAM no:UsePAM yes:' ${WORKDIR}/sshd_config ${D}${sysconfdir}/ssh/sshd_config
+		sed -i -e 's:#UsePAM no:UsePAM yes:' ${D}${sysconfdir}/ssh/sshd_config
+	fi
+
+	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "x11" ]; then
+		sed -i -e 's:#X11Forwarding no:X11Forwarding yes:' ${D}${sysconfdir}/ssh/sshd_config
 	fi
 
 	install -d ${D}${sysconfdir}/init.d
-- 
2.6.1


