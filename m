Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F1BC6FED0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 13:49:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5GDnK0b009150
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 06:49:20 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 16 Jun 2014 06:49:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 06:49:18 -0700
Message-ID: <279354682d9d0a74f99d0ed601f745c48963a079.1402926503.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402926503.git.liezhi.yang@windriver.com>
References: <cover.1402926503.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] systemd: check IFLA_VLAN_PROTOCOL
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
X-List-Received-Date: Mon, 16 Jun 2014 13:49:22 -0000
Content-Type: text/plain

The older kernel's linux/if_link.h doesn't have IFLA_VLAN_PROTOCOL, we need
check whether it has been defined or not.

The maintainer said that he would fix it:

http://thread.gmane.org/gmane.comp.sysutils.systemd.devel/18200

Also we need redefine IFLA_MAX from 34 to 35 when define IFLA_CARRIER,
otherwise there would be error:

| src/libsystemd/sd-rtnl/rtnl-types.c:233:9: error: array index in initializer exceeds array bounds
|          [IFLA_CARRIER]          = { .type = NLA_U8 },

[YOCTO #6380]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../systemd/systemd/systemd-older-kernel.patch     |   56 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_213.bb           |    2 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-older-kernel.patch

diff --git a/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch b/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
new file mode 100644
index 0000000..18b50e7
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
@@ -0,0 +1,56 @@
+From 6109f02dcc4f2d7a461c5772bab494f5753a2203 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 29 May 2014 08:09:07 +0000
+Subject: [PATCH] rtnl-types.c: check IFLA_VLAN_PROTOCOL
+
+The older kernel's linux/if_link.h doesn't have IFLA_VLAN_PROTOCOL, we need
+check whether it has been defined or not.
+
+The maintainer said that he would fix it:
+
+http://thread.gmane.org/gmane.comp.sysutils.systemd.devel/18200
+
+Also we need redefine IFLA_MAX from 34 to 35 when define IFLA_CARRIER,
+otherwise there would be error:
+
+| src/libsystemd/sd-rtnl/rtnl-types.c:233:9: error: array index in initializer exceeds array bounds
+|          [IFLA_CARRIER]          = { .type = NLA_U8 },
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ src/libsystemd/sd-rtnl/rtnl-types.c | 2 ++
+ src/shared/missing.h                | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/src/libsystemd/sd-rtnl/rtnl-types.c b/src/libsystemd/sd-rtnl/rtnl-types.c
+index 44ac5ec..ab6161f 100644
+--- a/src/libsystemd/sd-rtnl/rtnl-types.c
++++ b/src/libsystemd/sd-rtnl/rtnl-types.c
+@@ -67,7 +67,9 @@ static const NLType rtnl_link_info_data_vlan_types[IFLA_VLAN_MAX + 1] = {
+         [IFLA_VLAN_EGRESS_QOS]  = { .type = NLA_NESTED },
+         [IFLA_VLAN_INGRESS_QOS] = { .type = NLA_NESTED },
+ */
++#ifdef IFLA_VLAN_PROTOCOL
+         [IFLA_VLAN_PROTOCOL]    = { .type = NLA_U16 },
++#endif
+ };
+ 
+ static const NLType rtnl_link_info_data_bond_types[IFLA_BOND_MAX + 1] = {
+diff --git a/src/shared/missing.h b/src/shared/missing.h
+index d5ec2f8..732853f 100644
+--- a/src/shared/missing.h
++++ b/src/shared/missing.h
+@@ -94,6 +94,8 @@
+ 
+ #ifndef IFLA_CARRIER
+   #define IFLA_CARRIER 33
++  #undef IFLA_MAX
++  #define IFLA_MAX 35
+   #ifndef IFLA_NUM_RX_QUEUES
+     #define IFLA_NUM_RX_QUEUES 32
+     #ifndef IFLA_NUM_TX_QUEUES
+-- 
+1.8.3.4
+
diff --git a/meta/recipes-core/systemd/systemd_213.bb b/meta/recipes-core/systemd/systemd_213.bb
index 5f90576..279cf23 100644
--- a/meta/recipes-core/systemd/systemd_213.bb
+++ b/meta/recipes-core/systemd/systemd_213.bb
@@ -31,11 +31,11 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://0001-uClibc-doesn-t-implement-pwritev-preadv.patch \
            file://uclibc-sysinfo_h.patch \
            file://uclibc-get-physmem.patch \
-           \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
            file://run-ptest \
+           file://systemd-older-kernel.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


