Return-Path: <yuka@yuka.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C80C6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 05:53:41 +0000 (UTC)
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
 by mx.groups.io with SMTP id smtpd.web10.36322.1679464418864118375
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 22:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@yuka.dev header.s=mail header.b=jAWh4Zf1;
 spf=pass (domain: yuka.dev, ip: 195.39.247.168, mailfrom: yuka@yuka.dev)
Date: Wed, 22 Mar 2023 06:53:30 +0100 (GMT+01:00)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yuka.dev; s=mail;
	t=1679464412; bh=OFPiOsx4kCkYChDs5XSicUH0yOQgMXK5zs96K0eFvOo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=jAWh4Zf1GfO42ezOrhVsQ5nJgc6E68fGlXhUx7+TRp3k2OTz//jlnJj7adpew6cTp
	 6OgFqWL6V6JYugBUxnSfdn8LAqYyxNcHFZnKT5oDDbEET/A3EBDJJJ68QK+Ll1Nuac
	 5nfcCG8eeh/itKO8c24FbKHRrEx1ZtbtoDeRAnTU=
From: Yureka <yuka@yuka.dev>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <73cf2d5f-618b-4c85-9f16-070340cb0284@yuka.dev>
In-Reply-To: <20230321220931bdb5b81e@mail.local>
References: <20230321074625.4086921-1-yuka@yuka.dev> <20230321220931bdb5b81e@mail.local>
Subject: Re: [OE-core] [PATCH] systemd: rebase musl patches
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <73cf2d5f-618b-4c85-9f16-070340cb0284@yuka.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 05:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178914

The patches that are currently in the repo apply to systemd v252.6 but not =
to systemd v253.1.
While rebasing them I had to resolve multiple conflicts manually.

Mar 21, 2023 23:09:38 Alexandre Belloni <alexandre.belloni@bootlin.com>:

> Hello,
>=20
> The question is why is this necessary, I don't think there is any fuzz
> when applying those patches?
>=20
> On 21/03/2023 08:46:25+0100, Yureka via lists.openembedded.org wrote:
>> Signed-off-by: Yureka Lilian <yuka@yuka.dev>
>> ---
>> meta/recipes-core/systemd/systemd.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
>> .../0001-Adjust-for-musl-headers.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 82 ++++++++-
>> ...all-dependency-links-at-install-tim.patch} |=C2=A0 14 +-
>> ...til-Make-STRERROR-portable-for-musl.patch} |=C2=A0=C2=A0 4 +-
>> ...ysctl.d-binfmt.d-modules-load.d-to-.patch} |=C2=A0=C2=A0 8 +-
>> ...ss-correct-parameters-to-getdents64.patch} |=C2=A0 10 +-
>> ...rerror-is-assumed-to-be-GNU-specifi.patch} |=C2=A0 20 ++-
>> ... =3D> 0007-Add-sys-stat.h-for-S_IFDIR.patch} |=C2=A0=C2=A0 8 +-
>> ...mplment-systemd-sysv-install-for-OE.patch} |=C2=A0=C2=A0 8 +-
>> ...-missing_type.h-add-comparison_fn_t.patch} |=C2=A0=C2=A0 8 +-
>> ...-parse_printf_format-implementation.patch} |=C2=A0 31 +++-
>> ...issing.h-check-for-missing-strndupa.patch} | 169 ++++++++++++++----
>> ...B_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} |=C2=A0 22 ++-
>> ...13-add-missing-FTW_-macros-for-musl.patch} |=C2=A0=C2=A0 6 +-
>> ...4-Use-uintmax_t-for-handling-rlim_t.patch} |=C2=A0 20 ++-
>> ...able-tests-for-missing-typedefs-in-.patch} |=C2=A0=C2=A0 8 +-
>> ..._SYMLINK_NOFOLLOW-flag-to-faccessat.patch} |=C2=A0 18 +-
>> ...atible-basename-for-non-glibc-syste.patch} |=C2=A0=C2=A0 8 +-
>> ...ffering-when-writing-to-oom_score_a.patch} |=C2=A0 10 +-
>> ...ompliant-strerror_r-from-GNU-specif.patch} |=C2=A0 22 ++-
>> ...efinition-of-prctl_mm_map-structure.patch} |=C2=A0=C2=A0 6 +-
>> ...not-disable-buffer-in-writing-files.patch} | 139 ++++++++------
>> ...tch =3D> 0022-Handle-__cpu_mask-usage.patch} |=C2=A0=C2=A0 8 +-
>> ...atch =3D> 0023-Handle-missing-gshadow.patch} |=C2=A0 20 ++-
>> ....h-Define-MIPS-ABI-defines-for-musl.patch} |=C2=A0 10 +-
>> ...itly-cast-the-constants-to-uint64_t.patch} |=C2=A0=C2=A0 7 +-
>> ...string.c-define-wchar_t-from-__WCHA.patch} |=C2=A0 11 +-
>> meta/recipes-core/systemd/systemd_253.1.bb=C2=A0=C2=A0=C2=A0 |=C2=A0 46 =
++---
>> 28 files changed, 513 insertions(+), 214 deletions(-)
>> rename meta/recipes-core/systemd/systemd/{0001-binfmt-Don-t-install-depe=
ndency-links-at-install-tim.patch =3D> 0002-binfmt-Don-t-install-dependency=
-links-at-install-tim.patch} (93%)
>> rename meta/recipes-core/systemd/systemd/{0001-errno-util-Make-STRERROR-=
portable-for-musl.patch =3D> 0003-errno-util-Make-STRERROR-portable-for-mus=
l.patch} (95%)
>> rename meta/recipes-core/systemd/systemd/{0001-Move-sysusers.d-sysctl.d-=
binfmt.d-modules-load.d-to-.patch =3D> 0004-Move-sysusers.d-sysctl.d-binfmt=
.d-modules-load.d-to-.patch} (95%)
>> rename meta/recipes-core/systemd/systemd/{0001-pass-correct-parameters-t=
o-getdents64.patch =3D> 0005-pass-correct-parameters-to-getdents64.patch} (=
91%)
>> rename meta/recipes-core/systemd/systemd/{0001-test-bus-error-strerror-i=
s-assumed-to-be-GNU-specifi.patch =3D> 0006-test-bus-error-strerror-is-assu=
med-to-be-GNU-specifi.patch} (69%)
>> rename meta/recipes-core/systemd/systemd/{0002-Add-sys-stat.h-for-S_IFDI=
R.patch =3D> 0007-Add-sys-stat.h-for-S_IFDIR.patch} (80%)
>> rename meta/recipes-core/systemd/systemd/{0003-implment-systemd-sysv-ins=
tall-for-OE.patch =3D> 0008-implment-systemd-sysv-install-for-OE.patch} (92=
%)
>> rename meta/recipes-core/systemd/systemd/{0003-missing_type.h-add-compar=
ison_fn_t.patch =3D> 0009-missing_type.h-add-comparison_fn_t.patch} (92%)
>> rename meta/recipes-core/systemd/systemd/{0004-add-fallback-parse_printf=
_format-implementation.patch =3D> 0010-add-fallback-parse_printf_format-imp=
lementation.patch} (93%)
>> rename meta/recipes-core/systemd/systemd/{0005-src-basic-missing.h-check=
-for-missing-strndupa.patch =3D> 0011-src-basic-missing.h-check-for-missing=
-strndupa.patch} (72%)
>> rename meta/recipes-core/systemd/systemd/{0007-don-t-fail-if-GLOB_BRACE-=
and-GLOB_ALTDIRFUNC-is-not-.patch =3D> 0012-don-t-fail-if-GLOB_BRACE-and-GL=
OB_ALTDIRFUNC-is-not-.patch} (87%)
>> rename meta/recipes-core/systemd/systemd/{0008-add-missing-FTW_-macros-f=
or-musl.patch =3D> 0013-add-missing-FTW_-macros-for-musl.patch} (93%)
>> rename meta/recipes-core/systemd/systemd/{0010-Use-uintmax_t-for-handlin=
g-rlim_t.patch =3D> 0014-Use-uintmax_t-for-handling-rlim_t.patch} (85%)
>> rename meta/recipes-core/systemd/systemd/{0011-test-sizeof.c-Disable-tes=
ts-for-missing-typedefs-in-.patch =3D> 0015-test-sizeof.c-Disable-tests-for=
-missing-typedefs-in-.patch} (89%)
>> rename meta/recipes-core/systemd/systemd/{0012-don-t-pass-AT_SYMLINK_NOF=
OLLOW-flag-to-faccessat.patch =3D> 0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag=
-to-faccessat.patch} (87%)
>> rename meta/recipes-core/systemd/systemd/{0013-Define-glibc-compatible-b=
asename-for-non-glibc-syste.patch =3D> 0017-Define-glibc-compatible-basenam=
e-for-non-glibc-syste.patch} (81%)
>> rename meta/recipes-core/systemd/systemd/{0014-Do-not-disable-buffering-=
when-writing-to-oom_score_a.patch =3D> 0018-Do-not-disable-buffering-when-w=
riting-to-oom_score_a.patch} (83%)
>> rename meta/recipes-core/systemd/systemd/{0015-distinguish-XSI-compliant=
-strerror_r-from-GNU-specif.patch =3D> 0019-distinguish-XSI-compliant-strer=
ror_r-from-GNU-specif.patch} (70%)
>> rename meta/recipes-core/systemd/systemd/{0018-avoid-redefinition-of-prc=
tl_mm_map-structure.patch =3D> 0020-avoid-redefinition-of-prctl_mm_map-stru=
cture.patch} (91%)
>> rename meta/recipes-core/systemd/systemd/{0022-do-not-disable-buffer-in-=
writing-files.patch =3D> 0021-do-not-disable-buffer-in-writing-files.patch}=
 (78%)
