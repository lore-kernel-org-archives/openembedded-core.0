Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 097BA6060B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 02:12:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r832C0k7018138
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Sep 2013 19:12:01 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 2 Sep 2013 19:12:00 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Sep 2013 10:12:26 +0800
Message-ID: <cf1e3a4f96df954ed8b4f8909e8bc07f29d48f54.1378174301.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378174301.git.Qi.Chen@windriver.com>
References: <cover.1378174301.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Tue, 03 Sep 2013 02:12:00 -0000
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
 meta/recipes-extended/sysklogd/sysklogd.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 1167328..3a51810 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -38,7 +38,9 @@ do_install () {
 	install -m 755 ${WORKDIR}/sysklogd ${D}${sysconfdir}/init.d/syslog
 }
 
-ALTERNATIVE_PRIORITY = "100"
+# sysklogd package has no internal systemd support, so we weigh busybox's
+# sysklogd utility over it in case of systemd
+ALTERNATIVE_PRIORITY = "${@base_contains('DISTRO_FEATURES','systemd','10','100',d)}"
 
 ALTERNATIVE_${PN} = "syslogd klogd syslog-init syslog-conf"
 
-- 
1.7.9.5


