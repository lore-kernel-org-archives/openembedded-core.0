Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SS2KF-0005M8-2J
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 10:32:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q498MsJh016920
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 01:22:54 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 9 May 2012 01:22:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 May 2012 16:20:56 +0800
Message-ID: <03d9cdca29477f34348a0f97138504441c5804fa.1336547713.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1336547713.git.liezhi.yang@windriver.com>
References: <cover.1336547713.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/2] rootfs_rpm.bbclass: don't remove rpmlib when INC_RPM_IMAGE_GEN=1
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
X-List-Received-Date: Wed, 09 May 2012 08:32:47 -0000
Content-Type: text/plain

Don't remove rpmlib when INC_RPM_IMAGE_GEN=1, otherwise the
list_installed_packages would get nothing in the second build.

[YOCTO #2440]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/rootfs_rpm.bbclass |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 9039b21..8ec03d2 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -154,8 +154,11 @@ EOF
 }
 
 remove_packaging_data_files() {
-	rm -rf ${IMAGE_ROOTFS}${rpmlibdir}
-	rm -rf ${IMAGE_ROOTFS}${opkglibdir}
+	# Don't remove the rpmlib when INC_RPM_IMAGE_GEN=1
+	if [ "${INC_RPM_IMAGE_GEN}" != "1" ]; then
+		rm -rf ${IMAGE_ROOTFS}${rpmlibdir}
+		rm -rf ${IMAGE_ROOTFS}${opkglibdir}
+	fi
 }
 
 RPM_QUERY_CMD = '${RPM} --root ${IMAGE_ROOTFS} -D "_dbpath ${rpmlibdir}" \
-- 
1.7.1



