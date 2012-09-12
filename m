Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBrDA-0003uw-Js
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 19:58:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Sep 2012 10:46:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="192147212"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by orsmga001.jf.intel.com with ESMTP; 12 Sep 2012 10:46:19 -0700
Message-ID: <5050CA6A.80102@linux.intel.com>
Date: Wed, 12 Sep 2012 10:46:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1347281890-23781-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1347281890-23781-1-git-send-email-paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/packageinfo: use better method to check if package exists
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
X-List-Received-Date: Wed, 12 Sep 2012 17:58:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2012 05:58 AM, Paul Eggleton wrote:
> Instead of using a rather error-prone method of looking for output
> package files in order to determine if a package got created, use the
> .packaged file within pkgdata.
>
> This fixes two separate issues:
> * Some packages apparently not being found by this code e.g. all
>    apm/apmd packages when using ipk packaging.
> * Buggy implementation of this checking code which triggered an
>    exception during the event handler if PKGV was overridden on a
>    per-package basis (as it is with external-sourcery-toolchain), which
>    blocked Hob from completing parsing at 99% - fixes [YOCTO #2651].
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   meta/classes/packageinfo.bbclass |   34 ++++++++--------------------------
>   1 file changed, 8 insertions(+), 26 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!

> diff --git a/meta/classes/packageinfo.bbclass b/meta/classes/packageinfo.bbclass
> index 26cce60..bd7b249 100644
> --- a/meta/classes/packageinfo.bbclass
> +++ b/meta/classes/packageinfo.bbclass
> @@ -14,32 +14,14 @@ python packageinfo_handler () {
>                   for root, dirs, files in os.walk(pkgdata_dir):
>                       for pkgname in files:
>                           if pkgname.endswith('.packaged'):
> -                            continue
> -                        sdata = oe.packagedata.read_pkgdatafile(root + pkgname)
> -                        sdata['PKG'] = pkgname
> -                        pkgrename = sdata['PKG_%s' % pkgname]
> -                        pkgv = sdata['PKGV'].replace('-', '+')
> -                        pkgr = sdata['PKGR']
> -                        # We found there are some renaming issue with certain architecture.
> -                        # For example, armv7a-vfp-neon, it will use armv7a in the rpm file. This is the workaround for it.
> -                        arch_tmp = arch.split('-')[0]
> -                        if os.path.exists(deploy_dir + '/' + arch + '/' + \
> -                                          pkgname + '-' + pkgv + '-' + pkgr + '.' + arch + '.' + packaging) or \
> -                           os.path.exists(deploy_dir + '/' + arch + '/' + \
> -                                          pkgname + '-' + pkgv + '-' + pkgr + '.' + arch_tmp + '.' + packaging) or \
> -                           os.path.exists(deploy_dir + '/' + arch + '/' + \
> -                                          pkgrename + '-' + pkgv + '-' + pkgr + '.' + arch + '.' + packaging) or \
> -                           os.path.exists(deploy_dir + '/' + arch + '/' + \
> -                                          pkgrename + '-' + pkgv + '-' + pkgr + '.' + arch_tmp + '.' + packaging) or \
> -                           os.path.exists(deploy_dir + '/' + arch + '/' + \
> -                                          pkgname + '_' + pkgv + '-' + pkgr + '_' + arch + '.' + packaging) or \
> -                           os.path.exists(deploy_dir + '/' + arch + '/' + \
> -                                          pkgname + '_' + pkgv + '-' + pkgr + '_' + arch_tmp + '.' + packaging) or \
> -                           os.path.exists(deploy_dir + '/' + arch + '/' + \
> -                                          pkgrename + '_' + pkgv + '-' + pkgr + '_' + arch + '.' + packaging) or \
> -                           os.path.exists(deploy_dir + '/' + arch + '/' + \
> -                                          pkgrename + '_' + pkgv + '-' + pkgr + '_' + arch_tmp + '.' + packaging):
> -                            pkginfolist.append(sdata)
> +                            pkgname = pkgname[:-9]
> +                            pkgdatafile = root + pkgname
> +                            try:
> +                                sdata = oe.packagedata.read_pkgdatafile(pkgdatafile)
> +                                sdata['PKG'] = pkgname
> +                                pkginfolist.append(sdata)
> +                            except Exception as e:
> +                                bb.warn("Failed to read pkgdata file %s: %s: %s" % (pkgdatafile, e.__class__, str(e)))
>           bb.event.fire(bb.event.PackageInfo(pkginfolist), e.data)
>   }
>
>


