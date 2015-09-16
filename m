Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A05776F9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 07:52:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G7qktO008146
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 00:52:46 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 16 Sep 2015 00:52:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Sep 2015 00:52:45 -0700
Message-ID: <5fe8433cf9e2e8a98b58dd75fedad251d7a53faa.1442389930.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1442389930.git.liezhi.yang@windriver.com>
References: <cover.1442389930.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] mkelfimage: fix owner for /usr/sbin/mkelfImage
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
X-List-Received-Date: Wed, 16 Sep 2015 07:52:51 -0000
Content-Type: text/plain

Fixed:
packages-split/mkelfimage/usr/sbin/mkelfImage is owned by uid 15220, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]

This is because its Makefile uses cp -a to install mkelfImage.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
index 2845b8c..e1c33a6 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
@@ -30,6 +30,7 @@ inherit autotools-brokensep
 do_install_append() {
 	rmdir ${D}${datadir}/mkelfImage/elf32-i386
 	rmdir ${D}${datadir}/mkelfImage
+	chown root:root ${D}/${sbindir}/mkelfImage
 }
 
 BBCLASSEXTEND = "native"
-- 
1.7.9.5


