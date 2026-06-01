Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA66CD6E5D
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 17:12:07 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4305.1780333925999456120
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 10:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J78CGGOS;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6604df9ba4eso2408340d50.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 10:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780333925; cv=none;
        d=google.com; s=arc-20240605;
        b=F4XQTn0HRi8BjCpewnWXgROpw0atsM1pvxH47JcfMDgEhZnxCrQQzdEIMtiAF7hmW+
         wC5VN+MSyqB5ZVhPMDtu88G02XfKMZN9b4+o8yvdxe/9b9RYYjQ2ltHA86GY13sTj9qV
         EVkx/BnwmfOq+Z86+oHA+PzOfVVb+Et26DhJ6CilZetNEwSiAn4zqE/yp7QhmRJatTeV
         FarC3hJfBmK49CsKQIXIcxbnneAQhR7yFds+FD+Eqy2NCNojllh61vdORt73JKTCCAWO
         wjTkuaaIrOhZ3xPIFV0rMhRMVMUt41pY1vEepnkpsfSwILrXuSnZDfgRNQtr90S9fGV+
         qRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=My+gjNTKi/IObklw9u82idPxVjbBFmxdDQSyMNtE/M8=;
        fh=Q3QUXDmaWdGsCsfyZ3+fF3Ny6SL4Jc5BwXi5p5m2hKU=;
        b=TUpaVZrk7FOBi4Ou3Ne85zlXpJWKmbOImf53jub/VRF4w4iAYpsXqEO+af1wZL7Act
         /iviecmlpHI65wGQ8f/UbtqEQUat/Ol8RjqpDh/awYWC5XuhX68rH4aA1Yvv4QXrqu6X
         vwC4WuoyyRUg2f6kLvRXHdl6tuNtO2OGbM5Jdd7MnifBAAjb0xhMfY/wrEfYdOpc8uHq
         Lwv6nPh4RUjZyjQXsunLbVyMWO878kdWppMvcypGDlCck1KUtXCLFTW1ud2gtWjN7VO3
         th3y3tgQqz0a7ry/c6fTnmPsCBy2Yp0Al/poQb07hvHJ1NT0x0yErici5TaNNfZYgtXQ
         cY4A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780333925; x=1780938725; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=My+gjNTKi/IObklw9u82idPxVjbBFmxdDQSyMNtE/M8=;
        b=J78CGGOSF4dB38IvczqJfUY3hHGvkQjKpJ1XcBv5h5YGdWbZGYV7sBcs3K4YPXi6l/
         dthcZldLOkB3D98TwEXt8hYHmPIWLbsvDOstqwjGsKuhSKtRgVENIVsPlzms0tAkWBpM
         7QHnkkl4WW62xQjHr5EEUYc1oURyKOQ1+PQ/b1EixLx+R5lzqYSJFT4++JUGsX7r9kkX
         tbUe8+LnMFrucSx/0iNKfzFSkm2pdyGsiBmY4b36vpJKmAxo7cNM6N7/j23OH1pI5ePY
         D9Ry/52FDaIeX69XzKzTdUteEIMFjBY4Yf4YGcNnH24xmLyD9kYj5BfomvTShbBJMnAH
         7lOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333925; x=1780938725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=My+gjNTKi/IObklw9u82idPxVjbBFmxdDQSyMNtE/M8=;
        b=Ym8tJGX57ZW0EXvYPfedcOe9TtNvsrkJBqGO5YvYoAWore0lQoPlJgxLxa5JSqdRny
         7H1rB31iNwY9dJW0RDft+4oTLhVhsALUNG72ROj495eSZER4HOXIoB4w/SxhIvzNn/1s
         tHM2jgcHKLzUmVP5gtgBz3h48F6yIfVX8cEqN4OV2MrHoUV0gaPMf7htNDaGqfMOXI/7
         Y5VB1Ehh+5JbeN1cFOUG0A+eizMxF31xhj7tQVxyEettQF0HxwhTvRAUnl/hEQsO2FI9
         r/HRcqDqXu4LI1IsF6xR277V0CrHurRUFhFTSEsEerPkgfEOOezJYRqj6RW5MW43xalr
         cOFA==
X-Gm-Message-State: AOJu0YykjyML/5vzrMh7ZAUa7VC8e3j6tY7MJwZ8/lhieJc8B4webUSu
	ypsSLdPsiI2SNoFYFS3t2jpCfkb90pzKrxsEXO9nvB+brriDUunhd6IMHUtk7JvEkesLhQ4me9J
	BKz11pEOQXVUgsf+/WSTltbb2TnQANkqasQ==
