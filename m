Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1EEC86060E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 19:36:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBCJasUR004782
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 11:36:54 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Dec 2016 11:36:53 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Dec 2016 14:36:48 -0500
Message-ID: <1481571408-19983-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] systemd: disable 'libdir' QA check
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
X-List-Received-Date: Mon, 12 Dec 2016 19:36:54 -0000
Content-Type: text/plain

When building systemd with multilib support enabled in your build you
will get the following QA warnings (if the 'libdir' QA check is
enabled.)

WARNING: systemd-1_232-r0 do_package_qa: QA Issue: systemd-dbg: found \
 library in wrong location: /lib/systemd/.debug/libsystemd-shared-232.so
systemd: found library in wrong location: /lib/systemd/libsystemd-shared.so
systemd: found library in wrong location: /lib/systemd/libsystemd-shared-232.so [libdir]

Since systemd 231 upstream has included an 'internal' library which
they explicitly place in the application specific /lib/systemd
directory. You can see some of the discussion about this placement
here https://github.com/systemd/systemd/issues/3810

This placement is being picked up by the QA checker since when
multilibs are enabled it expects all libraries to be in lib32 or
lib64. Since the systemd and systemd-dbg packages don't contain any
other libraries we can respect the upstream placement and skip this QA
check for these packages. Unfortunately the QA mechanism doesn't allow
us to specify individual files so this approach is the best we can do.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta/recipes-core/systemd/systemd_232.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
index baee02e..c86badb 100644
--- a/meta/recipes-core/systemd/systemd_232.bb
+++ b/meta/recipes-core/systemd/systemd_232.bb
@@ -485,7 +485,8 @@ RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-genera
                       os-release \
 "
 
-INSANE_SKIP_${PN} += "dev-so"
+INSANE_SKIP_${PN} += "dev-so libdir"
+INSANE_SKIP_${PN}-dbg += "libdir"
 INSANE_SKIP_${PN}-doc += " libdir"
 
 PACKAGES =+ "udev udev-hwdb"
-- 
2.7.4


