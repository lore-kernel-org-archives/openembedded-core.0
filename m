Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S0ZuV-0001fg-KI
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 15:44:43 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NEmA2A003026 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:48:10 GMT
X-Quarantine-ID: <d+gVmUcvFLEK>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id d+gVmUcvFLEK
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:48:10 +0000 (GMT)
Received: from ted (ted.config [192.168.1.68]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NEm8Vm003016
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:48:09 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S0Yse-0004Pj-I0
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 13:38:45 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:38:15 +0000
Message-Id: <d5a69399aef26eb53512377b74a23a044f44f305.1330004039.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
References: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
References: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 06/16] libgcrypt: Fix unpackaged file warning
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
X-List-Received-Date: Thu, 23 Feb 2012 14:44:43 -0000

WARNING: For recipe libgcrypt, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/sbin

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 088cd34..a890188 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -21,6 +21,9 @@ EXTRA_OECONF = "--without-pth --disable-asm --with-capabilities"
 do_install_append() {
 	install -d ${D}/${libdir}/pkgconfig
 	install -m 0644 ${S}/src/libgcrypt.pc ${D}/${libdir}/pkgconfig/
+	
+	# Remove empty sbin directory since we don't build the daemon that would install there
+	rmdir ${D}${sbindir}
 }
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.5.4



