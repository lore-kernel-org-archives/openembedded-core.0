Return-Path: <mike@foundries.io>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id D034F6C227
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 18:06:52 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id n8so1509735plp.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 11:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SlEBM++bL3YPzt7j7o316lY7808aKHHoPZwTB5htYkU=;
	b=StqQlrayN88cQjcGNBxr/FCk9oeUTZf3fRoDAKj96Lh9y4K1zb+Th0Jl26/iA8DcBO
	oPskgcsgSK2E3o4fbxz2I9po0mE4IFe37ex+jJKHKT3y5YRB1c3oZoNw2SO3TtVdwtZi
	/x3JOUqoYxUH0Xi0BX882LV1XY8QODyBMbv9V0oMnPioL2sIUcOgivELeTEraH4Ev03s
	BooHJTfZCeWmCFc0jUM89qBMkT1GpeWyn/dP6iTh1bmIlBP2ff2i5ohDtdK91GwFwoww
	8KAjtrA/V/p0P6Q7HQ9cCKxjIZvpr4uKNA8xtB9+4f3EXjMmkkWK5yI/3Dzk6bKylX+t
	CiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SlEBM++bL3YPzt7j7o316lY7808aKHHoPZwTB5htYkU=;
	b=A7RH7DkKVPOtn6LabU5k8iiOMQo1Z9EjXpxK8YlLGST3+XTft/efSQsGZWce4cC8ZK
	X7EbpGttMAWPf1rjJ1kRAqrrMhB3r1HLhk6OAW8mjtUey8U9D6d8HPq4e4ucFBHS9pWa
	CkOBCrHuKhB3dz0v4IAwfsF1ewNxcPvKsFPiPyuNUh49eokGyYEnuIUeF7a/3XoAJZbo
	T2SCEPL/hhhE+Aqs0XWeiL3j3ai9oC78RJ4DpYCY/aem/t+ODabWT+OEyReU9XeUY5pu
	Q8HFq1gFvY5FeOz7banxF5Ew0KlvYkJnXeU+KxtJvtT2nHHa2ZEdFMIWfXidO306K3vn
	qcmQ==
X-Gm-Message-State: APjAAAWAQd5rx6xgw7jbsDaxqQbRCaK0fIwMDnBmphCg1Hzb7apJEx5D
	1sKq7gvmyiAWGMrOSMqtDqqvIn9PBmU=
X-Google-Smtp-Source: APXvYqzUC9fKHNBNixCeyEH0W0EWQMmqdVSI1GDa0M44elRqhfRC90LmfH9lyjXQgXJD7pqQBWRZZg==
X-Received: by 2002:a17:902:9a4a:: with SMTP id
	x10mr6978787plv.113.1557425213248; 
	Thu, 09 May 2019 11:06:53 -0700 (PDT)
Received: from scottml-arch.lan (107-198-5-8.lightspeed.irvnca.sbcglobal.net.
	[107.198.5.8]) by smtp.googlemail.com with ESMTPSA id
	l129sm6179413pfc.61.2019.05.09.11.06.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 11:06:52 -0700 (PDT)
From: Michael Scott <mike@foundries.io>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2019 11:06:41 -0700
Message-Id: <20190509180641.20659-1-mike@foundries.io>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] procps: update legacy sysctl.conf to fix rp_filter sysctl issue
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
X-List-Received-Date: Thu, 09 May 2019 18:06:52 -0000
Content-Transfer-Encoding: 8bit

The sysctl.conf file for procps is very outdated:
https://git.openembedded.org/openembedded-core/commit/?id=8a9b9a323f4363e27138077e3e3dce8139a36708
(circa 2014)

The origin of this file is hard to determine and due to it's age
is causing a routing issue when both wifi and ethernet are enabled.
This manifested during an update from thud -> warrior due to the
following:
- upstream change in NetworkManager during 1.16 cycle removes the
  dynamic setting of rp_filter sysctl when more than one interface
  is enabled:
  https://cgit.freedesktop.org/NetworkManager/NetworkManager/commit/?id=b1082aa9a711deb96652e5b2fcaefcf399d127b8
- open-embedded updated to NetworkManager 1.16 in March 2019:
  https://git.openembedded.org/meta-openembedded/commit/meta-networking/recipes-connectivity/networkmanager?id=5509328af9e4fab267251456f4d6e7bd51df779a
- setting in legacy sysctl.conf sets rp_filter to 1 which blocks
  packets with different inbound and outbound addresses.

Documentation of rp_filter setting from kernel.org:

rp_filter - INTEGER
0 - No source validation.
1 - Strict mode as defined in RFC3704 Strict Reverse Path
    Each incoming packet is tested against the FIB and if the interface
    is not the best reverse path the packet check will fail.
    By default failed packets are discarded.
2 - Loose mode as defined in RFC3704 Loose Reverse Path
    Each incoming packet's source address is also tested against the FIB
    and if the source address is not reachable via any interface
    the packet check will fail.

This patch updates the sysctl.conf file to current which doesn't set
the rp_filter mode explicity (2 is the default).

NOTE: The kernel/pid_max=10000 setting has been commented out as this
may not be desired by default.

