Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD533C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 07:08:42 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web09.40638.1655795320135496674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 00:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm2
 header.b=D6BLhQ6q;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.25, mailfrom: pavel@zhukoff.net)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 7AA9F5C01E8;
	Tue, 21 Jun 2022 03:08:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 21 Jun 2022 03:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1655795319; x=1655881719; bh=Vl
	/dt3zWkjssHC/rNLJmWfvI+W0+RY7Y8gzdBEpE0Dw=; b=D6BLhQ6qLzLV6J8BYj
	wdmI0q9BEhtot6aJtjWRqCWFGco1kEtyd0NyAH5csSG6OF7V5bE1zya0Gh/kCNIo
	41ZtnTdVmtdy0R7KQ0pEsPtZ5kiVOHBOHL6KTAtEP58WQnnfMKFI1J0LKTeKOP7D
	L290jf0bqpMa2HNo7gHKCSQjvmlyYft/Cq3Sf52eElRZAyUM5s+JKyhl1XkYjQjA
	etG6xOlz/JQTJHeMKrc05YWukC7VaHBEndMGSnRTTaTibxceIcXvGkIoET/TR2Zv
	GpIeGg9PKGiWS2log2j0P2q56houyIyDH/Smr3MvnJz1tjwPZygaTSDR/ElOpKYf
	K7rA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1655795319; x=1655881719; bh=Vl/dt3zWkjssH
	C/rNLJmWfvI+W0+RY7Y8gzdBEpE0Dw=; b=Nklc8gLCbck2KeDnWiizCecpJhBvy
	Yf3lACAHq/ScKpmU/m/+3B3kjESAk0jrbU9CLEu7hX5J5N4vwntryDJSDnNAC6M7
	cJNQt+3n+h6mrscI+WIPTYgZPQPqT5a+s4J3DIN8kb1xn98RUAzGQ/UNaCbqNrnO
	pqgW95kImFVP2sWKyXiQbeYbYtdGiC//gJnlKEBPx4V/EhNNXQBxHzXCUCM/LyEN
	jf5FyJbGlB9yz4nTpPYW/PQqcZXP2lxE/E4Lx8vMVXLenjUVLIel4IDQJNbyJuba
	uwc8Q32Sg5lqfQk7UI8zXzXSKB74J4USoYVGQYT1hvAXHoK+rOH/feUpA==
X-ME-Sender: <xms:dm6xYrGhDat5RtEbWtZqBZdrZoamL1xocPRlabpgJqS1hz4zcsHSQw>
    <xme:dm6xYoX6NOl6hRbpRpXi99ZH_lxvn92Cu-erp5Lo0R4IlcjJ40RabBuG--UKTWzTz
    Bes4A04I0mA_mbkFoM>
X-ME-Received: 
 <xmr:dm6xYtKAniRoWbqa7wrsO4x-ql-AuxqlTeYolQrmIY7Fj7IGxYu8_POB4O8CsHswoGWjJT4>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudefvddguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihh
    uhhkohhffhdrnhgvtheqnecuggftrfgrthhtvghrnhepgeekleeugefgkeeigfdtgfelvd
    dvtedtffffueehteegveejueetvddttdekkeejnecuffhomhgrihhnpehgihhthhhusgdr
    tghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:d26xYpHxtCHRMhZva5APhlvSwEq5y7AbLuGmqm0Og_g2IjEmWJ57Lw>
    <xmx:d26xYhXlApdr8hwEcghGj8uskUs8gYKKu8mWYyrJmgem9LJEPKup8w>
    <xmx:d26xYkMET8yV6Je8yukYcwYnOCqMXU6Gel-QOmP4K8-q_53Lrfdkgw>
    <xmx:d26xYgc-qM4XUy5YzYbkvqIzKafuDg5hx-6w2g70a5ocoVpYcspo8g>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jun 2022 03:08:38 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: pavel@zhukoff.net,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [PATCH v2 2/2] systemd: Rebase patches on v251
Date: Tue, 21 Jun 2022 09:08:00 +0200
Message-Id: <20220621070758.30888-2-pavel@zhukoff.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220621070758.30888-1-pavel@zhukoff.net>
References: <20220621070758.30888-1-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 07:08:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167131

Drop patches which are not needed anymore.
Rebase musl specific patches to aboid fuzz warnings

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 .../0001-Adjust-for-musl-headers.patch        | 47 +++++++++---
 ...tall-dependency-links-at-install-tim.patch |  2 +-
 ...ass-correct-parameters-to-getdents64.patch | 20 +----
 .../0002-Add-sys-stat.h-for-S_IFDIR.patch     |  4 +-
 ...implment-systemd-sysv-install-for-OE.patch |  4 +-
 ...k-parse_printf_format-implementation.patch |  8 +-
 ...missing.h-check-for-missing-strndupa.patch | 55 +++++++-------
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  7 +-
 ...008-add-missing-FTW_-macros-for-musl.patch | 46 ++----------
 ..._register_atfork-for-non-glibc-build.patch | 46 ------------
 ...sable-tests-for-missing-typedefs-in-.patch |  4 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  8 +-
 ...uffering-when-writing-to-oom_score_a.patch |  4 +-
 .../0021-test-json.c-define-M_PIl.patch       | 35 ---------
 ...-not-disable-buffer-in-writing-files.patch | 74 +++++++++----------
 ...7ca2ab96d085158485ecfc46c7cb6af0f166.patch |  5 +-
 meta/recipes-core/systemd/systemd_251.2.bb    |  2 -
 17 files changed, 133 insertions(+), 238 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch b/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch
