Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7TRf-0005Hd-An
	for openembedded-core@openembedded.org; Tue, 13 Mar 2012 16:15:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2DF6hQw028153
	for <openembedded-core@openembedded.org>; Tue, 13 Mar 2012 15:06:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27877-02 for <openembedded-core@openembedded.org>;
	Tue, 13 Mar 2012 15:06:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2DF6YNC028146
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@openembedded.org>; Tue, 13 Mar 2012 15:06:35 GMT
Message-ID: <1331651195.17122.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@openembedded.org>
Date: Tue, 13 Mar 2012 15:06:35 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] xf86-video-vmware: Fix unpackaged driectory warning
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Mar 2012 15:15:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Fixes the warning:

WARNING: For recipe xf86-video-vmware, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/bin

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_11.0.3.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_11.0.3.bb
index e77c918..9dc5e61 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_11.0.3.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_11.0.3.bb
@@ -9,9 +9,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5fcd7d437a959a15fbee8707747c6b53"
 DEPENDS += "virtual/libx11 libxvmc drm glproto \
 	    virtual/libgl xineramaproto libpciaccess"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
 
 SRC_URI[md5sum] = "579bee487309b1bdc8329bf627d43413"
 SRC_URI[sha256sum] = "b24a7cb2d87e416561e25122eab2cd48fc64a2ba105238456eefef16f29f38a3"
+
+do_install_append () {
+	# Remove useless empty directory
+	rmdir ${D}${bindir}
+}




