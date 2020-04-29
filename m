Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.358.1588203663649507956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 16:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8A09B40BDF
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 23:41:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zAHSyGs9t_Mg
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2020 23:41:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 79B6640AB5
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 23:41:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E63DD172C5F; Wed, 29 Apr 2020 19:41:01 -0400 (EDT)
Date: Wed, 29 Apr 2020 19:41:01 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] sanity: Require gcc 6 or later
Message-ID: <20200429234101.GS11927@denix.org>
References: <20200429220156.1300336-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20200429220156.1300336-1-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 29, 2020 at 11:01:56PM +0100, Richard Purdie wrote:
> New versions of rpm have issues with the libgomp support in gcc 5.x
> so raise the minimum to 6 or later. This mainly affects Ubuntu 16.04.

So, this is for master, rigth? No plans to backport it to dunfell (hence, no 
rpm backport either), correct? Trying to make sure Yocto LTS will still work  
on Ubuntu 16.04 LTS...

-- 
Denys


> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/sanity.bbclass | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 9e871017389..292c5591dd3 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -527,7 +527,7 @@ def check_wsl(d):
>              bb.warn("You are running bitbake under WSLv2, this works properly but you should optimize your VHDX file eventually to avoid running out of storage space")
>      return None
>  
> -# Require at least gcc version 5.0.
> +# Require at least gcc version 6.0.
>  #
>  # This can be fixed on CentOS-7 with devtoolset-6+
>  # https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/
> @@ -541,8 +541,8 @@ def check_gcc_version(sanity_data):
>      
>      build_cc, version = oe.utils.get_host_compiler_version(sanity_data)
>      if build_cc.strip() == "gcc":
> -        if LooseVersion(version) < LooseVersion("5.0"):
> -            return "Your version of gcc is older than 5.0 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
> +        if LooseVersion(version) < LooseVersion("6.0"):
> +            return "Your version of gcc is older than 6.0 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
>      return None
>  
>  # Tar version 1.24 and onwards handle overwriting symlinks correctly
> -- 
> 2.25.1
> 

> 

