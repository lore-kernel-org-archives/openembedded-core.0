Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T3rNV-0000YR-Vp
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 18:32:30 +0200
Received: from mail51-ch1-R.bigfish.com (10.43.68.238) by
	CH1EHSOBE018.bigfish.com (10.43.70.68) with Microsoft SMTP Server id
	14.1.225.23; Tue, 21 Aug 2012 16:20:25 +0000
Received: from mail51-ch1 (localhost [127.0.0.1])	by mail51-ch1-R.bigfish.com
	(Postfix) with ESMTP id AFAF31C050A;
	Tue, 21 Aug 2012 16:20:25 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail51-ch1 (localhost.localdomain [127.0.0.1]) by mail51-ch1
	(MessageSwitch) id 1345566023914797_18451;
	Tue, 21 Aug 2012 16:20:23 +0000 (UTC)
Received: from CH1EHSMHS037.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.240])	by mail51-ch1.bigfish.com (Postfix) with ESMTP id
	DCFB34600EC;	Tue, 21 Aug 2012 16:20:23 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS037.bigfish.com
	(10.43.69.246) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 21 Aug 2012 16:20:22 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Tue, 21 Aug 2012 11:20:21 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q7LGKKRY012361; Tue, 21 Aug 2012 09:20:21 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Aug 2012 11:20:17 -0500
Message-ID: <1345566017-15508-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2] kmod-native_git.bb: fix builds for hosts with older libc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 16:32:30 -0000
Content-Type: text/plain

kmod will fail to build with the following error because O_CLOEXEC is
not defined:

| libkmod/libkmod-module.c: In function 'kmod_module_get_initstate':
| libkmod/libkmod-module.c:1640: error: 'O_CLOEXEC' undeclared (first use in this function)
| libkmod/libkmod-module.c:1640: error: (Each undeclared identifier is reported only once
| libkmod/libkmod-module.c:1640: error: for each function it appears in.)
| libkmod/libkmod-module.c: In function 'kmod_module_get_refcnt':
| libkmod/libkmod-module.c:1754: error: 'O_CLOEXEC' undeclared (first use in this function)
| libkmod/libkmod-module.c: In function 'kmod_module_get_sections':
| libkmod/libkmod-module.c:1913: error: 'O_CLOEXEC' undeclared (first use in this function)
| libkmod/libkmod-file.c: In function 'kmod_file_open':
| libkmod/libkmod-file.c:282: error: 'O_CLOEXEC' undeclared (first use in this function)
| libkmod/libkmod-file.c:282: error: (Each undeclared identifier is reported only once
| libkmod/libkmod-file.c:282: error: for each function it appears in.)

Since we are only using kmod-native for depmod, and it's a non-threaded
user of this libary being built this should be safe to override O_CLOEXEC.

Keep in mind this is ONLY effecting the native builds and not what is
being shipped in the root file system.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-kernel/kmod/kmod-native_git.bb |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-kernel/kmod/kmod-native_git.bb
index 96de8b8..4558c7b 100644
--- a/meta/recipes-kernel/kmod/kmod-native_git.bb
+++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
@@ -4,7 +4,7 @@
 require kmod.inc
 inherit native
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 do_install_append (){
 	for tool in depmod insmod lsmod modinfo modprobe rmmod
@@ -12,3 +12,9 @@ do_install_append (){
 		ln -s kmod ${D}${bindir}/$tool
 	done
 }
+
+do_configure_prepend (){
+	if ! grep O_CLOEXEC -r ${includedir_native}/bits/fcntl.h; then
+		export CFLAGS="$CFLAGS -D O_CLOEXEC=0"
+	fi
+}
-- 
1.7.9.7




