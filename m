Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UO9i7-0007Vo-3j
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 18:42:06 +0200
Received: by mail-wg0-f41.google.com with SMTP id y10so1940766wgg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 09:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=TgyTiVN+55rFd8gxJ1EMaqmaqGgJGrGH2GIWeKFQorg=;
	b=MMI5iJQyc1NNAxJgLOq6UZuBa3RyuHVhYW+0xMbzRKdJ00Zl/ZYMqPAVC8K4J3GPIw
	xvMq91iw08Ly5pd5yWdQoj/DjO64ciCp6wjqBmVJVX5B66vcpXYOwhiVnT98g5oEhsJq
	1R5SNEHGUK3F3ZlbQlGDn2jM/HlFlOwVnOMjm6MKQFozSKDrHPXM1WeXEyJWrX1rXHIl
	mRRVmT9YqQS0Lm/cviwPAWzPWyccwUDSp9XQd+MsVmunpyW91bK6YbHRCVal4m4wk73m
	wpKgSsRb1kCkGsK0LfQfN5B+HDnHUAxD6H33dDe8GGX3oFF+RXsyH8R3JCIrtHZGzSvt
	F23Q==
X-Received: by 10.180.72.228 with SMTP id g4mr5296275wiv.22.1365179080809;
	Fri, 05 Apr 2013 09:24:40 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j4sm4616376wiz.10.2013.04.05.09.24.39
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 09:24:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2013 17:21:56 +0100
Message-Id: <1365178916-3790-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQklEKv6F+hANUDqIXlSCsJ1Gpz2639ZngGwOH+DikSujJovwVwaY1fs2ViuecNa+GSVfQCz
Subject: [PATCH] runqemu: add a seriallog option
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
X-List-Received-Date: Fri, 05 Apr 2013 16:42:08 -0000

Similar to serial, but this will write everything that is output on the console
to the specified file.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/runqemu |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 8ed1226..3db2cf5 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -32,6 +32,7 @@ usage() {
     echo "  Simplified QEMU command-line options can be passed with:"
     echo "    nographic - disables video console"
     echo "    serial - enables a serial console on /dev/ttyS0"
+    echo "    seriallog=/path/to/output - writes the console output to this file"
     echo "    kvm - enables KVM when running qemux86/qemux86-64 (VT-capable CPU required)"
     echo "    publicvnc - enable a VNC server open to all hosts"
     echo "  qemuparams=\"xyz\" - specify custom parameters to QEMU"
@@ -148,6 +149,11 @@ while true; do
             SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
             SERIALSTDIO="1"
             ;;
+        "seriallog="*)
+            SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -serial file:${arg##seriallog=}"
+            SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0 console=tty"
+            SERIALSTDIO="1"
+            ;;
         "qemuparams="*)
             SCRIPT_QEMU_EXTRA_OPT="${arg##qemuparams=}"
 
-- 
1.7.10.4



