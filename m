Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD01F6AA18
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 18:36:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA7IaRPD009150
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Nov 2013 10:36:27 -0800 (PST)
Received: from yow-kscherer-d1.wrs.com (128.224.146.215) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Thu, 7 Nov 2013 10:36:27 -0800
From: Konrad Scherer <konrad.scherer@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Nov 2013 13:36:26 -0500
Message-ID: <1383849386-7680-2-git-send-email-konrad.scherer@windriver.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1383849386-7680-1-git-send-email-konrad.scherer@windriver.com>
References: <1383849386-7680-1-git-send-email-konrad.scherer@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] perf: Disable warnings as errors for kernels 3.1+
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
X-List-Received-Date: Thu, 07 Nov 2013 18:36:26 -0000
Content-Type: text/plain

From: Konrad Scherer <Konrad.Scherer@windriver.com>

Turns out the sed command has not been working as intended since
kernel 3.1 due to the trailing space. Adding the WERROR=0 environment
variable is the correct way to disable warnings as errors.

Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 903ffa6..6258cbb 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -41,6 +41,9 @@ export STAGING_LIBDIR
 export BUILD_SYS
 export HOST_SYS
 
+#kernel 3.1+ supports WERROR to disable warnings as errors
+export WERROR = "0"
+
 do_populate_lic[depends] += "virtual/kernel:do_populate_sysroot"
 
 # needed for building the tools/perf Perl binding
@@ -115,6 +118,7 @@ do_install() {
 }
 
 do_configure_prepend () {
+    #kernels before 3.1 do not support WERROR env variable
     sed -i 's,-Werror ,,' ${S}/tools/perf/Makefile
 }
 
-- 
1.8.3.2


