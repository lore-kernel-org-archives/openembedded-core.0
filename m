Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TYu7s-00083H-3K
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 08:44:40 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so513268bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 23:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=d6czGZvlyLpbCRs1gM3kuk3S3SxJm2pWa585c+C0LTk=;
	b=AI7UBzkp4wmDKtiN/0l1eT/awjAnmgNeozms7AIesJK4cGZn1Q9Rjijks+hqpMeJu8
	mT0myyrLEqKTniWMSJuIwk2/+dOmwHmnDdzEDkYjJzJepX0GviWLmCrgSa4Zz530l2IT
	yfDV1HG36/G1icWnh1d66HZMoJwtf00SZF8WuyoAlP2YoBrebgoDL/bwhLRnAmvv1wpK
	LCO+kCF2K7hcQlxiEvvZLbwNhJLlcLhUZMKEVwfstGDVKxfmWsZvA1PG2YwX3blqiZB3
	Q2KbaWzyooYPneYnVYWsI6c+qg7zBacxCj0yibTwor+2s3VWGmHTR6XLKQWv/y+ZsiRh
	99SQ==
Received: by 10.204.10.74 with SMTP id o10mr67420bko.9.1352964643648;
	Wed, 14 Nov 2012 23:30:43 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hm4sm7227385bkc.7.2012.11.14.23.30.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Nov 2012 23:30:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2012 08:30:49 +0100
Message-Id: <1352964649-31187-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1351077301-7744-1-git-send-email-Martin.Jansa@gmail.com>
References: <1351077301-7744-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv4] scripts/sstate-sysroot-cruft.sh: add simple script to find files in sysroots not tracked by sstate
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
X-List-Received-Date: Thu, 15 Nov 2012 07:44:40 -0000

* it's not very universal, but works with default oe-core setup and
  shows basic HOW-TO. It can be improved later.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 V2: added .pyo to WHITELIST
     shorter filenames
     TMPDIR
     added duplicates but not shown

 V3: use also populate-sysroot.MACHINE, manifest name for populate-sysroot
     was changed in febeaf3d1b8917b660c7279b008d8b03337568e9

 V4: dropped eglibc-initial work around, it was fixed in oe-core
                                                                                                                                                              
 scripts/sstate-sysroot-cruft.sh | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100755 scripts/sstate-sysroot-cruft.sh

diff --git a/scripts/sstate-sysroot-cruft.sh b/scripts/sstate-sysroot-cruft.sh
new file mode 100755
index 0000000..ca23dcf
--- /dev/null
+++ b/scripts/sstate-sysroot-cruft.sh
@@ -0,0 +1,34 @@
+#!/bin/sh
+
+# Used to find files installed in sysroot which are not tracked by sstate manifest
+# Update BASE
+
+BASE="/OE/oe-core"
+TMPDIR="${BASE}/tmp-eglibc"
+
+OUTPUT=${BASE}/sysroot.cruft.`date "+%s"`
+WHITELIST="\/var\/pseudo\/*[^\/]*$ \/shlibs$ \.pyc$ \.pyo$"
+
+mkdir ${OUTPUT}
+find ${TMPDIR}/sstate-control -name \*.populate-sysroot\* -o -name \*.package\* | xargs cat | grep sysroots | \
+  sed 's#/$##g; s#///*#/#g' | \
+  # work around for paths ending with / for directories and multiplied // (e.g. paths to native sysroot)
+  sort > ${OUTPUT}/master.list.all
+sort -u ${OUTPUT}/master.list.all > ${OUTPUT}/master.list # -u because some directories are listed for more recipes
+find ${TMPDIR}/sysroots/ | \
+  sort > ${OUTPUT}/sysroot.list
+
+diff ${OUTPUT}/master.list.all ${OUTPUT}/master.list > ${OUTPUT}/duplicates
+diff ${OUTPUT}/master.list ${OUTPUT}/sysroot.list > ${OUTPUT}/diff.all
+
+cp ${OUTPUT}/diff.all ${OUTPUT}/diff
+for item in ${WHITELIST}; do 
+  sed -i "/${item}/d" ${OUTPUT}/diff;
+done
+
+# too many false positives for directories
+# echo "Following files are installed in sysroot at least twice"
+# cat ${OUTPUT}/duplicates
+
+echo "Following files are installed in sysroot, but not tracked by sstate"
+cat ${OUTPUT}/diff
-- 
1.8.0



