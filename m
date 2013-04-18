Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1USqBI-0005G7-Tt
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 16:51:31 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3IEYJA1009827; Thu, 18 Apr 2013 15:34:22 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ttlEMqvAa_od; Thu, 18 Apr 2013 15:34:22 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3IEYE4n009804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 18 Apr 2013 15:34:16 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1USpu3-0001Dx-0B; Thu, 18 Apr 2013 15:33:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2013 15:33:31 +0100
Message-Id: <1366295611-4646-6-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1366295611-4646-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1366295611-4646-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/6] perf: Ensure license is handled correctly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Apr 2013 14:52:05 -0000
X-List-Received-Date: Thu, 18 Apr 2013 14:52:05 -0000

The do_populate_lic task has a race with the recipe since it relies on the
kernel being populated in the sysroot. This patch adds in the explicit missing
dependency.

[YOCTO #3534]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/perf/perf.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 210c4cb..844e880 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -41,6 +41,8 @@ export STAGING_LIBDIR
 export BUILD_SYS
 export HOST_SYS
 
+do_populate_lic[depends] += "virtual/kernel:do_populate_sysroot"
+
 # needed for building the tools/perf Perl binding
 inherit perlnative cpan-base
 # Env var which tells perl if it should use host (no) or target (yes) settings
-- 
1.7.10.4



