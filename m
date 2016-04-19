Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DBD5960110
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 15:01:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3JF1D7Z001685
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 08:01:13 -0700 (PDT)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Apr 2016 08:01:12 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Apr 2016 10:01:11 -0500
Message-ID: <1461078071-150167-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] image.bbclass: The wrong name is being used for the debug filesystem
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
X-List-Received-Date: Tue, 19 Apr 2016 15:01:13 -0000
Content-Type: text/plain

[YOCTO #9487]

The debug filesystem file name is ending in "debug_tar", it should be simply
"tar".  Strip the "debug_" piece as necessary.

To avoid deleting the tar ball, when we've asked for just the tarball we need
to check 't' and not 'realt'.

The two hunks were suggested by RP.  I've implemented and verify they work
with the settings:

PACKAGE_CLASSES = "package_rpm"
IMAGE_GEN_DEBUGFS = '1'

IMAGE_FSTYPES_DEBUGFS = "tar.bz2"

IMAGE_FSTYPES_DEBUGFS = "tar.gz"

and

IMAGE_FSTYPES_DEBUGFS = "tar"

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/image.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index f471f1a..8bfd241 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -393,6 +393,8 @@ python () {
             for ctype in ctypes:
                 if bt.endswith("." + ctype):
                     type = bt[0:-len(ctype) - 1]
+                    if type.startswith("debugfs_"):
+                        type = type[8:]
                     # Create input image first.
                     gen_conversion_cmds(type)
                     localdata.setVar('type', type)
@@ -406,7 +408,7 @@ python () {
             gen_conversion_cmds(bt)
 
         localdata.setVar('type', realt)
-        if realt not in alltypes:
+        if t not in alltypes:
             rm_tmp_images.add(localdata.expand("${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"))
         else:
             subimages.append(realt)
-- 
2.5.5


