Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B2B95749F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 07:09:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6V79l3s007357
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 00:09:47 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 31 Jul 2018 00:09:47 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jul 2018 15:13:41 +0800
Message-ID: <6c036b812497b1243150487a80a3af31fe2cefe6.1533021154.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1533021154.git.Qi.Chen@windriver.com>
References: <cover.1533021154.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] parselogs.py: ignore network interface name changing failure
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
X-List-Received-Date: Tue, 31 Jul 2018 07:09:46 -0000
Content-Type: text/plain

The following error from systemd-udevd is not harmful. It's just
because our qemu targets are using eth0.

  Error changing net interface name 'eth0' to 'enp0s3': Device or resource busy

Note that systemd is using a different network interface naming scheme
from traditional ethX naming scheme. To make this error message go away,
we could symlink /etc/udev/rules.d/80-net-setup-link.rules to /dev/null
to recover traditional naming scheme. But I'm not sure if this will
cause regression in user experience for systemd users of OE.

So just ignore this error message so that parselogs.py test case does not
fail.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index f0bcd16..017b550 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -51,7 +51,8 @@ common_errors = [
     "Cannot set xattr user.Librepo.DownloadInProgress",
     "Failed to read /var/lib/nfs/statd/state: Success",
     "error retry time-out =",
-    "logind: cannot setup systemd-logind helper (-61), using legacy fallback"
+    "logind: cannot setup systemd-logind helper (-61), using legacy fallback",
+    "Error changing net interface name 'eth0' to "
     ]
 
 video_related = [
-- 
1.9.1


