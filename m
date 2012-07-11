Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sp5Mz-00086X-Fe
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 00:26:53 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Jul 2012 15:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="176210648"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2012 15:15:39 -0700
Message-ID: <4FFDFB0B.5030407@linux.intel.com>
Date: Wed, 11 Jul 2012 15:15:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <b4314c7a2f9fb120c2c4affd52567fe60a96bb5a.1341935782.git.nitin.a.kamble@intel.com>
	<988e8d84bfa34805c1749cfb77f64b9da2cd5e08.1341935782.git.nitin.a.kamble@intel.com>
In-Reply-To: <988e8d84bfa34805c1749cfb77f64b9da2cd5e08.1341935782.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 09/19] tar: fix build with automake 1.12.x
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
X-List-Received-Date: Wed, 11 Jul 2012 22:26:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2012 09:02 AM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> automake 1.12.x automatically deletes empty directories, so
> the additional rmdir from the do_install_append fails.
>
> cleanup the do_install_append for automake 1.12.x
>
> Avoid this error:
> | rmdir: failed to remove `/srv/home/nitin/builds/build-gcc47/tmp/work/i586-poky-linux/tar-1.26-r1/image/usr/sbin/': No such file or directory
> NOTE: package tar-1.26-r1: task do_install: Failed
>
> no PR bump as no change in the output.
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>   meta/recipes-extended/tar/tar.inc |    2 --
>   1 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/tar/tar.inc b/meta/recipes-extended/tar/tar.inc
> index 8c475df..203fb97 100644
> --- a/meta/recipes-extended/tar/tar.inc
> +++ b/meta/recipes-extended/tar/tar.inc
> @@ -18,8 +18,6 @@ do_install () {
>   do_install_extra () {
>       install -d ${D}${base_bindir}
>       mv ${D}${bindir}/tar ${D}${base_bindir}/tar
> -    rmdir ${D}${bindir}/
This needs to stay in actually since this directory is populated by 
default so automake will not remove it, this will cause a packaging 
regression.

See 2736, which I assigned to you.

Sau!

> -    rmdir ${D}${sbindir}/
>   }
>
>   inherit update-alternatives
>



