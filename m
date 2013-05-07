Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UZhj3-0007kh-TE
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 15:14:41 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47CwgdE005214; Tue, 7 May 2013 13:58:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KlPD-iFKm-U3; Tue,  7 May 2013 13:58:51 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r47Cwe4x005196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 7 May 2013 13:58:41 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UZhRI-0005ch-GV; Tue, 07 May 2013 13:56:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 13:56:06 +0100
Message-Id: <1367931368-21504-14-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1367931368-21504-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 14/15] bitbake.conf: Use casting to ensure valid comparision
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
X-List-Received-Date: Tue, 07 May 2013 13:15:41 -0000

python3 is stricter about type comparisions so add an explicit cast to int()
to ensure this code is portable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d5e923b..8d4ccce 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -188,7 +188,7 @@ PV = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[1] or '1.0'}"
 PR = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[2] or 'r0'}"
 PRINC ?= "0"
 PF = "${PN}-${EXTENDPE}${PV}-${PR}"
-EXTENDPE = "${@['','${PE\x7d_'][d.getVar('PE',1) > 0]}"
+EXTENDPE = "${@['','${PE\x7d_'][int(d.getVar('PE',1) or 0) > 0]}"
 P = "${PN}-${PV}"
 
 EXTENDPRAUTO = "${@['.${PRAUTO\x7d',''][d.getVar('PRAUTO',1) is None]}"
@@ -196,7 +196,7 @@ PRAUTOINX = "${PF}"
 
 PKGV ?= "${PV}"
 PKGR ?= "${PR}${EXTENDPRAUTO}"
-PKGE ?= "${@['','${PE\x7d'][d.getVar('PE',1) > 0]}"
+PKGE ?= "${@['','${PE\x7d'][int(d.getVar('PE',1) or 0) > 0]}"
 EXTENDPKGEVER = "${@['','${PKGE\x7d:'][d.getVar('PKGE',1).strip() != '']}"
 EXTENDPKGV ?= "${EXTENDPKGEVER}${PKGV}-${PKGR}"
 
-- 
1.7.10.4



