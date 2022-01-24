Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Khem Raj" <raj.khem@gmail.com>
Subject: [PATCH v2] systemd: Forward port musl patches
Date: Mon, 24 Jan 2022 11:11:43 -0800
Message-Id: <20220124191143.3330224-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>

Redo the header include patch and add fixes for new code.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix build with musl/mips

 .../0001-Adjust-for-musl-headers.patch        | 453 ++++++++++++++++++
 ...ass-correct-parameters-to-getdents64.patch |  50 ++
 .../0002-Add-sys-stat.h-for-S_IFDIR.patch     |  29 ++
 ...002-don-t-use-glibc-specific-qsort_r.patch |  26 +-
 ...dd-__compare_fn_t-and-comparison_fn_.patch |  14 +-
 ...k-parse_printf_format-implementation.patch |  22 +-
 ...missing.h-check-for-missing-strndupa.patch | 200 +++-----
 .../0006-Include-netinet-if_ether.h.patch     | 382 ---------------
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  28 +-
 ...008-add-missing-FTW_-macros-for-musl.patch |  16 +-
 ...10-Use-uintmax_t-for-handling-rlim_t.patch |  44 +-
 ...sable-tests-for-missing-typedefs-in-.patch |   8 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  19 +-
 ...patible-basename-for-non-glibc-syste.patch |   4 +-
 ...uffering-when-writing-to-oom_score_a.patch |   8 +-
 ...compliant-strerror_r-from-GNU-specif.patch |   8 +-
 ...ible-pointer-type-struct-sockaddr_un.patch |   4 +-
 .../0021-test-json.c-define-M_PIl.patch       |   6 +-
 ...-not-disable-buffer-in-writing-files.patch | 222 +++++----
 .../systemd/0026-Handle-missing-gshadow.patch |  14 +-
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch |  20 +-
 meta/recipes-core/systemd/systemd_250.3.bb    |   4 +-
 22 files changed, 809 insertions(+), 772 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch b/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch
