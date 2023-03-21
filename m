Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A675DC6FD20
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 22:09:39 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.28493.1679436574545113443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 15:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L1JYKAPB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2361940002;
	Tue, 21 Mar 2023 22:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679436572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M6LIail8+cCjZ8Lrr7iV5o0jlqkZ1gqD1ulsm3FB6+A=;
	b=L1JYKAPBB9/1/6BeYpmVpzYUc08BvNoh6Otrc7cuDWSy0Hhc/Uowk60c12yg0MGOz52e5Q
	qJ6wq3J0f7jN3nIG6TLaiwd9u9FiiDxbNomDCkIbZo5Dh0hIs9KW9H/R6piPFzf3UuMMwN
	H8sr5yVyz1RKR5zkJN0uaobPz9NOvlWY+7vZ2+og4Sd5EmyQpdJh0VtX1jXW4G6eF0IFH6
	OLM49E8qL9WPaNSb19NG5MLVKLj2CkYjE7+bzcswvCG1x07Uw+dE5XMpCrpr77oYVtNqGX
	gdL48BmfjRocXNi87/GqhcO0vl0vF+CQCjo7wPj8R6RHRGudkKq9JKq7Z1/Ivg==
Date: Tue, 21 Mar 2023 23:09:31 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: yuka@yuka.dev
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] systemd: rebase musl patches
Message-ID: <20230321220931bdb5b81e@mail.local>
References: <20230321074625.4086921-1-yuka@yuka.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230321074625.4086921-1-yuka@yuka.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 22:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178901

Hello,

The question is why is this necessary, I don't think there is any fuzz
when applying those patches?

