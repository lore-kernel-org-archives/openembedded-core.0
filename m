Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CC69E6B7AD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 02:42:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0E2geRX009807
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 18:42:40 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 13 Jan 2014 18:42:39 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jan 2014 10:42:13 +0800
Message-ID: <70b0d58e7231dbdaca479e9808e61f7ac49528a3.1389667285.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1389667285.git.liezhi.yang@windriver.com>
References: <cover.1389667285.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] alsa-tools: fix the AUTOMAKE_DIR
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
X-List-Received-Date: Tue, 14 Jan 2014 02:42:39 -0000
Content-Type: text/plain

There should be only one automake under the STAGING_DATADIR_NATIVE in
theory, but der_steffi@gmx.de has reported an odd problem which seemed
like that there are more than one. However, the "automake
--print-libdir" is the regular way to locate automake libdir.

[YOCTO #5706]

Reported-by: der_steffi@gmx.de
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
index c3b97a3..5b0f6ae 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
@@ -32,7 +32,7 @@ do_configure () {
 
 do_compile_prepend () {
     #Automake dir is not correctly detected in cross compilation case
-    export AUTOMAKE_DIR=${STAGING_DATADIR_NATIVE}/$(ls ${STAGING_DATADIR_NATIVE} | grep automake)
+    export AUTOMAKE_DIR="$(automake --print-libdir)"
     export ACLOCAL_FLAGS="--system-acdir=${ACLOCALDIR}/"
 }
 
-- 
1.8.3.1


