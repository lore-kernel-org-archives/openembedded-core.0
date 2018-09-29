Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ECCB979987
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 05:42:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T5g8Ib003370
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2018 22:42:08 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Sep 2018 22:42:07 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 13:01:18 +0800
Message-ID: <eed6348760b285b0cab10e1f759c79e92eba8ae6.1538197206.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538197206.git.kai.kang@windriver.com>
References: <cover.1538197206.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/10] groff: fix multilib install file conflicts
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
X-List-Received-Date: Sat, 29 Sep 2018 05:42:08 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Perl scripts ${bindir}/{gpinyin, groffer, grog} are ${libdir} related
and cause multilib install file conflicts:

| Error: Transaction check error:
|  file /usr/bin/gpinyin conflicts between attempted installs of groff-1.22.3-r0.core2_64 and lib32-groff-1.22.3-r0.x86
|  file /usr/bin/groffer conflicts between attempted installs of groff-1.22.3-r0.core2_64 and lib32-groff-1.22.3-r0.x86
|  file /usr/bin/grog conflicts between attempted installs of groff-1.22.3-r0.core2_64 and lib32-groff-1.22.3-r0.x86

Inherit multilib_script.bbclass to fix the errors.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/groff/groff_1.22.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/groff/groff_1.22.3.bb b/meta/recipes-extended/groff/groff_1.22.3.bb
index 7472f59825..ce7ce3e791 100644
--- a/meta/recipes-extended/groff/groff_1.22.3.bb
+++ b/meta/recipes-extended/groff/groff_1.22.3.bb
@@ -20,7 +20,9 @@ DEPENDS = "groff-native"
 DEPENDS_class-native = ""
 RDEPENDS_${PN} += "perl sed"
 
-inherit autotools texinfo
+inherit autotools texinfo multilib_script
+
+MULTILIB_SCRIPTS = "${PN}:${bindir}/gpinyin ${PN}:${bindir}/groffer ${PN}:${bindir}/grog"
 
 EXTRA_OECONF = "--without-x"
 PARALLEL_MAKE = ""
-- 
2.18.0


