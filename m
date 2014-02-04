Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB8E16C73A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 17:34:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s14HYTh1028128
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Feb 2014 09:34:29 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 4 Feb 2014 09:34:28 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 4 Feb 2014 12:34:25 -0500
Message-ID: <8a4a98cc53998f6bbf08763359e1b560b2da3e54.1391534980.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1391534980.git.bruce.ashfield@windriver.com>
References: <cover.1391534980.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] kernel: stop using -exec rm for deleting files
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
X-List-Received-Date: Tue, 04 Feb 2014 17:34:29 -0000
Content-Type: text/plain

Removing files from the source tree via find, exec and rm is not the
most efficient operation, due to (among other things) the many forked
processes.

If we use -delete, it saves a significant amount of time. But -delete
does not work with -prune (since it forces -depth). To maintain the
lib, tools and scripts source files, we can hide them temporarily,
skip their hidden directories and then finally restore them.

Time for install before this change:

 real    2m48.563s
 user    0m35.220s
 sys     0m33.036s

Time for install after this change:

 real    1m21.301s
 user    0m33.160s
 sys     0m28.388s

We could further speed this up by using inline perl to delete the files,
but that complexity is avoided for now.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel.bbclass | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 51626b03f824..b76a65699755 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -260,9 +260,21 @@ kernel_do_install() {
 	# we clean the scripts dir while leaving the generated config
 	# and include files.
 	#
-	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
-	make -C $kerneldir _mrproper_scripts
-	find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
+	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean _mrproper_scripts 
+
+	# hide directories that shouldn't have their .c, s and S files deleted
+	for d in tools scripts lib; do
+		mv $kerneldir/$d $kerneldir/.$d
+	done
+
+	# delete .c, .s and .S files, unless we hid a directory as .<dir>. This technique is 
+	# much faster than find -prune and -exec
+	find . -not -path '*/\.*' -type f -name "*.[csS]" -delete
+
+	# put the hidden dirs back
+	for d in tools scripts lib; do
+		mv $kerneldir/.$d $kerneldir/$d
+	done
 
 	# As of Linux kernel version 3.0.1, the clean target removes
 	# arch/powerpc/lib/crtsavres.o which is present in
-- 
1.8.1.2


