Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQwG9-0001pC-8n
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 10:24:17 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so184787wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 01:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=SF0cHt3T1A+Q06pSx5x7Edu1+zX3tujEynlY2dKUaNg=;
	b=KVztfnTiuEFwf3+ulGhgP986UpEQh3lJEsWNMzY2yedoqVLyZKgsD95yg3WS6xvlyK
	kjFVvF5hDsmaADlrQdwCMqSXOjpnerqUeH4OVKPSblupXTCzk031v+DX91qom8A19zMx
	G7WGcqyE7p4bJ8asgAJF0TKdZJy/SuZW3GEomb0WA8/TCesbJOGVTVZ2rV1SjebXpIc9
	IqsCi9J5MjnoNQZ001vXz816dX6/TTo2u6bF2q5sUV3L2UucavjWAs3CHID2J52Jpc+M
	MMPB5vTphtbE/ZqoTScelI62EAvsDSwIYHa8abgEcKwj5E6MTOFEv/mVmY/2s6aI9sJe
	SAEA==
Received: by 10.216.193.136 with SMTP id k8mr8990367wen.188.1351066250290;
	Wed, 24 Oct 2012 01:10:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bn7sm3551350wib.8.2012.10.24.01.10.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 01:10:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Oct 2012 10:10:58 +0200
Message-Id: <1351066258-19437-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <1351032689-20431-1-git-send-email-Martin.Jansa@gmail.com>
References: <1351032689-20431-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2] scripts/sstate-sysroot-cruft.sh: add simple script to find files in sysroots not tracked by sstate
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
X-List-Received-Date: Wed, 24 Oct 2012 08:24:17 -0000

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

 scripts/sstate-sysroot-cruft.sh | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100755 scripts/sstate-sysroot-cruft.sh

diff --git a/scripts/sstate-sysroot-cruft.sh b/scripts/sstate-sysroot-cruft.sh
new file mode 100755
index 0000000..7bfb8f4
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
+find ${TMPDIR}/sstate-control -name \*populate-sysroot -o -name \*package | xargs cat | grep sysroots | \
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



