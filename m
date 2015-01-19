Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E2D3772C62
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 07:11:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0J7BXmF002740
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 23:11:34 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 18 Jan 2015 23:11:33 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Jan 2015 23:11:31 -0800
Message-ID: <bc679bdfe35b8c0740f66a5e5f03d8ac69c59309.1421651378.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421651378.git.liezhi.yang@windriver.com>
References: <cover.1421651378.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] perf: fix for rebuilding
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
X-List-Received-Date: Mon, 19 Jan 2015 07:11:35 -0000
Content-Type: text/plain

Fix for rebuilding error:
make[3]: *** No rule to make target `/path/to/sysroots/qemuarm64/usr/src/kernel/tools/lib/traceevent//trace-seq.c',
needed by `.trace-seq.d'.  Stop.
make[2]: *** [sub-make] Error 2

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index bd57c6c..ab7075e 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -115,6 +115,9 @@ do_install() {
 }
 
 do_configure_prepend () {
+    # Fix for rebuilding
+    rm -rf ${B}/.*.d
+
     #kernels before 3.1 do not support WERROR env variable
     sed -i 's,-Werror ,,' ${S}/tools/perf/Makefile
     if [ -e "${S}/tools/perf/config/Makefile" ]; then
-- 
1.7.9.5


