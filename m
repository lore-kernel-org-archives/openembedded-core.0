Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA72579091
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 07:56:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5D7uPq8027583
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 00:56:41 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 13 Jun 2018 00:56:15 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jun 2018 15:58:22 +0800
Message-ID: <6a344c76ba892177605b9002b2f2aa4fc4a7fc92.1528870775.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1528870775.git.Qi.Chen@windriver.com>
References: <cover.1528870775.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] watchdog: make init script start after syslog
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
X-List-Received-Date: Wed, 13 Jun 2018 07:56:49 -0000
Content-Type: text/plain

We need to make sure logs are not lost. As long as there's no
strong and vaild reason, we should make daemons start after syslog.

As a side effect, we could check the logs to see if there are
some potential problem. In OE, the 'parselogs' test case could
do it automatically.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/watchdog/watchdog_5.15.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index bfaed9a..8353ec0 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -32,10 +32,10 @@ EXTRA_OECONF += " --disable-nfs "
 INITSCRIPT_PACKAGES = "${PN} ${PN}-keepalive"
 
 INITSCRIPT_NAME_${PN} = "watchdog.sh"
-INITSCRIPT_PARAMS_${PN} = "start 15 1 2 3 4 5 . stop 85 0 6 ."
+INITSCRIPT_PARAMS_${PN} = "start 25 1 2 3 4 5 . stop 85 0 6 ."
 
 INITSCRIPT_NAME_${PN}-keepalive = "wd_keepalive"
-INITSCRIPT_PARAMS_${PN}-keepalive = "start 15 1 2 3 4 5 . stop 85 0 6 ."
+INITSCRIPT_PARAMS_${PN}-keepalive = "start 25 1 2 3 4 5 . stop 85 0 6 ."
 
 SYSTEMD_PACKAGES = "${PN} ${PN}-keepalive"
 SYSTEMD_SERVICE_${PN} = "watchdog.service"
-- 
1.9.1


