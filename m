Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF98CFD35B
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 21:36:54 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2827.1764020210895671173
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Nov 2025 13:36:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jmUONF6G;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: stondo@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-787d5555274so48693987b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 13:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764020210; x=1764625010; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JfxYrmKaDbCNsfO7FzBrFya1izozjKqINS+M6iu54MQ=;
        b=jmUONF6GAzNWSAHkTOvXpUgKODP86+QtzMdVcPlMmIuMakzaatyi5NQP8SqU3CGywf
         kto+lpQTfWn3IlldIoABWxbQyihDkyK8SMcd+KeFUFQlFIUXl3d5YFnpKL6yy6CJz/Da
         A+yBFJrR9Bk3KcrrDIbJgcpgvtJmR359dJ0AiL2SJFUpCREuvUKRy0r7YkXH6gJ97mbx
         0bZ/9778frJGFZaPe+5TP4u54Md8JM2m7kU/A/cXR0PewdebjH4EVy43TBeDgF+F3ghz
         qkHmaw7wlX/jPY9OhSZ8Wi3Tu2KXgpCU6TyM2+V1qkc0qFw222ZJt9zmM4lhtGKqY1W0
         2EXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764020210; x=1764625010;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JfxYrmKaDbCNsfO7FzBrFya1izozjKqINS+M6iu54MQ=;
        b=hUWFEmwYyO63QaP2HQUVR26VHefhT5QyJHQy61jKtDs8BtyGOAp07r0/dAylsMd3mv
         sNUVe23Yk1bcpBVLB57X9ihakGAAMKygORrwjT4QcDSPjsG2WbyuIqNHELENIL75rgZr
         InkHp+eaEIQ4rvPz7XxZ+utdmI6m40X663DlYoJ9pyJmi1Q6/ydfBhjMuuvjZU3tBQc0
         Kx8MlQVRu5RDcZAzChk9jefUch011vbQdnAifbIYc+1v6LUEwy+9R0e/JGMpAKG7dQ14
         KMzWONU3Q52qhz+/orM4PTGYmvlzBmywsWO6WlYqVs2NioS235GRhSrW9NdgWFZgVRHI
         /SVg==
X-Gm-Message-State: AOJu0Yy2LIhjzbQraogmYVTd5QNDCW1lEKiVb9g59xu6fiz9L1ioxxFM
	zI/u7dPZOEnmAfovJ/cf2zb0OU4ziC1aLZYPlcp1WloOekGXHF6nKwdXXa2Tm822yXm/wSiHURK
	4ijpiEd1uG/mbXTOyFDrG/TjHXigl3FFG695bMI0=
X-Gm-Gg: ASbGnctdYMg1stuFZ9gUASxNVNDzPgcUWNucEPQ75WMvxi67FmV5VB0RUhiyUOqNZzD
	nQV2Z9rsTvrrwS+pZoQDlcnjlE0xJko9+OBQY1r0/bRPM+gB5eKoGIsdvoeCmmLOSEfZoz8vAEs
	Usappx1ShE+lclo71PnJdcrjYvZGlQdTNfR7vfZ1OvTc9+oU+/u0XWALfZU/icII1tagqUsfqTZ
	R5fQz99sUinHhWE8lSZhI3Bz4fK3VCvpcF5pJJTSrh7L3rYO4hXc4gQiX+QpW67IQA=
X-Google-Smtp-Source: AGHT+IGwDyA6HOzZ//sy0Z85keHgd40/b6+42mz1jka5UQuUCPqyuwhFYgTZn12M5uZf3SNXghw+V29QBXtwUs+tH3g=
X-Received: by 2002:a05:690c:91:b0:786:7d2c:8a35 with SMTP id
 00721157ae682-78ab6f9f1b8mr5922207b3.60.1764020209751; Mon, 24 Nov 2025
 13:36:49 -0800 (PST)
MIME-Version: 1.0
From: Stefano Tondo <stondo@gmail.com>
Date: Mon, 24 Nov 2025 22:36:38 +0100
X-Gm-Features: AWmQ_bnNG0-3PfSOH9OoKWR33eGBDREep0ZN1giIUsLDkrvljA325TLjVedFC0w
Message-ID: <CAC-LxqPnzAmUC7dz4svn8aFOti2DQ8z0_HWuQSJs8u8xAfK0vw@mail.gmail.com>
Subject: Question: Should SPDX_FILE_FILTER apply to rootfs files?
To: openembedded-core@lists.openembedded.org
Cc: spdx@lists.yoctoproject.org, peter.marko@siemens.com, 
	adrian.freihofer@siemens.com, 
	"Skoczylas, Piotr" <piotr.skoczylas@siemens.com>, "Bach, Pascal" <pascal.bach@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000fa9bec06445df54d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 21:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226746

--000000000000fa9bec06445df54d
Content-Type: text/plain; charset="UTF-8"

