Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3B166FF9F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 12:11:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u28CBxuM023427
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Mar 2016 04:11:59 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 8 Mar 2016 04:11:58 -0800
From: Dengke Du <dengke.du@windriver.com>
To: 
CC: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Mar 2016 07:11:55 -0500
Message-ID: <f20640eec6e027b1e3b905a3357c934a4fe93d98.1457438802.git.dengke.du@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1457438802.git.dengke.du@windriver.com>
References: <cover.1457438802.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] quilt: fix ptest faildiff.test failed
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
X-List-Received-Date: Tue, 08 Mar 2016 12:11:59 -0000
Content-Type: text/plain

When run the quilt ptest on the target, the faildiff.test failed,
because the user is root. The faildiff.test had the following:
	$ chmod -r test.txt
	$ quilt refresh
when we drop the read permission of the file test.txt, we can't
"quilt refresh" as normal user, so we got the following:
	>~ .*diff: test\.txt: Permission denied
	> Diff failed on file 'test.txt', aborting
But when the user is root, we can access the file, so we get the
following:
	> Nothing in patch patches/test.diff
So I change the file "meta/recipes-devtools/quilt/quilt/run-ptest",
when it meet the faildiff.test it skipped. I will report this bug to
quilt upstream.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-devtools/quilt/quilt/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/quilt/quilt/run-ptest b/meta/recipes-devtools/quilt/quilt/run-ptest
index 958a9df..d5ae8f4 100755
--- a/meta/recipes-devtools/quilt/quilt/run-ptest
+++ b/meta/recipes-devtools/quilt/quilt/run-ptest
@@ -1,5 +1,5 @@
 #!/bin/sh
 
 ln -sf /bin/ed /usr/bin/ed
-for i in `ls test/*.test |awk -F. '{print $1}' |awk -F/ '{print $2}'`; do make check-$i; if [ $? -eq 0 ]; then echo PASS: $i.test; else echo FAIL: $i.test; fi; done
+for i in `ls test/*.test |awk -F. '{print $1}' |awk -F/ '{print $2}'`; do if [ "$i" == "faildiff" ]; then echo SKIPPED: $i.test; else make check-$i; if [ $? -eq 0 ]; then echo PASS: $i.test; else echo FAIL: $i.test; fi; fi; done
 rm -f /usr/bin/ed
-- 
1.9.1


