Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F15C43217
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 21:55:54 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.3196.1667944549839082141
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 13:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UzOxFs0l;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id g24so15373681plq.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 13:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Of2WF4JqiERBvzT3peiVnxTQCYMXF1mho97XwlnjMdI=;
        b=UzOxFs0lHy9oPkl+K6A/UChnJacIXnz/wYhgTnHGbRdB0zjwx5QG4pCSXAkK8ruRa0
         JqISiuKTZ9XETLvZnSYNIfuTJhCh9XTgsYkrVTrvYRn6M1rzXlHLCnKxUMxr7kH6RZwr
         dkYbA72v2VvlnbCVdyeFkdxI4kmTPX7B1MSe2AFWThMRZwsPRvA9gXN1thO8z9iTw8w8
         pBu3Om9eb0zTl+x2GChOoiZlM5hNlse5KfHu8VKFVdqKhceD5cH4WKbwQP85EqXRiFj9
         PzNALH/36uOkWa1WGy3CH34RpLOtJw/EZJX41VU3k8jNM0wA8+4lDyYlmM1CgsyK7Hvv
         UMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Of2WF4JqiERBvzT3peiVnxTQCYMXF1mho97XwlnjMdI=;
        b=2A0+A3wVdfmopzo5TZplmWxQfhF+YQIb4FS1uoz0yL2Sl87yWGS2dz/h7nFhyYcYBV
         kgLNXdMOH9kFxny0MA5d55T4Noecl+PPtW+tRtfK+BlcIZbrzo9ZpqT/7juw46av+psH
         oUczBU1tHnhfYc14PkELovIYzCaP/kL/cfTSrqhNm6cEd/bw8JkhfjF14y9EGQYuVum4
         mJhV3WyJtWrUfZtCqWZnxI8nIQZytOlGbHyUiinRlHTTIOR+yQF49bLs9KlgQ8TlIB2d
         zD8wZwcsin8C0yb1tFZ7khJQ+pxqjTgzvCgKpNtAoCNxOiG3L0gvpmdX5ydM7WlYkTjz
         kpNg==
X-Gm-Message-State: ACrzQf3IBEunb1mqguGcPofwBINCNaES4UoKiJu9cCgFHqLz7cv1oU9G
	2LymDSmWgSlikQG5eMjbnTcV4jBfcs0=
X-Google-Smtp-Source: AMsMyM7VJV8Pj8XCYp5Y911iaUGOuu44/Judyivj+BpyOifUSjD7GUMJBKzlDBffJ9Oiz0u65yN+Ag==
X-Received: by 2002:a17:902:c944:b0:186:a7d7:c3b with SMTP id i4-20020a170902c94400b00186a7d70c3bmr58224722pla.55.1667944547623;
        Tue, 08 Nov 2022 13:55:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b779])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902bd8a00b00186bc66d2cbsm7403535pls.73.2022.11.08.13.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 13:55:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Luca Boccassi <luca.boccassi@microsoft.com>
Subject: [PATCH v2] systemd: Fix 252 release build on musl
Date: Tue,  8 Nov 2022 13:55:44 -0800
Message-Id: <20221108215544.815033-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 21:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173001

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: Replace the utmp patch with an upstream backport

 .../0001-Adjust-for-musl-headers.patch        |  84 +---------
 ....c-Use-net-if.h-for-getting-IFF_LOOP.patch |  27 +++
 ...trerror-is-assumed-to-be-GNU-specifi.patch |  42 +++++
 ...-test-utmp.c-only-if-UTMP-is-enabled.patch |  44 +++++
 .../0002-Add-sys-stat.h-for-S_IFDIR.patch     |   4 +-
 ...k-parse_printf_format-implementation.patch |  22 +--
 ...missing.h-check-for-missing-strndupa.patch | 158 ++----------------
 ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  29 ++--
 ...10-Use-uintmax_t-for-handling-rlim_t.patch |  14 +-
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  14 +-
 ...patible-basename-for-non-glibc-syste.patch |   8 +-
 ...uffering-when-writing-to-oom_score_a.patch |   4 +-
 ...compliant-strerror_r-from-GNU-specif.patch |  22 ++-
 ...-not-disable-buffer-in-writing-files.patch | 100 ++++-------
 .../systemd/0026-Handle-missing-gshadow.patch |  14 +-
 meta/recipes-core/systemd/systemd_252.bb      |   5 +-
 .../btrfs-tools/btrfs-tools_6.0.bb            |   3 +
 .../recipes-multimedia/alsa/alsa-lib_1.2.8.bb |   2 +
 18 files changed, 223 insertions(+), 373 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-networkd-ipv4acd.c-Use-net-if.h-for-getting-IFF_LOOP.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-test-compile-test-utmp.c-only-if-UTMP-is-enabled.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch b/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch
index bce1ca4563..6496280dda 100644
--- a/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch
+++ b/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch
@@ -47,8 +47,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/udev/udev-builtin-net_id.c                | 2 +-
  37 files changed, 44 insertions(+), 42 deletions(-)
 
-diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-network/sd-dhcp6-client.c
-index b346a50d78..7884d4c1cd 100644
 --- a/src/libsystemd-network/sd-dhcp6-client.c
 +++ b/src/libsystemd-network/sd-dhcp6-client.c
 @@ -5,7 +5,7 @@
@@ -60,8 +58,6 @@ index b346a50d78..7884d4c1cd 100644
  #include <linux/if_infiniband.h>
  
  #include "sd-dhcp6-client.h"
-diff --git a/src/network/netdev/bareudp.c b/src/network/netdev/bareudp.c
-index 8ff0eb1360..7e06b8d57d 100644
 --- a/src/network/netdev/bareudp.c
 +++ b/src/network/netdev/bareudp.c
 @@ -2,7 +2,7 @@
@@ -73,8 +69,6 @@ index 8ff0eb1360..7e06b8d57d 100644
  
  #include "bareudp.h"
  #include "netlink-util.h"
-diff --git a/src/network/netdev/batadv.c b/src/network/netdev/batadv.c
-index 15f3aee3a6..ec76428436 100644
 --- a/src/network/netdev/batadv.c
 +++ b/src/network/netdev/batadv.c
 @@ -3,7 +3,7 @@
@@ -86,8 +80,6 @@ index 15f3aee3a6..ec76428436 100644
  
  #include "batadv.h"
  #include "fileio.h"
-diff --git a/src/network/netdev/bond.c b/src/network/netdev/bond.c
-index 5d94aa1d68..4e379a326d 100644
 --- a/src/network/netdev/bond.c
 +++ b/src/network/netdev/bond.c
 @@ -1,7 +1,7 @@
@@ -99,8 +91,6 @@ index 5d94aa1d68..4e379a326d 100644
  
  #include "alloc-util.h"
  #include "bond.h"
-diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge.c
-index b974f2ae0a..9a5f18d556 100644
 --- a/src/network/netdev/bridge.c
 +++ b/src/network/netdev/bridge.c
 @@ -2,7 +2,7 @@
@@ -112,8 +102,6 @@ index b974f2ae0a..9a5f18d556 100644
  #include <linux/if_bridge.h>
  
  #include "bridge.h"
-diff --git a/src/network/netdev/dummy.c b/src/network/netdev/dummy.c
-index 00df1d2787..77b506b422 100644
 --- a/src/network/netdev/dummy.c
 +++ b/src/network/netdev/dummy.c
 @@ -1,6 +1,6 @@
@@ -124,8 +112,6 @@ index 00df1d2787..77b506b422 100644
  
  #include "dummy.h"
  
-diff --git a/src/network/netdev/geneve.c b/src/network/netdev/geneve.c
-index 224c17e979..fb79cc13f6 100644
 --- a/src/network/netdev/geneve.c
 +++ b/src/network/netdev/geneve.c
 @@ -2,7 +2,7 @@
@@ -137,8 +123,6 @@ index 224c17e979..fb79cc13f6 100644
  
  #include "alloc-util.h"
  #include "conf-parser.h"
-diff --git a/src/network/netdev/ifb.c b/src/network/netdev/ifb.c
-index d7ff44cb9e..e037629ae4 100644
 --- a/src/network/netdev/ifb.c
 +++ b/src/network/netdev/ifb.c
 @@ -1,7 +1,7 @@
@@ -150,8 +134,6 @@ index d7ff44cb9e..e037629ae4 100644
  
  #include "ifb.h"
  
-diff --git a/src/network/netdev/ipoib.c b/src/network/netdev/ipoib.c
-index e0ff9e8c62..ab085c1f6d 100644
 --- a/src/network/netdev/ipoib.c
 +++ b/src/network/netdev/ipoib.c
 @@ -1,6 +1,6 @@
@@ -162,8 +144,6 @@ index e0ff9e8c62..ab085c1f6d 100644
  #include <linux/if_link.h>
  
  #include "ipoib.h"
-diff --git a/src/network/netdev/ipvlan.c b/src/network/netdev/ipvlan.c
-index d15766cd7b..60728b4f94 100644
 --- a/src/network/netdev/ipvlan.c
 +++ b/src/network/netdev/ipvlan.c
 @@ -2,7 +2,7 @@
@@ -175,8 +155,6 @@ index d15766cd7b..60728b4f94 100644
  
  #include "conf-parser.h"
  #include "ipvlan.h"
-diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
-index f1a566a9ca..1f37927a83 100644
 --- a/src/network/netdev/macsec.c
 +++ b/src/network/netdev/macsec.c
 @@ -1,7 +1,7 @@
@@ -188,8 +166,6 @@ index f1a566a9ca..1f37927a83 100644
  #include <linux/if_ether.h>
  #include <linux/if_macsec.h>
  #include <linux/genetlink.h>
-diff --git a/src/network/netdev/macvlan.c b/src/network/netdev/macvlan.c
-index c41be6e78f..ee2660c5bf 100644
 --- a/src/network/netdev/macvlan.c
 +++ b/src/network/netdev/macvlan.c
 @@ -2,7 +2,7 @@
