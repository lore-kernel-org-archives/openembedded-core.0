Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EEA8E717E0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 14:45:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s96Ejm2U025120
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Oct 2014 07:45:48 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 6 Oct 2014 07:45:47 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Oct 2014 09:45:46 -0500
Message-ID: <1412606746-83996-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH V2] Makedoc.sh uses home /tmp and fails is noexec is set
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
X-List-Received-Date: Mon, 06 Oct 2014 14:45:47 -0000
Content-Type: text/plain

From: Konrad Scherer <Konrad.Scherer@windriver.com>

The Makedoc.sh script uses the following line to set TMPDIR

export TMPDIR=`mktemp -d ${TMPDIR:-/tmp}/ldt.XXXXXXXXXX`;

and then later in the script:

chmod u+x $TMPDIR/linuxdoc

Since TMPDIR is not set the script will default to /tmp and if /tmp
is set to noexec (which is becoming more common), the chmod call fails.

Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
index ed6ab73..a8a90fc 100644
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
@@ -19,3 +19,7 @@ inherit autotools-brokensep native
 do_configure () {
 	oe_runconf
 }
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' 'TMPDIR=${T}' install
+}
-- 
1.9.3


