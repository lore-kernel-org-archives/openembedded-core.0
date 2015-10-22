Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 630E67711C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 93F01609000
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:26 +0100
Message-Id: <e789603c9470ad22f935ab993a13f9ee7c9630eb.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 05/52] coreutils: fix for native and nativesdk
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:20 -0000

From: Robert Yang <liezhi.yang@windriver.com>

The do_install_append is used for moving/renaming for ALTERNATIVE, but
it breaks native and nativesdk, for example there is no ln, but
ln.coreutils, that makes coreutils-native or nativesdk-coreutils doesn't
work. This patch fixes the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/coreutils/coreutils_8.24.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.24.bb b/meta/recipes-core/coreutils/coreutils_8.24.bb
index 034ebcd..f042346 100644
--- a/meta/recipes-core/coreutils/coreutils_8.24.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.24.bb
@@ -62,7 +62,7 @@ do_compile_prepend () {
 	mkdir -p ${B}/src
 }
 
-do_install_append() {
+do_install_append_class-target() {
 	for i in df mktemp base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
 
 	install -d ${D}${base_bindir}
-- 
2.1.4