X-Gm-Gg: Acq92OHNZ+W6dkwNXxwIEDzZNbt5h62++9Q+R6SSzEGUL+G9Cd0Jy3zx+JoMkV7OMLW
	QydEECWZVCeGmCFE0GMBByjnByLvOILqrOODMu/h/NHo0Oph2xVSTSMyI7qkbVl56FB5W3esNiS
	F2N/SZy+iYbuGdcd/X94+FPDdq0p+UHzXLCbvAm+Wn5Nhe9dA2QDupOStcPzOsOCeLYW3jO/pLn
	tMsbvN5PJHruqnJ1OisvTBtZZvWWPswqkwlb2iLP7kdcxG4t6ZCbpoiZPcaQ1Ar++5wy8n6QlhI
	i+kgeHOUw6uleo8aIqXm0RYQz688wkomTinHPeEjipnz6+AXLWPfQ84J5joHWNA=
X-Received: by 2002:a05:690e:e83:b0:651:bd7e:c04c with SMTP id
 956f58d0204a3-660a614bfc8mr384970d50.21.1780333924832; Mon, 01 Jun 2026
 10:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260525080108.940237-1-daniel.turull@ericsson.com>
In-Reply-To: <20260525080108.940237-1-daniel.turull@ericsson.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Jun 2026 19:11:51 +0200
X-Gm-Features: AVHnY4IM4kEHs8tNw8FvINhkYI-R3bFoHZpaEA8TjjSYZIg58HHYNIDaeeyk5KQ
Message-ID: <CANNYZj9mwWQivfWuO+tPdpzV91_Sw7=LgKj8wj+gVg+ejVf+eQ@mail.gmail.com>
Subject: Re: [PATCH v5] devtool: upgrade: extract changelog between versions
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, ticotimo@gmail.com, 
	tim.orling@konsulko.com, richard.purdie@linuxfoundation.org, 
	ross.burton@arm.com, yoann.congal@smile.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 17:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237973

Hello Daniel,

from my perspective this is fine and ready, but I'd like to merge
things in a slightly different order. E.g. first add incremental
support to AUH, and take it into use, so that we no longer have those
AUH patchbombs, but rather more manageable, steady amount of email,
and then we can add the changelog feature, so that it can be tweaked
further without an overwhelming amount of updates to look at.

I've seen the patch to AUH has been sent, and I'll get to it asap,
it's much appreciated!

Alex

