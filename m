Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2F260DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 07:16:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9G7Galj010881
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Oct 2014 00:16:37 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 16 Oct 2014 00:16:36 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 16 Oct 2014 15:16:25 +0800
Message-ID: <ec4a4a3438645872a6c305ef12e6e4c187f62540.1413442931.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1413442931.git.hongxu.jia@windriver.com>
References: <cover.1413442931.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] multilib.bbclass: fix incorrect TARGET_VENDOR in multilib image
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
X-List-Received-Date: Thu, 16 Oct 2014 07:16:40 -0000
Content-Type: text/plain

While building multilib extended images such as libXX-core-image-minimal,
the WORKDIR has the same dir with the building of core-image-minimal.

$ ls tmp/work/qemux86_64-poky-linux/ -al
...
drwxrwxr-x  3 jiahongxu jiahongxu 4096 Oct 13 16:01 core-image-minimal
drwxrwxr-x  3 jiahongxu jiahongxu 4096 Oct 16 11:11 lib32-core-image-minimal
...

While image class is inherited, it did not assign OVERRIDES with
'virtclass-multilib-libXXX', so the reason is variable TARGET_VENDOR was
not override for multilib in that situation.

It refers what did for PN and MLPREFIX, and manually do the multilib
override for TARGET_VENDOR in RecipePreFinalise handler.

[YOCTO #6844]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/multilib.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 6e143dd..2a90d9e 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -21,6 +21,9 @@ python multilib_virtclass_handler () {
     if bb.data.inherits_class('image', e.data):
         e.data.setVar("MLPREFIX", variant + "-")
         e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
+        target_vendor = e.data.getVar("TARGET_VENDOR_" + "virtclass-multilib-" + variant, False)
+        if target_vendor:
+            e.data.setVar("TARGET_VENDOR", target_vendor)
         return
 
     if bb.data.inherits_class('cross-canadian', e.data):
-- 
1.9.1


