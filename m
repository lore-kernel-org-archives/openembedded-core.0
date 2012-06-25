Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjBuU-0007Au-Qi
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 18:13:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 Jun 2012 09:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="160438504"
Received: from unknown (HELO [10.255.12.180]) ([10.255.12.180])
	by azsmga001.ch.intel.com with ESMTP; 25 Jun 2012 09:02:14 -0700
Message-ID: <4FE88B86.100@linux.intel.com>
Date: Mon, 25 Jun 2012 09:02:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <88fd8e08d1933a78856c17245210d2ef7e4ae926.1339796664.git.dvhart@linux.intel.com>
In-Reply-To: <88fd8e08d1933a78856c17245210d2ef7e4ae926.1339796664.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH] cml1.bbclass: Only delay exit if the command fails
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
X-List-Received-Date: Mon, 25 Jun 2012 16:13:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2012 02:44 PM, Darren Hart wrote:
> Rather than pause for 5 seconds, test the return code of the command and
> require user input before exiting on failure. This avoids pausing after
> successful command execution as well as possibly not waiting long enough
> if the user happens to be doing something else for 5 seconds.
>
> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
> ---
>   meta/classes/cml1.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> index bd25311..52d520a 100644
> --- a/meta/classes/cml1.bbclass
> +++ b/meta/classes/cml1.bbclass
> @@ -15,7 +15,7 @@ HOSTLDFLAGS = "${BUILD_LDFLAGS}"
>   HOST_LOADLIBES = "-lncurses"
>
>   python do_menuconfig() {
> -        oe_terminal("${SHELL} -c \"make menuconfig; echo 'Pausing for 5 seconds'; sleep 5\"", '${PN} Configuration', d)
> +        oe_terminal("${SHELL} -c \"make menuconfig; if [ $? -ne 0 ]; then echo 'Command failed.'; echo -n 'Press any key to continue... '; read r; fi\"", '${PN} Configuration', d)
>   }
>   do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
>   do_menuconfig[nostamp] = "1"

Merged into OE-Core

Thanks
	Sau!


