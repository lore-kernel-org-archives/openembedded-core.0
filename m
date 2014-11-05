Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB8165D3C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 14:38:44 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id EFEC2F811DD; Wed,  5 Nov 2014 07:38:44 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 998B8F811E3;
	Wed,  5 Nov 2014 07:38:40 -0700 (MST)
Message-ID: <545A3674.7060902@mlbassoc.com>
Date: Wed, 05 Nov 2014 07:38:44 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1415197718-25590-1-git-send-email-gary@mlbassoc.com>
In-Reply-To: <1415197718-25590-1-git-send-email-gary@mlbassoc.com>
Subject: Re: [PATCH v3] python-pygtk: Restore pkg-config support
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
X-List-Received-Date: Wed, 05 Nov 2014 14:38:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-11-05 07:28, Gary Thomas wrote:
> This patch removes an old "fix" which is no longer required.
> A side effect is that the pkg-config control file (pygtk-2.0.pc)
> will be installed.  This makes it possible to use this library
> with other tools.  Note: the pygtk-2.0.pc also had a missing 'libdir'
>
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>

Sorry, I missed that part of this had already been merged.  I'll send a
new one with the remaining changes (killing of the rest of "fix #1")

> ---
>   .../python/python-pygtk/fix-pygtk-2.0.pc.patch              | 13 +++++++++++++
>   meta/recipes-devtools/python/python-pygtk_2.24.0.bb         |  9 +--------
>   2 files changed, 14 insertions(+), 8 deletions(-)
>   create mode 100644 meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch
>
> diff --git a/meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch b/meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch
> new file mode 100644
> index 0000000..b615654
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch
> @@ -0,0 +1,13 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +Index: pygtk-2.24.0/pygtk-2.0.pc.in
> +===================================================================
> +--- pygtk-2.24.0.orig/pygtk-2.0.pc.in
> ++++ pygtk-2.24.0/pygtk-2.0.pc.in
> +@@ -1,5 +1,6 @@
> + prefix=@prefix@
> + exec_prefix=@exec_prefix@
> ++libdir=@libdir@
> + includedir=@includedir@
> + datarootdir=@datarootdir@
> + datadir=@datadir@
> diff --git a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
> index 8fc194f..631acb7 100644
> --- a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
> +++ b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
> @@ -15,6 +15,7 @@ SRC_URI = "ftp://ftp.gnome.org/pub/gnome/sources/pygtk/2.24/${SRCNAME}-${PV}.tar
>              file://fix-gtkunixprint.patch \
>              file://prevent_to_get_display_during_import.patch \
>              file://nodocs.patch \
> +	   file://fix-pygtk-2.0.pc.patch \
>              file://acinclude.m4 \
>              file://update-dependences-of-defs.c.patch"
>
> @@ -39,14 +40,6 @@ do_configure_prepend() {
>   	sed -i 's:tests docs:tests:' ${S}/Makefile.am
>   }
>
> -# dirty fix #1: remove dependency on python-pygobject-dev
> -do_install_append() {
> -	find ${D} -name "*.la"|xargs rm -f
> -	rm -f ${D}/${bindir}/pygtk-codegen-2.0
> -	rm -rf ${D}/${libdir}/pkgconfig
> -	sed -i -e '1s|^#!.*python|#!/usr/bin/env python|' ${D}${bindir}/pygtk-demo
> -}
> -
>   # dirty fix #2: fix build system paths leaking in
>   require fix-path.inc
>
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

