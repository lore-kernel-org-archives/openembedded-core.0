Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 13E6D6BFC6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 11:40:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r82BeVRE005937
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Sep 2013 04:40:31 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 2 Sep 2013 04:40:30 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Sep 2013 19:40:55 +0800
Message-ID: <35139b57aba1b70ba9780e19765c1ef54cd4bab7.1378121740.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378121740.git.Qi.Chen@windriver.com>
References: <cover.1378121740.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] sysklogd: lower the ALTERNATIVE_PRIORITY in case of systemd
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
X-List-Received-Date: Mon, 02 Sep 2013 11:40:30 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The sysklogd package hasn't got systemd support yet. So in case of
a systemd based system, the commands and corresponding configuration
files should have a lower priority than that of the busybox's syslogd
and klogd utilities. These two utilities from busybox have internal
systemd support if CONFIG_FEATURE_SYSTEMD is enabled. And that config
item is enabled by default.

[YOCTO #5066]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sysklogd/sysklogd.inc |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 1167328..30dac2d 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -38,7 +38,14 @@ do_install () {
 	install -m 755 ${WORKDIR}/sysklogd ${D}${sysconfdir}/init.d/syslog
 }
 
-ALTERNATIVE_PRIORITY = "100"
+python () {
+    # sysklogd package has no internal systemd support, so we weigh busybox's
+    # sysklogd utility over it in case of systemd
+    if 'systemd' in d.getVar("DISTRO_FEATURES", True).split():
+        d.setVar("ALTERNATIVE_PRIORITY", "10")
+    else:
+        d.setVar("ALTERNATIVE_PRIORITY", "100")
+}
 
 ALTERNATIVE_${PN} = "syslogd klogd syslog-init syslog-conf"
 
-- 
1.7.9.5


