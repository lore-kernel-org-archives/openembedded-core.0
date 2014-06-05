Return-Path: <Shan.Hai@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D78260030
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 02:18:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s552Irxg005022
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jun 2014 19:18:53 -0700 (PDT)
Received: from localhost.localdomain (128.224.153.43) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 4 Jun 2014 19:18:52 -0700
From: Shan Hai <shan.hai@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Jun 2014 10:18:49 +0800
Message-ID: <1401934729-1980-2-git-send-email-shan.hai@windriver.com>
X-Mailer: git-send-email 1.7.0.5
In-Reply-To: <1401934729-1980-1-git-send-email-shan.hai@windriver.com>
References: <1401934729-1980-1-git-send-email-shan.hai@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] oe-core/init-install.sh: do not overwrite /etc/mtab if the link already exist
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
X-List-Received-Date: Thu, 05 Jun 2014 02:18:54 -0000
Content-Type: text/plain

Overwriting of /etc/mtab would fail as below if the /etc/mtab link already
exist during installation phase, this patch fix this problem by checking
existance of the link before try to overwrite it.

Error message during installation if the /etc/mtab exists:
"cat: /proc/mounts: input file is output file

Signed-off-by: Shan Hai <shan.hai@windriver.com>
---
 .../initrdscripts/files/init-install.sh            |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 0ede928..d7d3439 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -90,7 +90,9 @@ if [ ! -b /dev/loop0 ] ; then
 fi
 
 mkdir -p /tmp
-cat /proc/mounts > /etc/mtab
+if [ ! -L /etc/mtab ]; then
+	cat /proc/mounts > /etc/mtab
+fi
 
 disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
 
-- 
1.7.0.5


