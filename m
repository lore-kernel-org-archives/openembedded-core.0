Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C0CC52D6F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 07:31:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.72219.1724743887617714591
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 00:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HzIQsuj4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-428178fc07eso42369075e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 00:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724743886; x=1725348686; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5nIs3Wyyt1jxNgZPHQObpB2OM0BbdLKZyb1sGF3t7Y=;
        b=HzIQsuj4+ljull9Y0Pn1nlUGd4bvu/WnN1iJzAMEWL6Grt8rO94pSUj4vA24qbNQg/
         lERMxSz4Os4q94Ov3Cm3vi6+Dkvve4T9niQkrQkYlm/W5lk9HH+jY5ZSG3SY6pHCYHzi
         8aSz23Al6pCC9sBg5UaKXqREzRlG6gfJq3HWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724743886; x=1725348686;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F5nIs3Wyyt1jxNgZPHQObpB2OM0BbdLKZyb1sGF3t7Y=;
        b=fUjaux8Uh/JtY6flxmF4u2ipdpbY1p67x4jXnXsoqjQYZ4xP5J0kO3moI7UDkqyRYf
         oHnKRXEfsz5quUyWvTLi8q0mHN82TbeJgSBrhmLQfGJEibjc00e008SWUY5wl/nVggRK
         JamRNM2wGyFYJ+jfvyCpF+mQnGdQ8P2V7e7jibOF9J2GKIrH9UtRYuMs3kh8tpv9nGPu
         moF49f6ko7B3tIpmmOZArvtg4PvtPK4yZWYZGd2mt7fyGzmpv/8MxCdMQx607PL3wu8O
         BonLWQlpMPORM28bQjXLkiqY+QupOjlx0YniwC4U4O9zx9B9neycSqmcSiZ1jGGN9w34
         22jw==
X-Forwarded-Encrypted: i=1; AJvYcCXZK5D1Bo7kCqALHgZopCjuDcFirKVjGH6llXfli3F+Do4itLSVtn0RkM+j4dtvVp0U44zjbCt76sCYQjmYw+50Qw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyIkSj1bGuXuoZ++ZkE2OIUDAmk5ZzQZcnYy2uAabwSSrmh45Fp
	G1UzVFbAs6OdM8T1u4cd0YxpZAH8XoMbgMUeB3ChPeLA+T+GyrDYl0C6BaZC9Rn5WLyCs19LCzp
	U
