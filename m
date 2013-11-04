Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9A40C6B238
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 12:35:37 +0000 (UTC)
Message-ID: <52779491.2020505@communistcode.co.uk>
Date: Mon, 04 Nov 2013 12:35:29 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1383546699-23050-1-git-send-email-net147@gmail.com>
In-Reply-To: <1383546699-23050-1-git-send-email-net147@gmail.com>
Subject: Re: [PATCH] eglibc_2.17.bb: accept make versions 4.0 and greater
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Nov 2013 12:35:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/11/13 06:31, Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/recipes-core/eglibc/eglibc-2.17/make-4.patch | 31 +++++++++++++++++++++++
>  meta/recipes-core/eglibc/eglibc_2.17.bb           |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.17/make-4.patch
> 
> diff --git a/meta/recipes-core/eglibc/eglibc-2.17/make-4.patch b/meta/recipes-core/eglibc/eglibc-2.17/make-4.patch
> new file mode 100644
> index 0000000..8349c18
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.17/make-4.patch
> @@ -0,0 +1,31 @@
> +Accept make versions 4.0 and greater
> +
> +Backport of glibc 28d708c44bc47b56f6551ff285f78edcf61c208a.
> +
> +Upstream-Status: Backport
> +Signed-off-by: Jonathan Liu <net147@gmail.com>
> +
> +diff -Nur libc.orig/configure libc/configure
> +--- libc.orig/configure	2012-12-03 08:11:45.000000000 +1100
> ++++ libc/configure	2013-11-04 17:15:31.344984184 +1100
> +@@ -4995,7 +4995,7 @@
> +   ac_prog_version=`$MAKE --version 2>&1 | sed -n 's/^.*GNU Make[^0-9]*\([0-9][0-9.]*\).*$/\1/p'`
> +   case $ac_prog_version in
> +     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
> +-    3.79* | 3.[89]*)
> ++    3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*)
> +        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
> +     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
> + 
> +diff -Nur libc.orig/configure.in libc/configure.in
> +--- libc.orig/configure.in	2012-12-03 08:11:45.000000000 +1100
> ++++ libc/configure.in	2013-11-04 17:15:31.351650849 +1100
> +@@ -958,7 +958,7 @@
> +   critic_missing="$critic_missing gcc")
> + AC_CHECK_PROG_VER(MAKE, gnumake gmake make, --version,
> +   [GNU Make[^0-9]*\([0-9][0-9.]*\)],
> +-  [3.79* | 3.[89]*], critic_missing="$critic_missing make")
> ++  [3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*], critic_missing="$critic_missing make")
> + 
> + AC_CHECK_PROG_VER(MSGFMT, gnumsgfmt gmsgfmt msgfmt, --version,
> +   [GNU gettext.* \([0-9]*\.[0-9.]*\)],
> diff --git a/meta/recipes-core/eglibc/eglibc_2.17.bb b/meta/recipes-core/eglibc/eglibc_2.17.bb
> index 22129e6..c62ff36 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.17.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.17.bb
> @@ -28,6 +28,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr22
>             file://tzselect-awk.patch \
>             file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
>             file://fix-tibetian-locales.patch \
> +           file://make-4.patch \
>             ${BACKPORTS} \
>            "
>  BACKPORTS = "\
> 

Jonathan,

Does this actually build and work on your system? I have had issues with
make 4.0 and autotools 2.69 which lead to a failed configure/compile.

Cheers,

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 

