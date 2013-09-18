Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id A14A861DDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 13:51:21 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id k4so2890741qaq.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 06:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=8nkPO4gAlsRUTpPS5nS1mv8tZU/zMVVHQ7YIrhiqZNE=;
	b=rgjR49icKOMWNQBCxLh5mNv2cR7aLpdo2AMyQ5AhDArNcKlZEpP62KUCJMvm8t99X/
	+gpP/dJY9mM49wwhBZ8y/rH5aZLFFZWp2HzADXdgMNTxhzB1/G2X90AJ1OtAqxPSGqnA
	M6QiWbfgRc1LgwSxSODwWFePqLGdcozlWPKOreSp0BxQBdN3602KtPVKg10Gzs2tD2ho
	bnAr5C9KHRpCb6fJyFxUOq3hRa3VKiVCLJC3llNprQoU9xOQQkoMoZqXkTfsZad2/+7w
	bUN9p+tLZE+QrlRimPEh6N5aZgmdD0jflynsDeuuwXWHRnwQEtl/jTqUEZLvdhu1LN3x
	0fbg==
X-Received: by 10.229.244.69 with SMTP id lp5mr59922746qcb.14.1379512281660;
	Wed, 18 Sep 2013 06:51:21 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.209.11])
	by mx.google.com with ESMTPSA id u8sm2336547qef.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Sep 2013 06:51:21 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Sep 2013 10:51:04 -0300
Message-Id: <1379512264-8755-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] perf: Add LDFLAGS to allow build of old kernels without patching
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
X-List-Received-Date: Wed, 18 Sep 2013 13:51:22 -0000

The LDFLAGS is required or some old kernels fails due missing
symbols and this is preferred than requiring patches to every old
supported kernel.

Fixes [YOCTO: #5221]

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-kernel/perf/perf.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 4a815ff..269069f 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -60,6 +60,11 @@ B = "${WORKDIR}/${BPN}-${PV}"
 SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
 TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
 
+# The LDFLAGS is required or some old kernels fails due missing
+# symbols and this is preferred than requiring patches to every old
+# supported kernel.
+LDFLAGS="-ldl -lutil"
+
 EXTRA_OEMAKE = \
 		'-C ${S}/tools/perf \
 		O=${B} \
@@ -88,13 +93,13 @@ PARALLEL_MAKE = ""
 
 do_compile() {
 	# Linux kernel build system is expected to do the right thing
-	unset CFLAGS LDFLAGS
+	unset CFLAGS
 	oe_runmake all
 }
 
 do_install() {
 	# Linux kernel build system is expected to do the right thing
-	unset CFLAGS LDFLAGS
+	unset CFLAGS
 	oe_runmake DESTDIR=${D} install
 	# we are checking for this make target to be compatible with older perf versions
 	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" -a $(grep install-python_ext ${S}/tools/perf/Makefile) = "0"]; then
-- 
1.8.4.rc3


