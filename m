Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 68FD478376
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 17:34:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 10:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,341,1493708400"; d="scan'208";a="99498918"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga002.jf.intel.com with ESMTP; 14 Jun 2017 10:34:59 -0700
Message-ID: <1497462238.29576.11.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 14 Jun 2017 12:43:58 -0500
In-Reply-To: <1497447757-30951-3-git-send-email-richard.purdie@linuxfoundation.org>
References: <1497447757-30951-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1497447757-30951-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] package_ipk: Parallelise ipk creation
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
X-List-Received-Date: Wed, 14 Jun 2017 17:34:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-06-14 at 14:42 +0100, Richard Purdie wrote:
> Allow the creation of ipks to happen in parallel, making best use of resources
> on multiprocessor systems.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/package_ipk.bbclass | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index d2ce3b3..282d212 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -17,6 +17,8 @@ OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKA
>  OPKGLIBDIR = "${localstatedir}/lib"
>  
>  python do_package_ipk () {
> +    from multiprocessing import Process
> +
>      oldcwd = os.getcwd()
>  
>      workdir = d.getVar('WORKDIR')
> @@ -37,11 +39,24 @@ python do_package_ipk () {
>      if os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"), os.R_OK):
>          os.unlink(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"))
>  
> -    for pkg in packages.split():
> -        ipk_write_pkg(pkg, d)


this part looks quite similar as the 2/3, perhaps a single function
inside package.bbclass?

> +    max_process = int(d.getVar("BB_NUMBER_THREADS") or os.cpu_count() or 1)
> +    launched = []
> +    pkgs = packages.split()
> +    while pkgs:
> +        if len(launched) < max_process:
> +            p = Process(target=ipk_write_pkg, args=(pkgs.pop(), d))
> +            p.start()
> +            launched.append(p)
> +        for q in launched:
> +            # The finished processes are joined when calling is_alive()
> +            if not q.is_alive():
> +                launched.remove(q)
> +    for p in launched:
> +        p.join()
>  
>      os.chdir(oldcwd)
>  }
> +do_package_ipk[vardepsexclude] = "BB_NUMBER_THREADS"
>  
>  def ipk_write_pkg(pkg, d):
>      import re, copy
> -- 
> 2.7.4
> 



