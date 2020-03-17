Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 475AE60B46
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 15:27:02 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id g62so22503652wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 08:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=yZbatRajxbZKSjnz28vUau1UaAS15g1s59vKVjIURRg=;
	b=GIqzvfu6Zpd5zwmZbLhG80YpqInLOmcpVKl8yCakQ3DstVjhNlZr/C4p/UAJtmP8mH
	ji4tjsS9mO/gEehFr5h0uIVG+uRVCBVR5Pv2pcoUBzJwyPaFwJun3TYtt5I2pfJlNzYN
	eJMIjlbaRU8HewswJQhK8yYgLEJZMxNgfvknos4E6RvaPBc5V/djLf8DdmYchlWT2OKd
	w9diF6fT9gpUzLOw/far9RpMcZa0wISbpJMTRfIzXAHPFbC7Yus8/1Sm/86ohoQB0Pop
	PPvb6le99TwUToUlXNRAF5O0GQxBATlqTgFh1/QfvlfEvk5Q10qfm943LsyBCA1/sfOM
	mj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yZbatRajxbZKSjnz28vUau1UaAS15g1s59vKVjIURRg=;
	b=ejzuTXEFJpyPCgjhA0Mgo+7tsEMtG4V91HXnk8TpCkmddMnWo5v8CNNcD5T2C/+Csh
	wLqN0vRPfv0F0GAuYUymQIlNtZF/EKuiY5KYih+EDh9+UVEdqbI0XwFs20TcFSRaiDH6
	GMyGAu2F7e+SuuxJDasNFfvcMXWT4b4KlP7YxRv70a8CvkS3YG9iBl7I2uE5HGZPEZew
	RwgDquLwANcxPK4YpQXLi9+c8w5zYaj/YTnwycbvVA9R8z0ZYVyIb8ZCT00ldG3bRE0v
	XCd40EcL/EmFapvh4uiqFknWKCnNc1nobtoMJFZJLukEKJ9cNxxJn0o6jJM17tpmT642
	pOhw==
X-Gm-Message-State: ANhLgQ2DUnpSO4gWiLV14x3XAH6r6hs0aR6GjO02AbMBoeKDWJKspIga
	aOw+qxtYOW8RZcwNjRxULQIYzYPm
X-Google-Smtp-Source: ADFU+vufs4j9B1RN1Uhuz+LJbxxlbhus++gQaS61kLNw/UV8DlDP8ZLFyKDTkXy4Js0N6d4lsiMS1w==
X-Received: by 2002:a1c:f214:: with SMTP id s20mr5615097wmc.57.1584458822283; 
	Tue, 17 Mar 2020 08:27:02 -0700 (PDT)
Received: from wsadrian2.lan.ffah.ch (c-82-192-240-69.customer.ggaweb.ch.
	[82.192.240.69])
	by smtp.gmail.com with ESMTPSA id q8sm371249wrc.8.2020.03.17.08.27.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 08:27:01 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 16:26:50 +0100
Message-Id: <20200317152650.2131885-2-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317152650.2131885-1-adrian.freihofer@gmail.com>
References: <20200317152650.2131885-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 1/1] runqemu: support multiple NICs
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
X-List-Received-Date: Tue, 17 Mar 2020 15:27:02 -0000
Content-Transfer-Encoding: 8bit

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Emulating more than one network interface with runqemu is a bit tricky,
but possible. For example, the following leads to an emulated device with
eth0 and eth1:

QB_NETWORK_DEVICE_prepend = " \
    -device virtio-net-device,mac=52:54:00:12:34:03 \
"

or

QB_NETWORK_DEVICE_append = " \
    -device virtio-net-pci,mac=52:54:00:12:34:03 \
"

When booting Qemu with two NICs, the kernel does not know which
interface the specified ip=192.168.7.... command line argument
should be applied. This delays the boot process for a very long
time and a guest wihtout IP configuration.

This add two new configuraton parameters to runqemu:
QB_CMDLINE_IP_SLIRP and QB_CMDLINE_IP_TAP to explicitely specify the ip=
kernel command line arguments for tap and slirp mode.

Note: Simply adding "::eth0" broke some builds on the Yocto autobuilder.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes/qemuboot.bbclass | 14 ++++++++++++++
 scripts/runqemu               | 16 ++++++++++++----
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 15a9e63f2b..54044c38da 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -36,6 +36,9 @@
 #                    Note, runqemu will replace @MAC@ with a predefined mac, you can set
 #                    a custom one, but that may cause conflicts when multiple qemus are
 #                    running on the same host.
