Return-Path: <Jian.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07DC765C7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 09:43:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAE9hkd6020300
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 01:43:46 -0800 (PST)
Received: from localhost.localdomain (128.224.153.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 14 Nov 2014 01:43:46 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Nov 2014 17:43:37 +0800
Message-ID: <1415958217-16545-6-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.7.0.5
In-Reply-To: <1415958217-16545-1-git-send-email-jian.liu@windriver.com>
References: <1415958217-16545-1-git-send-email-jian.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] nfs-utils: files will be over written when updating using rpm
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
X-List-Received-Date: Fri, 14 Nov 2014 09:43:47 -0000
Content-Type: text/plain

If there is no %config micro before the file in the spec file,
this file will be over-written after updating this package
using rpm.
This will make our settings lost.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
index 8ead5d0..3e2d183 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
@@ -114,3 +114,5 @@ do_install_append () {
 	rm -f ${D}${sbindir}/rpcgen
 	rm -f ${D}${sbindir}/locktest
 }
+
+CONFFILES_${PN}-client += "${localstatedir}/lib/nfs/etab ${localstatedir}/lib/nfs/statd/state ${localstatedir}/lib/nfs/rmtab"
-- 
1.8.5.2.233.g932f7e4


