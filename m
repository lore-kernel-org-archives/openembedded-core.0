Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 037AD7E553
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 08:08:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5O88fAi007604
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 01:08:42 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Mon, 24 Jun 2019 01:08:41 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2019 16:08:40 +0800
Message-ID: <1561363720-73979-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20190620073529.GB27107@localhost>
References: <20190620073529.GB27107@localhost>
MIME-Version: 1.0
Subject: [PATCH V2] mdadm: fix systemd service start up failure
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
X-List-Received-Date: Mon, 24 Jun 2019 08:08:41 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. mdadm: No mail address or alert command - not monitoring

fixed by use option -y to cause all events to be reported
through 'syslog'.

2. cannot create pid file: No such file or directory

fix by create dir before starting.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-extended/mdadm/files/mdmonitor.service | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/files/mdmonitor.service b/meta/recipes-extended/mdadm/files/mdmonitor.service
index bd243b4..a81578e 100644
--- a/meta/recipes-extended/mdadm/files/mdmonitor.service
+++ b/meta/recipes-extended/mdadm/files/mdmonitor.service
@@ -13,7 +13,8 @@ ConditionPathExists=/etc/mdadm.conf
 Type=forking
 PIDFile=/var/run/mdadm/mdadm.pid
 EnvironmentFile=-/etc/sysconfig/mdmonitor
-ExecStart=/sbin/mdadm --monitor --scan -f --pid-file=/var/run/mdadm/mdadm.pid
+ExecStartPre=mkdir -p /var/run/mdadm
+ExecStart=/sbin/mdadm --monitor -y --scan -f --pid-file=/var/run/mdadm/mdadm.pid
 
 [Install]
 WantedBy=multi-user.target
-- 
2.7.4


