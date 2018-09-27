Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 001747307F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 05:23:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8R5MQsD011605
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Sep 2018 22:23:21 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 26 Sep 2018 22:22:51 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 27 Sep 2018 13:22:50 +0800
Message-ID: <1538025770-242527-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] sysklogd.inc: add syslogd.8 to ALTERNATIVE_${PN}-doc
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
X-List-Received-Date: Thu, 27 Sep 2018 05:23:47 -0000
Content-Type: text/plain

From: Mark Hatle <mark.hatle@windriver.com>

Other recipes, such as meta-networking inetutils
may also provide a man page for syslogd.8.
Use the alternatives mechanism to select the man
page to display.

This is a partial revert of commit:
988aad01b20c18a8850db0ad6dc547525d94116c

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-extended/sysklogd/sysklogd.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index fc4e67c..c932b20 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://klogd.c;beginline=2;endline=19;md5=7e87ed0ae6142de079bce738c10c899d \
                    "
 
-inherit update-rc.d systemd
+inherit update-rc.d update-alternatives systemd
 
 SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar.gz \
            file://no-strip-install.patch \
@@ -58,6 +58,10 @@ do_install () {
 
 FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/sysklogd.conf', '', d)}"
 
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN}-doc = "syslogd.8"
+ALTERNATIVE_LINK_NAME[syslogd.8] = "${mandir}/man8/syslogd.8"
+
 pkg_prerm_${PN} () {
 	if test "x$D" = "x"; then
 	if test "$1" = "upgrade" -o "$1" = "remove"; then
-- 
2.7.4


