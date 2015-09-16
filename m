Return-Path: <patrick@stwcx.xyz>
X-Greylist: delayed 922 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 16 Sep 2015 17:04:15 UTC
Received: from sender163-mail.zoho.com (sender1.zohomail.com [74.201.84.157])
	by mail.openembedded.org (Postfix) with ESMTP id A41877404E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:04:15 +0000 (UTC)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
	[108.215.4.10]) by mx.zohomail.com
	with SMTPS id 1442422131590783.9648419227793;
	Wed, 16 Sep 2015 09:48:51 -0700 (PDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Sep 2015 11:48:44 -0500
Message-Id: <1442422124-27290-1-git-send-email-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.4.4
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_02095_0
X-ZohoMail-Owner: <1442422124-27290-1-git-send-email-patrick@stwcx.xyz>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 108.215.4.10
X-Zoho-Virus-Status: 2
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH] image.py: Ensure base image size is an integer
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
X-List-Received-Date: Wed, 16 Sep 2015 17:04:15 -0000

There is a floating point multiplication done of a base image size
and an "overhead factor", which is currently rounded up to the next
integer.  If the multiplication results in a whole number, the value
will still be a float.  When this float is used to generate a shell
script, a buggy script is generated.

Fix this by always forcing to an integer.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta/lib/oe/image.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index 2361955..f9e9bfd 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -172,6 +172,8 @@ class Image(ImageDepGraph):
 
         if base_size != int(base_size):
             base_size = int(base_size + 1)
+        else:
+            base_size = int(base_size)
 
         base_size += rootfs_alignment - 1
         base_size -= base_size % rootfs_alignment
-- 
2.4.4



