Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD3BD65C4F
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 13:44:27 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15143.1765979063345360121
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 05:44:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jEKZN4IN;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-88059c28da1so55745056d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 05:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765979062; x=1766583862; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WaikXTwkjS0GuZxWkGKbUnjQdLGs/nw71irwEud8Vo=;
        b=jEKZN4IN7i1SkUb3iFQ98Bf1EaPS+/1bDipCWPXy08UlMy4Ohw7Ztb0d71iXDsiKCA
         vjrhGAUK2fwmBq6WLB2442gGR6RbB6ntZHdA/WqsSusInfRpB7M38KDtgNkTkTO3rUXI
         wXTCrZtb7OqQBhqbz7kI/qsN3IyTlYOCRb/FJoN3kqUVvPlHFPAdtmxORnO+93MmNIPx
         gBKxMGD39VVyBWVuNArHUmpru4fgIb3dtFD74kgwB1uoZeOC3nRpP4IvvY6HECSz/hcR
         j/dXrJqDr22nnaORWk/+j9UqkKEIp8+RRM1RMnDfIQiN8n0Gz8Qclc3EBplu56u7CRSJ
         Eu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765979062; x=1766583862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6WaikXTwkjS0GuZxWkGKbUnjQdLGs/nw71irwEud8Vo=;
        b=jmrMImJbibcRLG46Yq8LYolv2nvL9J+7u+cAVRO6h3Rs8u8ku2MliIyEhMsro0M7Tn
         tNnipFRvi+S5bIipJE4ffAbJUwZTikdskMlSQDd4QoKgDK6ir1n6LgcrUDkzKzCQm4Xe
         BHHT4NTzejlDkIKnq44hrfvmrHW7z4gdQKjP4fOMJr+9hpsENyB9IWkwadEZtoueK0k+
         RmcMFhprV9WmjMWqiGloMxdBjm/5nuP+k69MlUHz4BbPkbjwoZVIoWyOlgKEG158PmBc
         Vf61LwFkEvQaUE7eta5DN9dSNCy87mwxAdFyS6Uvv5NJbrLqAyJND82jNc66BQhJerRU
         RNUQ==
X-Gm-Message-State: AOJu0Yx39Wr+ieLYXON9Vh/+jbZrZo4vLg0DnWCsBsR1m0/mz20AtmaD
	MMW5Ck1t9SL9pMRDn8OiKPRvIuIj7liWGZuaqIUdwS/yLBBzRwK58Ayb7zav2V5sKRtV9tJu+qz
	KR5wKKTXvtUvogujAe55qxQIT49ML7gE=
X-Gm-Gg: AY/fxX5NHIh56IuX9AzUlbjPkKvGN06T1kQmlxEK6jt6zHirxOZWvbUPDwWwFaUbzi+
	m47x3g9ZTp1RxZIexMFN5Vd+a0wxviC6/8qHS5UmCwli9Ihrl1CYangIvZO10/NfUVVvU4BtpSZ
	IPynXUF1oIT7AsnAVYEjNCCh6TPhVnAvyAW5bmOXauwUvgL+mwaZZidmWE2vxWrWoIyKgAIOryu
	WczqtBn2JbUw+rtZrQdXliWU+PeyVHn799bRLVO5t6CA6zetmco/NKQWwycycMBr0MQGjQDd/QM
	OpvA8/1QArUnlbLUJ44usb2ho7kuCA==
X-Google-Smtp-Source: AGHT+IFIYBhnzcsYX703JACOd+p2Zy0LI7opt2FlezOeNHrHa9ULFbRzQFa73/kfuHFLfhkZm0h+mQNXZ4jDhtYg+m0=
X-Received: by 2002:a05:6214:2b95:b0:88a:589b:5da3 with SMTP id
 6a1803df08f44-88a589b75c9mr17145886d6.6.1765979062179; Wed, 17 Dec 2025
 05:44:22 -0800 (PST)
MIME-Version: 1.0
References: <20251217130644.2710575-1-m.schwan@phytec.de>
In-Reply-To: <20251217130644.2710575-1-m.schwan@phytec.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Dec 2025 14:44:10 +0100
X-Gm-Features: AQt7F2raEcsNOE9sKLrDi3e-WcEg2avXjOb0jh9Gfu2MSJQlhk1u5o9YvCEL9lI
Message-ID: <CANNYZj-yTDMX6P4KgZ7sThkqxF4qQpxemAcXAvrAUV0pR2hCbw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] cargo-update-recipe-crates: Don't fail
 for partially empty Cargo.lock
To: m.schwan@phytec.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 13:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228043

Thanks, this lgtm.

Alex

