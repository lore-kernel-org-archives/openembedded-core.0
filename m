Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7BF6F74524
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 19:15:45 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id w3so21849147wrg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 12:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iaOQCFsf5Rld8v9iwELM+TyQ8hUdGh7+YfuLoR13YLg=;
	b=cIyVYHkBjV0fTGW1xj2sOPeB/5A8qRSusVAHTt+IFYX4TASQci7P1kDEA2O9594R/p
	Lnwmz90g3HZ3sTcm2N91fAn73hIQTm0MKSuinJj1oKIW3oYeV40V8LJq6HRikkrefTrk
	GnRBmAU3z+xBR7VSX7/3vgHKdMBh4InPm8qRDklP9iw1wVfQ/JZq1ezU80+cAfX5vFEC
	2piSET44IgbiNoXbwC+hfaZrmQbY1zdPuOTkK7uE3BUP1BQxbePAX7MiyZUnD6bn9E3g
	a+IBUwYLfyVRX387OTMbpDbbPsJJNA6PUoKl4GgYkAZpp9bvB2Ba1vpFFKWP7OmQxuii
	bYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iaOQCFsf5Rld8v9iwELM+TyQ8hUdGh7+YfuLoR13YLg=;
	b=RbKrudXvLyaJGDVLwtIXsBO5/zsB8dqj4GR70RjwuSZd3jUHoDYW8SjuuqvCMtFRGb
	vC9Dqi1GzhluqDZmxL6DE2cNtC3ARuV5Xlz6iKu45L7bmtDcbHygL3jyk9wQ+/9ORJYK
	imaToGcDQEOdo0rdoY5l7IFir9fKBP0B5VRcp4xHZ9w8luHpTmMax/urT2vZDLTn0Tg3
	ljHssoIF3NXcB+kl0q+X/61Hi5Mk9A0Do7OmnBEz+ssCqAS2naJUW5/rV59absK1tH6b
	CIc2PF7psu+A4OXrTVrlBObbN0T4QYXeDf8533GtzNV3I7mLiIM6DyhYDJNwzmfEe4sj
	0Hvw==
X-Gm-Message-State: ALQs6tD1Nk/6kgWZHqNaPqB64/nDZTePU+osQUjctIWgArg3Yo+SmnWK
	Hrh3A3/8PCcmJP8UGSDxtY0Zgu6YeRYkuHwAt8k=
X-Google-Smtp-Source: AIpwx4+BRuasHCIspVakc/FOECzzV3iXVlkv7qhvr8c9/qqjvduX/og7N75jZ4JM2RSn0FAtIr7//byrhKng4mRzuCM=
X-Received: by 10.28.63.148 with SMTP id m142mr1908537wma.153.1523992545719;
	Tue, 17 Apr 2018 12:15:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.99 with HTTP; Tue, 17 Apr 2018 12:15:45 -0700 (PDT)
