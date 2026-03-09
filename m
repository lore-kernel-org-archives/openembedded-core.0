Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AF3F3C269
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 14:08:07 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15096.1773065282625222879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 07:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JOEw09Ru;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a126b79512so4334092e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 07:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773065281; cv=none;
        d=google.com; s=arc-20240605;
        b=gizx02ZW1JTUzCHVgzcy3XZ1G4VLMOtsunCfVi3GjVL+o/G5xFklWsnrROb/cOxgnS
         pYsSwpuvCSpVIgdyprSxRdcD09Yq55t0C56JskvqlPTBgSKxh8SJ/+SEBsJ2yGILUFu2
         NZV7l4Mg/F6aZ7lhSt6mqJrylfNbAO30tU6LkPnKWyuaBIygN9g0aM1GB+AzRT91L82I
         tDQzlVux0CuGbQcTsOxrillBoPuACAwRfzr5gDlWMwZJILaGrvBwZ7BDtaAjAHJ5dSQX
         zZXKyDWL6NKM1ZSkaD58e3ZTQKgnmoCVxKVN2llY/NEw64m+/UZ5N3/bdLJJYTqJR+XF
         JmFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AqA40kszDUno9jF999zFo3sdxqSUT1g8OA8wj4xGB+I=;
        fh=JDWhlunNnZdGHc7DnDKB57FZ1SOsdrQ6AT9XSUnyOyU=;
        b=artsGLsqYa0eV/V4GN4rMVoCkgJDcdk0J6VrJnYvErXwz1qAi/s5nnKMK8K03A7yk6
         vwNRtt7gWYv+DG0ZFuCYct3E/LlnbNAvxkIGx4pr3uIgKezZHjyZZo5stZkhBVQgGBbX
         bdOYW9hPX8T8ssm3ads57szFLbZV+ZBNvf/kNLyIFuua5PIy0eRp2asw8I/+C0tSB/ae
         etgLSkDqzMsxNFCx5pZF+BUHd1v8RPxLhAnHy4BPdji5juyGw8ITnY6WOmgPHvRMosb5
         2/Ku/Y84huuUCSFFaQHaxnJRzyVo2dFN3B1fuIGfAQ9yqwox40cQlYnsthHLJXORlKCh
         uykg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773065281; x=1773670081; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqA40kszDUno9jF999zFo3sdxqSUT1g8OA8wj4xGB+I=;
        b=JOEw09RubVmLAgRpJce5uGOmcILdwkc9Q/xJzF6ukKoR3/mZIz6CE2hm0lX0SDUAic
         Wp7i5xviPEqDIa7VcJAXbaYboW9RUo9BCpsTxm5XC3tkaeefo1jyK6JXgtC4tenH5ZQU
         WMBzUNvAZlphOv02blC/O2QLqSNcJ0lM30JUlNi/B/a/mr/MXlGU5u1s2X6ewYz/+Bf1
         aBvimwquCOOprUlxaxPzHlYSppxPgxjHhOTVxrNNatYwDLCJRAPd0fjriBNVSyRyoVM+
         wHFeQQA20gBysBx2/X8xsxVyDcDGEWQyZAx58UD5rp6cNiM5saBMR8DDJe8uBZt7a4QI
         XJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773065281; x=1773670081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AqA40kszDUno9jF999zFo3sdxqSUT1g8OA8wj4xGB+I=;
        b=e3MOnNMpYzHpae4JTQg2LqneuGblk4DP7ZbyEcsDfW9vJtApHze8VIOo955sDvcbQU
         B9ajHnvtfC72TxPsbsL7xzKa9TWcQVESrJbUonbOks9QIoQ4Uzh4BmJux50jMe41Xzpy
         umg6ISxf7JiAS5xyQg20U2+WUzpD6KPaMT77wx42jVvnvWR8kYiEJqhNwDma/6mSkx14
         wAbd5bYmq9lBpazrWRzD5rGCe6l6w3yLriBDmqJFBPpgz+SoJ4qVGBnBWRrsne5nAI/p
         pbROwmHS1FSN2YW0w7C5Npk6/fk3Nh3uHChqN3mgUKf6uKWvBsqxTEw7lUSbSX8dJuFC
         +5Cw==
X-Gm-Message-State: AOJu0Yyq192GyKH7W6MNjV6GsHeHyz1+x8HYXdBs2+aRsFomYBQkbPfb
	wt8sTcb7T3SwKOAvcdSycPGoQ6TB7/oKZsajAovLiHW6JosUPFAd7xLEyCpQG8NMoLSjGEOUFJe
	hXPqJIlNsUTBSXjeUXXVm0u3SMmyLPpnM1w==
X-Gm-Gg: ATEYQzxId5HAiMt8B+9pc4Hq0SELatHwqEEyWhAINhDQUfJIdjeInhOSycvpcblAX7Z
	YXjFmu6eHkfrHIDGOfhRUkDXBc7jDGgKk73Cqb3tC8JoSyBBSa7oeu6gp2Z0R2KCh/mVCR7MuYI
	VbM7K4iIHCTbum/dstmg5Af6px61WPwzZ/K3fneO3ofOHb3l/TO+0q+5oBqXJQ0zBn5DfLVGK5n
	m7NwaoO+lZfAxHOvd1VD0xlazOXEHrcjSDPdd+SE9d3NPGnFMYF+MYjL8UXi4K5IjSi8yAokLYE
	MRcC75U5GQ==
