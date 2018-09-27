Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 52AC47477A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 18:17:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8RIHxTq022726
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 11:18:00 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 27 Sep 2018 11:17:46 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Sep 2018 14:17:46 -0400
Message-ID: <20180927181746.145973-1-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.16.0.rc2
MIME-Version: 1.0
Subject: [PATCH v2] sysklogd: Re-enable alternatives for syslogd.8 man page
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
X-List-Received-Date: Thu, 27 Sep 2018 18:17:59 -0000
Content-Type: text/plain

Other recipes, such as meta-networking inetutils may also provide a man page
for syslogd.8.  Use the alternatives mechanism to select the man page to
display.

This is a partial revert of commit: 988aad01b20c18a8850db0ad6dc547525d94116c

The syslogd tool itself is provided by both recipes in their respective runtime
packages.  In the inet case, it is inetutils-syslogd, which has an appropriate
RCONFLICTS with the syslogd version.  Only one or the other will be installed.
This is the conflict resolution the original commit of
"988aad01b20c18a8850db0ad6dc547525d94116c" was referring to.

HOWEVER, both syslogd and inetutils each only have a singular 'doc' package.
(As do most packages it seems.)  Since this is the case, if both syslogd and
inetutils (not syslogd part) is requested for a configuration -- AND ---
doc-pkgs are configured in, you get an error of conflicting files.

Now does the documentation match whichever package was installed, maybe not...
but this isn't a big deal as it turns out, since most syslogd share a common set
of arguments and those are the things a run-time user would query from the man
pages.

The only alternative is to start spliting up the docs into their relevant
subpackages, as we have the runtime items.  But this then complicates the
doc-pkgs processing and related...

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/sysklogd/sysklogd.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index fc4e67c..f151dd8 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://klogd.c;beginline=2;endline=19;md5=7e87ed0ae6142de079bce738c10c899d \
                    "
 
-inherit update-rc.d systemd
+inherit update-rc.d update-alternatives systemd
 
 SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar.gz \
            file://no-strip-install.patch \
@@ -58,6 +58,11 @@ do_install () {
 
 FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/sysklogd.conf', '', d)}"
 
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN}-doc = "syslogd.8"
+ALTERNATIVE_LINK_NAME[syslogd.8] = "${mandir}/man8/syslogd.8"
+
 pkg_prerm_${PN} () {
 	if test "x$D" = "x"; then
 	if test "$1" = "upgrade" -o "$1" = "remove"; then
-- 
1.8.3.1


