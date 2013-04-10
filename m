Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1UQ5F7-0000ot-Mc
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 02:20:03 +0200
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0ML200M1EAN91F63@vms173003.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 18:02:07 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 131FA200DB; Wed,
	10 Apr 2013 19:01:57 -0400 (EDT)
Date: Wed, 10 Apr 2013 19:01:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-id: <20130410230157.GB28466@denix.org>
References: <1363628359-18023-1-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1363628359-18023-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][for-danny] kernel bbclass: return to original directory in do_deploy
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
X-List-Received-Date: Thu, 11 Apr 2013 00:20:12 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Ping.

Ross, is it in your queue for your next danny merge?

-- 
Denys


On Mon, Mar 18, 2013 at 12:39:19PM -0500, Chase Maupin wrote:
> * During the base kernel_do_deploy function the directory is
>   changed to DEPLOYDIR in order to do some cleanup and symlinking.
>   However, the directory is not changed back to the original
>   starting directory ${S} at the end.  For append functions this
>   means that the starting directory is not ${S} as expected but
>   instead ${DEPLOYDIR}.
> 
>   For functions like the do_deploy_append in
>   recipes-kernel/linux/linux-dtb.inc there is an assumption that
>   you are still in the source directory and not the DEPLOYDIR.
>   Without this change the .dtb files are not copied because the
>   check for the existence of ${DTS_FILE} which is a relative
>   path from the ${S} directory fails.  This means that the .dtb
>   files are not copied into the deploy directory and subsequently
>   the deploy/images directory.
> 
>   In the log.do_deploy file you will see lines like:
> 
>     Warning: arch/arm/boot/dts/xxxxx.dts is not available!
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  meta/classes/kernel.bbclass |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 88ce561..9691c25 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -529,6 +529,7 @@ kernel_do_deploy() {
>  	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
>  
>  	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
> +	cd -
>  }
>  do_deploy[dirs] = "${DEPLOYDIR} ${B}"
>  
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


