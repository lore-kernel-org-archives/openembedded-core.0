Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQnWV-0003Au-Qu
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 01:04:35 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so2267359wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 15:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=COlI/C+jCBuQO11385XQMY5U7yUquU41uXdX/wfacAk=;
	b=RZ7XwtIiJOw6zhHJzeo6LbjibI3cKsHTwUoN8bc+zAp+emLCwEX4GvtVitu55Ic3RS
	MWxLyf1E3EDWEQwtbTuWt3HLZ9RM/WGMdPvG4BxQG29hQkyxR6yXbUQ/Dax/LAFQUPKt
	nrQwHSpNOx/ouwhPb3fSMND3SaQS0Go6xyo+AuFTiJ++67VUYamruMrc13J0o0es9u+p
	cBQLk2TG/dzlvjdjHC9HpKqUZ0gSAz7epuhY7lARpem75auKousXOzixzOkcqXukfinW
	o2VwuP9ZE96qiuyeXBK2iHeadzdg/GnE9Ym8yD/8pC+DDdK0h5btrvVVVpHSKQZU3bbP
	rYMg==
Received: by 10.216.207.18 with SMTP id m18mr7853041weo.203.1351032669201;
	Tue, 23 Oct 2012 15:51:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id di7sm1234214wib.11.2012.10.23.15.51.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 15:51:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Oct 2012 00:51:29 +0200
Message-Id: <1351032689-20431-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [PATCH] scripts/sstate-sysroot-cruft.sh: add simple script to find files in sysroots not tracked by sstate
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
X-List-Received-Date: Tue, 23 Oct 2012 23:04:35 -0000

* it's not very universal, but works with default oe-core setup and
  shows basic HOW-TO. It can be improved later.

* eglibc-initial should be fixed, but for now better to add that
  work around then to show a lot of false positives

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-sysroot-cruft.sh | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100755 scripts/sstate-sysroot-cruft.sh

diff --git a/scripts/sstate-sysroot-cruft.sh b/scripts/sstate-sysroot-cruft.sh
new file mode 100755
index 0000000..ea5fdf8
--- /dev/null
+++ b/scripts/sstate-sysroot-cruft.sh
@@ -0,0 +1,27 @@
+#!/bin/sh
+
+# Used to find files installed in sysroot which are not tracked by sstate manifest
+# Update BASE
+
+BASE="/OE/oe-core"
+
+OUTPUT=${BASE}/sysroot.cruft.`date "+%s"`
+WHITELIST="\/var\/pseudo\/*[^\/]*$ \/shlibs$ \.pyc$"
+
+mkdir ${OUTPUT}
+find ${BASE}/tmp-eglibc/sstate-control -name \*populate-sysroot -o -name \*package | xargs cat | grep sysroots | \
+  sed 's#tcbootstrapusr#tcbootstrap/usr#g; s#/$##g; s#///*#/#g' | \
+  # work around for missing / in manifest for eglibc-initial, paths ending with / for directories and multiplied // (e.g. paths to native sysroot)
+  sort -u > ${OUTPUT}/sstate-control.master.list # -u because some directories are listed for more recipes
+find ${BASE}/tmp-eglibc/sysroots/ | \
+  sort > ${OUTPUT}/sstate-control.sysroot.list
+
+diff ${OUTPUT}/sstate-control.master.list ${OUTPUT}/sstate-control.sysroot.list > ${OUTPUT}/sstate-control.diff.all
+
+cp ${OUTPUT}/sstate-control.diff.all ${OUTPUT}/sstate-control.diff
+for item in ${WHITELIST}; do 
+  sed -i "/${item}/d" ${OUTPUT}/sstate-control.diff;
+done
+
+echo "Following files are installed in sysroot, but not tracked by sstate"
+cat ${OUTPUT}/sstate-control.diff
-- 
1.7.12.4



