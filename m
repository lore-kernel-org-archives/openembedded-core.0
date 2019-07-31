Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C581E7EB0F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 01:51:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,327,1559491200"; d="scan'208";a="72554067"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2019 09:51:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 4DBB44CDE65E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 09:51:01 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 31 Jul 2019 09:51:03 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jul 2019 09:50:20 +0800
Message-ID: <20190731015020.21434-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 4DBB44CDE65E.AC56F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCHv3] mdadm:fix mdmonitor.service
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
X-List-Received-Date: Wed, 31 Jul 2019 01:51:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-The original file mdmonitor.service is as follows:
...
|[Service]
|Environment=  MDADM_MONITOR_ARGS=--scan
|EnvironmentFile=-/run/sysconfig/mdadm
|ExecStartPre=-/usr/lib/mdadm/mdadm_env.sh
|ExecStart=/sbin/mdadm --monitor -y $MDADM_MONITOR_ARGS
...
-It has a syntax error and it doesn't work properly,
 so add files/0001-Fix-file-mdmonitor.service-syntax-error.patch to fix it.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...-file-mdmonitor.service-syntax-error.patch | 49 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.1.bb      |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Fix-file-mdmonitor.service-syntax-error.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-Fix-file-mdmonitor.service-syntax-error.patch b/meta/recipes-extended/mdadm/files/0001-Fix-file-mdmonitor.service-syntax-error.patch
new file mode 100644
index 0000000000..a36fed6f9f
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Fix-file-mdmonitor.service-syntax-error.patch
@@ -0,0 +1,49 @@
+From a4a37cc9d91d7129910360914b8b2060139c0307 Mon Sep 17 00:00:00 2001
+From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+Date: Tue, 30 Jul 2019 12:44:25 +0800
+Subject: [PATCH] Fix file mdmonitor.service syntax error
+
+-The original file mdmonitor.service is as follows:
+...
+|[Service]
+|Environment=  MDADM_MONITOR_ARGS=--scan
+|EnvironmentFile=-/run/sysconfig/mdadm
+|ExecStartPre=-/usr/lib/mdadm/mdadm_env.sh
+|ExecStart=/sbin/mdadm --monitor -y $MDADM_MONITOR_ARGS
+...
+-It has a syntax error and it doesn't work properly, 
+ so add new file mdmonitor.service to overwrite it.
+
+Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+---
+ systemd/mdmonitor.service | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/systemd/mdmonitor.service b/systemd/mdmonitor.service
+index 3fc4687..bd243b4 100644
+--- a/systemd/mdmonitor.service
++++ b/systemd/mdmonitor.service
+@@ -6,11 +6,14 @@
+ #  (at your option) any later version.
+ 
+ [Unit]
+-Description=MD array monitor
+-DefaultDependencies=no
++Description=Software RAID monitoring and management
++ConditionPathExists=/etc/mdadm.conf
+ 
+ [Service]
+-Environment=  MDADM_MONITOR_ARGS=--scan
+-EnvironmentFile=-/run/sysconfig/mdadm
+-ExecStartPre=-/usr/lib/mdadm/mdadm_env.sh
+-ExecStart=BINDIR/mdadm --monitor -y $MDADM_MONITOR_ARGS
++Type=forking
++PIDFile=/var/run/mdadm/mdadm.pid
++EnvironmentFile=-/etc/sysconfig/mdmonitor
++ExecStart=/sbin/mdadm --monitor --scan -y -f --pid-file=/var/run/mdadm/mdadm.pid
++
++[Install]
++WantedBy=multi-user.target
+-- 
+2.20.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 74c94f6ecb..c3e15adc71 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
 	   file://mdadm.init \
 	   file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
            file://include_sysmacros.patch \
+           file://0001-Fix-file-mdmonitor.service-syntax-error.patch \
            "
 SRC_URI[md5sum] = "51bf3651bd73a06c413a2f964f299598"
 SRC_URI[sha256sum] = "ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1934f4a"
-- 
2.20.1




