Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 14E976D3D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 02:06:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9U26pok010227
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 19:06:51 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 29 Oct 2013 19:06:50 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Oct 2013 10:07:46 +0800
Message-ID: <8375914656f9a76b45495b0bb7209df9a7fde180.1383098783.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383098783.git.Qi.Chen@windriver.com>
References: <cover.1383098783.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] iproute2: explicitly add 'bash' to its RDEPENDS
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
X-List-Received-Date: Wed, 30 Oct 2013 02:06:49 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

If we build a minimal image with iproute2 installed, the following
error will appear during rootfs.

error: Can't install iproute2-3.10.0-r0.0@i586: no package provides /bin/bash

The problem is that iproute2 has an implicit dependency on 'bash'.
This dependency is from per-file dependency checking. But as 'bash'
is not explicitly specified in the RDEPENDS in recipe, it's not built.
This leads to the above error.

Fix this problem by explicitly adding 'bash' to the RDEPENDS.

[YOCTO #5415]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 3db21db..40f6a6c 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://ip/ip.c;beginline=3;endline=8;md5=689d691d0410a4b64d3899f8d6e31817"
 
 DEPENDS = "flex-native bison-native iptables"
+RDEPENDS_${PN} = "bash"
 
 inherit update-alternatives
 
-- 
1.7.9.5