On 21/03/2023 08:46:25+0100, Yureka via lists.openembedded.org wrote:
> Signed-off-by: Yureka Lilian <yuka@yuka.dev>
> ---
>  meta/recipes-core/systemd/systemd.inc         |   4 +-
>  .../0001-Adjust-for-musl-headers.patch        |  82 ++++++++-
>  ...all-dependency-links-at-install-tim.patch} |  14 +-
>  ...til-Make-STRERROR-portable-for-musl.patch} |   4 +-
>  ...ysctl.d-binfmt.d-modules-load.d-to-.patch} |   8 +-
>  ...ss-correct-parameters-to-getdents64.patch} |  10 +-
>  ...rerror-is-assumed-to-be-GNU-specifi.patch} |  20 ++-
>  ... => 0007-Add-sys-stat.h-for-S_IFDIR.patch} |   8 +-
>  ...mplment-systemd-sysv-install-for-OE.patch} |   8 +-
>  ...-missing_type.h-add-comparison_fn_t.patch} |   8 +-
>  ...-parse_printf_format-implementation.patch} |  31 +++-
>  ...issing.h-check-for-missing-strndupa.patch} | 169 ++++++++++++++----
>  ...B_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} |  22 ++-
>  ...13-add-missing-FTW_-macros-for-musl.patch} |   6 +-
>  ...4-Use-uintmax_t-for-handling-rlim_t.patch} |  20 ++-
>  ...able-tests-for-missing-typedefs-in-.patch} |   8 +-
>  ..._SYMLINK_NOFOLLOW-flag-to-faccessat.patch} |  18 +-
>  ...atible-basename-for-non-glibc-syste.patch} |   8 +-
>  ...ffering-when-writing-to-oom_score_a.patch} |  10 +-
>  ...ompliant-strerror_r-from-GNU-specif.patch} |  22 ++-
>  ...efinition-of-prctl_mm_map-structure.patch} |   6 +-
>  ...not-disable-buffer-in-writing-files.patch} | 139 ++++++++------
>  ...tch => 0022-Handle-__cpu_mask-usage.patch} |   8 +-
>  ...atch => 0023-Handle-missing-gshadow.patch} |  20 ++-
>  ....h-Define-MIPS-ABI-defines-for-musl.patch} |  10 +-
>  ...itly-cast-the-constants-to-uint64_t.patch} |   7 +-
>  ...string.c-define-wchar_t-from-__WCHA.patch} |  11 +-
>  meta/recipes-core/systemd/systemd_253.1.bb    |  46 ++---
>  28 files changed, 513 insertions(+), 214 deletions(-)
>  rename meta/recipes-core/systemd/systemd/{0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch => 0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch} (93%)
>  rename meta/recipes-core/systemd/systemd/{0001-errno-util-Make-STRERROR-portable-for-musl.patch => 0003-errno-util-Make-STRERROR-portable-for-musl.patch} (95%)
>  rename meta/recipes-core/systemd/systemd/{0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch => 0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch} (95%)
>  rename meta/recipes-core/systemd/systemd/{0001-pass-correct-parameters-to-getdents64.patch => 0005-pass-correct-parameters-to-getdents64.patch} (91%)
>  rename meta/recipes-core/systemd/systemd/{0001-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch => 0006-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch} (69%)
>  rename meta/recipes-core/systemd/systemd/{0002-Add-sys-stat.h-for-S_IFDIR.patch => 0007-Add-sys-stat.h-for-S_IFDIR.patch} (80%)
>  rename meta/recipes-core/systemd/systemd/{0003-implment-systemd-sysv-install-for-OE.patch => 0008-implment-systemd-sysv-install-for-OE.patch} (92%)
>  rename meta/recipes-core/systemd/systemd/{0003-missing_type.h-add-comparison_fn_t.patch => 0009-missing_type.h-add-comparison_fn_t.patch} (92%)
>  rename meta/recipes-core/systemd/systemd/{0004-add-fallback-parse_printf_format-implementation.patch => 0010-add-fallback-parse_printf_format-implementation.patch} (93%)
>  rename meta/recipes-core/systemd/systemd/{0005-src-basic-missing.h-check-for-missing-strndupa.patch => 0011-src-basic-missing.h-check-for-missing-strndupa.patch} (72%)
>  rename meta/recipes-core/systemd/systemd/{0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch => 0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} (87%)
>  rename meta/recipes-core/systemd/systemd/{0008-add-missing-FTW_-macros-for-musl.patch => 0013-add-missing-FTW_-macros-for-musl.patch} (93%)
>  rename meta/recipes-core/systemd/systemd/{0010-Use-uintmax_t-for-handling-rlim_t.patch => 0014-Use-uintmax_t-for-handling-rlim_t.patch} (85%)
>  rename meta/recipes-core/systemd/systemd/{0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch => 0015-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch} (89%)
>  rename meta/recipes-core/systemd/systemd/{0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch => 0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} (87%)
>  rename meta/recipes-core/systemd/systemd/{0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch => 0017-Define-glibc-compatible-basename-for-non-glibc-syste.patch} (81%)
>  rename meta/recipes-core/systemd/systemd/{0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch => 0018-Do-not-disable-buffering-when-writing-to-oom_score_a.patch} (83%)
>  rename meta/recipes-core/systemd/systemd/{0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch => 0019-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch} (70%)
>  rename meta/recipes-core/systemd/systemd/{0018-avoid-redefinition-of-prctl_mm_map-structure.patch => 0020-avoid-redefinition-of-prctl_mm_map-structure.patch} (91%)
>  rename meta/recipes-core/systemd/systemd/{0022-do-not-disable-buffer-in-writing-files.patch => 0021-do-not-disable-buffer-in-writing-files.patch} (78%)
>  rename meta/recipes-core/systemd/systemd/{0025-Handle-__cpu_mask-usage.patch => 0022-Handle-__cpu_mask-usage.patch} (94%)
>  rename meta/recipes-core/systemd/systemd/{0026-Handle-missing-gshadow.patch => 0023-Handle-missing-gshadow.patch} (85%)
>  rename meta/recipes-core/systemd/systemd/{0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch => 0024-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch} (89%)
>  rename meta/recipes-core/systemd/systemd/{fix-32bit.patch => 0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch} (93%)
>  rename meta/recipes-core/systemd/systemd/{0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch => 0026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch} (82%)
> 
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> index 354cc46e90..14608f9abc 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -17,8 +17,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>  SRCREV = "6c327d74aa0d350482e82a247d7018559699798d"
>  SRCBRANCH = "v253-stable"
>  SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
> -           file://0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch \
> -           file://fix-32bit.patch \
> +           file://0026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch \
> +           file://0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch \
>             "
>  
>  S = "${WORKDIR}/git"
> diff --git a/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch b/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch
> index 6496280dda..5e9646c569 100644
> --- a/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch
> +++ b/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.patch
> @@ -1,4 +1,4 @@
> -From 9a1841402ce3ef21a10a7314a07a615f8196d406 Mon Sep 17 00:00:00 2001
> +From e5f067cb3dc845dd865e450f4e64077b28feb4c0 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 21 Jan 2022 22:19:37 -0800
>  Subject: [PATCH] Adjust for musl headers
> @@ -6,7 +6,6 @@ Subject: [PATCH] Adjust for musl headers
>  Upstream-Status: Inappropriate [musl specific]
>  
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
>  ---
>   src/libsystemd-network/sd-dhcp6-client.c      | 2 +-
>   src/network/netdev/bareudp.c                  | 2 +-
> @@ -47,6 +46,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   src/udev/udev-builtin-net_id.c                | 2 +-
>   37 files changed, 44 insertions(+), 42 deletions(-)
>  
> +diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-network/sd-dhcp6-client.c
> +index 57dd91f81f..2b7f4fa3a7 100644
>  --- a/src/libsystemd-network/sd-dhcp6-client.c
>  +++ b/src/libsystemd-network/sd-dhcp6-client.c
>  @@ -5,7 +5,7 @@
> @@ -58,6 +59,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   #include <linux/if_infiniband.h>
>   
>   #include "sd-dhcp6-client.h"
> +diff --git a/src/network/netdev/bareudp.c b/src/network/netdev/bareudp.c
> +index 24d3afb877..f6241b41ee 100644
>  --- a/src/network/netdev/bareudp.c
>  +++ b/src/network/netdev/bareudp.c
>  @@ -2,7 +2,7 @@
> @@ -69,6 +72,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "bareudp.h"
>   #include "netlink-util.h"
> +diff --git a/src/network/netdev/batadv.c b/src/network/netdev/batadv.c
> +index 7e97619657..50fcffcfdf 100644
>  --- a/src/network/netdev/batadv.c
>  +++ b/src/network/netdev/batadv.c
>  @@ -3,7 +3,7 @@
> @@ -80,6 +85,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "batadv.h"
>   #include "fileio.h"
> +diff --git a/src/network/netdev/bond.c b/src/network/netdev/bond.c
> +index 601bff0a9c..dfed8d9e54 100644
>  --- a/src/network/netdev/bond.c
>  +++ b/src/network/netdev/bond.c
>  @@ -1,7 +1,7 @@
> @@ -91,6 +98,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "alloc-util.h"
>   #include "bond.h"
> +diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge.c
> +index b65c3b49fc..6875b4fbdb 100644
>  --- a/src/network/netdev/bridge.c
>  +++ b/src/network/netdev/bridge.c
>  @@ -2,7 +2,7 @@
> @@ -102,6 +111,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   #include <linux/if_bridge.h>
>   
>   #include "bridge.h"
> +diff --git a/src/network/netdev/dummy.c b/src/network/netdev/dummy.c
> +index 00df1d2787..77b506b422 100644
>  --- a/src/network/netdev/dummy.c
>  +++ b/src/network/netdev/dummy.c
>  @@ -1,6 +1,6 @@
> @@ -112,6 +123,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "dummy.h"
>   
> +diff --git a/src/network/netdev/geneve.c b/src/network/netdev/geneve.c
> +index 777a32d75c..73bfa2b5c1 100644
>  --- a/src/network/netdev/geneve.c
>  +++ b/src/network/netdev/geneve.c
>  @@ -2,7 +2,7 @@
> @@ -123,6 +136,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "alloc-util.h"
>   #include "conf-parser.h"
> +diff --git a/src/network/netdev/ifb.c b/src/network/netdev/ifb.c
> +index d7ff44cb9e..e037629ae4 100644
>  --- a/src/network/netdev/ifb.c
>  +++ b/src/network/netdev/ifb.c
>  @@ -1,7 +1,7 @@
> @@ -134,6 +149,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "ifb.h"
>   
> +diff --git a/src/network/netdev/ipoib.c b/src/network/netdev/ipoib.c
> +index 5dd9286d57..4036d66dad 100644
>  --- a/src/network/netdev/ipoib.c
>  +++ b/src/network/netdev/ipoib.c
>  @@ -1,6 +1,6 @@
> @@ -144,6 +161,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   #include <linux/if_link.h>
>   
>   #include "ipoib.h"
> +diff --git a/src/network/netdev/ipvlan.c b/src/network/netdev/ipvlan.c
> +index 058eadebd7..c470ebb6d7 100644
>  --- a/src/network/netdev/ipvlan.c
>  +++ b/src/network/netdev/ipvlan.c
>  @@ -2,7 +2,7 @@
> @@ -155,6 +174,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "conf-parser.h"
>   #include "ipvlan.h"
> +diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
> +index 0da3dd4bd2..eb20f04469 100644
>  --- a/src/network/netdev/macsec.c
>  +++ b/src/network/netdev/macsec.c
>  @@ -1,7 +1,7 @@
> @@ -166,6 +187,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   #include <linux/if_ether.h>
>   #include <linux/if_macsec.h>
>   #include <linux/genetlink.h>
> +diff --git a/src/network/netdev/macvlan.c b/src/network/netdev/macvlan.c
> +index 1114bb0cb1..6c79a219a4 100644
>  --- a/src/network/netdev/macvlan.c
>  +++ b/src/network/netdev/macvlan.c
>  @@ -2,7 +2,7 @@
> @@ -177,6 +200,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "conf-parser.h"
>   #include "macvlan.h"
> +diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
> +index 038a27c118..67155f0db7 100644
>  --- a/src/network/netdev/netdev.c
>  +++ b/src/network/netdev/netdev.c
>  @@ -2,7 +2,7 @@
> @@ -188,6 +213,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   #include <unistd.h>
>   
>   #include "alloc-util.h"
> +diff --git a/src/network/netdev/netdevsim.c b/src/network/netdev/netdevsim.c
> +index 15d5c132f9..a3ffa48b15 100644
>  --- a/src/network/netdev/netdevsim.c
>  +++ b/src/network/netdev/netdevsim.c
>  @@ -1,6 +1,6 @@
> @@ -198,6 +225,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "netdevsim.h"
>   
> +diff --git a/src/network/netdev/nlmon.c b/src/network/netdev/nlmon.c
> +index ff372092e6..eef66811f4 100644
>  --- a/src/network/netdev/nlmon.c
>  +++ b/src/network/netdev/nlmon.c
>  @@ -1,6 +1,6 @@
> @@ -208,6 +237,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "nlmon.h"
>   
> +diff --git a/src/network/netdev/tunnel.c b/src/network/netdev/tunnel.c
> +index 2addfeecaa..954987f26d 100644
>  --- a/src/network/netdev/tunnel.c
>  +++ b/src/network/netdev/tunnel.c
>  @@ -2,7 +2,7 @@
> @@ -219,6 +250,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   #include <linux/if_tunnel.h>
>   #include <linux/ip.h>
>   #include <linux/ip6_tunnel.h>
> +diff --git a/src/network/netdev/vcan.c b/src/network/netdev/vcan.c
> +index 380547ee1e..137c1adf8a 100644
>  --- a/src/network/netdev/vcan.c
>  +++ b/src/network/netdev/vcan.c
>  @@ -1,6 +1,6 @@
> @@ -229,6 +262,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "vcan.h"
>   
> +diff --git a/src/network/netdev/veth.c b/src/network/netdev/veth.c
> +index fb00e6667f..f52d9ee89a 100644
>  --- a/src/network/netdev/veth.c
>  +++ b/src/network/netdev/veth.c
>  @@ -3,7 +3,7 @@
> @@ -240,6 +275,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   #include <linux/veth.h>
>   
>   #include "netlink-util.h"
> +diff --git a/src/network/netdev/vlan.c b/src/network/netdev/vlan.c
> +index a3d961dac3..386b567a42 100644
>  --- a/src/network/netdev/vlan.c
>  +++ b/src/network/netdev/vlan.c
>  @@ -2,7 +2,7 @@
> @@ -251,6 +288,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   #include <linux/if_vlan.h>
>   
>   #include "parse-util.h"
> +diff --git a/src/network/netdev/vrf.c b/src/network/netdev/vrf.c
> +index 05ef3ff13d..825fc4a398 100644
>  --- a/src/network/netdev/vrf.c
>  +++ b/src/network/netdev/vrf.c
>  @@ -2,7 +2,7 @@
> @@ -262,6 +301,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "vrf.h"
>   
> +diff --git a/src/network/netdev/vxcan.c b/src/network/netdev/vxcan.c
> +index 83269b0707..39c6dbe29c 100644
>  --- a/src/network/netdev/vxcan.c
>  +++ b/src/network/netdev/vxcan.c
>  @@ -1,7 +1,7 @@
> @@ -273,6 +314,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "vxcan.h"
>   
> +diff --git a/src/network/netdev/vxlan.c b/src/network/netdev/vxlan.c
> +index 589161938a..0ec9625b7a 100644
>  --- a/src/network/netdev/vxlan.c
>  +++ b/src/network/netdev/vxlan.c
>  @@ -2,7 +2,7 @@
> @@ -284,6 +327,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "conf-parser.h"
>   #include "alloc-util.h"
> +diff --git a/src/network/netdev/wireguard.c b/src/network/netdev/wireguard.c
> +index 51e7e02990..fc36c0623a 100644
>  --- a/src/network/netdev/wireguard.c
>  +++ b/src/network/netdev/wireguard.c
>  @@ -6,7 +6,7 @@
> @@ -295,6 +340,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   #include <linux/ipv6_route.h>
>   
>   #include "sd-resolve.h"
> +diff --git a/src/network/netdev/xfrm.c b/src/network/netdev/xfrm.c
> +index a961d8fef2..6c1815b257 100644
>  --- a/src/network/netdev/xfrm.c
>  +++ b/src/network/netdev/xfrm.c
>  @@ -1,6 +1,6 @@
> @@ -305,6 +352,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "missing_network.h"
>   #include "xfrm.h"
> +diff --git a/src/network/networkd-bridge-mdb.c b/src/network/networkd-bridge-mdb.c
> +index bd1a9745dc..949d3da029 100644
>  --- a/src/network/networkd-bridge-mdb.c
>  +++ b/src/network/networkd-bridge-mdb.c
>  @@ -1,7 +1,5 @@
> @@ -324,6 +373,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #define STATIC_BRIDGE_MDB_ENTRIES_PER_NETWORK_MAX 1024U
>   
> +diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-dhcp-common.c
> +index ca9a825e7b..8735e261ad 100644
>  --- a/src/network/networkd-dhcp-common.c
>  +++ b/src/network/networkd-dhcp-common.c
>  @@ -1,7 +1,8 @@
> @@ -336,6 +387,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "bus-error.h"
>   #include "bus-locator.h"
> +diff --git a/src/network/networkd-dhcp-prefix-delegation.c b/src/network/networkd-dhcp-prefix-delegation.c
> +index 66c5e979d9..581b6b8c29 100644
>  --- a/src/network/networkd-dhcp-prefix-delegation.c
>  +++ b/src/network/networkd-dhcp-prefix-delegation.c
>  @@ -1,7 +1,5 @@
> @@ -355,6 +408,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   bool link_dhcp_pd_is_enabled(Link *link) {
>           assert(link);
>   
> +diff --git a/src/network/networkd-dhcp-server.c b/src/network/networkd-dhcp-server.c
> +index 620fbbddc7..c8af20fb34 100644
>  --- a/src/network/networkd-dhcp-server.c
>  +++ b/src/network/networkd-dhcp-server.c
>  @@ -1,7 +1,7 @@
> @@ -366,6 +421,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   #include <linux/if.h>
>   
>   #include "sd-dhcp-server.h"
> +diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
> +index d4b4942173..3d78da5609 100644
>  --- a/src/network/networkd-dhcp4.c
>  +++ b/src/network/networkd-dhcp4.c
>  @@ -3,7 +3,7 @@
> @@ -377,6 +434,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "alloc-util.h"
>   #include "dhcp-client-internal.h"
> +diff --git a/src/network/networkd-ipv6ll.c b/src/network/networkd-ipv6ll.c
> +index 32229a3fc7..662a345d6e 100644
>  --- a/src/network/networkd-ipv6ll.c
>  +++ b/src/network/networkd-ipv6ll.c
>  @@ -1,7 +1,7 @@
> @@ -388,6 +447,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "in-addr-util.h"
>   #include "networkd-address.h"
> +diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
> +index 019bef0590..657fc41ae6 100644
>  --- a/src/network/networkd-link.c
>  +++ b/src/network/networkd-link.c
>  @@ -3,7 +3,7 @@
> @@ -399,6 +460,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   #include <linux/if_link.h>
>   #include <linux/netdevice.h>
>   #include <sys/socket.h>
> +diff --git a/src/network/networkd-ndisc.c b/src/network/networkd-ndisc.c
> +index 99a07e16fc..e51cd81d96 100644
>  --- a/src/network/networkd-ndisc.c
>  +++ b/src/network/networkd-ndisc.c
>  @@ -6,7 +6,7 @@
> @@ -410,6 +473,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "sd-ndisc.h"
>   
> +diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
> +index 5214a8ad2c..9dd758daae 100644
>  --- a/src/network/networkd-route.c
>  +++ b/src/network/networkd-route.c
>  @@ -1,9 +1,5 @@
> @@ -433,6 +498,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   int route_new(Route **ret) {
>           _cleanup_(route_freep) Route *route = NULL;
>   
> +diff --git a/src/network/networkd-setlink.c b/src/network/networkd-setlink.c
> +index 541c4b8a72..06ebda8f0f 100644
>  --- a/src/network/networkd-setlink.c
>  +++ b/src/network/networkd-setlink.c
>  @@ -2,7 +2,7 @@
> @@ -444,6 +511,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   #include <linux/if_bridge.h>
>   
>   #include "missing_network.h"
> +diff --git a/src/shared/linux/ethtool.h b/src/shared/linux/ethtool.h
> +index 1458de3627..d5c2d2e0ac 100644
>  --- a/src/shared/linux/ethtool.h
>  +++ b/src/shared/linux/ethtool.h
>  @@ -16,7 +16,8 @@
> @@ -454,8 +523,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  +#include <netinet/if_ether.h>
>  +//#include <linux/if_ether.h>
>   
> - #ifndef __KERNEL__
>   #include <limits.h> /* for INT_MAX */
> + 
> +diff --git a/src/shared/netif-util.c b/src/shared/netif-util.c
> +index f56c5646c1..5af28ff119 100644
>  --- a/src/shared/netif-util.c
>  +++ b/src/shared/netif-util.c
>  @@ -1,7 +1,7 @@
> @@ -467,6 +538,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   #include "arphrd-util.h"
>   #include "device-util.h"
> +diff --git a/src/udev/udev-builtin-net_id.c b/src/udev/udev-builtin-net_id.c
> +index a48d5dedf8..31a8bc1b3c 100644
>  --- a/src/udev/udev-builtin-net_id.c
>  +++ b/src/udev/udev-builtin-net_id.c
>  @@ -18,7 +18,7 @@
> @@ -478,3 +551,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   #include <linux/netdevice.h>
>   #include <linux/pci_regs.h>
>   
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> similarity index 93%
> rename from meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> rename to meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> index 2a033b134e..43611e65fb 100644
> --- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> +++ b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> @@ -1,4 +1,4 @@
> -From f9974d7dc289551bfbf823b716fd32b43c54e465 Mon Sep 17 00:00:00 2001
> +From ca7d9a8d9c81702af9c599bb79706f12b1a465cf Mon Sep 17 00:00:00 2001
>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Thu, 21 Feb 2019 16:23:24 +0800
>  Subject: [PATCH] binfmt: Don't install dependency links at install time for
> @@ -18,7 +18,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  [rebased for systemd 243]
>  Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> -
>  ---
>   units/meson.build                       | 6 ++----
>   units/proc-sys-fs-binfmt_misc.automount | 3 +++
> @@ -26,7 +25,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>   3 files changed, 9 insertions(+), 4 deletions(-)
>  
>  diff --git a/units/meson.build b/units/meson.build
> -index a9bf28f6d9..11d3644168 100644
> +index c7939a10f8..219570ab19 100644
>  --- a/units/meson.build
>  +++ b/units/meson.build
>  @@ -62,8 +62,7 @@ units = [
> @@ -39,7 +38,7 @@ index a9bf28f6d9..11d3644168 100644
>           ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
>           ['reboot.target',                       '',
>            'ctrl-alt-del.target' + (with_runlevels ? ' runlevel6.target' : '')],
> -@@ -186,8 +185,7 @@ in_units = [
> +@@ -185,8 +184,7 @@ in_units = [
>           ['rescue.service',                       ''],
>           ['serial-getty@.service',                ''],
>           ['systemd-backlight@.service',           'ENABLE_BACKLIGHT'],
> @@ -50,7 +49,7 @@ index a9bf28f6d9..11d3644168 100644
>           ['systemd-boot-check-no-failures.service', ''],
>           ['systemd-coredump@.service',            'ENABLE_COREDUMP'],
>  diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
> -index 172c8757ab..f65d8930c6 100644
> +index 6b1bbdc91e..5ec5b8670a 100644
>  --- a/units/proc-sys-fs-binfmt_misc.automount
>  +++ b/units/proc-sys-fs-binfmt_misc.automount
>  @@ -19,3 +19,6 @@ ConditionPathIsReadWrite=/proc/sys/
> @@ -61,7 +60,7 @@ index 172c8757ab..f65d8930c6 100644
>  +[Install]
>  +WantedBy=sysinit.target
>  diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
> -index 96f595ad72..7c010bb224 100644
> +index b04412e037..63f116e4fa 100644
>  --- a/units/systemd-binfmt.service.in
>  +++ b/units/systemd-binfmt.service.in
>  @@ -14,6 +14,7 @@ Documentation=https://docs.kernel.org/admin-guide/binfmt-misc.html
> @@ -79,3 +78,6 @@ index 96f595ad72..7c010bb224 100644
>  +
>  +[Install]
>  +WantedBy=sysinit.target
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0001-errno-util-Make-STRERROR-portable-for-musl.patch b/meta/recipes-core/systemd/systemd/0003-errno-util-Make-STRERROR-portable-for-musl.patch
> similarity index 95%
> rename from meta/recipes-core/systemd/systemd/0001-errno-util-Make-STRERROR-portable-for-musl.patch
> rename to meta/recipes-core/systemd/systemd/0003-errno-util-Make-STRERROR-portable-for-musl.patch
> index 2fb8985ad1..e9e69cb648 100644
> --- a/meta/recipes-core/systemd/systemd/0001-errno-util-Make-STRERROR-portable-for-musl.patch
> +++ b/meta/recipes-core/systemd/systemd/0003-errno-util-Make-STRERROR-portable-for-musl.patch
> @@ -1,4 +1,4 @@
> -From f66b5c802ce0a3310f5580cfc1b02446f8087568 Mon Sep 17 00:00:00 2001
> +From f629a76e0fba300a9d511614160fee38dd4a5e57 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 23 Jan 2023 23:39:46 -0800
>  Subject: [PATCH] errno-util: Make STRERROR portable for musl
> @@ -38,5 +38,5 @@ index 091f99c590..eb5c1f9961 100644
>    * Note that we can't use ({ … }) to define a temporary variable, so errnum is
>    * evaluated twice. */
>  -- 
> -2.39.1
> +2.39.2
>  
> diff --git a/meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch b/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
> similarity index 95%
> rename from meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
> rename to meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
> index 0fb6efb469..aa1f3c2e82 100644
> --- a/meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
> +++ b/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
> @@ -1,4 +1,4 @@
> -From 258af8106cbed6fa53f7bee042bf903e58b57a41 Mon Sep 17 00:00:00 2001
> +From f75f03ef6bc3554068e456bed227f333d5cb8c34 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Tue, 29 Sep 2020 18:01:41 -0700
>  Subject: [PATCH] Move sysusers.d/sysctl.d/binfmt.d/modules-load.d to /usr
> @@ -10,7 +10,6 @@ the old /usr/lib is still being used.
>  Upstream-Status: Inappropriate (OE-specific)
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> -
>  ---
>   src/core/systemd.pc.in           | 8 ++++----
>   src/libsystemd/sd-path/sd-path.c | 8 ++++----
> @@ -42,7 +41,7 @@ index 693433b34b..8368a3ff02 100644
>   
>   catalog_dir=${prefix}/lib/systemd/catalog
>  diff --git a/src/libsystemd/sd-path/sd-path.c b/src/libsystemd/sd-path/sd-path.c
> -index ac33e349c0..f0615ffb22 100644
> +index 1af3a36d1d..def502b717 100644
>  --- a/src/libsystemd/sd-path/sd-path.c
>  +++ b/src/libsystemd/sd-path/sd-path.c
>  @@ -362,19 +362,19 @@ static int get_path(uint64_t type, char **buffer, const char **ret) {
> @@ -69,3 +68,6 @@ index ac33e349c0..f0615ffb22 100644
>                   return 0;
>   
>           case SD_PATH_CATALOG:
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0005-pass-correct-parameters-to-getdents64.patch
> similarity index 91%
> rename from meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
> rename to meta/recipes-core/systemd/systemd/0005-pass-correct-parameters-to-getdents64.patch
> index 144314c409..c634d8ec3d 100644
> --- a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
> +++ b/meta/recipes-core/systemd/systemd/0005-pass-correct-parameters-to-getdents64.patch
> @@ -1,4 +1,4 @@
> -From dab02796780f00d689cc1c7a0ba81abe7c5f28d0 Mon Sep 17 00:00:00 2001
> +From 17766c64ecc7dedf09ed2d361690fc4eda77bf42 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 21 Jan 2022 15:15:11 -0800
>  Subject: [PATCH] pass correct parameters to getdents64
> @@ -15,16 +15,15 @@ Fixes
>  Upstream-Status: Inappropriate [musl specific]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> -
>  ---
>   src/basic/recurse-dir.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/src/basic/recurse-dir.c b/src/basic/recurse-dir.c
> -index efa1797b7b..03ff10ebe9 100644
> +index 5e98b7a5d8..aef065047b 100644
>  --- a/src/basic/recurse-dir.c
>  +++ b/src/basic/recurse-dir.c
> -@@ -54,7 +54,7 @@ int readdir_all(int dir_fd,
> +@@ -55,7 +55,7 @@ int readdir_all(int dir_fd,
>                   bs = MIN(MALLOC_SIZEOF_SAFE(de) - offsetof(DirectoryEntries, buffer), (size_t) SSIZE_MAX);
>                   assert(bs > de->buffer_size);
>   
> @@ -33,3 +32,6 @@ index efa1797b7b..03ff10ebe9 100644
>                   if (n < 0)
>                           return -errno;
>                   if (n == 0)
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0001-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch b/meta/recipes-core/systemd/systemd/0006-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
> similarity index 69%
> rename from meta/recipes-core/systemd/systemd/0001-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
> rename to meta/recipes-core/systemd/systemd/0006-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
> index c02d495d31..96322e5a56 100644
> --- a/meta/recipes-core/systemd/systemd/0001-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
> +++ b/meta/recipes-core/systemd/systemd/0006-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
> @@ -1,15 +1,19 @@
> -From 5b5675913e2dbe6c5acda935b5814a8991829ec5 Mon Sep 17 00:00:00 2001
> +From fa598869cca684c001f3dc23ce2198f5a6169e2a Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Tue, 8 Nov 2022 13:31:34 -0800
> -Subject: [PATCH 2/2] test-bus-error: strerror() is assumed to be GNU specific version mark it so
> +Subject: [PATCH] test-bus-error: strerror() is assumed to be GNU specific
> + version mark it so
>  
>  Upstream-Status: Inappropriate [Upstream systemd only supports glibc]
>  
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
>   src/libsystemd/sd-bus/test-bus-error.c | 2 ++
> - 1 file changed, 2 insertions(+)
> + src/test/test-errno-util.c             | 3 ++-
> + 2 files changed, 4 insertions(+), 1 deletion(-)
>  
> +diff --git a/src/libsystemd/sd-bus/test-bus-error.c b/src/libsystemd/sd-bus/test-bus-error.c
> +index a55f3f9856..4123bf3da0 100644
>  --- a/src/libsystemd/sd-bus/test-bus-error.c
>  +++ b/src/libsystemd/sd-bus/test-bus-error.c
>  @@ -99,7 +99,9 @@ TEST(error) {
> @@ -22,6 +26,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>           assert_se(sd_bus_error_has_name(&error, "System.Error.EBUSY"));
>           assert_se(sd_bus_error_get_errno(&error) == EBUSY);
>           assert_se(sd_bus_error_is_set(&error));
> +diff --git a/src/test/test-errno-util.c b/src/test/test-errno-util.c
> +index d3d022c33f..74e95c804d 100644
>  --- a/src/test/test-errno-util.c
>  +++ b/src/test/test-errno-util.c
>  @@ -4,7 +4,7 @@
> @@ -33,10 +39,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   TEST(strerror_not_threadsafe) {
>           /* Just check that strerror really is not thread-safe. */
>           log_info("strerror(%d) → %s", 200, strerror(200));
> -@@ -46,5 +46,6 @@ TEST(STRERROR_OR_ELSE) {
> +@@ -46,6 +46,7 @@ TEST(STRERROR_OR_ELSE) {
>           log_info("STRERROR_OR_ELSE(EPERM, \"EOF\") → %s", STRERROR_OR_EOF(EPERM));
>           log_info("STRERROR_OR_ELSE(-EPERM, \"EOF\") → %s", STRERROR_OR_EOF(-EPERM));
>   }
>  +#endif /* __GLIBC__ */
>   
> - DEFINE_TEST_MAIN(LOG_INFO);
> + TEST(PROTECT_ERRNO) {
> +         errno = 12;
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch b/meta/recipes-core/systemd/systemd/0007-Add-sys-stat.h-for-S_IFDIR.patch
> similarity index 80%
> rename from meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
> rename to meta/recipes-core/systemd/systemd/0007-Add-sys-stat.h-for-S_IFDIR.patch
> index e6abaadfcb..479b9a1ca1 100644
> --- a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.patch
> +++ b/meta/recipes-core/systemd/systemd/0007-Add-sys-stat.h-for-S_IFDIR.patch
> @@ -1,4 +1,4 @@
> -From 4b731a5e2547b5292f9a774b849e14c0cf7b3955 Mon Sep 17 00:00:00 2001
> +From 1480ef4ea9f71befbc22272c219b62ee5cd71d43 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 21 Jan 2022 15:17:37 -0800
>  Subject: [PATCH] Add sys/stat.h for S_IFDIR
> @@ -8,11 +8,12 @@ Subject: [PATCH] Add sys/stat.h for S_IFDIR
>  
>  Upstream-Status: Backport [29b7114c5d9624002aa7c17748d960cd1e45362d]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
>  ---
>   src/shared/mkdir-label.c | 1 +
>   1 file changed, 1 insertion(+)
>  
> +diff --git a/src/shared/mkdir-label.c b/src/shared/mkdir-label.c
> +index e3afc2b666..f1df778966 100644
>  --- a/src/shared/mkdir-label.c
>  +++ b/src/shared/mkdir-label.c
>  @@ -7,6 +7,7 @@
> @@ -23,3 +24,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   
>   int mkdirat_label(int dirfd, const char *path, mode_t mode) {
>           int r;
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-install-for-OE.patch
> similarity index 92%
> rename from meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch
> rename to meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-install-for-OE.patch
> index 4556ab5da6..acff18dc43 100644
> --- a/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch
> +++ b/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-install-for-OE.patch
> @@ -1,4 +1,4 @@
> -From f9078501a1495c9991431d1435d081cd2e830328 Mon Sep 17 00:00:00 2001
> +From 5712d56f1cd654d2e5d2e9117ff77fe4c299f76b Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 5 Sep 2015 06:31:47 +0000
>  Subject: [PATCH] implment systemd-sysv-install for OE
> @@ -9,13 +9,12 @@ to check the status of the sysv service
>  Upstream-Status: Inappropriate [OE-Specific]
>  
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
>  ---
>   src/systemctl/systemd-sysv-install.SKELETON | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>  
>  diff --git a/src/systemctl/systemd-sysv-install.SKELETON b/src/systemctl/systemd-sysv-install.SKELETON
> -index a2a0059fef..7f95791d9b 100755
> +index cb58d8243b..000bdf6165 100755
>  --- a/src/systemctl/systemd-sysv-install.SKELETON
>  +++ b/src/systemctl/systemd-sysv-install.SKELETON
>  @@ -34,17 +34,17 @@ case "$1" in
> @@ -39,3 +38,6 @@ index a2a0059fef..7f95791d9b 100755
>           ;;
>       *)
>           usage ;;
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-comparison_fn_t.patch b/meta/recipes-core/systemd/systemd/0009-missing_type.h-add-comparison_fn_t.patch
> similarity index 92%
> rename from meta/recipes-core/systemd/systemd/0003-missing_type.h-add-comparison_fn_t.patch
> rename to meta/recipes-core/systemd/systemd/0009-missing_type.h-add-comparison_fn_t.patch
> index c28c8381e8..e50b47a5a0 100644
> --- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-comparison_fn_t.patch
> +++ b/meta/recipes-core/systemd/systemd/0009-missing_type.h-add-comparison_fn_t.patch
> @@ -1,4 +1,4 @@
> -From 5513b918d02900a3a78fd0e0300a118b163edfef Mon Sep 17 00:00:00 2001
> +From 542f999a846dfd49d9373d30fffb2a44168d7b5e Mon Sep 17 00:00:00 2001
>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Mon, 25 Feb 2019 13:55:12 +0800
>  Subject: [PATCH] missing_type.h: add comparison_fn_t
> @@ -33,7 +33,7 @@ index f6233090a9..6c0456349d 100644
>  +typedef int (*comparison_fn_t)(const void *, const void *);
>  +#endif
>  diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
> -index 02a6784d99..0b33c83d59 100644
> +index f0bf246aa3..33669c7a75 100644
>  --- a/src/basic/sort-util.h
>  +++ b/src/basic/sort-util.h
>  @@ -4,6 +4,7 @@
> @@ -45,7 +45,7 @@ index 02a6784d99..0b33c83d59 100644
>   /* This is the same as glibc's internal __compar_d_fn_t type. glibc exports a public comparison_fn_t, for the
>    * external type __compar_fn_t, but doesn't do anything similar for __compar_d_fn_t. Let's hence do that
>  diff --git a/src/libsystemd/sd-journal/catalog.c b/src/libsystemd/sd-journal/catalog.c
> -index 8fc87b131a..36a6efdbd8 100644
> +index 7527abf636..f33383e57f 100644
>  --- a/src/libsystemd/sd-journal/catalog.c
>  +++ b/src/libsystemd/sd-journal/catalog.c
>  @@ -28,6 +28,7 @@
> @@ -57,5 +57,5 @@ index 8fc87b131a..36a6efdbd8 100644
>   const char * const catalog_file_dirs[] = {
>           "/usr/local/lib/systemd/catalog/",
>  -- 
> -2.34.1
> +2.39.2
>  
> diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0010-add-fallback-parse_printf_format-implementation.patch
> similarity index 93%
> rename from meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
> rename to meta/recipes-core/systemd/systemd/0010-add-fallback-parse_printf_format-implementation.patch
> index f9c7ced947..6f01721459 100644
> --- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
> +++ b/meta/recipes-core/systemd/systemd/0010-add-fallback-parse_printf_format-implementation.patch
> @@ -1,4 +1,4 @@
> -From 3d9910dcda697b1e361bba49c99050ee0d116742 Mon Sep 17 00:00:00 2001
> +From 383e85e15f16a46aac925aa439b8b60f58b40aa6 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Sat, 22 May 2021 20:26:24 +0200
>  Subject: [PATCH] add fallback parse_printf_format implementation
> @@ -10,7 +10,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  [rebased for systemd 243]
>  Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> -
>  ---
>   meson.build                              |   1 +
>   src/basic/meson.build                    |   5 +
> @@ -22,9 +21,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>   create mode 100644 src/basic/parse-printf-format.c
>   create mode 100644 src/basic/parse-printf-format.h
>  
> +diff --git a/meson.build b/meson.build
> +index bfc86857d6..fb96143c37 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -739,6 +739,7 @@ endif
> +@@ -755,6 +755,7 @@ endif
>   foreach header : ['crypt.h',
>                     'linux/memfd.h',
>                     'linux/vm_sockets.h',
> @@ -32,9 +33,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>                     'sys/auxv.h',
>                     'valgrind/memcheck.h',
>                     'valgrind/valgrind.h',
> +diff --git a/src/basic/meson.build b/src/basic/meson.build
> +index 7aae031d81..1aa9f5006d 100644
>  --- a/src/basic/meson.build
>  +++ b/src/basic/meson.build
> -@@ -337,6 +337,11 @@ endforeach
> +@@ -173,6 +173,11 @@ endforeach
>   
>   basic_sources += generated_gperf_headers
>   
> @@ -46,6 +49,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>   ############################################################
>   
>   arch_list = [
> +diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-format.c
> +new file mode 100644
> +index 0000000000..49437e5445
>  --- /dev/null
>  +++ b/src/basic/parse-printf-format.c
>  @@ -0,0 +1,273 @@
> @@ -322,6 +328,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>  +
>  +        return last;
>  +}
> +diff --git a/src/basic/parse-printf-format.h b/src/basic/parse-printf-format.h
> +new file mode 100644
> +index 0000000000..47be7522d7
>  --- /dev/null
>  +++ b/src/basic/parse-printf-format.h
>  @@ -0,0 +1,57 @@
> @@ -382,9 +391,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>  +size_t parse_printf_format(const char *fmt, size_t n, int *types);
>  +
>  +#endif /* HAVE_PRINTF_H */
> +diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
> +index 4e93ac90c9..f9deb6f662 100644
>  --- a/src/basic/stdio-util.h
>  +++ b/src/basic/stdio-util.h
> -@@ -1,13 +1,13 @@
> +@@ -1,12 +1,12 @@
>   /* SPDX-License-Identifier: LGPL-2.1-or-later */
>   #pragma once
>   
> @@ -394,11 +405,12 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>   #include <sys/types.h>
>   
>   #include "macro.h"
> - #include "memory-util.h"
>  +#include "parse-printf-format.h"
>   
> - #define snprintf_ok(buf, len, fmt, ...)                                 \
> -         ({                                                              \
> + _printf_(3, 4)
> + static inline char *snprintf_ok(char *buf, size_t len, const char *format, ...) {
> +diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/sd-journal/journal-send.c
> +index 3b74d2246e..136ebcb153 100644
>  --- a/src/libsystemd/sd-journal/journal-send.c
>  +++ b/src/libsystemd/sd-journal/journal-send.c
>  @@ -2,7 +2,6 @@
> @@ -417,3 +429,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>   
>   #define SNDBUF_SIZE (8*1024*1024)
>   
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-for-missing-strndupa.patch
> similarity index 72%
> rename from meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
> rename to meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-for-missing-strndupa.patch
> index 2c33033e91..bd5f6a6190 100644
> --- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
> +++ b/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-for-missing-strndupa.patch
> @@ -1,4 +1,4 @@
> -From 106b7bd7186c9d6c1dcd72bd4ca6457d3fa72d0b Mon Sep 17 00:00:00 2001
> +From ee5c8b494a3269edd154a0b799a03b39dba2ceb0 Mon Sep 17 00:00:00 2001
>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Mon, 25 Feb 2019 14:18:21 +0800
>  Subject: [PATCH] src/basic/missing.h: check for missing strndupa
> @@ -49,7 +49,6 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   src/libsystemd/sd-bus/sd-bus.c             |  1 +
>   src/libsystemd/sd-bus/test-bus-benchmark.c |  1 +
>   src/libsystemd/sd-journal/sd-journal.c     |  1 +
> - src/locale/keymap-util.c                   |  1 +
>   src/login/pam_systemd.c                    |  1 +
>   src/network/generator/network-generator.c  |  1 +
>   src/nspawn/nspawn-settings.c               |  1 +
> @@ -64,17 +63,18 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   src/shared/journal-importer.c              |  1 +
>   src/shared/logs-show.c                     |  1 +
>   src/shared/pager.c                         |  1 +
> - src/shared/uid-range.c                     |  1 +
>   src/socket-proxy/socket-proxyd.c           |  1 +
>   src/test/test-hexdecoct.c                  |  1 +
>   src/udev/udev-builtin-path_id.c            |  1 +
>   src/udev/udev-event.c                      |  1 +
>   src/udev/udev-rules.c                      |  1 +
> - 52 files changed, 63 insertions(+)
> + 50 files changed, 61 insertions(+)
>  
> +diff --git a/meson.build b/meson.build
> +index fb96143c37..739b2f7f72 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -557,6 +557,7 @@ foreach ident : ['secure_getenv', '__sec
> +@@ -574,6 +574,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
>   endforeach
>   
>   foreach ident : [
> @@ -82,16 +82,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>           ['memfd_create',      '''#include <sys/mman.h>'''],
>           ['gettid',            '''#include <sys/types.h>
>                                    #include <unistd.h>'''],
> +diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
> +index e66477f328..2613d1e3f9 100644
>  --- a/src/backlight/backlight.c
>  +++ b/src/backlight/backlight.c
> -@@ -20,6 +20,7 @@
> +@@ -19,6 +19,7 @@
> + #include "string-util.h"
>   #include "strv.h"
>   #include "terminal-util.h"
> - #include "util.h"
>  +#include "missing_stdlib.h"
>   
>   #define PCI_CLASS_GRAPHICS_CARD 0x30000
>   
> +diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
> +index feda596939..11b4375ed5 100644
>  --- a/src/basic/cgroup-util.c
>  +++ b/src/basic/cgroup-util.c
>  @@ -37,6 +37,7 @@
> @@ -102,6 +106,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   static int cg_enumerate_items(const char *controller, const char *path, FILE **_f, const char *item) {
>           _cleanup_free_ char *fs = NULL;
> +diff --git a/src/basic/env-util.c b/src/basic/env-util.c
> +index 55ac11a512..7ccb1d7887 100644
>  --- a/src/basic/env-util.c
>  +++ b/src/basic/env-util.c
>  @@ -19,6 +19,7 @@
> @@ -112,16 +118,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   /* We follow bash for the character set. Different shells have different rules. */
>   #define VALID_BASH_ENV_NAME_CHARS               \
> +diff --git a/src/basic/log.c b/src/basic/log.c
> +index fc5793139e..515218fca8 100644
>  --- a/src/basic/log.c
>  +++ b/src/basic/log.c
> -@@ -36,6 +36,7 @@
> +@@ -39,6 +39,7 @@
>   #include "terminal-util.h"
>   #include "time-util.h"
>   #include "utf8.h"
>  +#include "missing_stdlib.h"
>   
>   #define SNDBUF_SIZE (8*1024*1024)
> - 
> + #define IOVEC_MAX 128U
> +diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
> +index 8c76f93eb2..9068bfb4f0 100644
>  --- a/src/basic/missing_stdlib.h
>  +++ b/src/basic/missing_stdlib.h
>  @@ -11,3 +11,15 @@
> @@ -140,6 +150,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>  +    (char *)memcpy(__new, __old, __len); \
>  +  })
>  +#endif
> +diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
> +index 7ad19ee33b..cc1d5e1e5b 100644
>  --- a/src/basic/mkdir.c
>  +++ b/src/basic/mkdir.c
>  @@ -15,6 +15,7 @@
> @@ -148,8 +160,10 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   #include "user-util.h"
>  +#include "missing_stdlib.h"
>   
> - int mkdir_safe_internal(
> -                 const char *path,
> + int mkdirat_safe_internal(
> +                 int dir_fd,
> +diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-util.c
> +index bc74fbef8f..cdb609bb84 100644
>  --- a/src/basic/mountpoint-util.c
>  +++ b/src/basic/mountpoint-util.c
>  @@ -13,6 +13,7 @@
> @@ -160,6 +174,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   #include "mountpoint-util.h"
>   #include "nulstr-util.h"
>   #include "parse-util.h"
> +diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
> +index 3445d31307..d82b4415d9 100644
>  --- a/src/basic/parse-util.c
>  +++ b/src/basic/parse-util.c
>  @@ -18,6 +18,7 @@
> @@ -170,6 +186,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   int parse_boolean(const char *v) {
>           if (!v)
> +diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c
> +index c99e9d8786..71a917a0b0 100644
>  --- a/src/basic/path-lookup.c
>  +++ b/src/basic/path-lookup.c
>  @@ -16,6 +16,7 @@
> @@ -180,6 +198,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   int xdg_user_runtime_dir(char **ret, const char *suffix) {
>           const char *e;
> +diff --git a/src/basic/percent-util.c b/src/basic/percent-util.c
> +index cab9d0eaea..5f6ca258e9 100644
>  --- a/src/basic/percent-util.c
>  +++ b/src/basic/percent-util.c
>  @@ -3,6 +3,7 @@
> @@ -190,16 +210,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   static int parse_parts_value_whole(const char *p, const char *symbol) {
>           const char *pc, *n;
> +diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
> +index eea70d8606..ae3abd8402 100644
>  --- a/src/basic/proc-cmdline.c
>  +++ b/src/basic/proc-cmdline.c
>  @@ -15,6 +15,7 @@
> + #include "special.h"
>   #include "string-util.h"
> - #include "util.h"
>   #include "virt.h"
>  +#include "missing_stdlib.h"
>   
>   int proc_cmdline(char **ret) {
>           const char *e;
> +diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
> +index bcba5a5208..64a95dd866 100644
>  --- a/src/basic/procfs-util.c
>  +++ b/src/basic/procfs-util.c
>  @@ -12,6 +12,7 @@
> @@ -210,6 +234,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   int procfs_get_pid_max(uint64_t *ret) {
>           _cleanup_free_ char *value = NULL;
> +diff --git a/src/basic/time-util.c b/src/basic/time-util.c
> +index b700f364ef..48a26bcec9 100644
>  --- a/src/basic/time-util.c
>  +++ b/src/basic/time-util.c
>  @@ -26,6 +26,7 @@
> @@ -220,16 +246,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   static clockid_t map_clock_id(clockid_t c) {
>   
> +diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
> +index 59f02b761a..7496646350 100644
>  --- a/src/boot/bless-boot.c
>  +++ b/src/boot/bless-boot.c
>  @@ -22,6 +22,7 @@
> - #include "util.h"
> + #include "terminal-util.h"
>   #include "verbs.h"
>   #include "virt.h"
>  +#include "missing_stdlib.h"
>   
>   static char **arg_path = NULL;
>   
> +diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
> +index b5484eda78..54ed62c790 100644
>  --- a/src/core/dbus-cgroup.c
>  +++ b/src/core/dbus-cgroup.c
>  @@ -21,6 +21,7 @@
> @@ -240,9 +270,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   #include "socket-util.h"
>   
>   BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
> +diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
> +index f514b8fd12..4febd0d496 100644
>  --- a/src/core/dbus-execute.c
>  +++ b/src/core/dbus-execute.c
> -@@ -44,6 +44,7 @@
> +@@ -45,6 +45,7 @@
>   #include "unit-printf.h"
>   #include "user-util.h"
>   #include "utf8.h"
> @@ -250,6 +282,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_output, ExecOutput);
>   static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec_input, ExecInput);
> +diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
> +index edfa0eb69a..6fd2ec9062 100644
>  --- a/src/core/dbus-util.c
>  +++ b/src/core/dbus-util.c
>  @@ -9,6 +9,7 @@
> @@ -260,9 +294,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   int bus_property_get_triggered_unit(
>                   sd_bus *bus,
> +diff --git a/src/core/execute.c b/src/core/execute.c
> +index 853e87450f..8ef76de9ab 100644
>  --- a/src/core/execute.c
>  +++ b/src/core/execute.c
> -@@ -104,6 +104,7 @@
> +@@ -105,6 +105,7 @@
>   #include "unit-serialize.h"
>   #include "user-util.h"
>   #include "utmp-wtmp.h"
> @@ -270,9 +306,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
>   #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
> +diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
> +index e843743777..e149807492 100644
>  --- a/src/core/kmod-setup.c
>  +++ b/src/core/kmod-setup.c
> -@@ -11,6 +11,7 @@
> +@@ -12,6 +12,7 @@
>   #include "recurse-dir.h"
>   #include "string-util.h"
>   #include "virt.h"
> @@ -280,16 +318,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   #if HAVE_KMOD
>   #include "module-util.h"
> +diff --git a/src/core/service.c b/src/core/service.c
> +index 9ad3c3d995..b112d64919 100644
>  --- a/src/core/service.c
>  +++ b/src/core/service.c
>  @@ -42,6 +42,7 @@
> + #include "unit-name.h"
>   #include "unit.h"
>   #include "utf8.h"
> - #include "util.h"
>  +#include "missing_stdlib.h"
>   
>   #define service_spawn(...) service_spawn_internal(__func__, __VA_ARGS__)
>   
> +diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-vacuum.c
> +index c6e201ecf2..ab034475e2 100644
>  --- a/src/coredump/coredump-vacuum.c
>  +++ b/src/coredump/coredump-vacuum.c
>  @@ -17,6 +17,7 @@
> @@ -300,19 +342,23 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)           /* 1 MiB */
>   #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)   /* 4 GiB */
> +diff --git a/src/fstab-generator/fstab-generator.c b/src/fstab-generator/fstab-generator.c
> +index efc553b698..acea922311 100644
>  --- a/src/fstab-generator/fstab-generator.c
>  +++ b/src/fstab-generator/fstab-generator.c
> -@@ -32,6 +32,7 @@
> - #include "util.h"
> +@@ -33,6 +33,7 @@
> + #include "unit-name.h"
>   #include "virt.h"
>   #include "volatile-util.h"
>  +#include "missing_stdlib.h"
>   
>   typedef enum MountPointFlags {
>           MOUNT_NOAUTO    = 1 << 0,
> +diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
> +index 7df264fb53..9463a0e9fb 100644
>  --- a/src/journal-remote/journal-remote-main.c
>  +++ b/src/journal-remote/journal-remote-main.c
> -@@ -24,6 +24,7 @@
> +@@ -25,6 +25,7 @@
>   #include "stat-util.h"
>   #include "string-table.h"
>   #include "strv.h"
> @@ -320,9 +366,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
>   #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
> +diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
> +index da0fac548e..c1c043e0e0 100644
>  --- a/src/journal/journalctl.c
>  +++ b/src/journal/journalctl.c
> -@@ -70,6 +70,7 @@
> +@@ -72,6 +72,7 @@
>   #include "unit-name.h"
>   #include "user-util.h"
>   #include "varlink.h"
> @@ -330,6 +378,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
>   #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages processed */
> +diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
> +index 9719f97c02..75decd9834 100644
>  --- a/src/libsystemd/sd-bus/bus-message.c
>  +++ b/src/libsystemd/sd-bus/bus-message.c
>  @@ -19,6 +19,7 @@
> @@ -340,6 +390,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
>   static int message_parse_fields(sd_bus_message *m);
> +diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
> +index 2ad7a9993d..bba72f99f4 100644
>  --- a/src/libsystemd/sd-bus/bus-objects.c
>  +++ b/src/libsystemd/sd-bus/bus-objects.c
>  @@ -11,6 +11,7 @@
> @@ -350,9 +402,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   static int node_vtable_get_userdata(
>                   sd_bus *bus,
> +diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-socket.c
> +index 64037e4fe0..9b9ce0aaa9 100644
>  --- a/src/libsystemd/sd-bus/bus-socket.c
>  +++ b/src/libsystemd/sd-bus/bus-socket.c
> -@@ -28,6 +28,7 @@
> +@@ -27,6 +27,7 @@
>   #include "string-util.h"
>   #include "user-util.h"
>   #include "utf8.h"
> @@ -360,6 +414,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   #define SNDBUF_SIZE (8*1024*1024)
>   
> +diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
> +index f6a5e4aa06..b36faa79a3 100644
>  --- a/src/libsystemd/sd-bus/sd-bus.c
>  +++ b/src/libsystemd/sd-bus/sd-bus.c
>  @@ -44,6 +44,7 @@
> @@ -370,16 +426,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   #define log_debug_bus_message(m)                                         \
>           do {                                                             \
> +diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd/sd-bus/test-bus-benchmark.c
> +index 1eb6edd329..d434a3c178 100644
>  --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
>  +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
> -@@ -14,6 +14,7 @@
> +@@ -13,6 +13,7 @@
> + #include "missing_resource.h"
>   #include "string-util.h"
>   #include "time-util.h"
> - #include "util.h"
>  +#include "missing_stdlib.h"
>   
>   #define MAX_SIZE (2*1024*1024)
>   
> +diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd-journal/sd-journal.c
> +index 9947947ef2..8dc6f93159 100644
>  --- a/src/libsystemd/sd-journal/sd-journal.c
>  +++ b/src/libsystemd/sd-journal/sd-journal.c
>  @@ -41,6 +41,7 @@
> @@ -388,8 +448,10 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   #include "syslog-util.h"
>  +#include "missing_stdlib.h"
>   
> - #define JOURNAL_FILES_MAX 7168
> + #define JOURNAL_FILES_RECHECK_USEC (2 * USEC_PER_SEC)
>   
> +diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
> +index ba2fca32c6..e1f9caa13b 100644
>  --- a/src/login/pam_systemd.c
>  +++ b/src/login/pam_systemd.c
>  @@ -32,6 +32,7 @@
> @@ -400,6 +462,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   #include "pam-util.h"
>   #include "parse-util.h"
>   #include "path-util.h"
> +diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
> +index 1090934bfc..69a77f66e2 100644
>  --- a/src/network/generator/network-generator.c
>  +++ b/src/network/generator/network-generator.c
>  @@ -13,6 +13,7 @@
> @@ -410,16 +474,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   /*
>     # .network
> +diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
> +index 05bde1c756..aa29587868 100644
>  --- a/src/nspawn/nspawn-settings.c
>  +++ b/src/nspawn/nspawn-settings.c
> -@@ -17,6 +17,7 @@
> +@@ -16,6 +16,7 @@
> + #include "string-util.h"
>   #include "strv.h"
>   #include "user-util.h"
> - #include "util.h"
>  +#include "missing_stdlib.h"
>   
>   Settings *settings_new(void) {
>           Settings *s;
> +diff --git a/src/nss-mymachines/nss-mymachines.c b/src/nss-mymachines/nss-mymachines.c
> +index c64e79bdff..eda26b0b9a 100644
>  --- a/src/nss-mymachines/nss-mymachines.c
>  +++ b/src/nss-mymachines/nss-mymachines.c
>  @@ -21,6 +21,7 @@
> @@ -430,6 +498,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   static void setup_logging_once(void) {
>           static pthread_once_t once = PTHREAD_ONCE_INIT;
> +diff --git a/src/portable/portable.c b/src/portable/portable.c
> +index 7811833fac..c6414da91c 100644
>  --- a/src/portable/portable.c
>  +++ b/src/portable/portable.c
>  @@ -39,6 +39,7 @@
> @@ -440,9 +510,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   /* Markers used in the first line of our 20-portable.conf unit file drop-in to determine, that a) the unit file was
>    * dropped there by the portable service logic and b) for which image it was dropped there. */
> +diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
> +index 2638e985fb..82c903fd66 100644
>  --- a/src/resolve/resolvectl.c
>  +++ b/src/resolve/resolvectl.c
> -@@ -46,6 +46,7 @@
> +@@ -48,6 +48,7 @@
>   #include "varlink.h"
>   #include "verb-log-control.h"
>   #include "verbs.h"
> @@ -450,6 +522,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   static int arg_family = AF_UNSPEC;
>   static int arg_ifindex = 0;
> +diff --git a/src/shared/bus-get-properties.c b/src/shared/bus-get-properties.c
> +index 8b4f66b22e..5926e4c61b 100644
>  --- a/src/shared/bus-get-properties.c
>  +++ b/src/shared/bus-get-properties.c
>  @@ -4,6 +4,7 @@
> @@ -460,6 +534,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   int bus_property_get_bool(
>                   sd_bus *bus,
> +diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-procs.c
> +index 8b462b5627..183ce1c18e 100644
>  --- a/src/shared/bus-unit-procs.c
>  +++ b/src/shared/bus-unit-procs.c
>  @@ -11,6 +11,7 @@
> @@ -470,9 +546,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   struct CGroupInfo {
>           char *cgroup_path;
> +diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
> +index 1e95e36678..640ee031d5 100644
>  --- a/src/shared/bus-unit-util.c
>  +++ b/src/shared/bus-unit-util.c
> -@@ -49,6 +49,7 @@
> +@@ -50,6 +50,7 @@
>   #include "unit-def.h"
>   #include "user-util.h"
>   #include "utf8.h"
> @@ -480,6 +558,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
>           assert(message);
> +diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
> +index d09ec5148d..f38a8f7cc1 100644
>  --- a/src/shared/bus-util.c
>  +++ b/src/shared/bus-util.c
>  @@ -21,6 +21,7 @@
> @@ -490,6 +570,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   static int name_owner_change_callback(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
>           sd_event *e = ASSERT_PTR(userdata);
> +diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
> +index 620b156563..5ee5b09186 100644
>  --- a/src/shared/dns-domain.c
>  +++ b/src/shared/dns-domain.c
>  @@ -18,6 +18,7 @@
> @@ -500,6 +582,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLabelFlags flags) {
>           const char *n;
> +diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
> +index d9eabec886..534c6cf7e3 100644
>  --- a/src/shared/journal-importer.c
>  +++ b/src/shared/journal-importer.c
>  @@ -15,6 +15,7 @@
> @@ -510,36 +594,44 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   enum {
>           IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
> +diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
> +index b72e516c8d..6e832b74c3 100644
>  --- a/src/shared/logs-show.c
>  +++ b/src/shared/logs-show.c
> -@@ -42,6 +42,7 @@
> +@@ -41,6 +41,7 @@
> + #include "time-util.h"
>   #include "utf8.h"
> - #include "util.h"
>   #include "web-util.h"
>  +#include "missing_stdlib.h"
>   
>   /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
>   #define PRINT_LINE_THRESHOLD 3
> +diff --git a/src/shared/pager.c b/src/shared/pager.c
> +index 6ed35a3ca9..99d9d36140 100644
>  --- a/src/shared/pager.c
>  +++ b/src/shared/pager.c
> -@@ -26,6 +26,7 @@
> +@@ -25,6 +25,7 @@
> + #include "string-util.h"
>   #include "strv.h"
>   #include "terminal-util.h"
> - #include "util.h"
>  +#include "missing_stdlib.h"
>   
>   static pid_t pager_pid = 0;
>   
> +diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
> +index 821049e667..08a5bdae3d 100644
>  --- a/src/socket-proxy/socket-proxyd.c
>  +++ b/src/socket-proxy/socket-proxyd.c
>  @@ -26,6 +26,7 @@
> + #include "set.h"
>   #include "socket-util.h"
>   #include "string-util.h"
> - #include "util.h"
>  +#include "missing_stdlib.h"
>   
>   #define BUFFER_SIZE (256 * 1024)
>   
> +diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
> +index 9d71db6ae1..a9938c1e6e 100644
>  --- a/src/test/test-hexdecoct.c
>  +++ b/src/test/test-hexdecoct.c
>  @@ -7,6 +7,7 @@
> @@ -550,6 +642,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   #include "tests.h"
>   
>   TEST(hexchar) {
> +diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
> +index 8e4d57ee72..6b4555b4d5 100644
>  --- a/src/udev/udev-builtin-path_id.c
>  +++ b/src/udev/udev-builtin-path_id.c
>  @@ -22,6 +22,7 @@
> @@ -560,6 +654,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   _printf_(2,3)
>   static void path_prepend(char **path, const char *fmt, ...) {
> +diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
> +index ec4ad30824..bc40303a46 100644
>  --- a/src/udev/udev-event.c
>  +++ b/src/udev/udev-event.c
>  @@ -34,6 +34,7 @@
> @@ -570,6 +666,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   typedef struct Spawn {
>           sd_device *device;
> +diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
> +index 5bd09a64d1..0ce79f815c 100644
>  --- a/src/udev/udev-rules.c
>  +++ b/src/udev/udev-rules.c
>  @@ -34,6 +34,7 @@
> @@ -580,3 +678,6 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>   #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
>   
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> similarity index 87%
> rename from meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> rename to meta/recipes-core/systemd/systemd/0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> index 2a5770c515..b86cc42589 100644
> --- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> +++ b/meta/recipes-core/systemd/systemd/0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> @@ -1,4 +1,4 @@
> -From 74c664bcd6b9a5fcf3466310c07f608d12456f7f Mon Sep 17 00:00:00 2001
> +From 747ff78ecda6afe01c7eab4d7c27aea6af810c86 Mon Sep 17 00:00:00 2001
>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Mon, 25 Feb 2019 14:56:21 +0800
>  Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not defined
> @@ -16,13 +16,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  [rebased for systemd 243]
>  Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> -
>  ---
>   src/basic/glob-util.c     | 12 ++++++++++++
>   src/test/test-glob-util.c | 16 ++++++++++++++++
>   src/tmpfiles/tmpfiles.c   | 10 ++++++++++
>   3 files changed, 38 insertions(+)
>  
> +diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
> +index fd60a6eda2..c73edc41ea 100644
>  --- a/src/basic/glob-util.c
>  +++ b/src/basic/glob-util.c
>  @@ -12,6 +12,12 @@
> @@ -46,7 +47,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           /* We want to set GLOB_ALTDIRFUNC ourselves, don't allow it to be set. */
>           assert(!(flags & GLOB_ALTDIRFUNC));
>   
> -@@ -32,9 +39,14 @@ int safe_glob(const char *path, int flag
> +@@ -32,9 +39,14 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
>                   pglob->gl_lstat = lstat;
>           if (!pglob->gl_stat)
>                   pglob->gl_stat = stat;
> @@ -61,6 +62,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (k == GLOB_NOMATCH)
>                   return -ENOENT;
>           if (k == GLOB_NOSPACE)
> +diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
> +index 9b3e73cce0..3790ba3be5 100644
>  --- a/src/test/test-glob-util.c
>  +++ b/src/test/test-glob-util.c
>  @@ -34,6 +34,12 @@ TEST(glob_first) {
> @@ -75,7 +78,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>  +
>   TEST(glob_exists) {
>           char name[] = "/tmp/test-glob_exists.XXXXXX";
> -         int fd = -1;
> +         int fd = -EBADF;
>  @@ -61,11 +67,13 @@ TEST(glob_no_dot) {
>           const char *fn;
>   
> @@ -110,9 +113,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           assert_se(r == GLOB_NOMATCH);
>   
>           (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
> +diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
> +index 458aed7054..2cf24b38c0 100644
>  --- a/src/tmpfiles/tmpfiles.c
>  +++ b/src/tmpfiles/tmpfiles.c
> -@@ -71,6 +71,12 @@
> +@@ -73,6 +73,12 @@
>   #include "user-util.h"
>   #include "virt.h"
>   
> @@ -125,7 +130,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>   /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
>    * them in the file system. This is intended to be used to create
>    * properly owned directories beneath /tmp, /var/tmp, /run, which are
> -@@ -2174,7 +2180,9 @@ finish:
> +@@ -2194,7 +2200,9 @@ finish:
>   
>   static int glob_item(Item *i, action_t action) {
>           _cleanup_globfree_ glob_t g = {
> @@ -135,7 +140,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           };
>           int r = 0, k;
>   
> -@@ -2194,7 +2202,9 @@ static int glob_item(Item *i, action_t a
> +@@ -2214,7 +2222,9 @@ static int glob_item(Item *i, action_t action) {
>   
>   static int glob_item_recursively(Item *i, fdaction_t action) {
>           _cleanup_globfree_ glob_t g = {
> @@ -145,3 +150,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           };
>           int r = 0, k;
>   
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0013-add-missing-FTW_-macros-for-musl.patch
> similarity index 93%
> rename from meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
> rename to meta/recipes-core/systemd/systemd/0013-add-missing-FTW_-macros-for-musl.patch
> index d1191d7e8e..d6aaadc006 100644
> --- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
> +++ b/meta/recipes-core/systemd/systemd/0013-add-missing-FTW_-macros-for-musl.patch
> @@ -1,4 +1,4 @@
> -From a0450f7909348e7ff1d58adc0aee4119a0519c1f Mon Sep 17 00:00:00 2001
> +From efd7b41cf270c7b07ee3b9aec0fedd8e52dd422f Mon Sep 17 00:00:00 2001
>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Mon, 25 Feb 2019 15:00:06 +0800
>  Subject: [PATCH] add missing FTW_ macros for musl
> @@ -10,7 +10,6 @@ This is to avoid build failures like below for musl.
>  Upstream-Status: Inappropriate [musl specific]
>  
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
>  ---
>   src/basic/missing_type.h    | 4 ++++
>   src/test/test-recurse-dir.c | 1 +
> @@ -40,3 +39,6 @@ index 2c2120b136..bc60a178a2 100644
>   
>   static char **list_nftw = NULL;
>   
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-handling-rlim_t.patch
> similarity index 85%
> rename from meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
> rename to meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-handling-rlim_t.patch
> index aac4ad49d7..f586d3ff52 100644
> --- a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
> +++ b/meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-handling-rlim_t.patch
> @@ -1,4 +1,4 @@
> -From 48a791aae7a47a2a08e9e60c18054071a43b8cda Mon Sep 17 00:00:00 2001
> +From 60f7d2c62bc3718023df93c01688d3ee1625d64d Mon Sep 17 00:00:00 2001
>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Mon, 25 Feb 2019 15:12:41 +0800
>  Subject: [PATCH] Use uintmax_t for handling rlim_t
> @@ -20,16 +20,17 @@ Upstream-Status: Denied [https://github.com/systemd/systemd/pull/7199]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  [Rebased for v241]
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
>  ---
>   src/basic/format-util.h |  8 +-------
>   src/basic/rlimit-util.c | 12 ++++++------
>   src/core/execute.c      |  4 ++--
>   3 files changed, 9 insertions(+), 15 deletions(-)
>  
> +diff --git a/src/basic/format-util.h b/src/basic/format-util.h
> +index 8719df3e29..9becc96066 100644
>  --- a/src/basic/format-util.h
>  +++ b/src/basic/format-util.h
> -@@ -34,13 +34,7 @@ assert_cc(sizeof(gid_t) == sizeof(uint32
> +@@ -34,13 +34,7 @@ assert_cc(sizeof(gid_t) == sizeof(uint32_t));
>   #  error Unknown timex member size
>   #endif
>   
> @@ -44,9 +45,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   
>   #if SIZEOF_DEV_T == 8
>   #  define DEV_FMT "%" PRIu64
> +diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
> +index 33dfde9d6c..e018fd81fd 100644
>  --- a/src/basic/rlimit-util.c
>  +++ b/src/basic/rlimit-util.c
> -@@ -44,7 +44,7 @@ int setrlimit_closest(int resource, cons
> +@@ -44,7 +44,7 @@ int setrlimit_closest(int resource, const struct rlimit *rlim) {
>               fixed.rlim_max == highest.rlim_max)
>                   return 0;
>   
> @@ -55,7 +58,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   
>           return RET_NERRNO(setrlimit(resource, &fixed));
>   }
> -@@ -307,13 +307,13 @@ int rlimit_format(const struct rlimit *r
> +@@ -307,13 +307,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
>           if (rl->rlim_cur >= RLIM_INFINITY && rl->rlim_max >= RLIM_INFINITY)
>                   r = free_and_strdup(&s, "infinity");
>           else if (rl->rlim_cur >= RLIM_INFINITY)
> @@ -82,9 +85,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   
>           return 1;
>   }
> +diff --git a/src/core/execute.c b/src/core/execute.c
> +index 8ef76de9ab..ea1c203e43 100644
>  --- a/src/core/execute.c
>  +++ b/src/core/execute.c
> -@@ -5869,9 +5869,9 @@ void exec_context_dump(const ExecContext
> +@@ -6034,9 +6034,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
>           for (unsigned i = 0; i < RLIM_NLIMITS; i++)
>                   if (c->rlimit[i]) {
>                           fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
> @@ -96,3 +101,6 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>                   }
>   
>           if (c->ioprio_set) {
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0015-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> similarity index 89%
> rename from meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> rename to meta/recipes-core/systemd/systemd/0015-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> index 1074866f86..afc80b9511 100644
> --- a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> +++ b/meta/recipes-core/systemd/systemd/0015-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> @@ -1,4 +1,4 @@
> -From e8025c8eefdf1be4bba34c48f3430838f3859c52 Mon Sep 17 00:00:00 2001
> +From 96088895149746dd2ee8e8c2e4b97972ccf44696 Mon Sep 17 00:00:00 2001
>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Wed, 28 Feb 2018 21:25:22 -0800
>  Subject: [PATCH] test-sizeof.c: Disable tests for missing typedefs in musl
> @@ -7,13 +7,12 @@ Upstream-Status: Inappropriate [musl specific]
>  
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
>  ---
>   src/test/test-sizeof.c | 4 ++++
>   1 file changed, 4 insertions(+)
>  
>  diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
> -index f349852553..602772227e 100644
> +index 55bd81e22f..6cf92bffde 100644
>  --- a/src/test/test-sizeof.c
>  +++ b/src/test/test-sizeof.c
>  @@ -55,8 +55,10 @@ int main(void) {
> @@ -37,3 +36,6 @@ index f349852553..602772227e 100644
>           info(pid_t);
>           info(uid_t);
>           info(gid_t);
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> similarity index 87%
> rename from meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> rename to meta/recipes-core/systemd/systemd/0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> index 6367adce07..2f84d3d6c2 100644
> --- a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> +++ b/meta/recipes-core/systemd/systemd/0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> @@ -1,4 +1,4 @@
> -From 46fdc959257d60d9b32953cae0152ae118f8564b Mon Sep 17 00:00:00 2001
> +From 26b02348e39fe72b73dd61bba8a0cefb0352717d Mon Sep 17 00:00:00 2001
>  From: Andre McCurdy <armccurdy@gmail.com>
>  Date: Tue, 10 Oct 2017 14:33:30 -0700
>  Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
> @@ -25,15 +25,16 @@ just historical and not actually necessary or desired behaviour?
>  Upstream-Status: Inappropriate [musl specific]
>  
>  Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> -
>  ---
>   src/basic/fs-util.h          | 21 ++++++++++++++++++++-
>   src/shared/base-filesystem.c |  6 +++---
>   2 files changed, 23 insertions(+), 4 deletions(-)
>  
> +diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
> +index 932d003f19..33215dbf5f 100644
>  --- a/src/basic/fs-util.h
>  +++ b/src/basic/fs-util.h
> -@@ -47,8 +47,27 @@ int futimens_opath(int fd, const struct
> +@@ -50,8 +50,27 @@ int futimens_opath(int fd, const struct timespec ts[2]);
>   int fd_warn_permissions(const char *path, int fd);
>   int stat_warn_permissions(const char *path, const struct stat *st);
>   
> @@ -62,9 +63,11 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>   
>   int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid, gid_t gid, mode_t mode);
>   
> +diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
> +index be6dd1654a..2726dc946a 100644
>  --- a/src/shared/base-filesystem.c
>  +++ b/src/shared/base-filesystem.c
> -@@ -131,7 +131,7 @@ int base_filesystem_create(const char *r
> +@@ -131,7 +131,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
>                   return log_error_errno(errno, "Failed to open root file system: %m");
>   
>           for (size_t i = 0; i < ELEMENTSOF(table); i++) {
> @@ -73,7 +76,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>                           continue;
>   
>                   if (table[i].target) {
> -@@ -139,7 +139,7 @@ int base_filesystem_create(const char *r
> +@@ -139,7 +139,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
>   
>                           /* check if one of the targets exists */
>                           NULSTR_FOREACH(s, table[i].target) {
> @@ -82,7 +85,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>                                           continue;
>   
>                                   /* check if a specific file exists at the target path */
> -@@ -150,7 +150,7 @@ int base_filesystem_create(const char *r
> +@@ -150,7 +150,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
>                                           if (!p)
>                                                   return log_oom();
>   
> @@ -91,3 +94,6 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>                                                   continue;
>                                   }
>   
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0017-Define-glibc-compatible-basename-for-non-glibc-syste.patch
> similarity index 81%
> rename from meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
> rename to meta/recipes-core/systemd/systemd/0017-Define-glibc-compatible-basename-for-non-glibc-syste.patch
> index 3228f1716b..7d74cfcc24 100644
> --- a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
> +++ b/meta/recipes-core/systemd/systemd/0017-Define-glibc-compatible-basename-for-non-glibc-syste.patch
> @@ -1,4 +1,4 @@
> -From d0bdce977b7acc5e45e82cf84256c4bedc0e74c4 Mon Sep 17 00:00:00 2001
> +From fdc7fb940bb41020271b9db41d5608004efdbde5 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 27 May 2018 08:36:44 -0700
>  Subject: [PATCH] Define glibc compatible basename() for non-glibc systems
> @@ -9,11 +9,12 @@ using non-posix basename implementation, we have a way out
>  Upstream-Status: Inappropriate [musl specific]
>  
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
>  ---
>   src/machine/machine-dbus.c | 5 +++++
>   1 file changed, 5 insertions(+)
>  
> +diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
> +index 45bc056326..aee51d5da5 100644
>  --- a/src/machine/machine-dbus.c
>  +++ b/src/machine/machine-dbus.c
>  @@ -4,6 +4,11 @@
> @@ -28,3 +29,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   #include "alloc-util.h"
>   #include "bus-common-errors.h"
>   #include "bus-get-properties.h"
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0018-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> similarity index 83%
> rename from meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> rename to meta/recipes-core/systemd/systemd/0018-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> index da56d8b4b6..401a9a9546 100644
> --- a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> +++ b/meta/recipes-core/systemd/systemd/0018-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> @@ -1,4 +1,4 @@
> -From e480d28305907c3874f4e58b722b8aa43c3ac7a2 Mon Sep 17 00:00:00 2001
> +From 32fd0dc67b6df531f0769dbb099dbe8f30c28514 Mon Sep 17 00:00:00 2001
>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Wed, 4 Jul 2018 15:00:44 +0800
>  Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
> @@ -19,14 +19,15 @@ Upstream-Status: Inappropriate [musl specific]
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  [rebased for systemd 243]
>  Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> -
>  ---
>   src/basic/process-util.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
> +diff --git a/src/basic/process-util.c b/src/basic/process-util.c
> +index 0747c14c1c..8d0c5aae92 100644
>  --- a/src/basic/process-util.c
>  +++ b/src/basic/process-util.c
> -@@ -1466,7 +1466,7 @@ int set_oom_score_adjust(int value) {
> +@@ -1405,7 +1405,7 @@ int set_oom_score_adjust(int value) {
>           xsprintf(t, "%i", value);
>   
>           return write_string_file("/proc/self/oom_score_adj", t,
> @@ -35,3 +36,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>   }
>   
>   int get_oom_score_adjust(int *ret) {
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0019-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> similarity index 70%
> rename from meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> rename to meta/recipes-core/systemd/systemd/0019-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> index 7533fde1e1..48b8eda0a5 100644
> --- a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> +++ b/meta/recipes-core/systemd/systemd/0019-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> @@ -1,4 +1,4 @@
> -From 0542d27ebbb250c09bdcfcf9f2ea3d27426fe522 Mon Sep 17 00:00:00 2001
> +From ed46afcbc6bc1f6277a0a54c3db8cf1b056bca1e Mon Sep 17 00:00:00 2001
>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Tue, 10 Jul 2018 15:40:17 +0800
>  Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
> @@ -18,15 +18,16 @@ assigned to (char *) variable, resulting in segment fault.
>  Upstream-Status: Inappropriate [musl specific]
>  
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
>  ---
> - src/libsystemd/sd-bus/bus-error.c        | 5 +++++
> - src/libsystemd/sd-journal/journal-send.c | 5 +++++
> - 2 files changed, 10 insertions(+)
> + src/libsystemd/sd-bus/bus-error.c        | 11 ++++++++++-
> + src/libsystemd/sd-journal/journal-send.c |  5 +++++
> + 2 files changed, 15 insertions(+), 1 deletion(-)
>  
> +diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
> +index 413e2dd43f..805e5da0c0 100644
>  --- a/src/libsystemd/sd-bus/bus-error.c
>  +++ b/src/libsystemd/sd-bus/bus-error.c
> -@@ -409,7 +409,12 @@ static void bus_error_strerror(sd_bus_er
> +@@ -408,7 +408,12 @@ static void bus_error_strerror(sd_bus_error *e, int error) {
>                           return;
>   
>                   errno = 0;
> @@ -39,7 +40,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>                   if (errno == ERANGE || strlen(x) >= k - 1) {
>                           free(m);
>                           k *= 2;
> -@@ -594,8 +599,12 @@ const char* _bus_error_message(const sd_
> +@@ -593,8 +598,12 @@ const char* _bus_error_message(const sd_bus_error *e, int error, char buf[static
>   
>           if (e && e->message)
>                   return e->message;
> @@ -53,9 +54,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>   }
>   
>   static bool map_ok(const sd_bus_error_map *map) {
> +diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/sd-journal/journal-send.c
> +index 136ebcb153..8a75ba4ecd 100644
>  --- a/src/libsystemd/sd-journal/journal-send.c
>  +++ b/src/libsystemd/sd-journal/journal-send.c
> -@@ -381,7 +381,12 @@ static int fill_iovec_perror_and_send(co
> +@@ -381,7 +381,12 @@ static int fill_iovec_perror_and_send(const char *message, int skip, struct iove
>                   char* j;
>   
>                   errno = 0;
> @@ -68,3 +71,6 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>                   if (errno == 0) {
>                           char error[STRLEN("ERRNO=") + DECIMAL_STR_MAX(int) + 1];
>   
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0020-avoid-redefinition-of-prctl_mm_map-structure.patch
> similarity index 91%
> rename from meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
> rename to meta/recipes-core/systemd/systemd/0020-avoid-redefinition-of-prctl_mm_map-structure.patch
> index 1fcba7af08..e5f017347c 100644
> --- a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
> +++ b/meta/recipes-core/systemd/systemd/0020-avoid-redefinition-of-prctl_mm_map-structure.patch
> @@ -1,4 +1,4 @@
> -From e1d0210b47906dd121f936f3181092835df6a95c Mon Sep 17 00:00:00 2001
> +From 277b680d07a178b8278862b60417052d05c1376f Mon Sep 17 00:00:00 2001
>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Mon, 25 Feb 2019 15:44:54 +0800
>  Subject: [PATCH] avoid redefinition of prctl_mm_map structure
> @@ -9,7 +9,6 @@ error: redefinition of 'struct prctl_mm_map'
>  Upstream-Status: Inappropriate [musl specific]
>  
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> -
>  ---
>   src/basic/missing_prctl.h | 2 ++
>   1 file changed, 2 insertions(+)
> @@ -28,3 +27,6 @@ index ab851306ba..5547cad875 100644
>   
>   /* 58319057b7847667f0c9585b9de0e8932b0fdb08 (4.3) */
>   #ifndef PR_CAP_AMBIENT
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-writing-files.patch
> similarity index 78%
> rename from meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
> rename to meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-writing-files.patch
> index 6edab0dfe2..46267a5ada 100644
> --- a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
> +++ b/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-writing-files.patch
> @@ -1,4 +1,4 @@
> -From 414e2f97008a1f3c26a260a6dc4d51a8c1fa6900 Mon Sep 17 00:00:00 2001
> +From aa6e5588e6d01c12e2f101d140cc710ab199df16 Mon Sep 17 00:00:00 2001
>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Fri, 1 Mar 2019 15:22:15 +0800
>  Subject: [PATCH] do not disable buffer in writing files
> @@ -18,16 +18,14 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>  [rebased for systemd 243]
>  Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> -
>  ---
>   src/basic/cgroup-util.c                 | 12 ++++++------
>   src/basic/namespace-util.c              |  4 ++--
>   src/basic/procfs-util.c                 |  4 ++--
>   src/basic/sysctl-util.c                 |  2 +-
> - src/basic/util.c                        |  2 +-
>   src/binfmt/binfmt.c                     |  6 +++---
>   src/core/cgroup.c                       |  2 +-
> - src/core/main.c                         |  4 ++--
> + src/core/main.c                         |  2 +-
>   src/core/smack-setup.c                  |  8 ++++----
>   src/hibernate-resume/hibernate-resume.c |  2 +-
>   src/home/homework.c                     |  2 +-
> @@ -41,11 +39,13 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>   src/sleep/sleep.c                       |  8 ++++----
>   src/udev/udev-rules.c                   |  1 -
>   src/vconsole/vconsole-setup.c           |  2 +-
> - 21 files changed, 39 insertions(+), 40 deletions(-)
> + 20 files changed, 37 insertions(+), 38 deletions(-)
>  
> +diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
> +index 11b4375ed5..7d81a6007f 100644
>  --- a/src/basic/cgroup-util.c
>  +++ b/src/basic/cgroup-util.c
> -@@ -399,7 +399,7 @@ int cg_kill_kernel_sigkill(const char *c
> +@@ -399,7 +399,7 @@ int cg_kill_kernel_sigkill(const char *controller, const char *path) {
>           if (r < 0)
>                   return r;
>   
> @@ -54,7 +54,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0)
>                   return r;
>   
> -@@ -805,7 +805,7 @@ int cg_install_release_agent(const char
> +@@ -805,7 +805,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
>   
>           sc = strstrip(contents);
>           if (isempty(sc)) {
> @@ -63,7 +63,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>                   if (r < 0)
>                           return r;
>           } else if (!path_equal(sc, agent))
> -@@ -823,7 +823,7 @@ int cg_install_release_agent(const char
> +@@ -823,7 +823,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
>   
>           sc = strstrip(contents);
>           if (streq(sc, "0")) {
> @@ -72,7 +72,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>                   if (r < 0)
>                           return r;
>   
> -@@ -850,7 +850,7 @@ int cg_uninstall_release_agent(const cha
> +@@ -850,7 +850,7 @@ int cg_uninstall_release_agent(const char *controller) {
>           if (r < 0)
>                   return r;
>   
> @@ -81,7 +81,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0)
>                   return r;
>   
> -@@ -860,7 +860,7 @@ int cg_uninstall_release_agent(const cha
> +@@ -860,7 +860,7 @@ int cg_uninstall_release_agent(const char *controller) {
>           if (r < 0)
>                   return r;
>   
> @@ -90,7 +90,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0)
>                   return r;
>   
> -@@ -1730,7 +1730,7 @@ int cg_set_attribute(const char *control
> +@@ -1752,7 +1752,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
>           if (r < 0)
>                   return r;
>   
> @@ -99,9 +99,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>   }
>   
>   int cg_get_attribute(const char *controller, const char *path, const char *attribute, char **ret) {
> +diff --git a/src/basic/namespace-util.c b/src/basic/namespace-util.c
> +index f5c0e04cec..272b920022 100644
>  --- a/src/basic/namespace-util.c
>  +++ b/src/basic/namespace-util.c
> -@@ -220,12 +220,12 @@ int userns_acquire(const char *uid_map,
> +@@ -220,12 +220,12 @@ int userns_acquire(const char *uid_map, const char *gid_map) {
>                   freeze();
>   
>           xsprintf(path, "/proc/" PID_FMT "/uid_map", pid);
> @@ -116,9 +118,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0)
>                   return log_error_errno(r, "Failed to write GID map: %m");
>   
> +diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
> +index 64a95dd866..12cd16db1c 100644
>  --- a/src/basic/procfs-util.c
>  +++ b/src/basic/procfs-util.c
> -@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limi
> +@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
>            * decrease it, as threads-max is the much more relevant sysctl. */
>           if (limit > pid_max-1) {
>                   sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since PID 0 is not a valid PID */
> @@ -134,9 +138,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0) {
>                   uint64_t threads_max;
>   
> +diff --git a/src/basic/sysctl-util.c b/src/basic/sysctl-util.c
> +index b66a6622ae..8d1c93008a 100644
>  --- a/src/basic/sysctl-util.c
>  +++ b/src/basic/sysctl-util.c
> -@@ -58,7 +58,7 @@ int sysctl_write(const char *property, c
> +@@ -58,7 +58,7 @@ int sysctl_write(const char *property, const char *value) {
>   
>           log_debug("Setting '%s' to '%s'", p, value);
>   
> @@ -145,20 +151,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>   }
>   
>   int sysctl_writef(const char *property, const char *format, ...) {
> ---- a/src/basic/util.c
> -+++ b/src/basic/util.c
> -@@ -134,7 +134,7 @@ void disable_coredumps(void) {
> -         if (detect_container() > 0)
> -                 return;
> - 
> --        r = write_string_file("/proc/sys/kernel/core_pattern", "|/bin/false", WRITE_STRING_FILE_DISABLE_BUFFER);
> -+        r = write_string_file("/proc/sys/kernel/core_pattern", "|/bin/false", 0);
> -         if (r < 0)
> -                 log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
> - }
> +diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
> +index e1ddf97914..df6e156f19 100644
>  --- a/src/binfmt/binfmt.c
>  +++ b/src/binfmt/binfmt.c
> -@@ -29,7 +29,7 @@ static bool arg_unregister = false;
> +@@ -30,7 +30,7 @@ static bool arg_unregister = false;
>   
>   static int delete_rule(const char *rulename) {
>           const char *fn = strjoina("/proc/sys/fs/binfmt_misc/", rulename);
> @@ -167,7 +164,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>   }
>   
>   static int apply_rule(const char *filename, unsigned line, const char *rule) {
> -@@ -59,7 +59,7 @@ static int apply_rule(const char *filena
> +@@ -58,7 +58,7 @@ static int apply_rule(const char *filename, unsigned line, const char *rule) {
>           if (r >= 0)
>                   log_debug("%s:%u: Rule '%s' deleted.", filename, line, rulename);
>   
> @@ -176,8 +173,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0)
>                   return log_error_errno(r, "%s:%u: Failed to add binary format '%s': %m",
>                                          filename, line, rulename);
> -@@ -225,7 +225,7 @@ static int run(int argc, char *argv[]) {
> -                 }
> +@@ -244,7 +244,7 @@ static int run(int argc, char *argv[]) {
> +                         return r;
>   
>                   /* Flush out all rules */
>  -                r = write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", WRITE_STRING_FILE_DISABLE_BUFFER);
> @@ -185,9 +182,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>                   if (r < 0)
>                           log_warning_errno(r, "Failed to flush binfmt_misc rules, ignoring: %m");
>                   else
> +diff --git a/src/core/cgroup.c b/src/core/cgroup.c
> +index 4cac3f6a89..bebe2cd120 100644
>  --- a/src/core/cgroup.c
>  +++ b/src/core/cgroup.c
> -@@ -4210,7 +4210,7 @@ int unit_cgroup_freezer_action(Unit *u,
> +@@ -4267,7 +4267,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAction action) {
>                           u->freezer_state = FREEZER_THAWING;
>           }
>   
> @@ -196,18 +195,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0)
>                   return r;
>   
> +diff --git a/src/core/main.c b/src/core/main.c
> +index c0b8126d96..fe676320ba 100644
>  --- a/src/core/main.c
>  +++ b/src/core/main.c
> -@@ -1404,7 +1404,7 @@ static int bump_unix_max_dgram_qlen(void
> -         if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
> -                 return 0;
> - 
> --        r = write_string_filef("/proc/sys/net/unix/max_dgram_qlen", WRITE_STRING_FILE_DISABLE_BUFFER,
> -+        r = write_string_filef("/proc/sys/net/unix/max_dgram_qlen", 0,
> -                                "%lu", DEFAULT_UNIX_MAX_DGRAM_QLEN);
> -         if (r < 0)
> -                 return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
> -@@ -1676,7 +1676,7 @@ static void initialize_core_pattern(bool
> +@@ -1716,7 +1716,7 @@ static void initialize_core_pattern(bool skip_setup) {
>           if (getpid_cached() != 1)
>                   return;
>   
> @@ -216,9 +208,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0)
>                   log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m",
>                                     arg_early_core_pattern);
> +diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
> +index bcaa237c8d..4032bde19e 100644
>  --- a/src/core/smack-setup.c
>  +++ b/src/core/smack-setup.c
> -@@ -320,17 +320,17 @@ int mac_smack_setup(bool *loaded_policy)
> +@@ -319,17 +319,17 @@ int mac_smack_setup(bool *loaded_policy) {
>           }
>   
>   #if HAVE_SMACK_RUN_LABEL
> @@ -240,6 +234,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0)
>                   log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
>   #endif
> +diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-resume/hibernate-resume.c
> +index 9a9df5d22f..75ddec881a 100644
>  --- a/src/hibernate-resume/hibernate-resume.c
>  +++ b/src/hibernate-resume/hibernate-resume.c
>  @@ -40,7 +40,7 @@ int main(int argc, char *argv[]) {
> @@ -251,6 +247,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0) {
>                   log_error_errno(r, "Failed to write '" DEVNUM_FORMAT_STR "' to /sys/power/resume: %m", DEVNUM_FORMAT_VAL(st.st_rdev));
>                   return EXIT_FAILURE;
> +diff --git a/src/home/homework.c b/src/home/homework.c
> +index 28907386a4..f9e45349a7 100644
>  --- a/src/home/homework.c
>  +++ b/src/home/homework.c
>  @@ -278,7 +278,7 @@ static void drop_caches_now(void) {
> @@ -262,9 +260,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0)
>                   log_warning_errno(r, "Failed to drop caches, ignoring: %m");
>           else
> +diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
> +index 8c65ee3469..153edab081 100644
>  --- a/src/libsystemd/sd-device/sd-device.c
>  +++ b/src/libsystemd/sd-device/sd-device.c
> -@@ -2444,7 +2444,7 @@ _public_ int sd_device_set_sysattr_value
> +@@ -2481,7 +2481,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
>           if (!value)
>                   return -ENOMEM;
>   
> @@ -273,9 +273,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0) {
>                   /* On failure, clear cache entry, as we do not know how it fails. */
>                   device_remove_cached_sysattr_value(device, sysattr);
> +diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
> +index 0deb4ebb30..bae8eead9e 100644
>  --- a/src/nspawn/nspawn-cgroup.c
>  +++ b/src/nspawn/nspawn-cgroup.c
> -@@ -123,7 +123,7 @@ int sync_cgroup(pid_t pid, CGroupUnified
> +@@ -122,7 +122,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
>           fn = strjoina(tree, cgroup, "/cgroup.procs");
>   
>           sprintf(pid_string, PID_FMT, pid);
> @@ -284,9 +286,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0) {
>                   log_error_errno(r, "Failed to move process: %m");
>                   goto finish;
> +diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
> +index 36d336dfc8..8c5c69596b 100644
>  --- a/src/nspawn/nspawn.c
>  +++ b/src/nspawn/nspawn.c
> -@@ -2762,7 +2762,7 @@ static int reset_audit_loginuid(void) {
> +@@ -2771,7 +2771,7 @@ static int reset_audit_loginuid(void) {
>           if (streq(p, "4294967295"))
>                   return 0;
>   
> @@ -295,7 +299,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0) {
>                   log_error_errno(r,
>                                   "Failed to reset audit login UID. This probably means that your kernel is too\n"
> -@@ -4187,7 +4187,7 @@ static int setup_uid_map(
> +@@ -4211,7 +4211,7 @@ static int setup_uid_map(
>                   return log_oom();
>   
>           xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
> @@ -304,7 +308,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0)
>                   return log_error_errno(r, "Failed to write UID map: %m");
>   
> -@@ -4197,7 +4197,7 @@ static int setup_uid_map(
> +@@ -4221,7 +4221,7 @@ static int setup_uid_map(
>                   return log_oom();
>   
>           xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
> @@ -313,20 +317,24 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0)
>                   return log_error_errno(r, "Failed to write GID map: %m");
>   
> +diff --git a/src/shared/binfmt-util.c b/src/shared/binfmt-util.c
> +index a26175474b..1413a9c72c 100644
>  --- a/src/shared/binfmt-util.c
>  +++ b/src/shared/binfmt-util.c
> -@@ -26,7 +26,7 @@ int disable_binfmt(void) {
> -         if (r < 0)
> -                 return log_warning_errno(r, "Failed to determine whether binfmt_misc is mounted: %m");
> +@@ -46,7 +46,7 @@ int disable_binfmt(void) {
> +                 return 0;
> +         }
>   
>  -        r = write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", WRITE_STRING_FILE_DISABLE_BUFFER);
>  +        r = write_string_file("/proc/sys/fs/binfmt_misc/status", "-1", 0);
>           if (r < 0)
>                   return log_warning_errno(r, "Failed to unregister binfmt_misc entries: %m");
>   
> +diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
> +index 2ea83f05d3..8626bb184c 100644
>  --- a/src/shared/cgroup-setup.c
>  +++ b/src/shared/cgroup-setup.c
> -@@ -350,7 +350,7 @@ int cg_attach(const char *controller, co
> +@@ -350,7 +350,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
>   
>           xsprintf(c, PID_FMT "\n", pid);
>   
> @@ -344,18 +352,24 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>                           if (r < 0) {
>                                   log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
>                                                   FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
> +diff --git a/src/shared/coredump-util.c b/src/shared/coredump-util.c
> +index 3d2f179049..c1b6c170ac 100644
>  --- a/src/shared/coredump-util.c
>  +++ b/src/shared/coredump-util.c
> -@@ -70,5 +70,5 @@ int set_coredump_filter(uint64_t value)
> +@@ -71,7 +71,7 @@ int set_coredump_filter(uint64_t value) {
>           sprintf(t, "0x%"PRIx64, value);
>   
>           return write_string_file("/proc/self/coredump_filter", t,
>  -                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE|WRITE_STRING_FILE_DISABLE_BUFFER);
> -+                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE);
> ++                                 0);
>   }
> + 
> + /* Turn off core dumps but only if we're running outside of a container. */
> +diff --git a/src/shared/smack-util.c b/src/shared/smack-util.c
> +index b3b5c905ad..bbfa1973fd 100644
>  --- a/src/shared/smack-util.c
>  +++ b/src/shared/smack-util.c
> -@@ -115,7 +115,7 @@ int mac_smack_apply_pid(pid_t pid, const
> +@@ -115,7 +115,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
>                   return 0;
>   
>           p = procfs_file_alloca(pid, "attr/current");
> @@ -364,9 +378,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0)
>                   return r;
>   
> +diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
> +index 765dd4974f..cd6afb001b 100644
>  --- a/src/sleep/sleep.c
>  +++ b/src/sleep/sleep.c
> -@@ -50,7 +50,7 @@ static int write_hibernate_location_info
> +@@ -50,7 +50,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
>           assert(hibernate_location->swap);
>   
>           xsprintf(resume_str, "%u:%u", major(hibernate_location->devno), minor(hibernate_location->devno));
> @@ -375,7 +391,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0)
>                   return log_debug_errno(r, "Failed to write partition device to /sys/power/resume for '%s': '%s': %m",
>                                          hibernate_location->swap->device, resume_str);
> -@@ -77,7 +77,7 @@ static int write_hibernate_location_info
> +@@ -77,7 +77,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
>           }
>   
>           xsprintf(offset_str, "%" PRIu64, hibernate_location->offset);
> @@ -393,7 +409,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>                   if (k >= 0)
>                           return 0;
>   
> -@@ -114,7 +114,7 @@ static int write_state(FILE **f, char **
> +@@ -114,7 +114,7 @@ static int write_state(FILE **f, char **states) {
>           STRV_FOREACH(state, states) {
>                   int k;
>   
> @@ -402,9 +418,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>                   if (k >= 0)
>                           return 0;
>                   log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
> +diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
> +index 0ce79f815c..28aab475d0 100644
>  --- a/src/udev/udev-rules.c
>  +++ b/src/udev/udev-rules.c
> -@@ -2354,7 +2354,6 @@ static int udev_rule_apply_token_to_even
> +@@ -2357,7 +2357,6 @@ static int udev_rule_apply_token_to_event(
>                   log_rule_debug(dev, rules, "ATTR '%s' writing '%s'", buf, value);
>                   r = write_string_file(buf, value,
>                                         WRITE_STRING_FILE_VERIFY_ON_FAILURE |
> @@ -412,9 +430,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>                                         WRITE_STRING_FILE_AVOID_NEWLINE |
>                                         WRITE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
>                   if (r < 0)
> +diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
> +index 7d3e9db73f..2d4a0c4c9d 100644
>  --- a/src/vconsole/vconsole-setup.c
>  +++ b/src/vconsole/vconsole-setup.c
> -@@ -108,7 +108,7 @@ static int toggle_utf8_vc(const char *na
> +@@ -108,7 +108,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
>   static int toggle_utf8_sysfs(bool utf8) {
>           int r;
>   
> @@ -423,3 +443,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>           if (r < 0)
>                   return log_warning_errno(r, "Failed to %s sysfs UTF-8 flag: %m", enable_disable(utf8));
>   
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch b/meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usage.patch
> similarity index 94%
> rename from meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
> rename to meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usage.patch
> index 6981d70af0..61545f5778 100644
> --- a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
> +++ b/meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usage.patch
> @@ -1,4 +1,4 @@
> -From 8871f78c559f37169c0cfaf20b0af1dbec0399af Mon Sep 17 00:00:00 2001
> +From a50ec65dbe660421052656dda7499c925005f486 Mon Sep 17 00:00:00 2001
>  From: Scott Murray <scott.murray@konsulko.com>
>  Date: Fri, 13 Sep 2019 19:26:27 -0400
>  Subject: [PATCH] Handle __cpu_mask usage
> @@ -18,7 +18,6 @@ add a typedef to cpu-set-util.h defining __cpu_mask appropriately.
>  Upstream-Status: Inappropriate [musl specific]
>  
>  Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> -
>  ---
>   src/shared/cpu-set-util.h | 2 ++
>   src/test/test-sizeof.c    | 2 +-
> @@ -38,7 +37,7 @@ index 3c63a58826..4c2d4347fc 100644
>   typedef struct CPUSet {
>           cpu_set_t *set;
>  diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
> -index 602772227e..7f1ed19d77 100644
> +index 6cf92bffde..937d26ca55 100644
>  --- a/src/test/test-sizeof.c
>  +++ b/src/test/test-sizeof.c
>  @@ -1,6 +1,5 @@
> @@ -56,3 +55,6 @@ index 602772227e..7f1ed19d77 100644
>   
>   /* Print information about various types. Useful when diagnosing
>    * gcc diagnostics on an unfamiliar architecture. */
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0023-Handle-missing-gshadow.patch
> similarity index 85%
> rename from meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
> rename to meta/recipes-core/systemd/systemd/0023-Handle-missing-gshadow.patch
> index 45778541c3..7da8798ebc 100644
> --- a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
> +++ b/meta/recipes-core/systemd/systemd/0023-Handle-missing-gshadow.patch
> @@ -1,4 +1,4 @@
> -From ec519727bb1ceda6e7787ccf86237a6aad07137c Mon Sep 17 00:00:00 2001
> +From ebf0f69d8614b8d86a971b97ff0d847d1e5d47c9 Mon Sep 17 00:00:00 2001
>  From: Alex Kiernan <alex.kiernan@gmail.com>
>  Date: Tue, 10 Mar 2020 11:05:20 +0000
>  Subject: [PATCH] Handle missing gshadow
> @@ -10,13 +10,14 @@ Upstream-Status: Inappropriate [musl specific]
>  Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>  [Rebased for v247]
>  Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> -
>  ---
>   src/shared/user-record-nss.c | 20 ++++++++++++++++++++
>   src/shared/user-record-nss.h |  4 ++++
>   src/shared/userdb.c          |  7 ++++++-
>   3 files changed, 30 insertions(+), 1 deletion(-)
>  
> +diff --git a/src/shared/user-record-nss.c b/src/shared/user-record-nss.c
> +index 88b8fc2f8f..a819d41bac 100644
>  --- a/src/shared/user-record-nss.c
>  +++ b/src/shared/user-record-nss.c
>  @@ -331,8 +331,10 @@ int nss_group_to_group_record(
> @@ -46,7 +47,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   
>           r = json_build(&g->json, JSON_BUILD_OBJECT(
>                                          JSON_BUILD_PAIR("groupName", JSON_BUILD_STRING(g->group_name)),
> -@@ -388,6 +392,7 @@ int nss_sgrp_for_group(const struct grou
> +@@ -388,6 +392,7 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
>           assert(ret_sgrp);
>           assert(ret_buffer);
>   
> @@ -54,7 +55,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>           for (;;) {
>                   _cleanup_free_ char *buf = NULL;
>                   struct sgrp sgrp, *result;
> -@@ -416,6 +421,9 @@ int nss_sgrp_for_group(const struct grou
> +@@ -416,6 +421,9 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
>                   buflen *= 2;
>                   buf = mfree(buf);
>           }
> @@ -120,6 +121,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>           if (r < 0)
>                   return r;
>   
> +diff --git a/src/shared/user-record-nss.h b/src/shared/user-record-nss.h
> +index 22ab04d6ee..4e52e7a911 100644
>  --- a/src/shared/user-record-nss.h
>  +++ b/src/shared/user-record-nss.h
>  @@ -2,7 +2,11 @@
> @@ -134,9 +137,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>   #include <pwd.h>
>   #include <shadow.h>
>   
> +diff --git a/src/shared/userdb.c b/src/shared/userdb.c
> +index a77eff4407..955e361d3a 100644
>  --- a/src/shared/userdb.c
>  +++ b/src/shared/userdb.c
> -@@ -1044,13 +1044,15 @@ int groupdb_iterator_get(UserDBIterator
> +@@ -1044,13 +1044,15 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
>                   if (gr) {
>                           _cleanup_free_ char *buffer = NULL;
>                           bool incomplete = false;
> @@ -153,7 +158,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>                           if (!FLAGS_SET(iterator->flags, USERDB_SUPPRESS_SHADOW)) {
>                                   r = nss_sgrp_for_group(gr, &sgrp, &buffer);
>                                   if (r < 0) {
> -@@ -1063,6 +1065,9 @@ int groupdb_iterator_get(UserDBIterator
> +@@ -1063,6 +1065,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
>                           }
>   
>                           r = nss_group_to_group_record(gr, r >= 0 ? &sgrp : NULL, ret);
> @@ -163,3 +168,6 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>                           if (r < 0)
>                                   return r;
>   
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0024-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
> similarity index 89%
> rename from meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
> rename to meta/recipes-core/systemd/systemd/0024-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
> index 6c97a272e2..15ff6eb4f8 100644
> --- a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
> +++ b/meta/recipes-core/systemd/systemd/0024-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
> @@ -1,4 +1,4 @@
> -From 754a16eeb255c06dbdd4655632276573f0f075ec Mon Sep 17 00:00:00 2001
> +From a2f56a2a6cdd5137bb1e680aa9f6c40540107166 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 12 Apr 2021 23:44:53 -0700
>  Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
> @@ -10,14 +10,13 @@ them here in case they are undefined
>  Upstream-Status: Pending
>  
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
>  ---
>   src/basic/missing_syscall.h  | 6 ++++++
>   src/shared/base-filesystem.c | 1 +
>   2 files changed, 7 insertions(+)
>  
>  diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
> -index 793d111c55..9665848b88 100644
> +index 98cd037962..ea6a76c2e2 100644
>  --- a/src/basic/missing_syscall.h
>  +++ b/src/basic/missing_syscall.h
>  @@ -20,6 +20,12 @@
> @@ -34,7 +33,7 @@ index 793d111c55..9665848b88 100644
>   #include "missing_keyctl.h"
>   #include "missing_stat.h"
>  diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
> -index d396bc99fe..7e9c0c3412 100644
> +index 2726dc946a..484f63e0b4 100644
>  --- a/src/shared/base-filesystem.c
>  +++ b/src/shared/base-filesystem.c
>  @@ -19,6 +19,7 @@
> @@ -45,3 +44,6 @@ index d396bc99fe..7e9c0c3412 100644
>   
>   typedef struct BaseFilesystem {
>           const char *dir;      /* directory or symlink to create */
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/fix-32bit.patch b/meta/recipes-core/systemd/systemd/0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch
> similarity index 93%
> rename from meta/recipes-core/systemd/systemd/fix-32bit.patch
> rename to meta/recipes-core/systemd/systemd/0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch
> index 6b614625c8..d840de870f 100644
> --- a/meta/recipes-core/systemd/systemd/fix-32bit.patch
> +++ b/meta/recipes-core/systemd/systemd/0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch
> @@ -1,4 +1,4 @@
> -From c63bfd0884cf20e48befbee49d41f667660a8802 Mon Sep 17 00:00:00 2001
> +From fad29ce1f5cc7b12bc13671d9ad80775771a67eb Mon Sep 17 00:00:00 2001
>  From: Frantisek Sumsal <frantisek@sumsal.cz>
>  Date: Fri, 3 Mar 2023 12:17:27 +0100
>  Subject: [PATCH] systemctl: explicitly cast the constants to uint64_t
> @@ -27,7 +27,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/src/systemctl/systemctl-enable.c b/src/systemctl/systemctl-enable.c
> -index 4ebe5888ac69..a9c6f3a742c9 100644
> +index 86d9f602fa..f94a286122 100644
>  --- a/src/systemctl/systemctl-enable.c
>  +++ b/src/systemctl/systemctl-enable.c
>  @@ -211,7 +211,7 @@ int verb_enable(int argc, char *argv[], void *userdata) {
> @@ -39,3 +39,6 @@ index 4ebe5888ac69..a9c6f3a742c9 100644
>                           else
>                                   r = sd_bus_message_append(m, "b", arg_runtime);
>                           if (r < 0)
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch b/meta/recipes-core/systemd/systemd/0026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
> similarity index 82%
> rename from meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
> rename to meta/recipes-core/systemd/systemd/0026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
> index 43173ac32d..c7e2280c3b 100644
> --- a/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
> +++ b/meta/recipes-core/systemd/systemd/0026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
> @@ -1,4 +1,4 @@
> -From a4ff7772acf1d983921833aa20ccd7c4d5e59a1c Mon Sep 17 00:00:00 2001
> +From 34072f456b4fe880fbb2f18760b64a1a6c1eebb8 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex@linutronix.de>
>  Date: Mon, 6 Mar 2023 15:24:49 +0100
>  Subject: [PATCH] src/boot/efi/efi-string.c: define wchar_t from __WCHAR_TYPE__
> @@ -18,9 +18,11 @@ however this will not be backported to v253 and we need a different fix.
>  Upstream-Status: Inappropriate [fixed differently in trunk according to https://github.com/systemd/systemd/pull/26689]
>  Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>  ---
> - src/boot/efi/efi-string.c | 5 +++++
> - 1 file changed, 5 insertions(+)
> + src/boot/efi/efi-string.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
>  
> +diff --git a/src/boot/efi/efi-string.c b/src/boot/efi/efi-string.c
> +index 22923d60f6..5d09d4281f 100644
>  --- a/src/boot/efi/efi-string.c
>  +++ b/src/boot/efi/efi-string.c
>  @@ -2,7 +2,13 @@
> @@ -37,3 +39,6 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>   
>   #include "efi-string.h"
>   
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-core/systemd/systemd_253.1.bb b/meta/recipes-core/systemd/systemd_253.1.bb
> index 1d4e0e71e2..9c2b96d3c1 100644
> --- a/meta/recipes-core/systemd/systemd_253.1.bb
> +++ b/meta/recipes-core/systemd/systemd_253.1.bb
> @@ -22,35 +22,35 @@ SRC_URI += " \
>             file://init \
>             file://99-default.preset \
>             file://systemd-pager.sh \
> -           file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
> -           file://0003-implment-systemd-sysv-install-for-OE.patch \
> -           file://0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
> +           file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
> +           file://0008-implment-systemd-sysv-install-for-OE.patch \
> +           file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
>             "
>  
>  # patches needed by musl
>  SRC_URI:append:libc-musl = " ${SRC_URI_MUSL}"
>  SRC_URI_MUSL = "\
> -               file://0003-missing_type.h-add-comparison_fn_t.patch \
> -               file://0004-add-fallback-parse_printf_format-implementation.patch \
> -               file://0005-src-basic-missing.h-check-for-missing-strndupa.patch \
> -               file://0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
> -               file://0008-add-missing-FTW_-macros-for-musl.patch \
> -               file://0010-Use-uintmax_t-for-handling-rlim_t.patch \
> -               file://0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
> -               file://0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
> -               file://0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
> -               file://0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch \
> -               file://0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch \
> -               file://0018-avoid-redefinition-of-prctl_mm_map-structure.patch \
> -               file://0022-do-not-disable-buffer-in-writing-files.patch \
> -               file://0025-Handle-__cpu_mask-usage.patch \
> -               file://0026-Handle-missing-gshadow.patch \
> -               file://0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch \
> -               file://0001-pass-correct-parameters-to-getdents64.patch \
> -               file://0002-Add-sys-stat.h-for-S_IFDIR.patch \
> +               file://0009-missing_type.h-add-comparison_fn_t.patch \
> +               file://0010-add-fallback-parse_printf_format-implementation.patch \
> +               file://0011-src-basic-missing.h-check-for-missing-strndupa.patch \
> +               file://0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
> +               file://0013-add-missing-FTW_-macros-for-musl.patch \
> +               file://0014-Use-uintmax_t-for-handling-rlim_t.patch \
> +               file://0015-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
> +               file://0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
> +               file://0017-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
> +               file://0018-Do-not-disable-buffering-when-writing-to-oom_score_a.patch \
> +               file://0019-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch \
> +               file://0020-avoid-redefinition-of-prctl_mm_map-structure.patch \
> +               file://0021-do-not-disable-buffer-in-writing-files.patch \
> +               file://0022-Handle-__cpu_mask-usage.patch \
> +               file://0023-Handle-missing-gshadow.patch \
> +               file://0024-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch \
> +               file://0005-pass-correct-parameters-to-getdents64.patch \
> +               file://0007-Add-sys-stat.h-for-S_IFDIR.patch \
>                 file://0001-Adjust-for-musl-headers.patch \
> -               file://0001-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch \
> -               file://0001-errno-util-Make-STRERROR-portable-for-musl.patch \
> +               file://0006-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch \
> +               file://0003-errno-util-Make-STRERROR-portable-for-musl.patch \
>                 "
>  
>  PAM_PLUGINS = " \
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178851): https://lists.openembedded.org/g/openembedded-core/message/178851
> Mute This Topic: https://lists.openembedded.org/mt/97750305/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

