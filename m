Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B6D970732
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 09:19:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6P9Jmbg010231
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 02:19:48 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 25 Jul 2014 02:19:48 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Jul 2014 17:20:02 +0800
Message-ID: <f11514aea79be9f009030d3acb5964de15a26223.1406279934.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1406279934.git.Qi.Chen@windriver.com>
References: <cover.1406279934.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: upgrade to 215
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
X-List-Received-Date: Fri, 25 Jul 2014 09:19:50 -0000
Content-Type: text/plain

Upgrade systemd from 213 to 215.

systemd-older-kernel.patch is removed as it's fixed in 215.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../systemd/systemd/systemd-older-kernel.patch     |   56 --------------------
 .../systemd/{systemd_213.bb => systemd_215.bb}     |    8 +--
 2 files changed, 4 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
 rename meta/recipes-core/systemd/{systemd_213.bb => systemd_215.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch b/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
deleted file mode 100644
index 18b50e7..0000000
--- a/meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 6109f02dcc4f2d7a461c5772bab494f5753a2203 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 29 May 2014 08:09:07 +0000
-Subject: [PATCH] rtnl-types.c: check IFLA_VLAN_PROTOCOL
-
-The older kernel's linux/if_link.h doesn't have IFLA_VLAN_PROTOCOL, we need
-check whether it has been defined or not.
-
-The maintainer said that he would fix it:
-
-http://thread.gmane.org/gmane.comp.sysutils.systemd.devel/18200
-
-Also we need redefine IFLA_MAX from 34 to 35 when define IFLA_CARRIER,
-otherwise there would be error:
-
-| src/libsystemd/sd-rtnl/rtnl-types.c:233:9: error: array index in initializer exceeds array bounds
-|          [IFLA_CARRIER]          = { .type = NLA_U8 },
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- src/libsystemd/sd-rtnl/rtnl-types.c | 2 ++
- src/shared/missing.h                | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/src/libsystemd/sd-rtnl/rtnl-types.c b/src/libsystemd/sd-rtnl/rtnl-types.c
-index 44ac5ec..ab6161f 100644
---- a/src/libsystemd/sd-rtnl/rtnl-types.c
-+++ b/src/libsystemd/sd-rtnl/rtnl-types.c
-@@ -67,7 +67,9 @@ static const NLType rtnl_link_info_data_vlan_types[IFLA_VLAN_MAX + 1] = {
-         [IFLA_VLAN_EGRESS_QOS]  = { .type = NLA_NESTED },
-         [IFLA_VLAN_INGRESS_QOS] = { .type = NLA_NESTED },
- */
-+#ifdef IFLA_VLAN_PROTOCOL
-         [IFLA_VLAN_PROTOCOL]    = { .type = NLA_U16 },
-+#endif
- };
- 
- static const NLType rtnl_link_info_data_bond_types[IFLA_BOND_MAX + 1] = {
-diff --git a/src/shared/missing.h b/src/shared/missing.h
-index d5ec2f8..732853f 100644
---- a/src/shared/missing.h
-+++ b/src/shared/missing.h
-@@ -94,6 +94,8 @@
- 
- #ifndef IFLA_CARRIER
-   #define IFLA_CARRIER 33
-+  #undef IFLA_MAX
-+  #define IFLA_MAX 35
-   #ifndef IFLA_NUM_RX_QUEUES
-     #define IFLA_NUM_RX_QUEUES 32
-     #ifndef IFLA_NUM_TX_QUEUES
--- 
-1.8.3.4
-
diff --git a/meta/recipes-core/systemd/systemd_213.bb b/meta/recipes-core/systemd/systemd_215.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_213.bb
rename to meta/recipes-core/systemd/systemd_215.bb
index 5de7cdc..b1ffbdd 100644
--- a/meta/recipes-core/systemd/systemd_213.bb
+++ b/meta/recipes-core/systemd/systemd_215.bb
@@ -17,9 +17,9 @@ SECTION = "base/shell"
 
 inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest
 
-SRCREV = "c9679c652b3c31f2510e8805d81630680ebc7e95"
+SRCREV = "252ff40a3827b4e8e62e03a5e2f80da3fe02bee6"
 
-PV = "213+git${SRCPV}"
+PV = "215+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=git \
            file://binfmt-install.patch \
@@ -35,8 +35,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://00-create-volatile.conf \
            file://init \
            file://run-ptest \
-           file://systemd-older-kernel.patch \
-          "
+         "
 
 S = "${WORKDIR}/git"
 
@@ -231,6 +230,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${exec_prefix}/lib/systemd \
                 ${exec_prefix}/lib/modules-load.d \
                 ${exec_prefix}/lib/sysctl.d \
+                ${exec_prefix}/lib/sysusers.d \
                 ${localstatedir} \
                 /lib/udev/rules.d/70-uaccess.rules \
                 /lib/udev/rules.d/71-seat.rules \
-- 
1.7.9.5


