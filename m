Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TFyMD-0004Lm-Iu
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 04:25:13 +0200
Received: by eeit10 with SMTP id t10so954710eei.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Sep 2012 19:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gkQwJVZxSxbeYyexERoyf51wR/L72Iha3xkloly8bII=;
	b=uOS6NiLISFszMIUUnCJulCIxufX0ZiDujJIN/R3XlNJc3COQiiSvs1KONt5IIHGUHt
	yhSG+eV6UhvZa1AdSoq5HYPawZYCEJ3g6xAlXkEdFNn7V3L6ZtMXoO0ZY+Mo7/I0gfD/
	KXPaHhP9xqa8lzePqDeu/Fzh1TjKYEGq2QcqVXN5xaYDD9PQ1Q+O0vcphEO0nw5tjhHv
	j7Cl6olcUT84rrB+p1Y4ke33eWPnQyNeG8KSIs9Tb3Id8wfe02keJsLDMyH5nVGHMm4U
	sMfBe6uMdhIqHXLUcGmk282l7MYapD5jWuLWa3UbyFGb6urwQg5Vo7y+0s2yhrD6trqH
	R3XA==
Received: by 10.14.218.134 with SMTP id k6mr13089553eep.14.1348452746060; Sun,
	23 Sep 2012 19:12:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Sun, 23 Sep 2012 19:11:55 -0700 (PDT)
In-Reply-To: <1348435031.4444.241.camel@x121e.pbcl.net>
References: <1348435031.4444.241.camel@x121e.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Sep 2012 19:11:55 -0700
Message-ID: <CAMKF1sp3_DKmhCw3jrxuKFNf_a6iP_+6EyytXDg1d-zc+Ei22A@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] eglibc: Move perl- and bash-using scripts to separate recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 02:25:13 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Sep 23, 2012 at 2:17 PM, Phil Blundell <philb@gnu.org> wrote:
> This removes the dependency of eglibc.bb itself on perl and bash
> which, in turn, eliminates the need to build those two recipes if the
> scripts which need them are not going to be installed.
>

I think this is a good patch.

> Signed-off-by: Phil Blundell <pb@pbcl.net>

...


> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-scripts.inc
> @@ -0,0 +1,17 @@
> +include eglibc-collateral.inc
> +
> +SUMMARY = "utility scripts provided by eglibc"
> +DESCRIPTION = "utility scripts provided by eglibc"
> +RDEPENDS_${PN} = "bash"
> +RDEPENDS_ldd = "bash"

we do not ask for bash see
sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in in eglibc.inc


> +
> +SRC = "${STAGING_INCDIR}/eglibc-scripts-internal-${MULTIMACH_TARGET_SYS}"
> +
> +bashscripts = "mtrace sotruss xtrace"
> +
> +do_install() {
> +       install -d -m 0755 ${D}${bindir}
> +       for i in ${bashscripts}; do
> +               install -m 0755 ${SRC}/$i ${D}${bindir}/
> +       done
> +}
> diff --git a/meta/recipes-core/eglibc/eglibc-scripts_2.16.bb b/meta/recipes-core/eglibc/eglibc-scripts_2.16.bb
> new file mode 100644
> index 0000000..3113362
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-scripts_2.16.bb
> @@ -0,0 +1 @@
> +require eglibc-scripts.inc
> diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
> index 72d134a..3a7ae50 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.16.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
>  SRCREV = "20393"
>
>  DEPENDS += "gperf-native kconfig-frontends-native"
> -PR = "r10"
> +PR = "r11"
>  PR_append = "+svnr${SRCPV}"
>
>  EGLIBC_BRANCH="eglibc-2_16"
> --
> 1.7.9
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


