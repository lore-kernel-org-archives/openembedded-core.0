Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 94B466DE01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 03:33:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBG3XCYN009887
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Dec 2013 19:33:12 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Sun, 15 Dec 2013 19:33:12 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 16 Dec 2013 11:32:58 +0800
Message-ID: <a4f16ba0d8df1625bddac43296becabbe3d275a5.1387164126.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1387164126.git.kai.kang@windriver.com>
References: <cover.1387164126.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] LSB_Test.sh: update rpm platform file when enable multilib
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
X-List-Received-Date: Mon, 16 Dec 2013 03:33:14 -0000
Content-Type: text/plain

When enable multilib for x86_64, lsb rpm packages for archs x86_64 and
i486 will be installed. But i486 target packages fail to be installed
that no such pattern in rpm platform file. Update platform file to
enable install i486 rpm packages as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
index af1d61c..db4e749 100644
--- a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
+++ b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
@@ -277,6 +277,15 @@ if ! `grep -F -q "noarch-suse" ${PLATFORM_FILE}`; then
 		echo "i486-noarch" >> ${PLATFORM_FILE}
 		echo "i486-pc" >> ${PLATFORM_FILE}
 		echo "noarch-suse" >> ${PLATFORM_FILE}
+	elif [ ${ARCH} == x86_64 ]; then
+		echo "i486-suse" >> ${PLATFORM_FILE}
+		echo "i486-noarch" >> ${PLATFORM_FILE}
+		echo "i486-pc" >> ${PLATFORM_FILE}
+		echo "i486-.*-linux.*" >> ${PLATFORM_FILE}
+		echo "noarch-suse" >> ${PLATFORM_FILE}
+		echo "${ARCH}-suse" >> ${PLATFORM_FILE}
+		echo "${ARCH}-noarch" >> ${PLATFORM_FILE}
+		echo "${ARCH}-pc" >> ${PLATFORM_FILE}
 	else
 		echo "${ARCH}-suse" >> ${PLATFORM_FILE}
 		echo "${ARCH}-noarch" >> ${PLATFORM_FILE}
-- 
1.8.1.2