On Mon, 25 May 2026 at 10:02, <daniel.turull@ericsson.com> wrote:
>
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Automatically extract changelog information when upgrading a recipe.
> Uses the devtool-base tags created during upgrade to diff known
> changelog files (NEWS, ChangeLog, CHANGES, etc.) between the old and
> new versions. For git-based sources, falls back to git log --oneline
> if no changelog file changed.
>
> Prioritize per-version release notes files containing the new version
> number (e.g. v2.42.1-ReleaseNotes, changelog-9.20.23.rst) over generic
> changelog files. When multiple per-version files match, all are included.
> For standard changelog files, picks the one with the most new content.
>
> Resolve RST .. include:: directives by searching the source tree for
> the included file by basename. Strip RST comment blocks (copyright
> headers) from .rst files.
>
> Collapse runs of multiple blank lines and strip leading/trailing
> whitespace for cleaner output suitable for commit messages.
>
> Output is written to workspace/changelogs/<pn>.txt and cleaned up on
> devtool reset. This allows AUH and other tools to pick up the changelog
> without implementing their own extraction logic.
>
> Add test cases for existing test recipes.
>
> Tested with AUH with changelog support (See yocto-patches)
>
> master 2026-05-22:
>
> commits in https://git.openembedded.org/openembedded-core-contrib/log/?h=
=3Ddturull/devtool-changelog-test-master
>
> TOTAL: attempted=3D130 succeeded=3D94(72.31%) failed=3D36(27.69%)
>
>   - Total recipes attempted: 130
>   - With meaningful changelog: 107 (82%)
>   - Without changelog: 23 (18%)
>   - Commit failures: 0
>   - Empty body patches: 0
>
>   Recipes without changelogs:
>
>   - cargo-c: devtool upgrade failed
>   - debugedit: devtool upgrade failed
>   - diffoscope: only PKG-INFO changed
>   - gcc-source-15.2.0: devtool upgrade failed
>   - gdb, gdb-cross-canadian-x86-64, gdb-cross-x86_64: devtool upgrade fai=
led
>   - gtk-doc: devtool upgrade failed
>   - linux-firmware: binary blobs, no changelog in tarball
>   - nfs-utils: no changelog file changed
>   - python3-certifi: only CA bundle + PKG-INFO changed
>   - python3-cryptography-vectors, python3-cryptography: devtool upgrade f=
ailed
>   - python3-hypothesis: no changelog in PyPI sdist
>   - python3-maturin: devtool upgrade failed
>   - python3-poetry-core: no changelog in PyPI sdist
>   - python3-pytz: only timezone data changed
>   - python3-trove-classifiers: only classifiers list changed
>   - python3-uv-build: devtool upgrade failed
>   - python3-wcwidth: only unicode tables changed
>   - sqlite3: amalgamation tarball, no changelog
>   - vte: devtool upgrade failed
>   - xwayland: no changelog in tarball
>
> master 2 months old: (2026-03-22)
>  https://git.openembedded.org/openembedded-core-contrib/log/?h=3Ddturull/=
devtool-changelog-2_months_old
>
> TOTAL: attempted=3D239 succeeded=3D181(75.73%) failed=3D58(24.27%)
>
>   - Total recipes attempted: 239
>   - With meaningful changelog: 191 (80%)
>   - Without changelog: 48 (20%)
>
>   Recipes without changelogs:
>
>   - acpica: devtool upgrade failed
>   - autoconf: devtool upgrade failed
>   - busybox: devtool upgrade failed
>   - cargo-c: devtool upgrade failed
>   - debugedit: devtool upgrade failed
>   - diffoscope: only PKG-INFO changed
>   - gcc-source-15.2.0: devtool upgrade failed
>   - gdb, gdb-cross-x86_64, gdb-cross-canadian-x86-64: devtool upgrade fai=
led
>   - go-cross-x86-64-v3: devtool upgrade failed
>   - groff: devtool upgrade failed
>   - gtk-doc: devtool upgrade failed
>   - icu: no changelog files in source
>   - iproute2: no changelog files in source
>   - libcap: no changelog files in source
>   - libdrm: no changelog files in source
>   - libmpc: devtool upgrade failed
>   - libpciaccess: no changelog files in source
>   - librsvg: devtool upgrade failed
>   - linux-firmware: binary blobs, no changelog in tarball
>   - llvm-project-source: devtool upgrade failed
>   - nfs-utils: no changelog file changed
>   - python3-certifi: only CA bundle + PKG-INFO changed
>   - python3-dtschema: no changelog in PyPI sdist
>   - python3-editables: no changelog in PyPI sdist
>   - python3-hypothesis: no changelog in PyPI sdist
>   - python3-jsonpointer: no changelog in PyPI sdist
>   - python3-maturin: devtool upgrade failed
>   - python3-pdm-backend: no changelog in PyPI sdist
>   - python3-poetry-core: no changelog in PyPI sdist
>   - python3-pytz: only timezone data changed
>   - python3-shacl2code: no changelog in PyPI sdist
>   - python3-spdx-python-model: devtool upgrade failed
>   - python3-sphinxcontrib-svg2pdfconverter: no changelog in PyPI sdist
>   - python3-trove-classifiers: only classifiers list changed
>   - python3-uv-build: devtool upgrade failed
>   - python3-wcwidth: only unicode tables changed
>   - python3-xmltodict: no changelog in PyPI sdist
>   - rpm-sequoia: devtool upgrade failed
>   - spirv-llvm-translator: devtool upgrade failed
>   - sqlite3: amalgamation tarball, no changelog
>   - time: devtool upgrade failed
>   - vte: devtool upgrade failed
>   - wayland: devtool upgrade failed
>   - wayland-protocols: no changelog files in source
>   - wireless-regdb: no changelog files in source
>   - xwayland: no changelog in tarball
>
> AI-generated: kiro with claude-opus-4.6 model
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
>
> ---
>
> v2:
> - squash v1 patches into one commit and keep commit messages
> - Integrate test cases with exiting devtool selftests
>
> v3:
> - do not silently skip the test if changelog is missing
>
> v4:
> - fix typo from commit message and AI-generated tag
>
> v5:
> - add file where the changelog is comming from
> - expand include directives
> - expand per-version matches
> - prioritize per-version files over generic changelogs
> - collect all per-version files, pick largest generic changelog
> - gate RST comment stripping on .rst extension
>
> AI-generated: kiro with claude-opus-4.6 model
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  .../python3-guessing-game_git.bb.changelog    |   3 +
>  .../devtool-upgrade-test1_1.5.3.bb.changelog  |  25 +++
>  .../devtool-upgrade-test2_git.bb.changelog    |   3 +
>  .../devtool-upgrade-test3_1.5.3.bb.changelog  |  25 +++
>  .../devtool-upgrade-test4_1.5.3.bb.changelog  |  25 +++
>  .../devtool-upgrade-test5_git.bb.changelog    |   3 +
>  meta/lib/oeqa/selftest/cases/devtool.py       |  27 +++
>  scripts/lib/devtool/standard.py               |   8 +
>  scripts/lib/devtool/upgrade.py                | 160 ++++++++++++++++++
>  9 files changed, 279 insertions(+)
>  create mode 100644 meta-selftest/recipes-devtools/python/python3-guessin=
g-game_git.bb.changelog
>  create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-te=
st1_1.5.3.bb.changelog
>  create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-te=
st2_git.bb.changelog
>  create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-te=
st3_1.5.3.bb.changelog
>  create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-te=
st4_1.5.3.bb.changelog
>  create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-te=
st5_git.bb.changelog
>
> diff --git a/meta-selftest/recipes-devtools/python/python3-guessing-game_=
git.bb.changelog b/meta-selftest/recipes-devtools/python/python3-guessing-g=
ame_git.bb.changelog
> new file mode 100644
> index 0000000000..571220b2a4
> --- /dev/null
> +++ b/meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.=
changelog
> @@ -0,0 +1,3 @@
> +Changelog for python3-guessing-game: 0.1.0 -> 0.2.0
> +
> +40cf004 Sync with maturin tutorial source
> diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5=
.3.bb.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_=
1.5.3.bb.changelog
> new file mode 100644
> index 0000000000..a37f796a0d
> --- /dev/null
> +++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.c=
hangelog
> @@ -0,0 +1,25 @@
> +Changelog for devtool-upgrade-test1: 1.5.3 -> 1.6.0
> +Source: doc/NEWS
> +
> +1.6.0 - 15 March 2015
> +  - fix lstat64 support when unavailable - separate patches supplied by
> +    Ganael Laplanche and Peter Korsgaard
> +  - (#1506) new option "-D" / "--delay-start" to only show bar after N
> +    seconds (Damon Harper)
> +  - new option "--fineta" / "-I" to show ETA as time of day rather than =
time
> +    remaining - patch supplied by Erkki Sepp=C3=A4l=C3=A4 (r147)
> +  - (#1509) change ETA (--eta / -e) so that days are given if the hours
> +    remaining are 24 or more (Jacek Wielemborek)
> +  - (#1499) repeat read and write attempts on partial buffer fill/empty =
to
> +    work around post-signal transfer rate drop reported by Ralf Ramsauer
> +  - (#1507) do not try to calculate total size in line mode, due to bug
> +    reported by Jacek Wielemborek and Michiel Van Herwegen
> +  - cleanup: removed defunct RATS comments and unnecessary copyright not=
ices
> +  - clean up displayed lines when using --watchfd PID, when PID exits
> +  - output errors on a new line to avoid overwriting transfer bar
> +
> +1.5.7 - 26 August 2014
> +  - show KiB instead of incorrect kiB (Debian bug #706175)
> +  - (#1284) do not gzip man page, for non-Linux OSes (Bob Friesenhahn)
> +  - work around "awk" bug in tests/016-numeric-timer in decimal "," loca=
les
> +  - fix "make rpm" and "make srpm", extend "make release" to sign releas=
es
> diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git=
.bb.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_gi=
t.bb.changelog
> new file mode 100644
> index 0000000000..b7f0019d56
> --- /dev/null
> +++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb.cha=
ngelog
> @@ -0,0 +1,3 @@
> +Changelog for devtool-upgrade-test2: 0.1+git -> 0.1+git
> +
> +6cc6077 dbus-wait.c: Fix typo
> diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5=
.3.bb.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_=
1.5.3.bb.changelog
> new file mode 100644
> index 0000000000..aaab809736
> --- /dev/null
> +++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test3_1.5.3.bb.c=
hangelog
> @@ -0,0 +1,25 @@
> +Changelog for devtool-upgrade-test3: 1.5.3 -> 1.6.0
> +Source: doc/NEWS
> +
> +1.6.0 - 15 March 2015
> +  - fix lstat64 support when unavailable - separate patches supplied by
> +    Ganael Laplanche and Peter Korsgaard
> +  - (#1506) new option "-D" / "--delay-start" to only show bar after N
> +    seconds (Damon Harper)
> +  - new option "--fineta" / "-I" to show ETA as time of day rather than =
time
> +    remaining - patch supplied by Erkki Sepp=C3=A4l=C3=A4 (r147)
> +  - (#1509) change ETA (--eta / -e) so that days are given if the hours
> +    remaining are 24 or more (Jacek Wielemborek)
> +  - (#1499) repeat read and write attempts on partial buffer fill/empty =
to
> +    work around post-signal transfer rate drop reported by Ralf Ramsauer
> +  - (#1507) do not try to calculate total size in line mode, due to bug
> +    reported by Jacek Wielemborek and Michiel Van Herwegen
> +  - cleanup: removed defunct RATS comments and unnecessary copyright not=
ices
> +  - clean up displayed lines when using --watchfd PID, when PID exits
> +  - output errors on a new line to avoid overwriting transfer bar
> +
> +1.5.7 - 26 August 2014
> +  - show KiB instead of incorrect kiB (Debian bug #706175)
> +  - (#1284) do not gzip man page, for non-Linux OSes (Bob Friesenhahn)
> +  - work around "awk" bug in tests/016-numeric-timer in decimal "," loca=
les
> +  - fix "make rpm" and "make srpm", extend "make release" to sign releas=
es
> diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5=
.3.bb.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_=
1.5.3.bb.changelog
> new file mode 100644
> index 0000000000..0ce6547c77
> --- /dev/null
> +++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test4_1.5.3.bb.c=
hangelog
> @@ -0,0 +1,25 @@
> +Changelog for devtool-upgrade-test4: 1.5.3 -> 1.6.0
> +Source: doc/NEWS
> +
> +1.6.0 - 15 March 2015
> +  - fix lstat64 support when unavailable - separate patches supplied by
> +    Ganael Laplanche and Peter Korsgaard
> +  - (#1506) new option "-D" / "--delay-start" to only show bar after N
> +    seconds (Damon Harper)
> +  - new option "--fineta" / "-I" to show ETA as time of day rather than =
time
> +    remaining - patch supplied by Erkki Sepp=C3=A4l=C3=A4 (r147)
> +  - (#1509) change ETA (--eta / -e) so that days are given if the hours
> +    remaining are 24 or more (Jacek Wielemborek)
> +  - (#1499) repeat read and write attempts on partial buffer fill/empty =
to
> +    work around post-signal transfer rate drop reported by Ralf Ramsauer
> +  - (#1507) do not try to calculate total size in line mode, due to bug
> +    reported by Jacek Wielemborek and Michiel Van Herwegen
> +  - cleanup: removed defunct RATS comments and unnecessary copyright not=
ices
> +  - clean up displayed lines when using --watchfd PID, when PID exits
> +  - output errors on a new line to avoid overwriting transfer bar
> +
> +1.5.7 - 26 August 2014
> +  - show KiB instead of incorrect kiB (Debian bug #706175)
> +  - (#1284) do not gzip man page, for non-Linux OSes (Bob Friesenhahn)
> +  - work around "awk" bug in tests/016-numeric-timer in decimal "," loca=
les
> +  - fix "make rpm" and "make srpm", extend "make release" to sign releas=
es
> diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git=
.bb.changelog b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_gi=
t.bb.changelog
> new file mode 100644
> index 0000000000..7c5ecf3505
> --- /dev/null
> +++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test5_git.bb.cha=
ngelog
> @@ -0,0 +1,3 @@
> +Changelog for devtool-upgrade-test5: 0.1+git -> 0.1+git
> +
> +0a60d6a Add dummy commit on tip for testing
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
> index 5ed69aee1b..5a6f38f8d5 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -1944,6 +1944,22 @@ class DevtoolUpgradeTests(DevtoolBase):
>          except:
>              self.skip("Git user.name and user.email must be set")
>
> +    def _check_changelog(self, recipe, oldrecipefile):
> +        """Compare extracted changelog against reference data."""
> +        changelog_ref =3D oldrecipefile + '.changelog'
> +        self.assertExists(changelog_ref, 'Changelog reference file must =
exist for %s' % recipe)
> +        changelog_file =3D os.path.join(self.workspacedir, 'changelogs',=
 '%s.txt' % recipe)
> +        with open(changelog_ref, 'r') as f:
> +            expected =3D f.read()
> +        if not expected:
> +            self.assertNotExists(changelog_file,
> +                'Changelog file should not exist when reference is empty=
')
> +        else:
> +            self.assertExists(changelog_file, 'Changelog file should exi=
st after upgrade')
> +            with open(changelog_file, 'r') as f:
> +                actual =3D f.read()
> +            self.assertEqual(expected, actual)
> +
>      def test_devtool_upgrade(self):
>          # Check preconditions
>          self.assertTrue(not os.path.exists(self.workspacedir), 'This tes=
t cannot be run with a workspace directory under the build directory')
> @@ -1982,6 +1998,8 @@ class DevtoolUpgradeTests(DevtoolBase):
>          with open(newrecipefile, 'r') as f:
>              newlines =3D f.readlines()
>          self.assertEqual(desiredlines, newlines)
> +        # Check changelog
> +        self._check_changelog(recipe, oldrecipefile)
>          # Check devtool reset recipe
>          result =3D runCmd('devtool reset %s -n' % recipe)
>          result =3D runCmd('devtool status')
> @@ -2016,11 +2034,14 @@ class DevtoolUpgradeTests(DevtoolBase):
>          with open(newrecipefile, 'r') as f:
>              newlines =3D f.readlines()
>          self.assertEqual(desiredlines, newlines)
> +        # Check changelog
> +        self._check_changelog(recipe, oldrecipefile)
>          # Check devtool reset recipe
>          result =3D runCmd('devtool reset %s -n' % recipe)
>          result =3D runCmd('devtool status')
>          self.assertNotIn(recipe, result.output)
>          self.assertNotExists(os.path.join(self.workspacedir, 'recipes', =
recipe), 'Recipe directory should not exist after resetting')
> +        self.assertNotExists(os.path.join(self.workspacedir, 'changelogs=
', '%s.txt' % recipe), 'Changelog file should be removed after reset')
>
>      def test_devtool_upgrade_git(self):
>          self._test_devtool_upgrade_git_by_recipe('devtool-upgrade-test2'=
, '6cc6077a36fe2648a5f993fe7c16c9632f946517')
> @@ -2051,6 +2072,8 @@ class DevtoolUpgradeTests(DevtoolBase):
>          with open(newrecipefile, 'r') as f:
>              newlines =3D f.readlines()
>          self.assertEqual(desiredlines, newlines)
> +        # Check changelog
> +        self._check_changelog(recipe, oldrecipefile)
>
>      def test_devtool_upgrade_all_checksums(self):
>          # Check preconditions
> @@ -2075,6 +2098,8 @@ class DevtoolUpgradeTests(DevtoolBase):
>          with open(newrecipefile, 'r') as f:
>              newlines =3D f.readlines()
>          self.assertEqual(desiredlines, newlines)
> +        # Check changelog
> +        self._check_changelog(recipe, oldrecipefile)
>
>      def test_devtool_upgrade_recipe_upgrade_extra_tasks(self):
>          # Check preconditions
> @@ -2116,6 +2141,8 @@ class DevtoolUpgradeTests(DevtoolBase):
>          with open(newcratesincfile, 'r') as f:
>              newlines =3D f.readlines()
>          self.assertEqual(desiredlines, newlines)
> +        # Check changelog
> +        self._check_changelog(recipe, oldrecipefile)
>          # Check devtool reset recipe
>          result =3D runCmd('devtool reset %s -n' % recipe)
>          result =3D runCmd('devtool status')
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
> index 42fb13872d..2a3a62d081 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -2046,6 +2046,14 @@ def _reset(recipes, no_clean, remove_work, config,=
 basepath, workspace):
>
>          clean_preferred_provider(pn, config.workspace_path)
>
> +        # Clean up changelog if present
> +        changelog_file =3D os.path.join(config.workspace_path, 'changelo=
gs', '%s.txt' % pn)
> +        if os.path.exists(changelog_file):
> +            os.remove(changelog_file)
> +            changelog_dir =3D os.path.dirname(changelog_file)
> +            if not os.listdir(changelog_dir):
> +                os.rmdir(changelog_dir)
> +
>  def reset(args, config, basepath, workspace):
>      """Entry point for the devtool 'reset' subcommand"""
>
> diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade=
.py
> index 8930fde5d6..ba56a34d81 100644
> --- a/scripts/lib/devtool/upgrade.py
> +++ b/scripts/lib/devtool/upgrade.py
> @@ -9,6 +9,7 @@
>  import os
>  import sys
>  import re
> +import shlex
>  import shutil
>  import tempfile
>  import logging
> @@ -26,6 +27,32 @@ from devtool import exec_build_env_command, setup_tinf=
oil, DevtoolError, parse_r
>
>  logger =3D logging.getLogger('devtool')
>
> +# Common changelog filenames found in upstream source trees (matched cas=
e-insensitively):
> +# changelog - util-linux, coreutils, dbus, acpid, hdparm
> +# changelog.md - libslirp, ttyrun, python3-maturin, libjpeg-turbo
> +# changelog.rst - python3-pluggy, python3-packaging
> +# changes - openssl, python3-babel, icu, tcl
> +# changes.md - openssl
> +# changes.rst - python3-babel, python3-pathspec
> +# changes.txt - python3-lxml, icu
> +# news - systemd, glib-2.0, libxml2, dbus
> +# news.md - libxml2
> +# news.rst - python3-sphinx
> +# news.adoc - ccache
> +# history.md - python3-requests, python3-hatch-vcs
> +# history.rst - python3-idna, python3-docutils
> +# releases.md - rust, cargo (includes CVEs)
> +# whatsnew.txt - libsdl2
> +_CHANGELOG_BASENAMES =3D {
> +    'changelog', 'changelog.md', 'changelog.rst', 'changelog.txt',
> +    'changes', 'changes.md', 'changes.rst', 'changes.txt',
> +    'news', 'news.md', 'news.rst', 'news.adoc',
> +    'history', 'history.md', 'history.rst',
> +    'releasenotes.md', 'releasenotes.rst',
> +    'releases.md',
> +    'whatsnew.txt',
> +}
> +
>  def _run(cmd, cwd=3D''):
>      logger.debug("Running command %s> %s" % (cwd,cmd))
>      return bb.process.run('%s' % cmd, cwd=3Dcwd)
> @@ -529,6 +556,127 @@ def _run_recipe_upgrade_extra_tasks(pn, rd, tinfoil=
):
>          if not res:
>              raise DevtoolError('Running extra recipe upgrade task %s for=
 %s failed' % (task, pn))
>
> +def _resolve_rst_includes(content, srctree):
> +    """Resolve RST .. include:: directives by reading files from the sou=
rce tree."""
> +    result =3D []
> +    for line in content.splitlines(True):
> +        m =3D re.match(r'^\.\.\s+include::\s+(.+)$', line)
> +        if m:
> +            basename =3D os.path.basename(m.group(1).strip())
> +            # Search for the file in the source tree
> +            for dirpath, _, filenames in os.walk(srctree):
> +                if basename in filenames:
> +                    fpath =3D os.path.join(dirpath, basename)
> +                    try:
> +                        with open(fpath, 'r', errors=3D'replace') as f:
> +                            result.append(f.read())
> +                        break
> +                    except OSError:
> +                        pass
> +            else:
> +                result.append(line)
> +            continue
> +        result.append(line)
> +    return ''.join(result)
> +
> +
> +def _extract_changelog(srctree, pn, old_ver, new_ver, old_tag, new_tag, =
workspace_path, is_git_source):
> +    """Extract changelog between old and new version using devtool git t=
ags."""
> +    changelog_content =3D None
> +    changelog_fname =3D None
> +
> +    # Try to find a changelog file that changed between versions
> +    try:
> +        stdout, _ =3D _run('git diff --name-only %s %s' % (old_tag, new_=
tag), srctree)
> +        changed_files =3D [f.strip() for f in stdout.splitlines() if f.s=
trip()]
> +
> +        # First pass: collect per-version release notes that changed
> +        # Matches files with a version number whose path suggests releas=
e notes
> +        # (e.g. Documentation/releases/v2.42-ReleaseNotes, docs/relnotes=
/2.53.0.adoc)
> +        parts =3D []
> +        source_files =3D []
> +        for fname in changed_files:
> +            if not re.search(r'\d+\.\d+', fname):
> +                continue
> +            if re.search(r'(releas|relnote|change|news|migrat)', fname, =
re.IGNORECASE):
> +                try:
> +                    file_content, _ =3D _run('git show %s' % shlex.quote=
('%s:%s' % (new_tag, fname)), srctree)
> +                except bb.process.ExecutionError:
> +                    try:
> +                        file_content, _ =3D _run('git show %s' % shlex.q=
uote('%s:%s' % (old_tag, fname)), srctree)
> +                    except bb.process.ExecutionError:
> +                        continue
> +                if file_content.strip():
> +                    parts.append(file_content.strip())
> +                    source_files.append(fname)
> +        if parts:
> +            changelog_content =3D '\n\n'.join(parts)
> +            changelog_fname =3D ', '.join(source_files)
> +
> +        # Second pass: pick the largest standard changelog file (NEWS, C=
hangeLog, etc.)
> +        if not changelog_content:
> +            for fname in changed_files:
> +                basename =3D os.path.basename(fname).lower()
> +                if basename in _CHANGELOG_BASENAMES:
> +                    diff_out, _ =3D _run('git diff %s %s -- %s' % (old_t=
ag, new_tag, shlex.quote(fname)), srctree)
> +                    if diff_out.strip():
> +                        lines =3D [line[1:] for line in diff_out.splitli=
nes()
> +                                 if line.startswith('+') and not line.st=
artswith('+++')]
> +                        if lines:
> +                            candidate =3D '\n'.join(lines)
> +                            if not changelog_content or len(candidate) >=
 len(changelog_content):
> +                                changelog_content =3D candidate
> +                                changelog_fname =3D fname
> +    except bb.process.ExecutionError as e:
> +        logger.warning('Changelog file extraction failed: %s' % str(e))
> +
> +    # For git sources, fall back to git log if no changelog file was fou=
nd
> +    if not changelog_content and is_git_source:
> +        try:
> +            stdout, _ =3D _run('git log --oneline %s..%s' % (old_tag, ne=
w_tag), srctree)
> +            if stdout.strip():
> +                changelog_content =3D stdout.strip()
> +        except bb.process.ExecutionError as e:
> +            logger.warning('Changelog git log extraction failed: %s' % s=
tr(e))
> +
> +    if not changelog_content:
> +        return None
> +
> +    # Resolve RST .. include:: directives and strip comment blocks.
> +    # Only applied to .rst files to avoid mangling plain-text changelogs=
.
> +    if changelog_fname and any(f.endswith('.rst') for f in changelog_fna=
me.split(', ')):
> +        changelog_content =3D _resolve_rst_includes(changelog_content, s=
rctree)
> +        # Remove RST comments (.. without ::) and their indented continu=
ation lines
> +        filtered =3D []
> +        in_comment =3D False
> +        for line in changelog_content.splitlines(True):
> +            if line.startswith('..') and '::' not in line:
> +                in_comment =3D True
> +            elif in_comment and (line.startswith('   ') or line.strip() =
=3D=3D ''):
> +                pass
> +            else:
> +                in_comment =3D False
> +                filtered.append(line)
> +        changelog_content =3D ''.join(filtered)
> +
> +    # Clean up content for readability and commit message use
> +    changelog_content =3D re.sub(r'\n{3,}', '\n\n', changelog_content).s=
trip()
> +    if not changelog_content:
> +        return None
> +
> +    changelog_dir =3D os.path.join(workspace_path, 'changelogs')
> +    bb.utils.mkdirhier(changelog_dir)
> +    changelog_path =3D os.path.join(changelog_dir, '%s.txt' % pn)
> +    with open(changelog_path, 'w') as f:
> +        f.write('Changelog for %s: %s -> %s\n' % (pn, old_ver, new_ver))
> +        if changelog_fname:
> +            f.write('Source: %s\n' % changelog_fname)
> +        f.write('\n')
> +        f.write(changelog_content)
> +        f.write('\n')
> +
> +    return changelog_path
> +
>  def upgrade(args, config, basepath, workspace):
>      """Entry point for the devtool 'upgrade' subcommand"""
>
> @@ -610,6 +758,18 @@ def upgrade(args, config, basepath, workspace):
>
>          logger.info('Upgraded source extracted to %s' % srctree)
>          logger.info('New recipe is %s' % rf)
> +
> +        # Extract changelog between versions using the tags created by
> +        # _extract_new_source(): devtool-base-new for git, devtool-base-=
<pv> for tarballs
> +        is_git =3D old_srcrev is not None
> +        newpv =3D args.version or rd.getVar('PV')
> +        new_tag =3D 'devtool-base-new' if is_git else 'devtool-base-%s' =
% newpv
> +        changelog_file =3D _extract_changelog(srctree, pn, old_ver, newp=
v,
> +                                            'devtool-base', new_tag,
> +                                            config.workspace_path, is_gi=
t)
> +        if changelog_file:
> +            logger.info('Changelog extracted to %s' % changelog_file)
> +
>          if license_diff:
>              logger.info('License checksums have been updated in the new =
recipe; please refer to it for the difference between the old and the new l=
icense texts.')
>          preferred_version =3D rd.getVar('PREFERRED_VERSION_%s' % rd.getV=
ar('PN'))
> --
> 2.34.1
>

