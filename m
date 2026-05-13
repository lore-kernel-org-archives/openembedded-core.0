Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C1BCD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 13:34:54 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7696.1778679294297711498
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 06:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BDw2aHMr;
 spf=pass (domain: gmail.com, ip: 209.85.221.177, mailfrom: martin.jansa@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5637886c92aso3226683e0c.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 06:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778679293; cv=none;
        d=google.com; s=arc-20240605;
        b=gy0vgypjFnVBgQgKBLmse6m9VN/XUI2dyBoixVgtO/U+m++PaI27cb+ecZd2p0bWwo
         wxqqVaGQUxhL1x8abQT6TVYI1rt1JMCfhT0HesXpTmDigKNw5GRLdRLNmPZvyL1LcGrZ
         vW7/FW6YNH6SogESbxIDjGJXU50iU09gHqm9e6L9XCWs+tsodHLB/WxtSAEXjfCiZqpO
         B+F1IKuCR/OWkF24GFNQC+7xg4P0iOUba3cVzurdrToJE28v/xqN+IqwBQU42ktYNJ9L
         lwcpY+ZSXEhDPaPpCfZZCD+zxnnhD9FQ8u1lxYioNdT9WjNPdfTk/G2HS/JJQjbKzafC
         yOdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gt5cbVIdcSiefcI4ErGlRshI97WYzM4aD3mpOcrYfcE=;
        fh=6irEZha/lyQ3HYzOyzz/XoTRlEv55OlHAKTGuuXF/dc=;
        b=LE+Ps4mdfyKUfcag56Z2UkYwDSn2Dj0jElnELFTwawJuPNeApPdQWa88oRmzf0e4i3
         bsUuTUPK4E4fVxt6LC/VDRfHgCQtr21+tkTl54nHfMTcTgyyiiBfi6MYhvDlRoXk0HdX
         o4TSSjAVoPuu87hEZrT/w7sjpV2SYnck57n3st7Nd5dYISpw4kZW27Ee8U5l/JepQo4W
         XuLZckm2czbT1xtxrzNFfbeVVLlGo1uprvxR0mD1pXiAO6a3k3DtpAq1EX34P6lIc2lp
         J2LV52VE0tdjUujip5LQweZt+hSGGX5GndyCbj8fln6feqxPQyj2v21o1Q7vzvR0+NXr
         iO7A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778679293; x=1779284093; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt5cbVIdcSiefcI4ErGlRshI97WYzM4aD3mpOcrYfcE=;
        b=BDw2aHMr5aGQMtdOlbOtDnRh68RKAzsrVTOM6ywzvhuUnTdwCh7l5nbp3Zugb7Jv01
         RAOLjK/ixOjB8baF6WRKabcgfbdfGAg3om9mBYa7G7LHN1LygYuC2pck9vaL5Gu479Ej
         Llr4ajRoiuXABCGPw8nC3d8i65RZlu9jCf2u9GTEb5OBzYaxkPaS5kEl/lRI8dQq3ywj
         h/VD86cd7TTrPjYCZ0tR29NA7Hkdj+0I98JamQ3njpBdYSuwzVJcKu90hgvySTLL8R0f
         iUNE8h5Fc9cowle5l4JLohwgHxBGFM6E51alGfsH3M5DI/Fp2bIWjlq+5S8PX5j6R/U5
         Xr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679293; x=1779284093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gt5cbVIdcSiefcI4ErGlRshI97WYzM4aD3mpOcrYfcE=;
        b=kt+MoOyL4wy0sbPXjN8GeT/syV3FwKvJzFIwLOCpQ5a8yO5k0lWsInWLo4OrPHyBr8
         xLnD4lU/oHRLgbClx20YoEpZgkdXOcDv7HGnEH7oDxp9qK/lIJYvT8UbWRgDdgYHTB04
         cx6JMzVLHITKDv2ppgVQ3mP7RM11SlxDmPaO+4rmyAuN2s+miqWpcAxPS7ERnzDERrgH
         L/ptRdm72I559ITn/uNi+kIlJB16lycCY6bupUHUsLMoTWROXNFVT1ExO0P2AqZS0BVC
         YD8AcJNyn0qvS4+2TchnK7aptHqRC5ko0m81M4uezJd52/x+4J5RlsQdVrgMzUePKT8t
         PJiQ==
X-Gm-Message-State: AOJu0YzMKz7gYc67tFfMayu7Rx5wqs+lviwwgFWMZ4UNN5h3/73WQAgd
	r3DveFhwatDZvPSfJHzXojNU2xZLFBO+OBBEKfZVd+oIe2d+lNzg7AL9GSLn9dh5cxm8uk22Vyu
	ToIEdxy6P2X4jNuBSN8XxYQ3hEjBuN5t3NQ==
X-Gm-Gg: Acq92OEAbjoWXF3xl27uQd/TA8XnYaUIjJDteGmAEXxBXQ0W2joPocmnfjk8rQsT+ow
	Kf9oVenQnsp8C6dX1540GGyAJ9jLeMjNPLJUFBtjTLTQupIj1OmStEti7pYHMkGQ3cEnhO/0Ie7
	+RiVU1TcUmRJlM5FnwT43LyNo4j6T7kbYwD1o5yHyCabw4Vidd6KlHzxuL6Vyt/UcsTNmM5jMQn
	C6tu948oxKj4pDk7aWnHHbIpbxXMo5tsLnCiswfVDg/T4tPJLhjp6jF+NweLGo2DujwWR9MOeQO
	T5QvsKqznyPob7qi0f3hwR5GNV/OcMur32sLEAAAR64aQC95lYsr8sy1ZZwKS0cNnw==
X-Received: by 2002:a05:6122:6992:b0:575:352f:eac0 with SMTP id
 71dfb90a1353d-575e6fb88e4mr1519936e0c.7.1778679293026; Wed, 13 May 2026
 06:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260428122528.659662-1-hprajapati@mvista.com>
In-Reply-To: <20260428122528.659662-1-hprajapati@mvista.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 May 2026 15:34:35 +0200
X-Gm-Features: AVHnY4KvLW5T5EK3Tt9P81CBbVMrwU5ZcAiXeV7aS1DZ6ynIhPt3CAcBg-ranPk
Message-ID: <CA+chaQf-kkXEosZPvmG_6G41+b4vPabCAvo2PCSJJSvpqRSrRQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] systemd: fix for CVE-2026-40225
To: hprajapati@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 13:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236979

