Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9B6B37E424
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 14:21:09 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id i63so8763150ita.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FZDjfS8bPxyS24AI5UgAEh3ISbwrE3RpOUtKcR8fXMU=;
	b=hLXV0lR+wQTaxNp9Quf8cahuawMmCQHTcRY9Tw5B1Ukvr0dIcBANttNrbOFrKcVGXs
	2t3RnFO4/erJgv0BsZjdZO21WO8yg3kJw93+SgwUINpNklXUZ/qCXvlwkAzIaXYAhC8Y
	yBeMfVNhfsETjcAErD8K7feAkuWtPOImB6TFunqpvap6DZl0wjzY5p4kAbVhPLtI5a2c
	t7UxZRMYolOQw/QpSL3r3S/XO2ZEWGyK8Frc6ApWMVK1+ClVJT9Q58QzJ04UCwjctqvI
	0zT5Zuvs3JsbqPmy6fc4LG2g7bIoaJZ+V+mqneWc+R7EfsI96oZo9o4pEfXIDe5EZln9
	f+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FZDjfS8bPxyS24AI5UgAEh3ISbwrE3RpOUtKcR8fXMU=;
	b=oe4uqY9aSh0yUoO87ujdHlGW76qc+1FbI/eLW/R4Z9k7tZtWSwxdZYmCihhacBMR+K
	rN4ilG8tHFWDR2nmqe+maL+Slh+QfsNAAV8cORDemRhZMEWcE4wmGzdArSNpCMqTUd7t
	IKp2ISq+Z0D3QyTNMl5GPVOX6lXlkz0+aM6bwNI3koRZV2gyNOipHxd4UiDrEytCQvUy
	LTrtcoOfjvqMstzvt236YXm6XWV0QtaUjmQRzUc41nTY2W+ujof4KOvdXWbujilVKHLi
	0C2NjgoWgaqV35ImhKDpWxFjxc92/rGxZNK79a/E2wHAvvy9mMuXkyvY/DUgmx1Fk9/f
	Ucyg==
X-Gm-Message-State: APjAAAV981u0zUlr3BAzzvMnFF03UEKjlEJkNb6iF92/SYfFQfFjH+j2
	+hJ7JAoLnK2+On9PbAwtGy1tqbzi5/7DkrADF5Sl7HV7c9c=
X-Google-Smtp-Source: APXvYqzpm2qhqFC/bgctcm+dhZAZLKqesiL4W1vn/EHB8MKEdnRjBa15wjuC6BXBniuPivm+JTiqmDM05puS50dS8yU=
X-Received: by 2002:a02:781c:: with SMTP id p28mr20313471jac.31.1558621270534; 
	Thu, 23 May 2019 07:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190523135514.20622-1-Martin.Jansa@gmail.com>
In-Reply-To: <20190523135514.20622-1-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 May 2019 15:20:59 +0100
Message-ID: <CAJTo0LZf4a-p2RpMbdL6Vch+UHC69b3Jm1z5-Gz7LaGq6RZCKA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools, cmake, meson, waf: define PACKAGECONFIG_CONFARGS before appending it
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
X-List-Received-Date: Thu, 23 May 2019 14:21:09 -0000
Content-Type: text/plain; charset="UTF-8"

I think a neater solution might be to just aways set that when
handling PACKAGECONFIG in base.bbclass.  Presumably the problem here
is that if PACKAGECONFIG isn't set then PACKAGECONFIG_CONFARGS is
never set, so lets ensure it is always set.

Ross

On Thu, 23 May 2019 at 14:55, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * just to make sure it's expaned by bitbake before it gets executed in shell
> * e.g. with cmake.bbclass and cmake recipe (any recipe without
>   PACKAGECONFIG options have this issue) it looks like this:
>   bitbake -e cmake | grep EXTRA_OECMAKE=
>   EXTRA_OECMAKE="     -DCMAKE_DOC_DIR=share/doc/cmake-3.14
>     -DCMAKE_USE_SYSTEM_LIBRARIES=1     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0
>     -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=0
>     -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=0     -DKWSYS_CHAR_IS_SIGNED=1
>     -DBUILD_CursesDialog=0     -DKWSYS_LFS_WORKS=1
>     \${PACKAGECONFIG_CONFARGS}"
>
> * there are some other places where PACKAGECONFIG_CONFARGS is used, but
>   looks like all of them started to use it only after adding
>   PACKAGECONFIG options in the recipe
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/autotools.bbclass | 1 +
>  meta/classes/cmake.bbclass     | 1 +
>  meta/classes/meson.bbclass     | 1 +
>  meta/classes/waf.bbclass       | 1 +
>  4 files changed, 4 insertions(+)
>
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index 8768a6ad68..32961320a5 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -129,6 +129,7 @@ autotools_postconfigure(){
>
>  EXTRACONFFUNCS ??= ""
>
> +PACKAGECONFIG_CONFARGS ??= ""
>  EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
>
>  do_configure[prefuncs] += "autotools_preconfigure autotools_aclocals ${EXTRACONFFUNCS}"
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index d3f0d70847..b5deb7da70 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -56,6 +56,7 @@ OECMAKE_EXTRA_ROOT_PATH ?= ""
>  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY"
>  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
>
> +PACKAGECONFIG_CONFARGS ??= ""
>  EXTRA_OECMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
>
>  EXTRA_OECMAKE_BUILD_prepend_task-compile = "${PARALLEL_MAKE} "
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index 115d1aedcb..4f03a51e09 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -35,6 +35,7 @@ MESON_C_ARGS = "${MESON_TOOLCHAIN_ARGS} ${CFLAGS}"
>  MESON_CPP_ARGS = "${MESON_TOOLCHAIN_ARGS} ${CXXFLAGS}"
>  MESON_LINK_ARGS = "${MESON_TOOLCHAIN_ARGS} ${LDFLAGS}"
>
> +PACKAGECONFIG_CONFARGS ??= ""
>  EXTRA_OEMESON_append = " ${PACKAGECONFIG_CONFARGS}"
>
>  MESON_CROSS_FILE = ""
> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> index 900244004e..f7178b28e9 100644
> --- a/meta/classes/waf.bbclass
> +++ b/meta/classes/waf.bbclass
> @@ -3,6 +3,7 @@ DISABLE_STATIC = ""
>
>  B = "${WORKDIR}/build"
>
> +PACKAGECONFIG_CONFARGS ??= ""
>  EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
>
>  def waflock_hash(d):
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