X-Google-Smtp-Source: AGHT+IELl8wj4N134ik9dMN8f3ze1nUiMlsKnohkVDAdGzYLepBUD6u+JsOnkKHaYYZG9vb0dqEUIg==
X-Received: by 2002:a05:600c:1d0b:b0:426:593c:9351 with SMTP id 5b1f17b1804b1-42acd542a3cmr79221835e9.6.1724743884718;
        Tue, 27 Aug 2024 00:31:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f5f7:3b8b:ca90:386f? ([2001:8b0:aba:5f3c:f5f7:3b8b:ca90:386f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308161042sm12401888f8f.59.2024.08.27.00.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 00:31:24 -0700 (PDT)
Message-ID: <e2f357d3504b7ec66b07336eafe94eb807eaeba7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/4] bluez5: Fix build with musl
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2024 08:31:23 +0100
In-Reply-To: <20240826174322.2938481-1-raj.khem@gmail.com>
References: <20240826174322.2938481-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 07:31:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203816

On Mon, 2024-08-26 at 10:43 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Fix the upstream submission and latest patch submitted upstream
>=20
> =C2=A0meta/recipes-connectivity/bluez5/bluez5.inc=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0...U-basename-compatible-implementation.patch | 136 +++++++++++++++=
+++
> =C2=A02 files changed, 137 insertions(+)
> =C2=A0create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Pro=
vide-GNU-basename-compatible-implementation.patch
>=20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index d8b9f817715..e0d3e651871 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -70,6 +70,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-=
${PV}.tar.xz \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0001-tests-add-a-target-for-building-tests-without-runnin.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0001-test-gatt-Fix-hung-issue.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/0004-src-shared-util.c-include-linux-limits.h.patch=C2=A0\
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001=
-Provide-GNU-basename-compatible-implementation.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> =C2=A0S =3D "${WORKDIR}/bluez-${PV}"
> =C2=A0
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Provide-GNU-bas=
ename-compatible-implementation.patch b/meta/recipes-connectivity/bluez5/bl=
uez5/0001-Provide-GNU-basename-compatible-implementation.patch
> new file mode 100644
> index 00000000000..293675ee0a2
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-Provide-GNU-basename-c=
ompatible-implementation.patch
> @@ -0,0 +1,136 @@
> +From 4ea6d5f344574b876bbf029501301131e623e992 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 26 Aug 2024 09:55:03 -0700
> +Subject: [PATCH BlueZ] Provide GNU basename compatible implementation
> +
> +Call to basename() relies on a GNU extension
> +to take a const char * vs a char *. Let's define
> +a trivial helper function to ensure compatibility
> +with musl.
> +
> +Fixes Issue: https://github.com/bluez/bluez/issues/843
> +
> +Upstream-Status: Submitted [https://lore.kernel.org/linux-bluetooth/2024=
0826173844.2918630-1-raj.khem@gmail.com/T/#u]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + Makefile.mesh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 2 ++
> + Makefile.tools=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
3 ++-
> + mesh/mesh-config-json.c | 5 +++--
> + mesh/rpl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 3 ++-
> + src/shared/util.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6 ++++++
> + tools/hex2hcd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 ++-
> + 6 files changed, 17 insertions(+), 5 deletions(-)
> +
> +diff --git a/Makefile.mesh b/Makefile.mesh
> +index e4c9fa6a3..bebedaf05 100644
> +--- a/Makefile.mesh
> ++++ b/Makefile.mesh
> +@@ -47,6 +47,8 @@ mesh/main.$(OBJEXT): src/builtin.h lib/bluetooth/bluet=
ooth.h
> + mesh_bluetooth_meshd_SOURCES =3D $(mesh_sources) mesh/main.c
> + mesh_bluetooth_meshd_LDADD =3D src/libshared-ell.la $(ell_ldadd) -ljson=
-c
> +=20
> ++mesh_bluetooth_meshd_CFLAGS =3D -I${top_srcdir}/src
> ++
> + if MANPAGES
> + man_MANS +=3D mesh/bluetooth-meshd.8
> + endif
> +diff --git a/Makefile.tools b/Makefile.tools
> +index 5b9034078..6fc73b8a2 100644
> +--- a/Makefile.tools
> ++++ b/Makefile.tools
> +@@ -328,7 +328,8 @@ tools_l2ping_LDADD =3D lib/libbluetooth-internal.la
> + tools_bluemoon_SOURCES =3D tools/bluemoon.c monitor/bt.h
> + tools_bluemoon_LDADD =3D src/libshared-mainloop.la
> +=20
> +-tools_hex2hcd_SOURCES =3D tools/hex2hcd.c
> ++tools_hex2hcd_SOURCES =3D tools/hex2hcd.c src/shared/util.h
> ++tools_hex2hcd_CFLAGS =3D -I${top_srcdir}/src
> +=20
> + tools_mpris_proxy_SOURCES =3D tools/mpris-proxy.c
> + tools_mpris_proxy_LDADD =3D gdbus/libgdbus-internal.la $(GLIB_LIBS) $(D=
BUS_LIBS)
> +diff --git a/mesh/mesh-config-json.c b/mesh/mesh-config-json.c
> +index c198627c6..8f89a1498 100644
> +--- a/mesh/mesh-config-json.c
> ++++ b/mesh/mesh-config-json.c
> +@@ -28,6 +28,7 @@
> + #include <ell/ell.h>
> + #include <json-c/json.h>
> +=20
> ++#include "shared/util.h"
> + #include "mesh/mesh-defs.h"
> + #include "mesh/util.h"
> + #include "mesh/mesh-config.h"
> +@@ -2694,7 +2695,7 @@ bool mesh_config_load_nodes(const char *cfgdir_nam=
e, mesh_config_node_func_t cb,
> +=20
> + void mesh_config_destroy_nvm(struct mesh_config *cfg)
> + {
> +-	char *node_dir, *node_name;
> ++	const char *node_dir, *node_name;
> +=C2=A0	char uuid[33];
> +=20
> +=C2=A0	if (!cfg)
> +@@ -2706,7 +2707,7 @@ void mesh_config_destroy_nvm(struct mesh_config *c=
fg)
> +=C2=A0	if (!hex2str(cfg->uuid, 16, uuid, sizeof(uuid)))
> +=C2=A0		return;
> +=20
> +-	node_name =3D basename(node_dir);
> ++	node_name =3D bluez_basename(node_dir);
> +=20
> +=C2=A0	/* Make sure path name of node follows expected guidelines */
> +=C2=A0	if (strcmp(node_name, uuid))
> +diff --git a/mesh/rpl.c b/mesh/rpl.c
> +index fb225dddd..fb89f0afd 100644
> +--- a/mesh/rpl.c
> ++++ b/mesh/rpl.c
> +@@ -24,6 +24,7 @@
> +=20
> + #include <ell/ell.h>
> +=20
> ++#include "shared/util.h"
> + #include "mesh/mesh-defs.h"
> +=20
> + #include "mesh/node.h"
> +@@ -146,7 +147,7 @@ static void get_entries(const char *iv_path, struct =
l_queue *rpl_list)
> +=C2=A0	if (!dir)
> +=C2=A0		return;
> +=20
> +-	iv_txt =3D basename(iv_path);
> ++	iv_txt =3D bluez_basename(iv_path);
> +=C2=A0	if (sscanf(iv_txt, "%08x", &iv_index) !=3D 1) {
> +=C2=A0		closedir(dir);
> +=C2=A0		return;
> +diff --git a/src/shared/util.h b/src/shared/util.h
> +index f2ca4f29f..0f0f67718 100644
> +--- a/src/shared/util.h
> ++++ b/src/shared/util.h
> +@@ -296,3 +296,9 @@ static inline void put_be64(uint64_t val, void *dst)
> + {
> +=C2=A0	put_unaligned(cpu_to_be64(val), (uint64_t *) dst);
> + }
> ++
> ++static inline const char *bluez_basename(const char *path)
> ++{
> ++	const char *base =3D strrchr(path, '/');
> ++	return base ? base + 1 : path;
> ++}
> +diff --git a/tools/hex2hcd.c b/tools/hex2hcd.c
> +index e6dca5a81..05fa69470 100644
> +--- a/tools/hex2hcd.c
> ++++ b/tools/hex2hcd.c
> +@@ -24,6 +24,7 @@
> + #include <stdlib.h>
> + #include <stdbool.h>
> + #include <sys/stat.h>
> ++#include "shared/util.h"
> +=20
> + static ssize_t process_record(int fd, const char *line, uint16_t *upper=
_addr)
> + {
> +@@ -302,7 +303,7 @@ static void ver_parse_entry(const char *pathname)
> +=C2=A0	}
> +=20
> +=C2=A0	if (S_ISREG(st.st_mode)) {
> +-		ver_parse_file(basename(pathname));
> ++		ver_parse_file(bluez_basename(pathname));
> +=C2=A0		goto done;
> +=C2=A0	}
> +=20
>=20

There were some autobuilder failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/9377/step=
s/11/logs/stdio

| /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/co=
rtexa15t2hf-neon-oe-linux-gnueabi/bluez5/5.77/recipe-sysroot-native/usr/bin=
/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-g=
nueabi/14.2.0/ld: tools/hex2hcd-hex2hcd.o: relocation R_ARM_THM_MOVW_ABS_NC=
 against `a local symbol' can not be used when making a shared object; reco=
mpile with -fPIC
| /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/co=
rtexa15t2hf-neon-oe-linux-gnueabi/bluez5/5.77/recipe-sysroot-native/usr/bin=
/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-g=
nueabi/14.2.0/ld: tools/hex2hcd-hex2hcd.o(.text+0x7e): unresolvable R_ARM_T=
HM_CALL relocation against symbol `__isoc23_sscanf@@GLIBC_2.38'
| /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/co=
rtexa15t2hf-neon-oe-linux-gnueabi/bluez5/5.77/recipe-sysroot-native/usr/bin=
/arm-oe-linux-gnueabi/../../libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-g=
nueabi/14.2.0/ld: final link failed
| collect2: error: ld returned 1 exit status
| make[1]: *** [Makefile:6681: tools/hex2hcd] Error 1



https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/6495/ste=
ps/14/logs/stdio

ERROR: bluez5-5.77-r0 do_package_qa: QA Issue: bluez5: ELF binary /usr/bin/=
hex2hcd has relocations in .text [textrel]



https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/9340/step=
s/13/logs/stdio


Cheers,

Richard