Signed-off-by: Michael Scott <mike@foundries.io>
---
 .../procps/procps/sysctl.conf                 | 105 +++++++++---------
 1 file changed, 54 insertions(+), 51 deletions(-)

diff --git a/meta/recipes-extended/procps/procps/sysctl.conf b/meta/recipes-extended/procps/procps/sysctl.conf
index 34e7488bf7..253f3701bd 100644
--- a/meta/recipes-extended/procps/procps/sysctl.conf
+++ b/meta/recipes-extended/procps/procps/sysctl.conf
@@ -1,64 +1,67 @@
-# This configuration file is taken from Debian.
+# This configuration taken from procps v3.3.15
+# Commented out kernel/pid_max=10000 line
 #
 # /etc/sysctl.conf - Configuration file for setting system variables
 # See sysctl.conf (5) for information.
-#
 
-#kernel.domainname = example.com
+# you can have the CD-ROM close when you use it, and open
+# when you are done.
+#dev.cdrom.autoeject = 1
+#dev.cdrom.autoclose = 1
 
-# Uncomment the following to stop low-level messages on console
-#kernel.printk = 4 4 1 7
+# protection from the SYN flood attack
+net/ipv4/tcp_syncookies=1
 
-##############################################################3
-# Functions previously found in netbase
-#
+# see the evil packets in your log files
+net/ipv4/conf/all/log_martians=1
 
-# Uncomment the next two lines to enable Spoof protection (reverse-path filter)
-# Turn on Source Address Verification in all interfaces to
-# prevent some spoofing attacks
-net.ipv4.conf.default.rp_filter=1
-net.ipv4.conf.all.rp_filter=1
+# makes you vulnerable or not :-)
+net/ipv4/conf/all/accept_redirects=0
+net/ipv4/conf/all/accept_source_route=0
+net/ipv4/icmp_echo_ignore_broadcasts =1
 
-# Uncomment the next line to enable TCP/IP SYN cookies
-#net.ipv4.tcp_syncookies=1
+# needed for routing, including masquerading or NAT
+#net/ipv4/ip_forward=1
 
-# Uncomment the next line to enable packet forwarding for IPv4
-#net.ipv4.ip_forward=1
+# sets the port range used for outgoing connections
+#net.ipv4.ip_local_port_range = 32768    61000
 
-# Uncomment the next line to enable packet forwarding for IPv6
-#net.ipv6.conf.all.forwarding=1
+# Broken routers and obsolete firewalls will corrupt the window scaling
+# and ECN. Set these values to 0 to disable window scaling and ECN.
+# This may, rarely, cause some performance loss when running high-speed
+# TCP/IP over huge distances or running TCP/IP over connections with high
+# packet loss and modern routers. This sure beats dropped connections.
+#net.ipv4.tcp_ecn = 0
 
+# Swapping too much or not enough? Disks spinning up when you'd
+# rather they didn't? Tweak these.
+#vm.vfs_cache_pressure = 100
+#vm.laptop_mode = 0
+#vm.swappiness = 60
 
-###################################################################
-# Additional settings - these settings can improve the network
-# security of the host and prevent against some network attacks
-# including spoofing attacks and man in the middle attacks through
-# redirection. Some network environments, however, require that these
-# settings are disabled so review and enable them as needed.
-#
-# Ignore ICMP broadcasts
-#net.ipv4.icmp_echo_ignore_broadcasts = 1
-#
-# Ignore bogus ICMP errors
-#net.ipv4.icmp_ignore_bogus_error_responses = 1
-#
-# Do not accept ICMP redirects (prevent MITM attacks)
-#net.ipv4.conf.all.accept_redirects = 0
-#net.ipv6.conf.all.accept_redirects = 0
-# _or_
-# Accept ICMP redirects only for gateways listed in our default
-# gateway list (enabled by default)
-# net.ipv4.conf.all.secure_redirects = 1
-#
-# Do not send ICMP redirects (we are not a router)
-#net.ipv4.conf.all.send_redirects = 0
-#
-# Do not accept IP source route packets (we are not a router)
-#net.ipv4.conf.all.accept_source_route = 0
-#net.ipv6.conf.all.accept_source_route = 0
-#
-# Log Martian Packets
-#net.ipv4.conf.all.log_martians = 1
-#
+#kernel.printk_ratelimit_burst = 10
+#kernel.printk_ratelimit = 5
+#kernel.panic_on_oops = 0
+
+# Reboot 600 seconds after a panic
+#kernel.panic = 600
+
+# enable SysRq key (note: console security issues)
+#kernel.sysrq = 1
+
+# Change name of core file to start with the command name
+# so you get things like: emacs.core mozilla-bin.core X.core
+#kernel.core_pattern = %e.core
+
+# NIS/YP domain (not always equal to DNS domain)
+#kernel.domainname = example.com
+#kernel.hostname = darkstar
+
+# This limits PID values to 4 digits, which allows tools like ps
+# to save screen space.
+#kernel/pid_max=10000
 
-#kernel.shmmax = 141762560
+# Protects against creating or following links under certain conditions
+# See https://www.kernel.org/doc/Documentation/sysctl/fs.txt
+#fs.protected_hardlinks = 1
+#fs.protected_symlinks = 1
-- 
2.21.0


