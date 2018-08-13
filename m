Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6103F78F2E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 09:39:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7D9d76h028189
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 02:39:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Mon, 13 Aug 2018 02:39:07 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Aug 2018 17:43:23 +0800
Message-ID: <06031cfa634164f48fff40b26226c935b2e90336.1534150669.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1534150669.git.Qi.Chen@windriver.com>
References: <cover.1534150669.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] man-db: rdepend on base-passwd to ensure installation order
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
X-List-Received-Date: Mon, 13 Aug 2018 09:39:06 -0000
Content-Type: text/plain

Make man-db rdepend on base-passwd to ensure that base-passwd is
installed before man-db at rootfs time. This is to avoid the following
warning at rootfs time.

  warning: user man does not exist - using root

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/man-db/man-db_2.8.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/man-db/man-db_2.8.3.bb b/meta/recipes-extended/man-db/man-db_2.8.3.bb
index e1a7ad9..97e5a3d 100644
--- a/meta/recipes-extended/man-db/man-db_2.8.3.bb
+++ b/meta/recipes-extended/man-db/man-db_2.8.3.bb
@@ -10,6 +10,7 @@ SRC_URI[md5sum] = "6f3055e18fdd1ce5cbbdb30403991ec7"
 SRC_URI[sha256sum] = "5932a1ca366e1ec61a3ece1a3afa0e92f2fdc125b61d236f20cc6ff9d80cc4ac"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
+RDEPENDS_${PN} += "base-passwd"
 
 # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'
 USE_NLS_libc-musl = "no"
-- 
1.9.1


