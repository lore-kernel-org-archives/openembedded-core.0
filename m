Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 54A197ED4E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 02:52:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8Q2q7u8014383
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 19:52:07 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 25 Sep 2019 19:52:06 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Sep 2019 10:51:45 +0800
Message-ID: <d17e1baaf4fdb38bced2bc9d24dc5fb892727453.1569466181.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569466181.git.liezhi.yang@windriver.com>
References: <cover.1569466181.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 3/3] net-tools: Fix installed-vs-shipped for nativesdk
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
X-List-Received-Date: Thu, 26 Sep 2019 02:52:06 -0000
Content-Type: text/plain

Fixed:
$ bitbake nativesdk-net-tools
ERROR: nativesdk-net-tools-1.60-26-r0 do_package: QA Issue: nativesdk-net-tools: Files/directories were installed but not shipped in any package:
  /usr
  /usr/share
  /usr/share/man
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index b565fd0..5a376e7 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -95,7 +95,7 @@ do_compile() {
 
 do_install() {
 	# We don't need COPTS or LOPTS, but let's be consistent.
-	oe_runmake COPTS="$CFLAGS" LOPTS="$LDFLAGS" 'BASEDIR=${D}' install
+	oe_runmake COPTS="$CFLAGS" LOPTS="$LDFLAGS" BASEDIR=${D} INSTALLNLSDIR=${D}${datadir}/locale mandir=${mandir} install
 
 	if [ "${base_bindir}" != "/bin" ]; then
 		mkdir -p ${D}/${base_bindir}
-- 
2.7.4


