Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B150B6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0MC3JmJ016218 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:03:19 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NmZyhV15dnZN
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:03:19 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0MC3HLE016207
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:03:18 GMT
Message-ID: <1453464197.27999.195.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jan 2016 12:03:17 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] bitbake.conf: Remove horrible variable expansion hacks
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
X-List-Received-Date: Fri, 22 Jan 2016 12:03:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We used to need these hacks to make things work. Rework the variables to 
remove the horrible hacks and make things slightly less ugly. This does
mean PE and PRAUTO are given default empty values but this is preferred
to the other ugliness.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fba4d17..7451eb8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -189,17 +189,19 @@ ASSUME_PROVIDED = "\
 PN = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'}"
 PV = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}"
 PR = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[2] or 'r0'}"
+PE = ""
 PF = "${PN}-${EXTENDPE}${PV}-${PR}"
-EXTENDPE = "${@['','${PE\x7d_'][int(d.getVar('PE', True) or 0) > 0]}"
+EXTENDPE = "${@['','${PE}_'][int(d.getVar('PE', True) or 0) > 0]}"
 P = "${PN}-${PV}"
 
-EXTENDPRAUTO = "${@['.${PRAUTO\x7d',''][d.getVar('PRAUTO', True) is None]}"
+PRAUTO = ""
+EXTENDPRAUTO = "${@['.${PRAUTO}', ''][not d.getVar('PRAUTO', True)]}"
 PRAUTOINX = "${PF}"
 
 PKGV ?= "${PV}"
 PKGR ?= "${PR}${EXTENDPRAUTO}"
-PKGE ?= "${@['','${PE\x7d'][int(d.getVar('PE', True) or 0) > 0]}"
-EXTENDPKGEVER = "${@['','${PKGE\x7d:'][d.getVar('PKGE', True).strip() != '']}"
+PKGE ?= "${@['','${PE}'][int(d.getVar('PE', True) or 0) > 0]}"
+EXTENDPKGEVER = "${@['','${PKGE}:'][d.getVar('PKGE', True).strip() != '']}"
 EXTENDPKGV ?= "${EXTENDPKGEVER}${PKGV}-${PKGR}"
 
 # Base package name



