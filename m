Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D24103A9AB
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:11:59 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19963.1774437113525330933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ExTwFLQK;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: ernstp@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66a5d76d9e2so2392808a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 04:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774437112; cv=none;
        d=google.com; s=arc-20240605;
        b=LjU9cPSAY9N/pjzQRC7p7+A0uWJBkAD5eOJmVFmk5GBEKrshEkrDuio1H+tKIiCeJc
         51AWXODeoi6Ikn702zwGsdv7VpJWZHZ3gWJuhHQ8/PfdignV4sRE2F7rX6KFuXv6v1mY
         SJ7k6C3xgBZ1GtzctENHtTsDAlFKOjk9QxdLIAa+fnnM6IxmOx4s9dEYgTH+255uHhGv
         H1QDH1GklezgmyMBZzGLSFBg0DRAqDFifCSQKk0SSi/C4RqOMGSI/y1J0bYNKd/wEE3U
         Obbmv2HOzOHRGSzdkVF3/OYMGzXM89ns6kJJLfhZFbORRRcqYXnjKp5sLLx6Gh+E3KWK
         f86A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Yq036fk+ex9HO3uBkUnzKsTMA2tPHbqUeV+dZ+TUHBI=;
        fh=x1DIlnIaGtYdDn6IEbqFIB5OrLecNJSfAare8Sqejg0=;
        b=ctcz9KuY0IyxzOKIEtR+bWHy7kIp1y4QMsgnMu4CBPRdX3zSLxewJP03rEe8z6XA62
         W4+fnteMkgivLDFzaWy/4gd34AV2nRwd5BcHfpnb7oqrI0gWUMmpjDJHobiig2kh3YaN
         yZo4lrgEjK+1nnZT3PokXGLbCGx5tF+h8Dhy/Phc5h46HXAJC8RhFUniTEn5+EhLHFD/
         zsRDd1GD5dAuLzSxSWgRT6wsh0hwQHx5JESX+5Gcj/W4t5Ep9V6e9NnbKxW7olD+5i4m
         YklaEfi28Xdxb0fkMGH1yC7D0lNmoOVwCBGf+0rdK5c03+VG3d4nX+mOT5gdnar68zAQ
         r6dw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774437112; x=1775041912; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yq036fk+ex9HO3uBkUnzKsTMA2tPHbqUeV+dZ+TUHBI=;
        b=ExTwFLQKOgcm+9SakBNHIS3y7U4DwymmNGVLTgdpprVw29QC2Eo5cGB1NncXRGdi8l
         x1juklbqbEN9VCcRXviTOrsftxzOkgflSyQ/yHoLRoEE0EOa1aoQjQv65ON3TpcFdC/k
         jlvVkfmPBkN+bsQuUDDrLi0kIzwSdtifKce9U/nIOFE9c596lL4EVaZWApTMpphC/pg+
         07wexRNcfBwdhP43X7geZjW5CRCgrYu+T6kWGCRfYeq4oslnn1arDm60l7j1JdZ/WVdl
         W8mj078EK1u1SkExvhEaa6Qhjb7ROYMlhW4Nf1KH80lyemkOaOrEnjygSn5O5EFYPvlF
         iRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774437112; x=1775041912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yq036fk+ex9HO3uBkUnzKsTMA2tPHbqUeV+dZ+TUHBI=;
        b=FfCd5oPTyx/l8GcZvPs0eBNvVs+J/hLV6sQO3XUmS96/Kf8Ab4tI//6hfIj8g/gUoV
         CFA/P2EYVtNGGLVcJHLkG8RtKO6K+HD/DJYBSsNUBzXAOrQxdmLgMfsTuAAxrOdmPY5A
         mCGNMtwF1KrsssVUgSLRlsNObLH+29SAmkV+tspso0B+tF1Wu8+yz+6JyxEOkdidvIVc
         DXwdMtz6PcO7uWq5Agx7Qos0n0XB7g2E89opWyE6vwc2to3+qSABk+6IzocIFqj6VpaJ
         qk5OrNOTAG8CAEw7+D8KUDghjOGHZGAxGw1JaUJUlUnqjHo+v53EAoQTm6WzfMVFzWQ3
         a02g==
X-Gm-Message-State: AOJu0YyjVWw98S2sPnEgzefkNLms2fAqKfxJ/Pn5hZ4IqDtI4Fgl1rTJ
	4VQLWWAnCwDgvCLMmgNY4jUE/D9nbRbDQBg2olEBTl2qir6RREahFx6FZ/jnMdmwou0No7mLA78
	BSkRRJLI2fNPuGoN3hLTlbt4XMnjgGzuVwQ==
