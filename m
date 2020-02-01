Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3C660C7D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2020 18:48:58 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t2so12664329wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Feb 2020 10:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=xQRY1rXjCq5w7zraMtPwLqJXJiz/HnxseS4ksjAV8iw=;
	b=vO37Tpse0eLu2ubfPeuU4Y2hrcox7UxFh4NBOa2STDNU9Jp44SxGpK6cenyeziSA4C
	7P/WHVldnBYVgzo0D5v3q0Z+TZ8RtIbPxUqG6+reHp+kwzV/H9XeLARgn6jUkEpG3SZF
	IA+jW+IFY/mDxp66y4Y609jyKHpmJ3+stIhQnsLb/9Ukk8HdHmQWY1tIAz7/uxP8RAez
	IUwwZrMe1894CqlBoDxob7Uyc93mAGXithr0rlPihxDLJHC0fU9zJ78kTuM1miLgSseI
	vJ0H/DXKosQG0u7TInbmrV5kCSegUxP1nljPFfCYx4wmJF/ZvAvi7QvezRZuktKSiHaj
	ynww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=xQRY1rXjCq5w7zraMtPwLqJXJiz/HnxseS4ksjAV8iw=;
	b=llF81RQzLtsIOZu3/KivxTc3RimxsvYGKRAsZroCrULKoqPHewRBaXWWEEsCVcS9uO
	qPFW8NO3zEZegYYQs2JVyhJmHDDDACasHLYhJQBmtdPCBIvQD6CXRDKexl/sYDJgOF9y
	Phv9Tqxy8tp5wg1aA0UYDtGtQpk3P0ss36zjtK3DCiWUN7qiKJbFQnmrUB4rOcq6MqFH
	CqaEx/SYHt8752GEyIjgsmdExY18WEv9VaQy/k7OjvPO0V7OQKsOFwswkEFY5Bfz3Bi+
	a5OR/hAtpRVu9A3f+VhH3IrZ/9f9gvpraMrnkGXj2iRNBtgD0PPd6vq2ZupainK5ZVRB
	7nAw==
X-Gm-Message-State: APjAAAW/Kq40zJMRXWKuxqTxTX/ijiOHKEiH964bPPAoSEsOWwFBuHQl
	wtv94Kzx1W7S3UaOUZlGOcoGYH6CBzQFWQ02UM5j9w==
X-Google-Smtp-Source: APXvYqxNq/xa1O+VH3WmK3SB5PmSkEyZ+de/HJGGDecmUVbTA7ZqA03u8L2o8fch5au5jMqhXikKGyBroJ2VmSzlMvg=
X-Received: by 2002:a05:6000:1201:: with SMTP id
	e1mr5680176wrx.386.1580582938808; 
	Sat, 01 Feb 2020 10:48:58 -0800 (PST)
MIME-Version: 1.0
References: <20200127104444.14102-1-andrey.zhizhikin@leica-geosystems.com>
In-Reply-To: <20200127104444.14102-1-andrey.zhizhikin@leica-geosystems.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Sat, 1 Feb 2020 19:48:47 +0100
Message-ID: <CAHtQpK5sz23fBd+QxoSE83=bMfhc3P_W8Mu+FTGY0m393+rz-Q@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	anuj.mittal@intel.com
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: resolve opencv pkg-config in meson build
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
X-List-Received-Date: Sat, 01 Feb 2020 18:48:58 -0000
Content-Type: text/plain; charset="UTF-8"

A one gentle ping here.

On Mon, Jan 27, 2020 at 11:45 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> From: Andrey Zhizhikin <andrey.z@gmail.com>
>
> When opencv is picked in PACKAGECONFIG, plugin fails to locate data
> dirs. This is due to meson.build file uses 'test' utility to verify that
> the data dirs path is present and not taking sysroot into prefix.
>
> Introduce additional patch, which picks up PKG_CONFIG_SYSROOT_DIR as
> prefix for 'test' utility to verify the data dir is actually present.
>
> Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> ---
>  ...issing-opencv-data-dir-in-yocto-buil.patch | 49 +++++++++++++++++++
>  .../gstreamer1.0-plugins-bad_1.16.1.bb        |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
> new file mode 100644
> index 0000000000..4b6591c0d8
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
> @@ -0,0 +1,49 @@
> +From f41caae14b618ab815ede3c408e7482b00316e3e Mon Sep 17 00:00:00 2001
> +From: Andrey Zhizhikin <andrey.z@gmail.com>
> +Date: Mon, 27 Jan 2020 10:22:35 +0000
> +Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
> +
> +When Yocto build is performed, opencv searches for data dir using simple
> +'test' command, this fails because pkg-config provides an absolute
> +path on the target which needs to be prepended by PKG_CONFIG_SYSROOT_DIR
> +in order for the 'test' utility to pick up the absolute path.
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +
> +Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> +---
> + ext/opencv/meson.build | 7 ++++---
> + 1 file changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/ext/opencv/meson.build b/ext/opencv/meson.build
> +index f38b55dfe..a26403482 100644
> +--- a/ext/opencv/meson.build
> ++++ b/ext/opencv/meson.build
> +@@ -78,20 +78,21 @@ else
> + endif
> +
> + if opencv_found
> ++  pkgconf_sysroot = run_command(python3, '-c', 'import os; print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
> +   opencv_prefix = opencv_dep.get_pkgconfig_variable('prefix')
> +   gstopencv_cargs += ['-DOPENCV_PREFIX="' + opencv_prefix + '"']
> +
> +   # Check the data dir used by opencv for its xml data files
> +   # Use prefix from pkg-config to be compatible with cross-compilation
> +-  r = run_command('test', '-d', opencv_prefix + '/share/opencv')
> ++  r = run_command('test', '-d', pkgconf_sysroot + opencv_prefix + '/share/opencv')
> +   if r.returncode() == 0
> +     gstopencv_cargs += '-DOPENCV_PATH_NAME="opencv"'
> +   else
> +-    r = run_command('test', '-d', opencv_prefix + '/share/OpenCV')
> ++    r = run_command('test', '-d', pkgconf_sysroot + opencv_prefix + '/share/OpenCV')
> +     if r.returncode() == 0
> +       gstopencv_cargs += '-DOPENCV_PATH_NAME="OpenCV"'
> +     else
> +-      r = run_command('test', '-d', opencv_prefix + '/share/opencv4')
> ++      r = run_command('test', '-d', pkgconf_sysroot + opencv_prefix + '/share/opencv4')
> +       if r.returncode() == 0
> +         gstopencv_cargs += '-DOPENCV_PATH_NAME="opencv4"'
> +       else
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
> index 56ae7a179e..024277eeb1 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
> @@ -6,6 +6,7 @@ SRC_URI = " \
>      file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
>      file://avoid-including-sys-poll.h-directly.patch \
>      file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
> +    file://opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
>  "
>  SRC_URI[md5sum] = "24d4d30ecc67d5cbc77c0475bcea1210"
>  SRC_URI[sha256sum] = "56481c95339b8985af13bac19b18bc8da7118c2a7d9440ed70e7dcd799c2adb5"
> --
> 2.17.1
>

