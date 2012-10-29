Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TSriM-00010w-Lz for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 16:57:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TFhkpu005711;
	Mon, 29 Oct 2012 15:43:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04459-10; Mon, 29 Oct 2012 15:43:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TFhaiH005705
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 29 Oct 2012 15:43:37 GMT
Message-ID: <1351525416.2828.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Mon, 29 Oct 2012 15:43:36 +0000
In-Reply-To: <1351517628.13864.4.camel@phil-desktop>
References: <1351517628.13864.4.camel@phil-desktop>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: What is TOOLCHAIN_NEED_CONFIGSITE_CACHE for?
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
X-List-Received-Date: Mon, 29 Oct 2012 15:57:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-29 at 13:33 +0000, Phil Blundell wrote:
> This morning I happened to notice that some/all of my images had a
> dependency on ncurses for no obviously good reason.  (Following an
> earlier small crusade these are now the only remaining dependencies on
> ncurses in my build, so I would quite like to get rid of them.)
> 
> It turns out that the dependency in question is due to the code in
> toolchain-scripts.bbclass (which is inherited from
> populate_sdk_base.bbclass, from image.bbclass) which does:
> 
> TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TCLIBC} ncurses"
> 
> [...]
> 
> python __anonymous () {
>     deps = ""
>     for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or "").split():
>         deps += " %s:do_populate_sysroot" % dep
>     d.appendVarFlag('do_configure', 'depends', deps)
> }
> 
> The code in question was added in:
> 
> commit 9e87f1347788beed181476dc4563085db14a4729
> Author: Lianhao Lu <lianhao.lu@intel.com>
> Date:   Tue Aug 16 11:15:36 2011 +0800
> 
>     toolchain-script.bbclass: Collected cached site config in runtime.
>     
>     [YOCTO #892]
>     Modify the function toolchain_create_sdk_siteconfig to collect the
>     cached site config files which are specified by
>     TOOLCHAIN_NEED_CONFIGSITE_CACHE in runtime.
>     
>     Also added task dependency to ensure the cached site config files are
>     generated.
>     
>     Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> 
> ... but I don't entirely understand from that commentary what exactly is
> special about ncurses that means it needs to be handled this way.  Can
> anybody clarify?

We ship the "site" cache files with the toolchain. We decided to include
the generated cache files as well as the static ones. We currently
generate "site" files for libc and ncurses.

You can almost certainly just set:

TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TCLIBC}"

and be happy since this just lists which generated cache site files to
include.

Cheers,

Richard







