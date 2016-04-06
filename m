Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7A9BB7718A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 04:45:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u364j5rS023244
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Apr 2016 21:45:05 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Apr 2016 21:45:04 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Apr 2016 00:45:01 -0400
Message-ID: <39560f98b94a3d0d24c44c7ff139aa1c605a8498.1459917622.git.dengke.du@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1459917622.git.dengke.du@windriver.com>
References: <cover.1459917622.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] coreutils: correct the case for class-native
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
X-List-Received-Date: Wed, 06 Apr 2016 04:45:05 -0000
Content-Type: text/plain

The function of do_install_append_class-native for class-native
had alread exist,so exclude the class-native in function
do_install_append.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_8.25.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_8.25.bb b/meta/recipes-core/coreutils/coreutils_8.25.bb
index 419a693..e8e269a 100644
--- a/meta/recipes-core/coreutils/coreutils_8.25.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.25.bb
@@ -70,6 +70,10 @@ do_compile_prepend () {
 }
 
 do_install_append() {
+	if [ "${CLASSOVERRIDE}" = "class-native" ]; then
+		return
+	fi
+
 	for i in df mktemp base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
 
 	install -d ${D}${base_bindir}
-- 
1.9.1


