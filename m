Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0CF88600A4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Sep 2013 08:25:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8M8Pw70003392
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Sep 2013 01:25:58 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 22 Sep 2013 01:25:57 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 22 Sep 2013 16:25:55 +0800
Message-ID: <1379838355-19553-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] sstate.bbclass: ignore the tar failure.
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
X-List-Received-Date: Sun, 22 Sep 2013 08:25:57 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

sstate_package creates hardlink from sysroot to SSTATE_BUILDDIR, and
sstate_create_package stores SSTATE_BUILDDIR into a archive file by
tar, these two task can be run simultaneously for different packages,
and make a hardlink for a file will lead to the change of the links
number of file, and if tar is reading this file, it will fail with exit
code 1, and report "file changed as we read it":

    DEBUG: Executing shell function sstate_create_package
    tar: x86_64-linux/usr/share/aclocal/xorg-macros.m4: file changed as we read it

4b3e353a5[sstate.bbclass: fix parallel building issue] tries to use the
tar parameter --ignore-failed-read to fix, but it does not work, and
tar parameter --warning=no-file-changed can close the warning, but can
not change the exit code. so close shell immediate exit, only fail
if tar returns not 1 and 0.

Exit codes of tar:
    http://www.gnu.org/software/tar/manual/html_section/Synopsis.html

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/classes/sstate.bbclass |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 37ade3f..517c100 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -566,7 +566,12 @@ sstate_create_package () {
 	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
 	# Need to handle empty directories
 	if [ "$(ls -A)" ]; then
-		tar --ignore-failed-read -czf $TFILE *
+		set +e
+		tar -czf $TFILE *
+		if [ $? -ne 0 ] && [ $? -ne 1 ]; then
+			exit 1
+		fi
+		set -e
 	else
 		tar -cz --file=$TFILE --files-from=/dev/null
 	fi
-- 
1.7.10.4


