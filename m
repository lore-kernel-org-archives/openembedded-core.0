Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TsrsF-0002Vr-D0
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 10:23:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0997p1t020338
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Jan 2013 01:07:51 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 9 Jan 2013 01:07:50 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Jan 2013 17:07:46 +0800
Message-ID: <1405c68a4d395c6c527340f8f604c6462927662a.1357695564.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1357695564.git.hongxu.jia@windriver.com>
References: <cover.1357695564.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sstate.bbclass:specify function dirs to avoid race
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
X-List-Received-Date: Wed, 09 Jan 2013 09:23:21 -0000
Content-Type: text/plain

Specify dirs in which the shell function "sstate_create_package" and
"sstate_unpack_package" are executed and don't use ${B} as default dirs
to avoid possible race with task do_rootfs at deb image creation time.

[YOCTO #3674]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/sstate.bbclass |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index d544da9..68fd996 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -33,6 +33,11 @@ SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 SSTATEPREINSTFUNCS ?= ""
 SSTATEPOSTINSTFUNCS ?= ""
 
+# Specify dirs in which the shell function is executed and don't use ${B}
+# as default dirs to avoid possible race about ${B} with other task.
+sstate_create_package[dirs] = "${SSTATE_BUILDDIR}"
+sstate_unpack_package[dirs] = "${SSTATE_INSTDIR}"
+
 python () {
     if bb.data.inherits_class('native', d):
         d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH'))
-- 
1.7.10.4



