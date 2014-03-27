Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 098966F952
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 08:11:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2R8BW2u006719
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 01:11:32 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 27 Mar 2014 01:11:31 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Mar 2014 04:11:24 -0400
Message-ID: <5524b7efec9be73ac8fa233849a61ad53f9f81ba.1395906476.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1395906475.git.liezhi.yang@windriver.com>
References: <cover.1395906475.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] gummiboot: fix the installed but not shipped warning
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
X-List-Received-Date: Thu, 27 Mar 2014 08:11:31 -0000
Content-Type: text/plain

Fix the warning:
WARNING: QA Issue: gummiboot: Files/directories were installed but not shipped
  /usr/lib
  /usr/lib/gummiboot
  /usr/lib/gummiboot/gummibootx64.efi

This is because it uses "/usr/lib" in gummibootlibdir, use ${libdir} to
fix it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-bsp/gummiboot/gummiboot_git.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/gummiboot/gummiboot_git.bb b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
index b0435f5..8d93b20 100644
--- a/meta/recipes-bsp/gummiboot/gummiboot_git.bb
+++ b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
@@ -23,6 +23,8 @@ EXTRA_OECONF = "--disable-manpages --with-efi-includedir=${STAGING_INCDIR} \
                 --with-efi-ldsdir=${STAGING_LIBDIR} \
                 --with-efi-libdir=${STAGING_LIBDIR}"
 
+EXTRA_OEMAKE += "gummibootlibdir=${libdir}/gummiboot"
+
 do_deploy () {
         install ${B}/gummiboot*.efi ${DEPLOYDIR}
 }
-- 
1.7.10.4


