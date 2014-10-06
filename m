Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 421176FC68
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 14:05:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s96E5ALJ024618
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Oct 2014 07:05:10 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 6 Oct 2014 07:05:09 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Oct 2014 09:05:08 -0500
Message-ID: <1412604308-11100-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] package_ipk.bbclass: Fix SRC_URI whitespace handling
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
X-List-Received-Date: Mon, 06 Oct 2014 14:05:13 -0000
Content-Type: text/plain

The SRC_URI may contain whitespace, but be otherwise empty.  This can happen
in the case:

MYSRC = ""
MYSRC_arm = "file://myarm.patch"
SRC_URI += "${MYSRC}"

Unless we strip blank spaces, to determine if it is empty, we can end up
generating a "Source: " line which in invalid.  This leads to the error:

  invalid Source: field is speified in the generated CONTROL file

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 9586e06..44fd3eb 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -207,7 +207,7 @@ python do_package_ipk () {
             ctrlfile.write("Replaces: %s\n" % bb.utils.join_deps(rreplaces))
         if rconflicts:
             ctrlfile.write("Conflicts: %s\n" % bb.utils.join_deps(rconflicts))
-        src_uri = localdata.getVar("SRC_URI", True) or "None"
+        src_uri = localdata.getVar("SRC_URI", True).strip() or "None"
         if src_uri:
             src_uri = re.sub("\s+", " ", src_uri)
             ctrlfile.write("Source: %s\n" % " ".join(src_uri.split()))
-- 
1.9.3


