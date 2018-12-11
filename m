Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF2746C0DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 08:49:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBB8nDn7025572
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 00:49:13 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 11 Dec 2018 00:48:54 -0800
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <bruce.ashfield@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Dec 2018 03:49:03 -0500
Message-ID: <1544518143-173850-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [yocto-kernel-tools][PATCH] tools/kconf_check: modify grep pattern
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
X-List-Received-Date: Tue, 11 Dec 2018 08:49:12 -0000
Content-Type: text/plain

The cmd line, <grep '^[  ]*\(menu\)*config '>, can't
match all expect config options.

This is because that it is not always space after 'config'
in kernel-source/*/.../Kconfig.
e.g. "config  IP_VS_IPV6" in net/netfilter/ipvs/Kconfig

So we should change the cmd to grep '^[  ]*\(menu\)*config\s'.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 tools/kconf_check | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/kconf_check b/tools/kconf_check
index aa86180..20b49cd 100755
--- a/tools/kconf_check
+++ b/tools/kconf_check
@@ -241,7 +241,7 @@ find ${kernel_source} \
 # known list of all Kconfig* files.  Again, must filter dups.
 rm -f ${LOGDIR}/all.cfg
 for i in `cat ${LOGDIR}/all.kcf` ; do
-    cat ${kernel_source}/$i | grep '^[ 	]*\(menu\)*config ' | \
+    cat ${kernel_source}/$i | grep '^[ 	]*\(menu\)*config\s' | \
 	awk '{print "CONFIG_"$2}' >> ${LOGDIR}/all.cfg
 done
 mv -f ${LOGDIR}/all.cfg ${LOGDIR}/all.cfg~
-- 
2.8.1