+#                    Note: If more than one interface of type -device virtio-net-device gets added,
+#                          QB_NETWORK_DEVICE_prepend might be used, since Qemu enumerates the eth*
+#                          devices in reverse order to -device arguments.
 #
 # QB_TAP_OPT: netowrk option for 'tap' mode, e.g.,
 #             "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
@@ -43,6 +46,15 @@
 #
 # QB_SLIRP_OPT: network option for SLIRP mode, e.g., -netdev user,id=net0"
 #
+# QB_CMDLINE_IP_SLIRP: If QB_NETWORK_DEVICE adds more than one network interface to qemu, usually the
+#                      ip= kernel comand line argument needs to be changed accordingly. Details are documented
+#                      in the kernel docuemntation https://www.kernel.org/doc/Documentation/filesystems/nfs/nfsroot.txt
+#                      Example to configure only the first interface: "ip=eth0:dhcp"
+# QB_CMDLINE_IP_TAP: This parameter is similar to the QB_CMDLINE_IP_SLIRP parameter. Since the tap interface requires
+#                    static IP configuration @CLIENT@ and @GATEWAY@ place holders are replaced by the IP and the gateway
+#                    address of the qemu guest by runqemu.
+#                    Example: "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0::eth0"
+#
 # QB_ROOTFS_OPT: used as rootfs, e.g.,
 #               "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
 #              Note, runqemu will replace "@ROOTFS@" with the one which is used, such as core-image-minimal-qemuarm64.ext4.
@@ -63,6 +75,8 @@ QB_DEFAULT_KERNEL ?= "${KERNEL_IMAGETYPE}"
 QB_DEFAULT_FSTYPE ?= "ext4"
 QB_OPT_APPEND ?= "-show-cursor"
 QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
+QB_CMDLINE_IP_SLIRP ?= "ip=dhcp"
+QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0"
 
 # This should be kept align with ROOT_VM
 QB_DRIVE_TYPE ?= "/dev/sd"
diff --git a/scripts/runqemu b/scripts/runqemu
index dd0aa4b28f..6f24093d77 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -185,6 +185,8 @@ class BaseConfig(object):
         self.vmtypes = ('hddimg', 'iso')
         self.fsinfo = {}
         self.network_device = "-device e1000,netdev=net0,mac=@MAC@"
+        self.cmdline_ip_slirp = "ip=dhcp"
+        self.cmdline_ip_tap = "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0"
         # Use different mac section for tap and slirp to avoid
         # conflicts, e.g., when one is running with tap, the other is
         # running with slirp.
@@ -1032,7 +1034,9 @@ class BaseConfig(object):
 
         if self.fstype == 'nfs':
             self.setup_nfs()
-        self.kernel_cmdline_script += ' ip=dhcp'
+        netconf = " " + self.cmdline_ip_slirp
+        logger.info("Network configuration:%s", netconf)
+        self.kernel_cmdline_script += netconf
         # Port mapping
         hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
         qb_slirp_opt_default = "-netdev user,id=net0%s,tftp=%s" % (hostfwd, self.get('DEPLOY_DIR_IMAGE'))
@@ -1147,9 +1151,11 @@ class BaseConfig(object):
         client = gateway + 1
         if self.fstype == 'nfs':
             self.setup_nfs()
-        netconf = "192.168.7.%s::192.168.7.%s:255.255.255.0" % (client, gateway)
-        logger.info("Network configuration: %s", netconf)
-        self.kernel_cmdline_script += " ip=%s" % netconf
+        netconf = " " + self.cmdline_ip_tap
+        netconf = netconf.replace('@CLIENT@', str(client))
+        netconf = netconf.replace('@GATEWAY@', str(gateway))
+        logger.info("Network configuration:%s", netconf)
+        self.kernel_cmdline_script += netconf
         mac = "%s%02x" % (self.mac_tap, client)
         qb_tap_opt = self.get('QB_TAP_OPT')
         if qb_tap_opt:
@@ -1171,8 +1177,10 @@ class BaseConfig(object):
         if self.net_bridge:
             self.setup_net_bridge()
         elif self.slirp_enabled:
+            self.cmdline_ip_slirp = self.get('QB_CMDLINE_IP_SLIRP') or self.cmdline_ip_slirp
             self.setup_slirp()
         else:
+            self.cmdline_ip_tap = self.get('QB_CMDLINE_IP_TAP') or self.cmdline_ip_tap
             self.setup_tap()
 
     def setup_rootfs(self):
-- 
2.25.1


