Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1Sa73V-0001NG-3K
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 17:12:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4VF2UX1024210
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 May 2012 08:02:30 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 31 May 2012 08:02:29 -0700
Message-ID: <4FC787FF.2030904@windriver.com>
Date: Thu, 31 May 2012 11:02:23 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1338470972.20169.234.camel@ted>
In-Reply-To: <1338470972.20169.234.camel@ted>
Cc: "Hart, Darren" <darren.hart@intel.com>,
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
X-List-Received-Date: Thu, 31 May 2012 15:12:53 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-05-31 09:29 AM, Richard Purdie wrote:
> Currently, the task just exits if something goes wrong. This adds the
> ncurses-native dependency. It also adds a small delay before closing the
> window so any messages displayed there can be seen.
>
> Trying to get the kernel build system to correctly find and link with
> our copy of ncurses is some kind of nightmare. I ended up having to add
> it to HOST_LOADLIBES globally for this task which is rather nasty but I
> couldn't find any other way.

Agreed, and my much more limited knowledge of the options can't come
up with something different either.

Is there an option to move those flags to the kernel class, so they'd
only be set when it is in play ? That would at least isolate the data
a bit more. Alternatively there's the less palatable kernel specific
do_menuconfig option (ech).

Otherwise, no concerns or big comments from me.

Bruce

>
> [YOCTO #2513]
>
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> index d429188..bd25311 100644
> --- a/meta/classes/cml1.bbclass
> +++ b/meta/classes/cml1.bbclass
> @@ -9,9 +9,15 @@ addtask configure after do_unpack do_patch before do_compile
>
>   inherit terminal
>
> +OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS HOST_LOADLIBES"
> +HOST_EXTRACFLAGS = "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
> +HOSTLDFLAGS = "${BUILD_LDFLAGS}"
> +HOST_LOADLIBES = "-lncurses"
> +
>   python do_menuconfig() {
> -        oe_terminal("make menuconfig", '${PN} Configuration', d)
> +        oe_terminal("${SHELL} -c \"make menuconfig; echo 'Pausing for 5 seconds'; sleep 5\"", '${PN} Configuration', d)
>   }
> +do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
>   do_menuconfig[nostamp] = "1"
>   addtask menuconfig after do_configure
>
>
>
>
>