In-Reply-To: <1523983449-32655-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1523983449-32655-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 17 Apr 2018 12:15:45 -0700
Message-ID: <CAJ86T=XhMh1+C52TxLR6oPpzyTHe+gt=-VzFZf9A9c-Tt8ST9g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uninative: Add allow-shlib-undefined to BUILD_LDFLAGS and drop other workarounds
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
X-List-Received-Date: Tue, 17 Apr 2018 19:15:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 17, 2018 at 9:44 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> We have a problem when for example, a glibc 2.27 based system builds some
> library like libpopt-native and puts it into sstate then it is reused
> on a pre glibc-2.27 system to build something which depends on popt like
> rpm-native. This results in an error like:
>
> recipe-sysroot-native/usr/lib/libpopt.so: undefined reference to `glob@GLIBC_2.27'
>
> In the past we've had this problem with new symbols like getrandom and
> getentropy, here its with a more complex symbol where there is an old
> version and a newer version.
>
> We've looked into various options, basically we cannot link against our
> uninative libc/ld.so since we don't have the right headers or compiler
> link libraries. The compiler doesn't allow you to switch in a new set
> either, even if we did want to ship them. Shipping a complete compiler,
> dev headers and libs also isn't an option.

Maybe not an option now, but in theory wouldn't a set of native tools
statically linked with musl and downloadable from a public sstate
server solve all these kinds of issues?

> On the other hand if we follow the ld man page, it does say:
>
> """
> The reasons for allowing undefined symbol references in shared libraries
> specified at link time are that:
>
> - A shared library specified at link time may not be the same as the one
>   that is available at load time, so the symbol might actually be
>   resolvable at load time.
> """
>
> which is exactly this case. By the time the binary runs, it will use
> our uninative loader and libc and the symbol will be available.
>
> Therefore we basically have a choice, we get weird intermittent bugs,
> we drop uninative entirely, or we pass this option.
>
> If we pass the option, we can drop the other workarounds too.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/uninative.bbclass                     |  4 +++-
>  meta/recipes-core/expat/expat/no_getrandom.patch   | 23 ----------------------
>  meta/recipes-core/expat/expat_2.2.5.bb             |  2 --
>  .../util-linux/util-linux/no_getrandom.patch       | 21 --------------------
>  meta/recipes-core/util-linux/util-linux_2.31.bb    |  1 -
>  .../python/python3-native_3.5.5.bb                 |  3 +--
>  6 files changed, 4 insertions(+), 50 deletions(-)
>  delete mode 100644 meta/recipes-core/expat/expat/no_getrandom.patch
>  delete mode 100644 meta/recipes-core/util-linux/util-linux/no_getrandom.patch
>
> diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
> index 0501dde..23c5314 100644
> --- a/meta/classes/uninative.bbclass
> +++ b/meta/classes/uninative.bbclass
> @@ -9,7 +9,7 @@ UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.bz2"
>  UNINATIVE_DLDIR ?= "${DL_DIR}/uninative/"
>
>  # Enabling uninative will change the following variables so they need to go the parsing white list to prevent multiple recipe parsing
> -BB_HASHCONFIG_WHITELIST += "NATIVELSBSTRING SSTATEPOSTUNPACKFUNCS"
> +BB_HASHCONFIG_WHITELIST += "NATIVELSBSTRING SSTATEPOSTUNPACKFUNCS BUILD_LDFLAGS"
>
>  addhandler uninative_event_fetchloader
>  uninative_event_fetchloader[eventmask] = "bb.event.BuildStarted"
> @@ -129,6 +129,8 @@ def enable_uninative(d):
>          d.setVar("NATIVELSBSTRING", "universal%s" % oe.utils.host_gcc_version(d))
>          d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
>          d.appendVarFlag("SSTATEPOSTUNPACKFUNCS", "vardepvalueexclude", "| uninative_changeinterp")
> +        d.appendVar("BUILD_LDFLAGS", " -Wl,--allow-shlib-undefined")
> +        d.appendVarFlag("BUILD_LDFLAGS", "vardepvalueexclude", "| -Wl,--allow-shlib-undefined")
>          d.prependVar("PATH", "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
>
>  python uninative_changeinterp () {
> diff --git a/meta/recipes-core/expat/expat/no_getrandom.patch b/meta/recipes-core/expat/expat/no_getrandom.patch
> deleted file mode 100644
> index d64f1bf..0000000
> --- a/meta/recipes-core/expat/expat/no_getrandom.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -The native version of expat may be used on older systems which dont have glibc 2.25
> -and hence don't have getrandom() thanks to uninative. Disable the libc call and
> -use the syscall instead to avoid a compatibility issue until we have 2.25 everywhere
> -we support with uninative.
> -
> -RP
> -2017/8/14
> -
> -Upstream-Status: Inappropriate
> -
> -Index: expat-2.2.3/configure.ac
> -===================================================================
> ---- expat-2.2.3.orig/configure.ac
> -+++ expat-2.2.3/configure.ac
> -@@ -151,7 +151,7 @@ AC_LINK_IFELSE([AC_LANG_SOURCE([
> -   #include <stdlib.h>  /* for NULL */
> -   #include <sys/random.h>
> -   int main() {
> --    return getrandom(NULL, 0U, 0U);
> -+    return getrandomBREAKME(NULL, 0U, 0U);
> -   }
> - ])], [
> -     AC_DEFINE([HAVE_GETRANDOM], [1],
> diff --git a/meta/recipes-core/expat/expat_2.2.5.bb b/meta/recipes-core/expat/expat_2.2.5.bb
> index bce5929..c68a2ef 100644
> --- a/meta/recipes-core/expat/expat_2.2.5.bb
> +++ b/meta/recipes-core/expat/expat_2.2.5.bb
> @@ -11,8 +11,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
>             file://libtool-tag.patch \
>           "
>
> -SRC_URI_append_class-native = " file://no_getrandom.patch"
> -
>  SRC_URI[md5sum] = "789e297f547980fc9ecc036f9a070d49"
>  SRC_URI[sha256sum] = "d9dc32efba7e74f788fcc4f212a43216fc37cf5f23f4c2339664d473353aedf6"
>
> diff --git a/meta/recipes-core/util-linux/util-linux/no_getrandom.patch b/meta/recipes-core/util-linux/util-linux/no_getrandom.patch
> deleted file mode 100644
> index b9fa1ca..0000000
> --- a/meta/recipes-core/util-linux/util-linux/no_getrandom.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -getrandom() is only available in glibc 2.25+ and uninative may relocate
> -binaries onto systems that don't have this function. For now, force the
> -code to the older codepath until we can come up with a better solution
> -for this kind of issue.
> -
> -Upstream-Status: Inappropriate
> -RP
> -2016/8/15
> -
> -Index: util-linux-2.30/configure.ac
> -===================================================================
> ---- util-linux-2.30.orig/configure.ac
> -+++ util-linux-2.30/configure.ac
> -@@ -399,7 +399,6 @@ AC_CHECK_FUNCS([ \
> -       getdtablesize \
> -       getexecname \
> -       getmntinfo \
> --      getrandom \
> -       getrlimit \
> -       getsgnam \
> -       inotify_init \
> diff --git a/meta/recipes-core/util-linux/util-linux_2.31.bb b/meta/recipes-core/util-linux/util-linux_2.31.bb
> index a83919b..7f7a78e 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.31.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.31.bb
> @@ -15,7 +15,6 @@ SRC_URI += "file://configure-sbindir.patch \
>              file://display_testname_for_subtest.patch \
>              file://avoid_parallel_tests.patch \
>  "
> -SRC_URI_append_class-native = " file://no_getrandom.patch"
>  SRC_URI[md5sum] = "5b6821c403c3cc6e7775f74df1882a20"
>  SRC_URI[sha256sum] = "f9be7cdcf4fc5c5064a226599acdda6bdf3d86c640152ba01ea642d91108dc8a"
>
> diff --git a/meta/recipes-devtools/python/python3-native_3.5.5.bb b/meta/recipes-devtools/python/python3-native_3.5.5.bb
> index 70c1512..962ccfc 100644
> --- a/meta/recipes-devtools/python/python3-native_3.5.5.bb
> +++ b/meta/recipes-devtools/python/python3-native_3.5.5.bb
> @@ -42,8 +42,7 @@ DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native s
>
>  inherit native
>
> -# uninative may be used on pre glibc 2.25 systems which don't have getentropy
> -EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip ac_cv_func_getentropy=no"
> +EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
>
>  EXTRA_OEMAKE = '\
>    LIBC="" \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

