Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rh1fC-0002Pd-Qk
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Dec 2011 17:20:06 +0100
Received: by wgbds11 with SMTP id ds11so21494687wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Dec 2011 08:12:49 -0800 (PST)
Received: by 10.227.208.13 with SMTP id ga13mr52883240wbb.4.1325347504149;
	Sat, 31 Dec 2011 08:05:04 -0800 (PST)
Received: from localhost ([84.80.112.235])
	by mx.google.com with ESMTPS id di5sm101784673wib.3.2011.12.31.08.05.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 31 Dec 2011 08:05:03 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Dec 2011 17:04:56 +0100
Message-Id: <1325347496-9980-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] procps: raise update-alternatives priority
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Dec 2011 16:20:06 -0000

This fixes a problem with the uptime utility:

root@beagleboneA3-0088:/var/lib/cloud9# busybox uptime
 16:00:17 up 2 days,  6:46,  load average: 0.14, 0.04, 0.05
root@beagleboneA3-0088:/var/lib/cloud9# uptime.procps
 16:00:22 up 2 days,  6:46,  1 user,  load average: 0.14, 0.05, 0.06
root@beagleboneA3-0088:/var/lib/cloud9# uptime.coreutils
 16:00pm  up 4382 days 15:58,  1 user,  load average: 0.13, 0.05, 0.05
root@beagleboneA3-0088:/var/lib/cloud9# ls /usr/bin/uptime -la
lrwxrwxrwx 1 root root 16 Dec 26 08:56 /usr/bin/uptime -> uptime.coreutils

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/procps/procps_3.2.8.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
index d989955..6a41ccd 100644
--- a/meta/recipes-extended/procps/procps_3.2.8.bb
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb
@@ -1,12 +1,12 @@
 require procps.inc
 
-PR = "r3"
+PR = "r4"
 
 inherit update-alternatives
 
 ALTERNATIVE_LINKS = "${bindir}/top ${bindir}/uptime ${bindir}/free ${bindir}/pkill ${bindir}/pmap \
                      ${base_bindir}/kill ${base_sbindir}/sysctl ${base_bindir}/ps"
-ALTERNATIVE_PRIORITY = "90"
+ALTERNATIVE_PRIORITY = "110"
 
 SRC_URI += "file://procmodule.patch \
             file://psmodule.patch \
-- 
1.7.2.5



