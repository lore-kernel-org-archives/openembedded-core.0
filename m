Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3D9C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 06:29:40 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.10559.1737440979311598843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 22:29:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aUpXidS7;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6dd0d09215aso48143036d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 22:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737440978; x=1738045778; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FO98sebQUnjzWvLeeUqUgq8BBmyyN/melAw/X/3Xkd4=;
        b=aUpXidS7A1c/adD/L2ZyCYZQxf3ftbnszEg9jpSJ5G73f0FcvfM+hoxQPcbS2eKzPJ
         HXb5gPdapKZMQxEklwUoWPDlTGvre5gsTwltbWMbEsSu3yhjMI+D6ocmOYrJXkGdd8YC
         xBWWdJehXIVqCF+RQygag9DHel8ng9xTe6mzc9snVkThdJKa+BaoNYBFpiNRlk46SRjY
         CRAK50yv91RbX7UWC21CTDM7biyhzPLVOrv3WkrQcvXT1gHUAua4BmyuYcYDHtLYVlbm
         b2ANdZJS9i4J1HK4AaWnpSJHvxcx7BhRRAfEB4/8/nW5NNKC9m3+mVD0E91sEiVJRzOS
         tNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737440978; x=1738045778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FO98sebQUnjzWvLeeUqUgq8BBmyyN/melAw/X/3Xkd4=;
        b=DMcRsHlfV7CGhVFHEkxETVAMNKd41eixqogepr52O4Lc4sSN4tb9PxB1bEMSPj9h2J
         QP3cBf8ddW4vU8KVl0UuS4KnE8iqIgq/y1D5CFjPGrZRZl86M7EW/DNs1GtHuELWP8U/
         F+W8t3eTHIA1eiAvyU8EBsPjJ42H3wGkcIBsS8r+JUBOOpBbsgqapmy3I8Treay16/3q
         nhMkrUo/GbQ+uubBLlSjpfq9BsGPlWGjDg1/fOxJkF64Up9g7P+Z6KCs0BiPUM534HOO
         mzvlrIHc3dXIMLETXzC2WURDRdMYyImFpTHEja4gPBhfY+MOMhWc5l4OCWZTxK9uvc8N
         9e+g==
X-Gm-Message-State: AOJu0Yy6Qt0KWB+qetJ54JtDNjFYUYCyGpW+Yc/Jjs5C9EnegTwi17rw
	nt+LQN87AX4Trg6T787csjgISP3aovjfAuxNkA52qI0a5e7lOUsUn245DiTcxxpH01+p7G3SNex
	4kPKYjDaQj101aaHQ/v2kL2UMxII=
X-Gm-Gg: ASbGncsjMXTqtp1lcX2xyfaSgPATLKf0L/OG61VhDqTliDX9DEDmyiP84uWcEHaM2Z6
	O9sL00mhxgHAz1v+uws+Tn9lG7uFVI8c+vgK2mjpc2imMWwZfB5VIRE7qSVCgf0YYCocgZS5igp
	EQjXOEWcwgaw==
X-Google-Smtp-Source: AGHT+IFxpRoGJFksiO1pv95qduULy15LDl4Zss0KgmvfvH1KBDkkjjdV6++objDfjlNI76sVbpgBM6IhVycLiT+xWHE=
X-Received: by 2002:a05:6214:5002:b0:6d4:1c9d:4f47 with SMTP id
 6a1803df08f44-6e1b2141a31mr269285436d6.13.1737440978210; Mon, 20 Jan 2025
 22:29:38 -0800 (PST)
MIME-Version: 1.0
References: <20250121034112.1099179-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20250121034112.1099179-1-jiaying.song.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Jan 2025 07:29:27 +0100
X-Gm-Features: AbW1kvZIT015V4clTUlEUDUlcMIpH3RdpTJABGyj71y5fplamY_oDWkzrc73yWU
Message-ID: <CANNYZj81uHFBeNV-hpiWGTsONpH9aNv71SU_JxtJHEXpB_qD9w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] pango: Restore the install tests for pango
To: Jiaying.Song.CN@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 06:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210070

