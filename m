Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6122273AD0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 08:35:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2B8Zhk4014620
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 01:35:43 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 01:35:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Mar 2015 01:35:39 -0700
Message-ID: <21bed609c2a1ce2675d33a2a2e70b2b56f53604b.1426062917.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1426062917.git.liezhi.yang@windriver.com>
References: <cover.1426062917.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] mailx: disable parallel build
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
X-List-Received-Date: Wed, 11 Mar 2015 08:35:43 -0000
Content-Type: text/plain

The makeconfig can't run parallelly, otherwise the checking results
might be incorrect and lead to errors:
fio.c:56:17: fatal error: ssl.h: No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/mailx/mailx_12.5.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/mailx/mailx_12.5.bb b/meta/recipes-extended/mailx/mailx_12.5.bb
index 080d71f..a53da3a 100644
--- a/meta/recipes-extended/mailx/mailx_12.5.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5.bb
@@ -29,3 +29,8 @@ inherit autotools-brokensep
 CFLAGS_append = " -D_BSD_SOURCE -DDEBIAN -I${S}/EXT"
 EXTRA_OEMAKE = "SENDMAIL=${sbindir}/sendmail"
 
+# The makeconfig can't run parallelly, otherwise the checking results
+# might be incorrect and lead to errors:
+# fio.c:56:17: fatal error: ssl.h: No such file or directory
+# #include <ssl.h>
+PARALLEL_MAKE = ""
-- 
1.7.9.5


