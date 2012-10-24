Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQz8A-0002lA-8M
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 13:28:14 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so319771wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 04:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=hwsjxHlrzvMwqT0DRcXKEL0hdeSUk7DTtsD46qRTrlA=;
	b=GD1BjN/Lyx6jf+BXwWLgE6lecGPZ80bTXMBFQXr/nlXToi+DiBydAgisCPaDMJH3BQ
	F7v+2FRLEf6QT32+Ssuv3QAWRRBvqXKHEpBT8/UKVyIgzis/yIJF2d6jDS3CndmGFgL+
	guAmPFUcDPIQefP70DCwmIeSyfHyhsXpHYZeGGBEJgyqGz0SQ5ihJtzLpAWFv4Jz2cDJ
	GBmfeoIA8Q5xwjzdBpSAeDUfEbOyiN7bCtOEF7Zn1Wb0DQiI1jQ2ImYp8/3+BZlGSyA7
	fROVTXlYhWj2l/1ne1vdYOlFMnIc8l7R606RJUuJEVVcabJnE2uFovWvC9E9SK2IcW+b
	2V5w==
Received: by 10.216.135.99 with SMTP id t77mr1790484wei.193.1351077287012;
	Wed, 24 Oct 2012 04:14:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id az2sm3804297wib.10.2012.10.24.04.14.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 04:14:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Oct 2012 13:15:01 +0200
Message-Id: <1351077301-7744-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <1351066258-19437-1-git-send-email-Martin.Jansa@gmail.com>
References: <1351066258-19437-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv3] scripts/sstate-sysroot-cruft.sh: add simple script to find files in sysroots not tracked by sstate
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
X-List-Received-Date: Wed, 24 Oct 2012 11:28:14 -0000

* it's not very universal, but works with default oe-core setup and
  shows basic HOW-TO. It can be improved later.

* eglibc-initial should be fixed, but for now better to add that
  work around then to show a lot of false positives

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 V2: added .pyo to WHITELIST                                                                                            
     shorter filenames                                                                                        
     TMPDIR                                                                                                                                                   
     added duplicates but not shown                                                                                                   

 V3: use also populate-sysroot.MACHINE, manifest name for populate-sysroot 
     was changed in febeaf3d1b8917b660c7279b008d8b03337568e9

 scripts/sstate-sysroot-cruft.sh | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100755 scripts/sstate-sysroot-cruft.sh

diff --git a/scripts/sstate-sysroot-cruft.sh b/scripts/sstate-sysroot-cruft.sh
new file mode 100755
index 0000000..b68de42
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
+  sed 's#tcbootstrapusr#tcbootstrap/usr#g; s#/$##g; s#///*#/#g' | \
+  # work around for missing / in manifest for eglibc-initial, paths ending with / for directories and multiplied // (e.g. paths to native sysroot)
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
1.7.12.4



