Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9BB792F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 06:27:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7H6RGR3010803
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 23:27:17 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 16 Aug 2018 23:27:16 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2018 14:27:10 +0800
Message-ID: <1534487230-438571-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534487230-438571-1-git-send-email-mingli.yu@windriver.com>
References: <1534487230-438571-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] mingetty: fix usrmerge install path
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
X-List-Received-Date: Fri, 17 Aug 2018 06:27:16 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Update /sbin to $base_sbindir to fix the
below warning when usrmerge enabled in
DISTRO_FEATURES.

WARNING: mingetty-1.08-r3 do_package: mingetty: NOT adding alternative provide /usr/sbin/getty: /usr/sbin/mingetty does not exist
WARNING: mingetty-1.08-r3 do_package: QA Issue: mingetty: Files/directories were installed but not shipped in any package:
  /sbin
  /usr/sbin

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-extended/mingetty/mingetty_1.08.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/mingetty/mingetty_1.08.bb b/meta/recipes-extended/mingetty/mingetty_1.08.bb
index 3c16228..491b892 100644
--- a/meta/recipes-extended/mingetty/mingetty_1.08.bb
+++ b/meta/recipes-extended/mingetty/mingetty_1.08.bb
@@ -16,6 +16,7 @@ EXTRA_OEMAKE = "CC='${CC}' \
                 CFLAGS='${CFLAGS} -D_GNU_SOURCE'"
 
 do_install(){
+    sed -i -e "s;SBINDIR=/sbin;SBINDIR=$base_sbindir;"  ${S}/Makefile
     install -d ${D}${mandir}/man8 ${D}/${base_sbindir}
     oe_runmake install DESTDIR=${D}
 }
-- 
2.7.4


