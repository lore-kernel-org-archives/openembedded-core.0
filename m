Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0880F6BC9A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2018 23:48:36 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id i7so7622302qtj.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2018 15:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=162G+5McNghHYHGx8SxVee3t5Kfsggm+b8if8OHXbWI=;
	b=e3CugyjA/YN+yrGcBKWdFhXwBNUeqxYTfsgWFUmeQylemY4fKhwnEXuhKuqizbw+kc
	cTsqPQXIbmpnUzxKnLc+uRczOEkQP4e5RYHNBYUjjC/hdvjOZdBSWh5k4KouQto1laNH
	n+G6eoQfKs2PjmaPF0NwS8I3MGx+w4Ue+BlqUO3GGLBXpMATTJP+KHYgmRXnjhh4Ve97
	XL/wd9qGBaP4kOvudWXNjZ/JfNdQ7y3JGm779j0jgbuOB19i60ryjRWcSZNc1pGtJBAi
	yGgxXLD6ZJwsEiYwDgkq1oLGnFIyAL41FJo1xWdhNAilH8tZYKkt5VoueC7hosSpXhcg
	q6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=162G+5McNghHYHGx8SxVee3t5Kfsggm+b8if8OHXbWI=;
	b=tMyIln2SqLBnVNivkpRhqLScUeHpk0xv/O118kfgJYjEXxZ/vXTCdeXLEImjQ27foc
	cA10PomymW07oN7O13iAlkHbgQU1nRkLcFeCo06/5KbyfJUt4ulUhgRg42XIQ3SgD8Tb
	PYZII5m7OhrxCReSD7OsTyUBb2HelghZQXorhF/bKK9u1wWnTl7cnCDNc47TN0BX6cb9
	3gJsjfiQ3OUynlDvAdig9gDCcoFOD8yvNm6uW0Xf2q4yUJWkpeeSGyceM81+nRsc6t/h
	Pm+MjqrtsqsL73p6yQ9hALd7dgfGaOVywFTaKRJkOkjC7D39nOysiDBkyeqELtyT+HcR
	Hbdw==
X-Gm-Message-State: AA+aEWY9Za82kpeQsAe5o5K9sDn849hHrBKNgjCYK8hWxhceEvPVcQVE
	uFgcHbXzduLtV+ySZNPH7NxrmK/AFuzTYobjmRw=
X-Google-Smtp-Source: AFSGD/WYTnGHCsskz+iQVQNUpdqE3ruNjIpxx2vBF8TbRhApnQ6YRHtfRU8xi9j6NiexnlBYSZTnPUKe3R1iZC3NgVg=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr4271449qtn.254.1545436117167; 
	Fri, 21 Dec 2018 15:48:37 -0800 (PST)
MIME-Version: 1.0
References: <1545421530-7972-1-git-send-email-rbilovol@cisco.com>
In-Reply-To: <1545421530-7972-1-git-send-email-rbilovol@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Dec 2018 15:48:11 -0800
Message-ID: <CAMKF1srqgrtC2bNZM30CVSwRHV+uKtXpNCDg2xaT7jJ0f0sTLw@mail.gmail.com>
To: Ruslan Bilovol <rbilovol@cisco.com>
Cc: XE-Linux <xe-linux-external@cisco.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] systemd: fix remaining issues with statx and glibc 2.28+
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2018 23:48:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 21, 2018 at 11:45 AM Ruslan Bilovol <rbilovol@cisco.com> wrote:
>
> Commit 776d14db9589 "systemd: Detect if statx struct is
> defined in sys/stat.h" did only a part of work, and systemd
> build fails on src/basic/chattr-util.c compilation due to
> same statx redefinition issue.
> Backport additional patch from systemd master
>


LGTM

> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> ---
>
> v3: rebased to recent OE master (again)
>
> v2: rebased to recent OE master, added signoff
>
>  ...-linux-stat.h-check-with-other-checks-and.patch | 78 ++++++++++++++++++++++
>  meta/recipes-core/systemd/systemd_239.bb           |  1 +
>  2 files changed, 79 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-unify-linux-stat.h-check-with-other-checks-and.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0001-meson-unify-linux-stat.h-check-with-other-checks-and.patch b/meta/recipes-core/systemd/systemd/0001-meson-unify-linux-stat.h-check-with-other-checks-and.patch
> new file mode 100644
> index 0000000..0db7fce
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-meson-unify-linux-stat.h-check-with-other-checks-and.patch
> @@ -0,0 +1,78 @@
> +From 9c869d08d82c73f62ab3527567858ce4b0cf1257 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
> +Date: Wed, 18 Jul 2018 17:26:17 +0200
> +Subject: [PATCH] meson: unify linux/stat.h check with other checks and use
> + _GNU_SOURCE
> +
> +Using _GNU_SOURCE is better because that's how we include the headers in the
> +actual build, and some headers define different stuff when it is defined.
> +sys/stat.h for example defines 'struct statx' conditionally.
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> +---
> + meson.build         | 20 ++++++++++++++------
> + src/basic/missing.h |  2 +-
> + 2 files changed, 15 insertions(+), 7 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 68423bd..99035d2 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -421,11 +421,9 @@ decl_headers = '''
> + #include <uchar.h>
> + #include <linux/ethtool.h>
> + #include <linux/fib_rules.h>
> +-#include <linux/stat.h>
> + #include <sys/stat.h>
> + '''
> + # FIXME: key_serial_t is only defined in keyutils.h, this is bound to fail
> +-# FIXME: these should use -D_GNU_SOURCE, since that is defined at build time
> +
> + foreach decl : ['char16_t',
> +                 'char32_t',
> +@@ -436,13 +434,23 @@ foreach decl : ['char16_t',
> +                ]
> +
> +         # We get -1 if the size cannot be determined
> +-        have = cc.sizeof(decl, prefix : decl_headers) > 0
> ++        have = cc.sizeof(decl, prefix : decl_headers, args : '-D_GNU_SOURCE') > 0
> ++
> ++        if decl == 'struct statx'
> ++                if have
> ++                        want_linux_stat_h = false
> ++                else
> ++                        have = cc.sizeof(decl,
> ++                                         prefix : decl_headers + '#include <linux/stat.h>',
> ++                                         args : '-D_GNU_SOURCE') > 0
> ++                        want_linux_stat_h = have
> ++                endif
> ++        endif
> ++
> +         conf.set10('HAVE_' + decl.underscorify().to_upper(), have)
> + endforeach
> +
> +-conf.set10('HAVE_STRUCT_STATX_IN_SYS_STAT_H', cc.sizeof('struct statx', prefix : '''
> +-#include <sys/stat.h>
> +-''', args : '-D_GNU_SOURCE') > 0)
> ++conf.set10('WANT_LINUX_STAT_H', want_linux_stat_h)
> +
> + foreach decl : [['IFLA_INET6_ADDR_GEN_MODE',         'linux/if_link.h'],
> +                 ['IN6_ADDR_GEN_MODE_STABLE_PRIVACY', 'linux/if_link.h'],
> +diff --git a/src/basic/missing.h b/src/basic/missing.h
> +index 14ad3d4..9044683 100644
> +--- a/src/basic/missing.h
> ++++ b/src/basic/missing.h
> +@@ -24,7 +24,7 @@
> + #include <uchar.h>
> + #include <unistd.h>
> +
> +-#if !HAVE_STRUCT_STATX_IN_SYS_STAT_H
> ++#if WANT_LINUX_STAT_H
> + #include <linux/stat.h>
> + #endif
> +
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
> index 03acce2..91a026d 100644
> --- a/meta/recipes-core/systemd/systemd_239.bb
> +++ b/meta/recipes-core/systemd/systemd_239.bb
> @@ -37,6 +37,7 @@ SRC_URI += "file://touchscreen.rules \
>             file://0001-timesync-changes-type-of-drift_freq-to-int64_t.patch \
>             file://0001-sysctl-Don-t-pass-null-directive-argument-to-s.patch \
>             file://0002-core-Fix-use-after-free-case-in-load_from_path.patch \
> +           file://0001-meson-unify-linux-stat.h-check-with-other-checks-and.patch \
>             "
>
>  # patches made for musl are only applied on TCLIBC is musl
> --
> 1.9.1
>

