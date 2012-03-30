Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SDYbu-0000Jr-En
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 11:59:10 +0200
Received: by wibhj13 with SMTP id hj13so373413wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 02:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=PZOds4Y6kFD0F+AKNDo+wNLOVfPjSULG9WBT5Oietcg=;
	b=T9UAEmse1EqFrfoRwIaL9XMOc74w5vpwSEKU5r6ZKdT5/0nve4UC2eh2gdhk6NjUbw
	w8GIvz0YRiTtUQwScj8QsU8bBFtbSE5+FPo+RPeGS/9gHElthEDOXD66ixZY/l3jXqzU
	FuJ8ovI6ql16rEsFCFsjGdAztWGnH0JiaZ7b4rKCBXAAX4IVRZ9X5WjTbuSYrbAuBltS
	Hemd4WHlyAQ9Lobehp7da1cfwOqkIly0KvKCLRPKjupUIL85ORaG9GzbZ0GT6YutsdgP
	6EHPd1bt/xssZH8qZe92rsYChB7BevOP9bCtvYgf9yI/bTZ2sXpxCwe23UTaLZHGTBMt
	5f9g==
Received: by 10.180.97.41 with SMTP id dx9mr4753200wib.9.1333101006091;
	Fri, 30 Mar 2012 02:50:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 6sm5057261wiz.1.2012.03.30.02.50.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 02:50:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Mar 2012 11:50:01 +0200
Message-Id: <1333101001-13652-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [PATCH] rootfs_ipk: don't echo opkg-cl output to log.do_rootfs
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
X-List-Received-Date: Fri, 30 Mar 2012 09:59:10 -0000

* log_check can find some files with ERR or Fail substring e.g. in "Source: " field

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/rootfs_ipk.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 13bd4bf..8685fa3 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -128,9 +128,11 @@ list_installed_packages() {
 
 get_package_filename() {
 	info=`opkg-cl ${IPKG_ARGS} info $1 | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" || true`
+	set +x
 	name=`echo "${info}" | awk '/^Package/ {printf $2"_"}'`
 	name=$name`echo "${info}" | awk -F: '/^Version/ {printf $NF"_"}' | sed 's/^\s*//g'`
 	name=$name`echo "${info}" | awk '/^Archi/ {print $2".ipk"}'`
+	set -x
 
 	fullname=`find ${DEPLOY_DIR_IPK} -name "$name" || true`
 	if [ "$fullname" = "" ] ; then
-- 
1.7.8.5



