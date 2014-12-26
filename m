Return-Path: <holger@moiji-mobile.com>
X-Greylist: delayed 378 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 26 Dec 2014 11:16:48 UTC
Received: from mail.sysmocom.de (mail.sysmocom.de [144.76.43.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFD1601D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 11:16:48 +0000 (UTC)
Received: from sangmingze-mail.local (unknown
	[IPv6:2001:67c:20a1:1192:864b:f5ff:fe2a:8297])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 7059795B97
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 11:10:26 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=sangmingze-mail.local)
	by sangmingze-mail.local with esmtp (Exim 4.84)
	(envelope-from <holger@moiji-mobile.com>) id 1Y4Smh-0004v7-AM
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Dec 2014 12:10:19 +0100
From: Holger Hans Peter Freyther <holger@moiji-mobile.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Dec 2014 12:08:58 +0100
Message-Id: <1419592139-18830-1-git-send-email-holger@moiji-mobile.com>
X-Mailer: git-send-email 2.1.3
Subject: [PATCH 1/2] diffutils: Disable searching for libsigsegv
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
X-List-Received-Date: Fri, 26 Dec 2014 11:16:56 -0000

After building GNU Smalltalk libsigsegv is in the sysroot
and will be picked-up by diffutils. This lead to the below
warning:

WARNING: QA Issue: m4 rdepends on libsigsegv, but it isn't a build dependency? [build-deps]
---
 meta/recipes-devtools/diffstat/diffstat_1.59.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.59.bb b/meta/recipes-devtools/diffstat/diffstat_1.59.bb
index f599622..c64eb7f 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.59.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.59.bb
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "267d1441b8889cbefbb7ca7dfd4a17f6c8bc73bc114904c74ecad945a3
 
 S = "${WORKDIR}/diffstat-${PV}"
 
+EXTRA_OECONF += "--without-libsigsegv-prefix"
+
 inherit autotools gettext ptest
 
 do_configure () {
-- 
2.1.3


