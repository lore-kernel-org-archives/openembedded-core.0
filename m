Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B4EEB6D759
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 21:24:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 27 Feb 2014 13:24:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,557,1389772800"; d="scan'208";a="483147919"
Received: from unknown (HELO [10.255.14.50]) ([10.255.14.50])
	by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2014 13:24:43 -0800
Message-ID: <530FAD1A.1060509@linux.intel.com>
Date: Thu, 27 Feb 2014 23:24:42 +0200
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <1393532438-20847-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1393532438-20847-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH] pango: Fix postinst
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
X-List-Received-Date: Thu, 27 Feb 2014 21:24:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/27/2014 10:20 PM, Martin Jansa wrote:
> * do_split_packages was appending call to
>    ${bindir}/${MLPREFIX}pango-querymodules
>    without $D prefix or test if $D is empty, so it was always
>    failing on buildhostis without pango-querymodules and such
>    failure is fatal when rootfs is read-only (do_rootfs fails
>    because some packages weren't configured)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-graphics/pango/pango.inc | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
> index 17006d3..5fddff9 100644
> --- a/meta/recipes-graphics/pango/pango.inc
> +++ b/meta/recipes-graphics/pango/pango.inc
> @@ -42,21 +42,25 @@ EXTRA_OECONF = "--disable-introspection \
>   LEAD_SONAME = "libpango-1.0*"
>   LIBV = "1.8.0"
>
> -postinst_prologue() {
> +pango_postinst() {
>   if ! [ -e $D${sysconfdir}/pango ] ; then
>   	mkdir -p $D${sysconfdir}/pango
>   fi
>
> -if [ "x$D" != "x" ]; then
> +if [ -n "$D" ]; then
>   	${@qemu_run_binary(d, '$D','${bindir}/${MLPREFIX}pango-querymodules')} \
>   		$D${libdir}/pango/${LIBV}/modules/*.so \
>   		> $D${sysconfdir}/pango/${MLPREFIX}pango.modules 2>/dev/null
>
> -	[ $? -ne 0 ] && exit 1
> +	if [ $? -ne 0 ] ; then
> +		echo "qemu_run_binary call ${bindir}/${MLPREFIX}pango-querymodules $D${libdir}/pango/${LIBV}/modules/*.so > $D${sysconfdir}/pango/${MLPREFIX}pango.modules failed"
> +		exit 1
>
Are you missing a 'fi' here?

I got an error during parsing:
> ERROR: ExpansionError during parsing /home/sgw/yocto/poky/meta/recipes-graphics/pango/pango_1.36.2.bb: Failure expanding variable pango_postinst: ShellSyntaxError: None
> followed by:
>


Sau!

>   	sed -i -e "s:$D::" $D${sysconfdir}/pango/${MLPREFIX}pango.modules
>
>   	exit 0
> +else
> +	${bindir}/${MLPREFIX}pango-querymodules > /etc/pango/${MLPREFIX}pango.modules
>   fi
>   }
>
> @@ -68,11 +72,11 @@ do_install_append () {
>
>
>   python populate_packages_prepend () {
> -    prologue = d.getVar("postinst_prologue", True)
> +    pango_postinst = d.getVar("pango_postinst", True)
>
>       modules_root = d.expand('${libdir}/pango/${LIBV}/modules')
>
> -    do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module-%s', 'Pango module %s', prologue + '${bindir}/${MLPREFIX}pango-querymodules > /etc/pango/${MLPREFIX}pango.modules')
> +    do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module-%s', 'Pango module %s', pango_postinst)
>   }
>
>   FILES_${PN} = "${sysconfdir}/pango/* ${bindir}/* ${libdir}/libpango*${SOLIBS}"
>

