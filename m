Received: from vms173021pub.verizon.net ([206.46.173.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SDgR3-0000ko-SI
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 20:20:30 +0200
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1P002Z1MI4JC61@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 13:10:52 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4B12C2018B; Fri,
	30 Mar 2012 14:10:51 -0400 (EDT)
Date: Fri, 30 Mar 2012 14:10:51 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120330181051.GB5488@denix.org>
References: <1333101001-13652-1-git-send-email-Martin.Jansa@gmail.com>
	<1333104939-25404-1-git-send-email-Martin.Jansa@gmail.com>
MIME-version: 1.0
In-reply-to: <1333104939-25404-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCHv2] rootfs_ipk: don't echo opkg-cl output to log.do_rootfs
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
X-List-Received-Date: Fri, 30 Mar 2012 18:20:30 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Mar 30, 2012 at 12:55:39PM +0200, Martin Jansa wrote:
> * log_check can find some files with ERR or Fail substring e.g. in "Source: " field
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

This one looks better and it does not change the regex string, like the patch 
sent to bitbake-devel...

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  meta/classes/rootfs_ipk.bbclass |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
> index 13bd4bf..cbc63f0 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -127,10 +127,12 @@ list_installed_packages() {
>  }
>  
>  get_package_filename() {
> +	set +x
>  	info=`opkg-cl ${IPKG_ARGS} info $1 | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" || true`
>  	name=`echo "${info}" | awk '/^Package/ {printf $2"_"}'`
>  	name=$name`echo "${info}" | awk -F: '/^Version/ {printf $NF"_"}' | sed 's/^\s*//g'`
>  	name=$name`echo "${info}" | awk '/^Archi/ {print $2".ipk"}'`
> +	set -x
>  
>  	fullname=`find ${DEPLOY_DIR_IPK} -name "$name" || true`
>  	if [ "$fullname" = "" ] ; then
> -- 
> 1.7.8.5
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


