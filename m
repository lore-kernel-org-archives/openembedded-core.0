Return-Path: <Shiqun.Lin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 13E1C60232
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 02:29:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB42TFC5019679
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Dec 2014 18:29:15 -0800 (PST)
Received: from [128.224.162.144] (128.224.162.144) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 3 Dec 2014 18:29:14 -0800
Message-ID: <547FC6F9.3050609@windriver.com>
Date: Thu, 4 Dec 2014 10:29:13 +0800
From: "Shiqun.Lin" <Shiqun.Lin@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] improve the sanity check for PATH and BBPATH
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
X-List-Received-Date: Thu, 04 Dec 2014 02:29:17 -0000
X-Groupsio-MsgNum: 60154
Content-Type: multipart/mixed; boundary="------------070901020300000007070708"

--------------070901020300000007070708
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



--------------070901020300000007070708
Content-Type: text/x-patch;
	name="0001-improve-the-sanity-check-for-PATH-and-BBPATH.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-improve-the-sanity-check-for-PATH-and-BBPATH.patch"

From 583f97149ed3122e7b196f08c6bceca9d5a4961c Mon Sep 17 00:00:00 2001
From: Shiqun Lin <Shiqun.Lin@windriver.com>
Date: Thu, 4 Dec 2014 09:50:18 +0800
Subject: [PATCH] improve the sanity check for PATH and BBPATH

Issue: LIN5-19447, Build fails if "./" is in the PATH

a customer was using "./" in his PATH, and this breaks the build.

$ export PATH="./:$PATH"
$ make -C build-tools elfutils

Signed-off-by: Shiqun Lin <Shiqun.Lin@windriver.com>
---
 meta/classes/sanity.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c2e7bee..1ade542 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -388,15 +388,15 @@ def check_sanity(sanity_data):
             messages = messages + "qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH"
 
     paths = sanity_data.getVar('PATH', True).split(":")
-    if "." in paths or "" in paths:
-        messages = messages + "PATH contains '.' or '', which will break the build, please remove this."
+    if "." in paths or "./" in paths or "" in paths:
+        messages = messages + "PATH contains '.', './' or '', which will break the build, please remove this."
 
     bbpaths = sanity_data.getVar('BBPATH', True).split(":")
-    if "." in bbpaths or "" in bbpaths:
+    if "." in bbpaths or "./" in bbpaths or "" in bbpaths:
         # TODO: change the following message to fatal when all BBPATH issues
         # are fixed
         bb.warn("BBPATH references the current directory, either through "    \
-                "an empty entry, or a '.'.\n\t This is unsafe and means your "\
+                "an empty entry, a './', or a '.'.\n\t This is unsafe and means your "\
                 "layer configuration is adding empty elements to BBPATH.\n\t "\
                 "Please check your layer.conf files and other BBPATH "        \
                 "settings to remove the current working directory "           \
-- 
1.8.5.2.233.g932f7e4


--------------070901020300000007070708--