The patch is very non-trivial, upstream maintainer recently once again
said they don't want it [1], so someone will have to rebase it against
every pango update. And in all likelihood that someone will get
frustrated and either not do the update (bad for our ability to
provide current, secure stack) or just drop the patch with it.

My vote is a firm no. If you need to do pango validation, you have to
carry it in a private layer. By the way, even when we had pango tests
running, they were a constant source of fails due to rounding errors,
needing particular harfbuzz versions to pass, or other assumptions
that hold true on maintainers machine, but not elsewhere.

[1] https://gitlab.gnome.org/GNOME/pango/-/issues/799#note_2306373

Alex

On Tue, 21 Jan 2025 at 04:41, Song, Jiaying (CN) via
lists.openembedded.org
<Jiaying.Song.CN=windriver.com@lists.openembedded.org> wrote:
>
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> Due to our use of multiple architectures, removing the install-test
> option severely impacts our ability to validate Pango correctly across
> different platforms.  Moreover, the build tests provided cannot be
> executed in our cross-build environment. Therefore, the install-test is
> restored using the patch provided by upstream:
> https://salsa.debian.org/gnome-team/pango/-/blob/debian/latest/debian/patches/Revert-build-Drop-the-install-tests-option.patch
>
> Related discussions and commits:
> https://gitlab.gnome.org/GNOME/pango/-/issues/799
> https://gitlab.gnome.org/GNOME/pango/-/commit/2c637453aa1ece7daa9c477b95b20d993c70ab4e
> https://gitlab.gnome.org/GNOME/pango/-/commit/927abccf371cd823b185a6df98d871d12601220a
>
> Partial test log:
> ok 1 /text/break/grapheme
> ok 2 /text/break/word
> ok 3 /text/break/sentence
> ok 4 /text/break/line # SKIP Test file not found ok 5 /text/break/emoji ok 6 /text/break/char # End of break tests # End of text tests
> PASS: pango/testboundaries_ucd.test
> SUMMARY: total=27; passed=27; skipped=0; failed=0; user=29.6s; system=18.0s; maxrss=35328
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |   1 +
>  ...-build-Drop-the-install-tests-option.patch | 314 ++++++++++++++++++
>  meta/recipes-graphics/pango/pango/run-ptest   |   6 +
>  meta/recipes-graphics/pango/pango_1.55.5.bb   |  16 +-
>  4 files changed, 335 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-graphics/pango/pango/0001-Revert-build-Drop-the-install-tests-option.patch
>  create mode 100644 meta/recipes-graphics/pango/pango/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index e2a90c1c2ef..e01b7a3c346 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -85,6 +85,7 @@ PTESTS_FAST = "\
>      wayland \
>      xz \
>      zlib \
> +    pango \
>  "
>  PTESTS_FAST:append:libc-glibc = " glibc-y2038-tests"
>  PTESTS_PROBLEMS:remove:libc-glibc = "glibc-y2038-tests"
> diff --git a/meta/recipes-graphics/pango/pango/0001-Revert-build-Drop-the-install-tests-option.patch b/meta/recipes-graphics/pango/pango/0001-Revert-build-Drop-the-install-tests-option.patch
> new file mode 100644
> index 00000000000..5b3c94a1fb4
> --- /dev/null
> +++ b/meta/recipes-graphics/pango/pango/0001-Revert-build-Drop-the-install-tests-option.patch
> @@ -0,0 +1,314 @@
> +From 2e8c8aee4dc7cc069afaec3a2caaeeaa73d5b0ce Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Jeremy=20B=C3=ADcha?= <jeremy.bicha@canonical.com>
> +Date: Mon, 10 Jun 2024 08:52:56 -0400
> +Subject: [PATCH] Revert "build: Drop the install-tests option"
> +
> +This reverts commit 2c637453aa1ece7daa9c477b95b20d993c70ab4e.
> +
> +Upstream-Status: Denied [https://gitlab.gnome.org/GNOME/pango/-/issues/799]
> +Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> +---
> + meson.build                 |   1 +
> + meson.options               |   5 +
> + tests/gen-installed-test.py |  25 +++++
> + tests/meson.build           | 208 +++++++++++++++++++++++++++++++++++-
> + 4 files changed, 237 insertions(+), 2 deletions(-)
> + create mode 100755 tests/gen-installed-test.py
> +
> +diff --git a/meson.build b/meson.build
> +index dd358fe..32bcf97 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -590,6 +590,7 @@ summary('Introspection', gir.found(), section: 'Build')
> + summary('Documentation', get_option('documentation'), section: 'Build')
> + summary('Build Testsuite', get_option('build-testsuite'), section: 'Build')
> + summary('Build Examples', get_option('build-examples'), section: 'Build')
> ++summary('Install tests', get_option('install-tests'), section: 'Build')
> +
> + summary('prefix', pango_prefix, section: 'Directories')
> + summary('includedir', pango_includedir, section: 'Directories')
> +diff --git a/meson.options b/meson.options
> +index 1cf039b..72b07ee 100644
> +--- a/meson.options
> ++++ b/meson.options
> +@@ -25,6 +25,11 @@ option('build-examples',
> +        type: 'boolean',
> +        value: true)
> +
> ++option('install-tests',
> ++       description : 'Install tests',
> ++       type: 'boolean',
> ++       value: false)
> ++
> + option('fontconfig',
> +        description : 'Build with FontConfig support. Passing \'auto\' or \'disabled\' disables fontconfig where it is optional, i.e. on Windows and macOS. Passing \'disabled\' on platforms where fontconfig is required results in error.',
> +        type: 'feature',
> +diff --git a/tests/gen-installed-test.py b/tests/gen-installed-test.py
> +new file mode 100755
> +index 0000000..eeb4abe
> +--- /dev/null
> ++++ b/tests/gen-installed-test.py
> +@@ -0,0 +1,25 @@
> ++#!/usr/bin/env python3
> ++
> ++import sys
> ++import argparse
> ++import os
> ++
> ++template = '''[Test]
> ++Type=session
> ++Exec={}
> ++'''
> ++
> ++def build_template(test_dir, test_name):
> ++    return template.format(os.path.join(test_dir, test_name))
> ++
> ++if __name__ == '__main__':
> ++    argparser = argparse.ArgumentParser(description='Generate installed-test description file')
> ++    argparser.add_argument('installed_test_dir', help='Path for installed test binaries')
> ++    argparser.add_argument('test_name', help='Name of the test unit')
> ++    argparser.add_argument('out_dir', help='Path for the output')
> ++
> ++    args = argparser.parse_args()
> ++
> ++    outfile = os.path.join(args.out_dir, args.test_name + '.test')
> ++    with open(outfile, 'w') as f:
> ++        f.write(build_template(args.installed_test_dir, args.test_name))
> +diff --git a/tests/meson.build b/tests/meson.build
> +index 72ea8be..c288d44 100644
> +--- a/tests/meson.build
> ++++ b/tests/meson.build
> +@@ -90,24 +90,228 @@ if cairo_dep.found()
> +   endif
> + endif
> +
> ++installed_test_data = [
> ++  'boundaries.utf8',
> ++  'GraphemeBreakTest.txt',
> ++  'WordBreakTest.txt',
> ++  'SentenceBreakTest.txt',
> ++  'EmojiBreakTest.txt',
> ++  'CharBreakTest.txt',
> ++]
> ++
> ++installed_test_layouts_data = [
> ++  'layouts/bratwurst2.layout',
> ++  'layouts/bratwurst3.layout',
> ++  'layouts/bratwurst4.layout',
> ++  'layouts/bratwurst.layout',
> ++  'layouts/effigy.layout',
> ++  'layouts/kebab.layout',
> ++  'layouts/tabs.layout',
> ++  'layouts/tabs-nowrap.layout',
> ++  'layouts/valid-1.layout',
> ++  'layouts/valid-2.layout',
> ++  'layouts/valid-3.layout',
> ++  'layouts/valid-4.layout',
> ++  'layouts/valid-5.layout',
> ++  'layouts/valid-6.layout',
> ++  'layouts/valid-7.layout',
> ++  'layouts/valid-8.layout',
> ++  'layouts/valid-9.layout',
> ++  'layouts/valid-10.layout',
> ++  'layouts/valid-11.layout',
> ++  'layouts/valid-12.layout',
> ++  'layouts/valid-13.layout',
> ++  'layouts/valid-14.layout',
> ++  'layouts/valid-15.layout',
> ++  'layouts/valid-16.layout',
> ++  'layouts/valid-17.layout',
> ++  'layouts/valid-18.layout',
> ++  'layouts/valid-19.layout',
> ++  'layouts/valid-20.layout',
> ++  'layouts/valid-21.layout',
> ++  'layouts/valid-22.layout',
> ++  'layouts/tab-crash.layout',
> ++  'layouts/tab-assert.layout',
> ++  'layouts/arabic-format.layout',
> ++  'layouts/no-space.layout',
> ++  'layouts/aaa.layout',
> ++  'layouts/letterspacing.layout',
> ++  'layouts/screaming.layout',
> ++]
> ++
> ++installed_test_fontsets_data = [
> ++  'fontsets/cantarell',
> ++  'fontsets/cantarell2',
> ++  'fontsets/mono',
> ++  'fontsets/mono2',
> ++]
> ++
> ++installed_test_fonts_data = [
> ++  'fonts/amiri-06dd.ttf',
> ++  'fonts/Cantarell-VF.otf',
> ++  'fonts/DejaVuSans-Bold.ttf',
> ++  'fonts/DejaVuSansMono.ttf',
> ++  'fonts/DejaVuSans.ttf',
> ++  'fonts/droid-sans-subset.ttf',
> ++  'fonts/emoji-subset.ttf',
> ++  'fonts/fa-regular-f2db.ttf',
> ++  'fonts/fa-solid-f2db.ttf',
> ++  'fonts/fonts.conf',
> ++  'fonts/noto-sans-cjk.ttf',
> ++]
> ++
> ++test_markups_data = [
> ++  'markups/fail-1',
> ++  'markups/fail-2',
> ++  'markups/fail-3',
> ++  'markups/fail-4',
> ++  'markups/fail-5',
> ++  'markups/fail-6',
> ++  'markups/fail-7',
> ++  'markups/fail-8',
> ++  'markups/fail-9',
> ++  'markups/fail-10',
> ++  'markups/fail-11',
> ++  'markups/fail-12',
> ++  'markups/fail-13',
> ++  'markups/fail-14',
> ++  'markups/fail-15',
> ++  'markups/fail-16',
> ++  'markups/fail-17',
> ++  'markups/fail-20',
> ++  'markups/fail-21',
> ++  'markups/fail-22',
> ++  'markups/fail-23',
> ++  'markups/fail-24',
> ++  'markups/fail-25',
> ++  'markups/fail-26',
> ++  'markups/fail-27',
> ++  'markups/fail-28',
> ++  'markups/fail-29',
> ++  'markups/fail-30',
> ++  'markups/fail-31',
> ++  'markups/fail-32',
> ++  'markups/fail-33',
> ++  'markups/fail-34',
> ++  'markups/fail-35',
> ++  'markups/fail-36',
> ++  'markups/fail-37',
> ++  'markups/fail-38',
> ++  'markups/fail-39',
> ++  'markups/valid-1',
> ++  'markups/valid-2',
> ++  'markups/valid-3',
> ++  'markups/valid-4',
> ++  'markups/valid-5',
> ++  'markups/valid-6',
> ++  'markups/valid-7',
> ++  'markups/valid-8',
> ++  'markups/valid-9',
> ++  'markups/valid-10',
> ++  'markups/valid-11',
> ++  'markups/valid-12',
> ++  'markups/valid-13',
> ++  'markups/valid-14',
> ++  'markups/valid-15',
> ++  'markups/valid-16',
> ++  'markups/valid-17',
> ++  'markups/valid-18',
> ++  'markups/valid-19',
> ++  'markups/valid-20',
> ++  'markups/valid-21',
> ++  'markups/valid-22',
> ++  'markups/valid-23',
> ++  'markups/valid-24',
> ++]
> ++
> ++test_breaks_data = [
> ++  'breaks/one',
> ++  'breaks/two',
> ++  'breaks/three',
> ++  'breaks/nine',
> ++  'breaks/ten',
> ++  'breaks/eleven',
> ++]
> ++
> ++if thai_dep.found()
> ++  test_breaks_data += [ 'breaks/four', ]
> ++endif
> ++
> ++test_items_data = [
> ++  'itemize/one',
> ++  'itemize/two',
> ++]
> ++
> ++installed_test_markups_data = []
> ++foreach d: test_markups_data
> ++  installed_test_markups_data += d + '.markup'
> ++  installed_test_markups_data += d + '.expected'
> ++endforeach
> ++
> ++installed_test_breaks_data = []
> ++foreach d: test_breaks_data
> ++  installed_test_breaks_data += d + '.break'
> ++  installed_test_breaks_data += d + '.expected'
> ++endforeach
> ++
> ++installed_test_items_data = []
> ++foreach d: test_items_data
> ++  installed_test_items_data += d + '.items'
> ++  installed_test_items_data += d + '.expected'
> ++endforeach
> ++
> ++installed_test_nofonts_data = [
> ++  'nofonts/fonts.conf',
> ++]
> ++
> ++installed_test_datadir = join_paths(pango_datadir, 'installed-tests', 'pango')
> ++installed_test_bindir = join_paths(pango_libexecdir, 'installed-tests', 'pango')
> ++
> ++if get_option('install-tests')
> ++  install_data(installed_test_data, install_dir: installed_test_bindir)
> ++  install_data(installed_test_fonts_data, install_dir: join_paths(installed_test_bindir, 'fonts'))
> ++  install_data(installed_test_layouts_data, install_dir: join_paths(installed_test_bindir, 'layouts'))
> ++  install_data(installed_test_markups_data, install_dir: join_paths(installed_test_bindir, 'markups'))
> ++  install_data(installed_test_breaks_data, install_dir: join_paths(installed_test_bindir, 'breaks'))
> ++  install_data(installed_test_items_data, install_dir: join_paths(installed_test_bindir, 'itemize'))
> ++  install_data(installed_test_fontsets_data, install_dir: join_paths(installed_test_bindir, 'fontsets'))
> ++  install_data(installed_test_nofonts_data, install_dir: join_paths(installed_test_bindir, 'nofonts'))
> ++endif
> ++
> ++gen_installed_test = files([ 'gen-installed-test.py' ])
> + gen_all_unicode = files([ 'gen-all-unicode.py' ])
> +
> + custom_target('all-unicode',
> +               output: 'all-unicode.txt',
> +               command: [
> +                 gen_all_unicode, '@OUTPUT@'
> +-              ])
> ++              ],
> ++              install: get_option('install-tests'),
> ++              install_dir: installed_test_bindir)
> +
> + foreach t: tests
> +   name = t[0]
> +   src = t.get(1, [ '@0@.c'.format(name) ])
> +   deps = t.get(2, [ libpango_dep ])
> +
> ++  custom_target(name + '.test',
> ++                output: name + '.test',
> ++                command: [
> ++                  gen_installed_test,
> ++                  installed_test_bindir,
> ++                  name,
> ++                  '@OUTDIR@',
> ++                ],
> ++                install: get_option('install-tests'),
> ++                install_dir: installed_test_datadir)
> ++
> +   bin = executable(name, src,
> +                    dependencies: deps,
> +                    include_directories: root_inc,
> +                    c_args: common_cflags + pango_debug_cflags + test_cflags,
> +-                   cpp_args: common_cppflags + pango_debug_cflags + test_cflags)
> ++                   cpp_args: common_cppflags + pango_debug_cflags + test_cflags,
> ++                   install: get_option('install-tests'),
> ++                   install_dir: installed_test_bindir)
> +
> +   test(name, bin,
> +     args: ['-k', '--tap'],
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-graphics/pango/pango/run-ptest b/meta/recipes-graphics/pango/pango/run-ptest
> new file mode 100644
> index 00000000000..e1fab050ef9
> --- /dev/null
> +++ b/meta/recipes-graphics/pango/pango/run-ptest
> @@ -0,0 +1,6 @@
> +#! /bin/sh
> +
> +# workaround for https://gitlab.gnome.org/GNOME/pango/-/issues/668
> +mkdir -p /usr/share/fonts/pango-private
> +cp -rf /usr/libexec/installed-tests/pango/fonts/* /usr/share/fonts/pango-private
> +gnome-desktop-testing-runner pango
> diff --git a/meta/recipes-graphics/pango/pango_1.55.5.bb b/meta/recipes-graphics/pango/pango_1.55.5.bb
> index 6c7242274f8..3025fe5e972 100644
> --- a/meta/recipes-graphics/pango/pango_1.55.5.bb
> +++ b/meta/recipes-graphics/pango/pango_1.55.5.bb
> @@ -11,29 +11,41 @@ LICENSE = "LGPL-2.0-or-later"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
>
> -inherit gnomebase gi-docgen upstream-version-is-even gobject-introspection
> +inherit gnomebase gi-docgen upstream-version-is-even gobject-introspection ptest-gnome
>
>  UPSTREAM_CHECK_REGEX = "pango-(?P<pver>\d+\.(?!9\d+)\d+\.\d+)"
>
>  GIR_MESON_ENABLE_FLAG = "enabled"
>  GIR_MESON_DISABLE_FLAG = "disabled"
>
> +SRC_URI += "file://run-ptest \
> +            file://0001-Revert-build-Drop-the-install-tests-option.patch \
> +           "
> +
>  SRC_URI[archive.sha256sum] = "e396126ea08203cbd8ef12638e6222e2e1fd8aa9cac6743072fedc5f2d820dd8"
>
>  DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
>
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
> +                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
>
>  PACKAGECONFIG[x11] = ",,virtual/libx11 libxft"
>  PACKAGECONFIG[thai] = "-Dlibthai=enabled,-Dlibthai=disabled,libthai"
> +PACKAGECONFIG[tests] = "-Dinstall-tests=true, -Dinstall-tests=false"
>
>  GIR_MESON_OPTION = 'introspection'
>  GIDOCGEN_MESON_OPTION = 'documentation'
>
> +do_configure:prepend() {
> +       chmod +x ${S}/tests/*.py
> +}
> +
>  LEAD_SONAME = "libpango-1.0*"
>
>  FILES:${PN} = "${bindir}/* ${libdir}/libpango*${SOLIBS}"
>
> +RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us"
> +
>  RPROVIDES:${PN} += "pango-modules pango-module-indic-lang \
>                      pango-module-basic-fc pango-module-arabic-lang"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210068): https://lists.openembedded.org/g/openembedded-core/message/210068
> Mute This Topic: https://lists.openembedded.org/mt/110728034/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