new file mode 100644
index 00000000000..2363679c988
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch
@@ -0,0 +1,453 @@
+From 4c2e932664ec67662f4a0306cca4a7cd82853bda Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 21 Jan 2022 22:19:37 -0800
+Subject: [PATCH] Adjust for musl headers
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libsystemd-network/sd-dhcp6-client.c      | 2 +-
+ src/network/netdev/bareudp.c                  | 2 +-
+ src/network/netdev/batadv.c                   | 2 +-
+ src/network/netdev/bond.c                     | 2 +-
+ src/network/netdev/bridge.c                   | 2 +-
+ src/network/netdev/dummy.c                    | 2 +-
+ src/network/netdev/geneve.c                   | 2 +-
+ src/network/netdev/ifb.c                      | 2 +-
+ src/network/netdev/ipoib.c                    | 2 +-
+ src/network/netdev/ipvlan.c                   | 2 +-
+ src/network/netdev/macsec.c                   | 2 +-
+ src/network/netdev/macvlan.c                  | 2 +-
+ src/network/netdev/netdev.c                   | 2 +-
+ src/network/netdev/netdevsim.c                | 2 +-
+ src/network/netdev/nlmon.c                    | 2 +-
+ src/network/netdev/tunnel.c                   | 2 +-
+ src/network/netdev/vcan.c                     | 2 +-
+ src/network/netdev/veth.c                     | 2 +-
+ src/network/netdev/vlan.c                     | 2 +-
+ src/network/netdev/vrf.c                      | 2 +-
+ src/network/netdev/vxcan.c                    | 2 +-
+ src/network/netdev/vxlan.c                    | 2 +-
+ src/network/netdev/xfrm.c                     | 2 +-
+ src/network/networkd-bridge-mdb.c             | 4 ++--
+ src/network/networkd-dhcp-common.c            | 3 ++-
+ src/network/networkd-dhcp-prefix-delegation.c | 4 ++--
+ src/network/networkd-dhcp-server.c            | 2 +-
+ src/network/networkd-dhcp4.c                  | 2 +-
+ src/network/networkd-link.c                   | 2 +-
+ src/network/networkd-route.c                  | 8 ++++----
+ src/network/networkd-setlink.c                | 2 +-
+ src/shared/linux/ethtool.h                    | 3 ++-
+ src/shared/netif-util.c                       | 2 +-
+ src/udev/udev-builtin-net_id.c                | 2 +-
+ 34 files changed, 41 insertions(+), 39 deletions(-)
+
+--- a/src/libsystemd-network/sd-dhcp6-client.c
++++ b/src/libsystemd-network/sd-dhcp6-client.c
+@@ -5,7 +5,7 @@
+ 
+ #include <errno.h>
+ #include <sys/ioctl.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ #include <linux/if_infiniband.h>
+ 
+ #include "sd-dhcp6-client.h"
+--- a/src/network/netdev/bareudp.c
++++ b/src/network/netdev/bareudp.c
+@@ -2,7 +2,7 @@
+  * Copyright © 2020 VMware, Inc. */
+ 
+ #include <netinet/in.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ 
+ #include "bareudp.h"
+ #include "netlink-util.h"
+--- a/src/network/netdev/batadv.c
++++ b/src/network/netdev/batadv.c
+@@ -3,7 +3,7 @@
+ #include <inttypes.h>
+ #include <netinet/in.h>
+ #include <linux/genetlink.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ 
+ #include "batadv.h"
+ #include "fileio.h"
+--- a/src/network/netdev/bond.c
++++ b/src/network/netdev/bond.c
+@@ -1,7 +1,7 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
+ #include <netinet/in.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ 
+ #include "alloc-util.h"
+ #include "bond.h"
+--- a/src/network/netdev/bridge.c
++++ b/src/network/netdev/bridge.c
+@@ -2,7 +2,7 @@
+ 
+ #include <net/if.h>
+ #include <netinet/in.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ #include <linux/if_bridge.h>
+ 
+ #include "bridge.h"
+--- a/src/network/netdev/dummy.c
++++ b/src/network/netdev/dummy.c
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ 
+ #include "dummy.h"
+ 
+--- a/src/network/netdev/geneve.c
++++ b/src/network/netdev/geneve.c
+@@ -2,7 +2,7 @@
+ 
+ #include <net/if.h>
+ #include <netinet/in.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ 
+ #include "alloc-util.h"
+ #include "conf-parser.h"
+--- a/src/network/netdev/ifb.c
++++ b/src/network/netdev/ifb.c
+@@ -1,7 +1,7 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later
+  * Copyright © 2019 VMware, Inc. */
+ 
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ 
+ #include "ifb.h"
+ 
+--- a/src/network/netdev/ipoib.c
++++ b/src/network/netdev/ipoib.c
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ #include <linux/if_link.h>
+ 
+ #include "ipoib.h"
+--- a/src/network/netdev/ipvlan.c
++++ b/src/network/netdev/ipvlan.c
+@@ -2,7 +2,7 @@
+ 
+ #include <net/if.h>
+ #include <netinet/in.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ 
+ #include "conf-parser.h"
+ #include "ipvlan.h"
+--- a/src/network/netdev/macsec.c
++++ b/src/network/netdev/macsec.c
+@@ -1,7 +1,7 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
+ #include <netinet/in.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ #include <linux/if_ether.h>
+ #include <linux/if_macsec.h>
+ #include <linux/genetlink.h>
+--- a/src/network/netdev/macvlan.c
++++ b/src/network/netdev/macvlan.c
+@@ -2,7 +2,7 @@
+ 
+ #include <net/if.h>
+ #include <netinet/in.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ 
+ #include "conf-parser.h"
+ #include "macvlan.h"
+--- a/src/network/netdev/netdev.c
++++ b/src/network/netdev/netdev.c
+@@ -2,7 +2,7 @@
+ 
+ #include <net/if.h>
+ #include <netinet/in.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ #include <unistd.h>
+ 
+ #include "alloc-util.h"
+--- a/src/network/netdev/netdevsim.c
++++ b/src/network/netdev/netdevsim.c
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ 
+ #include "netdevsim.h"
+ 
+--- a/src/network/netdev/nlmon.c
++++ b/src/network/netdev/nlmon.c
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ 
+ #include "nlmon.h"
+ 
+--- a/src/network/netdev/tunnel.c
++++ b/src/network/netdev/tunnel.c
+@@ -2,7 +2,7 @@
+ 
+ #include <netinet/in.h>
+ #include <linux/fou.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ #include <linux/if_tunnel.h>
+ #include <linux/ip.h>
+ #include <linux/ip6_tunnel.h>
+--- a/src/network/netdev/vcan.c
++++ b/src/network/netdev/vcan.c
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ 
+ #include "vcan.h"
+ 
+--- a/src/network/netdev/veth.c
++++ b/src/network/netdev/veth.c
+@@ -3,7 +3,7 @@
+ #include <errno.h>
+ #include <net/if.h>
+ #include <netinet/in.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ #include <linux/veth.h>
+ 
+ #include "netlink-util.h"
+--- a/src/network/netdev/vlan.c
++++ b/src/network/netdev/vlan.c
+@@ -2,7 +2,7 @@
+ 
+ #include <errno.h>
+ #include <net/if.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ #include <linux/if_vlan.h>
+ 
+ #include "parse-util.h"
+--- a/src/network/netdev/vrf.c
++++ b/src/network/netdev/vrf.c
+@@ -2,7 +2,7 @@
+ 
+ #include <net/if.h>
+ #include <netinet/in.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ 
+ #include "vrf.h"
+ 
+--- a/src/network/netdev/vxcan.c
++++ b/src/network/netdev/vxcan.c
+@@ -1,7 +1,7 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
+ #include <linux/can/vxcan.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ 
+ #include "vxcan.h"
+ 
+--- a/src/network/netdev/vxlan.c
++++ b/src/network/netdev/vxlan.c
+@@ -2,7 +2,7 @@
+ 
+ #include <net/if.h>
+ #include <netinet/in.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ 
+ #include "conf-parser.h"
+ #include "alloc-util.h"
+--- a/src/network/netdev/xfrm.c
++++ b/src/network/netdev/xfrm.c
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ 
+ #include "missing_network.h"
+ #include "xfrm.h"
+--- a/src/network/networkd-bridge-mdb.c
++++ b/src/network/networkd-bridge-mdb.c
+@@ -1,7 +1,5 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
+-#include <net/if.h>
+-#include <linux/if_bridge.h>
+ 
+ #include "netlink-util.h"
+ #include "networkd-bridge-mdb.h"
+@@ -11,6 +9,8 @@
+ #include "networkd-queue.h"
+ #include "string-util.h"
+ #include "vlan-util.h"
++#include <net/if.h>
++#include <linux/if_bridge.h>
+ 
+ #define STATIC_BRIDGE_MDB_ENTRIES_PER_NETWORK_MAX 1024U
+ 
+--- a/src/network/networkd-dhcp-common.c
++++ b/src/network/networkd-dhcp-common.c
+@@ -1,7 +1,8 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
+ #include <netinet/in.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
++#include <net/if.h>
+ 
+ #include "bus-error.h"
+ #include "dhcp-identifier.h"
+--- a/src/network/networkd-dhcp-prefix-delegation.c
++++ b/src/network/networkd-dhcp-prefix-delegation.c
+@@ -1,7 +1,5 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
+-#include <linux/ipv6_route.h>
+-
+ #include "sd-dhcp6-client.h"
+ 
+ #include "hashmap.h"
+@@ -21,6 +19,8 @@
+ #include "strv.h"
+ #include "tunnel.h"
+ 
++#include <linux/ipv6_route.h>
++
+ bool link_dhcp_pd_is_enabled(Link *link) {
+         assert(link);
+ 
+--- a/src/network/networkd-dhcp-server.c
++++ b/src/network/networkd-dhcp-server.c
+@@ -1,7 +1,7 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
+ #include <netinet/in.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ #include <linux/if.h>
+ 
+ #include "sd-dhcp-server.h"
+--- a/src/network/networkd-dhcp4.c
++++ b/src/network/networkd-dhcp4.c
+@@ -3,7 +3,7 @@
+ #include <netinet/in.h>
+ #include <netinet/ip.h>
+ #include <linux/if.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ 
+ #include "alloc-util.h"
+ #include "dhcp-client-internal.h"
+--- a/src/network/networkd-link.c
++++ b/src/network/networkd-link.c
+@@ -3,7 +3,7 @@
+ #include <net/if.h>
+ #include <netinet/in.h>
+ #include <linux/if.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ #include <linux/if_link.h>
+ #include <linux/netdevice.h>
+ #include <sys/socket.h>
+--- a/src/network/networkd-route.c
++++ b/src/network/networkd-route.c
+@@ -1,9 +1,5 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
+-#include <linux/icmpv6.h>
+-#include <linux/ipv6_route.h>
+-#include <linux/nexthop.h>
+-
+ #include "alloc-util.h"
+ #include "event-util.h"
+ #include "netlink-util.h"
+@@ -21,6 +17,10 @@
+ #include "vrf.h"
+ #include "wireguard.h"
+ 
++#include <linux/icmpv6.h>
++#include <linux/ipv6_route.h>
++#include <linux/nexthop.h>
++
+ int route_new(Route **ret) {
+         _cleanup_(route_freep) Route *route = NULL;
+ 
+--- a/src/network/networkd-setlink.c
++++ b/src/network/networkd-setlink.c
+@@ -2,7 +2,7 @@
+ 
+ #include <netinet/in.h>
+ #include <linux/if.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ #include <linux/if_bridge.h>
+ 
+ #include "missing_network.h"
+--- a/src/shared/linux/ethtool.h
++++ b/src/shared/linux/ethtool.h
+@@ -16,7 +16,8 @@
+ 
+ #include <linux/kernel.h>
+ #include <linux/types.h>
+-#include <linux/if_ether.h>
++#include <netinet/if_ether.h>
++//#include <linux/if_ether.h>
+ 
+ #ifndef __KERNEL__
+ #include <limits.h> /* for INT_MAX */
+--- a/src/shared/netif-util.c
++++ b/src/shared/netif-util.c
+@@ -1,6 +1,6 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ 
+ #include "arphrd-util.h"
+ #include "device-util.h"
+--- a/src/udev/udev-builtin-net_id.c
++++ b/src/udev/udev-builtin-net_id.c
+@@ -18,7 +18,7 @@
+ #include <stdarg.h>
+ #include <unistd.h>
+ #include <linux/if.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ #include <linux/netdevice.h>
+ #include <linux/pci_regs.h>
+ 
+--- a/src/network/netdev/wireguard.c
++++ b/src/network/netdev/wireguard.c
+@@ -6,7 +6,7 @@
+ #include <sys/ioctl.h>
+ #include <net/if.h>
+ #include <netinet/in.h>
+-#include <linux/if_arp.h>
++//#include <linux/if_arp.h>
+ #include <linux/ipv6_route.h>
+ 
+ #include "sd-resolve.h"
diff --git a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
new file mode 100644
index 00000000000..03a29b5327f
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
@@ -0,0 +1,50 @@
+From fbc10748c7c59d82024a4d35146b8dfef8d52927 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 21 Jan 2022 15:15:11 -0800
+Subject: [PATCH 1/2] pass correct parameters to getdents64
+
+Fixes
+../git/src/basic/recurse-dir.c:57:40: error: incompatible pointer types passing 'uint8_t *' (aka 'unsigned char *') to parameter of type 'struct dirent *' [-Werror,-Wincompatible-pointer-types]
+                n = getdents64(dir_fd, (uint8_t*) de->buffer + de->buffer_size, bs - de->buffer_size);
+                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+../git/src/basic/stat-util.c:102:28: error: incompatible pointer types passing 'union (unnamed union at ../git/src/basic/stat-util.c:78:9) *' to parameter of type 'struct dirent *' [-Werror,-Wincompatible-pointer-types]
+        n = getdents64(fd, &buffer, sizeof(buffer));
+                           ^~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/basic/recurse-dir.c | 2 +-
+ src/basic/stat-util.c   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/basic/recurse-dir.c b/src/basic/recurse-dir.c
+index efa1797b7b..797285e3be 100644
+--- a/src/basic/recurse-dir.c
++++ b/src/basic/recurse-dir.c
+@@ -54,7 +54,7 @@ int readdir_all(int dir_fd,
+                 bs = MIN(MALLOC_SIZEOF_SAFE(de) - offsetof(DirectoryEntries, buffer), (size_t) SSIZE_MAX);
+                 assert(bs > de->buffer_size);
+ 
+-                n = getdents64(dir_fd, (uint8_t*) de->buffer + de->buffer_size, bs - de->buffer_size);
++                n = getdents64(dir_fd, de->buffer + de->buffer_size, bs - de->buffer_size);
+                 if (n < 0)
+                         return -errno;
+                 if (n == 0)
+diff --git a/src/basic/stat-util.c b/src/basic/stat-util.c
+index efac7b002e..9e1fe7f5a0 100644
+--- a/src/basic/stat-util.c
++++ b/src/basic/stat-util.c
+@@ -99,7 +99,7 @@ int dir_is_empty_at(int dir_fd, const char *path) {
+                         return fd;
+         }
+ 
+-        n = getdents64(fd, &buffer, sizeof(buffer));
++        n = getdents64(fd, (struct dirent *)&buffer, sizeof(buffer));
+         if (n < 0)
+                 return -errno;
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch b/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
new file mode 100644
index 00000000000..7dfa1a0df23
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
@@ -0,0 +1,29 @@
+From d16f7b37c917b91e951b9313e2c8264c72ed93e5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 21 Jan 2022 15:17:37 -0800
+Subject: [PATCH 2/2] Add sys/stat.h for S_IFDIR
+
+../git/src/shared/mkdir-label.c:13:61: error: use of undeclared identifier 'S_IFDIR'
+        r = mac_selinux_create_file_prepare_at(dirfd, path, S_IFDIR);
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/shared/mkdir-label.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/shared/mkdir-label.c b/src/shared/mkdir-label.c
+index d36a6466d7..63b764cd83 100644
+--- a/src/shared/mkdir-label.c
++++ b/src/shared/mkdir-label.c
+@@ -4,6 +4,7 @@
+ #include "selinux-util.h"
+ #include "smack-util.h"
+ #include "user-util.h"
++#include <sys/stat.h>
+ 
+ int mkdirat_label(int dirfd, const char *path, mode_t mode) {
+         int r;
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
index d03a1d9e765..5027682df27 100644
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
@@ -19,15 +19,13 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/shared/hwdb-util.c    | 19 ++++++++++++++-----
  3 files changed, 38 insertions(+), 31 deletions(-)
 
-diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
-index 49586a4a24..d92a5ab0ed 100644
 --- a/src/basic/sort-util.h
 +++ b/src/basic/sort-util.h
-@@ -55,18 +55,4 @@ static inline void _qsort_safe(void *base, size_t nmemb, size_t size, __compar_f
-                 _qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \
+@@ -61,18 +61,4 @@ static inline void _qsort_safe(void *bas
+                 _qsort_safe((p), (n), sizeof((p)[0]), (comparison_fn_t) _func_); \
          })
  
--static inline void qsort_r_safe(void *base, size_t nmemb, size_t size, __compar_d_fn_t compar, void *userdata) {
+-static inline void qsort_r_safe(void *base, size_t nmemb, size_t size, comparison_userdata_fn_t compar, void *userdata) {
 -        if (nmemb <= 1)
 -                return;
 -
@@ -38,15 +36,13 @@ index 49586a4a24..d92a5ab0ed 100644
 -#define typesafe_qsort_r(p, n, func, userdata)                          \
 -        ({                                                              \
 -                int (*_func_)(const typeof(p[0])*, const typeof(p[0])*, typeof(userdata)) = func; \
--                qsort_r_safe((p), (n), sizeof((p)[0]), (__compar_d_fn_t) _func_, userdata); \
+-                qsort_r_safe((p), (n), sizeof((p)[0]), (comparison_userdata_fn_t) _func_, userdata); \
 -        })
 -
  int cmp_int(const int *a, const int *b);
-diff --git a/src/shared/format-table.c b/src/shared/format-table.c
-index 4c4e4593d8..17b329f315 100644
 --- a/src/shared/format-table.c
 +++ b/src/shared/format-table.c
-@@ -1282,30 +1282,32 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
+@@ -1324,30 +1324,32 @@ static int cell_data_compare(TableData *
          return CMP(index_a, index_b);
  }
  
@@ -89,7 +85,7 @@ index 4c4e4593d8..17b329f315 100644
          }
  
          /* Order identical lines by the order there were originally added in */
-@@ -1944,7 +1946,12 @@ int table_print(Table *t, FILE *f) {
+@@ -2009,7 +2011,12 @@ int table_print(Table *t, FILE *f) {
                  for (size_t i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
@@ -103,7 +99,7 @@ index 4c4e4593d8..17b329f315 100644
          }
  
          if (t->display_map)
-@@ -2572,7 +2579,12 @@ int table_to_json(Table *t, JsonVariant **ret) {
+@@ -2647,7 +2654,12 @@ int table_to_json(Table *t, JsonVariant
                  for (size_t i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
@@ -117,11 +113,9 @@ index 4c4e4593d8..17b329f315 100644
          }
  
          if (t->display_map)
-diff --git a/src/shared/hwdb-util.c b/src/shared/hwdb-util.c
-index d7626aed95..2003fac7c3 100644
 --- a/src/shared/hwdb-util.c
 +++ b/src/shared/hwdb-util.c
-@@ -127,9 +127,13 @@ static struct trie* trie_free(struct trie *trie) {
+@@ -127,9 +127,13 @@ static struct trie* trie_free(struct tri
  
  DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
  
@@ -138,7 +132,7 @@ index d7626aed95..2003fac7c3 100644
  }
  
  static int trie_node_add_value(struct trie *trie, struct trie_node *node,
-@@ -157,7 +161,10 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+@@ -157,7 +161,10 @@ static int trie_node_add_value(struct tr
                          .value_off = v,
                  };
  
@@ -150,7 +144,7 @@ index d7626aed95..2003fac7c3 100644
                  if (val) {
                          /* At this point we have 2 identical properties on the same match-string.
                           * Since we process files in order, we just replace the previous value. */
-@@ -183,7 +190,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+@@ -183,7 +190,9 @@ static int trie_node_add_value(struct tr
                  .line_number = line_number,
          };
          node->values_count++;
diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
index eca52d0bda4..f3edc7d82b6 100644
--- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
+++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
@@ -21,8 +21,6 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  src/libsystemd/sd-journal/catalog.c | 1 +
  4 files changed, 12 insertions(+)
 
-diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
-index f6233090a9..aeaf6ad5ec 100644
 --- a/src/basic/missing_type.h
 +++ b/src/basic/missing_type.h
 @@ -10,3 +10,12 @@
@@ -38,8 +36,6 @@ index f6233090a9..aeaf6ad5ec 100644
 +#define __COMPAR_FN_T
 +typedef int (*__compar_fn_t)(const void *, const void *);
 +#endif
-diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
-index d92a5ab0ed..a63867c716 100644
 --- a/src/basic/sort-util.h
 +++ b/src/basic/sort-util.h
 @@ -4,6 +4,7 @@
@@ -48,22 +44,18 @@ index d92a5ab0ed..a63867c716 100644
  #include "macro.h"
 +#include "missing_type.h"
  
- void *xbsearch_r(const void *key, const void *base, size_t nmemb, size_t size,
-                  __compar_d_fn_t compar, void *arg);
-diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
-index 8a7f82812a..a56f12f47f 100644
+ /* This is the same as glibc's internal __compar_d_fn_t type. glibc exports a public comparison_fn_t, for the
+  * external type __compar_fn_t, but doesn't do anything similar for __compar_d_fn_t. Let's hence do that
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
 @@ -10,6 +10,7 @@
- #include "kmod-setup.h"
  #include "macro.h"
+ #include "recurse-dir.h"
  #include "string-util.h"
 +#include "missing_type.h"
  
  #if HAVE_KMOD
  #include "module-util.h"
-diff --git a/src/libsystemd/sd-journal/catalog.c b/src/libsystemd/sd-journal/catalog.c
-index ce8d47ccc3..00845f9776 100644
 --- a/src/libsystemd/sd-journal/catalog.c
 +++ b/src/libsystemd/sd-journal/catalog.c
 @@ -28,6 +28,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index 40ee43b1553..d93f6307528 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -22,11 +22,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  create mode 100644 src/basic/parse-printf-format.c
  create mode 100644 src/basic/parse-printf-format.h
 
-diff --git a/meson.build b/meson.build
-index 5bdfd9753d..3421da3a4d 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -656,6 +656,7 @@ endif
+@@ -686,6 +686,7 @@ endif
  foreach header : ['crypt.h',
                    'linux/memfd.h',
                    'linux/vm_sockets.h',
@@ -34,11 +32,9 @@ index 5bdfd9753d..3421da3a4d 100644
                    'sys/auxv.h',
                    'valgrind/memcheck.h',
                    'valgrind/valgrind.h',
-diff --git a/src/basic/meson.build b/src/basic/meson.build
-index 452b965db3..4e64d883dc 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
-@@ -321,6 +321,11 @@ endforeach
+@@ -335,6 +335,11 @@ endforeach
  
  basic_sources += generated_gperf_headers
  
@@ -50,9 +46,6 @@ index 452b965db3..4e64d883dc 100644
  ############################################################
  
  arch_list = [
-diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-format.c
-new file mode 100644
-index 0000000000..49437e5445
 --- /dev/null
 +++ b/src/basic/parse-printf-format.c
 @@ -0,0 +1,273 @@
@@ -329,9 +322,6 @@ index 0000000000..49437e5445
 +
 +        return last;
 +}
-diff --git a/src/basic/parse-printf-format.h b/src/basic/parse-printf-format.h
-new file mode 100644
-index 0000000000..47be7522d7
 --- /dev/null
 +++ b/src/basic/parse-printf-format.h
 @@ -0,0 +1,57 @@
@@ -392,8 +382,6 @@ index 0000000000..47be7522d7
 +size_t parse_printf_format(const char *fmt, size_t n, int *types);
 +
 +#endif /* HAVE_PRINTF_H */
-diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
-index 6dc1e72312..cea76b36cf 100644
 --- a/src/basic/stdio-util.h
 +++ b/src/basic/stdio-util.h
 @@ -1,13 +1,13 @@
@@ -409,10 +397,8 @@ index 6dc1e72312..cea76b36cf 100644
  #include "memory-util.h"
 +#include "parse-printf-format.h"
  
- #define snprintf_ok(buf, len, fmt, ...) \
-         ((size_t) snprintf(buf, len, fmt, __VA_ARGS__) < (len))
-diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/sd-journal/journal-send.c
-index fd3fd7ef9c..e8e6ad555b 100644
+ #define snprintf_ok(buf, len, fmt, ...)                                \
+         ({                                                             \
 --- a/src/libsystemd/sd-journal/journal-send.c
 +++ b/src/libsystemd/sd-journal/journal-send.c
 @@ -2,7 +2,6 @@
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index efdd43708b3..36545c2f60c 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -72,11 +72,9 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/udev/udev-rules.c                      |  1 +
  51 files changed, 62 insertions(+)
 
-diff --git a/meson.build b/meson.build
-index 3421da3a4d..ddef6fba91 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -480,6 +480,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
+@@ -507,6 +507,7 @@ foreach ident : ['secure_getenv', '__sec
  endforeach
  
  foreach ident : [
@@ -84,8 +82,6 @@ index 3421da3a4d..ddef6fba91 100644
          ['memfd_create',      '''#include <sys/mman.h>'''],
          ['gettid',            '''#include <sys/types.h>
                                   #include <unistd.h>'''],
-diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
-index 7c0970a60c..c129ff0f4f 100644
 --- a/src/backlight/backlight.c
 +++ b/src/backlight/backlight.c
 @@ -19,6 +19,7 @@
@@ -96,11 +92,9 @@ index 7c0970a60c..c129ff0f4f 100644
  
  static int help(void) {
          _cleanup_free_ char *link = NULL;
-diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index 1ff6160dc8..c9efd862a2 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -38,6 +38,7 @@
+@@ -37,6 +37,7 @@
  #include "unit-name.h"
  #include "user-util.h"
  #include "xattr-util.h"
@@ -108,11 +102,9 @@ index 1ff6160dc8..c9efd862a2 100644
  
  static int cg_enumerate_items(const char *controller, const char *path, FILE **_f, const char *item) {
          _cleanup_free_ char *fs = NULL;
-diff --git a/src/basic/env-util.c b/src/basic/env-util.c
-index 1ca445dab4..1f5a212d4e 100644
 --- a/src/basic/env-util.c
 +++ b/src/basic/env-util.c
-@@ -18,6 +18,7 @@
+@@ -19,6 +19,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "utf8.h"
@@ -120,8 +112,6 @@ index 1ca445dab4..1f5a212d4e 100644
  
  /* We follow bash for the character set. Different shells have different rules. */
  #define VALID_BASH_ENV_NAME_CHARS               \
-diff --git a/src/basic/log.c b/src/basic/log.c
-index fb183ea9e7..82e7bdff60 100644
 --- a/src/basic/log.c
 +++ b/src/basic/log.c
 @@ -36,6 +36,7 @@
@@ -132,8 +122,6 @@ index fb183ea9e7..82e7bdff60 100644
  
  #define SNDBUF_SIZE (8*1024*1024)
  
-diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
-index 8c76f93eb2..9068bfb4f0 100644
 --- a/src/basic/missing_stdlib.h
 +++ b/src/basic/missing_stdlib.h
 @@ -11,3 +11,15 @@
@@ -152,11 +140,9 @@ index 8c76f93eb2..9068bfb4f0 100644
 +    (char *)memcpy(__new, __old, __len); \
 +  })
 +#endif
-diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
-index f91f8f7a08..fb31596216 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
-@@ -14,6 +14,7 @@
+@@ -15,6 +15,7 @@
  #include "stat-util.h"
  #include "stdio-util.h"
  #include "user-util.h"
@@ -164,23 +150,19 @@ index f91f8f7a08..fb31596216 100644
  
  int mkdir_safe_internal(
                  const char *path,
-diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-util.c
-index 7e57d9a226..c0e64f2aca 100644
 --- a/src/basic/mountpoint-util.c
 +++ b/src/basic/mountpoint-util.c
-@@ -11,6 +11,7 @@
+@@ -13,6 +13,7 @@
  #include "missing_stat.h"
  #include "missing_syscall.h"
  #include "mkdir.h"
 +#include "missing_stdlib.h"
  #include "mountpoint-util.h"
+ #include "nulstr-util.h"
  #include "parse-util.h"
- #include "path-util.h"
-diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
-index b79c885dfd..6dabda5691 100644
 --- a/src/basic/parse-util.c
 +++ b/src/basic/parse-util.c
-@@ -19,6 +19,7 @@
+@@ -18,6 +18,7 @@
  #include "stat-util.h"
  #include "string-util.h"
  #include "strv.h"
@@ -188,11 +170,9 @@ index b79c885dfd..6dabda5691 100644
  
  int parse_boolean(const char *v) {
          if (!v)
-diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c
-index 05eb17d66c..b6026aab28 100644
 --- a/src/basic/path-lookup.c
 +++ b/src/basic/path-lookup.c
-@@ -15,6 +15,7 @@
+@@ -16,6 +16,7 @@
  #include "strv.h"
  #include "tmpfile-util.h"
  #include "user-util.h"
@@ -200,8 +180,6 @@ index 05eb17d66c..b6026aab28 100644
  
  int xdg_user_runtime_dir(char **ret, const char *suffix) {
          const char *e;
-diff --git a/src/basic/percent-util.c b/src/basic/percent-util.c
-index 06f20fd61e..8159d721bb 100644
 --- a/src/basic/percent-util.c
 +++ b/src/basic/percent-util.c
 @@ -3,6 +3,7 @@
@@ -212,8 +190,6 @@ index 06f20fd61e..8159d721bb 100644
  
  static int parse_parts_value_whole(const char *p, const char *symbol) {
          const char *pc, *n;
-diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
-index 410b8a3eb5..f2c4355609 100644
 --- a/src/basic/proc-cmdline.c
 +++ b/src/basic/proc-cmdline.c
 @@ -15,6 +15,7 @@
@@ -224,20 +200,16 @@ index 410b8a3eb5..f2c4355609 100644
  
  int proc_cmdline(char **ret) {
          const char *e;
-diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index 9234ccaf85..8c57094225 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
-@@ -11,6 +11,7 @@
+@@ -12,6 +12,7 @@
  #include "procfs-util.h"
  #include "stdio-util.h"
  #include "string-util.h"
 +#include "missing_stdlib.h"
  
- int procfs_tasks_get_limit(uint64_t *ret) {
+ int procfs_get_pid_max(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
-diff --git a/src/basic/time-util.c b/src/basic/time-util.c
-index 5d162e8ffe..1cde8e4262 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
 @@ -26,6 +26,7 @@
@@ -248,11 +220,9 @@ index 5d162e8ffe..1cde8e4262 100644
  
  static clockid_t map_clock_id(clockid_t c) {
  
-diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
-index 3fc319ca27..90064c90f3 100644
 --- a/src/boot/bless-boot.c
 +++ b/src/boot/bless-boot.c
-@@ -18,6 +18,7 @@
+@@ -19,6 +19,7 @@
  #include "util.h"
  #include "verbs.h"
  #include "virt.h"
@@ -260,23 +230,9 @@ index 3fc319ca27..90064c90f3 100644
  
  static char **arg_path = NULL;
  
-diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
-index 84c3caf3a5..0fa84eaa38 100644
---- a/src/core/dbus-cgroup.c
-+++ b/src/core/dbus-cgroup.c
-@@ -20,6 +20,7 @@
- #include "parse-util.h"
- #include "path-util.h"
- #include "percent-util.h"
-+#include "missing_stdlib.h"
- 
- BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
- 
-diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
-index 902e074bd2..ac15b944e6 100644
 --- a/src/core/dbus-execute.c
 +++ b/src/core/dbus-execute.c
-@@ -42,6 +42,7 @@
+@@ -44,6 +44,7 @@
  #include "unit-printf.h"
  #include "user-util.h"
  #include "utf8.h"
@@ -284,8 +240,6 @@ index 902e074bd2..ac15b944e6 100644
  
  BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_output, ExecOutput);
  static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec_input, ExecInput);
-diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
-index ca9b399d8c..b864480a8c 100644
 --- a/src/core/dbus-util.c
 +++ b/src/core/dbus-util.c
 @@ -9,6 +9,7 @@
@@ -296,11 +250,9 @@ index ca9b399d8c..b864480a8c 100644
  
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
-diff --git a/src/core/execute.c b/src/core/execute.c
-index 2f2de4d9cf..515b2fe748 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -98,6 +98,7 @@
+@@ -102,6 +102,7 @@
  #include "unit-serialize.h"
  #include "user-util.h"
  #include "utmp-wtmp.h"
@@ -308,23 +260,19 @@ index 2f2de4d9cf..515b2fe748 100644
  
  #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
  #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
-diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
-index a56f12f47f..6b8729ef67 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
 @@ -11,6 +11,7 @@
- #include "macro.h"
+ #include "recurse-dir.h"
  #include "string-util.h"
  #include "missing_type.h"
 +#include "missing_stdlib.h"
  
  #if HAVE_KMOD
  #include "module-util.h"
-diff --git a/src/core/service.c b/src/core/service.c
-index 7b90822f68..4af076eeba 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
-@@ -41,6 +41,7 @@
+@@ -42,6 +42,7 @@
  #include "unit.h"
  #include "utf8.h"
  #include "util.h"
@@ -332,8 +280,6 @@ index 7b90822f68..4af076eeba 100644
  
  static const UnitActiveState state_translation_table[_SERVICE_STATE_MAX] = {
          [SERVICE_DEAD] = UNIT_INACTIVE,
-diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-vacuum.c
-index 95c3fca661..d4a9f27b08 100644
 --- a/src/coredump/coredump-vacuum.c
 +++ b/src/coredump/coredump-vacuum.c
 @@ -16,6 +16,7 @@
@@ -344,8 +290,6 @@ index 95c3fca661..d4a9f27b08 100644
  
  #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)           /* 1 MiB */
  #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)   /* 4 GiB */
-diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
-index ae1d43756a..24de98c9f3 100644
 --- a/src/journal-remote/journal-remote-main.c
 +++ b/src/journal-remote/journal-remote-main.c
 @@ -24,6 +24,7 @@
@@ -356,11 +300,9 @@ index ae1d43756a..24de98c9f3 100644
  
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
-diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
-index 3eac97510d..db6913bc7a 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
-@@ -72,6 +72,7 @@
+@@ -73,6 +73,7 @@
  #include "unit-name.h"
  #include "user-util.h"
  #include "varlink.h"
@@ -368,8 +310,6 @@ index 3eac97510d..db6913bc7a 100644
  
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
  #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages processed */
-diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
-index 20f7396c74..3471311ef5 100644
 --- a/src/libsystemd/sd-bus/bus-message.c
 +++ b/src/libsystemd/sd-bus/bus-message.c
 @@ -20,6 +20,7 @@
@@ -380,8 +320,6 @@ index 20f7396c74..3471311ef5 100644
  
  static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
  
-diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
-index bfd42aea7d..daefc56e3e 100644
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
 @@ -12,6 +12,7 @@
@@ -392,11 +330,9 @@ index bfd42aea7d..daefc56e3e 100644
  
  static int node_vtable_get_userdata(
                  sd_bus *bus,
-diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-socket.c
-index 09eb49c37f..82f1b3d1be 100644
 --- a/src/libsystemd/sd-bus/bus-socket.c
 +++ b/src/libsystemd/sd-bus/bus-socket.c
-@@ -27,6 +27,7 @@
+@@ -28,6 +28,7 @@
  #include "string-util.h"
  #include "user-util.h"
  #include "utf8.h"
@@ -404,11 +340,9 @@ index 09eb49c37f..82f1b3d1be 100644
  
  #define SNDBUF_SIZE (8*1024*1024)
  
-diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
-index ab8d4e4a60..7e35fbe9e6 100644
 --- a/src/libsystemd/sd-bus/sd-bus.c
 +++ b/src/libsystemd/sd-bus/sd-bus.c
-@@ -42,6 +42,7 @@
+@@ -43,6 +43,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "user-util.h"
@@ -416,8 +350,6 @@ index ab8d4e4a60..7e35fbe9e6 100644
  
  #define log_debug_bus_message(m)                                         \
          do {                                                             \
-diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd/sd-bus/test-bus-benchmark.c
-index 13c08fe295..9aae83486e 100644
 --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
 +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
 @@ -14,6 +14,7 @@
@@ -428,11 +360,9 @@ index 13c08fe295..9aae83486e 100644
  
  #define MAX_SIZE (2*1024*1024)
  
-diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-journal/sd-journal.c
-index b3240177cb..7e3ae2d24f 100644
 --- a/src/libsystemd/sd-journal/sd-journal.c
 +++ b/src/libsystemd/sd-journal/sd-journal.c
-@@ -40,6 +40,7 @@
+@@ -41,6 +41,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "syslog-util.h"
@@ -440,8 +370,6 @@ index b3240177cb..7e3ae2d24f 100644
  
  #define JOURNAL_FILES_MAX 7168
  
-diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.c
-index d2f0566dbc..3b7746557e 100644
 --- a/src/locale/keymap-util.c
 +++ b/src/locale/keymap-util.c
 @@ -24,6 +24,7 @@
@@ -452,8 +380,6 @@ index d2f0566dbc..3b7746557e 100644
  
  static bool startswith_comma(const char *s, const char *prefix) {
          s = startswith(s, prefix);
-diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
-index f8bd17eefe..9633fbc152 100644
 --- a/src/login/pam_systemd.c
 +++ b/src/login/pam_systemd.c
 @@ -31,6 +31,7 @@
@@ -464,8 +390,6 @@ index f8bd17eefe..9633fbc152 100644
  #include "pam-util.h"
  #include "parse-util.h"
  #include "path-util.h"
-diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
-index 60e074e99b..a728e3b7a1 100644
 --- a/src/network/generator/network-generator.c
 +++ b/src/network/generator/network-generator.c
 @@ -13,6 +13,7 @@
@@ -476,8 +400,6 @@ index 60e074e99b..a728e3b7a1 100644
  
  /*
    # .network
-diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
-index 3847fe4ec4..3696b57baa 100644
 --- a/src/nspawn/nspawn-settings.c
 +++ b/src/nspawn/nspawn-settings.c
 @@ -17,6 +17,7 @@
@@ -488,8 +410,6 @@ index 3847fe4ec4..3696b57baa 100644
  
  Settings *settings_new(void) {
          Settings *s;
-diff --git a/src/nss-mymachines/nss-mymachines.c b/src/nss-mymachines/nss-mymachines.c
-index 44715bb3e5..bc1e688b5e 100644
 --- a/src/nss-mymachines/nss-mymachines.c
 +++ b/src/nss-mymachines/nss-mymachines.c
 @@ -21,6 +21,7 @@
@@ -498,34 +418,28 @@ index 44715bb3e5..bc1e688b5e 100644
  #include "string-util.h"
 +#include "missing_stdlib.h"
  
- static void setup_logging(void) {
-         /* We need a dummy function because log_parse_environment is a macro. */
-diff --git a/src/portable/portable.c b/src/portable/portable.c
-index 4cf5fb4f0a..577dc5c8d7 100644
+ static void setup_logging_once(void) {
+         static pthread_once_t once = PTHREAD_ONCE_INIT;
 --- a/src/portable/portable.c
 +++ b/src/portable/portable.c
-@@ -34,6 +34,7 @@
+@@ -39,6 +39,7 @@
  #include "strv.h"
  #include "tmpfile-util.h"
  #include "user-util.h"
 +#include "missing_stdlib.h"
  
- static const char profile_dirs[] = CONF_PATHS_NULSTR("systemd/portable/profile");
- 
-diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
-index 7d13ed3905..ddc37115b8 100644
+ /* Markers used in the first line of our 20-portable.conf unit file drop-in to determine, that a) the unit file was
+  * dropped there by the portable service logic and b) for which image it was dropped there. */
 --- a/src/resolve/resolvectl.c
 +++ b/src/resolve/resolvectl.c
-@@ -41,6 +41,7 @@
- #include "terminal-util.h"
+@@ -43,6 +43,7 @@
  #include "utf8.h"
+ #include "verb-log-control.h"
  #include "verbs.h"
 +#include "missing_stdlib.h"
  
  static int arg_family = AF_UNSPEC;
  static int arg_ifindex = 0;
-diff --git a/src/shared/bus-get-properties.c b/src/shared/bus-get-properties.c
-index feb6d3807f..eb11d29e50 100644
 --- a/src/shared/bus-get-properties.c
 +++ b/src/shared/bus-get-properties.c
 @@ -4,6 +4,7 @@
@@ -536,8 +450,6 @@ index feb6d3807f..eb11d29e50 100644
  
  int bus_property_get_bool(
                  sd_bus *bus,
-diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-procs.c
-index 6f4a71138c..4a46de2c1b 100644
 --- a/src/shared/bus-unit-procs.c
 +++ b/src/shared/bus-unit-procs.c
 @@ -10,6 +10,7 @@
@@ -548,11 +460,9 @@ index 6f4a71138c..4a46de2c1b 100644
  
  struct CGroupInfo {
          char *cgroup_path;
-diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
-index d3a5b25d18..003594e2d7 100644
 --- a/src/shared/bus-unit-util.c
 +++ b/src/shared/bus-unit-util.c
-@@ -47,6 +47,7 @@
+@@ -49,6 +49,7 @@
  #include "unit-def.h"
  #include "user-util.h"
  #include "utf8.h"
@@ -560,8 +470,6 @@ index d3a5b25d18..003594e2d7 100644
  
  int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
          assert(message);
-diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
-index 64ca67993c..31e3d148ea 100644
 --- a/src/shared/bus-util.c
 +++ b/src/shared/bus-util.c
 @@ -21,6 +21,7 @@
@@ -572,8 +480,6 @@ index 64ca67993c..31e3d148ea 100644
  
  static int name_owner_change_callback(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
          sd_event *e = userdata;
-diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
-index 787bb8fec9..009589a16f 100644
 --- a/src/shared/dns-domain.c
 +++ b/src/shared/dns-domain.c
 @@ -17,6 +17,7 @@
@@ -584,8 +490,6 @@ index 787bb8fec9..009589a16f 100644
  
  int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLabelFlags flags) {
          const char *n;
-diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
-index 9e11dc09c1..f9954c1520 100644
 --- a/src/shared/journal-importer.c
 +++ b/src/shared/journal-importer.c
 @@ -15,6 +15,7 @@
@@ -596,11 +500,9 @@ index 9e11dc09c1..f9954c1520 100644
  
  enum {
          IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
-diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
-index e63c59bd94..dd9773c009 100644
 --- a/src/shared/logs-show.c
 +++ b/src/shared/logs-show.c
-@@ -41,6 +41,7 @@
+@@ -42,6 +42,7 @@
  #include "utf8.h"
  #include "util.h"
  #include "web-util.h"
@@ -608,8 +510,6 @@ index e63c59bd94..dd9773c009 100644
  
  /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
  #define PRINT_LINE_THRESHOLD 3
-diff --git a/src/shared/pager.c b/src/shared/pager.c
-index 4bbad7e37b..eefcdd068c 100644
 --- a/src/shared/pager.c
 +++ b/src/shared/pager.c
 @@ -26,6 +26,7 @@
@@ -620,8 +520,6 @@ index 4bbad7e37b..eefcdd068c 100644
  
  static pid_t pager_pid = 0;
  
-diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
-index 5d5bf7f21d..f1002ffa6c 100644
 --- a/src/shared/uid-range.c
 +++ b/src/shared/uid-range.c
 @@ -9,6 +9,7 @@
@@ -632,8 +530,6 @@ index 5d5bf7f21d..f1002ffa6c 100644
  
  static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
          assert(range);
-diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
-index 6e3ee0d76b..7727e33d95 100644
 --- a/src/socket-proxy/socket-proxyd.c
 +++ b/src/socket-proxy/socket-proxyd.c
 @@ -26,6 +26,7 @@
@@ -644,20 +540,16 @@ index 6e3ee0d76b..7727e33d95 100644
  
  #define BUFFER_SIZE (256 * 1024)
  
-diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
-index c9d318b8d1..fcb8d40805 100644
 --- a/src/test/test-hexdecoct.c
 +++ b/src/test/test-hexdecoct.c
-@@ -6,6 +6,7 @@
- #include "hexdecoct.h"
+@@ -7,6 +7,7 @@
  #include "macro.h"
+ #include "random-util.h"
  #include "string-util.h"
 +#include "missing_stdlib.h"
+ #include "tests.h"
  
- static void test_hexchar(void) {
-         assert_se(hexchar(0xa) == 'a');
-diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
-index 65c40de4c8..4ef9a0c6c8 100644
+ TEST(hexchar) {
 --- a/src/udev/udev-builtin-path_id.c
 +++ b/src/udev/udev-builtin-path_id.c
 @@ -22,6 +22,7 @@
@@ -668,11 +560,9 @@ index 65c40de4c8..4ef9a0c6c8 100644
  
  _printf_(2,3)
  static void path_prepend(char **path, const char *fmt, ...) {
-diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
-index 9854270b27..71b5fab1e7 100644
 --- a/src/udev/udev-event.c
 +++ b/src/udev/udev-event.c
-@@ -34,6 +34,7 @@
+@@ -35,6 +35,7 @@
  #include "udev-util.h"
  #include "udev-watch.h"
  #include "user-util.h"
@@ -680,11 +570,9 @@ index 9854270b27..71b5fab1e7 100644
  
  typedef struct Spawn {
          sd_device *device;
-diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index bf997fc0ed..e3f5f1f2e2 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
-@@ -33,6 +33,7 @@
+@@ -34,6 +34,7 @@
  #include "udev-util.h"
  #include "user-util.h"
  #include "virt.h"
@@ -692,3 +580,23 @@ index bf997fc0ed..e3f5f1f2e2 100644
  
  #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
  
+--- a/src/core/dbus-cgroup.c
++++ b/src/core/dbus-cgroup.c
+@@ -21,6 +21,7 @@
+ #include "parse-util.h"
+ #include "path-util.h"
+ #include "percent-util.h"
++#include "missing_stdlib.h"
+ #include "socket-util.h"
+ 
+ BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
+--- a/src/fstab-generator/fstab-generator.c
++++ b/src/fstab-generator/fstab-generator.c
+@@ -29,6 +29,7 @@
+ #include "util.h"
+ #include "virt.h"
+ #include "volatile-util.h"
++#include "missing_stdlib.h"
+ 
+ typedef enum MountPointFlags {
+         MOUNT_NOAUTO    = 1 << 0,
diff --git a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
deleted file mode 100644
index 3875753ff44..00000000000
--- a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
+++ /dev/null
@@ -1,382 +0,0 @@
-From a3be3b7160856ffb8259ede9e2e0168d74bf126e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 26 Oct 2017 22:10:42 -0700
-Subject: [PATCH] Include netinet/if_ether.h
-
-Fixes
-/path/to/systemd/recipe-sysroot/usr/include/netinet/if_ether.h:101:8: error: redefinition of 'struct ethhdr'
- struct ethhdr {
-        ^~~~~~
-
-and related arphdr, arpreq, and arpreq_old errors
-/path/to/systemd/recipe-sysroot/usr/include/net/if_arp.h:22:8: error: redefinition of 'struct arphdr'
- struct arphdr {
-        ^~~~~~
-
-The latter requires removing some includes of net/if_arp.h to avoid
-conflicting with netinet/if_ether.h.
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[rebased for systemd 243]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
-
-Upstream-Status: Inappropriate [musl specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[rebased for systemd 243]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
-[rebased for systemd 247]
-Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
-
----
- src/basic/linux/in6.h                     | 14 +++++++-------
- src/libsystemd-network/sd-dhcp6-client.c  |  1 -
- src/libsystemd/sd-netlink/netlink-types.c |  1 +
- src/machine/machine-dbus.c                |  1 +
- src/network/netdev/bond.c                 |  1 +
- src/network/netdev/bridge.c               |  1 +
- src/network/netdev/macsec.c               |  1 +
- src/network/netdev/netdev-gperf.gperf     |  1 +
- src/network/netdev/netdev.c               |  1 +
- src/network/networkd-bridge-vlan.c        |  1 +
- src/network/networkd-dhcp-common.c        |  4 +++-
- src/network/networkd-dhcp-server.c        |  4 ++--
- src/network/networkd-dhcp4.c              |  2 +-
- src/network/networkd-dhcp6.c              |  2 +-
- src/network/networkd-link.c               |  2 +-
- src/network/networkd-network.c            |  1 +
- src/network/networkd-route.c              |  1 +
- src/network/networkd-setlink.c            |  2 +-
- src/network/test-network-tables.c         |  1 +
- src/shared/ethtool-util.c                 |  1 +
- src/shared/ethtool-util.h                 |  1 +
- src/udev/net/link-config.c                |  1 +
- src/udev/udev-builtin-net_setup_link.c    |  1 +
- 23 files changed, 31 insertions(+), 15 deletions(-)
-
-diff --git a/src/basic/linux/in6.h b/src/basic/linux/in6.h
-index 5ad396a57e..1dc007fe13 100644
---- a/src/basic/linux/in6.h
-+++ b/src/basic/linux/in6.h
-@@ -1,10 +1,10 @@
- /* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
- /*
-- *	Types and definitions for AF_INET6 
-- *	Linux INET6 implementation 
-+ *	Types and definitions for AF_INET6
-+ *	Linux INET6 implementation
-  *
-  *	Authors:
-- *	Pedro Roque		<roque@di.fc.ul.pt>	
-+ *	Pedro Roque		<roque@di.fc.ul.pt>
-  *
-  *	Sources:
-  *	IPv6 Program Interfaces for BSD Systems
-@@ -19,8 +19,8 @@
-  *      2 of the License, or (at your option) any later version.
-  */
- 
--#ifndef _UAPI_LINUX_IN6_H
--#define _UAPI_LINUX_IN6_H
-+#ifndef _LINUX_IN6_H
-+#define _LINUX_IN6_H
- 
- #include <linux/types.h>
- #include <linux/libc-compat.h>
-@@ -97,7 +97,7 @@ struct in6_flowlabel_req {
- 
- 
- /*
-- *	Bitmask constant declarations to help applications select out the 
-+ *	Bitmask constant declarations to help applications select out the
-  *	flow label and priority fields.
-  *
-  *	Note that this are in host byte order while the flowinfo field of
-@@ -298,4 +298,4 @@ struct in6_flowlabel_req {
-  * ...
-  * MRT6_MAX
-  */
--#endif /* _UAPI_LINUX_IN6_H */
-+#endif /* _LINUX_IN6_H */
-diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-network/sd-dhcp6-client.c
-index efbf7d7df3..86906332b6 100644
---- a/src/libsystemd-network/sd-dhcp6-client.c
-+++ b/src/libsystemd-network/sd-dhcp6-client.c
-@@ -5,7 +5,6 @@
- 
- #include <errno.h>
- #include <sys/ioctl.h>
--#include <linux/if_arp.h>
- #include <linux/if_infiniband.h>
- 
- #include "sd-dhcp6-client.h"
-diff --git a/src/libsystemd/sd-netlink/netlink-types.c b/src/libsystemd/sd-netlink/netlink-types.c
-index beb926d40b..41de212242 100644
---- a/src/libsystemd/sd-netlink/netlink-types.c
-+++ b/src/libsystemd/sd-netlink/netlink-types.c
-@@ -3,6 +3,7 @@
- #include <netinet/in.h>
- #include <stdint.h>
- #include <sys/socket.h>
-+#include <netinet/if_ether.h>
- #include <linux/can/vxcan.h>
- #include <linux/netlink.h>
- #include <linux/rtnetlink.h>
-diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
-index 0022a980c5..fc22e51409 100644
---- a/src/machine/machine-dbus.c
-+++ b/src/machine/machine-dbus.c
-@@ -3,6 +3,7 @@
- #include <errno.h>
- #include <sys/mount.h>
- #include <sys/wait.h>
-+#include <netinet/if_ether.h>
- 
- /* When we include libgen.h because we need dirname() we immediately
-  * undefine basename() since libgen.h defines it as a macro to the POSIX
-diff --git a/src/network/netdev/bond.c b/src/network/netdev/bond.c
-index a7a4adce45..eb111a6c48 100644
---- a/src/network/netdev/bond.c
-+++ b/src/network/netdev/bond.c
-@@ -1,5 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
-+#include <netinet/if_ether.h>
- #include "alloc-util.h"
- #include "bond.h"
- #include "bond-util.h"
-diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge.c
-index 99fb9e1c3c..ecc6ca91bf 100644
---- a/src/network/netdev/bridge.c
-+++ b/src/network/netdev/bridge.c
-@@ -1,5 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
-+#include <netinet/if_ether.h>
- #include <net/if.h>
- 
- #include "bridge.h"
-diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
-index 77c5f8c4e7..04be1b4ab2 100644
---- a/src/network/netdev/macsec.c
-+++ b/src/network/netdev/macsec.c
-@@ -1,5 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
-+#include <netinet/if_ether.h>
- #include <netinet/in.h>
- #include <linux/if_ether.h>
- #include <linux/if_macsec.h>
-diff --git a/src/network/netdev/netdev-gperf.gperf b/src/network/netdev/netdev-gperf.gperf
-index 9dd081425e..130e5b3d3c 100644
---- a/src/network/netdev/netdev-gperf.gperf
-+++ b/src/network/netdev/netdev-gperf.gperf
-@@ -3,6 +3,7 @@
- #if __GNUC__ >= 7
- _Pragma("GCC diagnostic ignored \"-Wimplicit-fallthrough\"")
- #endif
-+#include <netinet/if_ether.h>
- #include <stddef.h>
- #include "bareudp.h"
- #include "batadv.h"
-diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
-index 53534d4873..1cfda9469f 100644
---- a/src/network/netdev/netdev.c
-+++ b/src/network/netdev/netdev.c
-@@ -1,5 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
-+#include <netinet/if_ether.h>
- #include <net/if.h>
- #include <netinet/in.h>
- #include <unistd.h>
-diff --git a/src/network/networkd-bridge-vlan.c b/src/network/networkd-bridge-vlan.c
-index 3153bf6984..687a26b057 100644
---- a/src/network/networkd-bridge-vlan.c
-+++ b/src/network/networkd-bridge-vlan.c
-@@ -4,6 +4,7 @@
- ***/
- 
- #include <netinet/in.h>
-+#include <netinet/if_ether.h>
- #include <linux/if_bridge.h>
- #include <stdbool.h>
- 
-diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-dhcp-common.c
-index 249d780887..edd2e9adf8 100644
---- a/src/network/networkd-dhcp-common.c
-+++ b/src/network/networkd-dhcp-common.c
-@@ -1,7 +1,8 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
- #include <netinet/in.h>
--#include <linux/if_arp.h>
-+#include <net/if_arp.h>
-+#include <net/if.h>
- 
- #include "bus-error.h"
- #include "dhcp-identifier.h"
-@@ -13,6 +14,7 @@
- #include "networkd-dhcp-common.h"
- #include "networkd-link.h"
- #include "networkd-manager.h"
-+#include <netinet/if_ether.h>
- #include "networkd-network.h"
- #include "parse-util.h"
- #include "socket-util.h"
-diff --git a/src/network/networkd-dhcp-server.c b/src/network/networkd-dhcp-server.c
-index 9e2faa5675..fd8d817569 100644
---- a/src/network/networkd-dhcp-server.c
-+++ b/src/network/networkd-dhcp-server.c
-@@ -1,8 +1,8 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
- #include <netinet/in.h>
--#include <linux/if_arp.h>
--#include <linux/if.h>
-+#include <net/if_arp.h>
-+#include <net/if.h>
- 
- #include "sd-dhcp-server.h"
- 
-diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
-index f80adcdbcf..3311e2a718 100644
---- a/src/network/networkd-dhcp4.c
-+++ b/src/network/networkd-dhcp4.c
-@@ -1,9 +1,9 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
-+#include <netinet/if_ether.h>
- #include <netinet/in.h>
- #include <netinet/ip.h>
- #include <linux/if.h>
--#include <linux/if_arp.h>
- 
- #include "escape.h"
- #include "alloc-util.h"
-diff --git a/src/network/networkd-dhcp6.c b/src/network/networkd-dhcp6.c
-index 2b72b618fc..d0d4cfb384 100644
---- a/src/network/networkd-dhcp6.c
-+++ b/src/network/networkd-dhcp6.c
-@@ -3,9 +3,9 @@
-   Copyright © 2014 Intel Corporation. All rights reserved.
- ***/
- 
-+#include <netinet/if_ether.h>
- #include <netinet/in.h>
- #include <linux/if.h>
--#include <linux/if_arp.h>
- 
- #include "sd-dhcp6-client.h"
- 
-diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index 20675f2306..2884511ff3 100644
---- a/src/network/networkd-link.c
-+++ b/src/network/networkd-link.c
-@@ -1,9 +1,9 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
- #include <net/if.h>
-+#include <netinet/if_ether.h>
- #include <netinet/in.h>
- #include <linux/if.h>
--#include <linux/if_arp.h>
- #include <linux/if_link.h>
- #include <linux/netdevice.h>
- #include <sys/socket.h>
-diff --git a/src/network/networkd-network.c b/src/network/networkd-network.c
-index 850b4f449e..6f85d41328 100644
---- a/src/network/networkd-network.c
-+++ b/src/network/networkd-network.c
-@@ -1,5 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
-+#include <netinet/if_ether.h>
- #include <net/if.h>
- #include <netinet/in.h>
- #include <linux/netdevice.h>
-diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
-index eeba31c45d..0a2b0ed42b 100644
---- a/src/network/networkd-route.c
-+++ b/src/network/networkd-route.c
-@@ -1,5 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
-+#include <netinet/in.h>
- #include <linux/icmpv6.h>
- #include <linux/ipv6_route.h>
- #include <linux/nexthop.h>
-diff --git a/src/network/networkd-setlink.c b/src/network/networkd-setlink.c
-index 13c4cedd10..6558d551ab 100644
---- a/src/network/networkd-setlink.c
-+++ b/src/network/networkd-setlink.c
-@@ -1,8 +1,8 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
- #include <netinet/in.h>
-+#include <net/if_arp.h>
- #include <linux/if.h>
--#include <linux/if_arp.h>
- 
- #include "missing_network.h"
- #include "netlink-util.h"
-diff --git a/src/network/test-network-tables.c b/src/network/test-network-tables.c
-index f55e524ae9..83d5c7cef3 100644
---- a/src/network/test-network-tables.c
-+++ b/src/network/test-network-tables.c
-@@ -1,5 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
-+#include <netinet/if_ether.h>
- #include "bond.h"
- #include "dhcp6-internal.h"
- #include "dhcp6-protocol.h"
-diff --git a/src/shared/ethtool-util.c b/src/shared/ethtool-util.c
-index f77f6943ca..0e1506e04b 100644
---- a/src/shared/ethtool-util.c
-+++ b/src/shared/ethtool-util.c
-@@ -1,5 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
-+#include <netinet/if_ether.h>
- #include <net/if.h>
- #include <sys/ioctl.h>
- #include <linux/ethtool.h>
-diff --git a/src/shared/ethtool-util.h b/src/shared/ethtool-util.h
-index 7d28766624..e98a25418b 100644
---- a/src/shared/ethtool-util.h
-+++ b/src/shared/ethtool-util.h
-@@ -3,6 +3,7 @@
- 
- #include <macro.h>
- #include <net/ethernet.h>
-+#include <netinet/if_ether.h>
- #include <linux/ethtool.h>
- 
- #include "conf-parser.h"
-diff --git a/src/udev/net/link-config.c b/src/udev/net/link-config.c
-index 8dfe23691b..e269856337 100644
---- a/src/udev/net/link-config.c
-+++ b/src/udev/net/link-config.c
-@@ -1,5 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
-+#include <netinet/if_ether.h>
- #include <linux/netdevice.h>
- #include <netinet/ether.h>
- #include <unistd.h>
-diff --git a/src/udev/udev-builtin-net_setup_link.c b/src/udev/udev-builtin-net_setup_link.c
-index 5964e30bf1..52a18d7a7f 100644
---- a/src/udev/udev-builtin-net_setup_link.c
-+++ b/src/udev/udev-builtin-net_setup_link.c
-@@ -1,5 +1,6 @@
- /* SPDX-License-Identifier: LGPL-2.1-or-later */
- 
-+#include <netinet/if_ether.h>
- #include "alloc-util.h"
- #include "device-util.h"
- #include "errno-util.h"
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index 1d8c4814679..846c01bd4f4 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
@@ -23,8 +23,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/tmpfiles/tmpfiles.c   | 10 ++++++++++
  3 files changed, 38 insertions(+)
 
-diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
-index e026b29478..815e56ef68 100644
 --- a/src/basic/glob-util.c
 +++ b/src/basic/glob-util.c
 @@ -12,6 +12,12 @@
@@ -48,7 +46,7 @@ index e026b29478..815e56ef68 100644
          /* We want to set GLOB_ALTDIRFUNC ourselves, don't allow it to be set. */
          assert(!(flags & GLOB_ALTDIRFUNC));
  
-@@ -32,9 +39,14 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
+@@ -32,9 +39,14 @@ int safe_glob(const char *path, int flag
                  pglob->gl_lstat = lstat;
          if (!pglob->gl_stat)
                  pglob->gl_stat = stat;
@@ -63,12 +61,10 @@ index e026b29478..815e56ef68 100644
          if (k == GLOB_NOMATCH)
                  return -ENOENT;
          if (k == GLOB_NOSPACE)
-diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
-index 50b4924679..09c0a20aee 100644
 --- a/src/test/test-glob-util.c
 +++ b/src/test/test-glob-util.c
-@@ -12,6 +12,12 @@
- #include "rm-rf.h"
+@@ -13,6 +13,12 @@
+ #include "tests.h"
  #include "tmpfile-util.h"
  
 +/* Don't fail if the standard library
@@ -77,10 +73,10 @@ index 50b4924679..09c0a20aee 100644
 +#define GLOB_BRACE 0
 +#endif
 +
- static void test_glob_exists(void) {
-         log_info("/* %s */", __func__);
- 
-@@ -41,11 +47,13 @@ static void test_glob_no_dot(void) {
+ TEST(glob_exists) {
+         char name[] = "/tmp/test-glob_exists.XXXXXX";
+         int fd = -1;
+@@ -40,11 +46,13 @@ TEST(glob_no_dot) {
          const char *fn;
  
          _cleanup_globfree_ glob_t g = {
@@ -94,7 +90,7 @@ index 50b4924679..09c0a20aee 100644
          };
  
          int r;
-@@ -55,11 +63,19 @@ static void test_glob_no_dot(void) {
+@@ -52,11 +60,19 @@ TEST(glob_no_dot) {
          assert_se(mkdtemp(template));
  
          fn = strjoina(template, "/*");
@@ -114,11 +110,9 @@ index 50b4924679..09c0a20aee 100644
          assert_se(r == GLOB_NOMATCH);
  
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
-diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index 7e85c50634..145c48a685 100644
 --- a/src/tmpfiles/tmpfiles.c
 +++ b/src/tmpfiles/tmpfiles.c
-@@ -66,6 +66,12 @@
+@@ -67,6 +67,12 @@
  #include "umask-util.h"
  #include "user-util.h"
  
@@ -131,7 +125,7 @@ index 7e85c50634..145c48a685 100644
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
   * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -1990,7 +1996,9 @@ finish:
+@@ -1961,7 +1967,9 @@ finish:
  
  static int glob_item(Item *i, action_t action) {
          _cleanup_globfree_ glob_t g = {
@@ -141,7 +135,7 @@ index 7e85c50634..145c48a685 100644
          };
          int r = 0, k;
          char **fn;
-@@ -2010,7 +2018,9 @@ static int glob_item(Item *i, action_t action) {
+@@ -1981,7 +1989,9 @@ static int glob_item(Item *i, action_t a
  
  static int glob_item_recursively(Item *i, fdaction_t action) {
          _cleanup_globfree_ glob_t g = {
diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
index c613581ef96..57e18a58087 100644
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
@@ -16,11 +16,9 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/shared/mount-setup.c |  1 +
  2 files changed, 21 insertions(+)
 
-diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
-index aeaf6ad5ec..3df1084ef2 100644
 --- a/src/basic/missing_type.h
 +++ b/src/basic/missing_type.h
-@@ -19,3 +19,23 @@ typedef int (*comparison_fn_t)(const void *, const void *);
+@@ -19,3 +19,23 @@ typedef int (*comparison_fn_t)(const voi
  #define __COMPAR_FN_T
  typedef int (*__compar_fn_t)(const void *, const void *);
  #endif
@@ -44,8 +42,6 @@ index aeaf6ad5ec..3df1084ef2 100644
 +#ifndef FTW_SKIP_SIBLINGS
 +#define FTW_SKIP_SIBLINGS 3
 +#endif
-diff --git a/src/shared/mount-setup.c b/src/shared/mount-setup.c
-index ef3527e9a7..c1cab40eb8 100644
 --- a/src/shared/mount-setup.c
 +++ b/src/shared/mount-setup.c
 @@ -32,6 +32,7 @@
@@ -56,3 +52,13 @@ index ef3527e9a7..c1cab40eb8 100644
  
  typedef enum MountMode {
          MNT_NONE           = 0,
+--- a/src/test/test-recurse-dir.c
++++ b/src/test/test-recurse-dir.c
+@@ -6,6 +6,7 @@
+ #include "recurse-dir.h"
+ #include "strv.h"
+ #include "tests.h"
++#include "missing_type.h"
+ 
+ static char **list_nftw = NULL;
+ 
diff --git a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
index ff981b8c74e..029f413aa81 100644
--- a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
@@ -27,12 +27,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/core/execute.c      |  4 ++--
  3 files changed, 9 insertions(+), 15 deletions(-)
 
-diff --git a/src/basic/format-util.h b/src/basic/format-util.h
-index b7e18768e3..3195ab205d 100644
 --- a/src/basic/format-util.h
 +++ b/src/basic/format-util.h
-@@ -32,13 +32,7 @@ assert_cc(sizeof(gid_t) == sizeof(uint32_t));
- #  define PRI_TIMEX "li"
+@@ -34,13 +34,7 @@ assert_cc(sizeof(gid_t) == sizeof(uint32
+ #  error Unknown timex member size
  #endif
  
 -#if SIZEOF_RLIM_T == 8
@@ -46,38 +44,36 @@ index b7e18768e3..3195ab205d 100644
  
  #if SIZEOF_DEV_T == 8
  #  define DEV_FMT "%" PRIu64
-diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
-index 23d108d5df..3e6fb438d7 100644
 --- a/src/basic/rlimit-util.c
 +++ b/src/basic/rlimit-util.c
-@@ -43,7 +43,7 @@ int setrlimit_closest(int resource, const struct rlimit *rlim) {
+@@ -44,7 +44,7 @@ int setrlimit_closest(int resource, cons
              fixed.rlim_max == highest.rlim_max)
                  return 0;
  
 -        log_debug("Failed at setting rlimit " RLIM_FMT " for resource RLIMIT_%s. Will attempt setting value " RLIM_FMT " instead.", rlim->rlim_max, rlimit_to_string(resource), fixed.rlim_max);
 +        log_debug("Failed at setting rlimit " RLIM_FMT " for resource RLIMIT_%s. Will attempt setting value " RLIM_FMT " instead.", (uintmax_t)rlim->rlim_max, rlimit_to_string(resource), (uintmax_t)fixed.rlim_max);
  
-         if (setrlimit(resource, &fixed) < 0)
-                 return -errno;
-@@ -308,13 +308,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
+         return RET_NERRNO(setrlimit(resource, &fixed));
+ }
+@@ -307,13 +307,13 @@ int rlimit_format(const struct rlimit *r
          if (rl->rlim_cur >= RLIM_INFINITY && rl->rlim_max >= RLIM_INFINITY)
-                 s = strdup("infinity");
+                 r = free_and_strdup(&s, "infinity");
          else if (rl->rlim_cur >= RLIM_INFINITY)
--                (void) asprintf(&s, "infinity:" RLIM_FMT, rl->rlim_max);
-+                (void) asprintf(&s, "infinity:" RLIM_FMT, (uintmax_t)rl->rlim_max);
+-                r = asprintf(&s, "infinity:" RLIM_FMT, rl->rlim_max);
++                r = asprintf(&s, "infinity:" RLIM_FMT, (uintmax_t)rl->rlim_max);
          else if (rl->rlim_max >= RLIM_INFINITY)
--                (void) asprintf(&s, RLIM_FMT ":infinity", rl->rlim_cur);
-+                (void) asprintf(&s, RLIM_FMT ":infinity", (uintmax_t)rl->rlim_cur);
+-                r = asprintf(&s, RLIM_FMT ":infinity", rl->rlim_cur);
++                r = asprintf(&s, RLIM_FMT ":infinity", (uintmax_t)rl->rlim_cur);
          else if (rl->rlim_cur == rl->rlim_max)
--                (void) asprintf(&s, RLIM_FMT, rl->rlim_cur);
-+                (void) asprintf(&s, RLIM_FMT, (uintmax_t)rl->rlim_cur);
+-                r = asprintf(&s, RLIM_FMT, rl->rlim_cur);
++                r = asprintf(&s, RLIM_FMT, (uintmax_t)rl->rlim_cur);
          else
--                (void) asprintf(&s, RLIM_FMT ":" RLIM_FMT, rl->rlim_cur, rl->rlim_max);
-+                (void) asprintf(&s, RLIM_FMT ":" RLIM_FMT, (uintmax_t)rl->rlim_cur, (uintmax_t)rl->rlim_max);
- 
-         if (!s)
+-                r = asprintf(&s, RLIM_FMT ":" RLIM_FMT, rl->rlim_cur, rl->rlim_max);
++                r = asprintf(&s, RLIM_FMT ":" RLIM_FMT, (uintmax_t)rl->rlim_cur, (uintmax_t)rl->rlim_max);
+         if (r < 0)
                  return -ENOMEM;
-@@ -405,7 +405,7 @@ int rlimit_nofile_safe(void) {
+ 
+@@ -403,7 +403,7 @@ int rlimit_nofile_safe(void) {
  
          rl.rlim_cur = FD_SETSIZE;
          if (setrlimit(RLIMIT_NOFILE, &rl) < 0)
@@ -86,11 +82,9 @@ index 23d108d5df..3e6fb438d7 100644
  
          return 1;
  }
-diff --git a/src/core/execute.c b/src/core/execute.c
-index 515b2fe748..7693f2d9a0 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -5395,9 +5395,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
+@@ -5639,9 +5639,9 @@ void exec_context_dump(const ExecContext
          for (unsigned i = 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
                          fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
diff --git a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
index 0ee871c92db..327084bae95 100644
--- a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
+++ b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
@@ -12,8 +12,6 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/test/test-sizeof.c | 4 ++++
  1 file changed, 4 insertions(+)
 
-diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
-index e36bee4e8f..4403c0aa52 100644
 --- a/src/test/test-sizeof.c
 +++ b/src/test/test-sizeof.c
 @@ -55,8 +55,10 @@ int main(void) {
@@ -24,10 +22,10 @@ index e36bee4e8f..4403c0aa52 100644
          info(__syscall_ulong_t);
          info(__syscall_slong_t);
 +#endif
+         info(intmax_t);
+         info(uintmax_t);
  
-         info(float);
-         info(double);
-@@ -74,7 +76,9 @@ int main(void) {
+@@ -76,7 +78,9 @@ int main(void) {
          info(ssize_t);
          info(time_t);
          info(usec_t);
diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index 12a92b8739a..0026a7b72a7 100644
--- a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -31,16 +31,12 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  src/shared/base-filesystem.c |  6 +++---
  2 files changed, 24 insertions(+), 5 deletions(-)
 
-diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
-index 7f15b558ca..4263298cad 100644
 --- a/src/basic/fs-util.h
 +++ b/src/basic/fs-util.h
-@@ -47,8 +47,27 @@ int futimens_opath(int fd, const struct timespec ts[2]);
+@@ -46,8 +46,27 @@ int futimens_opath(int fd, const struct
  int fd_warn_permissions(const char *path, int fd);
  int stat_warn_permissions(const char *path, const struct stat *st);
  
--#define laccess(path, mode)                                             \
--        (faccessat(AT_FDCWD, (path), (mode), AT_SYMLINK_NOFOLLOW) < 0 ? -errno : 0)
 +/*
 +   Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right thing to
 +   do and it's not portable (not supported by musl). See:
@@ -60,16 +56,15 @@ index 7f15b558ca..4263298cad 100644
 +   or why it needs to return success for broken symlinks. Maybe just historical
 +   and not actually necessary or desired behaviour?
 +*/
-+
-+#define laccess(path, mode) faccessat(AT_FDCWD, (path), (mode), 0)
+ #define laccess(path, mode)                                             \
+-        RET_NERRNO(faccessat(AT_FDCWD, (path), (mode), AT_SYMLINK_NOFOLLOW))
++        RET_NERRNO(faccessat(AT_FDCWD, (path), (mode), 0))
  
  int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid, gid_t gid, mode_t mode);
  int touch(const char *path);
-diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index 016eb7b82a..b1967f9f2f 100644
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
-@@ -53,7 +53,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -117,7 +117,7 @@ int base_filesystem_create(const char *r
                  return log_error_errno(errno, "Failed to open root file system: %m");
  
          for (size_t i = 0; i < ELEMENTSOF(table); i++) {
@@ -78,7 +73,7 @@ index 016eb7b82a..b1967f9f2f 100644
                          continue;
  
                  if (table[i].target) {
-@@ -61,7 +61,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -125,7 +125,7 @@ int base_filesystem_create(const char *r
  
                          /* check if one of the targets exists */
                          NULSTR_FOREACH(s, table[i].target) {
@@ -87,7 +82,7 @@ index 016eb7b82a..b1967f9f2f 100644
                                          continue;
  
                                  /* check if a specific file exists at the target path */
-@@ -72,7 +72,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -136,7 +136,7 @@ int base_filesystem_create(const char *r
                                          if (!p)
                                                  return log_oom();
  
diff --git a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index bd7a0c4e8ea..612a535d3c0 100644
--- a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -14,11 +14,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/machine/machine-dbus.c | 5 +++++
  1 file changed, 5 insertions(+)
 
-diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
-index fc22e51409..1fed07b941 100644
 --- a/src/machine/machine-dbus.c
 +++ b/src/machine/machine-dbus.c
-@@ -11,6 +11,11 @@
+@@ -10,6 +10,11 @@
  #include <libgen.h>
  #undef basename
  
diff --git a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index 7933b9e76e1..baf49038031 100644
--- a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -24,16 +24,14 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/basic/process-util.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 2d06f9f60a..f86bd0b7dc 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
-@@ -1606,7 +1606,7 @@ int set_oom_score_adjust(int value) {
-         sprintf(t, "%i", value);
+@@ -1489,7 +1489,7 @@ int set_oom_score_adjust(int value) {
+         xsprintf(t, "%i", value);
  
          return write_string_file("/proc/self/oom_score_adj", t,
 -                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE|WRITE_STRING_FILE_DISABLE_BUFFER);
 +                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE);
  }
  
- int pidfd_get_pid(int fd, pid_t *ret) {
+ int get_oom_score_adjust(int *ret) {
diff --git a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index 0b0d2a64312..878914b3079 100644
--- a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -24,11 +24,9 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/libsystemd/sd-journal/journal-send.c | 5 +++++
  2 files changed, 10 insertions(+)
 
-diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
-index 7483b46a11..c49be29e46 100644
 --- a/src/libsystemd/sd-bus/bus-error.c
 +++ b/src/libsystemd/sd-bus/bus-error.c
-@@ -404,7 +404,12 @@ static void bus_error_strerror(sd_bus_error *e, int error) {
+@@ -409,7 +409,12 @@ static void bus_error_strerror(sd_bus_er
                          return;
  
                  errno = 0;
@@ -41,11 +39,9 @@ index 7483b46a11..c49be29e46 100644
                  if (errno == ERANGE || strlen(x) >= k - 1) {
                          free(m);
                          k *= 2;
-diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/sd-journal/journal-send.c
-index e8e6ad555b..8ca5271d02 100644
 --- a/src/libsystemd/sd-journal/journal-send.c
 +++ b/src/libsystemd/sd-journal/journal-send.c
-@@ -348,7 +348,12 @@ static int fill_iovec_perror_and_send(const char *message, int skip, struct iove
+@@ -348,7 +348,12 @@ static int fill_iovec_perror_and_send(co
                  char* j;
  
                  errno = 0;
diff --git a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
index 2d272ed3e80..1ba5c1292bd 100644
--- a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
+++ b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
@@ -23,11 +23,9 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  src/nspawn/nspawn.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 575b9da447..ff08ed23cc 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -5354,7 +5354,7 @@ static int cant_be_in_netns(void) {
+@@ -5389,7 +5389,7 @@ static int cant_be_in_netns(void) {
          if (fd < 0)
                  return log_error_errno(errno, "Failed to allocate udev control socket: %m");
  
diff --git a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
index 3fe5aeab137..dfab8fbbdfe 100644
--- a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
@@ -14,11 +14,9 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/test/test-json.c | 4 ++++
  1 file changed, 4 insertions(+)
 
-diff --git a/src/test/test-json.c b/src/test/test-json.c
-index 1d4b11945e..572c8cf9d0 100644
 --- a/src/test/test-json.c
 +++ b/src/test/test-json.c
-@@ -13,6 +13,10 @@
+@@ -14,6 +14,10 @@
  #include "tests.h"
  #include "util.h"
  
@@ -26,6 +24,6 @@ index 1d4b11945e..572c8cf9d0 100644
 +#define M_PIl 3.141592653589793238462643383279502884L
 +#endif
 +
- static void test_tokenizer(const char *data, ...) {
+ static void test_tokenizer_one(const char *data, ...) {
          unsigned line = 0, column = 0;
          void *state = NULL;
diff --git a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
index 4df35d81d19..d389e1d9f9c 100644
--- a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
@@ -38,11 +38,18 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/vconsole/vconsole-setup.c           |  2 +-
  16 files changed, 34 insertions(+), 34 deletions(-)
 
-diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index c9efd862a2..b3708ea925 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -766,7 +766,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -390,7 +390,7 @@ int cg_kill_kernel_sigkill(const char *c
+         if (r < 0)
+                 return r;
+ 
+-        r = write_string_file(killfile, "1", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(killfile, "1", 0);
+         if (r < 0)
+                 return r;
+ 
+@@ -803,7 +803,7 @@ int cg_install_release_agent(const char
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -51,7 +58,7 @@ index c9efd862a2..b3708ea925 100644
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -784,7 +784,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -821,7 +821,7 @@ int cg_install_release_agent(const char
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -60,7 +67,7 @@ index c9efd862a2..b3708ea925 100644
                  if (r < 0)
                          return r;
  
-@@ -811,7 +811,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -848,7 +848,7 @@ int cg_uninstall_release_agent(const cha
          if (r < 0)
                  return r;
  
@@ -69,7 +76,7 @@ index c9efd862a2..b3708ea925 100644
          if (r < 0)
                  return r;
  
-@@ -821,7 +821,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -858,7 +858,7 @@ int cg_uninstall_release_agent(const cha
          if (r < 0)
                  return r;
  
@@ -78,7 +85,7 @@ index c9efd862a2..b3708ea925 100644
          if (r < 0)
                  return r;
  
-@@ -1651,7 +1651,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
+@@ -1704,7 +1704,7 @@ int cg_set_attribute(const char *control
          if (r < 0)
                  return r;
  
@@ -87,11 +94,9 @@ index c9efd862a2..b3708ea925 100644
  }
  
  int cg_get_attribute(const char *controller, const char *path, const char *attribute, char **ret) {
-diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index 8c57094225..0cf6ec752b 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
-@@ -86,13 +86,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
+@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limi
           * decrease it, as threads-max is the much more relevant sysctl. */
          if (limit > pid_max-1) {
                  sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since PID 0 is not a valid PID */
@@ -107,24 +112,20 @@ index 8c57094225..0cf6ec752b 100644
          if (r < 0) {
                  uint64_t threads_max;
  
-diff --git a/src/basic/sysctl-util.c b/src/basic/sysctl-util.c
-index 8913e6ff85..29e6ec0755 100644
 --- a/src/basic/sysctl-util.c
 +++ b/src/basic/sysctl-util.c
-@@ -93,7 +93,7 @@ int sysctl_write_ip_property(int af, const char *ifname, const char *property, c
+@@ -58,7 +58,7 @@ int sysctl_write(const char *property, c
  
          log_debug("Setting '%s' to '%s'", p, value);
  
--        return write_string_file(p, value, WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER);
-+        return write_string_file(p, value, WRITE_STRING_FILE_VERIFY_ON_FAILURE | 0);
+-        return write_string_file(p, value, WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_DISABLE_BUFFER | WRITE_STRING_FILE_SUPPRESS_REDUNDANT_VIRTUAL);
++        return write_string_file(p, value, WRITE_STRING_FILE_VERIFY_ON_FAILURE | WRITE_STRING_FILE_SUPPRESS_REDUNDANT_VIRTUAL);
  }
  
- int sysctl_read(const char *property, char **ret) {
-diff --git a/src/basic/util.c b/src/basic/util.c
-index 955b18bd2a..6d89c90176 100644
+ int sysctl_writef(const char *property, const char *format, ...) {
 --- a/src/basic/util.c
 +++ b/src/basic/util.c
-@@ -234,7 +234,7 @@ void disable_coredumps(void) {
+@@ -168,7 +168,7 @@ void disable_coredumps(void) {
          if (detect_container() > 0)
                  return;
  
@@ -133,67 +134,61 @@ index 955b18bd2a..6d89c90176 100644
          if (r < 0)
                  log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
  }
-diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
-index 981218f52f..436aaaddb4 100644
 --- a/src/binfmt/binfmt.c
 +++ b/src/binfmt/binfmt.c
-@@ -48,7 +48,7 @@ static int delete_rule(const char *rule) {
-         if (!fn)
-                 return log_oom();
+@@ -29,7 +29,7 @@ static bool arg_unregister = false;
  
+ static int delete_rule(const char *rulename) {
+         const char *fn = strjoina("/proc/sys/fs/binfmt_misc/", rulename);
 -        return write_string_file(fn, "-1", WRITE_STRING_FILE_DISABLE_BUFFER);
 +        return write_string_file(fn, "-1", 0);
  }
  
- static int apply_rule(const char *rule) {
-@@ -56,7 +56,7 @@ static int apply_rule(const char *rule) {
- 
-         (void) delete_rule(rule);
+ static int apply_rule(const char *filename, unsigned line, const char *rule) {
+@@ -59,7 +59,7 @@ static int apply_rule(const char *filena
+         if (r >= 0)
+                 log_debug("%s:%u: Rule '%s' deleted.", filename, line, rulename);
  
 -        r = write_string_file("/proc/sys/fs/binfmt_misc/register", rule, WRITE_STRING_FILE_DISABLE_BUFFER);
 +        r = write_string_file("/proc/sys/fs/binfmt_misc/register", rule, 0);
          if (r < 0)
-                 return log_error_errno(r, "Failed to add binary format: %m");
- 
-@@ -223,7 +223,7 @@ static int run(int argc, char *argv[]) {
+                 return log_error_errno(r, "%s:%u: Failed to add binary format '%s': %m",
+                                        filename, line, rulename);
+@@ -226,7 +226,7 @@ static int run(int argc, char *argv[]) {
                  }
  
                  /* Flush out all rules */
--                (void) write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", WRITE_STRING_FILE_DISABLE_BUFFER);
-+                (void) write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", 0);
- 
-                 STRV_FOREACH(f, files) {
-                         k = apply_file(*f, true);
-diff --git a/src/core/main.c b/src/core/main.c
-index c64c73883e..1ac185e946 100644
+-                r = write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", WRITE_STRING_FILE_DISABLE_BUFFER);
++                r = write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", 0);
+                 if (r < 0)
+                         log_warning_errno(r, "Failed to flush binfmt_misc rules, ignoring: %m");
+                 else
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1402,7 +1402,7 @@ static int bump_unix_max_dgram_qlen(void) {
+@@ -1466,7 +1466,7 @@ static int bump_unix_max_dgram_qlen(void
          if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
                  return 0;
  
--        r = write_string_filef("/proc/sys/net/unix/max_dgram_qlen", WRITE_STRING_FILE_DISABLE_BUFFER, "%lu", DEFAULT_UNIX_MAX_DGRAM_QLEN);
-+        r = write_string_filef("/proc/sys/net/unix/max_dgram_qlen", 0, "%lu", DEFAULT_UNIX_MAX_DGRAM_QLEN);
+-        r = write_string_filef("/proc/sys/net/unix/max_dgram_qlen", WRITE_STRING_FILE_DISABLE_BUFFER,
++        r = write_string_filef("/proc/sys/net/unix/max_dgram_qlen", 0,
+                                "%lu", DEFAULT_UNIX_MAX_DGRAM_QLEN);
          if (r < 0)
                  return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
-                                       "Failed to bump AF_UNIX datagram queue length, ignoring: %m");
-@@ -1679,7 +1679,7 @@ static void initialize_core_pattern(bool skip_setup) {
+@@ -1737,7 +1737,7 @@ static void initialize_core_pattern(bool
          if (getpid_cached() != 1)
                  return;
  
 -        r = write_string_file("/proc/sys/kernel/core_pattern", arg_early_core_pattern, WRITE_STRING_FILE_DISABLE_BUFFER);
 +        r = write_string_file("/proc/sys/kernel/core_pattern", arg_early_core_pattern, 0);
          if (r < 0)
-                 log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m", arg_early_core_pattern);
- }
-diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
-index 79c4808473..b111ce0a11 100644
+                 log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m",
+                                   arg_early_core_pattern);
 --- a/src/core/smack-setup.c
 +++ b/src/core/smack-setup.c
-@@ -323,17 +323,17 @@ int mac_smack_setup(bool *loaded_policy) {
+@@ -320,17 +320,17 @@ int mac_smack_setup(bool *loaded_policy)
          }
  
- #ifdef SMACK_RUN_LABEL
+ #if HAVE_SMACK_RUN_LABEL
 -        r = write_string_file("/proc/self/attr/current", SMACK_RUN_LABEL, WRITE_STRING_FILE_DISABLE_BUFFER);
 +        r = write_string_file("/proc/self/attr/current", SMACK_RUN_LABEL, 0);
          if (r < 0)
@@ -212,8 +207,6 @@ index 79c4808473..b111ce0a11 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
  #endif
-diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-resume/hibernate-resume.c
-index 58e35e403e..1d0beb4008 100644
 --- a/src/hibernate-resume/hibernate-resume.c
 +++ b/src/hibernate-resume/hibernate-resume.c
 @@ -45,7 +45,7 @@ int main(int argc, char *argv[]) {
@@ -225,11 +218,9 @@ index 58e35e403e..1d0beb4008 100644
          if (r < 0) {
                  log_error_errno(r, "Failed to write '%s' to /sys/power/resume: %m", major_minor);
                  return EXIT_FAILURE;
-diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
-index 388128bf33..695f535ff4 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -2096,7 +2096,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
+@@ -2108,7 +2108,7 @@ _public_ int sd_device_set_sysattr_value
          if (!value)
                  return -ENOMEM;
  
@@ -238,11 +229,9 @@ index 388128bf33..695f535ff4 100644
          if (r < 0) {
                  /* On failure, clear cache entry, as we do not know how it fails. */
                  device_remove_cached_sysattr_value(device, sysattr);
-diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
-index cb01b25bc6..e92051268b 100644
 --- a/src/nspawn/nspawn-cgroup.c
 +++ b/src/nspawn/nspawn-cgroup.c
-@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
+@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified
          fn = strjoina(tree, cgroup, "/cgroup.procs");
  
          sprintf(pid_string, PID_FMT, pid);
@@ -251,11 +240,9 @@ index cb01b25bc6..e92051268b 100644
          if (r < 0) {
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
-diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index ff08ed23cc..e7c4a874a9 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2751,7 +2751,7 @@ static int reset_audit_loginuid(void) {
+@@ -2757,7 +2757,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
  
@@ -264,7 +251,7 @@ index ff08ed23cc..e7c4a874a9 100644
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This probably means that your kernel is too\n"
-@@ -4148,7 +4148,7 @@ static int setup_uid_map(
+@@ -4163,7 +4163,7 @@ static int setup_uid_map(
                  return log_oom();
  
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
@@ -273,7 +260,7 @@ index ff08ed23cc..e7c4a874a9 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write UID map: %m");
  
-@@ -4158,7 +4158,7 @@ static int setup_uid_map(
+@@ -4173,7 +4173,7 @@ static int setup_uid_map(
                  return log_oom();
  
          xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
@@ -282,11 +269,9 @@ index ff08ed23cc..e7c4a874a9 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
-diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
-index f197f715c7..077f893177 100644
 --- a/src/shared/cgroup-setup.c
 +++ b/src/shared/cgroup-setup.c
-@@ -267,7 +267,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
+@@ -345,7 +345,7 @@ int cg_attach(const char *controller, co
  
          xsprintf(c, PID_FMT "\n", pid);
  
@@ -295,7 +280,7 @@ index f197f715c7..077f893177 100644
          if (r < 0)
                  return r;
  
-@@ -799,7 +799,7 @@ int cg_enable_everywhere(
+@@ -877,7 +877,7 @@ int cg_enable_everywhere(
                                          return log_debug_errno(errno, "Failed to open cgroup.subtree_control file of %s: %m", p);
                          }
  
@@ -304,31 +289,9 @@ index f197f715c7..077f893177 100644
                          if (r < 0) {
                                  log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
                                                  FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
-diff --git a/src/shared/mount-util.c b/src/shared/mount-util.c
-index 594efea989..d243b45bc4 100644
---- a/src/shared/mount-util.c
-+++ b/src/shared/mount-util.c
-@@ -1019,13 +1019,13 @@ static int make_userns(uid_t uid_shift, uid_t uid_range) {
-         xsprintf(line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, uid_shift, uid_range);
- 
-         xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
--        r = write_string_file(uid_map, line, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(uid_map, line, 0);
-         if (r < 0)
-                 return log_error_errno(r, "Failed to write UID map: %m");
- 
-         /* We always assign the same UID and GID ranges */
-         xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
--        r = write_string_file(uid_map, line, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file(uid_map, line, 0);
-         if (r < 0)
-                 return log_error_errno(r, "Failed to write GID map: %m");
- 
-diff --git a/src/shared/smack-util.c b/src/shared/smack-util.c
-index 3362ee3924..80c0f2a52e 100644
 --- a/src/shared/smack-util.c
 +++ b/src/shared/smack-util.c
-@@ -114,7 +114,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
+@@ -114,7 +114,7 @@ int mac_smack_apply_pid(pid_t pid, const
                  return 0;
  
          p = procfs_file_alloca(pid, "attr/current");
@@ -337,11 +300,9 @@ index 3362ee3924..80c0f2a52e 100644
          if (r < 0)
                  return r;
  
-diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
-index a3aeb24633..d3e68e1b94 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
-@@ -46,7 +46,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
+@@ -46,7 +46,7 @@ static int write_hibernate_location_info
          assert(hibernate_location->swap);
  
          xsprintf(resume_str, "%u:%u", major(hibernate_location->devno), minor(hibernate_location->devno));
@@ -350,7 +311,7 @@ index a3aeb24633..d3e68e1b94 100644
          if (r < 0)
                  return log_debug_errno(r, "Failed to write partition device to /sys/power/resume for '%s': '%s': %m",
                                         hibernate_location->swap->device, resume_str);
-@@ -73,7 +73,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
+@@ -73,7 +73,7 @@ static int write_hibernate_location_info
          }
  
          xsprintf(offset_str, "%" PRIu64, hibernate_location->offset);
@@ -368,7 +329,7 @@ index a3aeb24633..d3e68e1b94 100644
                  if (k >= 0)
                          return 0;
  
-@@ -112,7 +112,7 @@ static int write_state(FILE **f, char **states) {
+@@ -112,7 +112,7 @@ static int write_state(FILE **f, char **
          STRV_FOREACH(state, states) {
                  int k;
  
@@ -377,11 +338,9 @@ index a3aeb24633..d3e68e1b94 100644
                  if (k >= 0)
                          return 0;
                  log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
-diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
-index d1c3febdd5..1cc68694d1 100644
 --- a/src/vconsole/vconsole-setup.c
 +++ b/src/vconsole/vconsole-setup.c
-@@ -116,7 +116,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
+@@ -108,7 +108,7 @@ static int toggle_utf8_vc(const char *na
  static int toggle_utf8_sysfs(bool utf8) {
          int r;
  
@@ -390,3 +349,72 @@ index d1c3febdd5..1cc68694d1 100644
          if (r < 0)
                  return log_warning_errno(r, "Failed to %s sysfs UTF-8 flag: %m", enable_disable(utf8));
  
+--- a/src/basic/namespace-util.c
++++ b/src/basic/namespace-util.c
+@@ -202,12 +202,12 @@ int userns_acquire(const char *uid_map,
+                 freeze();
+ 
+         xsprintf(path, "/proc/" PID_FMT "/uid_map", pid);
+-        r = write_string_file(path, uid_map, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(path, uid_map, 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to write UID map: %m");
+ 
+         xsprintf(path, "/proc/" PID_FMT "/gid_map", pid);
+-        r = write_string_file(path, gid_map, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(path, gid_map, 0);
+         if (r < 0)
+                 return log_error_errno(r, "Failed to write GID map: %m");
+ 
+--- a/src/core/cgroup.c
++++ b/src/core/cgroup.c
+@@ -4140,7 +4140,7 @@ int unit_cgroup_freezer_action(Unit *u,
+         else
+                 u->freezer_state = FREEZER_THAWING;
+ 
+-        r = write_string_file(path, one_zero(action == FREEZER_FREEZE), WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file(path, one_zero(action == FREEZER_FREEZE), 0);
+         if (r < 0)
+                 return r;
+ 
+--- a/src/home/homework.c
++++ b/src/home/homework.c
+@@ -284,7 +284,7 @@ static void drop_caches_now(void) {
+          * details. We write "2" into /proc/sys/vm/drop_caches to ensure dentries/inodes are flushed, but not
+          * more. */
+ 
+-        r = write_string_file("/proc/sys/vm/drop_caches", "2\n", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/proc/sys/vm/drop_caches", "2\n", 0);
+         if (r < 0)
+                 log_warning_errno(r, "Failed to drop caches, ignoring: %m");
+         else
+--- a/src/shared/binfmt-util.c
++++ b/src/shared/binfmt-util.c
+@@ -26,7 +26,7 @@ int disable_binfmt(void) {
+         if (r < 0)
+                 return log_warning_errno(r, "Failed to determine whether binfmt_misc is mounted: %m");
+ 
+-        r = write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", 0);
+         if (r < 0)
+                 return log_warning_errno(r, "Failed to unregister binfmt_misc entries: %m");
+ 
+--- a/src/shared/coredump-util.c
++++ b/src/shared/coredump-util.c
+@@ -70,5 +70,5 @@ int set_coredump_filter(uint64_t value)
+         sprintf(t, "0x%"PRIx64, value);
+ 
+         return write_string_file("/proc/self/coredump_filter", t,
+-                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE|WRITE_STRING_FILE_DISABLE_BUFFER);
++                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE);
+ }
+--- a/src/udev/udev-rules.c
++++ b/src/udev/udev-rules.c
+@@ -2181,7 +2181,6 @@ static int udev_rule_apply_token_to_even
+                 log_rule_debug(dev, rules, "ATTR '%s' writing '%s'", buf, value);
+                 r = write_string_file(buf, value,
+                                       WRITE_STRING_FILE_VERIFY_ON_FAILURE |
+-                                      WRITE_STRING_FILE_DISABLE_BUFFER |
+                                       WRITE_STRING_FILE_AVOID_NEWLINE |
+                                       WRITE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
+                 if (r < 0)
diff --git a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
index e9b7c1c078f..2d06ab84a25 100644
--- a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
@@ -17,8 +17,6 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/shared/userdb.c          |  7 ++++++-
  3 files changed, 30 insertions(+), 1 deletion(-)
 
-diff --git a/src/shared/user-record-nss.c b/src/shared/user-record-nss.c
-index 88b8fc2f8f..a819d41bac 100644
 --- a/src/shared/user-record-nss.c
 +++ b/src/shared/user-record-nss.c
 @@ -331,8 +331,10 @@ int nss_group_to_group_record(
@@ -48,7 +46,7 @@ index 88b8fc2f8f..a819d41bac 100644
  
          r = json_build(&g->json, JSON_BUILD_OBJECT(
                                         JSON_BUILD_PAIR("groupName", JSON_BUILD_STRING(g->group_name)),
-@@ -388,6 +392,7 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
+@@ -388,6 +392,7 @@ int nss_sgrp_for_group(const struct grou
          assert(ret_sgrp);
          assert(ret_buffer);
  
@@ -56,7 +54,7 @@ index 88b8fc2f8f..a819d41bac 100644
          for (;;) {
                  _cleanup_free_ char *buf = NULL;
                  struct sgrp sgrp, *result;
-@@ -416,6 +421,9 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
+@@ -416,6 +421,9 @@ int nss_sgrp_for_group(const struct grou
                  buflen *= 2;
                  buf = mfree(buf);
          }
@@ -122,8 +120,6 @@ index 88b8fc2f8f..a819d41bac 100644
          if (r < 0)
                  return r;
  
-diff --git a/src/shared/user-record-nss.h b/src/shared/user-record-nss.h
-index 22ab04d6ee..4e52e7a911 100644
 --- a/src/shared/user-record-nss.h
 +++ b/src/shared/user-record-nss.h
 @@ -2,7 +2,11 @@
@@ -138,11 +134,9 @@ index 22ab04d6ee..4e52e7a911 100644
  #include <pwd.h>
  #include <shadow.h>
  
-diff --git a/src/shared/userdb.c b/src/shared/userdb.c
-index 91ac7c3832..20881ece84 100644
 --- a/src/shared/userdb.c
 +++ b/src/shared/userdb.c
-@@ -1047,13 +1047,15 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
+@@ -1046,13 +1046,15 @@ int groupdb_iterator_get(UserDBIterator
                  if (gr) {
                          _cleanup_free_ char *buffer = NULL;
                          bool incomplete = false;
@@ -159,7 +153,7 @@ index 91ac7c3832..20881ece84 100644
                          if (!FLAGS_SET(iterator->flags, USERDB_SUPPRESS_SHADOW)) {
                                  r = nss_sgrp_for_group(gr, &sgrp, &buffer);
                                  if (r < 0) {
-@@ -1066,6 +1068,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
+@@ -1065,6 +1067,9 @@ int groupdb_iterator_get(UserDBIterator
                          }
  
                          r = nss_group_to_group_record(gr, r >= 0 ? &sgrp : NULL, ret);
diff --git a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
index b7fd3cddbb3..f4a71be7cc9 100644
--- a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
@@ -15,8 +15,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/basic/missing_syscall.h | 6 ++++++
  1 file changed, 6 insertions(+)
 
-diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index 9e3a165857..4d59b3e7b0 100644
 --- a/src/basic/missing_syscall.h
 +++ b/src/basic/missing_syscall.h
 @@ -20,6 +20,12 @@
@@ -24,11 +22,21 @@ index 9e3a165857..4d59b3e7b0 100644
  #endif
  
 +#ifndef _MIPS_SIM_ABI32
-+#define _MIPS_SIM_ABI32		1
-+#define _MIPS_SIM_NABI32	2
-+#define _MIPS_SIM_ABI64		3
++#define _MIPS_SIM_ABI32	1
++#define _MIPS_SIM_NABI32 2
++#define _MIPS_SIM_ABI64	3
 +#endif
 +
+ #include "macro.h"
  #include "missing_keyctl.h"
  #include "missing_stat.h"
- #include "missing_syscall_def.h"
+--- a/src/shared/base-filesystem.c
++++ b/src/shared/base-filesystem.c
+@@ -19,6 +19,7 @@
+ #include "string-util.h"
+ #include "umask-util.h"
+ #include "user-util.h"
++#include "missing_syscall.h"
+ 
+ typedef struct BaseFilesystem {
+         const char *dir;      /* directory or symlink to create */
diff --git a/meta/recipes-core/systemd/systemd_250.3.bb b/meta/recipes-core/systemd/systemd_250.3.bb
index 4dd668833a7..de16a4d78dc 100644
--- a/meta/recipes-core/systemd/systemd_250.3.bb
+++ b/meta/recipes-core/systemd/systemd_250.3.bb
@@ -34,7 +34,6 @@ SRC_URI_MUSL = "\
                file://0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch \
                file://0004-add-fallback-parse_printf_format-implementation.patch \
                file://0005-src-basic-missing.h-check-for-missing-strndupa.patch \
-               file://0006-Include-netinet-if_ether.h.patch \
                file://0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
                file://0008-add-missing-FTW_-macros-for-musl.patch \
                file://0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch \
@@ -54,6 +53,9 @@ SRC_URI_MUSL = "\
                file://0025-Handle-__cpu_mask-usage.patch \
                file://0026-Handle-missing-gshadow.patch \
                file://0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch \
+               file://0001-pass-correct-parameters-to-getdents64.patch \
+               file://0002-Add-sys-stat.h-for-S_IFDIR.patch \
+               file://0001-Adjust-for-musl-headers.patch \
                "
 
 PAM_PLUGINS = " \
-- 
2.34.1

