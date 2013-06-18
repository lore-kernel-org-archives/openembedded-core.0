Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D61F605F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 14:17:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5IEHuNq026904
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 07:17:57 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 07:17:56 -0700
Message-ID: <51C06C13.3030104@windriver.com>
Date: Tue, 18 Jun 2013 09:17:55 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1371535277.git.rongqing.li@windriver.com>
	<0a46b955bf906f9ce2c6a9045c740ac44a1b0959.1371535277.git.rongqing.li@windriver.com>
In-Reply-To: <0a46b955bf906f9ce2c6a9045c740ac44a1b0959.1371535277.git.rongqing.li@windriver.com>
Subject: Re: [PATCH 1/1] cairo: fix build error since toolchain has not get_feature command
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
X-List-Received-Date: Tue, 18 Jun 2013 14:17:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/13 1:02 AM, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   ...-check-stderr-when-test-compiling-in-conf.patch |   39 ++++++++++++++++++++
>   meta/recipes-graphics/cairo/cairo_1.12.14.bb       |    3 +-
>   2 files changed, 41 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-graphics/cairo/cairo/cairo-don-t-check-stderr-when-test-compiling-in-conf.patch
>
> diff --git a/meta/recipes-graphics/cairo/cairo/cairo-don-t-check-stderr-when-test-compiling-in-conf.patch b/meta/recipes-graphics/cairo/cairo/cairo-don-t-check-stderr-when-test-compiling-in-conf.patch
> new file mode 100644
> index 0000000..e04c3b2
> --- /dev/null
> +++ b/meta/recipes-graphics/cairo/cairo/cairo-don-t-check-stderr-when-test-compiling-in-conf.patch
> @@ -0,0 +1,39 @@
> +From 1581e5373c5917ed8ff6f7129c51160594c927d1 Mon Sep 17 00:00:00 2001
> +From: "Song.Li" <Song.Li@windriver.com>
> +Date: Mon, 30 Jul 2012 16:38:02 +0800
> +Subject: [PATCH] cairo:don't check stderr when test compiling in configure
> +
> +Upstream-Status: Pending
> +
> +cairo configure use a special macro to test compiling feature.
> +It'll require no any warnings or errors in stderr.That is too strict.
> +for example, when there is no get_feature in gcc,
> +gcc will print "no get_feature" in stderr, but that is not a real error.

FYI -- 'get_feature' is something specific to Wind River.  The patch is still 
reasonable, but the commit description might need some cleanup for people not 
familiar with some of our internal tools.

I'd suggest just removing the example part.

--Mark

> +so let cairo don't check stderr,just check the return value of compiling
> +is enough.
> +
> +Signed-off-by: Song.Li <Song.Li@windriver.com>
> +---
> + build/aclocal.cairo.m4 |    6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/build/aclocal.cairo.m4 b/build/aclocal.cairo.m4
> +index 592e168..4de3b26 100644
> +--- a/build/aclocal.cairo.m4
> ++++ b/build/aclocal.cairo.m4
> +@@ -106,9 +106,9 @@ AC_DEFUN([CAIRO_CC_TRY_LINK_WITH_ENV_SILENT],[dnl
> + 		[cairo_cc_stderr=`test -f conftest.err && cat conftest.err`
> + 		 cairo_cc_flag=no])
> +
> +-	if test "x$cairo_cc_stderr" != "x"; then
> +-		cairo_cc_flag=no
> +-	fi
> ++dnl	if test "x$cairo_cc_stderr" != "x"; then
> ++dnl		cairo_cc_flag=no
> ++dnl	fi
> +
> + 	if test "x$cairo_cc_flag" = "xyes"; then
> + 		ifelse([$3], , :, [$3])
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-graphics/cairo/cairo_1.12.14.bb b/meta/recipes-graphics/cairo/cairo_1.12.14.bb
> index 40aa169..5c8c9cd 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.12.14.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.12.14.bb
> @@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
>   PR = "r0"
>
>   SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
> -           file://png.patch"
> +           file://png.patch \
> +           file://cairo-don-t-check-stderr-when-test-compiling-in-conf.patch"
>
>   SRC_URI[md5sum] = "27b634113d0f52152d60ae8e2ec7daa7"
>   SRC_URI[sha256sum] = "96d0d1e3f9b74d2ca3469ff187c5e5f25649b1ad35cf06f4f3a83847dff4ac13"
>


