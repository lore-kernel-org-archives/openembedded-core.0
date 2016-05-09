Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CFCE070031
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 13:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u49D9drS015909 for <openembedded-core@lists.openembedded.org>;
	Mon, 9 May 2016 14:09:39 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QSFzQRV5kzDR
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 14:09:39 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u49D9biq015905
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 May 2016 14:09:38 +0100
Message-ID: <1462799377.21831.137.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 09 May 2016 14:09:37 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] image: Fix IMAGE_FEATURES determinism issue
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
X-List-Received-Date: Mon, 09 May 2016 13:09:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

remain_features uses a dict which means the order is not deterministic. This
can lead to the task hash changing depending on the state of the memory at
parse time. This is particularly noticeable under python v3.

Since the dict is helpful in constructing the data, pass the data through 
sort() so the order is always deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 1fb1964..a1772ad 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -166,7 +166,7 @@ python () {
         if temp:
             bb.fatal("%s contains conflicting IMAGE_FEATURES %s %s" % (d.getVar('PN', True), feature, ' '.join(list(temp))))
 
-    d.setVar('IMAGE_FEATURES', ' '.join(list(remain_features)))
+    d.setVar('IMAGE_FEATURES', ' '.join(sorted(list(remain_features))))
 
     check_image_features(d)
     initramfs_image = d.getVar('INITRAMFS_IMAGE', True) or ""



