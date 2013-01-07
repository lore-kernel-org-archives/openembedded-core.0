Received: from mail-we0-f179.google.com ([74.125.82.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1TsD7D-0004pm-An
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 14:51:53 +0100
Received: by mail-we0-f179.google.com with SMTP id r6so9762168wey.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 05:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=O8E2BPVNrQ6okBJYPidspwqc9WQMq61VgtAb85IfTkE=;
	b=uem+10GwMSoZQBxPMGGsOnb7SWHFafRzvT7u3QqglnPp5lnVdgT+uWS3r7MG5Yiyvm
	Iqhc1drZwUfAlizjPHJwVzIWo4sAFOoZuIXVyqOWgX989RY9qXhlp8hDmlIbpNtCDQP9
	1aGb4p8o6O81zeZwSixm3hTHR2u5TKcLw9a0ooq/Qx8iOt/tv4jNSMit7VsZYmk4OF69
	C0qXEagwcpyQZk9AjXrgl6Cnu0K5R92Ih55hfWCv0go/yD56TF7Xe3JR2nsz92hpq6LC
	KAqG6hGC6exnxQTeXWqoPcRZGXfcWdSWtGDOokHZorDwHdRm14QT7KlZ4v4jhqql0aMJ
	WOnw==
X-Received: by 10.180.109.195 with SMTP id hu3mr9152245wib.31.1357565798083;
	Mon, 07 Jan 2013 05:36:38 -0800 (PST)
Received: from quad.modzo.koansoftware.com
	(host56-7-static.30-87-b.business.telecomitalia.it. [87.30.7.56])
	by mx.google.com with ESMTPS id g2sm13724478wiy.0.2013.01.07.05.36.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 05:36:37 -0800 (PST)
From: Marco Cavallini <koansoftware@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 14:39:23 +0100
Message-Id: <1357565963-21367-1-git-send-email-m.cavallini@koansoftware.com>
X-Mailer: git-send-email 1.8.0.3
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
Subject: [oe][meta-oe][PATCH] kernel.bbclass: kernel_do_install fails with 2.6 kernel recipes
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
X-List-Received-Date: Mon, 07 Jan 2013 13:51:54 -0000

 * old 2.6.x kernels don't have $kerneldir/tools directory
 * so we got this error:
 * sed: can't read ...SNIP...linux/2.6.30-r0/image/usr/src/kernel/tools/perf/Makefile: No such file or directory
 * ERROR: Function failed: do_install

Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
---
 meta/classes/kernel.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index aee8a77..06b23e0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -204,8 +204,10 @@ kernel_do_install() {
 		rm -f $kerneldir/$entry
 	done
 
-	# Fix SLANG_INC for slang.h
-	sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g' $kerneldir/tools/perf/Makefile
+	if [ -f $kerneldir/tools/perf/Makefile ]; then
+		# Fix SLANG_INC for slang.h
+		sed -i 's#-I/usr/include/slang#-I=/usr/include/slang#g' $kerneldir/tools/perf/Makefile
+	fi
 }
 
 sysroot_stage_all_append() {
-- 
1.8.0.3



