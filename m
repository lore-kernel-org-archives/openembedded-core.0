Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1TsUAl-0002Ds-Qn
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 09:04:41 +0100
Received: by mail-ee0-f48.google.com with SMTP id b57so52349eek.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 23:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=mNdd3VFv3VZLPtIqkhUxZDJFAOk0AJsv7Zy89nE5H2w=;
	b=RN1+GKaYvnDHDBK/i/taqQZj4KAuOHm/00OE/62G7vyCUGgasEdX62GAyzppZyqD2P
	M0K5vcg3NodOv/YUzO1dqCnWYExIgr06qLwbxLOB8w7cyRAzIV1ZTztjVOvqmW8Te8GJ
	T8EvPhCRg3U6O7hahRLE6Xr/HoCNwHyH2u9/nKBGjCNN29/5cIbE6lrBKpiSe45NknE8
	n4StTX8VTWmo8VScyf9l99KXFtMWTdCrMliCv5lA0FLM6amsATos646RI7dE9NWfL9wQ
	w+8EM4u4ZYxTvJoxpCRmcOj3L2jTs/0rbOketgNUo6494sPhCRMZ1MqK4Z9f1z9mDkhJ
	hzeQ==
X-Received: by 10.14.223.135 with SMTP id v7mr172554285eep.41.1357631365501;
	Mon, 07 Jan 2013 23:49:25 -0800 (PST)
Received: from quad.modzo.koansoftware.com
	(host56-7-static.30-87-b.business.telecomitalia.it. [87.30.7.56])
	by mx.google.com with ESMTPS id w44sm134071493eep.6.2013.01.07.23.49.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 23:49:24 -0800 (PST)
From: Marco Cavallini <koansoftware@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 08:51:44 +0100
Message-Id: <1357631504-22614-1-git-send-email-m.cavallini@koansoftware.com>
X-Mailer: git-send-email 1.8.0.3
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
Subject: [oe][meta-oe][PATCH v2] kernel.bbclass: kernel_do_install fails with kernel <2.6.30
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 08:04:41 -0000

 * kernels <2.6.30 don't have $kerneldir/tools directory
 * so we got this error:
 * sed: can't read ...SNIP...linux/2.6.30-r0/image/usr/src/kernel/tools/perf/Makefile: No such file or directory
 * ERROR: Function failed: do_install

Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
---
 meta/classes/kernel.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 96b23bc..aff8842 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -204,8 +204,11 @@ kernel_do_install() {
 		rm -f $kerneldir/$entry
 	done
 
-	# Fix SLANG_INC for slang.h
-	sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g' $kerneldir/tools/perf/Makefile
+	# kernels <2.6.30 don't have $kerneldir/tools directory so we check if it exists before calling sed
+	if [ -f $kerneldir/tools/perf/Makefile ]; then
+		# Fix SLANG_INC for slang.h
+		sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g' $kerneldir/tools/perf/Makefile
+	fi
 }
 
 sysroot_stage_all_append() {
-- 
1.8.0.3