index c42c66786f..bce1ca4563 100644
--- a/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch
+++ b/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch
@@ -37,16 +37,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/network/networkd-dhcp-prefix-delegation.c | 4 ++--
  src/network/networkd-dhcp-server.c            | 2 +-
  src/network/networkd-dhcp4.c                  | 2 +-
+ src/network/networkd-ipv6ll.c                 | 2 +-
  src/network/networkd-link.c                   | 2 +-
+ src/network/networkd-ndisc.c                  | 2 +-
  src/network/networkd-route.c                  | 8 ++++----
  src/network/networkd-setlink.c                | 2 +-
  src/shared/linux/ethtool.h                    | 3 ++-
  src/shared/netif-util.c                       | 2 +-
  src/udev/udev-builtin-net_id.c                | 2 +-
- 35 files changed, 42 insertions(+), 40 deletions(-)
+ 37 files changed, 44 insertions(+), 42 deletions(-)
 
 diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-network/sd-dhcp6-client.c
-index 84bc739bba..ff8cb6bf9d 100644
+index b346a50d78..7884d4c1cd 100644
 --- a/src/libsystemd-network/sd-dhcp6-client.c
 +++ b/src/libsystemd-network/sd-dhcp6-client.c
 @@ -5,7 +5,7 @@
@@ -433,8 +435,21 @@ index cb9c428ae9..a35d58f3f1 100644
  
  #include "alloc-util.h"
  #include "dhcp-client-internal.h"
+diff --git a/src/network/networkd-ipv6ll.c b/src/network/networkd-ipv6ll.c
+index dc09171afe..5b93ef3dd4 100644
+--- a/src/network/networkd-ipv6ll.c
++++ b/src/network/networkd-ipv6ll.c
+@@ -1,7 +1,7 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+
+ #include <linux/if.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+
+ #include "in-addr-util.h"
+ #include "networkd-address.h"
 diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index b62a154828..75949e6094 100644
+index 63679505f7..825ea76ff2 100644
 --- a/src/network/networkd-link.c
 +++ b/src/network/networkd-link.c
 @@ -3,7 +3,7 @@
@@ -446,8 +461,21 @@ index b62a154828..75949e6094 100644
  #include <linux/if_link.h>
  #include <linux/netdevice.h>
  #include <sys/socket.h>
+diff --git a/src/network/networkd-ndisc.c b/src/network/networkd-ndisc.c
+index efe407fedb..46a086cdf5 100644
+--- a/src/network/networkd-ndisc.c
++++ b/src/network/networkd-ndisc.c
+@@ -6,7 +6,7 @@
+ #include <arpa/inet.h>
+ #include <netinet/icmp6.h>
+ #include <linux/if.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+
+ #include "sd-ndisc.h"
+
 diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
-index ee7a535075..ce6ed64133 100644
+index 934fed3b7f..fdb89313dd 100644
 --- a/src/network/networkd-route.c
 +++ b/src/network/networkd-route.c
 @@ -1,9 +1,5 @@
@@ -485,12 +513,12 @@ index e00cc1e589..e392c7e1a2 100644
  
  #include "missing_network.h"
 diff --git a/src/shared/linux/ethtool.h b/src/shared/linux/ethtool.h
-index 974d4292e7..fe9b8a9e07 100644
+index cf20b6dba5..c3a46dda11 100644
 --- a/src/shared/linux/ethtool.h
 +++ b/src/shared/linux/ethtool.h
 @@ -16,7 +16,8 @@
  
- #include <linux/kernel.h>
+ #include <linux/const.h>
  #include <linux/types.h>
 -#include <linux/if_ether.h>
 +#include <netinet/if_ether.h>
@@ -499,19 +527,20 @@ index 974d4292e7..fe9b8a9e07 100644
  #ifndef __KERNEL__
  #include <limits.h> /* for INT_MAX */
 diff --git a/src/shared/netif-util.c b/src/shared/netif-util.c
-index 603d4de109..7e3531808a 100644
+index f56c5646c1..5af28ff119 100644
 --- a/src/shared/netif-util.c
 +++ b/src/shared/netif-util.c
-@@ -1,6 +1,6 @@
+@@ -1,7 +1,7 @@
  /* SPDX-License-Identifier: LGPL-2.1-or-later */
  
+ #include <linux/if.h>
 -#include <linux/if_arp.h>
 +//#include <linux/if_arp.h>
  
  #include "arphrd-util.h"
  #include "device-util.h"
 diff --git a/src/udev/udev-builtin-net_id.c b/src/udev/udev-builtin-net_id.c