@@ -201,8 +177,6 @@ index c41be6e78f..ee2660c5bf 100644
  
  #include "conf-parser.h"
  #include "macvlan.h"
-diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
-index 8e7fe11c18..701ab2bd69 100644
 --- a/src/network/netdev/netdev.c
 +++ b/src/network/netdev/netdev.c
 @@ -2,7 +2,7 @@
@@ -214,8 +188,6 @@ index 8e7fe11c18..701ab2bd69 100644
  #include <unistd.h>
  
  #include "alloc-util.h"
-diff --git a/src/network/netdev/netdevsim.c b/src/network/netdev/netdevsim.c
-index 15d5c132f9..a3ffa48b15 100644
 --- a/src/network/netdev/netdevsim.c
 +++ b/src/network/netdev/netdevsim.c
 @@ -1,6 +1,6 @@
@@ -226,8 +198,6 @@ index 15d5c132f9..a3ffa48b15 100644
  
  #include "netdevsim.h"
  
-diff --git a/src/network/netdev/nlmon.c b/src/network/netdev/nlmon.c
-index ff372092e6..eef66811f4 100644
 --- a/src/network/netdev/nlmon.c
 +++ b/src/network/netdev/nlmon.c
 @@ -1,6 +1,6 @@
@@ -238,8 +208,6 @@ index ff372092e6..eef66811f4 100644
  
  #include "nlmon.h"
  
-diff --git a/src/network/netdev/tunnel.c b/src/network/netdev/tunnel.c
-index 97e534fe99..0302c1cb94 100644
 --- a/src/network/netdev/tunnel.c
 +++ b/src/network/netdev/tunnel.c
 @@ -2,7 +2,7 @@
@@ -251,8 +219,6 @@ index 97e534fe99..0302c1cb94 100644
  #include <linux/if_tunnel.h>
  #include <linux/ip.h>
  #include <linux/ip6_tunnel.h>
-diff --git a/src/network/netdev/vcan.c b/src/network/netdev/vcan.c
-index 380547ee1e..137c1adf8a 100644
 --- a/src/network/netdev/vcan.c
 +++ b/src/network/netdev/vcan.c
 @@ -1,6 +1,6 @@
@@ -263,8 +229,6 @@ index 380547ee1e..137c1adf8a 100644
  
  #include "vcan.h"
  
-diff --git a/src/network/netdev/veth.c b/src/network/netdev/veth.c
-index c946e81fc0..d1a6be73f9 100644
 --- a/src/network/netdev/veth.c
 +++ b/src/network/netdev/veth.c
 @@ -3,7 +3,7 @@
@@ -276,8 +240,6 @@ index c946e81fc0..d1a6be73f9 100644
  #include <linux/veth.h>
  
  #include "netlink-util.h"
-diff --git a/src/network/netdev/vlan.c b/src/network/netdev/vlan.c
-index af3e77963e..efa4b0a164 100644
 --- a/src/network/netdev/vlan.c
 +++ b/src/network/netdev/vlan.c
 @@ -2,7 +2,7 @@
@@ -289,8 +251,6 @@ index af3e77963e..efa4b0a164 100644
  #include <linux/if_vlan.h>
  
  #include "parse-util.h"
-diff --git a/src/network/netdev/vrf.c b/src/network/netdev/vrf.c
-index b1b6707441..1c6d1982e1 100644
 --- a/src/network/netdev/vrf.c
 +++ b/src/network/netdev/vrf.c
 @@ -2,7 +2,7 @@
@@ -302,8 +262,6 @@ index b1b6707441..1c6d1982e1 100644
  
  #include "vrf.h"
  
-diff --git a/src/network/netdev/vxcan.c b/src/network/netdev/vxcan.c
-index a0ba048eb1..875f2e5901 100644
 --- a/src/network/netdev/vxcan.c
 +++ b/src/network/netdev/vxcan.c
 @@ -1,7 +1,7 @@
@@ -315,8 +273,6 @@ index a0ba048eb1..875f2e5901 100644
  
  #include "vxcan.h"
  
-diff --git a/src/network/netdev/vxlan.c b/src/network/netdev/vxlan.c
-index 30b0855598..a065158801 100644
 --- a/src/network/netdev/vxlan.c
 +++ b/src/network/netdev/vxlan.c
 @@ -2,7 +2,7 @@
@@ -328,8 +284,6 @@ index 30b0855598..a065158801 100644
  
  #include "conf-parser.h"
  #include "alloc-util.h"
-diff --git a/src/network/netdev/wireguard.c b/src/network/netdev/wireguard.c
-index 88f668753a..5fc753384b 100644
 --- a/src/network/netdev/wireguard.c
 +++ b/src/network/netdev/wireguard.c
 @@ -6,7 +6,7 @@
@@ -341,8 +295,6 @@ index 88f668753a..5fc753384b 100644
  #include <linux/ipv6_route.h>
  
  #include "sd-resolve.h"
-diff --git a/src/network/netdev/xfrm.c b/src/network/netdev/xfrm.c
-index ef5e735b2b..419afd75f2 100644
 --- a/src/network/netdev/xfrm.c
 +++ b/src/network/netdev/xfrm.c
 @@ -1,6 +1,6 @@
@@ -353,8 +305,6 @@ index ef5e735b2b..419afd75f2 100644
  
  #include "missing_network.h"
  #include "xfrm.h"
-diff --git a/src/network/networkd-bridge-mdb.c b/src/network/networkd-bridge-mdb.c
-index 10025a97ae..a0239ea83a 100644
 --- a/src/network/networkd-bridge-mdb.c
 +++ b/src/network/networkd-bridge-mdb.c
 @@ -1,7 +1,5 @@
@@ -374,8 +324,6 @@ index 10025a97ae..a0239ea83a 100644
  
  #define STATIC_BRIDGE_MDB_ENTRIES_PER_NETWORK_MAX 1024U
  
-diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-dhcp-common.c
-index 7996960bd1..e870b9ba26 100644
 --- a/src/network/networkd-dhcp-common.c
 +++ b/src/network/networkd-dhcp-common.c
 @@ -1,7 +1,8 @@
@@ -387,9 +335,7 @@ index 7996960bd1..e870b9ba26 100644
 +#include <net/if.h>
  
  #include "bus-error.h"
- #include "dhcp-identifier.h"
-diff --git a/src/network/networkd-dhcp-prefix-delegation.c b/src/network/networkd-dhcp-prefix-delegation.c
-index 7be9713d46..e830fcd575 100644
+ #include "bus-locator.h"
 --- a/src/network/networkd-dhcp-prefix-delegation.c
 +++ b/src/network/networkd-dhcp-prefix-delegation.c
 @@ -1,7 +1,5 @@
