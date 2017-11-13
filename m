Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9072C7857D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 05:25:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAD5PYuF029459
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Nov 2017 21:25:34 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 12 Nov 2017 21:25:33 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Nov 2017 13:26:22 +0800
Message-ID: <62db9387c3ee71f4bed87a7a546afdf927ba5ac0.1510550741.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1510550741.git.Qi.Chen@windriver.com>
References: <cover.1510550741.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] autoconf-archive: inherit allarch and fix package splitting
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
X-List-Received-Date: Mon, 13 Nov 2017 05:25:33 -0000
Content-Type: text/plain

autoconf-archive is a set of common m4 macros, it should be allarch,
just like it is on other distros.

Also fix package splitting. With current package splitting,
autoconf-archive itself contains almost nothing, the m4 macros are
contained in its dev package. However, autoconf-archive should
contain those m4 marcos itself.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../autoconf-archive/autoconf-archive_2016.09.16.bb                 | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
index 104dc38..89d57ac 100644
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
@@ -9,6 +9,10 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
 SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
 
-inherit autotools
+inherit autotools allarch
+
+PACKAGES = "${PN} ${PN}-doc"
+
+FILES_${PN} += "${datadir}/aclocal"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


