Return-Path: <hans.beckerus@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id DC75961011
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2013 20:46:28 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id w7so3529665lbi.22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2013 13:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=1PFtgsjFgusuWObFiOolXHV4gT8NH81gnUpIW3hFzMI=;
	b=lTW753xc17eIti0vARRRKEH9rIcUjJGn81Up+/cmDPBwnbAz3LUCmns6qJjpGLNhTT
	8P+WjD3/YxqpL50ekQRjB4QBg6MHjm4hUpTD7qixGqXDP+asZo6V2Ss22EAMRaEMw2UZ
	lb0fbuQzZAVnFcLNhOSwMAl5dtSd99R6rn2twp1+szP9bGh6YoquBFAonV33ET17fWsH
	78OvLz621ZUzLmDE8Hic/RWZ7+nxSGA+2HnpULp8t4ng0DPmDSXRc6II1geFbcW/N7q+
	5nENiwGDPzbQI8WDchv1ZeRdOO/lefiACLtBb+Bq/ipOsVBMVvASzhb6RFkBn78wkZCy
	PXgg==
X-Received: by 10.112.210.136 with SMTP id mu8mr2953667lbc.25.1379277989747;
	Sun, 15 Sep 2013 13:46:29 -0700 (PDT)
Received: from [192.168.0.10] (h135n8-rny-a12.ias.bredband.telia.com.
	[217.209.54.135])
	by mx.google.com with ESMTPSA id vo1sm11355209lbb.1.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 15 Sep 2013 13:46:29 -0700 (PDT)
Message-ID: <52361CA2.9000600@gmail.com>
Date: Sun, 15 Sep 2013 22:46:26 +0200
From: Hans Beckerus <hans.beckerus@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <523425F2.9070109@gmail.com>
In-Reply-To: <523425F2.9070109@gmail.com>
Subject: Re: [PATCH v6] libtool: fix resolve of lt_sysroot
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
X-List-Received-Date: Sun, 15 Sep 2013 20:46:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

My world build passed without errors (besides a lot of missing or unbuildable dependency chains and one or two that failed to download completely). I believe this is about all the testing I can do from my end, especially considering my limited computer power.

Thanks.
Hans


On 2013-09-14 11:01, Hans Beckerus wrote:
> This patch updates libtool.m4 (and its output) to resolve a problem 
> with variable 'lt_sysroot' not being properly updated if the option
> '--with[-libtool]-sysroot' is not provided when running the 'configure'
> script for a package.
>
> According to the help text ouput from 'configure':
> --with-libtool-sysroot=DIR Search for dependent libraries within DIR
>                         (or the compiler's sysrooot if not specified).
>
> Due to mixed up cases in a switch statement, when checking if the option
> was specified or not, wrong actions were taken resulting in an incorrect
> sysroot and failures to properly locate e.g. .la files when using the 
> populated SDK toolchain.
>
> For current upstream status see:
> http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
>
> Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
> ---
> Changes since v5:
> * Fixes a precedence issue in the switch case
> ---
>  meta/recipes-devtools/libtool/libtool-2.4.2.inc    |    1 +
>  .../libtool/libtool/fix-resolve-lt-sysroot.patch   |   41 ++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>
> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> index bb4ddf0..92e4949 100644
> --- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> +++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> @@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
>  	   file://respect-fstack-protector.patch \
>             file://norm-rpath.patch \
>             file://dont-depend-on-help2man.patch \
> +           file://fix-resolve-lt-sysroot.patch \
>            "
>  
>  SRC_URI[md5sum] = "d2f3b7d4627e69e13514a40e72a24d50"
> diff --git a/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
> new file mode 100644
> index 0000000..44e9fe1
> --- /dev/null
> +++ b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
> @@ -0,0 +1,41 @@
> +Upstream-Status: Pending
> +
> +This patch updates libtool.m4 (and its output) to resolve a problem
> +with variable 'lt_sysroot' not being properly updated if the option
> +'--with[-libtool]-sysroot' is not provided when running the 'configure'
> +script for a package.
> +
> +I have also reported the problem to libtool here
> +
> +http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
> +
> +Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
> +---
> +diff -ur libtool-2.4.2.orig/libltdl/m4/libtool.m4 libtool-2.4.2/libltdl/m4/libtool.m4
> +--- libtool-2.4.2.orig/libltdl/m4/libtool.m4	2013-09-13 22:37:43.647282945 +0200
> ++++ libtool-2.4.2/libltdl/m4/libtool.m4	2013-09-14 10:27:37.168178605 +0200
> +@@ -1234,16 +1234,21 @@
> + dnl in case the user passed a directory name.
> + lt_sysroot=
> + case ${with_libtool_sysroot} in #(
> +- yes)
> ++ no)
> +    if test "$GCC" = yes; then
> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
> ++     # Treat "/" the same a an unset sysroot. It seems to be more
> ++     # compatible across host platforms that way!?
> ++     if test "$lt_sysroot" = /; then
> ++       lt_sysroot=
> ++     fi
> +    fi
> +    ;; #(
> ++ yes|''|/)
> ++   ;; #(
> +  /*)
> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
> +    ;; #(
> +- no|'')
> +-   ;; #(
> +  *)
> +    AC_MSG_RESULT([${with_libtool_sysroot}])
> +    AC_MSG_ERROR([The sysroot must be an absolute path.])


