Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren.hart@intel.com>) id 1Sa6q4-0000mS-3A
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 16:59:00 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 May 2012 07:47:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173229496"
Received: from unknown (HELO envy.home) ([10.255.12.102])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2012 07:47:34 -0700
Message-ID: <4FC7844B.3030608@intel.com>
Date: Thu, 31 May 2012 07:46:35 -0700
From: Darren Hart <darren.hart@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1338470972.20169.234.camel@ted>
In-Reply-To: <1338470972.20169.234.camel@ted>
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmd1.bbclass: Ensure ncurses is built and used for menuconfig tasks
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
X-List-Received-Date: Thu, 31 May 2012 14:59:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/31/2012 06:29 AM, Richard Purdie wrote:
> Currently, the task just exits if something goes wrong. This adds the
> ncurses-native dependency. It also adds a small delay before closing the
> window so any messages displayed there can be seen.
> 
> Trying to get the kernel build system to correctly find and link with
> our copy of ncurses is some kind of nightmare. I ended up having to add
> it to HOST_LOADLIBES globally for this task which is rather nasty but I
> couldn't find any other way.
> 
> [YOCTO #2513]
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> index d429188..bd25311 100644
> --- a/meta/classes/cml1.bbclass
> +++ b/meta/classes/cml1.bbclass
> @@ -9,9 +9,15 @@ addtask configure after do_unpack do_patch before do_compile
>  
>  inherit terminal
>  
> +OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS HOST_LOADLIBES"
> +HOST_EXTRACFLAGS = "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
> +HOSTLDFLAGS = "${BUILD_LDFLAGS}"
> +HOST_LOADLIBES = "-lncurses"
> +
>  python do_menuconfig() {
> -        oe_terminal("make menuconfig", '${PN} Configuration', d)
> +        oe_terminal("${SHELL} -c \"make menuconfig; echo 'Pausing for 5 seconds'; sleep 5\"", '${PN} Configuration', d)

Perhaps only sleeping if menuconfig returns non-zero? This would avoid
the unnecessary lag after a successful menuconfig session.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