@@ -409,8 +355,6 @@ index 7be9713d46..e830fcd575 100644
  bool link_dhcp_pd_is_enabled(Link *link) {
          assert(link);
  
-diff --git a/src/network/networkd-dhcp-server.c b/src/network/networkd-dhcp-server.c
-index 9acfd17d49..3108289602 100644
 --- a/src/network/networkd-dhcp-server.c
 +++ b/src/network/networkd-dhcp-server.c
 @@ -1,7 +1,7 @@
@@ -422,8 +366,6 @@ index 9acfd17d49..3108289602 100644
  #include <linux/if.h>
  
  #include "sd-dhcp-server.h"
-diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
-index cb9c428ae9..a35d58f3f1 100644
 --- a/src/network/networkd-dhcp4.c
 +++ b/src/network/networkd-dhcp4.c
 @@ -3,7 +3,7 @@
@@ -435,21 +377,17 @@ index cb9c428ae9..a35d58f3f1 100644
  
  #include "alloc-util.h"
  #include "dhcp-client-internal.h"
-diff --git a/src/network/networkd-ipv6ll.c b/src/network/networkd-ipv6ll.c
-index dc09171afe..5b93ef3dd4 100644
 --- a/src/network/networkd-ipv6ll.c
 +++ b/src/network/networkd-ipv6ll.c
 @@ -1,7 +1,7 @@
  /* SPDX-License-Identifier: LGPL-2.1-or-later */
-
+ 
  #include <linux/if.h>
 -#include <linux/if_arp.h>
 +//#include <linux/if_arp.h>
-
+ 
  #include "in-addr-util.h"
  #include "networkd-address.h"
-diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index 63679505f7..825ea76ff2 100644
 --- a/src/network/networkd-link.c
 +++ b/src/network/networkd-link.c
 @@ -3,7 +3,7 @@
@@ -461,8 +399,6 @@ index 63679505f7..825ea76ff2 100644
  #include <linux/if_link.h>
  #include <linux/netdevice.h>
  #include <sys/socket.h>
-diff --git a/src/network/networkd-ndisc.c b/src/network/networkd-ndisc.c
-index efe407fedb..46a086cdf5 100644
 --- a/src/network/networkd-ndisc.c
 +++ b/src/network/networkd-ndisc.c
 @@ -6,7 +6,7 @@
@@ -471,11 +407,9 @@ index efe407fedb..46a086cdf5 100644
  #include <linux/if.h>
 -#include <linux/if_arp.h>
 +//#include <linux/if_arp.h>
-
+ 
  #include "sd-ndisc.h"
-
-diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
-index 934fed3b7f..fdb89313dd 100644
+ 
 --- a/src/network/networkd-route.c
 +++ b/src/network/networkd-route.c
 @@ -1,9 +1,5 @@
@@ -499,8 +433,6 @@ index 934fed3b7f..fdb89313dd 100644
  int route_new(Route **ret) {
          _cleanup_(route_freep) Route *route = NULL;
  
-diff --git a/src/network/networkd-setlink.c b/src/network/networkd-setlink.c
-index e00cc1e589..e392c7e1a2 100644
 --- a/src/network/networkd-setlink.c
 +++ b/src/network/networkd-setlink.c
 @@ -2,7 +2,7 @@
@@ -512,8 +444,6 @@ index e00cc1e589..e392c7e1a2 100644
  #include <linux/if_bridge.h>
  
  #include "missing_network.h"
-diff --git a/src/shared/linux/ethtool.h b/src/shared/linux/ethtool.h
-index cf20b6dba5..c3a46dda11 100644
 --- a/src/shared/linux/ethtool.h
 +++ b/src/shared/linux/ethtool.h
 @@ -16,7 +16,8 @@
@@ -526,8 +456,6 @@ index cf20b6dba5..c3a46dda11 100644
  
  #ifndef __KERNEL__
  #include <limits.h> /* for INT_MAX */
-diff --git a/src/shared/netif-util.c b/src/shared/netif-util.c
-index f56c5646c1..5af28ff119 100644
 --- a/src/shared/netif-util.c
 +++ b/src/shared/netif-util.c
 @@ -1,7 +1,7 @@
@@ -539,8 +467,6 @@ index f56c5646c1..5af28ff119 100644
  
  #include "arphrd-util.h"
  #include "device-util.h"
-diff --git a/src/udev/udev-builtin-net_id.c b/src/udev/udev-builtin-net_id.c
-index f2ea2a7cd5..fe60a0744d 100644
 --- a/src/udev/udev-builtin-net_id.c
 +++ b/src/udev/udev-builtin-net_id.c
 @@ -18,7 +18,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0001-networkd-ipv4acd.c-Use-net-if.h-for-getting-IFF_LOOP.patch b/meta/recipes-core/systemd/systemd/0001-networkd-ipv4acd.c-Use-net-if.h-for-getting-IFF_LOOP.patch
new file mode 100644
index 0000000000..835bb21be7
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-networkd-ipv4acd.c-Use-net-if.h-for-getting-IFF_LOOP.patch
@@ -0,0 +1,27 @@
+From 4a464ea4aaed5184a70b2e1ac77e4a955443d067 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Nov 2022 12:21:35 -0800
+Subject: [PATCH] networkd-ipv4acd.c: Use net/if.h for getting IFF_LOOPBACK definition
+
+This helps in avoiding compiling errors on musl. Definition of
+IFF_LOOPBACK is the reason for including linux/if_arp.h, this however
+could be obtained from net/if.h glibc header equally and makes it
+portable as well.
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/25304]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/network/networkd-ipv4acd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/src/network/networkd-ipv4acd.c
++++ b/src/network/networkd-ipv4acd.c
+@@ -1,6 +1,7 @@
+ /* SPDX-License-Identifier: LGPL-2.1-or-later */
+ 
+-#include <linux/if_arp.h>
++#include <net/if.h> /* IFF_LOOPBACK */
++#include <net/if_arp.h> /* ARPHRD_ETHER */
+ 
+ #include "sd-dhcp-client.h"
+ #include "sd-ipv4acd.h"
diff --git a/meta/recipes-core/systemd/systemd/0001-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch b/meta/recipes-core/systemd/systemd/0001-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
new file mode 100644
index 0000000000..c02d495d31
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
@@ -0,0 +1,42 @@
+From 5b5675913e2dbe6c5acda935b5814a8991829ec5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Nov 2022 13:31:34 -0800
+Subject: [PATCH 2/2] test-bus-error: strerror() is assumed to be GNU specific version mark it so
+
+Upstream-Status: Inappropriate [Upstream systemd only supports glibc]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libsystemd/sd-bus/test-bus-error.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+--- a/src/libsystemd/sd-bus/test-bus-error.c
++++ b/src/libsystemd/sd-bus/test-bus-error.c
+@@ -99,7 +99,9 @@ TEST(error) {
+         assert_se(!sd_bus_error_is_set(&error));
+         assert_se(sd_bus_error_set_errno(&error, EBUSY) == -EBUSY);
+         assert_se(streq(error.name, "System.Error.EBUSY"));
++#ifdef __GLIBC__
+         assert_se(streq(error.message, STRERROR(EBUSY)));
++#endif
+         assert_se(sd_bus_error_has_name(&error, "System.Error.EBUSY"));
+         assert_se(sd_bus_error_get_errno(&error) == EBUSY);
+         assert_se(sd_bus_error_is_set(&error));
+--- a/src/test/test-errno-util.c
++++ b/src/test/test-errno-util.c
+@@ -4,7 +4,7 @@
+ #include "stdio-util.h"
+ #include "string-util.h"
+ #include "tests.h"
+-
++#ifdef __GLIBC__
+ TEST(strerror_not_threadsafe) {
+         /* Just check that strerror really is not thread-safe. */
+         log_info("strerror(%d) → %s", 200, strerror(200));
+@@ -46,5 +46,6 @@ TEST(STRERROR_OR_ELSE) {
+         log_info("STRERROR_OR_ELSE(EPERM, \"EOF\") → %s", STRERROR_OR_EOF(EPERM));
+         log_info("STRERROR_OR_ELSE(-EPERM, \"EOF\") → %s", STRERROR_OR_EOF(-EPERM));
+ }
++#endif /* __GLIBC__ */
+ 
+ DEFINE_TEST_MAIN(LOG_INFO);
diff --git a/meta/recipes-core/systemd/systemd/0001-test-compile-test-utmp.c-only-if-UTMP-is-enabled.patch b/meta/recipes-core/systemd/systemd/0001-test-compile-test-utmp.c-only-if-UTMP-is-enabled.patch
new file mode 100644
index 0000000000..df0f1b0131
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-test-compile-test-utmp.c-only-if-UTMP-is-enabled.patch
@@ -0,0 +1,44 @@
+From 41cac2a8b98fc5faebe942c697b17e109822342d Mon Sep 17 00:00:00 2001
+From: Torsten Hilbrich <torsten.hilbrich@secunet.com>
+Date: Mon, 7 Nov 2022 08:38:58 +0100
+Subject: [PATCH] test: compile test-utmp.c only if UTMP is enabled
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When compiling with -D utmp=false the compilation fails with:
+
+../../git/systemd/src/test/test-utmp.c: In function ‘test_dump_run_utmp’:
+../../git/systemd/src/test/test-utmp.c:21:9: error: cleanup argument not a function
+   21 |         _unused_ _cleanup_(utxent_cleanup) bool utmpx = false;
+      |         ^~~~~~~~
+../../git/systemd/src/test/test-utmp.c:23:17: error: implicit declaration of function ‘utxent_start’ [-Werror=implicit-function-declaration]
+   23 |         utmpx = utxent_start();
+      |                 ^~~~~~~~~~~~
+
+any many other errors
+
+Add a conditional to compile test-utmp.c only if ENABLE_UTMP is true.
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/25278]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/test/meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/test/meson.build b/src/test/meson.build
+index 86fc1d4fc0..2a4dfe26db 100644
+--- a/src/test/meson.build
++++ b/src/test/meson.build
+@@ -622,7 +622,8 @@ tests += [
+ 
+         [files('test-journal-importer.c')],
+ 
+-        [files('test-utmp.c')],
++        [files('test-utmp.c'),
++         [], [], [], 'ENABLE_UTMP'],
+ 
+         [files('test-udev.c'),
+          [libudevd_core,
+-- 
+2.38.1
+
diff --git a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch b/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
index 58767c7c35..e6abaadfcb 100644
--- a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
+++ b/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
@@ -13,11 +13,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/shared/mkdir-label.c | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/src/shared/mkdir-label.c b/src/shared/mkdir-label.c
-index 5b1ac5d1e0..fa5802b894 100644
 --- a/src/shared/mkdir-label.c
 +++ b/src/shared/mkdir-label.c
-@@ -6,6 +6,7 @@
+@@ -7,6 +7,7 @@
  #include "selinux-util.h"
  #include "smack-util.h"
  #include "user-util.h"
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index 0c85f2bcbe..f9c7ced947 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -22,11 +22,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  create mode 100644 src/basic/parse-printf-format.c
  create mode 100644 src/basic/parse-printf-format.h
 
-diff --git a/meson.build b/meson.build
-index 36cbfa4893..30b5305b89 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -694,6 +694,7 @@ endif
+@@ -739,6 +739,7 @@ endif
  foreach header : ['crypt.h',
                    'linux/memfd.h',
                    'linux/vm_sockets.h',
@@ -34,11 +32,9 @@ index 36cbfa4893..30b5305b89 100644
                    'sys/auxv.h',
                    'valgrind/memcheck.h',
                    'valgrind/valgrind.h',
-diff --git a/src/basic/meson.build b/src/basic/meson.build
-index 9b89fdcdea..0b1ef91016 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
-@@ -336,6 +336,11 @@ endforeach
+@@ -337,6 +337,11 @@ endforeach
  
  basic_sources += generated_gperf_headers
  
@@ -50,9 +46,6 @@ index 9b89fdcdea..0b1ef91016 100644
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
-index 69d7062ec6..f55c5aab2c 100644
 --- a/src/basic/stdio-util.h
 +++ b/src/basic/stdio-util.h
 @@ -1,13 +1,13 @@
@@ -409,10 +397,8 @@ index 69d7062ec6..f55c5aab2c 100644
  #include "memory-util.h"
 +#include "parse-printf-format.h"
  
- #define snprintf_ok(buf, len, fmt, ...)                                \
-         ({                                                             \
-diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/sd-journal/journal-send.c
-index 1e10ed5524..e6ceba54f9 100644
+ #define snprintf_ok(buf, len, fmt, ...)                                 \
+         ({                                                              \
 --- a/src/libsystemd/sd-journal/journal-send.c
 +++ b/src/libsystemd/sd-journal/journal-send.c
 @@ -2,7 +2,6 @@
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index 9e02666698..2c33033e91 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -72,11 +72,9 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  src/udev/udev-rules.c                      |  1 +
  52 files changed, 63 insertions(+)
 
-diff --git a/meson.build b/meson.build
-index 30b5305b89..0189ef8ce6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -512,6 +512,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
+@@ -557,6 +557,7 @@ foreach ident : ['secure_getenv', '__sec
  endforeach
  
  foreach ident : [
@@ -84,8 +82,6 @@ index 30b5305b89..0189ef8ce6 100644
          ['memfd_create',      '''#include <sys/mman.h>'''],
          ['gettid',            '''#include <sys/types.h>
                                   #include <unistd.h>'''],
-diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
-index a4e5d77f6c..fc12da4c53 100644
 --- a/src/backlight/backlight.c
 +++ b/src/backlight/backlight.c
 @@ -20,6 +20,7 @@
@@ -94,10 +90,8 @@ index a4e5d77f6c..fc12da4c53 100644
  #include "util.h"
 +#include "missing_stdlib.h"
  
- static int help(void) {
-         _cleanup_free_ char *link = NULL;
-diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index b03cc70e2e..f4615ffce1 100644
+ #define PCI_CLASS_GRAPHICS_CARD 0x30000
+ 
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
 @@ -37,6 +37,7 @@
@@ -108,8 +102,6 @@ index b03cc70e2e..f4615ffce1 100644
  
  static int cg_enumerate_items(const char *controller, const char *path, FILE **_f, const char *item) {
          _cleanup_free_ char *fs = NULL;
-diff --git a/src/basic/env-util.c b/src/basic/env-util.c
-index 885967e7f3..d0b7dc845e 100644
 --- a/src/basic/env-util.c
 +++ b/src/basic/env-util.c
 @@ -19,6 +19,7 @@
@@ -120,8 +112,6 @@ index 885967e7f3..d0b7dc845e 100644
  
  /* We follow bash for the character set. Different shells have different rules. */
  #define VALID_BASH_ENV_NAME_CHARS               \
-diff --git a/src/basic/log.c b/src/basic/log.c
-index 12071e2ebd..15254c7bbc 100644
 --- a/src/basic/log.c
 +++ b/src/basic/log.c
 @@ -36,6 +36,7 @@
@@ -132,8 +122,6 @@ index 12071e2ebd..15254c7bbc 100644
  
  #define SNDBUF_SIZE (8*1024*1024)
  
-diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
-index 8c76f93eb2..9068bfb4f0 100644
 --- a/src/basic/missing_stdlib.h
 +++ b/src/basic/missing_stdlib.h
 @@ -11,3 +11,15 @@
@@ -152,8 +140,6 @@ index 8c76f93eb2..9068bfb4f0 100644
 +    (char *)memcpy(__new, __old, __len); \
 +  })
 +#endif
-diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
-index 51a0d74e87..03569f71f8 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
 @@ -15,6 +15,7 @@
@@ -164,8 +150,6 @@ index 51a0d74e87..03569f71f8 100644
  
  int mkdir_safe_internal(
                  const char *path,
-diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-util.c
-index 82a33a6829..d947774b40 100644
 --- a/src/basic/mountpoint-util.c
 +++ b/src/basic/mountpoint-util.c
 @@ -13,6 +13,7 @@
@@ -176,8 +160,6 @@ index 82a33a6829..d947774b40 100644
  #include "mountpoint-util.h"
  #include "nulstr-util.h"
  #include "parse-util.h"
-diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
-index 2888ab6523..d941afec2d 100644
 --- a/src/basic/parse-util.c
 +++ b/src/basic/parse-util.c
 @@ -18,6 +18,7 @@
@@ -188,8 +170,6 @@ index 2888ab6523..d941afec2d 100644
  
  int parse_boolean(const char *v) {
          if (!v)
-diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c
-index 6fb8c40e7a..c4b59e8518 100644
 --- a/src/basic/path-lookup.c
 +++ b/src/basic/path-lookup.c
 @@ -16,6 +16,7 @@
@@ -200,8 +180,6 @@ index 6fb8c40e7a..c4b59e8518 100644
  
  int xdg_user_runtime_dir(char **ret, const char *suffix) {
          const char *e;
-diff --git a/src/basic/percent-util.c b/src/basic/percent-util.c
-index cab9d0eaea..5f6ca258e9 100644
 --- a/src/basic/percent-util.c
 +++ b/src/basic/percent-util.c
 @@ -3,6 +3,7 @@
@@ -212,8 +190,6 @@ index cab9d0eaea..5f6ca258e9 100644
  
  static int parse_parts_value_whole(const char *p, const char *symbol) {
          const char *pc, *n;
-diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
-index 410b8a3eb5..f2c4355609 100644
 --- a/src/basic/proc-cmdline.c
 +++ b/src/basic/proc-cmdline.c
 @@ -15,6 +15,7 @@
@@ -224,8 +200,6 @@ index 410b8a3eb5..f2c4355609 100644
  
  int proc_cmdline(char **ret) {
          const char *e;
-diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index 65f96abb06..e485a0196b 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
 @@ -12,6 +12,7 @@
@@ -236,8 +210,6 @@ index 65f96abb06..e485a0196b 100644
  
  int procfs_get_pid_max(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
-diff --git a/src/basic/time-util.c b/src/basic/time-util.c
-index b659d6905d..020112be24 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
 @@ -26,6 +26,7 @@
@@ -248,8 +220,6 @@ index b659d6905d..020112be24 100644
  
  static clockid_t map_clock_id(clockid_t c) {
  
-diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
-index d9c901d73b..79a035274c 100644
 --- a/src/boot/bless-boot.c
 +++ b/src/boot/bless-boot.c
 @@ -22,6 +22,7 @@
@@ -260,8 +230,6 @@ index d9c901d73b..79a035274c 100644
  
  static char **arg_path = NULL;
  
-diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
-index f0d8759e85..b4c1053e64 100644
 --- a/src/core/dbus-cgroup.c
 +++ b/src/core/dbus-cgroup.c
 @@ -21,6 +21,7 @@
@@ -272,8 +240,6 @@ index f0d8759e85..b4c1053e64 100644
  #include "socket-util.h"
  
  BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
-diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
-index 5c499e5d06..e7ab1bb9a5 100644
 --- a/src/core/dbus-execute.c
 +++ b/src/core/dbus-execute.c
 @@ -44,6 +44,7 @@
@@ -284,8 +250,6 @@ index 5c499e5d06..e7ab1bb9a5 100644
  
  BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_output, ExecOutput);
  static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec_input, ExecInput);
-diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
-index 32a2ec0ff9..36be2511e4 100644
 --- a/src/core/dbus-util.c
 +++ b/src/core/dbus-util.c
 @@ -9,6 +9,7 @@
@@ -296,11 +260,9 @@ index 32a2ec0ff9..36be2511e4 100644
  
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
-diff --git a/src/core/execute.c b/src/core/execute.c
-index 2762b10287..a8aeec7f6e 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -103,6 +103,7 @@
+@@ -104,6 +104,7 @@
  #include "unit-serialize.h"
  #include "user-util.h"
  #include "utmp-wtmp.h"
@@ -308,8 +270,6 @@ index 2762b10287..a8aeec7f6e 100644
  
  #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
  #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
-diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
-index f4488dd692..1d331a7ee2 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
 @@ -11,6 +11,7 @@
@@ -320,8 +280,6 @@ index f4488dd692..1d331a7ee2 100644
  
  #if HAVE_KMOD
  #include "module-util.h"
-diff --git a/src/core/service.c b/src/core/service.c
-index 9f7af9dffb..3ec5e30c8b 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -42,6 +42,7 @@
@@ -331,9 +289,7 @@ index 9f7af9dffb..3ec5e30c8b 100644
 +#include "missing_stdlib.h"
  
  #define service_spawn(...) service_spawn_internal(__func__, __VA_ARGS__)
-
-diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-vacuum.c
-index c6e201ecf2..ab034475e2 100644
+ 
 --- a/src/coredump/coredump-vacuum.c
 +++ b/src/coredump/coredump-vacuum.c
 @@ -17,6 +17,7 @@
@@ -344,11 +300,9 @@ index c6e201ecf2..ab034475e2 100644
  
  #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)           /* 1 MiB */
  #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)   /* 4 GiB */
-diff --git a/src/fstab-generator/fstab-generator.c b/src/fstab-generator/fstab-generator.c
-index 9b32383a76..f8d3397a06 100644
 --- a/src/fstab-generator/fstab-generator.c
 +++ b/src/fstab-generator/fstab-generator.c
-@@ -29,6 +29,7 @@
+@@ -32,6 +32,7 @@
  #include "util.h"
  #include "virt.h"
  #include "volatile-util.h"
@@ -356,8 +310,6 @@ index 9b32383a76..f8d3397a06 100644
  
  typedef enum MountPointFlags {
          MOUNT_NOAUTO    = 1 << 0,
-diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
-index 3e3646e45f..6a8fc60f6d 100644
 --- a/src/journal-remote/journal-remote-main.c
 +++ b/src/journal-remote/journal-remote-main.c
 @@ -24,6 +24,7 @@
@@ -368,11 +320,9 @@ index 3e3646e45f..6a8fc60f6d 100644
  
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
-diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
-index cff34fd585..a5003e47e9 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
-@@ -74,6 +74,7 @@
+@@ -70,6 +70,7 @@
  #include "unit-name.h"
  #include "user-util.h"
  #include "varlink.h"
@@ -380,20 +330,16 @@ index cff34fd585..a5003e47e9 100644
  
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
  #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages processed */
-diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
-index 96529b422b..ddb5e9c698 100644
 --- a/src/libsystemd/sd-bus/bus-message.c
 +++ b/src/libsystemd/sd-bus/bus-message.c
-@@ -20,6 +20,7 @@
+@@ -19,6 +19,7 @@
  #include "strv.h"
  #include "time-util.h"
  #include "utf8.h"
 +#include "missing_stdlib.h"
  
  static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
- 
-diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
-index 909dfe4d3a..254b7ce866 100644
+ static int message_parse_fields(sd_bus_message *m);
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
 @@ -11,6 +11,7 @@
@@ -404,8 +350,6 @@ index 909dfe4d3a..254b7ce866 100644
  
  static int node_vtable_get_userdata(
                  sd_bus *bus,
-diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-socket.c
-index 14951ccb33..b7f86ca501 100644
 --- a/src/libsystemd/sd-bus/bus-socket.c
 +++ b/src/libsystemd/sd-bus/bus-socket.c
 @@ -28,6 +28,7 @@
@@ -416,11 +360,9 @@ index 14951ccb33..b7f86ca501 100644
  
  #define SNDBUF_SIZE (8*1024*1024)
  
-diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
-index 9e1d29cc1d..8c3165f0ce 100644
 --- a/src/libsystemd/sd-bus/sd-bus.c
 +++ b/src/libsystemd/sd-bus/sd-bus.c
-@@ -43,6 +43,7 @@
+@@ -44,6 +44,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "user-util.h"
@@ -428,8 +370,6 @@ index 9e1d29cc1d..8c3165f0ce 100644
  
  #define log_debug_bus_message(m)                                         \
          do {                                                             \
-diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd/sd-bus/test-bus-benchmark.c
-index 317653bedc..d028216c48 100644
 --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
 +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
 @@ -14,6 +14,7 @@
@@ -440,8 +380,6 @@ index 317653bedc..d028216c48 100644
  
  #define MAX_SIZE (2*1024*1024)
  
-diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-journal/sd-journal.c
-index 7a6cc4aca3..b7f7cd65c5 100644
 --- a/src/libsystemd/sd-journal/sd-journal.c
 +++ b/src/libsystemd/sd-journal/sd-journal.c
 @@ -41,6 +41,7 @@
@@ -452,23 +390,9 @@ index 7a6cc4aca3..b7f7cd65c5 100644
  
  #define JOURNAL_FILES_MAX 7168
  
-diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.c
-index 10d2ed7aec..4fbe3f6b4a 100644
---- a/src/locale/keymap-util.c
-+++ b/src/locale/keymap-util.c
-@@ -24,6 +24,7 @@
- #include "string-util.h"
- #include "strv.h"
- #include "tmpfile-util.h"
-+#include "missing_stdlib.h"
- 
- static bool startswith_comma(const char *s, const char *prefix) {
-         s = startswith(s, prefix);
-diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
-index 5bd7efc3e8..282899601e 100644
 --- a/src/login/pam_systemd.c
 +++ b/src/login/pam_systemd.c
-@@ -31,6 +31,7 @@
+@@ -32,6 +32,7 @@
  #include "locale-util.h"
  #include "login-util.h"
  #include "macro.h"
@@ -476,8 +400,6 @@ index 5bd7efc3e8..282899601e 100644
  #include "pam-util.h"
  #include "parse-util.h"
  #include "path-util.h"
-diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
-index 063ad08d80..f9823a433b 100644
 --- a/src/network/generator/network-generator.c
 +++ b/src/network/generator/network-generator.c
 @@ -13,6 +13,7 @@
@@ -488,8 +410,6 @@ index 063ad08d80..f9823a433b 100644
  
  /*
    # .network
-diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
-index 1f58bf3ed4..8457a3b0e3 100644
 --- a/src/nspawn/nspawn-settings.c
 +++ b/src/nspawn/nspawn-settings.c
 @@ -17,6 +17,7 @@
@@ -500,8 +420,6 @@ index 1f58bf3ed4..8457a3b0e3 100644
  
  Settings *settings_new(void) {
          Settings *s;
-diff --git a/src/nss-mymachines/nss-mymachines.c b/src/nss-mymachines/nss-mymachines.c
-index c64e79bdff..eda26b0b9a 100644
 --- a/src/nss-mymachines/nss-mymachines.c
 +++ b/src/nss-mymachines/nss-mymachines.c
 @@ -21,6 +21,7 @@
@@ -512,8 +430,6 @@ index c64e79bdff..eda26b0b9a 100644
  
  static void setup_logging_once(void) {
          static pthread_once_t once = PTHREAD_ONCE_INIT;
-diff --git a/src/portable/portable.c b/src/portable/portable.c
-index 0e6461ba93..54148d5924 100644
 --- a/src/portable/portable.c
 +++ b/src/portable/portable.c
 @@ -39,6 +39,7 @@
@@ -524,20 +440,16 @@ index 0e6461ba93..54148d5924 100644
  
  /* Markers used in the first line of our 20-portable.conf unit file drop-in to determine, that a) the unit file was
   * dropped there by the portable service logic and b) for which image it was dropped there. */
-diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
-index 5b3ceeff36..d36d1d57ae 100644
 --- a/src/resolve/resolvectl.c
 +++ b/src/resolve/resolvectl.c
-@@ -43,6 +43,7 @@
- #include "utf8.h"
+@@ -46,6 +46,7 @@
+ #include "varlink.h"
  #include "verb-log-control.h"
  #include "verbs.h"
 +#include "missing_stdlib.h"
  
  static int arg_family = AF_UNSPEC;
  static int arg_ifindex = 0;
-diff --git a/src/shared/bus-get-properties.c b/src/shared/bus-get-properties.c
-index 8b4f66b22e..5926e4c61b 100644
 --- a/src/shared/bus-get-properties.c
 +++ b/src/shared/bus-get-properties.c
 @@ -4,6 +4,7 @@
@@ -548,11 +460,9 @@ index 8b4f66b22e..5926e4c61b 100644
  
  int bus_property_get_bool(
                  sd_bus *bus,
-diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-procs.c
-index 87c0334fec..402ab3493b 100644
 --- a/src/shared/bus-unit-procs.c
 +++ b/src/shared/bus-unit-procs.c
-@@ -10,6 +10,7 @@
+@@ -11,6 +11,7 @@
  #include "sort-util.h"
  #include "string-util.h"
  #include "terminal-util.h"
@@ -560,8 +470,6 @@ index 87c0334fec..402ab3493b 100644
  
  struct CGroupInfo {
          char *cgroup_path;
-diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
-index dcce530c99..faf5a5bda0 100644
 --- a/src/shared/bus-unit-util.c
 +++ b/src/shared/bus-unit-util.c
 @@ -49,6 +49,7 @@
@@ -572,8 +480,6 @@ index dcce530c99..faf5a5bda0 100644
  
  int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
          assert(message);
-diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
-index 4a2b7684bc..ee6d687c58 100644
 --- a/src/shared/bus-util.c
 +++ b/src/shared/bus-util.c
 @@ -21,6 +21,7 @@
@@ -583,12 +489,10 @@ index 4a2b7684bc..ee6d687c58 100644
 +#include "missing_stdlib.h"
  
  static int name_owner_change_callback(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
-         sd_event *e = userdata;
-diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
-index f54b187a1b..299758c7e4 100644
+         sd_event *e = ASSERT_PTR(userdata);
 --- a/src/shared/dns-domain.c
 +++ b/src/shared/dns-domain.c
-@@ -17,6 +17,7 @@
+@@ -18,6 +18,7 @@
  #include "string-util.h"
  #include "strv.h"
  #include "utf8.h"
@@ -596,8 +500,6 @@ index f54b187a1b..299758c7e4 100644
  
  int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLabelFlags flags) {
          const char *n;
-diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
-index c6caf9330a..ebe33bd44a 100644
 --- a/src/shared/journal-importer.c
 +++ b/src/shared/journal-importer.c
 @@ -15,6 +15,7 @@
@@ -608,8 +510,6 @@ index c6caf9330a..ebe33bd44a 100644
  
  enum {
          IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
-diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
-index cf83eb6bca..e672a003a3 100644
 --- a/src/shared/logs-show.c
 +++ b/src/shared/logs-show.c
 @@ -42,6 +42,7 @@
@@ -620,8 +520,6 @@ index cf83eb6bca..e672a003a3 100644
  
  /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
  #define PRINT_LINE_THRESHOLD 3
-diff --git a/src/shared/pager.c b/src/shared/pager.c
-index f75ef62d2d..530001a821 100644
 --- a/src/shared/pager.c
 +++ b/src/shared/pager.c
 @@ -26,6 +26,7 @@
@@ -632,20 +530,6 @@ index f75ef62d2d..530001a821 100644
  
  static pid_t pager_pid = 0;
  
-diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
-index 1b4396a34c..c2f72b185f 100644
---- a/src/shared/uid-range.c
-+++ b/src/shared/uid-range.c
-@@ -14,6 +14,7 @@
- #include "stat-util.h"
- #include "uid-range.h"
- #include "user-util.h"
-+#include "missing_stdlib.h"
- 
- static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
-         assert(range);
-diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
-index 7e9ab19666..56f619e54e 100644
 --- a/src/socket-proxy/socket-proxyd.c
 +++ b/src/socket-proxy/socket-proxyd.c
 @@ -26,6 +26,7 @@
@@ -656,8 +540,6 @@ index 7e9ab19666..56f619e54e 100644
  
  #define BUFFER_SIZE (256 * 1024)
  
-diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
-index cc9a7cb838..a679614a47 100644
 --- a/src/test/test-hexdecoct.c
 +++ b/src/test/test-hexdecoct.c
 @@ -7,6 +7,7 @@
@@ -668,8 +550,6 @@ index cc9a7cb838..a679614a47 100644
  #include "tests.h"
  
  TEST(hexchar) {
-diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
-index ae92e45205..1e6f3205cb 100644
 --- a/src/udev/udev-builtin-path_id.c
 +++ b/src/udev/udev-builtin-path_id.c
 @@ -22,6 +22,7 @@
@@ -680,11 +560,9 @@ index ae92e45205..1e6f3205cb 100644
  
  _printf_(2,3)
  static void path_prepend(char **path, const char *fmt, ...) {
-diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
-index a60e4f294c..571c43765b 100644
 --- a/src/udev/udev-event.c
 +++ b/src/udev/udev-event.c
-@@ -35,6 +35,7 @@
+@@ -34,6 +34,7 @@
  #include "udev-util.h"
  #include "udev-watch.h"
  #include "user-util.h"
@@ -692,8 +570,6 @@ index a60e4f294c..571c43765b 100644
  
  typedef struct Spawn {
          sd_device *device;
-diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index 1a384d6b38..0089833e3f 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
 @@ -34,6 +34,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index eeaaac1b9a..2a5770c515 100644
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
@@ -63,13 +61,11 @@ index e026b29478..815e56ef68 100644
          if (k == GLOB_NOMATCH)
                  return -ENOENT;
          if (k == GLOB_NOSPACE)
-diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
-index ec8b74f48f..d99a6095df 100644
 --- a/src/test/test-glob-util.c
 +++ b/src/test/test-glob-util.c
-@@ -13,6 +13,12 @@
- #include "tests.h"
- #include "tmpfile-util.h"
+@@ -34,6 +34,12 @@ TEST(glob_first) {
+         assert_se(first == NULL);
+ }
  
 +/* Don't fail if the standard library
 + * doesn't provide brace expansion */
@@ -80,7 +76,7 @@ index ec8b74f48f..d99a6095df 100644
  TEST(glob_exists) {
          char name[] = "/tmp/test-glob_exists.XXXXXX";
          int fd = -1;
-@@ -40,11 +46,13 @@ TEST(glob_no_dot) {
+@@ -61,11 +67,13 @@ TEST(glob_no_dot) {
          const char *fn;
  
          _cleanup_globfree_ glob_t g = {
@@ -94,7 +90,7 @@ index ec8b74f48f..d99a6095df 100644
          };
  
          int r;
-@@ -52,11 +60,19 @@ TEST(glob_no_dot) {
+@@ -73,11 +81,19 @@ TEST(glob_no_dot) {
          assert_se(mkdtemp(template));
  
          fn = strjoina(template, "/*");
@@ -114,13 +110,11 @@ index ec8b74f48f..d99a6095df 100644
          assert_se(r == GLOB_NOMATCH);
  
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
-diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index fcab51c208..fdef1807ae 100644
 --- a/src/tmpfiles/tmpfiles.c
 +++ b/src/tmpfiles/tmpfiles.c
-@@ -67,6 +67,12 @@
- #include "umask-util.h"
+@@ -71,6 +71,12 @@
  #include "user-util.h"
+ #include "virt.h"
  
 +/* Don't fail if the standard library
 + * doesn't provide brace expansion */
@@ -131,7 +125,7 @@ index fcab51c208..fdef1807ae 100644
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
   * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -1934,7 +1940,9 @@ finish:
+@@ -2174,7 +2180,9 @@ finish:
  
  static int glob_item(Item *i, action_t action) {
          _cleanup_globfree_ glob_t g = {
@@ -140,8 +134,8 @@ index fcab51c208..fdef1807ae 100644
 +#endif
          };
          int r = 0, k;
-
-@@ -1953,7 +1961,9 @@ static int glob_item(Item *i, action_t action) {
+ 
+@@ -2194,7 +2202,9 @@ static int glob_item(Item *i, action_t a
  
  static int glob_item_recursively(Item *i, fdaction_t action) {
          _cleanup_globfree_ glob_t g = {
@@ -150,3 +144,4 @@ index fcab51c208..fdef1807ae 100644
 +#endif
          };
          int r = 0, k;
+ 
diff --git a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
index 3a47d09e8a..aac4ad49d7 100644
--- a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
@@ -27,11 +27,9 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/core/execute.c      |  4 ++--
  3 files changed, 9 insertions(+), 15 deletions(-)
 
-diff --git a/src/basic/format-util.h b/src/basic/format-util.h
-index 8719df3e29..9becc96066 100644
 --- a/src/basic/format-util.h
 +++ b/src/basic/format-util.h
-@@ -34,13 +34,7 @@ assert_cc(sizeof(gid_t) == sizeof(uint32_t));
+@@ -34,13 +34,7 @@ assert_cc(sizeof(gid_t) == sizeof(uint32
  #  error Unknown timex member size
  #endif
  
@@ -46,11 +44,9 @@ index 8719df3e29..9becc96066 100644
  
  #if SIZEOF_DEV_T == 8
  #  define DEV_FMT "%" PRIu64
-diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
-index 33dfde9d6c..e018fd81fd 100644
 --- a/src/basic/rlimit-util.c
 +++ b/src/basic/rlimit-util.c
-@@ -44,7 +44,7 @@ int setrlimit_closest(int resource, const struct rlimit *rlim) {
+@@ -44,7 +44,7 @@ int setrlimit_closest(int resource, cons
              fixed.rlim_max == highest.rlim_max)
                  return 0;
  
@@ -59,7 +55,7 @@ index 33dfde9d6c..e018fd81fd 100644
  
          return RET_NERRNO(setrlimit(resource, &fixed));
  }
-@@ -307,13 +307,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
+@@ -307,13 +307,13 @@ int rlimit_format(const struct rlimit *r
          if (rl->rlim_cur >= RLIM_INFINITY && rl->rlim_max >= RLIM_INFINITY)
                  r = free_and_strdup(&s, "infinity");
          else if (rl->rlim_cur >= RLIM_INFINITY)
@@ -86,11 +82,9 @@ index 33dfde9d6c..e018fd81fd 100644
  
          return 1;
  }
-diff --git a/src/core/execute.c b/src/core/execute.c
-index fccfb9268c..90f00e10a5 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -5633,9 +5633,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
+@@ -5869,9 +5869,9 @@ void exec_context_dump(const ExecContext
          for (unsigned i = 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
                          fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index e1a2512ec3..6367adce07 100644
--- a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -31,11 +31,9 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  src/shared/base-filesystem.c |  6 +++---
  2 files changed, 23 insertions(+), 4 deletions(-)
 
-diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
-index 0bbb3f6298..3dc494dbfb 100644
 --- a/src/basic/fs-util.h
 +++ b/src/basic/fs-util.h
-@@ -46,8 +46,27 @@ int futimens_opath(int fd, const struct timespec ts[2]);
+@@ -47,8 +47,27 @@ int futimens_opath(int fd, const struct
  int fd_warn_permissions(const char *path, int fd);
  int stat_warn_permissions(const char *path, const struct stat *st);
  
@@ -63,12 +61,10 @@ index 0bbb3f6298..3dc494dbfb 100644
 +        RET_NERRNO(faccessat(AT_FDCWD, (path), (mode), 0))
  
  int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid, gid_t gid, mode_t mode);
- int touch(const char *path);
-diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index 6dacc1d20a..909a6818f6 100644
+ 
 --- a/src/shared/base-filesystem.c
 +++ b/src/shared/base-filesystem.c
-@@ -131,7 +131,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -131,7 +131,7 @@ int base_filesystem_create(const char *r
                  return log_error_errno(errno, "Failed to open root file system: %m");
  
          for (size_t i = 0; i < ELEMENTSOF(table); i++) {
@@ -77,7 +73,7 @@ index 6dacc1d20a..909a6818f6 100644
                          continue;
  
                  if (table[i].target) {
-@@ -139,7 +139,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -139,7 +139,7 @@ int base_filesystem_create(const char *r
  
                          /* check if one of the targets exists */
                          NULSTR_FOREACH(s, table[i].target) {
@@ -86,7 +82,7 @@ index 6dacc1d20a..909a6818f6 100644
                                          continue;
  
                                  /* check if a specific file exists at the target path */
-@@ -150,7 +150,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -150,7 +150,7 @@ int base_filesystem_create(const char *r
                                          if (!p)
                                                  return log_oom();
  
diff --git a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index 7b22d6214f..3228f1716b 100644
--- a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -14,13 +14,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/machine/machine-dbus.c | 5 +++++
  1 file changed, 5 insertions(+)
 
-diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
-index 8f11afd65b..a2b57deb7a 100644
 --- a/src/machine/machine-dbus.c
 +++ b/src/machine/machine-dbus.c
-@@ -10,6 +10,11 @@
- #include <libgen.h>
- #undef basename
+@@ -4,6 +4,11 @@
+ #include <sys/mount.h>
+ #include <sys/wait.h>
  
 +#if !defined(__GLIBC__)
 +#include <string.h>
diff --git a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index e5e592a837..da56d8b4b6 100644
--- a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -24,11 +24,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/basic/process-util.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 6980e0c4f6..45ec26ea45 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
-@@ -1460,7 +1460,7 @@ int set_oom_score_adjust(int value) {
+@@ -1466,7 +1466,7 @@ int set_oom_score_adjust(int value) {
          xsprintf(t, "%i", value);
  
          return write_string_file("/proc/self/oom_score_adj", t,
diff --git a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index c563982607..7533fde1e1 100644
--- a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -24,11 +24,9 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/libsystemd/sd-journal/journal-send.c | 5 +++++
  2 files changed, 10 insertions(+)
 
-diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
-index bdfa145ab7..61928f4bf3 100644
 --- a/src/libsystemd/sd-bus/bus-error.c
 +++ b/src/libsystemd/sd-bus/bus-error.c
-@@ -409,7 +409,12 @@ static void bus_error_strerror(sd_bus_error *e, int error) {
+@@ -409,7 +409,12 @@ static void bus_error_strerror(sd_bus_er
                          return;
  
                  errno = 0;
@@ -41,11 +39,23 @@ index bdfa145ab7..61928f4bf3 100644
                  if (errno == ERANGE || strlen(x) >= k - 1) {
                          free(m);
                          k *= 2;
-diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/sd-journal/journal-send.c
-index e6ceba54f9..285ebbc9ef 100644
+@@ -594,8 +599,12 @@ const char* _bus_error_message(const sd_
+ 
+         if (e && e->message)
+                 return e->message;
+-
++#ifndef __GLIBC__
++        strerror_r(abs(error), buf, ERRNO_BUF_LEN);
++        return buf;
++#else
+         return strerror_r(abs(error), buf, ERRNO_BUF_LEN);
++#endif
+ }
+ 
+ static bool map_ok(const sd_bus_error_map *map) {
 --- a/src/libsystemd/sd-journal/journal-send.c
 +++ b/src/libsystemd/sd-journal/journal-send.c
-@@ -370,7 +370,12 @@ static int fill_iovec_perror_and_send(const char *message, int skip, struct iove
+@@ -381,7 +381,12 @@ static int fill_iovec_perror_and_send(co
                  char* j;
  
                  errno = 0;
diff --git a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
index 00131de7d0..f76085e3af 100644
--- a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
@@ -43,11 +43,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/vconsole/vconsole-setup.c           |  2 +-
  21 files changed, 39 insertions(+), 40 deletions(-)
 
-diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index f4615ffce1..07cb8ed669 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -399,7 +399,7 @@ int cg_kill_kernel_sigkill(const char *controller, const char *path) {
+@@ -399,7 +399,7 @@ int cg_kill_kernel_sigkill(const char *c
          if (r < 0)
                  return r;
  
@@ -56,7 +54,7 @@ index f4615ffce1..07cb8ed669 100644
          if (r < 0)
                  return r;
  
-@@ -805,7 +805,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -805,7 +805,7 @@ int cg_install_release_agent(const char
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -65,7 +63,7 @@ index f4615ffce1..07cb8ed669 100644
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -823,7 +823,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -823,7 +823,7 @@ int cg_install_release_agent(const char
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -74,7 +72,7 @@ index f4615ffce1..07cb8ed669 100644
                  if (r < 0)
                          return r;
  
-@@ -850,7 +850,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -850,7 +850,7 @@ int cg_uninstall_release_agent(const cha
          if (r < 0)
                  return r;
  
@@ -83,7 +81,7 @@ index f4615ffce1..07cb8ed669 100644
          if (r < 0)
                  return r;
  
-@@ -860,7 +860,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -860,7 +860,7 @@ int cg_uninstall_release_agent(const cha
          if (r < 0)
                  return r;
  
@@ -92,7 +90,7 @@ index f4615ffce1..07cb8ed669 100644
          if (r < 0)
                  return r;
  
-@@ -1730,7 +1730,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
+@@ -1730,7 +1730,7 @@ int cg_set_attribute(const char *control
          if (r < 0)
                  return r;
  
@@ -101,11 +99,9 @@ index f4615ffce1..07cb8ed669 100644
  }
  
  int cg_get_attribute(const char *controller, const char *path, const char *attribute, char **ret) {
-diff --git a/src/basic/namespace-util.c b/src/basic/namespace-util.c
-index b9120a5ed0..78e460b75f 100644
 --- a/src/basic/namespace-util.c
 +++ b/src/basic/namespace-util.c
-@@ -202,12 +202,12 @@ int userns_acquire(const char *uid_map, const char *gid_map) {
+@@ -220,12 +220,12 @@ int userns_acquire(const char *uid_map,
                  freeze();
  
          xsprintf(path, "/proc/" PID_FMT "/uid_map", pid);
@@ -120,11 +116,9 @@ index b9120a5ed0..78e460b75f 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
-diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index e485a0196b..8bff210356 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
-@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
+@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limi
           * decrease it, as threads-max is the much more relevant sysctl. */
          if (limit > pid_max-1) {
                  sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since PID 0 is not a valid PID */
@@ -140,11 +134,9 @@ index e485a0196b..8bff210356 100644
          if (r < 0) {
                  uint64_t threads_max;
  
-diff --git a/src/basic/sysctl-util.c b/src/basic/sysctl-util.c
-index b66a6622ae..8d1c93008a 100644
 --- a/src/basic/sysctl-util.c
 +++ b/src/basic/sysctl-util.c
-@@ -58,7 +58,7 @@ int sysctl_write(const char *property, const char *value) {
+@@ -58,7 +58,7 @@ int sysctl_write(const char *property, c
  
          log_debug("Setting '%s' to '%s'", p, value);
  
@@ -153,8 +145,6 @@ index b66a6622ae..8d1c93008a 100644
  }
  
  int sysctl_writef(const char *property, const char *format, ...) {
-diff --git a/src/basic/util.c b/src/basic/util.c
-index d7ef382737..31c35118d1 100644
 --- a/src/basic/util.c
 +++ b/src/basic/util.c
 @@ -168,7 +168,7 @@ void disable_coredumps(void) {
@@ -166,8 +156,6 @@ index d7ef382737..31c35118d1 100644
          if (r < 0)
                  log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
  }
-diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
-index 18231c2618..6c598d55c8 100644
 --- a/src/binfmt/binfmt.c
 +++ b/src/binfmt/binfmt.c
 @@ -29,7 +29,7 @@ static bool arg_unregister = false;
@@ -179,7 +167,7 @@ index 18231c2618..6c598d55c8 100644
  }
  
  static int apply_rule(const char *filename, unsigned line, const char *rule) {
-@@ -59,7 +59,7 @@ static int apply_rule(const char *filename, unsigned line, const char *rule) {
+@@ -59,7 +59,7 @@ static int apply_rule(const char *filena
          if (r >= 0)
                  log_debug("%s:%u: Rule '%s' deleted.", filename, line, rulename);
  
@@ -197,11 +185,9 @@ index 18231c2618..6c598d55c8 100644
                  if (r < 0)
                          log_warning_errno(r, "Failed to flush binfmt_misc rules, ignoring: %m");
                  else
-diff --git a/src/core/cgroup.c b/src/core/cgroup.c
-index 9282b1ff20..7781e0f8eb 100644
 --- a/src/core/cgroup.c
 +++ b/src/core/cgroup.c
-@@ -4182,7 +4182,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAction action) {
+@@ -4191,7 +4191,7 @@ int unit_cgroup_freezer_action(Unit *u,
          else
                  u->freezer_state = FREEZER_THAWING;
  
@@ -210,11 +196,9 @@ index 9282b1ff20..7781e0f8eb 100644
          if (r < 0)
                  return r;
  
-diff --git a/src/core/main.c b/src/core/main.c
-index 409b84a006..b1631e57ce 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1374,7 +1374,7 @@ static int bump_unix_max_dgram_qlen(void) {
+@@ -1403,7 +1403,7 @@ static int bump_unix_max_dgram_qlen(void
          if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
                  return 0;
  
@@ -223,7 +207,7 @@ index 409b84a006..b1631e57ce 100644
                                 "%lu", DEFAULT_UNIX_MAX_DGRAM_QLEN);
          if (r < 0)
                  return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
-@@ -1646,7 +1646,7 @@ static void initialize_core_pattern(bool skip_setup) {
+@@ -1675,7 +1675,7 @@ static void initialize_core_pattern(bool
          if (getpid_cached() != 1)
                  return;
  
@@ -232,11 +216,9 @@ index 409b84a006..b1631e57ce 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m",
                                    arg_early_core_pattern);
-diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
-index f88cb80834..68055fb64a 100644
 --- a/src/core/smack-setup.c
 +++ b/src/core/smack-setup.c
-@@ -320,17 +320,17 @@ int mac_smack_setup(bool *loaded_policy) {
+@@ -320,17 +320,17 @@ int mac_smack_setup(bool *loaded_policy)
          }
  
  #if HAVE_SMACK_RUN_LABEL
@@ -258,8 +240,6 @@ index f88cb80834..68055fb64a 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
  #endif
-diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-resume/hibernate-resume.c
-index 1c7d9179d8..3ae78ee580 100644
 --- a/src/hibernate-resume/hibernate-resume.c
 +++ b/src/hibernate-resume/hibernate-resume.c
 @@ -40,7 +40,7 @@ int main(int argc, char *argv[]) {
@@ -271,24 +251,20 @@ index 1c7d9179d8..3ae78ee580 100644
          if (r < 0) {
                  log_error_errno(r, "Failed to write '" DEVNUM_FORMAT_STR "' to /sys/power/resume: %m", DEVNUM_FORMAT_VAL(st.st_rdev));
                  return EXIT_FAILURE;
-diff --git a/src/home/homework.c b/src/home/homework.c
-index 0014a7f598..ec3e9caa1c 100644
 --- a/src/home/homework.c
 +++ b/src/home/homework.c
 @@ -278,7 +278,7 @@ static void drop_caches_now(void) {
-          * details. We write "2" into /proc/sys/vm/drop_caches to ensure dentries/inodes are flushed, but not
-          * more. */
+          * for details. We write "2" into /proc/sys/vm/drop_caches to ensure dentries/inodes are flushed, but
+          * not more. */
  
 -        r = write_string_file("/proc/sys/vm/drop_caches", "2\n", WRITE_STRING_FILE_DISABLE_BUFFER);
 +        r = write_string_file("/proc/sys/vm/drop_caches", "2\n", 0);
          if (r < 0)
                  log_warning_errno(r, "Failed to drop caches, ignoring: %m");
          else
-diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
-index aaf951ced8..45a9d70f0d 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
-@@ -2215,7 +2215,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
+@@ -2439,7 +2439,7 @@ _public_ int sd_device_set_sysattr_value
          if (!value)
                  return -ENOMEM;
  
@@ -297,11 +273,9 @@ index aaf951ced8..45a9d70f0d 100644
          if (r < 0) {
                  /* On failure, clear cache entry, as we do not know how it fails. */
                  device_remove_cached_sysattr_value(device, sysattr);
-diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
-index 9e6379ae7b..546a03a7f5 100644
 --- a/src/nspawn/nspawn-cgroup.c
 +++ b/src/nspawn/nspawn-cgroup.c
-@@ -123,7 +123,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
+@@ -123,7 +123,7 @@ int sync_cgroup(pid_t pid, CGroupUnified
          fn = strjoina(tree, cgroup, "/cgroup.procs");
  
          sprintf(pid_string, PID_FMT, pid);
@@ -310,11 +284,9 @@ index 9e6379ae7b..546a03a7f5 100644
          if (r < 0) {
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
-diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index c5fd978395..fefe8a21e5 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2759,7 +2759,7 @@ static int reset_audit_loginuid(void) {
+@@ -2762,7 +2762,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
  
@@ -341,8 +313,6 @@ index c5fd978395..fefe8a21e5 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
-diff --git a/src/shared/binfmt-util.c b/src/shared/binfmt-util.c
-index 724d7f27d9..dd725cff92 100644
 --- a/src/shared/binfmt-util.c
 +++ b/src/shared/binfmt-util.c
 @@ -26,7 +26,7 @@ int disable_binfmt(void) {
@@ -354,11 +324,9 @@ index 724d7f27d9..dd725cff92 100644
          if (r < 0)
                  return log_warning_errno(r, "Failed to unregister binfmt_misc entries: %m");
  
-diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
-index a1fabc73c1..c5c8fc417e 100644
 --- a/src/shared/cgroup-setup.c
 +++ b/src/shared/cgroup-setup.c
-@@ -344,7 +344,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
+@@ -350,7 +350,7 @@ int cg_attach(const char *controller, co
  
          xsprintf(c, PID_FMT "\n", pid);
  
@@ -367,7 +335,7 @@ index a1fabc73c1..c5c8fc417e 100644
          if (r == -EOPNOTSUPP && cg_is_threaded(controller, path) > 0)
                  /* When the threaded mode is used, we cannot read/write the file. Let's return recognizable error. */
                  return -EUCLEAN;
-@@ -879,7 +879,7 @@ int cg_enable_everywhere(
+@@ -887,7 +887,7 @@ int cg_enable_everywhere(
                                          return log_debug_errno(errno, "Failed to open cgroup.subtree_control file of %s: %m", p);
                          }
  
@@ -376,22 +344,18 @@ index a1fabc73c1..c5c8fc417e 100644
                          if (r < 0) {
                                  log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
                                                  FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
-diff --git a/src/shared/coredump-util.c b/src/shared/coredump-util.c
-index a0b648bf79..13f921390d 100644
 --- a/src/shared/coredump-util.c
 +++ b/src/shared/coredump-util.c
-@@ -70,5 +70,5 @@ int set_coredump_filter(uint64_t value) {
+@@ -70,5 +70,5 @@ int set_coredump_filter(uint64_t value)
          sprintf(t, "0x%"PRIx64, value);
  
          return write_string_file("/proc/self/coredump_filter", t,
 -                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE|WRITE_STRING_FILE_DISABLE_BUFFER);
 +                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE);
  }
-diff --git a/src/shared/smack-util.c b/src/shared/smack-util.c
-index 0df1778cb2..3b9a0c934e 100644
 --- a/src/shared/smack-util.c
 +++ b/src/shared/smack-util.c
-@@ -114,7 +114,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
+@@ -115,7 +115,7 @@ int mac_smack_apply_pid(pid_t pid, const
                  return 0;
  
          p = procfs_file_alloca(pid, "attr/current");
@@ -400,11 +364,9 @@ index 0df1778cb2..3b9a0c934e 100644
          if (r < 0)
                  return r;
  
-diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
-index 7064f3a905..8f2a7d9da2 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
-@@ -46,7 +46,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
+@@ -50,7 +50,7 @@ static int write_hibernate_location_info
          assert(hibernate_location->swap);
  
          xsprintf(resume_str, "%u:%u", major(hibernate_location->devno), minor(hibernate_location->devno));
@@ -413,7 +375,7 @@ index 7064f3a905..8f2a7d9da2 100644
          if (r < 0)
                  return log_debug_errno(r, "Failed to write partition device to /sys/power/resume for '%s': '%s': %m",
                                         hibernate_location->swap->device, resume_str);
-@@ -73,7 +73,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
+@@ -77,7 +77,7 @@ static int write_hibernate_location_info
          }
  
          xsprintf(offset_str, "%" PRIu64, hibernate_location->offset);
@@ -422,7 +384,7 @@ index 7064f3a905..8f2a7d9da2 100644
          if (r < 0)
                  return log_debug_errno(r, "Failed to write swap file offset to /sys/power/resume_offset for '%s': '%s': %m",
                                         hibernate_location->swap->device, offset_str);
-@@ -89,7 +89,7 @@ static int write_mode(char **modes) {
+@@ -93,7 +93,7 @@ static int write_mode(char **modes) {
          STRV_FOREACH(mode, modes) {
                  int k;
  
@@ -431,7 +393,7 @@ index 7064f3a905..8f2a7d9da2 100644
                  if (k >= 0)
                          return 0;
  
-@@ -110,7 +110,7 @@ static int write_state(FILE **f, char **states) {
+@@ -114,7 +114,7 @@ static int write_state(FILE **f, char **
          STRV_FOREACH(state, states) {
                  int k;
  
@@ -440,11 +402,9 @@ index 7064f3a905..8f2a7d9da2 100644
                  if (k >= 0)
                          return 0;
                  log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
-diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index cd858c9cca..0feb9669a0 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
-@@ -2335,7 +2335,6 @@ static int udev_rule_apply_token_to_event(
+@@ -2354,7 +2354,6 @@ static int udev_rule_apply_token_to_even
                  log_rule_debug(dev, rules, "ATTR '%s' writing '%s'", buf, value);
                  r = write_string_file(buf, value,
                                        WRITE_STRING_FILE_VERIFY_ON_FAILURE |
@@ -452,11 +412,9 @@ index cd858c9cca..0feb9669a0 100644
                                        WRITE_STRING_FILE_AVOID_NEWLINE |
                                        WRITE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
                  if (r < 0)
-diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
-index 50930d4af3..5efd5d3728 100644
 --- a/src/vconsole/vconsole-setup.c
 +++ b/src/vconsole/vconsole-setup.c
-@@ -108,7 +108,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
+@@ -108,7 +108,7 @@ static int toggle_utf8_vc(const char *na
  static int toggle_utf8_sysfs(bool utf8) {
          int r;
  
diff --git a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
index 2c56838644..45778541c3 100644
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
-index 0eddd382e6..d506b8e263 100644
 --- a/src/shared/userdb.c
 +++ b/src/shared/userdb.c
-@@ -1046,13 +1046,15 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
+@@ -1044,13 +1044,15 @@ int groupdb_iterator_get(UserDBIterator
                  if (gr) {
                          _cleanup_free_ char *buffer = NULL;
                          bool incomplete = false;
@@ -159,7 +153,7 @@ index 0eddd382e6..d506b8e263 100644
                          if (!FLAGS_SET(iterator->flags, USERDB_SUPPRESS_SHADOW)) {
                                  r = nss_sgrp_for_group(gr, &sgrp, &buffer);
                                  if (r < 0) {
-@@ -1065,6 +1067,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
+@@ -1063,6 +1065,9 @@ int groupdb_iterator_get(UserDBIterator
                          }
  
                          r = nss_group_to_group_record(gr, r >= 0 ? &sgrp : NULL, ret);
diff --git a/meta/recipes-core/systemd/systemd_252.bb b/meta/recipes-core/systemd/systemd_252.bb
index 3ce95ad257..00355ef9ec 100644
--- a/meta/recipes-core/systemd/systemd_252.bb
+++ b/meta/recipes-core/systemd/systemd_252.bb
@@ -25,6 +25,8 @@ SRC_URI += " \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
+           file://0001-networkd-ipv4acd.c-Use-net-if.h-for-getting-IFF_LOOP.patch \
+           file://0001-test-compile-test-utmp.c-only-if-UTMP-is-enabled.patch \
            "
 
 # patches needed by musl
@@ -49,6 +51,7 @@ SRC_URI_MUSL = "\
                file://0001-pass-correct-parameters-to-getdents64.patch \
                file://0002-Add-sys-stat.h-for-S_IFDIR.patch \
                file://0001-Adjust-for-musl-headers.patch \
+               file://0001-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch \
                "
 
 PAM_PLUGINS = " \
@@ -109,7 +112,7 @@ PACKAGECONFIG:remove:libc-musl = " \
 # https://github.com/seccomp/libseccomp/issues/347
 PACKAGECONFIG:remove:mipsarch = "seccomp"
 
-CFLAGS:append:libc-musl = " -D__UAPI_DEF_ETHHDR=0 "
+TARGET_CC_ARCH:append:libc-musl = " -D__UAPI_DEF_ETHHDR=0 -D_LARGEFILE64_SOURCE"
 
 # Some of the dependencies are weak-style recommends - if not available at runtime,
 # systemd won't fail but the library-related feature will be skipped with a warning.
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.bb
index 887a530a52..b56b104a99 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.bb
@@ -52,6 +52,9 @@ EXTRA_OECONF:append:libc-musl = " --disable-backtrace "
 EXTRA_PYTHON_CFLAGS = "${DEBUG_PREFIX_MAP}"
 EXTRA_PYTHON_CFLAGS:class-native = ""
 EXTRA_PYTHON_LDFLAGS = "${LDFLAGS}"
+
+TARGET_CC_ARCH:append:libc-musl = " -D_LARGEFILE64_SOURCE"
+
 EXTRA_OEMAKE = "V=1 'EXTRA_PYTHON_CFLAGS=${EXTRA_PYTHON_CFLAGS}' 'EXTRA_PYTHON_LDFLAGS=${EXTRA_PYTHON_LDFLAGS}'"
 
 do_configure:prepend() {
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb
index bf968c920b..9b5762dfdb 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb
@@ -19,6 +19,8 @@ EXTRA_OECONF += " \
     --disable-python \
 "
 
+CFLAGS += "-D_LARGEFILE64_SOURCE"
+
 PACKAGES =+ "alsa-server alsa-conf libatopology"
 
 FILES:alsa-server = "${bindir}/*"
-- 
2.38.1


