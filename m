Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4296DBE6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:33:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7XSNR027777
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:33:29 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:33:28 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:33:18 -0600
Message-ID: <1385019198-24458-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385019198-24458-1-git-send-email-mark.hatle@windriver.com>
References: <1385019198-24458-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [master][dora][PATCH 2/2] perf: Disable -Werror flag
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
X-List-Received-Date: Thu, 21 Nov 2013 07:33:30 -0000
Content-Type: text/plain

From: Konrad Scherer <Konrad.Scherer@windriver.com>

If the sed command does not run before make is invoked, the compile
fails. Defining the environment variable is the proper way to disable
warnings as errors build option and eliminates the race condition.

Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 138595d..1b889aa 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -40,6 +40,7 @@ export STAGING_INCDIR
 export STAGING_LIBDIR
 export BUILD_SYS
 export HOST_SYS
+export WERROR = "0"
 
 do_populate_lic[depends] += "virtual/kernel:do_populate_sysroot"
 
@@ -118,10 +119,6 @@ do_install() {
 	fi
 }
 
-do_configure_prepend () {
-    sed -i 's,-Werror ,,' ${S}/tools/perf/Makefile
-}
-
 python do_package_prepend() {
     bb.data.setVar('PKGV', get_kernelversion('${S}').split("-")[0], d)
 }
-- 
1.8.1.2.545.g2f19ada


