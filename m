Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TFOVx-00042x-Hx for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 14:08:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8MBu3nl005296;
	Sat, 22 Sep 2012 12:56:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01554-07; Sat, 22 Sep 2012 12:55:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8MBtrEv005289
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sat, 22 Sep 2012 12:55:54 +0100
Message-ID: <1348314953.10108.204.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Sat, 22 Sep 2012 12:55:53 +0100
In-Reply-To: <12e61841995abb0cd1a96b334edc982c80a7d47f.1348245594.git.paul.eggleton@linux.intel.com>
References: <cover.1348245594.git.paul.eggleton@linux.intel.com>
	<12e61841995abb0cd1a96b334edc982c80a7d47f.1348245594.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] classes/multilib: ensure MLPREFIX is set for image recipes
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
X-List-Received-Date: Sat, 22 Sep 2012 12:08:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-21 at 17:40 +0100, Paul Eggleton wrote:
> We need MLPREFIX to be set so that oe.utils.prune_suffix() (as used for
> the value of BPN) can derive the bare name from the multilib-extended
> name for image recipes. BPN being set correctly avoids missing file
> warnings during parse from the file checksum code for (unusual) images
> that set SRC_URI, such as build-appliance-image.
> 
> First half of the fix for [YOCTO #3146].
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/multilib.bbclass |   14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
> index b1a593e..25cf068 100644
> --- a/meta/classes/multilib.bbclass
> +++ b/meta/classes/multilib.bbclass
> @@ -11,13 +11,17 @@ python multilib_virtclass_handler () {
>      if bb.data.inherits_class('kernel', e.data) or bb.data.inherits_class('module-base', e.data):
>          raise bb.parse.SkipPackage("We shouldn't have multilib variants for the kernel")
>  
> -    if bb.data.inherits_class('image', e.data):
> -        e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
> -        return
> -
>      if bb.data.inherits_class('native', e.data):
>          raise bb.parse.SkipPackage("We can't extend native recipes")
>  
> +    # Set variables suitable for image recipes (as well as everything else)
> +    e.data.setVar("MLPREFIX", variant + "-")
> +    e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
> +
> +    if bb.data.inherits_class('image', e.data):
> +        # We've set all we need to set for images here
> +        return
> +
>      save_var_name=e.data.getVar("MULTILIB_SAVE_VARNAME", True) or ""
>      for name in save_var_name.split():
>          val=e.data.getVar(name, True)
> @@ -29,8 +33,6 @@ python multilib_virtclass_handler () {
>   
>      override = ":virtclass-multilib-" + variant
>  
> -    e.data.setVar("MLPREFIX", variant + "-")
> -    e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
>      e.data.setVar("SHLIBSDIR_virtclass-multilib-" + variant ,e.data.getVar("SHLIBSDIR", False) + "/" + variant)
>      if e.data.getVar("TARGET_VENDOR_virtclass-multilib-" + variant, False) is None:
>  	    e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + variant, e.data.getVar("TARGET_VENDOR", False) + "ml" + variant)


We can't do this due to MULTILIB_SAVE_VARNAME which may then get
influenced by the PN change. This is why the PN setting is duplicated,
we probably need to just duplicate the MLPREFIX line too. Ugly but such
is life :/

Cheers

Richard





