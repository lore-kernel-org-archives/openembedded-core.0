Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B008165CEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 11:36:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9KBaWaG016808
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Oct 2014 04:36:32 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 20 Oct 2014 04:36:31 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 20 Oct 2014 19:36:28 +0800
Message-ID: <c878908459697530771e2180430ac5b6b9c1ac61.1413804737.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1413804737.git.hongxu.jia@windriver.com>
References: <cover.1413804737.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] default-versions.inc: match version of db and db-native while "AGPL-3.0" in ${INCOMPATIBLE_LICENSE}
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
X-List-Received-Date: Mon, 20 Oct 2014 11:36:35 -0000
Content-Type: text/plain

The db 6.0.30's LICENSE is 'AGPL-3.0', and db 5.3.28 LICENSE is
'Sleepycat'

While building rpm image with "AGPL-3.0" in ${INCOMPATIBLE_LICENSE},
db 6.0.30 and db-native 5.3.28 were built, the different versions
caused the rpm doesn't work on target.

...
root@qemux86-64:~# rpm -qa
|rpmdb: BDB2531 Unacceptable log file /var/lib/rpm/./log/log.0000000001:
unsupported log version 21
|rpmdb: BDB2527 Invalid log file: log.0000000001: Invalid argument
|rpmdb: BDB0061 PANIC: Invalid argument
|==> rpmdbe_event_notify(0x623f40, PANIC(0), 0x7fffee0fbc0c) app_private
(nil)
|rpmdb: BDB1546 unable to join the environment
|error: db_init:tmp/work/core2-64-poky-linux/rpm/5.4.14-r0/rpm-5.4.14/
rpmdb/db3.c:1144: dbenv->open(-30973): BDB0087 DB_RUNRECOVERY: Fatal
error, run database recovery
...

[YOCTO #6858]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/distro/include/default-versions.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index 53ec2e7..20e258b 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -9,3 +9,7 @@ PREFERRED_VERSION_python-native ?= "2.7.3"
 
 # Force the older version of liberation-fonts until we fix the fontforge issue
 PREFERRED_VERSION_liberation-fonts ?= "1.04"
+
+# Force db-native's version to keep sync with db while
+# 'AGPL-3.0' in ${INCOMPATIBLE_LICENSE} blacklist
+PREFERRED_VERSION_db-native = "${@base_contains('INCOMPATIBLE_LICENSE', 'AGPL-3.0', '5.%', '6.%', d)}"
-- 
1.9.1


