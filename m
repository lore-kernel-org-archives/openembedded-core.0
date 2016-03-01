Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 61CEE760AA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 09:37:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u219baM2001585
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Mar 2016 01:37:36 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 1 Mar 2016 01:37:35 -0800
From: Dengke Du <dengke.du@windriver.com>
To: 
CC: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Mar 2016 04:37:32 -0500
Message-ID: <00c1152b43055381d462cd6d1bc0bb3de5a96246.1456824801.git.dengke.du@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456824801.git.dengke.du@windriver.com>
References: <cover.1456824801.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pTest-tcl fail fixed
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
X-List-Received-Date: Tue, 01 Mar 2016 09:37:35 -0000
Content-Type: text/plain

http.test httpold.test socket.test failed when run the pTest-tcl,because
the tcl script "info hostname" in /usr/lib/tcl/ptest/tests/http.test on
target fail. When run the "info hostname" get the hostname,but it can find
the IP in the /etc/hosts, so it failed. We need to add the IP and hostname
pair in the /etc/hosts. In order to add the IP and hostname pair in the
/etc/hosts, we need to add the pair when the target start, so I add the
"echo "127.0.0.1 `cat /etc/hostname`" >> /etc/hosts" to the hostname.sh in
"meta/recipes-core/initscripts/initscripts-1.0/", when the system invoke
the hostname.sh in "/etc/init.d/", it add the IP and hostname pair in the
/etc/hosts.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/hostname.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh b/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh
index 95287cc..8866d87 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/hostname.sh
@@ -13,7 +13,7 @@ hostname -b -F /etc/hostname 2> /dev/null
 if [ $? -eq 0 ]; then
 	exit
 fi
-
+echo "127.0.0.1 `cat /etc/hostname`" >> /etc/hosts
 # Busybox hostname doesn't support -b so we need implement it on our own
 if [ -f /etc/hostname ];then
 	hostname `cat /etc/hostname`
-- 
1.9.1


