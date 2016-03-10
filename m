Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0B23573198
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 21:24:51 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id e6so7654737vkh.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 13:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=0xqouetzhsbBUz8Qu7v9R0NzjnxBHdyB0l8884+v5Uo=;
	b=Ng1UM3+XywZI/ohsXKgLOWd33L/Bg/iBQgEihG1qoXV23vdgUSqu3wd4bkmbY1x2RH
	Xm7Eh/+mm61RnONrddCuxLILV8yrDfm5SomJy9JOPhazBtLlpGina4Sc14SNQ275rrEx
	xr4r4Zo8BVRIHsengMKBgaPKSx4zYV7EYspJ/b7QUbpHh1XmiJjJXZhqrmHBA2paCL8p
	WP2umt1PIxQUtIPZo2eq6FAo2UwCM4WNj/+4tQyG4IZUKlk9o75M2DUeQNH5CGTMg/PW
	31PaGdhXvO9HJcZER0uk3vL2LtkSy1Wez+9FWMFIg+yui9TkdFVxRX1WwuLb3njletpV
	NZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=0xqouetzhsbBUz8Qu7v9R0NzjnxBHdyB0l8884+v5Uo=;
	b=MXWp/jlU6Qp6SdzV3cBFrakZnRUK4b1cn6hPlT3A6pIkB73WXWt1axLoNUIzI9wmz+
	cV3etzaiSS4KUs7as+JwwD/Yfjii4yShaAm+t4WtDmD+DaZMX2IuBD3CFj/UcfZhrkJl
	2mEUtRsvou1b8nv5QSnmYGiOvmcqJKRwbYRLv/WvtHjyJJfNp/pUZCUfcUCegpSzBHti
	+y6RHGls4p0LyQj4rXEA+CikOn7dx3e6xl9GYWf9mggvuSuLL4i97ClQnwZQCu/T3eI8
	XQzwjmQ8T3SAF7RfiksiD6PLBUxE6RjBh3XW9/mFayve+bc3KS/OMpfM06yxJAoFEa+G
	X9Ng==
X-Gm-Message-State: AD7BkJIb70QNW+84qxgm71Ajua3DiHbbRKazz0jul/B/RC8pmYaqia8Q75l8UwgR7BmanJkTCDFqEMTYXKruBg==
MIME-Version: 1.0
X-Received: by 10.31.162.82 with SMTP id l79mr6257138vke.76.1457645091743;
	Thu, 10 Mar 2016 13:24:51 -0800 (PST)
Received: by 10.159.55.167 with HTTP; Thu, 10 Mar 2016 13:24:51 -0800 (PST)
In-Reply-To: <15c0b6ce47e45b3be9db55c6b32bb2830766e932.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
	<15c0b6ce47e45b3be9db55c6b32bb2830766e932.1457535622.git.alexander.kanavin@linux.intel.com>
Date: Thu, 10 Mar 2016 22:24:51 +0100
Message-ID: <CALbNGRSZXjynMUy2B3Ke9k4g=DwFnhb2eO=xpJj4fGXHT2HBMw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/24] python3-native: use the previous version of python-config script
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
X-List-Received-Date: Thu, 10 Mar 2016 21:24:53 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 9, 2016 at 4:01 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> In python 3.4 python-config was rewritten in shell, ironically
> to support cross-compilation:
> https://bugs.python.org/issue16235
>
> This new shell version is broken in several ways, and doesn't
> have our oe-specific tweaks. Let's revert to the old script,
> which is still provided.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../python/python3-native_3.5.1.bb                 |  1 +
>  ...the-shell-version-of-python-config-that-w.patch | 38 ++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
>
> diff --git a/meta/recipes-devtools/python/python3-native_3.5.1.bb b/meta/recipes-devtools/python/python3-native_3.5.1.bb
> index 152da1c..7bad11a 100644
> --- a/meta/recipes-devtools/python/python3-native_3.5.1.bb
> +++ b/meta/recipes-devtools/python/python3-native_3.5.1.bb
> @@ -25,6 +25,7 @@ file://unixccompiler.patch \
>  ${DISTRO_SRC_URI} \
>  file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
>  file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
> +file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
>  "
>  SRC_URI[md5sum] = "e9ea6f2623fffcdd871b7b19113fde80"
>  SRC_URI[sha256sum] = "c6d57c0c366d9060ab6c0cdf889ebf3d92711d466cc0119c441dbf2746f725c9"
> diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> new file mode 100644
> index 0000000..b7e0ac6
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
> @@ -0,0 +1,38 @@
> +From 045c99b5f1eb6e4e0d8ad1ef9f0ba6574f738150 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 23 Oct 2015 12:25:09 +0300
> +Subject: [PATCH] Do not use the shell version of python-config that was
> + introduced in 3.4
> +
> +Revert instead to the original python version: it has our tweaks and
> +outputs directories correctly.
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + Makefile.pre.in | 9 +++------
> + 1 file changed, 3 insertions(+), 6 deletions(-)
> +
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index d7fc9a0..47e60bc 100644
> +--- a/Makefile.pre.in
> ++++ b/Makefile.pre.in
> +@@ -1270,12 +1270,9 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
> +       sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config.py
> +       # Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
> +       sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < Misc/python-config.sh >python-config
> +-      # On Darwin, always use the python version of the script, the shell
> +-      # version doesn't use the compiler customizations that are provided
> +-      # in python (_osx_support.py).
> +-      if test `uname -s` = Darwin; then \
> +-              cp python-config.py python-config; \
> +-      fi
> ++      # In OpenEmbedded, always use the python version of the script, the shell
> ++      # version is broken in multiple ways, and doesn't return correct directories
> ++      cp python-config.py python-config
> +
> +
> + # Install the include files
> +--
> +2.1.4
> +
> --
> 2.7.0
>
This one seems to report host's python3 version:

[superandy@localhost sysroots]$
x86_64-linux/usr/bin/python3-native/python3-config --ldflags
-lpython3.4m -lpthread -ldl -lutil -lm -Xlinker -export-dynamic

We are at 3.5

Andreas

