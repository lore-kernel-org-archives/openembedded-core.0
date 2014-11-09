Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EF09D65D58
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Nov 2014 07:01:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA971oiB023258
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Nov 2014 23:01:50 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sat, 8 Nov 2014 23:01:49 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 9 Nov 2014 15:03:41 +0800
Message-ID: <cb7ccb68e82c104d668177b180577673c86fc5df.1415516571.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415516571.git.Qi.Chen@windriver.com>
References: <cover.1415516571.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] procps: install symlink under /etc/sysctl.d in case of systemd
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
X-List-Received-Date: Sun, 09 Nov 2014 07:01:54 -0000
Content-Type: text/plain

Install /etc/sysctl.d/99-sysctl.conf symlink in case of systemd so
that /etc/sysctl.conf is taken into consideration by systemd-sysctl.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/procps/procps_3.2.8.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
index 6211a7c..fcfde19 100644
--- a/meta/recipes-extended/procps/procps_3.2.8.bb
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb
@@ -28,6 +28,10 @@ EXTRA_OEMAKE = 'CFLAGS="${CFLAGS} -I${STAGING_INCDIR}" \
 do_install_append () {
 	install -d ${D}${sysconfdir}
 	install -m 0644 ${WORKDIR}/sysctl.conf ${D}${sysconfdir}/sysctl.conf
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}${sysconfdir}/sysctl.d
+		ln -sf ../sysctl.conf ${D}${sysconfdir}/sysctl.d/99-sysctl.conf
+	fi
 }
 
 CONFFILES_${PN} = "${sysconfdir}/sysctl.conf"
-- 
1.9.1