```
Hi OpenEmbedded SPDX maintainers,

I'm working with the SPDX 3.0 implementation in oe-core and have a question
about the intended behavior of the SPDX_FILE_FILTER variable.

I've observed that SPDX_FILE_FILTER correctly filters files at the package
level (in create_spdx() and create_package_spdx()), but does NOT filter
files
in the rootfs SPDX document (created by create_rootfs_spdx()).

Test results with core-image-minimal on qemux86-64:

Package-level filtering (working as expected):
- SPDX_FILE_FILTER="none": 0 files in package SPDXs
- SPDX_FILE_FILTER="essential": Only LICENSE/README/etc. files
- SPDX_FILE_FILTER="all": All source files included

Rootfs-level (no filtering applied):
- ALL three modes include 1,671 rootfs files (binaries, configs, etc.)
- create_rootfs_spdx() walks IMAGE_ROOTFS unconditionally
- No check of SPDX_FILE_FILTER variable


Package filtering (meta/lib/oe/spdx30_tasks.py:165-220):

def add_package_files(d, objset, pkg, source_files, packaged_files):
    spdx_file_filter = d.getVar("SPDX_FILE_FILTER") or "essential"

    if spdx_file_filter == "none":
        return []  # Filtering works here
    elif spdx_file_filter == "essential":
        # Filters to essential files only


Rootfs collection (meta/lib/oe/spdx30_tasks.py:1284-1316):

def create_rootfs_spdx(d):
    # ... setup ...
    for dirpath, dirnames, filenames in os.walk(image_rootfs):
        # No SPDX_FILE_FILTER check here
        files.add(objset.new_file(...))


Is this behavior intentional? I can think of two valid interpretations:

*This is a bug*
SPDX_FILE_FILTER should apply consistently to ALL file elements, including
rootfs files. The variable should control whether deployed binaries/configs
are included in the SBOM.

*This is by design*
Rootfs files represent the actual deployed system and should ALWAYS be
documented regardless of filtering. SPDX_FILE_FILTER is only meant to
reduce
build-time clutter (source files, patches, tests), not runtime content.

For our use case (dual-profile SBOMs), we need to control whether runtime
files are included. If rootfs filtering isn't intended, we can implement
post-processing in our tooling, but I wanted
to clarify the design intent first.
Thanks for your guidance!

Best regards,
Stefano Tondo

--000000000000fa9bec06445df54d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>```<br>Hi OpenEmbedded SPDX maintainers,<br><br>I&#39=
;m working with the SPDX 3.0 implementation in oe-core and have a question =
<br>about the intended behavior of the SPDX_FILE_FILTER variable.<br><br>I&=
#39;ve observed that SPDX_FILE_FILTER correctly filters files at the packag=
e <br>level (in create_spdx() and create_package_spdx()), but does NOT filt=
er files <br>in the rootfs SPDX document (created by create_rootfs_spdx()).=
<br><br>Test results with core-image-minimal on qemux86-64:<br><br>Package-=
level filtering (working as expected):<br>- SPDX_FILE_FILTER=3D&quot;none&q=
uot;: 0 files in package SPDXs<br>- SPDX_FILE_FILTER=3D&quot;essential&quot=
;: Only LICENSE/README/etc. files<br>- SPDX_FILE_FILTER=3D&quot;all&quot;: =
All source files included<br><br>Rootfs-level (no filtering applied):<br>- =
ALL three modes include 1,671 rootfs files (binaries, configs, etc.)<br>- c=
reate_rootfs_spdx() walks IMAGE_ROOTFS unconditionally<br>- No check of SPD=
X_FILE_FILTER variable<br><br><br>Package filtering (meta/lib/oe/spdx30_tas=
ks.py:165-220):<br><br>def add_package_files(d, objset, pkg, source_files, =
packaged_files):<br>=C2=A0 =C2=A0 spdx_file_filter =3D d.getVar(&quot;SPDX_=
FILE_FILTER&quot;) or &quot;essential&quot;<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=
=A0 if spdx_file_filter =3D=3D &quot;none&quot;:<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return [] =C2=A0# Filtering works here<br>=C2=A0 =C2=A0 elif spdx_fi=
le_filter =3D=3D &quot;essential&quot;:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Fi=
lters to essential files only<br><br><br>Rootfs collection (meta/lib/oe/spd=
x30_tasks.py:1284-1316):<br><br>def create_rootfs_spdx(d):<br>=C2=A0 =C2=A0=
 # ... setup ...<br>=C2=A0 =C2=A0 for dirpath, dirnames, filenames in os.wa=
lk(image_rootfs):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 # No SPDX_FILE_FILTER chec=
k here<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 files.add(objset.new_file(...))<br><b=
r><br>Is this behavior intentional? I can think of two valid interpretation=
s:<br><br><i>This is a bug</i><br>SPDX_FILE_FILTER should apply consistentl=
y to ALL file elements, including <br>rootfs files. The variable should con=
trol whether deployed binaries/configs <br>are included in the SBOM.<br><br=
><i>This is by design</i><br>Rootfs files represent the actual deployed sys=
tem and should ALWAYS be <br>documented regardless of filtering. SPDX_FILE_=
FILTER is only meant to reduce <br>build-time clutter (source files, patche=
s, tests), not runtime content.<br><br>For our use case (dual-profile SBOMs=
), we need to control whether runtime files are included. If rootfs filteri=
ng isn&#39;t intended, we can implement post-processing in our tooling, but=
 I wanted <br>to clarify the design intent first.<br>Thanks for your guidan=
ce!<br><br></div>Best regards,<br>Stefano Tondo</div>

--000000000000fa9bec06445df54d--

