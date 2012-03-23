Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB4Bl-0002NU-Rn
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 14:05:53 +0100
Received: by wgbdr12 with SMTP id dr12so1853152wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 05:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=gR08sX9zYDYOQYtznrAs9OvKpQnjxexObrmqA6g/T4E=;
	b=RolpbC1k7+21WIlFBd6GQXnLPY7mWpZd49MsyQz7SoMVErmFMJaP2o+CbVMAG/MV+j
	xtDQyeb7bME4Jjl/8d+jEMcxWGmeE4TsDQzLmWyA1fp3U02zEL5GSKFjaCns2Qk3/BWb
	7CuqlapPLB7YRU+Bq/6A8sFDDFQWZhYdmGLbeuBrq+d1VBsGdjohU7rOXiDOwXGUFDqI
	mnFIzGo1eS/UHodakLXvkpg8RypW5ukrW7KEZW9p54l4KxkIjfUaa4AEIZXKQaO9YuUQ
	RtupmMHKQMO5a0sPipK5QUoV+u9gfczbyt1s3x+kaigRZ2W3zfhmrJeDJbKUMns41eOg
	iASA==
Received: by 10.216.134.27 with SMTP id r27mr7007739wei.107.1332507417952;
	Fri, 23 Mar 2012 05:56:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gg2sm22715572wib.7.2012.03.23.05.56.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 05:56:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 13:56:29 +0100
Message-Id: <0f5173c469e4ae3e5155d5d3f0643d3a63e25b91.1332507302.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <dc50f1d1204c1c48d8d4a5acb40edf619b306522.1332507302.git.Martin.Jansa@gmail.com>
References: <dc50f1d1204c1c48d8d4a5acb40edf619b306522.1332507302.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332507302.git.Martin.Jansa@gmail.com>
References: <cover.1332507302.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/6] kernel.bbclass: fix extra + in kernelrelease
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
X-List-Received-Date: Fri, 23 Mar 2012 13:05:53 -0000

* see http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014308.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 5e4cdd4..736768e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -204,6 +204,12 @@ sysroot_stage_all_append() {
 }
 
 kernel_do_configure() {
+	# fixes extra + in /lib/modules/2.6.37+
+	# $ scripts/setlocalversion . => +
+	# $ make kernelversion => 2.6.37
+	# $ make kernelrelease => 2.6.37+
+	touch ${B}/.scmversion
+
 	# Copy defconfig to .config if .config does not exist. This allows
 	# recipes to manage the .config themselves in do_configure_prepend().
 	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
-- 
1.7.8.5



