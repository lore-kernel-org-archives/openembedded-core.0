Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RaVD9-0000sV-SU
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 17:28:13 +0100
Received: by wgbds11 with SMTP id ds11so12054547wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 08:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	bh=HSGZodhDNCe1/qK/Z1yVvlnIUAgNQLxS5AjnTrV9zDo=;
	b=hRJjE8iueVaWJXuRaXHVr9gJ+b+1LWMrKIVxII97U7VA3sAcxojcxujSgrTQnPGYU5
	aT+nrUhDDMTkTmsFUlfWiFzBqT3WX74qzKsmrV+bcY5XYFobzm48hfL0P9WKdti1sPRF
	znKkUwPftPT0TuAxNp4IqVBwrgrcjTxY+DSDU=
Received: by 10.227.197.147 with SMTP id ek19mr17135824wbb.3.1323793276078;
	Tue, 13 Dec 2011 08:21:16 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id 28sm27231923wby.3.2011.12.13.08.21.13
	(version=SSLv3 cipher=OTHER); Tue, 13 Dec 2011 08:21:14 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 20:19:45 +0400
Message-Id: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
Subject: [PATCH 1/9] kernel.bbclass: compile kernel and modules in a single task
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Dec 2011 16:28:13 -0000

There is no point in compiling kernel modules in a separate task, run
right after do_compile. On the other hand merging those tasks will e.g.
make icecc used also for modules compilation, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/classes/kernel.bbclass |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3f2f75a..a75c199 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -89,17 +89,13 @@ kernel_do_compile() {
 	if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" = "${KERNEL_IMAGETYPE}"; then
 		gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" > "${KERNEL_OUTPUT}"
 	fi
-}
 
-do_compile_kernelmodules() {
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
-		oe_runmake ${PARALLEL_MAKE} modules  CC="${KERNEL_CC}" LD="${KERNEL_LD}"
+		oe_runmake modules  CC="${KERNEL_CC}" LD="${KERNEL_LD}"
 	else
 		bbnote "no modules to compile"
 	fi
 }
-addtask compile_kernelmodules after do_compile before do_install
 
 kernel_do_install() {
 	#
-- 
1.7.7.3



