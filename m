Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SB3Mn-0000Wu-G3 for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 13:13:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NC4GCb026323
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 12:04:16 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25941-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 12:04:12 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NC45WV026302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 12:04:06 GMT
Message-ID: <1332504248.9740.393.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 23 Mar 2012 12:04:08 +0000
In-Reply-To: <cover.1332453478.git.scott.a.garman@intel.com>
References: <cover.1332453478.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] Two useradd fixes
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
X-List-Received-Date: Fri, 23 Mar 2012 12:13:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-22 at 21:43 -0700, Scott Garman wrote:
> Hello,
> 
> This pull request fixes two race conditions related to the useradd code.
> 
> Yocto bug #2127 describes how when using the RPM package manager, the
> order of package installation during generatin of the rootfs did not
> guarantee that base-passwd and shadow would be installed before other
> packages which need to install custom users/groups in their postinstall
> functions. This fix ensures that when base-passwd and/or shadow are
> part of an image, they will be installed first during image generation.
> 
> The second race condition is described in Yocto bug #1794, and can occur
> if two build steps try to update the sysroot passwd/group files at the
> same time. Since the shadow utilities enforce file locking, the commands
> will fail to run. The fix for this involves checking for failure and
> retrying the commands up to 10 times, with a 1s delay between attempts
> before giving up.
> 
> Verifying these fixes involved creating numerous images and useradd-based
> packages repeatedly on a build host with high parallelism, and also doing
> so from a pre-populated sstate-cache. I was able to reliably simulate the
> file locking behavior by making the passwd/group files read only when
> developing the fix for #1794. 
> 
> Scott
> 
> The following changes since commit 87e581bb7da9f1530d190cd023fcf892c8b858f5:
> 
>   ddimage: Add script for writing images to boot media (2012-03-22 19:17:54 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib sgarman/useradd-lock-fix-oe
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/useradd-lock-fix-oe
> 
> Scott Garman (2):
>   package_rpm.bbclass: ensure base-passwd and shadow get installed
>     first
>   useradd.bbclass: retry useradd/groupadd commands to avoid lock race
>     issues

Merged to master, thanks!

Richard



