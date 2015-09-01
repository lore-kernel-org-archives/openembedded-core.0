Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C280777005
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 21:34:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t81LYVs2015432
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Sep 2015 14:34:31 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 1 Sep 2015 14:34:31 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Sep 2015 14:34:29 -0700
Message-ID: <1441143270-27322-2-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1441143270-27322-1-git-send-email-jslater@windriver.com>
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] ifupdown: import recipe
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
X-List-Received-Date: Tue, 01 Sep 2015 21:34:31 -0000
Content-Type: text/plain

Implements ifup and ifdown.

Copied from https://github.com/WindRiver-OpenSourceLabs/meta-overc.git
as of commit aa89eebffe06e4aa04701eae9691cb3049cbaef9.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-core/ifupdown/files/99_network        |    1 +
 ...-don-t-rely-on-dpkg-architecture-to-set-a.patch |   56 +++++++++++
 ...-6-.defn-fix-inverted-checks-for-loopback.patch |  103 ++++++++++++++++++++
 meta/recipes-core/ifupdown/ifupdown_0.7.48.1.bb    |   54 ++++++++++
 4 files changed, 214 insertions(+)
 create mode 100644 meta/recipes-core/ifupdown/files/99_network
 create mode 100644 meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
 create mode 100644 meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch
 create mode 100644 meta/recipes-core/ifupdown/ifupdown_0.7.48.1.bb