X-Gm-Gg: ATEYQzzUh9cmunVUnsy2Nk1ZZLj9oAT2/FbPuZEAlrlPpayz2NCc0Htwsyl08iF4l1o
	9+Wb+eWt6rtDhzBsx2UyDyhTjzcTqxc/14N5jG6b2DRVoyD0ANCVKKPJ1JAwpa7axp33qIUJLon
	kY0HWl1AN/hh91Fu1USW9gF4guNAhPCJAl0bNVVic6UFEAAIj1pIgcSOxvYfrBA4tmFGDmouNnC
	nqeFmQwFt3UdICX7SKJwXT/+bEipMmpMqwbp7woJxFXPYBRGBZPe1L1VgOr6F2q8VAKWWm0XTXF
	gdAnONLv+crRM+IWi8dw/BkJSTQHOxE+wr3xaJLHtK5U1synnczEh141wdKkOMVDt91vZQ3koBL
	VZK8n3u9fL8rkUMKT71b46ZcRk7V9BvQWfveGdv+UnAPZm8Xgvw4SZN3Nzz+iLyahJYwL2G8U15
	a309MP9uLyRRckQxnCH5AhvDZw4JdHoxOADby5jiID7LVEAEZmgmRU8m6Z3XH9FY8g36JxzA==
X-Received: by 2002:a05:6402:51c6:b0:668:599e:103a with SMTP id
 4fb4d7f45d1cf-66a826227c9mr2158973a12.8.1774437111511; Wed, 25 Mar 2026
 04:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774391127.git.yoann.congal@smile.fr>
In-Reply-To: <cover.1774391127.git.yoann.congal@smile.fr>
From: Ernst Persson <ernstp@gmail.com>
Date: Wed, 25 Mar 2026 12:12:52 +0100
X-Gm-Features: AQROBzBhkCpGTPGWX5dt1R3_MioHCGsH0C6CHpO3QLj8r9qvUqtxZGU_gRcBKf8
Message-ID: <CAD=4a=X-6A-gOmq9M=Vx6x-2YjLP8QGLJP-DE2V6iYGvCoCtfw@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 00/15] Pull request (cover letter only)
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org, Paul Barker <paul@pbarker.dev>
Content-Type: multipart/alternative; boundary="000000000000b5424e064dd755bf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233872

--000000000000b5424e064dd755bf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What happened to [scarthgap][PATCHv2] busybox: fix for CVE-2026-26157,
CVE-2026-26158
from Hitendra Prajapati?

Den tis 24 mars 2026 kl 23:28 skrev Yoann Congal via lists.openembedded.org
<yoann.congal=3Dsmile.fr@lists.openembedded.org>:

> Those are the patches from the last patch review:
>
> https://lore.kernel.org/openembedded-core/cover.1773966414.git.yoann.cong=
al@smile.fr/T/#t
>
> Passed a-full on autobuilder (with an AB-INT):
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3502
> * qemuarm64-tc failed on what look like the bug 16058 =E2=80=93 AB-INT: r=
ust
> do_test_compile/do_install segfault
> * rebuilt successfully in
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/3396
>
> The following changes since commit
> 077f258eb2125359ffe3982c58433ee14cb21f09:
>
>   busybox: Fixes CVE-2025-60876 (2026-03-16 09:21:34 +0000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib
> stable/scarthgap-next
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/sc=
arthgap-next
>
> for you to fetch changes up to 9f2a6cfda6a2305f52411ca8121f27c8a5a91fa2:
>
>   python3-pip: drop unused Windows distlib launcher templates (2026-03-20
> 10:56:43 +0100)
>
> ----------------------------------------------------------------
>
> Ankur Tyagi (2):
>   wireless-regdb: upgrade 2025.10.07 -> 2026.02.04
>   tiff: ignore CVE-2025-61143, CVE-2025-61144 and CVE-2025-61145
>
> Daniel Turull (3):
>   improve_kernel_cve_report: do not override backported-patch
>   improve_kernel_cve_report: do not use custom version
>   improve_kernel_cve_report: add option to read debugsources.zstd
>
> Eduardo Ferreira (1):
>   go: Fix CVE-2025-61726.patch variable ordering
>
> Krupal Ka Patel (2):
>   python3-setuptools: drop Windows launcher executables on non-mingw
>     builds
>   python3-pip: drop unused Windows distlib launcher templates
>
> Martin Jansa (1):
>   lsb.py: strip ' from os-release file
>
> Peter Marko (1):
>   inetutils: patch CVE-2026-28372
>
> Ryan Eatmon (1):
>   oe-setup-build: Fix typo
>
> Trent Piepho (1):
>   systemd-systemctl: Fix instance name parsing with escapes or periods
>
> Vijay Anusuri (3):
>   freetype: Fix CVE-2026-23865
>   python3-pip: Fix CVE-2026-1703
>   inetutils: Fix CVE-2026-32746
>
>  meta/lib/oe/lsb.py                            |  2 +-
>  .../inetutils/inetutils/CVE-2026-28372.patch  | 86 +++++++++++++++++++
>  .../inetutils/inetutils/CVE-2026-32746.patch  | 40 +++++++++
>  .../inetutils/inetutils_2.5.bb                |  2 +
>  .../systemd/systemd-systemctl/systemctl       |  7 +-
>  .../go/go/CVE-2025-61726.patch                | 21 ++---
>  .../python/python3-pip/CVE-2026-1703.patch    | 37 ++++++++
>  .../python/python3-pip_24.0.bb                | 13 ++-
>  .../python/python3-setuptools_69.1.1.bb       |  9 ++
>  .../freetype/freetype/CVE-2026-23865.patch    | 54 ++++++++++++
>  .../freetype/freetype_2.13.2.bb               |  1 +
>  ....10.07.bb =3D> wireless-regdb_2026.02.04.bb} |  2 +-
>  meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |  2 +-
>  scripts/contrib/improve_kernel_cve_report.py  | 37 +++++++-
>  scripts/oe-setup-build                        |  2 +-
>  15 files changed, 295 insertions(+), 20 deletions(-)
>  create mode 100644
> meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch
>  create mode 100644
> meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch
>  create mode 100644
> meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
>  create mode 100644
> meta/recipes-graphics/freetype/freetype/CVE-2026-23865.patch
>  rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.10.07.bb
> =3D> wireless-regdb_2026.02.04.bb} (94%)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233828):
> https://lists.openembedded.org/g/openembedded-core/message/233828
> Mute This Topic: https://lists.openembedded.org/mt/118492584/4947266
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ernstp@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b5424e064dd755bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">What happened to [scarthgap][PATCHv2] busybox: fix for =
CVE-2026-26157, CVE-2026-26158<br>from Hitendra Prajapati?</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den tis 24 =
mars 2026 kl 23:28 skrev Yoann Congal via <a href=3D"http://lists.openembed=
ded.org" target=3D"_blank">lists.openembedded.org</a> &lt;yoann.congal=3D<a=
 href=3D"mailto:smile.fr@lists.openembedded.org" target=3D"_blank">smile.fr=