>> rename meta/recipes-core/systemd/systemd/{0025-Handle-__cpu_mask-usage.p=
atch =3D> 0022-Handle-__cpu_mask-usage.patch} (94%)
>> rename meta/recipes-core/systemd/systemd/{0026-Handle-missing-gshadow.pa=
tch =3D> 0023-Handle-missing-gshadow.patch} (85%)
>> rename meta/recipes-core/systemd/systemd/{0028-missing_syscall.h-Define-=
MIPS-ABI-defines-for-musl.patch =3D> 0024-missing_syscall.h-Define-MIPS-ABI=
-defines-for-musl.patch} (89%)
>> rename meta/recipes-core/systemd/systemd/{fix-32bit.patch =3D> 0025-syst=
emctl-explicitly-cast-the-constants-to-uint64_t.patch} (93%)
>> rename meta/recipes-core/systemd/systemd/{0004-src-boot-efi-efi-string.c=
-define-wchar_t-from-__WCHA.patch =3D> 0026-src-boot-efi-efi-string.c-defin=
e-wchar_t-from-__WCHA.patch} (82%)
>>=20
>> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/s=
ystemd/systemd.inc
>> index 354cc46e90..14608f9abc 100644
>> --- a/meta/recipes-core/systemd/systemd.inc
>> +++ b/meta/recipes-core/systemd/systemd.inc
>> @@ -17,8 +17,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419=
260aa954499f7abaabaa882bbe \
>> SRCREV =3D "6c327d74aa0d350482e82a247d7018559699798d"
>> SRCBRANCH =3D "v253-stable"
>> SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dhttp=
s;branch=3D${SRCBRANCH} \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://000=
4-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://fix=
-32bit.patch \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://002=
6-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://002=
5-systemctl-explicitly-cast-the-constants-to-uint64_t.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>=20
>> S =3D "${WORKDIR}/git"
>> diff --git a/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-head=
ers.patch b/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.=
patch
>> index 6496280dda..5e9646c569 100644
>> --- a/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.pat=
ch
>> +++ b/meta/recipes-core/systemd/systemd/0001-Adjust-for-musl-headers.pat=
ch
>> @@ -1,4 +1,4 @@
>> -From 9a1841402ce3ef21a10a7314a07a615f8196d406 Mon Sep 17 00:00:00 2001
>> +From e5f067cb3dc845dd865e450f4e64077b28feb4c0 Mon Sep 17 00:00:00 2001
>> From: Khem Raj <raj.khem@gmail.com>
>> Date: Fri, 21 Jan 2022 22:19:37 -0800
>> Subject: [PATCH] Adjust for musl headers
>> @@ -6,7 +6,6 @@ Subject: [PATCH] Adjust for musl headers
>> Upstream-Status: Inappropriate [musl specific]
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>> ---
>> =C2=A0 src/libsystemd-network/sd-dhcp6-client.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 +-
>> =C2=A0 src/network/netdev/bareudp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>> @@ -47,6 +46,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 src/udev/udev-builtin-net_id.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>> =C2=A0 37 files changed, 44 insertions(+), 42 deletions(-)
>>=20
>> +diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-=
network/sd-dhcp6-client.c
>> +index 57dd91f81f..2b7f4fa3a7 100644
>> --- a/src/libsystemd-network/sd-dhcp6-client.c
>> +++ b/src/libsystemd-network/sd-dhcp6-client.c
>> @@ -5,7 +5,7 @@
>> @@ -58,6 +59,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 #include <linux/if_infiniband.h>
>> =C2=A0
>> =C2=A0 #include "sd-dhcp6-client.h"
>> +diff --git a/src/network/netdev/bareudp.c b/src/network/netdev/bareudp.=
c
>> +index 24d3afb877..f6241b41ee 100644
>> --- a/src/network/netdev/bareudp.c
>> +++ b/src/network/netdev/bareudp.c
>> @@ -2,7 +2,7 @@
>> @@ -69,6 +72,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "bareudp.h"
>> =C2=A0 #include "netlink-util.h"
>> +diff --git a/src/network/netdev/batadv.c b/src/network/netdev/batadv.c
>> +index 7e97619657..50fcffcfdf 100644
>> --- a/src/network/netdev/batadv.c
>> +++ b/src/network/netdev/batadv.c
>> @@ -3,7 +3,7 @@
>> @@ -80,6 +85,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "batadv.h"
>> =C2=A0 #include "fileio.h"
>> +diff --git a/src/network/netdev/bond.c b/src/network/netdev/bond.c
>> +index 601bff0a9c..dfed8d9e54 100644
>> --- a/src/network/netdev/bond.c
>> +++ b/src/network/netdev/bond.c
>> @@ -1,7 +1,7 @@
>> @@ -91,6 +98,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "alloc-util.h"
>> =C2=A0 #include "bond.h"
>> +diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge.c
>> +index b65c3b49fc..6875b4fbdb 100644
>> --- a/src/network/netdev/bridge.c
>> +++ b/src/network/netdev/bridge.c
>> @@ -2,7 +2,7 @@
>> @@ -102,6 +111,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 #include <linux/if_bridge.h>
>> =C2=A0
>> =C2=A0 #include "bridge.h"
>> +diff --git a/src/network/netdev/dummy.c b/src/network/netdev/dummy.c
>> +index 00df1d2787..77b506b422 100644
>> --- a/src/network/netdev/dummy.c
>> +++ b/src/network/netdev/dummy.c
>> @@ -1,6 +1,6 @@
>> @@ -112,6 +123,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "dummy.h"
>> =C2=A0
>> +diff --git a/src/network/netdev/geneve.c b/src/network/netdev/geneve.c
>> +index 777a32d75c..73bfa2b5c1 100644
>> --- a/src/network/netdev/geneve.c
>> +++ b/src/network/netdev/geneve.c
>> @@ -2,7 +2,7 @@
>> @@ -123,6 +136,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "alloc-util.h"
>> =C2=A0 #include "conf-parser.h"
>> +diff --git a/src/network/netdev/ifb.c b/src/network/netdev/ifb.c
>> +index d7ff44cb9e..e037629ae4 100644
>> --- a/src/network/netdev/ifb.c
>> +++ b/src/network/netdev/ifb.c
>> @@ -1,7 +1,7 @@
>> @@ -134,6 +149,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "ifb.h"
>> =C2=A0
>> +diff --git a/src/network/netdev/ipoib.c b/src/network/netdev/ipoib.c
>> +index 5dd9286d57..4036d66dad 100644
>> --- a/src/network/netdev/ipoib.c
>> +++ b/src/network/netdev/ipoib.c
>> @@ -1,6 +1,6 @@
>> @@ -144,6 +161,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 #include <linux/if_link.h>
>> =C2=A0
>> =C2=A0 #include "ipoib.h"
>> +diff --git a/src/network/netdev/ipvlan.c b/src/network/netdev/ipvlan.c
>> +index 058eadebd7..c470ebb6d7 100644
>> --- a/src/network/netdev/ipvlan.c
>> +++ b/src/network/netdev/ipvlan.c
>> @@ -2,7 +2,7 @@
>> @@ -155,6 +174,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "conf-parser.h"
>> =C2=A0 #include "ipvlan.h"
>> +diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
>> +index 0da3dd4bd2..eb20f04469 100644
>> --- a/src/network/netdev/macsec.c
>> +++ b/src/network/netdev/macsec.c
>> @@ -1,7 +1,7 @@
>> @@ -166,6 +187,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 #include <linux/if_ether.h>
>> =C2=A0 #include <linux/if_macsec.h>
>> =C2=A0 #include <linux/genetlink.h>
>> +diff --git a/src/network/netdev/macvlan.c b/src/network/netdev/macvlan.=
c
>> +index 1114bb0cb1..6c79a219a4 100644
>> --- a/src/network/netdev/macvlan.c
>> +++ b/src/network/netdev/macvlan.c
>> @@ -2,7 +2,7 @@
>> @@ -177,6 +200,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "conf-parser.h"
>> =C2=A0 #include "macvlan.h"
>> +diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
>> +index 038a27c118..67155f0db7 100644
>> --- a/src/network/netdev/netdev.c
>> +++ b/src/network/netdev/netdev.c
>> @@ -2,7 +2,7 @@
>> @@ -188,6 +213,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 #include <unistd.h>
>> =C2=A0
>> =C2=A0 #include "alloc-util.h"
>> +diff --git a/src/network/netdev/netdevsim.c b/src/network/netdev/netdev=
sim.c
>> +index 15d5c132f9..a3ffa48b15 100644
>> --- a/src/network/netdev/netdevsim.c
>> +++ b/src/network/netdev/netdevsim.c
>> @@ -1,6 +1,6 @@
>> @@ -198,6 +225,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "netdevsim.h"
>> =C2=A0
>> +diff --git a/src/network/netdev/nlmon.c b/src/network/netdev/nlmon.c
>> +index ff372092e6..eef66811f4 100644
>> --- a/src/network/netdev/nlmon.c
>> +++ b/src/network/netdev/nlmon.c
>> @@ -1,6 +1,6 @@
>> @@ -208,6 +237,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "nlmon.h"
>> =C2=A0
>> +diff --git a/src/network/netdev/tunnel.c b/src/network/netdev/tunnel.c
>> +index 2addfeecaa..954987f26d 100644
>> --- a/src/network/netdev/tunnel.c
>> +++ b/src/network/netdev/tunnel.c
>> @@ -2,7 +2,7 @@
>> @@ -219,6 +250,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 #include <linux/if_tunnel.h>
>> =C2=A0 #include <linux/ip.h>
>> =C2=A0 #include <linux/ip6_tunnel.h>
>> +diff --git a/src/network/netdev/vcan.c b/src/network/netdev/vcan.c
>> +index 380547ee1e..137c1adf8a 100644
>> --- a/src/network/netdev/vcan.c
>> +++ b/src/network/netdev/vcan.c
>> @@ -1,6 +1,6 @@
>> @@ -229,6 +262,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "vcan.h"
>> =C2=A0
>> +diff --git a/src/network/netdev/veth.c b/src/network/netdev/veth.c
>> +index fb00e6667f..f52d9ee89a 100644
>> --- a/src/network/netdev/veth.c
>> +++ b/src/network/netdev/veth.c
>> @@ -3,7 +3,7 @@
>> @@ -240,6 +275,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 #include <linux/veth.h>
>> =C2=A0
>> =C2=A0 #include "netlink-util.h"
>> +diff --git a/src/network/netdev/vlan.c b/src/network/netdev/vlan.c
>> +index a3d961dac3..386b567a42 100644
>> --- a/src/network/netdev/vlan.c
>> +++ b/src/network/netdev/vlan.c
>> @@ -2,7 +2,7 @@
>> @@ -251,6 +288,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 #include <linux/if_vlan.h>
>> =C2=A0
>> =C2=A0 #include "parse-util.h"
>> +diff --git a/src/network/netdev/vrf.c b/src/network/netdev/vrf.c
>> +index 05ef3ff13d..825fc4a398 100644
>> --- a/src/network/netdev/vrf.c
>> +++ b/src/network/netdev/vrf.c
>> @@ -2,7 +2,7 @@
>> @@ -262,6 +301,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "vrf.h"
>> =C2=A0
>> +diff --git a/src/network/netdev/vxcan.c b/src/network/netdev/vxcan.c
>> +index 83269b0707..39c6dbe29c 100644
>> --- a/src/network/netdev/vxcan.c
>> +++ b/src/network/netdev/vxcan.c
>> @@ -1,7 +1,7 @@
>> @@ -273,6 +314,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "vxcan.h"
>> =C2=A0
>> +diff --git a/src/network/netdev/vxlan.c b/src/network/netdev/vxlan.c
>> +index 589161938a..0ec9625b7a 100644
>> --- a/src/network/netdev/vxlan.c
>> +++ b/src/network/netdev/vxlan.c
>> @@ -2,7 +2,7 @@
>> @@ -284,6 +327,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "conf-parser.h"
>> =C2=A0 #include "alloc-util.h"
>> +diff --git a/src/network/netdev/wireguard.c b/src/network/netdev/wiregu=
ard.c
>> +index 51e7e02990..fc36c0623a 100644
>> --- a/src/network/netdev/wireguard.c
>> +++ b/src/network/netdev/wireguard.c
>> @@ -6,7 +6,7 @@
>> @@ -295,6 +340,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 #include <linux/ipv6_route.h>
>> =C2=A0
>> =C2=A0 #include "sd-resolve.h"
>> +diff --git a/src/network/netdev/xfrm.c b/src/network/netdev/xfrm.c
>> +index a961d8fef2..6c1815b257 100644
>> --- a/src/network/netdev/xfrm.c
>> +++ b/src/network/netdev/xfrm.c
>> @@ -1,6 +1,6 @@
>> @@ -305,6 +352,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "missing_network.h"
>> =C2=A0 #include "xfrm.h"
>> +diff --git a/src/network/networkd-bridge-mdb.c b/src/network/networkd-b=
ridge-mdb.c
>> +index bd1a9745dc..949d3da029 100644
>> --- a/src/network/networkd-bridge-mdb.c
>> +++ b/src/network/networkd-bridge-mdb.c
>> @@ -1,7 +1,5 @@
>> @@ -324,6 +373,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #define STATIC_BRIDGE_MDB_ENTRIES_PER_NETWORK_MAX 1024U
>> =C2=A0
>> +diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-=
dhcp-common.c
>> +index ca9a825e7b..8735e261ad 100644
>> --- a/src/network/networkd-dhcp-common.c
>> +++ b/src/network/networkd-dhcp-common.c
>> @@ -1,7 +1,8 @@
>> @@ -336,6 +387,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "bus-error.h"
>> =C2=A0 #include "bus-locator.h"
>> +diff --git a/src/network/networkd-dhcp-prefix-delegation.c b/src/networ=
k/networkd-dhcp-prefix-delegation.c
>> +index 66c5e979d9..581b6b8c29 100644
>> --- a/src/network/networkd-dhcp-prefix-delegation.c
>> +++ b/src/network/networkd-dhcp-prefix-delegation.c
>> @@ -1,7 +1,5 @@
>> @@ -355,6 +408,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 bool link_dhcp_pd_is_enabled(Link *link) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert(link);
>> =C2=A0
>> +diff --git a/src/network/networkd-dhcp-server.c b/src/network/networkd-=
dhcp-server.c
>> +index 620fbbddc7..c8af20fb34 100644
>> --- a/src/network/networkd-dhcp-server.c
>> +++ b/src/network/networkd-dhcp-server.c
>> @@ -1,7 +1,7 @@
>> @@ -366,6 +421,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 #include <linux/if.h>
>> =C2=A0
>> =C2=A0 #include "sd-dhcp-server.h"
>> +diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.=
c
>> +index d4b4942173..3d78da5609 100644
>> --- a/src/network/networkd-dhcp4.c
>> +++ b/src/network/networkd-dhcp4.c
>> @@ -3,7 +3,7 @@
>> @@ -377,6 +434,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "alloc-util.h"
>> =C2=A0 #include "dhcp-client-internal.h"
>> +diff --git a/src/network/networkd-ipv6ll.c b/src/network/networkd-ipv6l=
l.c
>> +index 32229a3fc7..662a345d6e 100644
>> --- a/src/network/networkd-ipv6ll.c
>> +++ b/src/network/networkd-ipv6ll.c
>> @@ -1,7 +1,7 @@
>> @@ -388,6 +447,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "in-addr-util.h"
>> =C2=A0 #include "networkd-address.h"
>> +diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
>> +index 019bef0590..657fc41ae6 100644
>> --- a/src/network/networkd-link.c
>> +++ b/src/network/networkd-link.c
>> @@ -3,7 +3,7 @@
>> @@ -399,6 +460,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 #include <linux/if_link.h>
>> =C2=A0 #include <linux/netdevice.h>
>> =C2=A0 #include <sys/socket.h>
>> +diff --git a/src/network/networkd-ndisc.c b/src/network/networkd-ndisc.=
c
>> +index 99a07e16fc..e51cd81d96 100644
>> --- a/src/network/networkd-ndisc.c
>> +++ b/src/network/networkd-ndisc.c
>> @@ -6,7 +6,7 @@
>> @@ -410,6 +473,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "sd-ndisc.h"
>> =C2=A0
>> +diff --git a/src/network/networkd-route.c b/src/network/networkd-route.=
c
>> +index 5214a8ad2c..9dd758daae 100644
>> --- a/src/network/networkd-route.c
>> +++ b/src/network/networkd-route.c
>> @@ -1,9 +1,5 @@
>> @@ -433,6 +498,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 int route_new(Route **ret) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _cleanup_(route_f=
reep) Route *route =3D NULL;
>> =C2=A0
>> +diff --git a/src/network/networkd-setlink.c b/src/network/networkd-setl=
ink.c
>> +index 541c4b8a72..06ebda8f0f 100644
>> --- a/src/network/networkd-setlink.c
>> +++ b/src/network/networkd-setlink.c
>> @@ -2,7 +2,7 @@
>> @@ -444,6 +511,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 #include <linux/if_bridge.h>
>> =C2=A0
>> =C2=A0 #include "missing_network.h"
>> +diff --git a/src/shared/linux/ethtool.h b/src/shared/linux/ethtool.h
>> +index 1458de3627..d5c2d2e0ac 100644
>> --- a/src/shared/linux/ethtool.h
>> +++ b/src/shared/linux/ethtool.h
>> @@ -16,7 +16,8 @@
>> @@ -454,8 +523,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +#include <netinet/if_ether.h>
>> +//#include <linux/if_ether.h>
>> =C2=A0
>> - #ifndef __KERNEL__
>> =C2=A0 #include <limits.h> /* for INT_MAX */
>> +
>> +diff --git a/src/shared/netif-util.c b/src/shared/netif-util.c
>> +index f56c5646c1..5af28ff119 100644
>> --- a/src/shared/netif-util.c
>> +++ b/src/shared/netif-util.c
>> @@ -1,7 +1,7 @@
>> @@ -467,6 +538,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 #include "arphrd-util.h"
>> =C2=A0 #include "device-util.h"
>> +diff --git a/src/udev/udev-builtin-net_id.c b/src/udev/udev-builtin-net=
_id.c
>> +index a48d5dedf8..31a8bc1b3c 100644
>> --- a/src/udev/udev-builtin-net_id.c
>> +++ b/src/udev/udev-builtin-net_id.c
>> @@ -18,7 +18,7 @@
>> @@ -478,3 +551,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 #include <linux/netdevice.h>
>> =C2=A0 #include <linux/pci_regs.h>
>> =C2=A0
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install=
-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/=
0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>> similarity index 93%
>> rename from meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-=
dependency-links-at-install-tim.patch
>> rename to meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-de=
pendency-links-at-install-tim.patch
>> index 2a033b134e..43611e65fb 100644
>> --- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-depend=
ency-links-at-install-tim.patch
>> +++ b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-depend=
ency-links-at-install-tim.patch
>> @@ -1,4 +1,4 @@
>> -From f9974d7dc289551bfbf823b716fd32b43c54e465 Mon Sep 17 00:00:00 2001
>> +From ca7d9a8d9c81702af9c599bb79706f12b1a465cf Mon Sep 17 00:00:00 2001
>> From: Chen Qi <Qi.Chen@windriver.com>
>> Date: Thu, 21 Feb 2019 16:23:24 +0800
>> Subject: [PATCH] binfmt: Don't install dependency links at install time =
for
>> @@ -18,7 +18,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> [rebased for systemd 243]
>> Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>> -
>> ---
>> =C2=A0 units/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 6 ++----
>> =C2=A0 units/proc-sys-fs-binfmt_misc.automount | 3 +++
>> @@ -26,7 +25,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com=
>
>> =C2=A0 3 files changed, 9 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/units/meson.build b/units/meson.build
>> -index a9bf28f6d9..11d3644168 100644
>> +index c7939a10f8..219570ab19 100644
>> --- a/units/meson.build
>> +++ b/units/meson.build
>> @@ -62,8 +62,7 @@ units =3D [
>> @@ -39,7 +38,7 @@ index a9bf28f6d9..11d3644168 100644
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ['proc-sys-fs-bin=
fmt_misc.mount',=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'ENABLE_BINFMT'],
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ['reboot.target',=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '',
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'ctrl-alt-d=
el.target' + (with_runlevels ? ' runlevel6.target' : '')],
>> -@@ -186,8 +185,7 @@ in_units =3D [
>> +@@ -185,8 +184,7 @@ in_units =3D [
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ['rescue.service'=
,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ''],
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ['serial-getty@.s=
ervice',=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ''],
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ['systemd-backlig=
ht@.service',=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '=
ENABLE_BACKLIGHT'],
>> @@ -50,7 +49,7 @@ index a9bf28f6d9..11d3644168 100644
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ['systemd-boot-ch=
eck-no-failures.service', ''],
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ['systemd-coredum=
p@.service',=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 'ENABLE_COREDUMP'],
>> diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs=
-binfmt_misc.automount
>> -index 172c8757ab..f65d8930c6 100644
>> +index 6b1bbdc91e..5ec5b8670a 100644
>> --- a/units/proc-sys-fs-binfmt_misc.automount
>> +++ b/units/proc-sys-fs-binfmt_misc.automount
>> @@ -19,3 +19,6 @@ ConditionPathIsReadWrite=3D/proc/sys/
>> @@ -61,7 +60,7 @@ index 172c8757ab..f65d8930c6 100644
>> +[Install]
>> +WantedBy=3Dsysinit.target
>> diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.serv=
ice.in
>> -index 96f595ad72..7c010bb224 100644
>> +index b04412e037..63f116e4fa 100644
>> --- a/units/systemd-binfmt.service.in
>> +++ b/units/systemd-binfmt.service.in
>> @@ -14,6 +14,7 @@ Documentation=3Dhttps://docs.kernel.org/admin-guide/bi=
nfmt-misc.html
>> @@ -79,3 +78,6 @@ index 96f595ad72..7c010bb224 100644
>> +
>> +[Install]
>> +WantedBy=3Dsysinit.target
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0001-errno-util-Make-STRE=
RROR-portable-for-musl.patch b/meta/recipes-core/systemd/systemd/0003-errno=
-util-Make-STRERROR-portable-for-musl.patch
>> similarity index 95%
>> rename from meta/recipes-core/systemd/systemd/0001-errno-util-Make-STRER=
ROR-portable-for-musl.patch
>> rename to meta/recipes-core/systemd/systemd/0003-errno-util-Make-STRERRO=
R-portable-for-musl.patch
>> index 2fb8985ad1..e9e69cb648 100644
>> --- a/meta/recipes-core/systemd/systemd/0001-errno-util-Make-STRERROR-po=
rtable-for-musl.patch
>> +++ b/meta/recipes-core/systemd/systemd/0003-errno-util-Make-STRERROR-po=
rtable-for-musl.patch
>> @@ -1,4 +1,4 @@
>> -From f66b5c802ce0a3310f5580cfc1b02446f8087568 Mon Sep 17 00:00:00 2001
>> +From f629a76e0fba300a9d511614160fee38dd4a5e57 Mon Sep 17 00:00:00 2001
>> From: Khem Raj <raj.khem@gmail.com>
>> Date: Mon, 23 Jan 2023 23:39:46 -0800
>> Subject: [PATCH] errno-util: Make STRERROR portable for musl
>> @@ -38,5 +38,5 @@ index 091f99c590..eb5c1f9961 100644
>> =C2=A0=C2=A0 * Note that we can't use ({ =E2=80=A6 }) to define a tempor=
ary variable, so errnum is
>> =C2=A0=C2=A0 * evaluated twice. */
>> --=20
>> -2.39.1
>> +2.39.2
>>=20
>> diff --git a/meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysc=
tl.d-binfmt.d-modules-load.d-to-.patch b/meta/recipes-core/systemd/systemd/=
0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
>> similarity index 95%
>> rename from meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysct=
l.d-binfmt.d-modules-load.d-to-.patch
>> rename to meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.=
d-binfmt.d-modules-load.d-to-.patch
>> index 0fb6efb469..aa1f3c2e82 100644
>> --- a/meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-bi=
nfmt.d-modules-load.d-to-.patch
>> +++ b/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-bi=
nfmt.d-modules-load.d-to-.patch
>> @@ -1,4 +1,4 @@
>> -From 258af8106cbed6fa53f7bee042bf903e58b57a41 Mon Sep 17 00:00:00 2001
>> +From f75f03ef6bc3554068e456bed227f333d5cb8c34 Mon Sep 17 00:00:00 2001
>> From: Khem Raj <raj.khem@gmail.com>
>> Date: Tue, 29 Sep 2020 18:01:41 -0700
>> Subject: [PATCH] Move sysusers.d/sysctl.d/binfmt.d/modules-load.d to /us=
r
>> @@ -10,7 +10,6 @@ the old /usr/lib is still being used.
>> Upstream-Status: Inappropriate (OE-specific)
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
>> -
>> ---
>> =C2=A0 src/core/systemd.pc.in=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 8 ++++----
>> =C2=A0 src/libsystemd/sd-path/sd-path.c | 8 ++++----
>> @@ -42,7 +41,7 @@ index 693433b34b..8368a3ff02 100644
>> =C2=A0
>> =C2=A0 catalog_dir=3D${prefix}/lib/systemd/catalog
>> diff --git a/src/libsystemd/sd-path/sd-path.c b/src/libsystemd/sd-path/s=
d-path.c
>> -index ac33e349c0..f0615ffb22 100644
>> +index 1af3a36d1d..def502b717 100644
>> --- a/src/libsystemd/sd-path/sd-path.c
>> +++ b/src/libsystemd/sd-path/sd-path.c
>> @@ -362,19 +362,19 @@ static int get_path(uint64_t type, char **buffer, =
const char **ret) {
>> @@ -69,3 +68,6 @@ index ac33e349c0..f0615ffb22 100644
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case SD_PATH_CATA=
LOG:
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0001-pass-correct-paramet=
ers-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0005-pass-corre=
ct-parameters-to-getdents64.patch
>> similarity index 91%
>> rename from meta/recipes-core/systemd/systemd/0001-pass-correct-paramete=
rs-to-getdents64.patch
>> rename to meta/recipes-core/systemd/systemd/0005-pass-correct-parameters=
-to-getdents64.patch
>> index 144314c409..c634d8ec3d 100644
>> --- a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-=
getdents64.patch
>> +++ b/meta/recipes-core/systemd/systemd/0005-pass-correct-parameters-to-=
getdents64.patch
>> @@ -1,4 +1,4 @@
>> -From dab02796780f00d689cc1c7a0ba81abe7c5f28d0 Mon Sep 17 00:00:00 2001
>> +From 17766c64ecc7dedf09ed2d361690fc4eda77bf42 Mon Sep 17 00:00:00 2001
>> From: Khem Raj <raj.khem@gmail.com>
>> Date: Fri, 21 Jan 2022 15:15:11 -0800
>> Subject: [PATCH] pass correct parameters to getdents64
>> @@ -15,16 +15,15 @@ Fixes
>> Upstream-Status: Inappropriate [musl specific]
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
>> -
>> ---
>> =C2=A0 src/basic/recurse-dir.c | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/src/basic/recurse-dir.c b/src/basic/recurse-dir.c
>> -index efa1797b7b..03ff10ebe9 100644
>> +index 5e98b7a5d8..aef065047b 100644
>> --- a/src/basic/recurse-dir.c
>> +++ b/src/basic/recurse-dir.c
>> -@@ -54,7 +54,7 @@ int readdir_all(int dir_fd,
>> +@@ -55,7 +55,7 @@ int readdir_all(int dir_fd,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bs =3D MIN(MALLOC_SIZEOF_SAFE(de) - offsetof=
(DirectoryEntries, buffer), (size_t) SSIZE_MAX);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert(bs > de->buffer_size);
>> =C2=A0
>> @@ -33,3 +32,6 @@ index efa1797b7b..03ff10ebe9 100644
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (n < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return -errno;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (n =3D=3D 0)
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0001-test-bus-error-strer=
ror-is-assumed-to-be-GNU-specifi.patch b/meta/recipes-core/systemd/systemd/=
0006-test-bus-error-strerror-is-assumed-to-be-GNU-specifi.patch
>> similarity index 69%
>> rename from meta/recipes-core/systemd/systemd/0001-test-bus-error-strerr=
or-is-assumed-to-be-GNU-specifi.patch
>> rename to meta/recipes-core/systemd/systemd/0006-test-bus-error-strerror=
-is-assumed-to-be-GNU-specifi.patch
>> index c02d495d31..96322e5a56 100644
>> --- a/meta/recipes-core/systemd/systemd/0001-test-bus-error-strerror-is-=
assumed-to-be-GNU-specifi.patch
>> +++ b/meta/recipes-core/systemd/systemd/0006-test-bus-error-strerror-is-=
assumed-to-be-GNU-specifi.patch
>> @@ -1,15 +1,19 @@
>> -From 5b5675913e2dbe6c5acda935b5814a8991829ec5 Mon Sep 17 00:00:00 2001
>> +From fa598869cca684c001f3dc23ce2198f5a6169e2a Mon Sep 17 00:00:00 2001
>> From: Khem Raj <raj.khem@gmail.com>
>> Date: Tue, 8 Nov 2022 13:31:34 -0800
>> -Subject: [PATCH 2/2] test-bus-error: strerror() is assumed to be GNU sp=
ecific version mark it so
>> +Subject: [PATCH] test-bus-error: strerror() is assumed to be GNU specif=
ic
>> + version mark it so
>>=20
>> Upstream-Status: Inappropriate [Upstream systemd only supports glibc]
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0 src/libsystemd/sd-bus/test-bus-error.c | 2 ++
>> - 1 file changed, 2 insertions(+)
>> + src/test/test-errno-util.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 ++-
>> + 2 files changed, 4 insertions(+), 1 deletion(-)
>>=20
>> +diff --git a/src/libsystemd/sd-bus/test-bus-error.c b/src/libsystemd/sd=
-bus/test-bus-error.c
>> +index a55f3f9856..4123bf3da0 100644
>> --- a/src/libsystemd/sd-bus/test-bus-error.c
>> +++ b/src/libsystemd/sd-bus/test-bus-error.c
>> @@ -99,7 +99,9 @@ TEST(error) {
>> @@ -22,6 +26,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert_se(sd_bus_=
error_has_name(&error, "System.Error.EBUSY"));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert_se(sd_bus_=
error_get_errno(&error) =3D=3D EBUSY);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert_se(sd_bus_=
error_is_set(&error));
>> +diff --git a/src/test/test-errno-util.c b/src/test/test-errno-util.c
>> +index d3d022c33f..74e95c804d 100644
>> --- a/src/test/test-errno-util.c
>> +++ b/src/test/test-errno-util.c
>> @@ -4,7 +4,7 @@
>> @@ -33,10 +39,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 TEST(strerror_not_threadsafe) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Just check tha=
t strerror really is not thread-safe. */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_info("strerro=
r(%d) =E2=86=92 %s", 200, strerror(200));
>> -@@ -46,5 +46,6 @@ TEST(STRERROR_OR_ELSE) {
>> +@@ -46,6 +46,7 @@ TEST(STRERROR_OR_ELSE) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_info("STRERRO=
R_OR_ELSE(EPERM, \"EOF\") =E2=86=92 %s", STRERROR_OR_EOF(EPERM));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_info("STRERRO=
R_OR_ELSE(-EPERM, \"EOF\") =E2=86=92 %s", STRERROR_OR_EOF(-EPERM));
>> =C2=A0 }
>> +#endif /* __GLIBC__ */
>> =C2=A0
>> - DEFINE_TEST_MAIN(LOG_INFO);
>> + TEST(PROTECT_ERRNO) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 errno =3D 12;
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S=
_IFDIR.patch b/meta/recipes-core/systemd/systemd/0007-Add-sys-stat.h-for-S_=
IFDIR.patch
>> similarity index 80%
>> rename from meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_=
IFDIR.patch
>> rename to meta/recipes-core/systemd/systemd/0007-Add-sys-stat.h-for-S_IF=
DIR.patch
>> index e6abaadfcb..479b9a1ca1 100644
>> --- a/meta/recipes-core/systemd/systemd/0002-Add-sys-stat.h-for-S_IFDIR.=
patch
>> +++ b/meta/recipes-core/systemd/systemd/0007-Add-sys-stat.h-for-S_IFDIR.=
patch
>> @@ -1,4 +1,4 @@
>> -From 4b731a5e2547b5292f9a774b849e14c0cf7b3955 Mon Sep 17 00:00:00 2001
>> +From 1480ef4ea9f71befbc22272c219b62ee5cd71d43 Mon Sep 17 00:00:00 2001
>> From: Khem Raj <raj.khem@gmail.com>
>> Date: Fri, 21 Jan 2022 15:17:37 -0800
>> Subject: [PATCH] Add sys/stat.h for S_IFDIR
>> @@ -8,11 +8,12 @@ Subject: [PATCH] Add sys/stat.h for S_IFDIR
>>=20
>> Upstream-Status: Backport [29b7114c5d9624002aa7c17748d960cd1e45362d]
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>> ---
>> =C2=A0 src/shared/mkdir-label.c | 1 +
>> =C2=A0 1 file changed, 1 insertion(+)
>>=20
>> +diff --git a/src/shared/mkdir-label.c b/src/shared/mkdir-label.c
>> +index e3afc2b666..f1df778966 100644
>> --- a/src/shared/mkdir-label.c
>> +++ b/src/shared/mkdir-label.c
>> @@ -7,6 +7,7 @@
>> @@ -23,3 +24,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0
>> =C2=A0 int mkdirat_label(int dirfd, const char *path, mode_t mode) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int r;
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0003-implment-systemd-sys=
v-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0008-implment-sy=
stemd-sysv-install-for-OE.patch
>> similarity index 92%
>> rename from meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv=
-install-for-OE.patch
>> rename to meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-i=
nstall-for-OE.patch
>> index 4556ab5da6..acff18dc43 100644
>> --- a/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-insta=
ll-for-OE.patch
>> +++ b/meta/recipes-core/systemd/systemd/0008-implment-systemd-sysv-insta=
ll-for-OE.patch
>> @@ -1,4 +1,4 @@
>> -From f9078501a1495c9991431d1435d081cd2e830328 Mon Sep 17 00:00:00 2001
>> +From 5712d56f1cd654d2e5d2e9117ff77fe4c299f76b Mon Sep 17 00:00:00 2001
>> From: Khem Raj <raj.khem@gmail.com>
>> Date: Sat, 5 Sep 2015 06:31:47 +0000
>> Subject: [PATCH] implment systemd-sysv-install for OE
>> @@ -9,13 +9,12 @@ to check the status of the sysv service
>> Upstream-Status: Inappropriate [OE-Specific]
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>> ---
>> =C2=A0 src/systemctl/systemd-sysv-install.SKELETON | 6 +++---
>> =C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/src/systemctl/systemd-sysv-install.SKELETON b/src/systemctl=
/systemd-sysv-install.SKELETON
>> -index a2a0059fef..7f95791d9b 100755
>> +index cb58d8243b..000bdf6165 100755
>> --- a/src/systemctl/systemd-sysv-install.SKELETON
>> +++ b/src/systemctl/systemd-sysv-install.SKELETON
>> @@ -34,17 +34,17 @@ case "$1" in
>> @@ -39,3 +38,6 @@ index a2a0059fef..7f95791d9b 100755
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usage ;;
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-c=
omparison_fn_t.patch b/meta/recipes-core/systemd/systemd/0009-missing_type.=
h-add-comparison_fn_t.patch
>> similarity index 92%
>> rename from meta/recipes-core/systemd/systemd/0003-missing_type.h-add-co=
mparison_fn_t.patch
>> rename to meta/recipes-core/systemd/systemd/0009-missing_type.h-add-comp=
arison_fn_t.patch
>> index c28c8381e8..e50b47a5a0 100644
>> --- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-comparis=
on_fn_t.patch
>> +++ b/meta/recipes-core/systemd/systemd/0009-missing_type.h-add-comparis=
on_fn_t.patch
>> @@ -1,4 +1,4 @@
>> -From 5513b918d02900a3a78fd0e0300a118b163edfef Mon Sep 17 00:00:00 2001
>> +From 542f999a846dfd49d9373d30fffb2a44168d7b5e Mon Sep 17 00:00:00 2001
>> From: Chen Qi <Qi.Chen@windriver.com>
>> Date: Mon, 25 Feb 2019 13:55:12 +0800
>> Subject: [PATCH] missing_type.h: add comparison_fn_t
>> @@ -33,7 +33,7 @@ index f6233090a9..6c0456349d 100644
>> +typedef int (*comparison_fn_t)(const void *, const void *);
>> +#endif
>> diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
>> -index 02a6784d99..0b33c83d59 100644
>> +index f0bf246aa3..33669c7a75 100644
>> --- a/src/basic/sort-util.h
>> +++ b/src/basic/sort-util.h
>> @@ -4,6 +4,7 @@
>> @@ -45,7 +45,7 @@ index 02a6784d99..0b33c83d59 100644
>> =C2=A0 /* This is the same as glibc's internal __compar_d_fn_t type. gli=
bc exports a public comparison_fn_t, for the
>> =C2=A0=C2=A0 * external type __compar_fn_t, but doesn't do anything simi=
lar for __compar_d_fn_t. Let's hence do that
>> diff --git a/src/libsystemd/sd-journal/catalog.c b/src/libsystemd/sd-jou=
rnal/catalog.c
>> -index 8fc87b131a..36a6efdbd8 100644
>> +index 7527abf636..f33383e57f 100644
>> --- a/src/libsystemd/sd-journal/catalog.c
>> +++ b/src/libsystemd/sd-journal/catalog.c
>> @@ -28,6 +28,7 @@
>> @@ -57,5 +57,5 @@ index 8fc87b131a..36a6efdbd8 100644
>> =C2=A0 const char * const catalog_file_dirs[] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "/usr/local/lib/s=
ystemd/catalog/",
>> --=20
>> -2.34.1
>> +2.39.2
>>=20
>> diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_p=
rintf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0010-=
add-fallback-parse_printf_format-implementation.patch
>> similarity index 93%
>> rename from meta/recipes-core/systemd/systemd/0004-add-fallback-parse_pr=
intf_format-implementation.patch
>> rename to meta/recipes-core/systemd/systemd/0010-add-fallback-parse_prin=
tf_format-implementation.patch
>> index f9c7ced947..6f01721459 100644
>> --- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_f=
ormat-implementation.patch
>> +++ b/meta/recipes-core/systemd/systemd/0010-add-fallback-parse_printf_f=
ormat-implementation.patch
>> @@ -1,4 +1,4 @@
>> -From 3d9910dcda697b1e361bba49c99050ee0d116742 Mon Sep 17 00:00:00 2001
>> +From 383e85e15f16a46aac925aa439b8b60f58b40aa6 Mon Sep 17 00:00:00 2001
>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>> Date: Sat, 22 May 2021 20:26:24 +0200
>> Subject: [PATCH] add fallback parse_printf_format implementation
>> @@ -10,7 +10,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> [rebased for systemd 243]
>> Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>> -
>> ---
>> =C2=A0 meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0 src/basic/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 5 +
>> @@ -22,9 +21,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
>> =C2=A0 create mode 100644 src/basic/parse-printf-format.c
>> =C2=A0 create mode 100644 src/basic/parse-printf-format.h
>>=20
>> +diff --git a/meson.build b/meson.build
>> +index bfc86857d6..fb96143c37 100644
>> --- a/meson.build
>> +++ b/meson.build
>> -@@ -739,6 +739,7 @@ endif
>> +@@ -755,6 +755,7 @@ endif
>> =C2=A0 foreach header : ['crypt.h',
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'linux/memfd.h',
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'linux/vm_sockets.h',
>> @@ -32,9 +33,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'sys/auxv.h',
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'valgrind/memcheck.h',
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'valgrind/valgrind.h',
>> +diff --git a/src/basic/meson.build b/src/basic/meson.build
>> +index 7aae031d81..1aa9f5006d 100644
>> --- a/src/basic/meson.build
>> +++ b/src/basic/meson.build
>> -@@ -337,6 +337,11 @@ endforeach
>> +@@ -173,6 +173,11 @@ endforeach
>> =C2=A0
>> =C2=A0 basic_sources +=3D generated_gperf_headers
>> =C2=A0
>> @@ -46,6 +49,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com=
>
>> =C2=A0 ############################################################
>> =C2=A0
>> =C2=A0 arch_list =3D [
>> +diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-f=
ormat.c
>> +new file mode 100644
>> +index 0000000000..49437e5445
>> --- /dev/null
>> +++ b/src/basic/parse-printf-format.c
>> @@ -0,0 +1,273 @@
>> @@ -322,6 +328,9 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return last;
>> +}
>> +diff --git a/src/basic/parse-printf-format.h b/src/basic/parse-printf-f=
ormat.h
>> +new file mode 100644
>> +index 0000000000..47be7522d7
>> --- /dev/null
>> +++ b/src/basic/parse-printf-format.h
>> @@ -0,0 +1,57 @@
>> @@ -382,9 +391,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.=
com>
>> +size_t parse_printf_format(const char *fmt, size_t n, int *types);
>> +
>> +#endif /* HAVE_PRINTF_H */
>> +diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
>> +index 4e93ac90c9..f9deb6f662 100644
>> --- a/src/basic/stdio-util.h
>> +++ b/src/basic/stdio-util.h
>> -@@ -1,13 +1,13 @@
>> +@@ -1,12 +1,12 @@
>> =C2=A0 /* SPDX-License-Identifier: LGPL-2.1-or-later */
>> =C2=A0 #pragma once
>> =C2=A0
>> @@ -394,11 +405,12 @@ Signed-off-by: Scott Murray <scott.murray@konsulko=
.com>
>> =C2=A0 #include <sys/types.h>
>> =C2=A0
>> =C2=A0 #include "macro.h"
>> - #include "memory-util.h"
>> +#include "parse-printf-format.h"
>> =C2=A0
>> - #define snprintf_ok(buf, len, fmt, ...)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ({=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> + _printf_(3, 4)
>> + static inline char *snprintf_ok(char *buf, size_t len, const char *for=
mat, ...) {
>> +diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/=
sd-journal/journal-send.c
>> +index 3b74d2246e..136ebcb153 100644
>> --- a/src/libsystemd/sd-journal/journal-send.c
>> +++ b/src/libsystemd/sd-journal/journal-send.c
>> @@ -2,7 +2,6 @@
>> @@ -417,3 +429,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
>> =C2=A0
>> =C2=A0 #define SNDBUF_SIZE (8*1024*1024)
>> =C2=A0
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-=
check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0011-s=
rc-basic-missing.h-check-for-missing-strndupa.patch
>> similarity index 72%
>> rename from meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-c=
heck-for-missing-strndupa.patch
>> rename to meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-che=
ck-for-missing-strndupa.patch
>> index 2c33033e91..bd5f6a6190 100644
>> --- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-f=
or-missing-strndupa.patch
>> +++ b/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-f=
or-missing-strndupa.patch
>> @@ -1,4 +1,4 @@
>> -From 106b7bd7186c9d6c1dcd72bd4ca6457d3fa72d0b Mon Sep 17 00:00:00 2001
>> +From ee5c8b494a3269edd154a0b799a03b39dba2ceb0 Mon Sep 17 00:00:00 2001
>> From: Chen Qi <Qi.Chen@windriver.com>
>> Date: Mon, 25 Feb 2019 14:18:21 +0800
>> Subject: [PATCH] src/basic/missing.h: check for missing strndupa
>> @@ -49,7 +49,6 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.=
com>
>> =C2=A0 src/libsystemd/sd-bus/sd-bus.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 src/libsystemd/sd-bus/test-bus-benchmark.c |=C2=A0 1 +
>> =C2=A0 src/libsystemd/sd-journal/sd-journal.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
>> - src/locale/keymap-util.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 src/login/pam_systemd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
>> =C2=A0 src/network/generator/network-generator.c=C2=A0 |=C2=A0 1 +
>> =C2=A0 src/nspawn/nspawn-settings.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> @@ -64,17 +63,18 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0 src/shared/journal-importer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 src/shared/logs-show.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
>> =C2=A0 src/shared/pager.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> - src/shared/uid-range.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
>> =C2=A0 src/socket-proxy/socket-proxyd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 src/test/test-hexdecoct.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 src/udev/udev-builtin-path_id.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 src/udev/udev-event.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 src/udev/udev-rules.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
>> - 52 files changed, 63 insertions(+)
>> + 50 files changed, 61 insertions(+)
>>=20
>> +diff --git a/meson.build b/meson.build
>> +index fb96143c37..739b2f7f72 100644
>> --- a/meson.build
>> +++ b/meson.build
>> -@@ -557,6 +557,7 @@ foreach ident : ['secure_getenv', '__sec
>> +@@ -574,6 +574,7 @@ foreach ident : ['secure_getenv', '__secure_getenv'=
]
>> =C2=A0 endforeach
>> =C2=A0
>> =C2=A0 foreach ident : [
>> @@ -82,16 +82,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ['memfd_create',=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '''#include <sys/mman.h>'''],
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ['gettid',=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '''#include <s=
ys/types.h>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #include <unistd.=
h>'''],
>> +diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
>> +index e66477f328..2613d1e3f9 100644
>> --- a/src/backlight/backlight.c
>> +++ b/src/backlight/backlight.c
>> -@@ -20,6 +20,7 @@
>> +@@ -19,6 +19,7 @@
>> + #include "string-util.h"
>> =C2=A0 #include "strv.h"
>> =C2=A0 #include "terminal-util.h"
>> - #include "util.h"
>> +#include "missing_stdlib.h"
>> =C2=A0
>> =C2=A0 #define PCI_CLASS_GRAPHICS_CARD 0x30000
>> =C2=A0
>> +diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
>> +index feda596939..11b4375ed5 100644
>> --- a/src/basic/cgroup-util.c
>> +++ b/src/basic/cgroup-util.c
>> @@ -37,6 +37,7 @@
>> @@ -102,6 +106,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0
>> =C2=A0 static int cg_enumerate_items(const char *controller, const char =
*path, FILE **_f, const char *item) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _cleanup_free_ ch=
ar *fs =3D NULL;
>> +diff --git a/src/basic/env-util.c b/src/basic/env-util.c
>> +index 55ac11a512..7ccb1d7887 100644
>> --- a/src/basic/env-util.c
>> +++ b/src/basic/env-util.c
>> @@ -19,6 +19,7 @@
>> @@ -112,16 +118,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@micros=
oft.com>
>> =C2=A0
>> =C2=A0 /* We follow bash for the character set. Different shells have di=
fferent rules. */
>> =C2=A0 #define VALID_BASH_ENV_NAME_CHARS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +diff --git a/src/basic/log.c b/src/basic/log.c
>> +index fc5793139e..515218fca8 100644
>> --- a/src/basic/log.c
>> +++ b/src/basic/log.c
>> -@@ -36,6 +36,7 @@
>> +@@ -39,6 +39,7 @@
>> =C2=A0 #include "terminal-util.h"
>> =C2=A0 #include "time-util.h"
>> =C2=A0 #include "utf8.h"
>> +#include "missing_stdlib.h"
>> =C2=A0
>> =C2=A0 #define SNDBUF_SIZE (8*1024*1024)
>> -
>> + #define IOVEC_MAX 128U
>> +diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
>> +index 8c76f93eb2..9068bfb4f0 100644
>> --- a/src/basic/missing_stdlib.h
>> +++ b/src/basic/missing_stdlib.h
>> @@ -11,3 +11,15 @@
>> @@ -140,6 +150,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> +=C2=A0=C2=A0=C2=A0 (char *)memcpy(__new, __old, __len); \
>> +=C2=A0 })
>> +#endif
>> +diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
>> +index 7ad19ee33b..cc1d5e1e5b 100644
>> --- a/src/basic/mkdir.c
>> +++ b/src/basic/mkdir.c
>> @@ -15,6 +15,7 @@
>> @@ -148,8 +160,10 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microso=
ft.com>
>> =C2=A0 #include "user-util.h"
>> +#include "missing_stdlib.h"
>> =C2=A0
>> - int mkdir_safe_internal(
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *path,
>> + int mkdirat_safe_internal(
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 int dir_fd,
>> +diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-util.c
>> +index bc74fbef8f..cdb609bb84 100644
>> --- a/src/basic/mountpoint-util.c
>> +++ b/src/basic/mountpoint-util.c
>> @@ -13,6 +13,7 @@
>> @@ -160,6 +174,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0 #include "mountpoint-util.h"
>> =C2=A0 #include "nulstr-util.h"
>> =C2=A0 #include "parse-util.h"
>> +diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
>> +index 3445d31307..d82b4415d9 100644
>> --- a/src/basic/parse-util.c
>> +++ b/src/basic/parse-util.c
>> @@ -18,6 +18,7 @@
>> @@ -170,6 +186,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0
>> =C2=A0 int parse_boolean(const char *v) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!v)
>> +diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c
>> +index c99e9d8786..71a917a0b0 100644
>> --- a/src/basic/path-lookup.c
>> +++ b/src/basic/path-lookup.c
>> @@ -16,6 +16,7 @@
>> @@ -180,6 +198,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0
>> =C2=A0 int xdg_user_runtime_dir(char **ret, const char *suffix) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *e;
>> +diff --git a/src/basic/percent-util.c b/src/basic/percent-util.c
>> +index cab9d0eaea..5f6ca258e9 100644
>> --- a/src/basic/percent-util.c
>> +++ b/src/basic/percent-util.c
>> @@ -3,6 +3,7 @@
>> @@ -190,16 +210,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@micros=
oft.com>
>> =C2=A0
>> =C2=A0 static int parse_parts_value_whole(const char *p, const char *sym=
bol) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *pc, *=
n;
>> +diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
>> +index eea70d8606..ae3abd8402 100644
>> --- a/src/basic/proc-cmdline.c
>> +++ b/src/basic/proc-cmdline.c
>> @@ -15,6 +15,7 @@
>> + #include "special.h"
>> =C2=A0 #include "string-util.h"
>> - #include "util.h"
>> =C2=A0 #include "virt.h"
>> +#include "missing_stdlib.h"
>> =C2=A0
>> =C2=A0 int proc_cmdline(char **ret) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *e;
>> +diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
>> +index bcba5a5208..64a95dd866 100644
>> --- a/src/basic/procfs-util.c
>> +++ b/src/basic/procfs-util.c
>> @@ -12,6 +12,7 @@
>> @@ -210,6 +234,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0
>> =C2=A0 int procfs_get_pid_max(uint64_t *ret) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _cleanup_free_ ch=
ar *value =3D NULL;
>> +diff --git a/src/basic/time-util.c b/src/basic/time-util.c
>> +index b700f364ef..48a26bcec9 100644
>> --- a/src/basic/time-util.c
>> +++ b/src/basic/time-util.c
>> @@ -26,6 +26,7 @@
>> @@ -220,16 +246,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@micros=
oft.com>
>> =C2=A0
>> =C2=A0 static clockid_t map_clock_id(clockid_t c) {
>> =C2=A0
>> +diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
>> +index 59f02b761a..7496646350 100644
>> --- a/src/boot/bless-boot.c
>> +++ b/src/boot/bless-boot.c
>> @@ -22,6 +22,7 @@
>> - #include "util.h"
>> + #include "terminal-util.h"
>> =C2=A0 #include "verbs.h"
>> =C2=A0 #include "virt.h"
>> +#include "missing_stdlib.h"
>> =C2=A0
>> =C2=A0 static char **arg_path =3D NULL;
>> =C2=A0
>> +diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
>> +index b5484eda78..54ed62c790 100644
>> --- a/src/core/dbus-cgroup.c
>> +++ b/src/core/dbus-cgroup.c
>> @@ -21,6 +21,7 @@
>> @@ -240,9 +270,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microso=
ft.com>
>> =C2=A0 #include "socket-util.h"
>> =C2=A0
>> =C2=A0 BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax=
, tasks_max_resolve);
>> +diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
>> +index f514b8fd12..4febd0d496 100644
>> --- a/src/core/dbus-execute.c
>> +++ b/src/core/dbus-execute.c
>> -@@ -44,6 +44,7 @@
>> +@@ -45,6 +45,7 @@
>> =C2=A0 #include "unit-printf.h"
>> =C2=A0 #include "user-util.h"
>> =C2=A0 #include "utf8.h"
>> @@ -250,6 +282,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0
>> =C2=A0 BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_o=
utput, ExecOutput);
>> =C2=A0 static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec=
_input, ExecInput);
>> +diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
>> +index edfa0eb69a..6fd2ec9062 100644
>> --- a/src/core/dbus-util.c
>> +++ b/src/core/dbus-util.c
>> @@ -9,6 +9,7 @@
>> @@ -260,9 +294,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microso=
ft.com>
>> =C2=A0
>> =C2=A0 int bus_property_get_triggered_unit(
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sd_bus *bus,
>> +diff --git a/src/core/execute.c b/src/core/execute.c
>> +index 853e87450f..8ef76de9ab 100644
>> --- a/src/core/execute.c
>> +++ b/src/core/execute.c
>> -@@ -104,6 +104,7 @@
>> +@@ -105,6 +105,7 @@
>> =C2=A0 #include "unit-serialize.h"
>> =C2=A0 #include "user-util.h"
>> =C2=A0 #include "utmp-wtmp.h"
>> @@ -270,9 +306,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microso=
ft.com>
>> =C2=A0
>> =C2=A0 #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
>> =C2=A0 #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
>> +diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
>> +index e843743777..e149807492 100644
>> --- a/src/core/kmod-setup.c
>> +++ b/src/core/kmod-setup.c
>> -@@ -11,6 +11,7 @@
>> +@@ -12,6 +12,7 @@
>> =C2=A0 #include "recurse-dir.h"
>> =C2=A0 #include "string-util.h"
>> =C2=A0 #include "virt.h"
>> @@ -280,16 +318,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@micros=
oft.com>
>> =C2=A0
>> =C2=A0 #if HAVE_KMOD
>> =C2=A0 #include "module-util.h"
>> +diff --git a/src/core/service.c b/src/core/service.c
>> +index 9ad3c3d995..b112d64919 100644
>> --- a/src/core/service.c
>> +++ b/src/core/service.c
>> @@ -42,6 +42,7 @@
>> + #include "unit-name.h"
>> =C2=A0 #include "unit.h"
>> =C2=A0 #include "utf8.h"
>> - #include "util.h"
>> +#include "missing_stdlib.h"
>> =C2=A0
>> =C2=A0 #define service_spawn(...) service_spawn_internal(__func__, __VA_=
ARGS__)
>> =C2=A0
>> +diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-vac=
uum.c
>> +index c6e201ecf2..ab034475e2 100644
>> --- a/src/coredump/coredump-vacuum.c
>> +++ b/src/coredump/coredump-vacuum.c
>> @@ -17,6 +17,7 @@
>> @@ -300,19 +342,23 @@ Signed-off-by: Luca Boccassi <luca.boccassi@micros=
oft.com>
>> =C2=A0
>> =C2=A0 #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 1 MiB */
>> =C2=A0 #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*10=
24ULL)=C2=A0=C2=A0 /* 4 GiB */
>> +diff --git a/src/fstab-generator/fstab-generator.c b/src/fstab-generato=
r/fstab-generator.c
>> +index efc553b698..acea922311 100644
>> --- a/src/fstab-generator/fstab-generator.c
>> +++ b/src/fstab-generator/fstab-generator.c
>> -@@ -32,6 +32,7 @@
>> - #include "util.h"
>> +@@ -33,6 +33,7 @@
>> + #include "unit-name.h"
>> =C2=A0 #include "virt.h"
>> =C2=A0 #include "volatile-util.h"
>> +#include "missing_stdlib.h"
>> =C2=A0
>> =C2=A0 typedef enum MountPointFlags {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MOUNT_NOAUTO=C2=
=A0=C2=A0=C2=A0 =3D 1 << 0,
>> +diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-rem=
ote/journal-remote-main.c
>> +index 7df264fb53..9463a0e9fb 100644
>> --- a/src/journal-remote/journal-remote-main.c
>> +++ b/src/journal-remote/journal-remote-main.c
>> -@@ -24,6 +24,7 @@
>> +@@ -25,6 +25,7 @@
>> =C2=A0 #include "stat-util.h"
>> =C2=A0 #include "string-table.h"
>> =C2=A0 #include "strv.h"
>> @@ -320,9 +366,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microso=
ft.com>
>> =C2=A0
>> =C2=A0 #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.p=
em"
>> =C2=A0 #define CERT_FILE=C2=A0=C2=A0=C2=A0=C2=A0 CERTIFICATE_ROOT "/cert=
s/journal-remote.pem"
>> +diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
>> +index da0fac548e..c1c043e0e0 100644
>> --- a/src/journal/journalctl.c
>> +++ b/src/journal/journalctl.c
>> -@@ -70,6 +70,7 @@
>> +@@ -72,6 +72,7 @@
>> =C2=A0 #include "unit-name.h"
>> =C2=A0 #include "user-util.h"
>> =C2=A0 #include "varlink.h"
>> @@ -330,6 +378,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0
>> =C2=A0 #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
>> =C2=A0 #define PROCESS_INOTIFY_INTERVAL 1024=C2=A0=C2=A0 /* Every 1,024 =
messages processed */
>> +diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bu=
s/bus-message.c
>> +index 9719f97c02..75decd9834 100644
>> --- a/src/libsystemd/sd-bus/bus-message.c
>> +++ b/src/libsystemd/sd-bus/bus-message.c
>> @@ -19,6 +19,7 @@
>> @@ -340,6 +390,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0
>> =C2=A0 static int message_append_basic(sd_bus_message *m, char type, con=
st void *p, const void **stored);
>> =C2=A0 static int message_parse_fields(sd_bus_message *m);
>> +diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bu=
s/bus-objects.c
>> +index 2ad7a9993d..bba72f99f4 100644
>> --- a/src/libsystemd/sd-bus/bus-objects.c
>> +++ b/src/libsystemd/sd-bus/bus-objects.c
>> @@ -11,6 +11,7 @@
>> @@ -350,9 +402,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microso=
ft.com>
>> =C2=A0
>> =C2=A0 static int node_vtable_get_userdata(
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sd_bus *bus,
>> +diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus=
/bus-socket.c
>> +index 64037e4fe0..9b9ce0aaa9 100644
>> --- a/src/libsystemd/sd-bus/bus-socket.c
>> +++ b/src/libsystemd/sd-bus/bus-socket.c
>> -@@ -28,6 +28,7 @@
>> +@@ -27,6 +27,7 @@
>> =C2=A0 #include "string-util.h"
>> =C2=A0 #include "user-util.h"
>> =C2=A0 #include "utf8.h"
>> @@ -360,6 +414,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0
>> =C2=A0 #define SNDBUF_SIZE (8*1024*1024)
>> =C2=A0
>> +diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-=
bus.c
>> +index f6a5e4aa06..b36faa79a3 100644
>> --- a/src/libsystemd/sd-bus/sd-bus.c
>> +++ b/src/libsystemd/sd-bus/sd-bus.c
>> @@ -44,6 +44,7 @@
>> @@ -370,16 +426,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@micros=
oft.com>
>> =C2=A0
>> =C2=A0 #define log_debug_bus_message(m)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do {=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> +diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystem=
d/sd-bus/test-bus-benchmark.c
>> +index 1eb6edd329..d434a3c178 100644
>> --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
>> +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
>> -@@ -14,6 +14,7 @@
>> +@@ -13,6 +13,7 @@
>> + #include "missing_resource.h"
>> =C2=A0 #include "string-util.h"
>> =C2=A0 #include "time-util.h"
>> - #include "util.h"
>> +#include "missing_stdlib.h"
>> =C2=A0
>> =C2=A0 #define MAX_SIZE (2*1024*1024)
>> =C2=A0
>> +diff --git a/src/libsystemd/sd-journal/sd-journal.c b/src/libsystemd/sd=
-journal/sd-journal.c
>> +index 9947947ef2..8dc6f93159 100644
>> --- a/src/libsystemd/sd-journal/sd-journal.c
>> +++ b/src/libsystemd/sd-journal/sd-journal.c
>> @@ -41,6 +41,7 @@
>> @@ -388,8 +448,10 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microso=
ft.com>
>> =C2=A0 #include "syslog-util.h"
>> +#include "missing_stdlib.h"
>> =C2=A0
>> - #define JOURNAL_FILES_MAX 7168
>> + #define JOURNAL_FILES_RECHECK_USEC (2 * USEC_PER_SEC)
>> =C2=A0
>> +diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
>> +index ba2fca32c6..e1f9caa13b 100644
>> --- a/src/login/pam_systemd.c
>> +++ b/src/login/pam_systemd.c
>> @@ -32,6 +32,7 @@
>> @@ -400,6 +462,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0 #include "pam-util.h"
>> =C2=A0 #include "parse-util.h"
>> =C2=A0 #include "path-util.h"
>> +diff --git a/src/network/generator/network-generator.c b/src/network/ge=
nerator/network-generator.c
>> +index 1090934bfc..69a77f66e2 100644
>> --- a/src/network/generator/network-generator.c
>> +++ b/src/network/generator/network-generator.c
>> @@ -13,6 +13,7 @@
>> @@ -410,16 +474,20 @@ Signed-off-by: Luca Boccassi <luca.boccassi@micros=
oft.com>
>> =C2=A0
>> =C2=A0 /*
>> =C2=A0=C2=A0=C2=A0 # .network
>> +diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.=
c
>> +index 05bde1c756..aa29587868 100644
>> --- a/src/nspawn/nspawn-settings.c
>> +++ b/src/nspawn/nspawn-settings.c
>> -@@ -17,6 +17,7 @@
>> +@@ -16,6 +16,7 @@
>> + #include "string-util.h"
>> =C2=A0 #include "strv.h"
>> =C2=A0 #include "user-util.h"
>> - #include "util.h"
>> +#include "missing_stdlib.h"
>> =C2=A0
>> =C2=A0 Settings *settings_new(void) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Settings *s;
>> +diff --git a/src/nss-mymachines/nss-mymachines.c b/src/nss-mymachines/n=
ss-mymachines.c
>> +index c64e79bdff..eda26b0b9a 100644
>> --- a/src/nss-mymachines/nss-mymachines.c
>> +++ b/src/nss-mymachines/nss-mymachines.c
>> @@ -21,6 +21,7 @@
>> @@ -430,6 +498,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0
>> =C2=A0 static void setup_logging_once(void) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static pthread_on=
ce_t once =3D PTHREAD_ONCE_INIT;
>> +diff --git a/src/portable/portable.c b/src/portable/portable.c
>> +index 7811833fac..c6414da91c 100644
>> --- a/src/portable/portable.c
>> +++ b/src/portable/portable.c
>> @@ -39,6 +39,7 @@
>> @@ -440,9 +510,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microso=
ft.com>
>> =C2=A0
>> =C2=A0 /* Markers used in the first line of our 20-portable.conf unit fi=
le drop-in to determine, that a) the unit file was
>> =C2=A0=C2=A0 * dropped there by the portable service logic and b) for wh=
ich image it was dropped there. */
>> +diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
>> +index 2638e985fb..82c903fd66 100644
>> --- a/src/resolve/resolvectl.c
>> +++ b/src/resolve/resolvectl.c
>> -@@ -46,6 +46,7 @@
>> +@@ -48,6 +48,7 @@
>> =C2=A0 #include "varlink.h"
>> =C2=A0 #include "verb-log-control.h"
>> =C2=A0 #include "verbs.h"
>> @@ -450,6 +522,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0
>> =C2=A0 static int arg_family =3D AF_UNSPEC;
>> =C2=A0 static int arg_ifindex =3D 0;
>> +diff --git a/src/shared/bus-get-properties.c b/src/shared/bus-get-prope=
rties.c
>> +index 8b4f66b22e..5926e4c61b 100644
>> --- a/src/shared/bus-get-properties.c
>> +++ b/src/shared/bus-get-properties.c
>> @@ -4,6 +4,7 @@
>> @@ -460,6 +534,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0
>> =C2=A0 int bus_property_get_bool(
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sd_bus *bus,
>> +diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-procs.c
>> +index 8b462b5627..183ce1c18e 100644
>> --- a/src/shared/bus-unit-procs.c
>> +++ b/src/shared/bus-unit-procs.c
>> @@ -11,6 +11,7 @@
>> @@ -470,9 +546,11 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microso=
ft.com>
>> =C2=A0
>> =C2=A0 struct CGroupInfo {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *cgroup_path=
;
>> +diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
>> +index 1e95e36678..640ee031d5 100644
>> --- a/src/shared/bus-unit-util.c
>> +++ b/src/shared/bus-unit-util.c
>> -@@ -49,6 +49,7 @@
>> +@@ -50,6 +50,7 @@
>> =C2=A0 #include "unit-def.h"
>> =C2=A0 #include "user-util.h"
>> =C2=A0 #include "utf8.h"
>> @@ -480,6 +558,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0
>> =C2=A0 int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert(message);
>> +diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
>> +index d09ec5148d..f38a8f7cc1 100644
>> --- a/src/shared/bus-util.c
>> +++ b/src/shared/bus-util.c
>> @@ -21,6 +21,7 @@
>> @@ -490,6 +570,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0
>> =C2=A0 static int name_owner_change_callback(sd_bus_message *m, void *us=
erdata, sd_bus_error *ret_error) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sd_event *e =3D A=
SSERT_PTR(userdata);
>> +diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
>> +index 620b156563..5ee5b09186 100644
>> --- a/src/shared/dns-domain.c
>> +++ b/src/shared/dns-domain.c
>> @@ -18,6 +18,7 @@
>> @@ -500,6 +582,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0
>> =C2=A0 int dns_label_unescape(const char **name, char *dest, size_t sz, =
DNSLabelFlags flags) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *n;
>> +diff --git a/src/shared/journal-importer.c b/src/shared/journal-importe=
r.c
>> +index d9eabec886..534c6cf7e3 100644
>> --- a/src/shared/journal-importer.c
>> +++ b/src/shared/journal-importer.c
>> @@ -15,6 +15,7 @@
>> @@ -510,36 +594,44 @@ Signed-off-by: Luca Boccassi <luca.boccassi@micros=
oft.com>
>> =C2=A0
>> =C2=A0 enum {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IMPORTER_STATE_LI=
NE =3D 0,=C2=A0=C2=A0=C2=A0 /* waiting to read, or reading line */
>> +diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
>> +index b72e516c8d..6e832b74c3 100644
>> --- a/src/shared/logs-show.c
>> +++ b/src/shared/logs-show.c
>> -@@ -42,6 +42,7 @@
>> +@@ -41,6 +41,7 @@
>> + #include "time-util.h"
>> =C2=A0 #include "utf8.h"
>> - #include "util.h"
>> =C2=A0 #include "web-util.h"
>> +#include "missing_stdlib.h"
>> =C2=A0
>> =C2=A0 /* up to three lines (each up to 100 characters) or 300 character=
s, whichever is less */
>> =C2=A0 #define PRINT_LINE_THRESHOLD 3
>> +diff --git a/src/shared/pager.c b/src/shared/pager.c
>> +index 6ed35a3ca9..99d9d36140 100644
>> --- a/src/shared/pager.c
>> +++ b/src/shared/pager.c
>> -@@ -26,6 +26,7 @@
>> +@@ -25,6 +25,7 @@
>> + #include "string-util.h"
>> =C2=A0 #include "strv.h"
>> =C2=A0 #include "terminal-util.h"
>> - #include "util.h"
>> +#include "missing_stdlib.h"
>> =C2=A0
>> =C2=A0 static pid_t pager_pid =3D 0;
>> =C2=A0
>> +diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket=
-proxyd.c
>> +index 821049e667..08a5bdae3d 100644
>> --- a/src/socket-proxy/socket-proxyd.c
>> +++ b/src/socket-proxy/socket-proxyd.c
>> @@ -26,6 +26,7 @@
>> + #include "set.h"
>> =C2=A0 #include "socket-util.h"
>> =C2=A0 #include "string-util.h"
>> - #include "util.h"
>> +#include "missing_stdlib.h"
>> =C2=A0
>> =C2=A0 #define BUFFER_SIZE (256 * 1024)
>> =C2=A0
>> +diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
>> +index 9d71db6ae1..a9938c1e6e 100644
>> --- a/src/test/test-hexdecoct.c
>> +++ b/src/test/test-hexdecoct.c
>> @@ -7,6 +7,7 @@
>> @@ -550,6 +642,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0 #include "tests.h"
>> =C2=A0
>> =C2=A0 TEST(hexchar) {
>> +diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-pa=
th_id.c
>> +index 8e4d57ee72..6b4555b4d5 100644
>> --- a/src/udev/udev-builtin-path_id.c
>> +++ b/src/udev/udev-builtin-path_id.c
>> @@ -22,6 +22,7 @@
>> @@ -560,6 +654,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0
>> =C2=A0 _printf_(2,3)
>> =C2=A0 static void path_prepend(char **path, const char *fmt, ...) {
>> +diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
>> +index ec4ad30824..bc40303a46 100644
>> --- a/src/udev/udev-event.c
>> +++ b/src/udev/udev-event.c
>> @@ -34,6 +34,7 @@
>> @@ -570,6 +666,8 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0
>> =C2=A0 typedef struct Spawn {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sd_device *device=
;
>> +diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
>> +index 5bd09a64d1..0ce79f815c 100644
>> --- a/src/udev/udev-rules.c
>> +++ b/src/udev/udev-rules.c
>> @@ -34,6 +34,7 @@
>> @@ -580,3 +678,6 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsof=
t.com>
>> =C2=A0
>> =C2=A0 #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rul=
es.d")
>> =C2=A0
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_B=
RACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/=
0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
>> similarity index 87%
>> rename from meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BR=
ACE-and-GLOB_ALTDIRFUNC-is-not-.patch
>> rename to meta/recipes-core/systemd/systemd/0012-don-t-fail-if-GLOB_BRAC=
E-and-GLOB_ALTDIRFUNC-is-not-.patch
>> index 2a5770c515..b86cc42589 100644
>> --- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-an=
d-GLOB_ALTDIRFUNC-is-not-.patch
>> +++ b/meta/recipes-core/systemd/systemd/0012-don-t-fail-if-GLOB_BRACE-an=
d-GLOB_ALTDIRFUNC-is-not-.patch
>> @@ -1,4 +1,4 @@
>> -From 74c664bcd6b9a5fcf3466310c07f608d12456f7f Mon Sep 17 00:00:00 2001
>> +From 747ff78ecda6afe01c7eab4d7c27aea6af810c86 Mon Sep 17 00:00:00 2001
>> From: Chen Qi <Qi.Chen@windriver.com>
>> Date: Mon, 25 Feb 2019 14:56:21 +0800
>> Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not def=
ined
>> @@ -16,13 +16,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> [rebased for systemd 243]
>> Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>> -
>> ---
>> =C2=A0 src/basic/glob-util.c=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++++++++
>> =C2=A0 src/test/test-glob-util.c | 16 ++++++++++++++++
>> =C2=A0 src/tmpfiles/tmpfiles.c=C2=A0=C2=A0 | 10 ++++++++++
>> =C2=A0 3 files changed, 38 insertions(+)
>>=20
>> +diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
>> +index fd60a6eda2..c73edc41ea 100644
>> --- a/src/basic/glob-util.c
>> +++ b/src/basic/glob-util.c
>> @@ -12,6 +12,12 @@
>> @@ -46,7 +47,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com=
>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We want to set=
 GLOB_ALTDIRFUNC ourselves, don't allow it to be set. */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert(!(flags & =
GLOB_ALTDIRFUNC));
>> =C2=A0
>> -@@ -32,9 +39,14 @@ int safe_glob(const char *path, int flag
>> +@@ -32,9 +39,14 @@ int safe_glob(const char *path, int flags, glob_t *p=
glob) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pglob->gl_lstat =3D lstat;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!pglob->gl_st=
at)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pglob->gl_stat =3D stat;
>> @@ -61,6 +62,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com=
>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (k =3D=3D GLOB=
_NOMATCH)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOENT;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (k =3D=3D GLOB=
_NOSPACE)
>> +diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
>> +index 9b3e73cce0..3790ba3be5 100644
>> --- a/src/test/test-glob-util.c
>> +++ b/src/test/test-glob-util.c
>> @@ -34,6 +34,12 @@ TEST(glob_first) {
>> @@ -75,7 +78,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com=
>
>> +
>> =C2=A0 TEST(glob_exists) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char name[] =3D "=
/tmp/test-glob_exists.XXXXXX";
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int fd =3D -1;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int fd =3D -EBADF;
>> @@ -61,11 +67,13 @@ TEST(glob_no_dot) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *fn;
>> =C2=A0
>> @@ -110,9 +113,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.=
com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert_se(r =3D=
=3D GLOB_NOMATCH);
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (void) rm_rf(temp=
late, REMOVE_ROOT|REMOVE_PHYSICAL);
>> +diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
>> +index 458aed7054..2cf24b38c0 100644
>> --- a/src/tmpfiles/tmpfiles.c
>> +++ b/src/tmpfiles/tmpfiles.c
>> -@@ -71,6 +71,12 @@
>> +@@ -73,6 +73,12 @@
>> =C2=A0 #include "user-util.h"
>> =C2=A0 #include "virt.h"
>> =C2=A0
>> @@ -125,7 +130,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
>> =C2=A0 /* This reads all files listed in /etc/tmpfiles.d/?*.conf and cre=
ates
>> =C2=A0=C2=A0 * them in the file system. This is intended to be used to c=
reate
>> =C2=A0=C2=A0 * properly owned directories beneath /tmp, /var/tmp, /run, =
which are
>> -@@ -2174,7 +2180,9 @@ finish:
>> +@@ -2194,7 +2200,9 @@ finish:
>> =C2=A0
>> =C2=A0 static int glob_item(Item *i, action_t action) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _cleanup_globfree=
_ glob_t g =3D {
>> @@ -135,7 +140,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int r =3D 0, k;
>> =C2=A0
>> -@@ -2194,7 +2202,9 @@ static int glob_item(Item *i, action_t a
>> +@@ -2214,7 +2222,9 @@ static int glob_item(Item *i, action_t action) {
>> =C2=A0
>> =C2=A0 static int glob_item_recursively(Item *i, fdaction_t action) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _cleanup_globfree=
_ glob_t g =3D {
>> @@ -145,3 +150,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int r =3D 0, k;
>> =C2=A0
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-mac=
ros-for-musl.patch b/meta/recipes-core/systemd/systemd/0013-add-missing-FTW=
_-macros-for-musl.patch
>> similarity index 93%
>> rename from meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macr=
os-for-musl.patch
>> rename to meta/recipes-core/systemd/systemd/0013-add-missing-FTW_-macros=
-for-musl.patch
>> index d1191d7e8e..d6aaadc006 100644
>> --- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for=
-musl.patch
>> +++ b/meta/recipes-core/systemd/systemd/0013-add-missing-FTW_-macros-for=
-musl.patch
>> @@ -1,4 +1,4 @@
>> -From a0450f7909348e7ff1d58adc0aee4119a0519c1f Mon Sep 17 00:00:00 2001
>> +From efd7b41cf270c7b07ee3b9aec0fedd8e52dd422f Mon Sep 17 00:00:00 2001
>> From: Chen Qi <Qi.Chen@windriver.com>
>> Date: Mon, 25 Feb 2019 15:00:06 +0800
>> Subject: [PATCH] add missing FTW_ macros for musl
>> @@ -10,7 +10,6 @@ This is to avoid build failures like below for musl.
>> Upstream-Status: Inappropriate [musl specific]
>>=20
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> -
>> ---
>> =C2=A0 src/basic/missing_type.h=C2=A0=C2=A0=C2=A0 | 4 ++++
>> =C2=A0 src/test/test-recurse-dir.c | 1 +
>> @@ -40,3 +39,6 @@ index 2c2120b136..bc60a178a2 100644
>> =C2=A0
>> =C2=A0 static char **list_nftw =3D NULL;
>> =C2=A0
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-ha=
ndling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-=
for-handling-rlim_t.patch
>> similarity index 85%
>> rename from meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-han=
dling-rlim_t.patch
>> rename to meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-handl=
ing-rlim_t.patch
>> index aac4ad49d7..f586d3ff52 100644
>> --- a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-=
rlim_t.patch
>> +++ b/meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-handling-=
rlim_t.patch
>> @@ -1,4 +1,4 @@
>> -From 48a791aae7a47a2a08e9e60c18054071a43b8cda Mon Sep 17 00:00:00 2001
>> +From 60f7d2c62bc3718023df93c01688d3ee1625d64d Mon Sep 17 00:00:00 2001
>> From: Chen Qi <Qi.Chen@windriver.com>
>> Date: Mon, 25 Feb 2019 15:12:41 +0800
>> Subject: [PATCH] Use uintmax_t for handling rlim_t
>> @@ -20,16 +20,17 @@ Upstream-Status: Denied [https://github.com/systemd/=
systemd/pull/7199]
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> [Rebased for v241]
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> -
>> ---
>> =C2=A0 src/basic/format-util.h |=C2=A0 8 +-------
>> =C2=A0 src/basic/rlimit-util.c | 12 ++++++------
>> =C2=A0 src/core/execute.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
>> =C2=A0 3 files changed, 9 insertions(+), 15 deletions(-)
>>=20
>> +diff --git a/src/basic/format-util.h b/src/basic/format-util.h
>> +index 8719df3e29..9becc96066 100644
>> --- a/src/basic/format-util.h
>> +++ b/src/basic/format-util.h
>> -@@ -34,13 +34,7 @@ assert_cc(sizeof(gid_t) =3D=3D sizeof(uint32
>> +@@ -34,13 +34,7 @@ assert_cc(sizeof(gid_t) =3D=3D sizeof(uint32_t));
>> =C2=A0 #=C2=A0 error Unknown timex member size
>> =C2=A0 #endif
>> =C2=A0
>> @@ -44,9 +45,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> =C2=A0
>> =C2=A0 #if SIZEOF_DEV_T =3D=3D 8
>> =C2=A0 #=C2=A0 define DEV_FMT "%" PRIu64
>> +diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
>> +index 33dfde9d6c..e018fd81fd 100644
>> --- a/src/basic/rlimit-util.c
>> +++ b/src/basic/rlimit-util.c
>> -@@ -44,7 +44,7 @@ int setrlimit_closest(int resource, cons
>> +@@ -44,7 +44,7 @@ int setrlimit_closest(int resource, const struct rlim=
it *rlim) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 fixed.rlim_max =3D=3D highest.rlim_max)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0
>> @@ -55,7 +58,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return RET_NERRNO=
(setrlimit(resource, &fixed));
>> =C2=A0 }
>> -@@ -307,13 +307,13 @@ int rlimit_format(const struct rlimit *r
>> +@@ -307,13 +307,13 @@ int rlimit_format(const struct rlimit *rl, char *=
*ret) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (rl->rlim_cur =
>=3D RLIM_INFINITY && rl->rlim_max >=3D RLIM_INFINITY)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D free_and_strdup(&s, "infinity");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (rl->rlim=
_cur >=3D RLIM_INFINITY)
>> @@ -82,9 +85,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;
>> =C2=A0 }
>> +diff --git a/src/core/execute.c b/src/core/execute.c
>> +index 8ef76de9ab..ea1c203e43 100644
>> --- a/src/core/execute.c
>> +++ b/src/core/execute.c
>> -@@ -5869,9 +5869,9 @@ void exec_context_dump(const ExecContext
>> +@@ -6034,9 +6034,9 @@ void exec_context_dump(const ExecContext *c, FILE=
* f, const char *prefix) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (unsigned i =
=3D 0; i < RLIM_NLIMITS; i++)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (c->rlimit[i]) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
>> @@ -96,3 +101,6 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (c->ioprio_set=
) {
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disabl=
e-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/=
0015-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
>> similarity index 89%
>> rename from meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable=
-tests-for-missing-typedefs-in-.patch
>> rename to meta/recipes-core/systemd/systemd/0015-test-sizeof.c-Disable-t=
ests-for-missing-typedefs-in-.patch
>> index 1074866f86..afc80b9511 100644
>> --- a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests=
-for-missing-typedefs-in-.patch
>> +++ b/meta/recipes-core/systemd/systemd/0015-test-sizeof.c-Disable-tests=
-for-missing-typedefs-in-.patch
>> @@ -1,4 +1,4 @@
>> -From e8025c8eefdf1be4bba34c48f3430838f3859c52 Mon Sep 17 00:00:00 2001
>> +From 96088895149746dd2ee8e8c2e4b97972ccf44696 Mon Sep 17 00:00:00 2001
>> From: Chen Qi <Qi.Chen@windriver.com>
>> Date: Wed, 28 Feb 2018 21:25:22 -0800
>> Subject: [PATCH] test-sizeof.c: Disable tests for missing typedefs in mu=
sl
>> @@ -7,13 +7,12 @@ Upstream-Status: Inappropriate [musl specific]
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> -
>> ---
>> =C2=A0 src/test/test-sizeof.c | 4 ++++
>> =C2=A0 1 file changed, 4 insertions(+)
>>=20
>> diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
>> -index f349852553..602772227e 100644
>> +index 55bd81e22f..6cf92bffde 100644
>> --- a/src/test/test-sizeof.c
>> +++ b/src/test/test-sizeof.c
>> @@ -55,8 +55,10 @@ int main(void) {
>> @@ -37,3 +36,6 @@ index f349852553..602772227e 100644
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info(pid_t);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info(uid_t);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info(gid_t);
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLIN=
K_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0016=
-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
>> similarity index 87%
>> rename from meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK=
_NOFOLLOW-flag-to-faccessat.patch
>> rename to meta/recipes-core/systemd/systemd/0016-don-t-pass-AT_SYMLINK_N=
OFOLLOW-flag-to-faccessat.patch
>> index 6367adce07..2f84d3d6c2 100644
>> --- a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOL=
LOW-flag-to-faccessat.patch
>> +++ b/meta/recipes-core/systemd/systemd/0016-don-t-pass-AT_SYMLINK_NOFOL=
LOW-flag-to-faccessat.patch
>> @@ -1,4 +1,4 @@
>> -From 46fdc959257d60d9b32953cae0152ae118f8564b Mon Sep 17 00:00:00 2001
>> +From 26b02348e39fe72b73dd61bba8a0cefb0352717d Mon Sep 17 00:00:00 2001
>> From: Andre McCurdy <armccurdy@gmail.com>
>> Date: Tue, 10 Oct 2017 14:33:30 -0700
>> Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
>> @@ -25,15 +25,16 @@ just historical and not actually necessary or desire=
d behaviour?
>> Upstream-Status: Inappropriate [musl specific]
>>=20
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> -
>> ---
>> =C2=A0 src/basic/fs-util.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 21 ++++++++++++++++++++-
>> =C2=A0 src/shared/base-filesystem.c |=C2=A0 6 +++---
>> =C2=A0 2 files changed, 23 insertions(+), 4 deletions(-)
>>=20
>> +diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
>> +index 932d003f19..33215dbf5f 100644
>> --- a/src/basic/fs-util.h
>> +++ b/src/basic/fs-util.h
>> -@@ -47,8 +47,27 @@ int futimens_opath(int fd, const struct
>> +@@ -50,8 +50,27 @@ int futimens_opath(int fd, const struct timespec ts[=
2]);
>> =C2=A0 int fd_warn_permissions(const char *path, int fd);
>> =C2=A0 int stat_warn_permissions(const char *path, const struct stat *st=
);
>> =C2=A0
>> @@ -62,9 +63,11 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> =C2=A0
>> =C2=A0 int touch_file(const char *path, bool parents, usec_t stamp, uid_=
t uid, gid_t gid, mode_t mode);
>> =C2=A0
>> +diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.=
c
>> +index be6dd1654a..2726dc946a 100644
>> --- a/src/shared/base-filesystem.c
>> +++ b/src/shared/base-filesystem.c
>> -@@ -131,7 +131,7 @@ int base_filesystem_create(const char *r
>> +@@ -131,7 +131,7 @@ int base_filesystem_create(const char *root, uid_t =
uid, gid_t gid) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return log_error_errno(errno, "Failed to ope=
n root file system: %m");
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (size_t i =3D=
 0; i < ELEMENTSOF(table); i++) {
>> @@ -73,7 +76,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 continue;
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (table[i].target) {
>> -@@ -139,7 +139,7 @@ int base_filesystem_create(const char *r
>> +@@ -139,7 +139,7 @@ int base_filesystem_create(const char *root, uid_t =
uid, gid_t gid) {
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /* check if one of the targets exists */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 NULSTR_FOREACH(s, table[i].target) {
>> @@ -82,7 +85,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* check if a specific =
file exists at the target path */
>> -@@ -150,7 +150,7 @@ int base_filesystem_create(const char *r
>> +@@ -150,7 +150,7 @@ int base_filesystem_create(const char *root, uid_t =
uid, gid_t gid) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if (!p)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn log_oom();
>> =C2=A0
>> @@ -91,3 +94,6 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
ntinue;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compati=
ble-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/=
0017-Define-glibc-compatible-basename-for-non-glibc-syste.patch
>> similarity index 81%
>> rename from meta/recipes-core/systemd/systemd/0013-Define-glibc-compatib=
le-basename-for-non-glibc-syste.patch
>> rename to meta/recipes-core/systemd/systemd/0017-Define-glibc-compatible=
-basename-for-non-glibc-syste.patch
>> index 3228f1716b..7d74cfcc24 100644
>> --- a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-bas=
ename-for-non-glibc-syste.patch
>> +++ b/meta/recipes-core/systemd/systemd/0017-Define-glibc-compatible-bas=
ename-for-non-glibc-syste.patch
>> @@ -1,4 +1,4 @@
>> -From d0bdce977b7acc5e45e82cf84256c4bedc0e74c4 Mon Sep 17 00:00:00 2001
>> +From fdc7fb940bb41020271b9db41d5608004efdbde5 Mon Sep 17 00:00:00 2001
>> From: Khem Raj <raj.khem@gmail.com>
>> Date: Sun, 27 May 2018 08:36:44 -0700
>> Subject: [PATCH] Define glibc compatible basename() for non-glibc system=
s
>> @@ -9,11 +9,12 @@ using non-posix basename implementation, we have a way=
 out
>> Upstream-Status: Inappropriate [musl specific]
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>> ---
>> =C2=A0 src/machine/machine-dbus.c | 5 +++++
>> =C2=A0 1 file changed, 5 insertions(+)
>>=20
>> +diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
>> +index 45bc056326..aee51d5da5 100644
>> --- a/src/machine/machine-dbus.c
>> +++ b/src/machine/machine-dbus.c
>> @@ -4,6 +4,11 @@
>> @@ -28,3 +29,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> =C2=A0 #include "alloc-util.h"
>> =C2=A0 #include "bus-common-errors.h"
>> =C2=A0 #include "bus-get-properties.h"
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffe=
ring-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/=
0018-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
>> similarity index 83%
>> rename from meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffer=
ing-when-writing-to-oom_score_a.patch
>> rename to meta/recipes-core/systemd/systemd/0018-Do-not-disable-bufferin=
g-when-writing-to-oom_score_a.patch
>> index da56d8b4b6..401a9a9546 100644
>> --- a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-wh=
en-writing-to-oom_score_a.patch
>> +++ b/meta/recipes-core/systemd/systemd/0018-Do-not-disable-buffering-wh=
en-writing-to-oom_score_a.patch
>> @@ -1,4 +1,4 @@
>> -From e480d28305907c3874f4e58b722b8aa43c3ac7a2 Mon Sep 17 00:00:00 2001
>> +From 32fd0dc67b6df531f0769dbb099dbe8f30c28514 Mon Sep 17 00:00:00 2001
>> From: Chen Qi <Qi.Chen@windriver.com>
>> Date: Wed, 4 Jul 2018 15:00:44 +0800
>> Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
>> @@ -19,14 +19,15 @@ Upstream-Status: Inappropriate [musl specific]
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> [rebased for systemd 243]
>> Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>> -
>> ---
>> =C2=A0 src/basic/process-util.c | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> +diff --git a/src/basic/process-util.c b/src/basic/process-util.c
>> +index 0747c14c1c..8d0c5aae92 100644
>> --- a/src/basic/process-util.c
>> +++ b/src/basic/process-util.c
>> -@@ -1466,7 +1466,7 @@ int set_oom_score_adjust(int value) {
>> +@@ -1405,7 +1405,7 @@ int set_oom_score_adjust(int value) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xsprintf(t, "%i",=
 value);
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return write_stri=
ng_file("/proc/self/oom_score_adj", t,
>> @@ -35,3 +36,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com=
>
>> =C2=A0 }
>> =C2=A0
>> =C2=A0 int get_oom_score_adjust(int *ret) {
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-comp=
liant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/=
0019-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
>> similarity index 70%
>> rename from meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compl=
iant-strerror_r-from-GNU-specif.patch
>> rename to meta/recipes-core/systemd/systemd/0019-distinguish-XSI-complia=
nt-strerror_r-from-GNU-specif.patch
>> index 7533fde1e1..48b8eda0a5 100644
>> --- a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-s=
trerror_r-from-GNU-specif.patch
>> +++ b/meta/recipes-core/systemd/systemd/0019-distinguish-XSI-compliant-s=
trerror_r-from-GNU-specif.patch
>> @@ -1,4 +1,4 @@
>> -From 0542d27ebbb250c09bdcfcf9f2ea3d27426fe522 Mon Sep 17 00:00:00 2001
>> +From ed46afcbc6bc1f6277a0a54c3db8cf1b056bca1e Mon Sep 17 00:00:00 2001
>> From: Chen Qi <Qi.Chen@windriver.com>
>> Date: Tue, 10 Jul 2018 15:40:17 +0800
>> Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
>> @@ -18,15 +18,16 @@ assigned to (char *) variable, resulting in segment =
fault.
>> Upstream-Status: Inappropriate [musl specific]
>>=20
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> -
>> ---
>> - src/libsystemd/sd-bus/bus-error.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 5 +++++
>> - src/libsystemd/sd-journal/journal-send.c | 5 +++++
>> - 2 files changed, 10 insertions(+)
>> + src/libsystemd/sd-bus/bus-error.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 11 ++++++++++-
>> + src/libsystemd/sd-journal/journal-send.c |=C2=A0 5 +++++
>> + 2 files changed, 15 insertions(+), 1 deletion(-)
>>=20
>> +diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/=
bus-error.c
>> +index 413e2dd43f..805e5da0c0 100644
>> --- a/src/libsystemd/sd-bus/bus-error.c
>> +++ b/src/libsystemd/sd-bus/bus-error.c
>> -@@ -409,7 +409,12 @@ static void bus_error_strerror(sd_bus_er
>> +@@ -408,7 +408,12 @@ static void bus_error_strerror(sd_bus_error *e, in=
t error) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return;
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 errno =3D 0;
>> @@ -39,7 +40,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (errno =3D=3D ERANGE || strlen(x) >=3D k =
- 1) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 free(m);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 k *=3D 2;
>> -@@ -594,8 +599,12 @@ const char* _bus_error_message(const sd_
>> +@@ -593,8 +598,12 @@ const char* _bus_error_message(const sd_bus_error =
*e, int error, char buf[static
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (e && e->messa=
ge)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return e->message;
>> @@ -53,9 +54,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> =C2=A0 }
>> =C2=A0
>> =C2=A0 static bool map_ok(const sd_bus_error_map *map) {
>> +diff --git a/src/libsystemd/sd-journal/journal-send.c b/src/libsystemd/=
sd-journal/journal-send.c
>> +index 136ebcb153..8a75ba4ecd 100644
>> --- a/src/libsystemd/sd-journal/journal-send.c
>> +++ b/src/libsystemd/sd-journal/journal-send.c
>> -@@ -381,7 +381,12 @@ static int fill_iovec_perror_and_send(co
>> +@@ -381,7 +381,12 @@ static int fill_iovec_perror_and_send(const char *=
message, int skip, struct iove
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char* j;
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 errno =3D 0;
>> @@ -68,3 +71,6 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (errno =3D=3D 0) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 char error[STRLEN("ERRNO=3D") + DECIMAL_STR_MAX(int) + 1];
>> =C2=A0
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-o=
f-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0020-avo=
id-redefinition-of-prctl_mm_map-structure.patch
>> similarity index 91%
>> rename from meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of=
-prctl_mm_map-structure.patch
>> rename to meta/recipes-core/systemd/systemd/0020-avoid-redefinition-of-p=
rctl_mm_map-structure.patch
>> index 1fcba7af08..e5f017347c 100644
>> --- a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl=
_mm_map-structure.patch
>> +++ b/meta/recipes-core/systemd/systemd/0020-avoid-redefinition-of-prctl=
_mm_map-structure.patch
>> @@ -1,4 +1,4 @@
>> -From e1d0210b47906dd121f936f3181092835df6a95c Mon Sep 17 00:00:00 2001
>> +From 277b680d07a178b8278862b60417052d05c1376f Mon Sep 17 00:00:00 2001
>> From: Chen Qi <Qi.Chen@windriver.com>
>> Date: Mon, 25 Feb 2019 15:44:54 +0800
>> Subject: [PATCH] avoid redefinition of prctl_mm_map structure
>> @@ -9,7 +9,6 @@ error: redefinition of 'struct prctl_mm_map'
>> Upstream-Status: Inappropriate [musl specific]
>>=20
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> -
>> ---
>> =C2=A0 src/basic/missing_prctl.h | 2 ++
>> =C2=A0 1 file changed, 2 insertions(+)
>> @@ -28,3 +27,6 @@ index ab851306ba..5547cad875 100644
>> =C2=A0
>> =C2=A0 /* 58319057b7847667f0c9585b9de0e8932b0fdb08 (4.3) */
>> =C2=A0 #ifndef PR_CAP_AMBIENT
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffe=
r-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0021-do-not-di=
sable-buffer-in-writing-files.patch
>> similarity index 78%
>> rename from meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer=
-in-writing-files.patch
>> rename to meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-i=
n-writing-files.patch
>> index 6edab0dfe2..46267a5ada 100644
>> --- a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-wr=
iting-files.patch
>> +++ b/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-wr=
iting-files.patch
>> @@ -1,4 +1,4 @@
>> -From 414e2f97008a1f3c26a260a6dc4d51a8c1fa6900 Mon Sep 17 00:00:00 2001
>> +From aa6e5588e6d01c12e2f101d140cc710ab199df16 Mon Sep 17 00:00:00 2001
>> From: Chen Qi <Qi.Chen@windriver.com>
>> Date: Fri, 1 Mar 2019 15:22:15 +0800
>> Subject: [PATCH] do not disable buffer in writing files
>> @@ -18,16 +18,14 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>> [rebased for systemd 243]
>> Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>> -
>> ---
>> =C2=A0 src/basic/cgroup-util.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++------
>> =C2=A0 src/basic/namespace-util.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
>> =C2=A0 src/basic/procfs-util.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
>> =C2=A0 src/basic/sysctl-util.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>> - src/basic/util.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +-
>> =C2=A0 src/binfmt/binfmt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 6 +++---
>> =C2=A0 src/core/cgroup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +-
>> - src/core/main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
>> + src/core/main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>> =C2=A0 src/core/smack-setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++=
----
>> =C2=A0 src/hibernate-resume/hibernate-resume.c |=C2=A0 2 +-
>> =C2=A0 src/home/homework.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 2 +-
>> @@ -41,11 +39,13 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
>> =C2=A0 src/sleep/sleep.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 8 ++++----
>> =C2=A0 src/udev/udev-rules.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
1 -
>> =C2=A0 src/vconsole/vconsole-setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>> - 21 files changed, 39 insertions(+), 40 deletions(-)
>> + 20 files changed, 37 insertions(+), 38 deletions(-)
>>=20
>> +diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
>> +index 11b4375ed5..7d81a6007f 100644
>> --- a/src/basic/cgroup-util.c
>> +++ b/src/basic/cgroup-util.c
>> -@@ -399,7 +399,7 @@ int cg_kill_kernel_sigkill(const char *c
>> +@@ -399,7 +399,7 @@ int cg_kill_kernel_sigkill(const char *controller, =
const char *path) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;
>> =C2=A0
>> @@ -54,7 +54,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com=
>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;
>> =C2=A0
>> -@@ -805,7 +805,7 @@ int cg_install_release_agent(const char
>> +@@ -805,7 +805,7 @@ int cg_install_release_agent(const char *controller=
, const char *agent) {
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc =3D strstrip(c=
ontents);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (isempty(sc)) =
{
>> @@ -63,7 +63,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com=
>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return r;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (!path_=
equal(sc, agent))
>> -@@ -823,7 +823,7 @@ int cg_install_release_agent(const char
>> +@@ -823,7 +823,7 @@ int cg_install_release_agent(const char *controller=
, const char *agent) {
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc =3D strstrip(c=
ontents);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (streq(sc, "0"=
)) {
>> @@ -72,7 +72,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com=
>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return r;
>> =C2=A0
>> -@@ -850,7 +850,7 @@ int cg_uninstall_release_agent(const cha
>> +@@ -850,7 +850,7 @@ int cg_uninstall_release_agent(const char *controll=
er) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;
>> =C2=A0
>> @@ -81,7 +81,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com=
>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;
>> =C2=A0
>> -@@ -860,7 +860,7 @@ int cg_uninstall_release_agent(const cha
>> +@@ -860,7 +860,7 @@ int cg_uninstall_release_agent(const char *controll=
er) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;
>> =C2=A0
>> @@ -90,7 +90,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com=
>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;
>> =C2=A0
>> -@@ -1730,7 +1730,7 @@ int cg_set_attribute(const char *control
>> +@@ -1752,7 +1752,7 @@ int cg_set_attribute(const char *controller, cons=
t char *path, const char *attri
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;
>> =C2=A0
>> @@ -99,9 +99,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
>> =C2=A0 }
>> =C2=A0
>> =C2=A0 int cg_get_attribute(const char *controller, const char *path, co=
nst char *attribute, char **ret) {
>> +diff --git a/src/basic/namespace-util.c b/src/basic/namespace-util.c
>> +index f5c0e04cec..272b920022 100644
>> --- a/src/basic/namespace-util.c
>> +++ b/src/basic/namespace-util.c
>> -@@ -220,12 +220,12 @@ int userns_acquire(const char *uid_map,
>> +@@ -220,12 +220,12 @@ int userns_acquire(const char *uid_map, const cha=
r *gid_map) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 freeze();
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xsprintf(path, "/=
proc/" PID_FMT "/uid_map", pid);
>> @@ -116,9 +118,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.=
com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return log_error_errno(r, "Failed to write G=
ID map: %m");
>> =C2=A0
>> +diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
>> +index 64a95dd866..12cd16db1c 100644
>> --- a/src/basic/procfs-util.c
>> +++ b/src/basic/procfs-util.c
>> -@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limi
>> +@@ -64,13 +64,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * decrease =
it, as threads-max is the much more relevant sysctl. */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (limit > pid_m=
ax-1) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sprintf(buffer, "%" PRIu64, limit+1); /* Add=
 one, since PID 0 is not a valid PID */
>> @@ -134,9 +138,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.=
com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t threads_max;
>> =C2=A0
>> +diff --git a/src/basic/sysctl-util.c b/src/basic/sysctl-util.c
>> +index b66a6622ae..8d1c93008a 100644
>> --- a/src/basic/sysctl-util.c
>> +++ b/src/basic/sysctl-util.c
>> -@@ -58,7 +58,7 @@ int sysctl_write(const char *property, c
>> +@@ -58,7 +58,7 @@ int sysctl_write(const char *property, const char *va=
lue) {
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_debug("Settin=
g '%s' to '%s'", p, value);
>> =C2=A0
>> @@ -145,20 +151,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko=
.com>
>> =C2=A0 }
>> =C2=A0
>> =C2=A0 int sysctl_writef(const char *property, const char *format, ...) =
{
>> ---- a/src/basic/util.c
>> -+++ b/src/basic/util.c
>> -@@ -134,7 +134,7 @@ void disable_coredumps(void) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (detect_container()=
 > 0)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> -
>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D write_string_file("/p=
roc/sys/kernel/core_pattern", "|/bin/false", WRITE_STRING_FILE_DISABLE_BUFF=
ER);
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D write_string_file("/p=
roc/sys/kernel/core_pattern", "|/bin/false", 0);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_debug_errno(r, "Failed to turn off coredump=
s, ignoring: %m");
>> - }
>> +diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
>> +index e1ddf97914..df6e156f19 100644
>> --- a/src/binfmt/binfmt.c
>> +++ b/src/binfmt/binfmt.c
>> -@@ -29,7 +29,7 @@ static bool arg_unregister =3D false;
>> +@@ -30,7 +30,7 @@ static bool arg_unregister =3D false;
>> =C2=A0
>> =C2=A0 static int delete_rule(const char *rulename) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *fn =
=3D strjoina("/proc/sys/fs/binfmt_misc/", rulename);
>> @@ -167,7 +164,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
>> =C2=A0 }
>> =C2=A0
>> =C2=A0 static int apply_rule(const char *filename, unsigned line, const =
char *rule) {
>> -@@ -59,7 +59,7 @@ static int apply_rule(const char *filena
>> +@@ -58,7 +58,7 @@ static int apply_rule(const char *filename, unsigned =
line, const char *rule) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r >=3D 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_debug("%s:%u: Rule '%s' deleted.", filen=
ame, line, rulename);
>> =C2=A0
>> @@ -176,8 +173,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return log_error_errno(r, "%s:%u: Failed to =
add binary format '%s': %m",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 filename, line, rulename);
>> -@@ -225,7 +225,7 @@ static int run(int argc, char *argv[]) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +@@ -244,7 +244,7 @@ static int run(int argc, char *argv[]) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return r;
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Flush out all rules */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 r =3D write_string_file("/proc/sys/fs/binfmt_misc/sta=
tus", "-1", WRITE_STRING_FILE_DISABLE_BUFFER);
>> @@ -185,9 +182,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.=
com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 log_warning_errno(r, "Failed to flush binfmt_misc rules, ignoring: %m")=
;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> +diff --git a/src/core/cgroup.c b/src/core/cgroup.c
>> +index 4cac3f6a89..bebe2cd120 100644
>> --- a/src/core/cgroup.c
>> +++ b/src/core/cgroup.c
>> -@@ -4210,7 +4210,7 @@ int unit_cgroup_freezer_action(Unit *u,
>> +@@ -4267,7 +4267,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAc=
tion action) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 u->freezer_state =3D FREEZER_THAWING;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0
>> @@ -196,18 +195,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko=
.com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;
>> =C2=A0
>> +diff --git a/src/core/main.c b/src/core/main.c
>> +index c0b8126d96..fe676320ba 100644
>> --- a/src/core/main.c
>> +++ b/src/core/main.c
>> -@@ -1404,7 +1404,7 @@ static int bump_unix_max_dgram_qlen(void
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (v >=3D DEFAULT_UNI=
X_MAX_DGRAM_QLEN)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> -
>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D write_string_filef("/=
proc/sys/net/unix/max_dgram_qlen", WRITE_STRING_FILE_DISABLE_BUFFER,
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D write_string_filef("/=
proc/sys/net/unix/max_dgram_qlen", 0,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%lu", DEFAULT_UNIX_MAX_DGRAM_QL=
EN);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return log_full_errno(IN_SET(r, -EROFS, -EPERM,=
 -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
>> -@@ -1676,7 +1676,7 @@ static void initialize_core_pattern(bool
>> +@@ -1716,7 +1716,7 @@ static void initialize_core_pattern(bool skip_set=
up) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (getpid_cached=
() !=3D 1)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> =C2=A0
>> @@ -216,9 +208,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.=
com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_warning_errno(r, "Failed to write '%s' t=
o /proc/sys/kernel/core_pattern, ignoring: %m",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arg_early_c=
ore_pattern);
>> +diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
>> +index bcaa237c8d..4032bde19e 100644
>> --- a/src/core/smack-setup.c
>> +++ b/src/core/smack-setup.c
>> -@@ -320,17 +320,17 @@ int mac_smack_setup(bool *loaded_policy)
>> +@@ -319,17 +319,17 @@ int mac_smack_setup(bool *loaded_policy) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0
>> =C2=A0 #if HAVE_SMACK_RUN_LABEL
>> @@ -240,6 +234,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_warning_errno(r, "Failed to set SMACK ne=
tlabel rule \"127.0.0.1 -CIPSO\": %m");
>> =C2=A0 #endif
>> +diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-re=
sume/hibernate-resume.c
>> +index 9a9df5d22f..75ddec881a 100644
>> --- a/src/hibernate-resume/hibernate-resume.c
>> +++ b/src/hibernate-resume/hibernate-resume.c
>> @@ -40,7 +40,7 @@ int main(int argc, char *argv[]) {
>> @@ -251,6 +247,8 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_error_errno(r, "Failed to write '" DEVNU=
M_FORMAT_STR "' to /sys/power/resume: %m", DEVNUM_FORMAT_VAL(st.st_rdev));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return EXIT_FAILURE;
>> +diff --git a/src/home/homework.c b/src/home/homework.c
>> +index 28907386a4..f9e45349a7 100644
>> --- a/src/home/homework.c
>> +++ b/src/home/homework.c
>> @@ -278,7 +278,7 @@ static void drop_caches_now(void) {
>> @@ -262,9 +260,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.=
com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_warning_errno(r, "Failed to drop caches,=
 ignoring: %m");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> +diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-d=
evice/sd-device.c
>> +index 8c65ee3469..153edab081 100644
>> --- a/src/libsystemd/sd-device/sd-device.c
>> +++ b/src/libsystemd/sd-device/sd-device.c
>> -@@ -2444,7 +2444,7 @@ _public_ int sd_device_set_sysattr_value
>> +@@ -2481,7 +2481,7 @@ _public_ int sd_device_set_sysattr_value(sd_devic=
e *device, const char *sysattr,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!value)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>> =C2=A0
>> @@ -273,9 +273,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.=
com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* On failure, clear cache entry, as we do n=
ot know how it fails. */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_remove_cached_sysattr_value(device, s=
ysattr);
>> +diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
>> +index 0deb4ebb30..bae8eead9e 100644
>> --- a/src/nspawn/nspawn-cgroup.c
>> +++ b/src/nspawn/nspawn-cgroup.c
>> -@@ -123,7 +123,7 @@ int sync_cgroup(pid_t pid, CGroupUnified
>> +@@ -122,7 +122,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_re=
quested, uid_t uid_shift) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn =3D strjoina(t=
ree, cgroup, "/cgroup.procs");
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sprintf(pid_strin=
g, PID_FMT, pid);
>> @@ -284,9 +286,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.=
com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_error_errno(r, "Failed to move process: =
%m");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto finish;
>> +diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
>> +index 36d336dfc8..8c5c69596b 100644
>> --- a/src/nspawn/nspawn.c
>> +++ b/src/nspawn/nspawn.c
>> -@@ -2762,7 +2762,7 @@ static int reset_audit_loginuid(void) {
>> +@@ -2771,7 +2771,7 @@ static int reset_audit_loginuid(void) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (streq(p, "429=
4967295"))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0
>> @@ -295,7 +299,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_error_errno(r,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to reset audit =
login UID. This probably means that your kernel is too\n"
>> -@@ -4187,7 +4187,7 @@ static int setup_uid_map(
>> +@@ -4211,7 +4211,7 @@ static int setup_uid_map(
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return log_oom();
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xsprintf(uid_map,=
 "/proc/" PID_FMT "/uid_map", pid);
>> @@ -304,7 +308,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return log_error_errno(r, "Failed to write U=
ID map: %m");
>> =C2=A0
>> -@@ -4197,7 +4197,7 @@ static int setup_uid_map(
>> +@@ -4221,7 +4221,7 @@ static int setup_uid_map(
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return log_oom();
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xsprintf(uid_map,=
 "/proc/" PID_FMT "/gid_map", pid);
>> @@ -313,20 +317,24 @@ Signed-off-by: Scott Murray <scott.murray@konsulko=
.com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return log_error_errno(r, "Failed to write G=
ID map: %m");
>> =C2=A0
>> +diff --git a/src/shared/binfmt-util.c b/src/shared/binfmt-util.c
>> +index a26175474b..1413a9c72c 100644
>> --- a/src/shared/binfmt-util.c
>> +++ b/src/shared/binfmt-util.c
>> -@@ -26,7 +26,7 @@ int disable_binfmt(void) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return log_warning_errno(r, "Failed to determin=
e whether binfmt_misc is mounted: %m");
>> +@@ -46,7 +46,7 @@ int disable_binfmt(void) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D write_string_file("/pr=
oc/sys/fs/binfmt_misc/status", "-1", WRITE_STRING_FILE_DISABLE_BUFFER);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D write_string_file("/pr=
oc/sys/fs/binfmt_misc/status", "-1", 0);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return log_warning_errno(r, "Failed to unreg=
ister binfmt_misc entries: %m");
>> =C2=A0
>> +diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
>> +index 2ea83f05d3..8626bb184c 100644
>> --- a/src/shared/cgroup-setup.c
>> +++ b/src/shared/cgroup-setup.c
>> -@@ -350,7 +350,7 @@ int cg_attach(const char *controller, co
>> +@@ -350,7 +350,7 @@ int cg_attach(const char *controller, const char *p=
ath, pid_t pid) {
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xsprintf(c, PID_F=
MT "\n", pid);
>> =C2=A0
>> @@ -344,18 +352,24 @@ Signed-off-by: Scott Murray <scott.murray@konsulko=
.com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (r < 0) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_debug_errno(r, "Fai=
led to %s controller %s for %s (%s): %m",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FL=
AGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
>> +diff --git a/src/shared/coredump-util.c b/src/shared/coredump-util.c
>> +index 3d2f179049..c1b6c170ac 100644
>> --- a/src/shared/coredump-util.c
>> +++ b/src/shared/coredump-util.c
>> -@@ -70,5 +70,5 @@ int set_coredump_filter(uint64_t value)
>> +@@ -71,7 +71,7 @@ int set_coredump_filter(uint64_t value) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sprintf(t, "0x%"P=
RIx64, value);
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return write_stri=
ng_file("/proc/self/coredump_filter", t,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WRITE_STRING_FILE_VERIFY_O=
N_FAILURE|WRITE_STRING_FILE_DISABLE_BUFFER);
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WRITE_STRING_FILE_VERIFY_O=
N_FAILURE);
>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0);
>> =C2=A0 }
>> +
>> + /* Turn off core dumps but only if we're running outside of a containe=
r. */
>> +diff --git a/src/shared/smack-util.c b/src/shared/smack-util.c
>> +index b3b5c905ad..bbfa1973fd 100644
>> --- a/src/shared/smack-util.c
>> +++ b/src/shared/smack-util.c
>> -@@ -115,7 +115,7 @@ int mac_smack_apply_pid(pid_t pid, const
>> +@@ -115,7 +115,7 @@ int mac_smack_apply_pid(pid_t pid, const char *labe=
l) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p =3D procfs_file=
_alloca(pid, "attr/current");
>> @@ -364,9 +378,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.=
com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;
>> =C2=A0
>> +diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
>> +index 765dd4974f..cd6afb001b 100644
>> --- a/src/sleep/sleep.c
>> +++ b/src/sleep/sleep.c
>> -@@ -50,7 +50,7 @@ static int write_hibernate_location_info
>> +@@ -50,7 +50,7 @@ static int write_hibernate_location_info(const Hibern=
ateLocation *hibernate_loca
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert(hibernate_=
location->swap);
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xsprintf(resume_s=
tr, "%u:%u", major(hibernate_location->devno), minor(hibernate_location->de=
vno));
>> @@ -375,7 +391,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return log_debug_errno(r, "Failed to write p=
artition device to /sys/power/resume for '%s': '%s': %m",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 hibernate_location->swap->device, resume_str);
>> -@@ -77,7 +77,7 @@ static int write_hibernate_location_info
>> +@@ -77,7 +77,7 @@ static int write_hibernate_location_info(const Hibern=
ateLocation *hibernate_loca
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xsprintf(offset_s=
tr, "%" PRIu64, hibernate_location->offset);
>> @@ -393,7 +409,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (k >=3D 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return 0;
>> =C2=A0
>> -@@ -114,7 +114,7 @@ static int write_state(FILE **f, char **
>> +@@ -114,7 +114,7 @@ static int write_state(FILE **f, char **states) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 STRV_FOREACH(stat=
e, states) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int k;
>> =C2=A0
>> @@ -402,9 +418,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.=
com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (k >=3D 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_debug_errno(k, "Failed to write '%s' to =
/sys/power/state: %m", *state);
>> +diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
>> +index 0ce79f815c..28aab475d0 100644
>> --- a/src/udev/udev-rules.c
>> +++ b/src/udev/udev-rules.c
>> -@@ -2354,7 +2354,6 @@ static int udev_rule_apply_token_to_even
>> +@@ -2357,7 +2357,6 @@ static int udev_rule_apply_token_to_event(
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log_rule_debug(dev, rules, "ATTR '%s' writin=
g '%s'", buf, value);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D write_string_file(buf, value,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 WRITE_STRING_FILE_VERIFY_ON_FAILURE |
>> @@ -412,9 +430,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.=
com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 WRITE_STRING_FILE_AVOID_NEWLINE |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 WRITE_STRING_FILE_VERIFY_IGNORE_NEWLINE);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> +diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setu=
p.c
>> +index 7d3e9db73f..2d4a0c4c9d 100644
>> --- a/src/vconsole/vconsole-setup.c
>> +++ b/src/vconsole/vconsole-setup.c
>> -@@ -108,7 +108,7 @@ static int toggle_utf8_vc(const char *na
>> +@@ -108,7 +108,7 @@ static int toggle_utf8_vc(const char *name, int fd,=
 bool utf8) {
>> =C2=A0 static int toggle_utf8_sysfs(bool utf8) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int r;
>> =C2=A0
>> @@ -423,3 +443,6 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.c=
om>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return log_warning_errno(r, "Failed to %s sy=
sfs UTF-8 flag: %m", enable_disable(utf8));
>> =C2=A0
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-us=
age.patch b/meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usage.=
patch
>> similarity index 94%
>> rename from meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usa=
ge.patch
>> rename to meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usage=
.patch
>> index 6981d70af0..61545f5778 100644
>> --- a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.pat=
ch
>> +++ b/meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usage.pat=
ch
>> @@ -1,4 +1,4 @@
>> -From 8871f78c559f37169c0cfaf20b0af1dbec0399af Mon Sep 17 00:00:00 2001
>> +From a50ec65dbe660421052656dda7499c925005f486 Mon Sep 17 00:00:00 2001
>> From: Scott Murray <scott.murray@konsulko.com>
>> Date: Fri, 13 Sep 2019 19:26:27 -0400
>> Subject: [PATCH] Handle __cpu_mask usage
>> @@ -18,7 +18,6 @@ add a typedef to cpu-set-util.h defining __cpu_mask ap=
propriately.
>> Upstream-Status: Inappropriate [musl specific]
>>=20
>> Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>> -
>> ---
>> =C2=A0 src/shared/cpu-set-util.h | 2 ++
>> =C2=A0 src/test/test-sizeof.c=C2=A0=C2=A0=C2=A0 | 2 +-
>> @@ -38,7 +37,7 @@ index 3c63a58826..4c2d4347fc 100644
>> =C2=A0 typedef struct CPUSet {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_set_t *set;
>> diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
>> -index 602772227e..7f1ed19d77 100644
>> +index 6cf92bffde..937d26ca55 100644
>> --- a/src/test/test-sizeof.c
>> +++ b/src/test/test-sizeof.c
>> @@ -1,6 +1,5 @@
>> @@ -56,3 +55,6 @@ index 602772227e..7f1ed19d77 100644
>> =C2=A0
>> =C2=A0 /* Print information about various types. Useful when diagnosing
>> =C2=A0=C2=A0 * gcc diagnostics on an unfamiliar architecture. */
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshad=
ow.patch b/meta/recipes-core/systemd/systemd/0023-Handle-missing-gshadow.pa=
tch
>> similarity index 85%
>> rename from meta/recipes-core/systemd/systemd/0026-Ha ...

