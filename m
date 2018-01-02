Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 42FD46076F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 17:24:31 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w02HOU6d019366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 2 Jan 2018 17:24:31 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eWQIg-0005ep-Mi; Tue, 02 Jan 2018 17:24:30 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jan 2018 17:24:27 +0000
Message-Id: <1514913867-21709-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] runqemu: Add workaround for APIC hang on pre 4.15 kernels on qemux86
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
X-List-Received-Date: Tue, 02 Jan 2018 17:24:32 -0000

On pre 4.15 host kernels, an APIC window emulation bug can cause qemu
to hang. On 64 bit we can use the x2apic, for 32 bit, we just have to
disable the other timer sources and rely on kvm-clock.

[YOCTO #12301]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index f2b4b3c..d998494 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -510,6 +510,11 @@ class BaseConfig(object):
 
         if os.access(dev_kvm, os.W_OK|os.R_OK):
             self.qemu_opt_script += ' -enable-kvm'
+            if self.get('MACHINE') == "qemux86":
+                # Workaround for broken APIC window on pre 4.15 host kernels which causes boot hangs
+                # See YOCTO #12301
+                # On 64 bit we use x2apic
+                self.kernel_cmdline_script += " clocksource=kvm-clock hpet=disable noapic nolapic"
         else:
             logger.error("You have no read or write permission on /dev/kvm.")
             logger.error("Please change the ownership of this file as described at:")
-- 
2.7.4


