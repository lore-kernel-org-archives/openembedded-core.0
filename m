Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC86E6F078
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 09:27:12 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.97890.1766482023605454227
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 01:27:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HIBjLCPZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38107fadda2so35593941fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 01:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766482022; x=1767086822; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQh5DxYysoOQUBW6HlFeN3m3UibvFe1BPrAD2ZpmgJA=;
        b=HIBjLCPZtEWAss/8/R5pwmg4xrFuYbIYa0Dcm/2Zg0UQuXEprvTwr7HHLkANPH7Hzz
         MuZNztJWJVy0RufipK6Bzrx5WcKts24r1BpgkQLCg6Dxz5TmGtQ6uCN3M32bBD5qtMLO
         ibJkTONUUIYRmt8dwbH+AbJ+Ki9xAwJQoL04Rij7OsVI6uGKmz6s63eELMti6hH/5WS3
         FegEROfzDH5V6kgW8uHUf4Z8O09I6V+6zcDzfmDFHzLCEDb4LH0RIQ+gquiAaqEbqwIs
         eP1nmsderFltIo285++HblmOQj1XM7mt7UQQOBlti89o0flKf/J/cO7FDaTG1wsGzGnY
         /ISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766482022; x=1767086822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UQh5DxYysoOQUBW6HlFeN3m3UibvFe1BPrAD2ZpmgJA=;
        b=bApVos4Yqj7myZfP2xJnhLv4iD9iTgFJSOH0aB90hpq+au5AfvU0mG3v3wK5Ew+gC2
         2HdW8bzHLKI0Xe5cUO1Sg8+9+JH98XugxHk1BQrP+tGdTqVbUfMG5RPe9WA++/F5BEvb
         c7QffvHrsbrvFokSWQFFPEFJluM3feo+IOS7mOUfuEWCaBf5tq080ZQqJxzQ+qenDhs3
         0/OHjMVNvnKFwpbEkv6Xo0Ih/vQljdixOH3WcS1IzqNJBOneMnTeZrx3dqKtuKrX3nZR
         o4EQSeIyJNRlSt8Wqgc8PsjD84vIfGMWGVTzMtuswAH+/VdkrJvDQhbvmWGMMRsBCFsB
         nQLw==
X-Gm-Message-State: AOJu0YyG1E9ewysWtNjt8ayUsBfPEMZXzCQiK32+Z4dgrJZfo0EUyMum
	hwpTw+eCs8ZkCaISJNTvo1dGsru34qr3NfB+x/ewgBh1qcImrdY88Rpxm417bv6pw5/ZF5tcUjw
	Cyd5psZZGYikEwpE5an2R+AyuCo9de4Y=
X-Gm-Gg: AY/fxX5TX44UsaAVvcBQTsv6YsM+C3zQLJi3At+HR3JT+dhLP4TlOHuO2YF0heHEpFp
	6UbeFHUerUzzMykHY6FaEyb5QSOARgF0lUDj2o9nsL9b8co8t6dFbudkDruTG9pFdSOvLTZItBp
	9iClmVWjr00m5HqiZTTvWlIubLUS9lrD3AME4Ulu03lblPT/YtRy/UqfOE9oECkrbpuq7rMXYfE
	Xdb0nj77Ci0B0Lm+MrnUfnn8skiVKhRgaevf6z5NeByCvGiX3CMQcff49ImS9KzcDM1b9crHw==
X-Google-Smtp-Source: AGHT+IGRTb9sE8Rt9gHLWS1FBkPYZ0KdHTAzXBqnX6m13GNPPCbM9sEDaZGw2nM2soCLcdTg3MmtEmBI9pCeDfIku8I=
X-Received: by 2002:a05:651c:325a:b0:37f:aae3:db5c with SMTP id
 38308e7fff4ca-381215692c5mr42113881fa.1.1766482021219; Tue, 23 Dec 2025
 01:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20251219120109.1967755-1-koen.kooi@oss.qualcomm.com> <20251219120109.1967755-3-koen.kooi@oss.qualcomm.com>
