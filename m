Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F146E6E5D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 20:36:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4LKabgc011734
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 13:36:38 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 21 May 2015 13:36:37 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 May 2015 15:36:35 -0500
Message-ID: <329b9e30b54b6b83f2564ea480807fa390e2fdf1.1432240437.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <cover.1432240437.git.peter.seebach@windriver.com>
References: <cover.1432240437.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rootfs.py: Make set -x not break rootfs creation
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
X-List-Received-Date: Thu, 21 May 2015 20:36:38 -0000
Content-Type: text/plain

The rootfs logfile check errors out if it finds an "exit 1" in
a log. But consider the shell idiom:
	if ! $command; then exit 1; fi
and consider a postinstall script with a "set -x" for debugging
purposes (to get log output in /var/log/postinstall.log.)

Solution: Ignore lines prefixed with a +, because those show shell
code even if a specific fragment won't be executed.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/lib/oe/rootfs.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 6fb749f..5d27d2f 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -401,6 +401,9 @@ class RpmRootfs(Rootfs):
             for line in log.read().split('\n'):
                 if 'log_check' in line:
                     continue
+                # sh -x may emit code which isn't actually executed
+                if line.startswith('+'):
+		    continue
 
                 m = r.search(line)
                 if m:
-- 
2.3.1


