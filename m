Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CE3AA6D12F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 21:14:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 24 Oct 2013 14:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,565,1378882800"; d="scan'208";a="416731176"
Received: from unknown (HELO [10.255.12.57]) ([10.255.12.57])
	by fmsmga001.fm.intel.com with ESMTP; 24 Oct 2013 14:13:40 -0700
Message-ID: <52698D79.7010002@linux.intel.com>
Date: Thu, 24 Oct 2013 14:13:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: qiang.chen@windriver.com, openembedded-core@lists.openembedded.org
References: <1382411940-1430-1-git-send-email-qiang.chen@windriver.com>
In-Reply-To: <1382411940-1430-1-git-send-email-qiang.chen@windriver.com>
Subject: Re: [PATCH] nfsserver restart should kill and recreate nfsd kernel threads
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Oct 2013 21:14:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



The short summary should include the recipe name.

Sau!

On 10/21/2013 08:19 PM, qiang.chen@windriver.com wrote:
> From: Qiang Chen <qiang.chen@windriver.com>
>
> nfsserver restart without killing kernel threads worked when portmap
> was the rpc publishing process and portmap was restarted.
> When rpcbind replaces portmap, nfsserver restart in this way does not
> work after an rpcbind restart.
>
> Steps to reproduce:
> 1). Make ext3 filesystem image on local host.
> cd /root
> dd if=/dev/zero of=test bs=1024K count=50
> mkfs.ext3 -F test
>
> 2). runqemu qemux86-64
> mkdir /mnt/wrtest
> mount -t ext3 -o loop test /mnt/wrtest
> echo "/mnt/wrtest *(sync,rw,no_subtree_check,no_root_squash)" > /etc/exports
> /etc/init.d/rpcbind restart
> /etc/init.d/nfsserver restart
> showmount -e localhost
> mkdir wrtest
> mount -t nfs localhost:/mnt/wrtest wrtest
>
> mount: mounting localhost:/mnt/wrtest on wrtest failed: Connection refused
>
> Modifying the nfsserver script to kill and restart kernel threads on
> restart makes the problem go away and is consistent with current
> RHEL/SUSE and Ubuntu/Debian mechanisms of handling the nfs server.
>
> Signed-off-by: Rich Dubielzig <rich.dubielzig@windriver.com>
> Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
> ---
>   .../nfs-utils/nfs-utils/nfsserver                  |   11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> index 8ee8d0b..d7cf6e0 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> @@ -161,14 +161,9 @@ status)
>   	[ $RETVAL -eq 0 ] && exit $rval
>   	exit $RETVAL;;
>   reload)	test -r /etc/exports && exportfs -r;;
> -restart)exportfs -ua
> -	stop_mountd
> -	stop_statd
> -	# restart does not restart the kernel threads,
> -	# only the user mode processes
> -	start_mountd
> -	start_statd
> -	test -r /etc/exports && exportfs -a;;
> +restart)
> +	$0 stop
> +	$0 start;;
>   *)	echo "Usage: $0 {start|stop|status|reload|restart}"
>   	exit 1;;
>   esac
>

