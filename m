Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rb9xo-0004R6-9D for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 12:59:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBFBq6gY003147
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 11:52:07 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02440-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 11:52:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBFBpwJU003141
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 11:51:59 GMT
Message-ID: <1323949918.4568.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Dec 2011 11:51:58 +0000
In-Reply-To: <006b4308dc652187daa0a84726b969a67eb6d6f0.1323864630.git.xiaofeng.yan@windriver.com>
References: <cover.1323864630.git.xiaofeng.yan@windriver.com>
	<006b4308dc652187daa0a84726b969a67eb6d6f0.1323864630.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] gtk-directfb: add bbclass gtk-directfb
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
X-List-Received-Date: Thu, 15 Dec 2011 11:59:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-14 at 20:18 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> This file remind user to add "gtk-directfb" to DISTRO_FEATURES and remove "x11" \
> when building core-image-gtk-directfb.
> 
> [YOCTO #1674]
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  meta/classes/gtk-directfb.bbclass |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
>  create mode 100644 meta/classes/gtk-directfb.bbclass
> 
> diff --git a/meta/classes/gtk-directfb.bbclass b/meta/classes/gtk-directfb.bbclass
> new file mode 100644
> index 0000000..b65b787
> --- /dev/null
> +++ b/meta/classes/gtk-directfb.bbclass
> @@ -0,0 +1,12 @@
> +# gtk can only run a backend at a time (directfb or x11) for gtk-2.x. 
> +# So if you want to get an image of gtk running directfb. 
> +# Please remove x11 from DISTRO_FEATURES
> +python () {
> +	import sys
> +	import logging
> +	logger = logging.getLogger('BitBake.Event')
> +	packages = d.getVar('DISTRO_FEATURES', 1).split()
> +	for pkg in packages:
> +		if pkg == "x11":
> +			bb.fatal("FEATURE \"x11\" is in DISTRO_FEATURES, Please remove x11 from DISTRO_FEATURES, use \"gtk-directfb\" instead of it\n")
> +}

Some improvements I'd like to suggest please:

* Put this in the image .bb file, we don't need a generic class for 
  this in the core, at least at this point
* Don't import things you don't need (logging, sys)
* Use something like 'if "x11" in packages' instead for that for loop
* Use SkipPackage instead of bb.fatal like I suggested (grep will show 
  some examples)
* Use True instead of 1
* Rename the variables to be meaningful (packages is confusing here)

Cheers,

Richard




