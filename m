Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 550A178672
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 13:10:49 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vALDAmF0017574
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 21 Nov 2017 13:10:49 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eH8K8-0004TY-Gk; Tue, 21 Nov 2017 13:10:48 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Nov 2017 13:10:42 +0000
Message-Id: <1511269847-17161-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/6] runqemu: Ensure we process all tap devices
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
X-List-Received-Date: Tue, 21 Nov 2017 13:10:50 -0000

The regexp in the script misses some tap devices, e.g. we see output like:

runqemu - INFO - Acquiring lockfile /tmp/qemu-tap-locks/tap25.lock failed: [Errno 11] Resource temporarily unavailable
runqemu - INFO - Acquiring lockfile /tmp/qemu-tap-locks/tap26.lock failed: [Errno 11] Resource temporarily unavailable
runqemu - INFO - Acquiring lockfile /tmp/qemu-tap-locks/tap27.lock failed: [Errno 11] Resource temporarily unavailable
runqemu - INFO - Acquiring lockfile /tmp/qemu-tap-locks/tap28.lock failed: [Errno 11] Resource temporarily unavailable
runqemu - INFO - Acquiring lockfile /tmp/qemu-tap-locks/tap40.lock failed: [Errno 11] Resource temporarily unavailable
runqemu - INFO - Acquiring lockfile /tmp/qemu-tap-locks/tap41.lock failed: [Errno 11] Resource temporarily unavailable

What happened to tap29 to tap39?

The issue is was we were missing devices with '0' in the number,
like "10:" and so on in the output from "ip link".

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index fe4459d..ad88da3 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -923,7 +923,7 @@ class BaseConfig(object):
         logger.debug('Running %s...' % cmd)
         ip_link = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
         # Matches line like: 6: tap0: <foo>
-        possibles = re.findall('^[1-9]+: +(tap[0-9]+): <.*', ip_link, re.M)
+        possibles = re.findall('^[0-9]+: +(tap[0-9]+): <.*', ip_link, re.M)
         tap = ""
         for p in possibles:
             lockfile = os.path.join(lockdir, p)
-- 
2.7.4


