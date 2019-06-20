Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A26637E7C4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 03:14:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5K3E50r016401
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 20:14:05 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Wed, 19 Jun 2019 20:14:04 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jun 2019 11:14:03 +0800
Message-ID: <1561000443-320248-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] mdadm: fix systemd service start up failure
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
X-List-Received-Date: Thu, 20 Jun 2019 03:14:04 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. mdadm: No mail address or alert command - not monitoring

with --monitor mode, mdadm needs a mail address and/or a program.
This can be given with "mailaddr" and "program" lines to that
monitoring can be started using.

fix by given a mail address, user can replace with a valid one
when use.

2. cannot create pid file: No such file or directory

fix by create dir before starting.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-extended/mdadm/files/mdmonitor.service | 1 +
 meta/recipes-extended/mdadm/mdadm_4.1.bb            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-extended/mdadm/files/mdmonitor.service b/meta/recipes-extended/mdadm/files/mdmonitor.service
index bd243b4..a1b693f 100644
--- a/meta/recipes-extended/mdadm/files/mdmonitor.service
+++ b/meta/recipes-extended/mdadm/files/mdmonitor.service
@@ -13,6 +13,7 @@ ConditionPathExists=/etc/mdadm.conf
 Type=forking
 PIDFile=/var/run/mdadm/mdadm.pid
 EnvironmentFile=-/etc/sysconfig/mdmonitor
+ExecStartPre=mkdir -p /var/run/mdadm
 ExecStart=/sbin/mdadm --monitor --scan -f --pid-file=/var/run/mdadm/mdadm.pid
 
 [Install]
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 494b81b..aa1fdb3 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -57,6 +57,7 @@ do_install() {
 do_install_append() {
         install -d ${D}/${sysconfdir}/
         install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
+        sed -i -e 's/#MAILADDR root@mydomain.tld/MAILADDR root@mydomain.tld/g' ${D}${sysconfdir}/mdadm.conf
         install -d ${D}/${sysconfdir}/init.d
         install -m 755 ${WORKDIR}/mdadm.init ${D}${sysconfdir}/init.d/mdmonitor
 }
-- 
2.7.4