@lists.openembedded.org</a>&gt;:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Those are the patches from the last patch review:<br>
<a href=3D"https://lore.kernel.org/openembedded-core/cover.1773966414.git.y=
oann.congal@smile.fr/T/#t" rel=3D"noreferrer" target=3D"_blank">https://lor=
e.kernel.org/openembedded-core/cover.1773966414.git.yoann.congal@smile.fr/T=
/#t</a><br>
<br>
Passed a-full on autobuilder (with an AB-INT):<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/buil=
ds/3502" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/29/builds/3502</a><br>
* qemuarm64-tc failed on what look like the bug 16058 =E2=80=93 AB-INT: rus=
t do_test_compile/do_install segfault<br>
* rebuilt successfully in <a href=3D"https://autobuilder.yoctoproject.org/v=
alkyrie/#/builders/5/builds/3396" rel=3D"noreferrer" target=3D"_blank">http=
s://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/3396</a><br>
<br>
The following changes since commit 077f258eb2125359ffe3982c58433ee14cb21f09=
:<br>
<br>
=C2=A0 busybox: Fixes CVE-2025-60876 (2026-03-16 09:21:34 +0000)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedd=
ed-core-contrib</a> stable/scarthgap-next<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Dstable/scarthgap-next" rel=3D"noreferrer" target=3D"_blank">https://=
git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/scarthgap-ne=
xt</a><br>
<br>
for you to fetch changes up to 9f2a6cfda6a2305f52411ca8121f27c8a5a91fa2:<br=
>
<br>
=C2=A0 python3-pip: drop unused Windows distlib launcher templates (2026-03=
-20 10:56:43 +0100)<br>
<br>
----------------------------------------------------------------<br>
<br>
Ankur Tyagi (2):<br>
=C2=A0 wireless-regdb: upgrade 2025.10.07 -&gt; 2026.02.04<br>
=C2=A0 tiff: ignore CVE-2025-61143, CVE-2025-61144 and CVE-2025-61145<br>
<br>
Daniel Turull (3):<br>
=C2=A0 improve_kernel_cve_report: do not override backported-patch<br>
=C2=A0 improve_kernel_cve_report: do not use custom version<br>
=C2=A0 improve_kernel_cve_report: add option to read debugsources.zstd<br>
<br>
Eduardo Ferreira (1):<br>
=C2=A0 go: Fix CVE-2025-61726.patch variable ordering<br>
<br>
Krupal Ka Patel (2):<br>
=C2=A0 python3-setuptools: drop Windows launcher executables on non-mingw<b=
r>
=C2=A0 =C2=A0 builds<br>
=C2=A0 python3-pip: drop unused Windows distlib launcher templates<br>
<br>
Martin Jansa (1):<br>
=C2=A0 lsb.py: strip &#39; from os-release file<br>
<br>
Peter Marko (1):<br>
=C2=A0 inetutils: patch CVE-2026-28372<br>
<br>
Ryan Eatmon (1):<br>
=C2=A0 oe-setup-build: Fix typo<br>
<br>
Trent Piepho (1):<br>
=C2=A0 systemd-systemctl: Fix instance name parsing with escapes or periods=
<br>
<br>
Vijay Anusuri (3):<br>
=C2=A0 freetype: Fix CVE-2026-23865<br>
=C2=A0 python3-pip: Fix CVE-2026-1703<br>
=C2=A0 inetutils: Fix CVE-2026-32746<br>
<br>
=C2=A0meta/lib/oe/lsb.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0.../inetutils/inetutils/CVE-2026-28372.patch=C2=A0 | 86 +++++++++++++=
++++++<br>
=C2=A0.../inetutils/inetutils/CVE-2026-32746.patch=C2=A0 | 40 +++++++++<br>
=C2=A0.../inetutils/<a href=3D"http://inetutils_2.5.bb" rel=3D"noreferrer" =
target=3D"_blank">inetutils_2.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
=C2=A0.../systemd/systemd-systemctl/systemctl=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 7 +-<br>
=C2=A0.../go/go/CVE-2025-61726.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 21 ++---<br>
=C2=A0.../python/python3-pip/CVE-2026-1703.patch=C2=A0 =C2=A0 | 37 ++++++++=
<br>
=C2=A0.../python/<a href=3D"http://python3-pip_24.0.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-pip_24.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 13 ++-<br>
=C2=A0.../python/<a href=3D"http://python3-setuptools_69.1.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-setuptools_69.1.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 9 ++<br>
=C2=A0.../freetype/freetype/CVE-2026-23865.patch=C2=A0 =C2=A0 | 54 ++++++++=
++++<br>
=C2=A0.../freetype/<a href=3D"http://freetype_2.13.2.bb" rel=3D"noreferrer"=
 target=3D"_blank">freetype_2.13.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0....<a href=3D"http://10.07.bb" rel=3D"noreferrer" target=3D"_blank">=
10.07.bb</a> =3D&gt; <a href=3D"http://wireless-regdb_2026.02.04.bb" rel=3D=
"noreferrer" target=3D"_blank">wireless-regdb_2026.02.04.bb</a>} |=C2=A0 2 =
+-<br>
=C2=A0meta/recipes-multimedia/libtiff/<a href=3D"http://tiff_4.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">tiff_4.6.0.bb</a> |=C2=A0 2 +-<br>
=C2=A0scripts/contrib/improve_kernel_cve_report.py=C2=A0 | 37 +++++++-<br>
=C2=A0scripts/oe-setup-build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A015 files changed, 295 insertions(+), 20 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-=
2026-28372.patch<br>
=C2=A0create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-=
2026-32746.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-=
1703.patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2026-2=
3865.patch<br>
=C2=A0rename meta/recipes-kernel/wireless-regdb/{<a href=3D"http://wireless=
-regdb_2025.10.07.bb" rel=3D"noreferrer" target=3D"_blank">wireless-regdb_2=
025.10.07.bb</a> =3D&gt; <a href=3D"http://wireless-regdb_2026.02.04.bb" re=
l=3D"noreferrer" target=3D"_blank">wireless-regdb_2026.02.04.bb</a>} (94%)<=
br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#233828): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/233828" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/233828</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118492584/494=
7266" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118492584/4947266</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ernstp@gmail.com" target=
=3D"_blank">ernstp@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b5424e064dd755bf--

