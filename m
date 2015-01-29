Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 465C160132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 05:44:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0T5iJdo015265
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 21:44:19 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 28 Jan 2015 21:44:19 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Jan 2015 13:44:18 +0800
Message-ID: <df11b197377156cf9c8119e94a95fe8691251f89.1422510161.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1422510161.git.Qi.Chen@windriver.com>
References: <cover.1422510161.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] runqemu-internal: get rid of annoying but harmless error message
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
X-List-Received-Date: Thu, 29 Jan 2015 05:44:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

If tap0 interface has been created by other users on the system, we would
get error messages when using runqemu. Error messages are like below.
     Acquiring lockfile for tap0...
     touch: cannot touch ‘/tmp/qemu-tap-locks/tap0.lock’: Permission denied
     /buildarea2/chenqi/poky/scripts/runqemu-internal: line 139: /tmp/qemu-tap-locks/tap0.lock: Permission denied
     flock: 8: Bad file descriptor

The system can still boot up because runqemu would try to create a new tap
interface. So the error message above is harmless, yet somewhat annoying.

This patch fixes the above problem. With this patch, the output would be as
follows.

Acquiring lockfile for tap0...
Acquiring lockfile for /tmp/qemu-tap-locks/tap0.lock failed
Setting up tap interface under sudo
Acquiring lockfile for tap1...
Running qemu-system-arm...

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu-internal | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 5711bd3..a0a1e96 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -138,7 +138,11 @@ else
                 return 1
             fi
 
-            touch $lockfile.lock
+            touch $lockfile.lock 2>/dev/null
+            if [ $? -ne 0 ]; then
+                echo "Acquiring lockfile for $lockfile.lock failed"
+                return 1
+            fi
             exec 8>$lockfile.lock
             flock -n -x 8
             if [ $? -ne 0 ]; then
-- 
1.9.1