X-Received: by 2002:a05:6512:31c7:b0:5a1:3b78:8d1a with SMTP id
 2adb3069b0e04-5a13cd332f8mr4396171e87.46.1773065280114; Mon, 09 Mar 2026
 07:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260309070953.2372929-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20260309070953.2372929-1-jiaying.song.cn@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 9 Mar 2026 15:07:46 +0100
X-Gm-Features: AaiRm51gEHA_p35PPiTh2m6ggnScZ9QvV3jDZZb9Hdz5E7AsGw2PAkVa_OJ3oRA
Message-ID: <CA+chaQeMYBa4hLCVG276cPv4=cV3kWyEbpGzMddyXTWZz08rzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-pyzstd: Upgrade 0.17.0 -> 0.19.1
To: Jiaying.Song.CN@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 14:08:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232722

Hi, thanks for working on this, the version imported to oe-core is
broken when LTO is enabled since the import of older version from
meta-oe in December.

Does the python3-misc runtime dependency fix the ptest failures
reported on similar upgrade sent before?

https://lists.openembedded.org/g/openembedded-core/topic/117485653#msg23003=
6
https://lists.openembedded.org/g/openembedded-core/topic/117415035#msg22987=
6
https://lists.openembedded.org/g/openembedded-core/topic/117131419#msg22899=
5

Regards,


On Mon, Mar 9, 2026 at 8:10=E2=80=AFAM Song, Jiaying (CN) via
lists.openembedded.org
<Jiaying.Song.CN=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> Changelog:https://github.com/Rogdham/pyzstd/blob/master/CHANGELOG.md
>
> Recipe changes:
> - Remove 0001-Remove-setuptools-version-limit-of-74.patch (no longer need=
ed)
> - Switch from python_setuptools_build_meta to python_hatchling
> - Add python3-hatch-vcs-native to DEPENDS
> - Add python3-misc to RDEPENDS (provides compression.zstd module)
> - Remove obsolete do_configure:append:arm:toolchain-clang (setup.py no lo=
nger exists)
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  ...emove-setuptools-version-limit-of-74.patch | 27 -------------------
>  ...std_0.17.0.bb =3D> python3-pyzstd_0.19.1.bb} | 12 ++++-----
>  2 files changed, 5 insertions(+), 34 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3-pyzstd/0001-Remo=
ve-setuptools-version-limit-of-74.patch
>  rename meta/recipes-devtools/python/{python3-pyzstd_0.17.0.bb =3D> pytho=
n3-pyzstd_0.19.1.bb} (53%)
>
> diff --git a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setu=
ptools-version-limit-of-74.patch b/meta/recipes-devtools/python/python3-pyz=
std/0001-Remove-setuptools-version-limit-of-74.patch
> deleted file mode 100644
> index f2910322ff..0000000000
> --- a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-=
version-limit-of-74.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 9 Apr 2025 14:38:31 -0700
> -Subject: [PATCH] Remove setuptools version limit of '74'
> -
> -Upstream sticks to 0.74 since setuptools have dropped msvc9compiler
> -support beyond that which is needed for python 3.9 on windows. We
> -do not have this problem on Linux
> -
> -Upstream-Status: Inappropriate [OE-specific]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - pyproject.toml | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/pyproject.toml b/pyproject.toml
> -index dd885e4..5d4d511 100644
> ---- a/pyproject.toml
> -+++ b/pyproject.toml
> -@@ -1,6 +1,6 @@
> - [build-system]
> - # setuptools 64+ support --build-option
> - # setuptools 74+ drops distutils.msvc9compiler required for Python 3.9 =
under Windows
> --requires =3D ["setuptools>=3D64,<74"]
> -+requires =3D ["setuptools>=3D64"]
> - backend-path =3D ["build_script"]
> - build-backend =3D "pyzstd_pep517"
> diff --git a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb b/meta=
/recipes-devtools/python/python3-pyzstd_0.19.1.bb
> similarity index 53%
> rename from meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
> rename to meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
> index af7069b6ed..cda074221d 100644
> --- a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
> +++ b/meta/recipes-devtools/python/python3-pyzstd_0.19.1.bb
> @@ -9,12 +9,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daedb5a2679cd=
1552fb61c181ef974b9e"
>
>  PYPI_PACKAGE =3D "pyzstd"
>
> -SRC_URI +=3D "file://0001-Remove-setuptools-version-limit-of-74.patch"
> -SRC_URI[sha256sum] =3D "d84271f8baa66c419204c1dd115a4dec8b266f8a2921da21=
b81764fa208c1db6"
> +SRC_URI[sha256sum] =3D "36723d3c915b3981de9198d0a2c82b2f5fe3eaa36e4d8d58=
6937830a8afc7d72"
>
> -inherit pypi python_setuptools_build_meta ptest-python-pytest
> +inherit pypi python_hatchling ptest-python-pytest
>
> -# clang-16 with -flto segfaults on arm, therefore ignore flto for now
> -do_configure:append:arm:toolchain-clang() {
> -    sed -i -e "s|'-flto'|''|" ${S}/setup.py
> -}
> +DEPENDS +=3D "python3-hatch-vcs-native"
> +
> +RDEPENDS:${PN} +=3D "python3-misc"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232681): https://lists.openembedded.org/g/openembedde=
d-core/message/232681
> Mute This Topic: https://lists.openembedded.org/mt/118217347/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