This is causing do_patch failure for scarthgap builds with musl:

Hunk #1 FAILED at 39.
1 out of 1 hunk FAILED -- rejects in file src/udev/udev-builtin-net_id.c
patching file src/udev/udev-builtin-path_id.c
patching file src/udev/udev-event.c
patching file src/udev/udev-rules.c
Patch 0003-src-basic-missing.h-check-for-missing-strndupa.patch does
not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in:
/OE/build/oe-core/tmp-musl/work/core2-64-oe-linux-musl/systemd/255.21/temp/=
log.do_patch.215528
ERROR: Task (/OE/build/oe-core/openembedded-core/meta/recipes-core/systemd/=
systemd_255.21.bb:do_patch)
failed with exit code '1'

I'll send a fix.



On Tue, Apr 28, 2026 at 2:25=E2=80=AFPM Hitendra Prajapati via
lists.openembedded.org <hprajapati=3Dmvista.com@lists.openembedded.org>
wrote:
>
> Backport commit[0] and [1] which fixes this vulnerability as mentioned in=
 Debian report [2].
>
> [0] https://github.com/systemd/systemd/commit/03bb697b8df0339c37f4b845025=
320b261aeb7cc
> [1] https://github.com/systemd/systemd/commit/5887e72ff87d3a66a4c3fa91897=
fbec1545f4d3d
> [2] https://security-tracker.debian.org/tracker/CVE-2026-40225
>
> More details : https://nvd.nist.gov/vuln/detail/CVE-2026-40225
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../systemd/systemd/CVE-2026-40225-01.patch   | 131 ++++++++++++++++++
>  .../systemd/systemd/CVE-2026-40225-02.patch   |  39 ++++++
>  meta/recipes-core/systemd/systemd_255.21.bb   |   2 +
>  3 files changed, 172 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-40225-01.p=
atch
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-40225-02.p=
atch
>
> diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-40225-01.patch b/=
meta/recipes-core/systemd/systemd/CVE-2026-40225-01.patch
> new file mode 100644
> index 0000000000..f616e636c2
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/CVE-2026-40225-01.patch
> @@ -0,0 +1,131 @@
> +From 03bb697b8df0339c37f4b845025320b261aeb7cc Mon Sep 17 00:00:00 2001
> +From: Luca Boccassi <luca.boccassi@gmail.com>
> +Date: Fri, 6 Mar 2026 19:32:35 +0000
> +Subject: [PATCH] udev: check for invalid chars in various fields receive=
d from
> + the kernel
> +
> +(cherry picked from commit 16325b35fa6ecb25f66534a562583ce3b96d52f3)
> +(cherry picked from commit 3513862eabe9ec4a6a095d7266e98f998f289ed2)
> +(cherry picked from commit c20d21e0da293e715db468f9f4a15a5c8fbf8273)
> +
> +CVE: CVE-2026-40225
> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/03b=
b697b8df0339c37f4b845025320b261aeb7cc]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/udev/dmi_memory_id/dmi_memory_id.c | 3 ++-
> + src/udev/scsi_id/scsi_id.c             | 5 +++--
> + src/udev/udev-builtin-net_id.c         | 9 +++++++++
> + src/udev/v4l_id/v4l_id.c               | 5 ++++-
> + 4 files changed, 18 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/udev/dmi_memory_id/dmi_memory_id.c b/src/udev/dmi_memor=
y_id/dmi_memory_id.c
> +index 52ea250af8..4f2c21b80b 100644
> +--- a/src/udev/dmi_memory_id/dmi_memory_id.c
> ++++ b/src/udev/dmi_memory_id/dmi_memory_id.c
> +@@ -51,6 +51,7 @@
> + #include "string-util.h"
> + #include "udev-util.h"
> + #include "unaligned.h"
> ++#include "utf8.h"
> +
> + #define SUPPORTED_SMBIOS_VER 0x030300
> +
> +@@ -185,7 +186,7 @@ static void dmi_memory_device_string(
> +
> +         str =3D strdupa_safe(dmi_string(h, s));
> +         str =3D strstrip(str);
> +-        if (!isempty(str))
> ++        if (!isempty(str) && utf8_is_valid(str) && !string_has_cc(str, =
/* ok=3D */ NULL))
> +                 printf("MEMORY_DEVICE_%u_%s=3D%s\n", slot_num, attr_suf=
fix, str);
> + }
> +
> +diff --git a/src/udev/scsi_id/scsi_id.c b/src/udev/scsi_id/scsi_id.c
> +index 6308c52b7e..7e18bc755a 100644
> +--- a/src/udev/scsi_id/scsi_id.c
> ++++ b/src/udev/scsi_id/scsi_id.c
> +@@ -27,6 +27,7 @@
> + #include "strv.h"
> + #include "strxcpyx.h"
> + #include "udev-util.h"
> ++#include "utf8.h"
> +
> + static const struct option options[] =3D {
> +         { "device",             required_argument, NULL, 'd' },
> +@@ -443,8 +444,8 @@ static int scsi_id(char *maj_min_dev) {
> +                 }
> +                 if (dev_scsi.tgpt_group[0] !=3D '\0')
> +                         printf("ID_TARGET_PORT=3D%s\n", dev_scsi.tgpt_g=
roup);
> +-                if (dev_scsi.unit_serial_number[0] !=3D '\0')
> +-                        printf("ID_SCSI_SERIAL=3D%s\n", dev_scsi.unit_s=
erial_number);
> ++                if (dev_scsi.unit_serial_number[0] !=3D '\0' && utf8_is=
_valid(dev_scsi.unit_serial_number) && !string_has_cc(dev_scsi.unit_serial_=
number, /* ok=3D */ NULL))
> ++                        printf("ID_SCSI_SERIAL=3D%s\n", serial_str);
> +                 goto out;
> +         }
> +
> +diff --git a/src/udev/udev-builtin-net_id.c b/src/udev/udev-builtin-net_=
id.c
> +index 91b40088f4..715184e282 100644
> +--- a/src/udev/udev-builtin-net_id.c
> ++++ b/src/udev/udev-builtin-net_id.c
> +@@ -39,6 +39,7 @@
> + #include "strv.h"
> + #include "strxcpyx.h"
> + #include "udev-builtin.h"
> ++#include "utf8.h"
> +
> + #define ONBOARD_14BIT_INDEX_MAX ((1U << 14) - 1)
> + #define ONBOARD_16BIT_INDEX_MAX ((1U << 16) - 1)
> +@@ -247,6 +248,9 @@ static int get_port_specifier(sd_device *dev, bool f=
allback_to_dev_id, char **re
> +                         }
> +                 }
> +
> ++                if (!utf8_is_valid(phys_port_name) || string_has_cc(phy=
s_port_name, /* ok=3D */ NULL))
> ++                        return log_device_debug_errno(dev, SYNTHETIC_ER=
RNO(EINVAL), "Invalid phys_port_name");
> ++
> +                 /* Otherwise, use phys_port_name as is. */
> +                 buf =3D strjoin("n", phys_port_name);
> +                 if (!buf)
> +@@ -351,6 +355,9 @@ static int names_pci_onboard_label(sd_device *dev, s=
d_device *pci_dev, const cha
> +         if (r < 0)
> +                 return log_device_debug_errno(pci_dev, r, "Failed to ge=
t PCI onboard label: %m");
> +
> ++        if (!utf8_is_valid(label) || string_has_cc(label, /* ok=3D */ N=
ULL))
> ++                return log_device_debug_errno(dev, SYNTHETIC_ERRNO(EINV=
AL), "Invalid label");
> ++
> +         char str[ALTIFNAMSIZ];
> +         if (snprintf_ok(str, sizeof str, "%s%s",
> +                         naming_scheme_has(NAMING_LABEL_NOPREFIX) ? "" :=
 prefix,
> +@@ -1209,6 +1216,8 @@ static int names_netdevsim(sd_device *dev, const c=
har *prefix, bool test) {
> +         if (isempty(phys_port_name))
> +                 return log_device_debug_errno(dev, SYNTHETIC_ERRNO(EOPN=
OTSUPP),
> +                                               "The 'phys_port_name' att=
ribute is empty.");
> ++        if (!utf8_is_valid(phys_port_name) || string_has_cc(phys_port_n=
ame, /* ok=3D */ NULL))
> ++                return log_device_debug_errno(dev, SYNTHETIC_ERRNO(EINV=
AL), "Invalid phys_port_name");
> +
> +         char str[ALTIFNAMSIZ];
> +         if (snprintf_ok(str, sizeof str, "%si%un%s", prefix, addr, phys=
_port_name))
> +diff --git a/src/udev/v4l_id/v4l_id.c b/src/udev/v4l_id/v4l_id.c
> +index 30527e9556..2ec96d8d3a 100644
> +--- a/src/udev/v4l_id/v4l_id.c
> ++++ b/src/udev/v4l_id/v4l_id.c
> +@@ -29,6 +29,8 @@
> + #include "build.h"
> + #include "fd-util.h"
> + #include "main-func.h"
> ++#include "string-util.h"
> ++#include "utf8.h"
> +
> + static const char *arg_device =3D NULL;
> +
> +@@ -82,7 +84,8 @@ static int run(int argc, char *argv[]) {
> +                 int capabilities;
> +
> +                 printf("ID_V4L_VERSION=3D2\n");
> +-                printf("ID_V4L_PRODUCT=3D%s\n", v2cap.card);
> ++                if (utf8_is_valid((char *)v2cap.card) && !string_has_cc=
((char *)v2cap.card, /* ok=3D */ NULL))
> ++                        printf("ID_V4L_PRODUCT=3D%s\n", v2cap.card);
> +                 printf("ID_V4L_CAPABILITIES=3D:");
> +
> +                 if (v2cap.capabilities & V4L2_CAP_DEVICE_CAPS)
> +--
> +2.50.1
> +
> diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-40225-02.patch b/=
meta/recipes-core/systemd/systemd/CVE-2026-40225-02.patch
> new file mode 100644
> index 0000000000..bc0a5514d4
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/CVE-2026-40225-02.patch
> @@ -0,0 +1,39 @@
> +From 5887e72ff87d3a66a4c3fa91897fbec1545f4d3d Mon Sep 17 00:00:00 2001
> +From: Luca Boccassi <luca.boccassi@gmail.com>
> +Date: Fri, 13 Mar 2026 11:10:47 +0000
> +Subject: [PATCH] udev: fix review mixup
> +
> +The previous version in the PR changed variable and sanitized it
> +in place. The second version switched to skip if CCs are in the
> +string instead, but didn't move back to the original variable.
> +Because it's an existing variable, no CI caught it.
> +
> +Follow-up for 16325b35fa6ecb25f66534a562583ce3b96d52f3
> +
> +(cherry picked from commit 54f880b02ecf7362e630ffc885d1466df6ee6820)
> +(cherry picked from commit 4425d8523e79f3cc00b3b93a0b5e7c6cdc284a97)
> +(cherry picked from commit 75c585beae60e73208941e6b3f64cf249223f53d)
> +
> +CVE: CVE-2026-40225
> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/588=
7e72ff87d3a66a4c3fa91897fbec1545f4d3d]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + src/udev/scsi_id/scsi_id.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/udev/scsi_id/scsi_id.c b/src/udev/scsi_id/scsi_id.c
> +index 7e18bc755a..b2df8d9f7f 100644
> +--- a/src/udev/scsi_id/scsi_id.c
> ++++ b/src/udev/scsi_id/scsi_id.c
> +@@ -445,7 +445,7 @@ static int scsi_id(char *maj_min_dev) {
> +                 if (dev_scsi.tgpt_group[0] !=3D '\0')
> +                         printf("ID_TARGET_PORT=3D%s\n", dev_scsi.tgpt_g=
roup);
> +                 if (dev_scsi.unit_serial_number[0] !=3D '\0' && utf8_is=
_valid(dev_scsi.unit_serial_number) && !string_has_cc(dev_scsi.unit_serial_=
number, /* ok=3D */ NULL))
> +-                        printf("ID_SCSI_SERIAL=3D%s\n", serial_str);
> ++                        printf("ID_SCSI_SERIAL=3D%s\n", dev_scsi.unit_s=
erial_number);
> +                 goto out;
> +         }
> +
> +--
> +2.50.1
> +
> diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-c=
ore/systemd/systemd_255.21.bb
> index 87e186bbfa..fe9d699816 100644
> --- a/meta/recipes-core/systemd/systemd_255.21.bb
> +++ b/meta/recipes-core/systemd/systemd_255.21.bb
> @@ -29,6 +29,8 @@ SRC_URI +=3D " \
>             file://0002-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
>             file://0003-timedated-Respond-on-org.freedesktop.timedate1.Se=
tNT.patch \
>             file://0008-implment-systemd-sysv-install-for-OE.patch \
> +           file://CVE-2026-40225-01.patch \
> +           file://CVE-2026-40225-02.patch \
>             "
>
>  # patches needed by musl
> --
> 2.50.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236060): https://lists.openembedded.org/g/openembedde=
d-core/message/236060
> Mute This Topic: https://lists.openembedded.org/mt/119046714/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

