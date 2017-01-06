Return-Path: <jonathan.yong@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 45F0C6FFD3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 08:05:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 06 Jan 2017 00:05:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,323,1477983600"; d="scan'208";a="805756142"
Received: from jyong2-mobl5.gar.corp.intel.com (HELO [172.30.66.17])
	([172.30.66.17])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Jan 2017 00:05:42 -0800
Message-ID: <586F4FD5.4030809@intel.com>
Date: Fri, 06 Jan 2017 16:05:41 +0800
From: "Yong, Jonathan" <jonathan.yong@intel.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64;
	rv:25.4) Gecko/20150524 FossaMail/25.1.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20161227064735.6552-1-jonathan.yong@intel.com>
In-Reply-To: <20161227064735.6552-1-jonathan.yong@intel.com>
Cc: kim.tatt.chuah@intel.com
Subject: Re: sysvinit-inittab: Make sure new shell from start_getty gets a controlling tty
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
X-List-Received-Date: Fri, 06 Jan 2017 08:05:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/27/2016 14:47, Yong, Jonathan wrote:
> Without exec, the processes from the new shell do not get a ctty:
> 
> 	root@intel-corei7-64:~# ps -x | grep getty
> 	  755 tty1     Ss+    0:00 /sbin/getty 38400 tty1
> 	  791 ?        Ss     0:00 /bin/sh /bin/start_getty 115200 ttyS0
> 	  804 ?        S      0:00 grep getty
> 
> In particular, the openssh client fails:
> 
> 	root@intel-corei7-64:~# ssh -v <target>
> 	<truncated>
> 	debug1: read_passphrase: can't open /dev/tty: No such device or address
> 	Host key verification failed.
> 
> This patch fixes those errors.
> 
> Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
> ---
>  meta/recipes-core/sysvinit/sysvinit-inittab/start_getty | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> index e3d052a..ab238f6 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> @@ -1,5 +1,5 @@
>  #!/bin/sh
>  if [ -c /dev/$2 ]
>  then 
> -	/sbin/getty -L $1 $2 $3
> +	exec /sbin/getty -L $1 $2 $3
>  fi
> 

Ping?


