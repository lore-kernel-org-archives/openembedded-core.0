Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id AD0B378281
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 15:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2EED120B51;
	Wed, 14 Jun 2017 15:12:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id SdAbyMMgM_NN; Wed, 14 Jun 2017 15:12:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0C98C20072;
	Wed, 14 Jun 2017 15:12:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 887B4162500; Wed, 14 Jun 2017 11:12:46 -0400 (EDT)
Date: Wed, 14 Jun 2017 11:12:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170614151246.GE28053@denix.org>
References: <1497447757-30951-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1497447757-30951-3-git-send-email-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1497447757-30951-3-git-send-email-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Wed, 14 Jun 2017 15:12:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 14, 2017 at 02:42:37PM +0100, Richard Purdie wrote:
> Allow the creation of ipks to happen in parallel, making best use of resources
> on multiprocessor systems.

This is nice! Thanks for looking into the issue of not optimal utilization of 
all the available processors and cores.


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
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

