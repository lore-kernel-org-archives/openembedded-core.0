Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97AAB708B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 19:14:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s92JEpHs013938
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Oct 2014 12:14:51 -0700 (PDT)
Received: from yow-kscherer-d1.wrs.com (128.224.56.217) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Thu, 2 Oct 2014 12:14:51 -0700
From: Konrad Scherer <konrad.scherer@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Oct 2014 15:14:50 -0400
Message-ID: <1412277290-11352-1-git-send-email-konrad.scherer@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] Makedoc.sh uses home /tmp and fails is noexec is set
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
X-List-Received-Date: Thu, 02 Oct 2014 19:14:55 -0000
Content-Type: text/plain

From: Konrad Scherer <Konrad.Scherer@windriver.com>

The Makedoc.sh script uses the following line to set TMPDIR

export TMPDIR=`mktemp -d ${TMPDIR:-/tmp}/ldt.XXXXXXXXXX`;

and then later in the script:

chmod u+x $TMPDIR/linuxdoc

Since TMPDIR is not set the script will default to /tmp and if /tmp
is set to noexec (which is becoming more common), the chmod call fails.

Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
---
 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
index ed6ab73..9bd2bba 100644
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
@@ -19,3 +19,7 @@ inherit autotools-brokensep native
 do_configure () {
 	oe_runconf
 }
+
+do_install() {
+	oe_runmake TMPDIR=${T} install
+}
-- 
1.9.1