In-Reply-To: <20251219120109.1967755-3-koen.kooi@oss.qualcomm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 23 Dec 2025 10:26:49 +0100
X-Gm-Features: AQt7F2okcqIjx-etLfURyg2UykV2OzBWWaHhjI6IAntk4loWXzPSCY6KV7_C3Qw
Message-ID: <CA+chaQfjbE3k39A_yZL+2MUPtTg1fb4v+JCo3HuVzW30euM0tA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 2/4] systemd: package 'ukify' seperately
To: koen.kooi@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 09:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228460

On Fri, Dec 19, 2025 at 1:01=E2=80=AFPM Koen Kooi via lists.openembedded.or=
g
<koen.kooi=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> The upgrade to 258.x started shipping 'ukify' by default, but didn't
> adjust the runtime dependencies. Add the python modules 'ukify' imports
> and split out the package to avoid dragging in gigabytes of python just
> plain systemd.
>
> Succesfully tested at runtime on:
> * RB1-core-kit, using u-boot EFI mode + systemd-boot
> * RB3gen2-core-kit, using Qualcomm UEFI + systemd-boot
> * Rubikpi3, using Qualcomm UEFI and type 2 boot
> * Beagleboneblack using u-boot UFI mode + systemd-boot
>
> Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
> ---
>
> No changes since v1/v2/v3
>
>  meta/recipes-core/systemd/systemd_258.1.bb | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_258.1.bb b/meta/recipes-co=
re/systemd/systemd_258.1.bb
> index dcbd4d92f3..70414b03a4 100644
> --- a/meta/recipes-core/systemd/systemd_258.1.bb
> +++ b/meta/recipes-core/systemd/systemd_258.1.bb
> @@ -408,6 +408,7 @@ PACKAGE_BEFORE_PN +=3D "\
>      ${PN}-networkd \
>      ${PN}-rpm-macros \
>      ${PN}-udev-rules \
> +    ${PN}-ukify \
>      ${PN}-vconsole-setup \
>      ${PN}-zsh-completion \
>      libsystemd-shared \
> @@ -630,6 +631,24 @@ FILES:${PN}-udev-rules =3D "\
>                          ${nonarch_libdir}/udev/rules.d/99-systemd.rules =
\
>  "
>
> +SUMMARY:${PN}-ukify =3D "Create and inspect Unified Kernel Images (UKIs)=
"
> +DESCRIPTION:${PN}-ukify =3D "ukify is a tool whose primary purpose is to=
 combine components (usually a kernel, an initrd, and a UEFI boot stub) to =
create a Unified Kernel Image (UKI) =E2=80=94 a PE binary that can be execu=
ted by the firmware to start the embedded linux kernel."
> +FILES:${PN}-ukify =3D "${bindir}/ukify"

Is it correct that ${PN} contains ukify symlink in:
systemd/258.1/packages-split/systemd/usr/lib/systemd/ukify

so ${PN}-ukify always ends in RDEPENDS:${PN}?

systemd/258.1/temp/log.do_package:
...
DEBUG: systemd contains dangling link /usr/bin/ukify
DEBUG: target found in systemd-ukify
...

and now it pulls python3 into all images with systemd.

> +RDEPENDS:${PN}-ukify =3D " \
> +                        python3-compression \
> +                        python3-core \
> +                        python3-crypt \
> +                        python3-datetime \
> +                        python3-io \
> +                        python3-json \
> +                        python3-netclient \
> +                        python3-pefile \
> +                        python3-pprint \
> +                        python3-pydoc \
> +                        python3-pyzstd \
> +                        python3-shell \
> +                       "
> +
>  CONFFILES:${PN} =3D "${sysconfdir}/systemd/coredump.conf \
>         ${sysconfdir}/systemd/journald.conf \
>         ${sysconfdir}/systemd/logind.conf \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228223): https://lists.openembedded.org/g/openembedde=
d-core/message/228223
> Mute This Topic: https://lists.openembedded.org/mt/116858018/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

