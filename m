Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1D426E4BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 03:33:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBG3XE8H003375
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Dec 2013 19:33:14 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Sun, 15 Dec 2013 19:33:14 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 16 Dec 2013 11:32:59 +0800
Message-ID: <fba44939cc2b38ad5dd6444f36068ca88e0a988a.1387164126.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1387164126.git.kai.kang@windriver.com>
References: <cover.1387164126.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] LSB_Test.sh: check ldconfig before update cache
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
X-List-Received-Date: Mon, 16 Dec 2013 03:33:16 -0000
Content-Type: text/plain

LSB_Test.sh run ldconfig to update library cache. If command ldconfig
doesn't exists, test will fail.

Check whether ldconfig exists. If not, don't update library cache.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
index db4e749..2004157 100644
--- a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
+++ b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
@@ -444,11 +444,13 @@ else
 	echo "Fail to creat Dirnames file"
 fi
 
+[ -x /sbin/ldconfig ] && {
 echo ""
 echo "---------------------------------"
 echo "Update cache"
-ldconfig
+/sbin/ldconfig
 check;
+}
 
 # Check loop device
 if [ ! -b /dev/loop0 ]
-- 
1.8.1.2


