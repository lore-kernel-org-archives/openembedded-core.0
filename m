Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RmeP6-0008BE-3a
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 05:42:44 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jan 2012 20:34:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="107442435"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by fmsmga001.fm.intel.com with ESMTP; 15 Jan 2012 20:34:55 -0800
Message-ID: <4F13A8EF.5060001@linux.intel.com>
Date: Sun, 15 Jan 2012 20:34:55 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326437644.git.xiaofeng.yan@windriver.com>
	<b2085de269fd8fc3bc551d922e68e24e42e2154a.1326437644.git.xiaofeng.yan@windriver.com>
In-Reply-To: <b2085de269fd8fc3bc551d922e68e24e42e2154a.1326437644.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 3/3] pango.inc: add directory "/etc/pango"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jan 2012 04:42:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2012 11:06 PM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> Command "pango-querymodules>  /etc/pango/pango.modules" can't work when \
> starting up yocto because of no directory "/etc/pango". It will cause \
> messy code when gtk-demo running.
>
> [YOCTO #1674]
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   meta/recipes-graphics/pango/pango.inc |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
> index b428b9d..06db327 100644
> --- a/meta/recipes-graphics/pango/pango.inc
> +++ b/meta/recipes-graphics/pango/pango.inc
> @@ -46,6 +46,11 @@ fi
>
>   }
>
> +# Command "pango-querymodules>  /etc/pango/pango.modules" needs this directory.
> +do_install_prepend() {
> +	install -d ${D}/${sysconfdir}/pango
> +}
> +
>   python populate_packages_prepend () {
>   	prologue = d.getVar("postinst_prologue", 1)
>
> @@ -54,6 +59,6 @@ python populate_packages_prepend () {
>   	do_split_packages(d, modules_root, '^pango-(.*)\.so$', 'pango-module-%s', 'Pango module %s', prologue + 'pango-querymodules>  /etc/pango/pango.modules')
>   }
>
> -FILES_${PN} = "/etc/pango/* ${bindir}/* ${libdir}/libpango*${SOLIBS}"
> +FILES_${PN} += "${bindir}/* ${libdir}/libpango*${SOLIBS}"
This can actually be removed completed since the default for FILES_${PN}
includes bindir/* and libdir/lib*${SOLIBS}

I fixed this up in my testing area.

Sau!

>   FILES_${PN}-dbg += "${libdir}/pango/${LIBV}/modules/.debug"
>   FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"