-index 65e003eb15..0b3dc04be0 100644
+index f2ea2a7cd5..fe60a0744d 100644
 --- a/src/udev/udev-builtin-net_id.c
 +++ b/src/udev/udev-builtin-net_id.c
 @@ -18,7 +18,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 330ad492ba..a19a025559 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -39,7 +39,7 @@ index a9bf28f6d9..11d3644168 100644
          ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
          ['reboot.target',                       '',
           'ctrl-alt-del.target' + (with_runlevels ? ' runlevel6.target' : '')],
-@@ -184,8 +183,7 @@ in_units = [
+@@ -186,8 +185,7 @@ in_units = [
          ['rescue.service',                       ''],
          ['serial-getty@.service',                ''],
          ['systemd-backlight@.service',           'ENABLE_BACKLIGHT'],
diff --git a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
index 9ebff9825a..144314c409 100644
--- a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
+++ b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
@@ -15,10 +15,10 @@ Fixes
 Upstream-Status: Inappropriate [musl specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
+
 ---
  src/basic/recurse-dir.c | 2 +-
- src/basic/stat-util.c   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/recurse-dir.c b/src/basic/recurse-dir.c
 index efa1797b7b..03ff10ebe9 100644
@@ -33,19 +33,3 @@ index efa1797b7b..03ff10ebe9 100644
                  if (n < 0)
                          return -errno;
                  if (n == 0)
-diff --git a/src/basic/stat-util.c b/src/basic/stat-util.c
-index c2269844f8..7cd6c7fa42 100644
---- a/src/basic/stat-util.c
-+++ b/src/basic/stat-util.c
-@@ -99,7 +99,7 @@ int dir_is_empty_at(int dir_fd, const char *path) {
-                         return fd;
-         }
- 
--        n = getdents64(fd, &buffer, sizeof(buffer));
-+        n = getdents64(fd, (struct dirent *)&buffer, sizeof(buffer));
-         if (n < 0)
-                 return -errno;
- 
--- 
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch b/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
index 8cf0546450..4db5d6d97f 100644
--- a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
+++ b/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/src/shared/mkdir-label.c b/src/shared/mkdir-label.c
-index d36a6466d7..63b764cd83 100644
+index 5b1ac5d1e0..fa5802b894 100644
 --- a/src/shared/mkdir-label.c
 +++ b/src/shared/mkdir-label.c
-@@ -4,6 +4,7 @@
+@@ -6,6 +6,7 @@
  #include "selinux-util.h"
  #include "smack-util.h"
  #include "user-util.h"
diff --git a/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch
index c6204786b3..4556ab5da6 100644
--- a/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch
+++ b/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/systemctl/systemd-sysv-install.SKELETON b/src/systemctl/systemd-sysv-install.SKELETON
-index 8c16cf99913f..9f078a121469 100755
+index a2a0059fef..7f95791d9b 100755
 --- a/src/systemctl/systemd-sysv-install.SKELETON
 +++ b/src/systemctl/systemd-sysv-install.SKELETON
-@@ -32,17 +32,17 @@ case "$1" in
+@@ -34,17 +34,17 @@ case "$1" in
      enable)
          # call the command to enable SysV init script $NAME here
          # (consider optional $ROOT)
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index 1bd538b0c0..0c85f2bcbe 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -23,10 +23,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  create mode 100644 src/basic/parse-printf-format.h
 
 diff --git a/meson.build b/meson.build
-index cb9936ee8b..ae53345260 100644
+index 36cbfa4893..30b5305b89 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -686,6 +686,7 @@ endif
+@@ -694,6 +694,7 @@ endif
  foreach header : ['crypt.h',
                    'linux/memfd.h',
                    'linux/vm_sockets.h',
@@ -35,10 +35,10 @@ index cb9936ee8b..ae53345260 100644
                    'valgrind/memcheck.h',
                    'valgrind/valgrind.h',
 diff --git a/src/basic/meson.build b/src/basic/meson.build
-index 49e1e7f43e..4131494bfa 100644
+index 9b89fdcdea..0b1ef91016 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
-@@ -334,6 +334,11 @@ endforeach
+@@ -336,6 +336,11 @@ endforeach
  
  basic_sources += generated_gperf_headers
  
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index 680930ca3c..9e02666698 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -73,10 +73,10 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  52 files changed, 63 insertions(+)
 
 diff --git a/meson.build b/meson.build
-index cb9936ee8b..7ab201c6d9 100644
+index 30b5305b89..0189ef8ce6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -507,6 +507,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
+@@ -512,6 +512,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
  endforeach
  
  foreach ident : [
@@ -85,19 +85,19 @@ index cb9936ee8b..7ab201c6d9 100644
          ['gettid',            '''#include <sys/types.h>
                                   #include <unistd.h>'''],
 diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
-index 5a3095cbba..22cfa4d526 100644
+index a4e5d77f6c..fc12da4c53 100644
 --- a/src/backlight/backlight.c
 +++ b/src/backlight/backlight.c
-@@ -19,6 +19,7 @@
- #include "string-util.h"
+@@ -20,6 +20,7 @@
  #include "strv.h"
+ #include "terminal-util.h"
  #include "util.h"
 +#include "missing_stdlib.h"
  
  static int help(void) {
          _cleanup_free_ char *link = NULL;
 diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index a626ecf2e2..f7dc6c8421 100644
+index b03cc70e2e..f4615ffce1 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
 @@ -37,6 +37,7 @@
@@ -249,10 +249,10 @@ index b659d6905d..020112be24 100644
  static clockid_t map_clock_id(clockid_t c) {
  
 diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
-index 9e4b0d1f72..d640316ff7 100644
+index d9c901d73b..79a035274c 100644
 --- a/src/boot/bless-boot.c
 +++ b/src/boot/bless-boot.c
-@@ -19,6 +19,7 @@
+@@ -22,6 +22,7 @@
  #include "util.h"
  #include "verbs.h"
  #include "virt.h"
@@ -297,10 +297,10 @@ index 32a2ec0ff9..36be2511e4 100644
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
 diff --git a/src/core/execute.c b/src/core/execute.c
-index 0b20d386d3..fccfb9268c 100644
+index 2762b10287..a8aeec7f6e 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -102,6 +102,7 @@
+@@ -103,6 +103,7 @@
  #include "unit-serialize.h"
  #include "user-util.h"
  #include "utmp-wtmp.h"
@@ -309,19 +309,19 @@ index 0b20d386d3..fccfb9268c 100644
  #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
  #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
 diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
-index d054668b8e..9b4caa7651 100644
+index f4488dd692..1d331a7ee2 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
-@@ -10,6 +10,7 @@
- #include "macro.h"
+@@ -11,6 +11,7 @@
  #include "recurse-dir.h"
  #include "string-util.h"
+ #include "virt.h"
 +#include "missing_stdlib.h"
  
  #if HAVE_KMOD
  #include "module-util.h"
 diff --git a/src/core/service.c b/src/core/service.c
-index 87f0d34c8c..ccda3feb29 100644
+index 9f7af9dffb..3ec5e30c8b 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -42,6 +42,7 @@
@@ -330,13 +330,13 @@ index 87f0d34c8c..ccda3feb29 100644
  #include "util.h"
 +#include "missing_stdlib.h"
  
- static const UnitActiveState state_translation_table[_SERVICE_STATE_MAX] = {
-         [SERVICE_DEAD] = UNIT_INACTIVE,
+ #define service_spawn(...) service_spawn_internal(__func__, __VA_ARGS__)
+
 diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-vacuum.c
-index dcf9cc03cd..8f8d992ec2 100644
+index c6e201ecf2..ab034475e2 100644
 --- a/src/coredump/coredump-vacuum.c
 +++ b/src/coredump/coredump-vacuum.c
-@@ -16,6 +16,7 @@
+@@ -17,6 +17,7 @@
  #include "string-util.h"
  #include "time-util.h"
  #include "user-util.h"
@@ -369,10 +369,10 @@ index 3e3646e45f..6a8fc60f6d 100644
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
 diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
-index 3c4a7c0a7a..6a792404f2 100644
+index cff34fd585..a5003e47e9 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
-@@ -73,6 +73,7 @@
+@@ -74,6 +74,7 @@
  #include "unit-name.h"
  #include "user-util.h"
  #include "varlink.h"
@@ -393,11 +393,11 @@ index 96529b422b..ddb5e9c698 100644
  static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
  
 diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
-index 28d8336718..5d3ce88a53 100644
+index 909dfe4d3a..254b7ce866 100644
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
-@@ -12,6 +12,7 @@
- #include "set.h"
+@@ -11,6 +11,7 @@
+ #include "missing_capability.h"
  #include "string-util.h"
  #include "strv.h"
 +#include "missing_stdlib.h"
@@ -633,11 +633,11 @@ index f75ef62d2d..530001a821 100644
  static pid_t pager_pid = 0;
  
 diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
-index 2c07a1b7a8..2a9d6ef4ab 100644
+index 1b4396a34c..c2f72b185f 100644
 --- a/src/shared/uid-range.c
 +++ b/src/shared/uid-range.c
-@@ -9,6 +9,7 @@
- #include "sort-util.h"
+@@ -14,6 +14,7 @@
+ #include "stat-util.h"
  #include "uid-range.h"
  #include "user-util.h"
 +#include "missing_stdlib.h"
@@ -704,6 +704,3 @@ index 1a384d6b38..0089833e3f 100644
  
  #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
  
--- 
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index b84fbaa67e..eeaaac1b9a 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
@@ -131,7 +131,7 @@ index fcab51c208..fdef1807ae 100644
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
   * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -1961,7 +1967,9 @@ finish:
+@@ -1934,7 +1940,9 @@ finish:
  
  static int glob_item(Item *i, action_t action) {
          _cleanup_globfree_ glob_t g = {
@@ -140,8 +140,8 @@ index fcab51c208..fdef1807ae 100644
 +#endif
          };
          int r = 0, k;
-         char **fn;
-@@ -1981,7 +1989,9 @@ static int glob_item(Item *i, action_t action) {
+
+@@ -1953,7 +1961,9 @@ static int glob_item(Item *i, action_t action) {
  
  static int glob_item_recursively(Item *i, fdaction_t action) {
          _cleanup_globfree_ glob_t g = {
@@ -150,4 +150,3 @@ index fcab51c208..fdef1807ae 100644
 +#endif
          };
          int r = 0, k;
-         char **fn;
diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
index 4cce9a3fe6..d1191d7e8e 100644
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
@@ -7,59 +7,27 @@ This is to avoid build failures like below for musl.
 
   locale-util.c:296:24: error: 'FTW_STOP' undeclared
 
-Revisit this when upgrading to 251+ since most of these defines are not
-needed anymore except FTW_CONTINUE
-
 Upstream-Status: Inappropriate [musl specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
 ---
- src/basic/missing_type.h    | 20 ++++++++++++++++++++
- src/shared/mount-setup.c    |  1 +
- src/test/test-recurse-dir.c |  1 +
- 3 files changed, 22 insertions(+)
+ src/basic/missing_type.h    | 4 ++++
+ src/test/test-recurse-dir.c | 1 +
+ 2 files changed, 5 insertions(+)
 
 diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
-index aeaf6ad5ec..3df1084ef2 100644
+index 6c0456349d..73a5b90e3c 100644
 --- a/src/basic/missing_type.h
 +++ b/src/basic/missing_type.h
-@@ -19,3 +19,23 @@ typedef int (*comparison_fn_t)(const void *, const void *);
- #define __COMPAR_FN_T
- typedef int (*__compar_fn_t)(const void *, const void *);
+@@ -14,3 +14,7 @@
+ #ifndef __GLIBC__
+ typedef int (*comparison_fn_t)(const void *, const void *);
  #endif
 +
-+#ifndef FTW_ACTIONRETVAL
-+#define FTW_ACTIONRETVAL 16
-+#endif
-+
 +#ifndef FTW_CONTINUE
 +#define FTW_CONTINUE 0
 +#endif
-+
-+#ifndef FTW_STOP
-+#define FTW_STOP 1
-+#endif
-+
-+#ifndef FTW_SKIP_SUBTREE
-+#define FTW_SKIP_SUBTREE 2
-+#endif
-+
-+#ifndef FTW_SKIP_SIBLINGS
-+#define FTW_SKIP_SIBLINGS 3
-+#endif
-diff --git a/src/shared/mount-setup.c b/src/shared/mount-setup.c
-index 7917968497..cc3d5baaab 100644
---- a/src/shared/mount-setup.c
-+++ b/src/shared/mount-setup.c
-@@ -32,6 +32,7 @@
- #include "strv.h"
- #include "user-util.h"
- #include "virt.h"
-+#include "missing_type.h"
- 
- typedef enum MountMode {
-         MNT_NONE           = 0,
 diff --git a/src/test/test-recurse-dir.c b/src/test/test-recurse-dir.c
 index 2c2120b136..bc60a178a2 100644
 --- a/src/test/test-recurse-dir.c
diff --git a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
deleted file mode 100644
index e7b7269f95..0000000000
--- a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 3ca0920429f7eaf8c59f9ac8afd30a43b83d95ed Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 15:03:47 +0800
-Subject: [PATCH] fix missing of __register_atfork for non-glibc builds
-
-Upstream-Status: Inappropriate [musl specific]
-
-Drop this when upgrading to 251+, systemd does not use
-__register_atfork anymore
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
----
- src/basic/process-util.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index c971852158..df6e85b1fc 100644
---- a/src/basic/process-util.c
-+++ b/src/basic/process-util.c
-@@ -18,6 +18,9 @@
- #if HAVE_VALGRIND_VALGRIND_H
- #include <valgrind/valgrind.h>
- #endif
-+#ifndef __GLIBC__
-+#include <pthread.h>
-+#endif
- 
- #include "alloc-util.h"
- #include "architecture.h"
-@@ -1161,11 +1164,15 @@ void reset_cached_pid(void) {
-         cached_pid = CACHED_PID_UNSET;
- }
- 
-+#ifdef __GLIBC__
- /* We use glibc __register_atfork() + __dso_handle directly here, as they are not included in the glibc
-  * headers. __register_atfork() is mostly equivalent to pthread_atfork(), but doesn't require us to link against
-  * libpthread, as it is part of glibc anyway. */
- extern int __register_atfork(void (*prepare) (void), void (*parent) (void), void (*child) (void), void *dso_handle);
- extern void* __dso_handle _weak_;
-+#else
-+#define __register_atfork(prepare,parent,child,dso) pthread_atfork(prepare,parent,child)
-+#endif
- 
- pid_t getpid_cached(void) {
-         static bool installed = false;
diff --git a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
index 7e4587cc23..1074866f86 100644
--- a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
+++ b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
@@ -18,8 +18,8 @@ index f349852553..602772227e 100644
 +++ b/src/test/test-sizeof.c
 @@ -55,8 +55,10 @@ int main(void) {
          info(unsigned);
-         info(long unsigned);
-         info(long long unsigned);
+         info(unsigned long);
+         info(unsigned long long);
 +#ifdef __GLIBC__
          info(__syscall_ulong_t);
          info(__syscall_slong_t);
diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index 6eecd3197c..e1a2512ec3 100644
--- a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -65,10 +65,10 @@ index 0bbb3f6298..3dc494dbfb 100644
  int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid, gid_t gid, mode_t mode);
  int touch(const char *path);
 diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index 5f5328c8cf..d396bc99fe 100644
+index 6dacc1d20a..909a6818f6 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
-@@ -117,7 +117,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -131,7 +131,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
                  return log_error_errno(errno, "Failed to open root file system: %m");
  
          for (size_t i = 0; i < ELEMENTSOF(table); i++) {
@@ -77,7 +77,7 @@ index 5f5328c8cf..d396bc99fe 100644
                          continue;
  
                  if (table[i].target) {
-@@ -125,7 +125,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -139,7 +139,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
  
                          /* check if one of the targets exists */
                          NULSTR_FOREACH(s, table[i].target) {
@@ -86,7 +86,7 @@ index 5f5328c8cf..d396bc99fe 100644
                                          continue;
  
                                  /* check if a specific file exists at the target path */
-@@ -136,7 +136,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -150,7 +150,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
                                          if (!p)
                                                  return log_oom();
  
diff --git a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index 015347cb6a..e5e592a837 100644
--- a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index df6e85b1fc..635dbb5d26 100644
+index 6980e0c4f6..45ec26ea45 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
-@@ -1489,7 +1489,7 @@ int set_oom_score_adjust(int value) {
+@@ -1460,7 +1460,7 @@ int set_oom_score_adjust(int value) {
          xsprintf(t, "%i", value);
  
          return write_string_file("/proc/self/oom_score_adj", t,
diff --git a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
deleted file mode 100644
index 82a01f732e..0000000000
--- a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From e10a73de254b570bbc29b26423dbb86b4265bb05 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 16:53:06 +0800
-Subject: [PATCH] test-json.c: define M_PIl
-
-Fix the following compile failure:
-src/test/test-json.c:305:50: error: 'M_PIl' undeclared (first use in this function); did you mean 'M_PI'?
-
-Upstream-Status: Inappropriate [musl specific]
-
-This is fixed upstream where systemd no longer needs M_PIl so it could
-be dropped when upgrading to 251+ see
-https://github.com/systemd/systemd/commit/f9a1fd2a3b2d8212ba84ef1c3b55657ced34475e
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
----
- src/test/test-json.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/test/test-json.c b/src/test/test-json.c
-index b385edc269..5e5830238c 100644
---- a/src/test/test-json.c
-+++ b/src/test/test-json.c
-@@ -14,6 +14,10 @@
- #include "tests.h"
- #include "util.h"
- 
-+#ifndef M_PIl
-+#define M_PIl 3.141592653589793238462643383279502884L
-+#endif
-+
- static void test_tokenizer_one(const char *data, ...) {
-         unsigned line = 0, column = 0;
-         void *state = NULL;
diff --git a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
index 4dd6ff6e2e..00131de7d0 100644
--- a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
@@ -44,10 +44,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  21 files changed, 39 insertions(+), 40 deletions(-)
 
 diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index f7dc6c8421..5f7a27c2c4 100644
+index f4615ffce1..07cb8ed669 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -390,7 +390,7 @@ int cg_kill_kernel_sigkill(const char *controller, const char *path) {
+@@ -399,7 +399,7 @@ int cg_kill_kernel_sigkill(const char *controller, const char *path) {
          if (r < 0)
                  return r;
  
@@ -56,7 +56,7 @@ index f7dc6c8421..5f7a27c2c4 100644
          if (r < 0)
                  return r;
  
-@@ -803,7 +803,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -805,7 +805,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -65,7 +65,7 @@ index f7dc6c8421..5f7a27c2c4 100644
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -821,7 +821,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -823,7 +823,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -74,7 +74,7 @@ index f7dc6c8421..5f7a27c2c4 100644
                  if (r < 0)
                          return r;
  
-@@ -848,7 +848,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -850,7 +850,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -83,7 +83,7 @@ index f7dc6c8421..5f7a27c2c4 100644
          if (r < 0)
                  return r;
  
-@@ -858,7 +858,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -860,7 +860,7 @@ int cg_uninstall_release_agent(const char *controller) {
          if (r < 0)
                  return r;
  
@@ -92,7 +92,7 @@ index f7dc6c8421..5f7a27c2c4 100644
          if (r < 0)
                  return r;
  
-@@ -1704,7 +1704,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
+@@ -1730,7 +1730,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
          if (r < 0)
                  return r;
  
@@ -188,7 +188,7 @@ index 18231c2618..6c598d55c8 100644
          if (r < 0)
                  return log_error_errno(r, "%s:%u: Failed to add binary format '%s': %m",
                                         filename, line, rulename);
-@@ -226,7 +226,7 @@ static int run(int argc, char *argv[]) {
+@@ -225,7 +225,7 @@ static int run(int argc, char *argv[]) {
                  }
  
                  /* Flush out all rules */
@@ -198,10 +198,10 @@ index 18231c2618..6c598d55c8 100644
                          log_warning_errno(r, "Failed to flush binfmt_misc rules, ignoring: %m");
                  else
 diff --git a/src/core/cgroup.c b/src/core/cgroup.c
-index f58de95a49..7a97ab6f99 100644
+index 9282b1ff20..7781e0f8eb 100644
 --- a/src/core/cgroup.c
 +++ b/src/core/cgroup.c
-@@ -4140,7 +4140,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAction action) {
+@@ -4182,7 +4182,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAction action) {
          else
                  u->freezer_state = FREEZER_THAWING;
  
@@ -211,10 +211,10 @@ index f58de95a49..7a97ab6f99 100644
                  return r;
  
 diff --git a/src/core/main.c b/src/core/main.c
-index 57aedb9b93..7ef36d22f5 100644
+index 409b84a006..b1631e57ce 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1466,7 +1466,7 @@ static int bump_unix_max_dgram_qlen(void) {
+@@ -1374,7 +1374,7 @@ static int bump_unix_max_dgram_qlen(void) {
          if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
                  return 0;
  
@@ -223,7 +223,7 @@ index 57aedb9b93..7ef36d22f5 100644
                                 "%lu", DEFAULT_UNIX_MAX_DGRAM_QLEN);
          if (r < 0)
                  return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
-@@ -1737,7 +1737,7 @@ static void initialize_core_pattern(bool skip_setup) {
+@@ -1646,7 +1646,7 @@ static void initialize_core_pattern(bool skip_setup) {
          if (getpid_cached() != 1)
                  return;
  
@@ -259,23 +259,23 @@ index f88cb80834..68055fb64a 100644
                  log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
  #endif
 diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-resume/hibernate-resume.c
-index 58e35e403e..1d0beb4008 100644
+index 1c7d9179d8..3ae78ee580 100644
 --- a/src/hibernate-resume/hibernate-resume.c
 +++ b/src/hibernate-resume/hibernate-resume.c
-@@ -45,7 +45,7 @@ int main(int argc, char *argv[]) {
+@@ -40,7 +40,7 @@ int main(int argc, char *argv[]) {
                  return EXIT_FAILURE;
          }
  
--        r = write_string_file("/sys/power/resume", major_minor, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file("/sys/power/resume", major_minor, 0);
+-        r = write_string_file("/sys/power/resume", FORMAT_DEVNUM(st.st_rdev), WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/sys/power/resume", FORMAT_DEVNUM(st.st_rdev), 0);
          if (r < 0) {
-                 log_error_errno(r, "Failed to write '%s' to /sys/power/resume: %m", major_minor);
+                 log_error_errno(r, "Failed to write '" DEVNUM_FORMAT_STR "' to /sys/power/resume: %m", DEVNUM_FORMAT_VAL(st.st_rdev));
                  return EXIT_FAILURE;
 diff --git a/src/home/homework.c b/src/home/homework.c
-index 9fdc74b775..9858a2b415 100644
+index 0014a7f598..ec3e9caa1c 100644
 --- a/src/home/homework.c
 +++ b/src/home/homework.c
-@@ -284,7 +284,7 @@ static void drop_caches_now(void) {
+@@ -278,7 +278,7 @@ static void drop_caches_now(void) {
           * details. We write "2" into /proc/sys/vm/drop_caches to ensure dentries/inodes are flushed, but not
           * more. */
  
@@ -285,10 +285,10 @@ index 9fdc74b775..9858a2b415 100644
                  log_warning_errno(r, "Failed to drop caches, ignoring: %m");
          else
 diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
-index b163a0fb6b..fd6c5301d6 100644
+index aaf951ced8..45a9d70f0d 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -2108,7 +2108,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
+@@ -2215,7 +2215,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
          if (!value)
                  return -ENOMEM;
  
@@ -298,10 +298,10 @@ index b163a0fb6b..fd6c5301d6 100644
                  /* On failure, clear cache entry, as we do not know how it fails. */
                  device_remove_cached_sysattr_value(device, sysattr);
 diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
-index d472e80c03..c7780c7fc6 100644
+index 9e6379ae7b..546a03a7f5 100644
 --- a/src/nspawn/nspawn-cgroup.c
 +++ b/src/nspawn/nspawn-cgroup.c
-@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
+@@ -123,7 +123,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
          fn = strjoina(tree, cgroup, "/cgroup.procs");
  
          sprintf(pid_string, PID_FMT, pid);
@@ -311,7 +311,7 @@ index d472e80c03..c7780c7fc6 100644
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index fb6af295b5..0d83f1e4d2 100644
+index c5fd978395..fefe8a21e5 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
 @@ -2759,7 +2759,7 @@ static int reset_audit_loginuid(void) {
@@ -323,7 +323,7 @@ index fb6af295b5..0d83f1e4d2 100644
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This probably means that your kernel is too\n"
-@@ -4175,7 +4175,7 @@ static int setup_uid_map(
+@@ -4187,7 +4187,7 @@ static int setup_uid_map(
                  return log_oom();
  
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
@@ -332,7 +332,7 @@ index fb6af295b5..0d83f1e4d2 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write UID map: %m");
  
-@@ -4185,7 +4185,7 @@ static int setup_uid_map(
+@@ -4197,7 +4197,7 @@ static int setup_uid_map(
                  return log_oom();
  
          xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
@@ -355,19 +355,19 @@ index 724d7f27d9..dd725cff92 100644
                  return log_warning_errno(r, "Failed to unregister binfmt_misc entries: %m");
  
 diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
-index 8bda66ca36..4e1e9943ee 100644
+index a1fabc73c1..c5c8fc417e 100644
 --- a/src/shared/cgroup-setup.c
 +++ b/src/shared/cgroup-setup.c
-@@ -345,7 +345,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
+@@ -344,7 +344,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
  
          xsprintf(c, PID_FMT "\n", pid);
  
 -        r = write_string_file(fs, c, WRITE_STRING_FILE_DISABLE_BUFFER);
 +        r = write_string_file(fs, c, 0);
-         if (r < 0)
-                 return r;
- 
-@@ -877,7 +877,7 @@ int cg_enable_everywhere(
+         if (r == -EOPNOTSUPP && cg_is_threaded(controller, path) > 0)
+                 /* When the threaded mode is used, we cannot read/write the file. Let's return recognizable error. */
+                 return -EUCLEAN;
+@@ -879,7 +879,7 @@ int cg_enable_everywhere(
                                          return log_debug_errno(errno, "Failed to open cgroup.subtree_control file of %s: %m", p);
                          }
  
@@ -422,7 +422,7 @@ index 7064f3a905..8f2a7d9da2 100644
          if (r < 0)
                  return log_debug_errno(r, "Failed to write swap file offset to /sys/power/resume_offset for '%s': '%s': %m",
                                         hibernate_location->swap->device, offset_str);
-@@ -90,7 +90,7 @@ static int write_mode(char **modes) {
+@@ -89,7 +89,7 @@ static int write_mode(char **modes) {
          STRV_FOREACH(mode, modes) {
                  int k;
  
@@ -431,7 +431,7 @@ index 7064f3a905..8f2a7d9da2 100644
                  if (k >= 0)
                          return 0;
  
-@@ -112,7 +112,7 @@ static int write_state(FILE **f, char **states) {
+@@ -110,7 +110,7 @@ static int write_state(FILE **f, char **states) {
          STRV_FOREACH(state, states) {
                  int k;
  
@@ -441,10 +441,10 @@ index 7064f3a905..8f2a7d9da2 100644
                          return 0;
                  log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
 diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index 0089833e3f..0a6a3abbb4 100644
+index cd858c9cca..0feb9669a0 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
-@@ -2181,7 +2181,6 @@ static int udev_rule_apply_token_to_event(
+@@ -2335,7 +2335,6 @@ static int udev_rule_apply_token_to_event(
                  log_rule_debug(dev, rules, "ATTR '%s' writing '%s'", buf, value);
                  r = write_string_file(buf, value,
                                        WRITE_STRING_FILE_VERIFY_ON_FAILURE |
diff --git a/meta/recipes-core/systemd/systemd/38c87ca2ab96d085158485ecfc46c7cb6af0f166.patch b/meta/recipes-core/systemd/systemd/38c87ca2ab96d085158485ecfc46c7cb6af0f166.patch
index 2449023083..6ab89cd99e 100644
--- a/meta/recipes-core/systemd/systemd/38c87ca2ab96d085158485ecfc46c7cb6af0f166.patch
+++ b/meta/recipes-core/systemd/systemd/38c87ca2ab96d085158485ecfc46c7cb6af0f166.patch
@@ -22,15 +22,16 @@ Content-Transfer-Encoding: 8bit
 
 Upstream-Status: Backport
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
  src/fundamental/sha256.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/fundamental/sha256.c b/src/fundamental/sha256.c
-index 67d83b5f1cd6..f08959479643 100644
+index cd16aec4dd..58b1a80d33 100644
 --- a/src/fundamental/sha256.c
 +++ b/src/fundamental/sha256.c
-@@ -60,7 +60,7 @@
+@@ -58,7 +58,7 @@
  #  define UNALIGNED_P(p) (((size_t) p) % sizeof(uint32_t) != 0)
  # endif
  #else
diff --git a/meta/recipes-core/systemd/systemd_251.2.bb b/meta/recipes-core/systemd/systemd_251.2.bb
index a8ffb19ef9..47fe2dcf54 100644
--- a/meta/recipes-core/systemd/systemd_251.2.bb
+++ b/meta/recipes-core/systemd/systemd_251.2.bb
@@ -35,7 +35,6 @@ SRC_URI_MUSL = "\
                file://0005-src-basic-missing.h-check-for-missing-strndupa.patch \
                file://0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
                file://0008-add-missing-FTW_-macros-for-musl.patch \
-               file://0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch \
                file://0010-Use-uintmax_t-for-handling-rlim_t.patch \
                file://0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
                file://0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
@@ -43,7 +42,6 @@ SRC_URI_MUSL = "\
                file://0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch \
                file://0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch \
                file://0018-avoid-redefinition-of-prctl_mm_map-structure.patch \
-               file://0021-test-json.c-define-M_PIl.patch \
                file://0022-do-not-disable-buffer-in-writing-files.patch \
                file://0025-Handle-__cpu_mask-usage.patch \
                file://0026-Handle-missing-gshadow.patch \
-- 
2.35.1


