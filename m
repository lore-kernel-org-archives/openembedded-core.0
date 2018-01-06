Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 30A8A7883C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jan 2018 10:05:35 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w06A5YDK027243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 6 Jan 2018 10:05:35 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eXlM6-0002Ma-I7; Sat, 06 Jan 2018 10:05:34 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Jan 2018 10:05:33 +0000
Message-Id: <1515233133-9046-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] local.conf.sample: Weakly set BB_DISKMON_DIRS
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
X-List-Received-Date: Sat, 06 Jan 2018 10:05:36 -0000

For various reasons we need to be able to set and override this from
auto.conf on our test infrastructure. We have tried forcing the variable
but this then breaks other selftests. In the interests of not complicating
things further and needing to modify the tests across releases, weaken
the default assignment.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/local.conf.sample | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index b754853..742f249 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -168,7 +168,7 @@ PATCHRESOLVE = "noop"
 # files and damages the build in ways which may not be easily recoverable.
 # It's necesary to monitor /tmp, if there is no space left the build will fail
 # with very exotic errors.
-BB_DISKMON_DIRS = "\
+BB_DISKMON_DIRS ??= "\
     STOPTASKS,${TMPDIR},1G,100K \
     STOPTASKS,${DL_DIR},1G,100K \
     STOPTASKS,${SSTATE_DIR},1G,100K \
-- 
2.7.4


