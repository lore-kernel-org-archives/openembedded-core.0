Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C4CE4788B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 10:06:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0VA6vbj013311
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 02:06:58 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 31 Jan 2018 02:06:56 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jan 2018 17:44:05 +0800
Message-ID: <2b9b27d3de67b591a12a7e52728420e749972c62.1517391537.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1517391537.git.kai.kang@windriver.com>
References: <cover.1517391537.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] i2c-tools: fix libdir for multilib
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
X-List-Received-Date: Wed, 31 Jan 2018 10:06:56 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It set variable libdir with $(prefix)/lib in makefile which is not right
when multilib is enabled. Correct it with ${libdir}.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb
index e936fd759b..4b2ec712bf 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb
@@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "5b60daf6f011de0acb61de57dba62f2054bb39f19961d67e0c91610f07
 
 inherit autotools-brokensep
 
+EXTRA_OEMAKE = "libdir=${libdir}"
+
 do_compile_prepend() {
     sed -i 's#/usr/local#/usr#' ${S}/Makefile
     echo "include eeprog/Module.mk" >> ${S}/Makefile
-- 
2.14.1


