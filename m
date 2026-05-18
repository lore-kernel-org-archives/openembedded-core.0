Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3CBCD4F52
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 19:12:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5035.1779131529317901651
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 12:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: key syntax error: missing public key data" header.i=@rootcommit.com header.s=dkim header.b=hir0a84y;
 spf=pass (domain: rootcommit.com, ip: 185.246.84.56, mailfrom: michael.opdenacker@rootcommit.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 192651A3604;
	Mon, 18 May 2026 19:12:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D5C335FFA3;
	Mon, 18 May 2026 19:12:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D11111AF8B3A;
	Mon, 18 May 2026 21:12:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=dkim; t=1779131525;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5aJGIeZzg6M/4eqx5qbuOUnIlcrVnUDLA7fhWGMMhd8=;
	b=hir0a84yx+bvsexnjbAyCRh6/Qnz87KMwI5XwSduVEk9/SbOaupeVq7mtZ2PKqaAPxnkXR
	qP4b1Dqbo9uhk17u/XeiAwuh0KKwH6Lis7u0KQW+JJpgArFGfk6pJ19fB0WYyP8PoqnezK
	bcPsP35Gfy2aktqN7FErLZS1n0q8fUw3kijw8Ti1Qmt/JSzcgm0qK6ARatt8wsfOqinXah
	w8VNQ2IMQwIpjFNpgGkODXGaoSH82yd582A7fViX3mtowL0S/3LM6ogn3/YLVOfJkb5lqz
	hHj47Be0Qc+2NdS2CTugkPzimW/nCGjQHEkW9g76CnFvJeSWIkb4ZfaQDKxCsA==
Message-ID: <4533420d-afdf-4d10-a5cb-3e111d96e2d4@rootcommit.com>
Date: Mon, 18 May 2026 21:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com,
 quentin.schulz@cherry.de, marek.vasut@mailbox.org, festevam@gmail.com,
 khem.raj@oss.qualcomm.com, ricardo.salveti@oss.qualcomm.com
Subject: Re: [OE-core] [PATCH v2 0/1] u-boot-tools: drop yaml in DT validation
To: joaomarcos.costa@bootlin.com
References: <20260429180631.170081-1-joaomarcos.costa@bootlin.com>
 <CAA_5yovdT5_WHP4mTR3ZMP3xodPQfsw1z5wH98vSrBwMWhZwwQ@mail.gmail.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <CAA_5yovdT5_WHP4mTR3ZMP3xodPQfsw1z5wH98vSrBwMWhZwwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 19:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237257

Hi Jo=C3=A3o Marcos

FYI, building the "qemuriscv64" machine is still broken on OE-core=20
(master), and it's seems likely to be related to this change;

| /usr/bin/ld: scripts/dtc/yamltree.o: in function `dt_to_yaml':
| yamltree.c:(.text+0x8fa): undefined reference to `yaml_emitter_initiali=
ze'
| /usr/bin/ld: yamltree.c:(.text+0x905): undefined reference to=20
`yaml_emitter_set_output_file'
| /usr/bin/ld: yamltree.c:(.text+0x912): undefined reference to=20
`yaml_stream_start_event_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x91d): undefined reference to=20
`yaml_emitter_emit'
| /usr/bin/ld: yamltree.c:(.text+0x936): undefined reference to=20
`yaml_document_start_event_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x941): undefined reference to=20
`yaml_emitter_emit'
| /usr/bin/ld: yamltree.c:(.text+0x962): undefined reference to=20
`yaml_sequence_start_event_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x96d): undefined reference to=20
`yaml_emitter_emit'
| /usr/bin/ld: yamltree.c:(.text+0x98a): undefined reference to=20
`yaml_sequence_end_event_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x995): undefined reference to=20
`yaml_emitter_emit'
| /usr/bin/ld: yamltree.c:(.text+0x9a7): undefined reference to=20
`yaml_document_end_event_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x9b2): undefined reference to=20
`yaml_emitter_emit'
| /usr/bin/ld: yamltree.c:(.text+0x9be): undefined reference to=20
`yaml_stream_end_event_initialize'
| /usr/bin/ld: yamltree.c:(.text+0x9c9): undefined reference to=20
`yaml_emitter_emit'
| /usr/bin/ld: yamltree.c:(.text+0x9d5): undefined reference to=20
`yaml_emitter_delete'
| collect2: error: ld returned 1 exit status
| make[2]: ***=20
[/home/mike/work/kas/qemuriscv64/build/tmp/work/x86_64-linux/u-boot-tools=
-native/2026.04/sources/u-boot-tools-2026.04/scripts/Makefile.host:105:=20
scripts/dtc/dtc] Error 1
| make[2]: *** Waiting for unfinished jobs....
| if [ -f=20
/home/mike/work/kas/qemuriscv64/build/tmp/work/x86_64-linux/u-boot-tools-=
native/2026.04/sources/u-boot-tools-2026.04/.config=20
-o -d=20
/home/mike/work/kas/qemuriscv64/build/tmp/work/x86_64-linux/u-boot-tools-=
native/2026.04/sources/u-boot-tools-2026.04/include/config=20
]; then \
|=C2=A0 =C2=A0 =C2=A0echo >&2 "=20
/home/mike/work/kas/qemuriscv64/build/tmp/work/x86_64-linux/u-boot-tools-=
native/2026.04/sources/u-boot-tools-2026.04=20
is not clean, please run 'make mrproper'"; \
|=C2=A0 =C2=A0 =C2=A0echo >&2 "=C2=A0 in the=20
'/home/mike/work/kas/qemuriscv64/build/tmp/work/x86_64-linux/u-boot-tools=
-native/2026.04/sources/u-boot-tools-2026.04'=20
directory.";\
|=C2=A0 =C2=A0 =C2=A0/bin/false; \
| fi;
| set -e; mkdir -p include/generated/; trap "rm -f=20
include/generated/.version_autogenerated.h.tmp" EXIT; {=C2=A0 =C2=A0 =C2=A0=
(echo=20
\#define PLAIN_VERSION \"2026.04\"; echo \#define U_BOOT_VERSION=20
\"U-Boot \" PLAIN_VERSION; echo \#define U_BOOT_VERSION_NUM 2026; echo=20
\#define U_BOOT_VERSION_NUM_PATCH $(echo 04 | sed -e "s/^0*//"); echo=20
\#define HOST_ARCH 0x8664; echo \#define CC_VERSION_STRING \"$(LC_ALL=3DC=
=20
gcc=20
-isystem/home/mike/work/kas/qemuriscv64/build/tmp/work/x86_64-linux/u-boo=
t-tools-native/2026.04/recipe-sysroot-native/usr/include=20
-O2 -pipe=20
-L/home/mike/work/kas/qemuriscv64/build/tmp/work/x86_64-linux/u-boot-tool=
s-native/2026.04/recipe-sysroot-native/usr/lib=20
 =C2=A0-L/home/mike/work/kas/qemuriscv64/build/tmp/work/x86_64-linux/u-bo=
ot-tools-native/2026.04/recipe-sysroot-native/lib=20
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-Wl,--enable-new-dtags=20
 =C2=A0-Wl,-rpath-link,/home/mike/work/kas/qemuriscv64/build/tmp/work/x86=
_64-linux/u-boot-tools-native/2026.04/recipe-sysroot-native/usr/lib=20
 =C2=A0-Wl,-rpath-link,/home/mike/work/kas/qemuriscv64/build/tmp/work/x86=
_64-linux/u-boot-tools-native/2026.04/recipe-sysroot-native/lib=20
 =C2=A0-Wl,-rpath,/home/mike/work/kas/qemuriscv64/build/tmp/work/x86_64-l=
inux/u-boot-tools-native/2026.04/recipe-sysroot-native/usr/lib=20
 =C2=A0-Wl,-rpath,/home/mike/work/kas/qemuriscv64/build/tmp/work/x86_64-l=
inux/u-boot-tools-native/2026.04/recipe-sysroot-native/lib=20
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0-Wl,-O1 -Wl,--allow-shlib-undefined=20
-Wl,--dynamic-linker=3D/home/mike/work/kas/qemuriscv64/build/tmp/sysroots=
-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2=20
-pthread --version | head -n 1)\"; echo \#define LD_VERSION_STRING=20
\"$(LC_ALL=3DC ld --version | head -n 1)\"; ); } >=20
include/generated/.version_autogenerated.h.tmp; if [ ! -r=20
include/generated/version_autogenerated.h ] || ! cmp -s=20
include/generated/version_autogenerated.h=20
include/generated/.version_autogenerated.h.tmp; then : '=C2=A0 UPD=20
 =C2=A0include/generated/version_autogenerated.h'; mv -f=20
include/generated/.version_autogenerated.h.tmp=20
include/generated/version_autogenerated.h; fi
| make[1]: ***=20
[/home/mike/work/kas/qemuriscv64/build/tmp/work/x86_64-linux/u-boot-tools=
-native/2026.04/sources/u-boot-tools-2026.04/Makefile:2385:=20
scripts_dtc] Error 2
| ERROR: oe_runmake failed
| make: Leaving directory=20
'/home/mike/work/kas/qemuriscv64/build/tmp/work/x86_64-linux/u-boot-tools=
-native/2026.04/sources/u-boot-tools-2026.04'
| WARNING: exit code 1 from a shell command.
| make: *** [Makefile:189: __sub-make] Error 2
ERROR: Task=20
(virtual:native:/home/mike/work/kas/qemuriscv64/build/../openembedded-cor=
e/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb:do_compile)=20
failed with exit code '1'
NOTE: Tasks Summary: Attempted 3456 tasks of which 18 didn't need to be=20
rerun and 1 failed.

Cheers
Michael.

--=20
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com