diff --git a/meta/recipes-core/ifupdown/files/99_network b/meta/recipes-core/ifupdown/files/99_network
new file mode 100644
index 0000000..42d5895
--- /dev/null
+++ b/meta/recipes-core/ifupdown/files/99_network
@@ -0,0 +1 @@
+d root root 0755 /run/network none
diff --git a/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
new file mode 100644
index 0000000..8c4d953
--- /dev/null
+++ b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
@@ -0,0 +1,56 @@
+From 7af9db748974cb3a2c6ef8f9e03d7db1f9f8ee16 Mon Sep 17 00:00:00 2001
+From: Paul Gortmaker <paul.gortmaker@windriver.com>
+Date: Wed, 6 Aug 2014 14:54:12 -0400
+Subject: [PATCH 1/2] defn2[c|man]: don't rely on dpkg-architecture to set arch
+
+In yocto we'll always be cross compiling, and we'll always
+be building on linux for linux (vs. *BSD, hurd, etc.)
+
+Without this the arch is not detected, but it doesn't error
+out, and hence you get useless binaries that don't know any
+arch specific methods, and the end result will be strangeness
+like the loopback device not being configured/enabled.
+
+Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
+---
+ defn2c.pl   | 6 +++---
+ defn2man.pl | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/defn2c.pl b/defn2c.pl
+index c449de2f3d1c..38845e374c76 100755
+--- a/defn2c.pl
++++ b/defn2c.pl
+@@ -2,9 +2,9 @@
+ 
+ use strict;
+ 
+-my $DEB_HOST_ARCH_OS = `dpkg-architecture -qDEB_HOST_ARCH_OS`;
+-
+-$DEB_HOST_ARCH_OS =~ s/\n//;
++#my $DEB_HOST_ARCH_OS = `dpkg-architecture -qDEB_HOST_ARCH_OS`;
++#$DEB_HOST_ARCH_OS =~ s/\n//;
++my $DEB_HOST_ARCH_OS ="linux";
+ 
+ # declarations
+ my $address_family = "";
+diff --git a/defn2man.pl b/defn2man.pl
+index 6ddcfdd4fe68..c9c4dd046597 100755
+--- a/defn2man.pl
++++ b/defn2man.pl
+@@ -2,9 +2,9 @@
+ 
+ use strict;
+ 
+-my $DEB_HOST_ARCH_OS = `dpkg-architecture -qDEB_HOST_ARCH_OS`;
+-
+-$DEB_HOST_ARCH_OS =~ s/\n//;
++#my $DEB_HOST_ARCH_OS = `dpkg-architecture -qDEB_HOST_ARCH_OS`;
++#$DEB_HOST_ARCH_OS =~ s/\n//;
++my $DEB_HOST_ARCH_OS = "linux";
+ 
+ # declarations
+ my $line;
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch b/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch
new file mode 100644
index 0000000..bff352e
--- /dev/null
+++ b/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch
@@ -0,0 +1,103 @@
+From 74152ac74a3e1ea0f3be292aa1eeca5ad1fe69c0 Mon Sep 17 00:00:00 2001
+From: Paul Gortmaker <paul.gortmaker@windriver.com>
+Date: Wed, 6 Aug 2014 15:12:11 -0400
+Subject: [PATCH 2/2] inet[6].defn: fix inverted checks for loopback
+
+Compared to the hurd link.defn for loopback, we see these
+are inverted, meaning that you would only be able to configure
+a loopback device that was _not_ named "lo" (unlikely to exist).
+
+The result was that we'd update /run/network/ifstate for "lo"
+but never actually do anything for up/down, as shown below:
+
+root@localhost:~# ifconfig -s
+Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
+eth0       1500 0   7736329      0   2016 0       5289422      0      0      0 BMRU
+lo        65536 0        18      0      0 0            18      0      0      0 LRU
+root@localhost:~# ifdown lo
+root@localhost:~# echo $?
+0
+root@localhost:~# ifconfig -s
+Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
+eth0       1500 0   7736406      0   2016 0       5289455      0      0      0 BMRU
+lo        65536 0        18      0      0 0            18      0      0      0 LRU
+root@localhost:~# ifconfig lo down
+root@localhost:~# ifconfig -s
+Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
+eth0       1500 0   7736474      0   2016 0       5289481      0      0      0 BMRU
+root@localhost:~#
+
+Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
+---
+ inet.defn  | 12 ++++++------
+ inet6.defn |  8 ++++----
+ 2 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/inet.defn b/inet.defn
+index b176ab4ed03e..5fdfb14a0e1c 100644
+--- a/inet.defn
++++ b/inet.defn
+@@ -6,10 +6,10 @@ method loopback
+     This method may be used to define the IPv4 loopback interface.
+ 
+   up
+-    ip link set dev %iface% up if (!iface_is_lo())
++    ip link set dev %iface% up if (iface_is_lo())
+ 
+   down
+-    ip link set dev %iface% down if (!iface_is_lo())
++    ip link set dev %iface% down if (iface_is_lo())
+ 
+ method static
+   description
+@@ -212,11 +212,11 @@ method loopback
+ 
+   up
+     ifconfig %iface% 127.0.0.1 up \
+-	if (!iface_is_lo())
++	if (iface_is_lo())
+ 
+   down
+     ifconfig %iface% down \
+-	if (!iface_is_lo())
++	if (iface_is_lo())
+ 
+ method static
+   description
+@@ -371,11 +371,11 @@ method loopback
+ 
+   up
+     inetutils-ifconfig --interface %iface% --address 127.0.0.1 --up \
+-	if (!iface_is_lo())
++	if (iface_is_lo())
+ 
+   down
+     inetutils-ifconfig --interface %iface% --down \
+-	if (!iface_is_lo())
++	if (iface_is_lo())
+ 
+ method static
+   description
+diff --git a/inet6.defn b/inet6.defn
+index 09325539cd01..4df64aff38cc 100644
+--- a/inet6.defn
++++ b/inet6.defn
+@@ -33,11 +33,11 @@ method loopback
+   description
+     This method may be used to define the IPv6 loopback interface.
+   up
+-    -ip link set dev %iface% up 2>/dev/null if (!iface_is_lo())
+-    -ip addr add dev %iface% ::1 2>/dev/null if (!iface_is_lo())
++    -ip link set dev %iface% up 2>/dev/null if (iface_is_lo())
++    -ip addr add dev %iface% ::1 2>/dev/null if (iface_is_lo())
+   down
+-    -ip addr del dev %iface% ::1 2>/dev/null if (!iface_is_lo())
+-    -ip link set dev %iface% down 2>/dev/null if (!iface_is_lo())
++    -ip addr del dev %iface% ::1 2>/dev/null if (iface_is_lo())
++    -ip link set dev %iface% down 2>/dev/null if (iface_is_lo())
+ 
+ method static
+   description
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.7.48.1.bb b/meta/recipes-core/ifupdown/ifupdown_0.7.48.1.bb
new file mode 100644
index 0000000..e29cc49
--- /dev/null
+++ b/meta/recipes-core/ifupdown/ifupdown_0.7.48.1.bb
@@ -0,0 +1,54 @@
+SUMMARY = "ifupdown: basic ifup and ifdown used by initscripts"
+DESCRIPTION = "High level tools to configure network interfaces \
+This package provides the tools ifup and ifdown which may be used to \
+configure (or, respectively, deconfigure) network interfaces, based on \
+the file /etc/network/interfaces."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/i/ifupdown/ifupdown_0.7.48.1ubuntu5.tar.gz \
+	   file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
+	   file://inet-6-.defn-fix-inverted-checks-for-loopback.patch \
+	   file://99_network \
+	  "
+
+EXTRA_OEMAKE = ""
+
+# needed so we don't get default S="${WORKDIR}/ifupdown-${PV}"
+S = "${WORKDIR}/ifupdown-${PV}ubuntu5"
+
+
+inherit update-rc.d
+
+do_compile () {
+	chmod a+rx *.pl *.sh
+	oe_runmake 'CC=${CC}' "CFLAGS=${CFLAGS} -Wall -W -D'IFUPDOWN_VERSION=\"${PV}\"'"
+}
+
+do_install () {
+	install -d ${D}${mandir}/man8 \
+		  ${D}${mandir}/man5 \
+		  ${D}${base_sbindir}
+
+	# If volatiles are used, then we'll also need /run/network there too.
+	install -d ${D}/etc/default/volatiles
+	install -m 0644 ${WORKDIR}/99_network ${D}/etc/default/volatiles
+
+	install -m 0755 ifup ${D}${base_sbindir}/
+	ln ${D}${base_sbindir}/ifup ${D}${base_sbindir}/ifdown
+	install -m 0644 ifup.8 ${D}${mandir}/man8
+	install -m 0644 interfaces.5 ${D}${mandir}/man5
+	cd ${D}${mandir}/man8 && ln -s ifup.8 ifdown.8
+}
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "ifup ifdown"
+
+ALTERNATIVE_LINK_NAME[ifup] = "${base_sbindir}/ifup"
+ALTERNATIVE_LINK_NAME[ifdown] = "${base_sbindir}/ifdown"
+
+INITSCRIPT_NAME = "ifup"
+INITSCRIPT_PARAMS = "start 39 S . stop 39 0 6 1 ."
+
+SRC_URI[md5sum] = "85ba375f3c6f26d34efb2a8575e77fc8"
+SRC_URI[sha256sum] = "08dce14692c07b72b583b86c4d3ace0d9dac1928925144cc3ddde15b694ebbdf"
-- 
1.7.9.5