On Wed, 17 Dec 2025 at 14:07, Martin Schwan via lists.openembedded.org
<m.schwan=3Dphytec.de@lists.openembedded.org> wrote:
>
> Do not fail if only some Cargo.lock files are empty. Only fail, if there
> are absolutely no dependencies found in any Cargo.lock.
>
> This fixes the following error message, which would occur with "bitbake
> -c update_crates python3-orjson":
>
>     ERROR: python3-orjson-3.10.17-r0 do_update_crates: Execution of '.../=
python3-orjson/3.10.17/temp/run.do_update_crates.70693' failed with exit co=
de 1
>     ERROR: Logfile of failure stored in: .../python3-orjson/3.10.17/temp/=
log.do_update_crates.70693
>     Log data follows:
>     | DEBUG: Executing python function extend_recipe_sysroot
>     | NOTE: Direct dependencies are ['.../sources/oe-core/../oe-core/meta=
/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual=
:native:.../sources/oe-core/../oe-core/meta/recipes-devtools/patch/patch_2.=
8.bb:do_populate_sysroot', 'virtual:native:.../sources/oe-core/../oe-core/m=
eta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot']
>     | NOTE: Installed into sysroot: []
>     | NOTE: Skipping as already exists in sysroot: ['gettext-minimal-nati=
ve', 'cmake-native', 'libtool-native', 'quilt-native', 'texinfo-dummy-nativ=
e', 'openssl-native', 'expat-native', 'ncurses-native', 'util-linux-libuuid=
-native', 'zlib-native', 'libedit-native', 'make-native', 'patch-native', '=
perl-native', 'python3-native', 'bzip2-native', 'xz-native', 'zstd-native',=
 'attr-native', 'gdbm-native', 'libffi-native', 'sqlite3-native']
>     | DEBUG: Python function extend_recipe_sysroot finished
>     | DEBUG: Executing shell function do_update_crates
>     | Traceback (most recent call last):
>     |   File "<stdin>", line 41, in <module>
>     |   File "<stdin>", line 12, in get_crates
>     | ValueError: Unable to find any candidate crates that use crates.io
>     |
>     | The above exception was the direct cause of the following exception=
:
>     |
>     | Traceback (most recent call last):
>     |   File "<stdin>", line 43, in <module>
>     | ValueError: Cannot parse '.../python3-orjson/3.10.17/sources/orjson=
-3.10.17/include/cargo/simdutf8-0.1.5/Cargo.lock'
>     | WARNING: exit code 1 from a shell command.
>     ERROR: Task (.../sources/oe-core/../meta-openembedded/meta-python/rec=
ipes-devtools/python/python3-orjson_3.10.17.bb:do_update_crates) failed wit=
h exit code '1'
>
> Signed-off-by: Martin Schwan <m.schwan@phytec.de>
> ---
> Changes in v3:
>   - Revert back to piping Python code to native Python
> ---
>  .../cargo-update-recipe-crates.bbclass           | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/met=
a/classes-recipe/cargo-update-recipe-crates.bbclass
> index 3251d5ef2e..ffc658f0f1 100644
> --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> @@ -38,7 +38,8 @@ def get_crates(f):
>      crates_candidates =3D list(filter(lambda c: 'crates.io' in c.get('so=
urce', ''), crates['package']))
>
>      if not crates_candidates:
> -        raise ValueError("Unable to find any candidate crates that use c=
rates.io")
> +        print("WARNING: Unable to find any candidate crates that use cra=
tes.io")
> +        return None
>
>      # Update crates uri and their checksum, to avoid name clashing on th=
e checksum
>      # we need to rename crates with name and version to have a unique ke=
y
> @@ -65,14 +66,11 @@ for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DI=
R}'):
>          continue
>      for file in files:
>          if file =3D=3D 'Cargo.lock':
> -            try:
> -                cargo_lock_path =3D os.path.join(root, file)
> -                crates +=3D get_crates(os.path.join(root, file))
> -            except Exception as e:
> -                raise ValueError("Cannot parse '%s'" % cargo_lock_path) =
from e
> -            else:
> -                found =3D True
> -if not found:
> +            cargo_lock_path =3D os.path.join(root, file)
> +            c =3D get_crates(cargo_lock_path)
> +            if c is not None:
> +                crates +=3D c
> +if crates is None:
>      raise ValueError("Unable to find any Cargo.lock in ${CARGO_LOCK_SRC_=
DIR}")
>  open("${TARGET_FILE}", 'w').write(crates)
>  EOF
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228040): https://lists.openembedded.org/g/openembedde=
d-core/message/228040
> Mute This Topic: https://lists.openembedded.org/mt/116825555/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

