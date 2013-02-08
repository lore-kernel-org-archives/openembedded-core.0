Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3mEX-0005F2-FC
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 12:35:09 +0100
Received: by mail-wg0-f44.google.com with SMTP id dr12so2791564wgb.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 03:19:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=FcnQhpGlAhS14yf8hE9Ki7DHB+KSKAJEkKNGeG0TW6w=;
	b=oZPj5D9/cGfBQtGePoIa6cgktMcqqnG0kfglQ7polbHj5CG7FT+ASUlRHkPa2W3fRz
	5KUpANgQ7lofnaTt3x7s7Mc7WQcs/+DhlAqS6DKa17AuEfDoyhyzx285rghX3X6bFivt
	TJ/ejm0I2K5FXZiSxKc36Y3d43MnzGKbm+93Dn9hSHQ2ZebQhSc2F1qyZlTeKq8zZ2IG
	ipjSxCwRBK6YvMuA2hwA6+8xCMFhKRXtMGMn50ipbXUTSBdTDS3Wy9FClyFzN+/PKbZp
	+Cn4ND9Mgt20WKblUPOMmpFCFfEkzV9IztDa0G5Fy9JSx81swBHqgMeZonZw0Azuv72E
	6wzQ==
X-Received: by 10.194.23.37 with SMTP id j5mr8916429wjf.28.1360322355808;
	Fri, 08 Feb 2013 03:19:15 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id b10sm13666718wix.7.2013.02.08.03.19.14
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 03:19:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 11:17:05 +0000
Message-Id: <1360322225-25075-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlhf2/YZrm+6szLn2eKFD5C46mnUwpaG0gt8bZylzGQ91kyStzAIHKaVjap4OaYmUP0DX46
Subject: [PATCH] runqemu: add option to make the VNC server publically available
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
X-List-Received-Date: Fri, 08 Feb 2013 11:35:09 -0000

If the qemu is running on a headless machine, a VNC server that only allows
connections from localhost isn't too useful.

Add a "vncpublic" option to bind a VNC server to 0.0.0.0, so it's publically
available.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/runqemu |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index c20c8dd..6c2a684 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -33,6 +33,7 @@ usage() {
     echo "    nographic - disables video console"
     echo "    serial - enables a serial console on /dev/ttyS0"
     echo "    kvm - enables KVM when running qemux86/qemux86-64 (VT-capable CPU required)"
+    echo "    publicvnc - enable a VNC server open to all hosts"
     echo "  qemuparams=\"xyz\" - specify custom parameters to QEMU"
     echo "  bootparams=\"xyz\" - specify custom kernel parameters during boot"
     echo ""
@@ -172,6 +173,9 @@ while true; do
             KVM_ENABLED="yes"
             KVM_CAPABLE=`grep -q 'vmx\|svm' /proc/cpuinfo && echo 1`
             ;;
+        "publicvnc")
+            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -vnc 0.0.0.0:0"
+            ;;
         "") break ;;
         *)
             # A directory name is an nfs rootfs
-- 
1.7.10.4



