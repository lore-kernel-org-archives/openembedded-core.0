Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlRPC-00029r-31
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 21:37:50 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Jan 2012 12:30:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="97752720"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2012 12:30:17 -0800
Message-ID: <4F0F42D9.4040501@linux.intel.com>
Date: Thu, 12 Jan 2012 12:30:17 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326355020.git.xiaofeng.yan@windriver.com>
	<d3939f8f64b50aca9bf23e9c017160d32cd814f6.1326355020.git.xiaofeng.yan@windriver.com>
In-Reply-To: <d3939f8f64b50aca9bf23e9c017160d32cd814f6.1326355020.git.xiaofeng.yan@windriver.com>
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
X-List-Received-Date: Thu, 12 Jan 2012 20:37:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2012 12:12 AM, Xiaofeng Yan wrote:
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
> index b428b9d..e103fab 100644
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
> +FILES_${PN} += "${syscondir}/* ${bindir}/* ${libdir}/libpango*${SOLIBS}"
Is this too general?  Should it be ${sysconfdir}/pango?

Sau!

>   FILES_${PN}-dbg += "${libdir}/pango/${LIBV}/modules/.debug"
>   FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"


