Received: from avasout01.plus.net (avasout01.plus.net [84.93.230.227])
 by mx.groups.io with SMTP id smtpd.web10.6350.1626442598634773377
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jul 2021 06:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=k8d/eRi5;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.227, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id 4O13mKKVN7w2v4O14moRFX; Fri, 16 Jul 2021 14:36:37 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=YueUu7QX c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=e_q4qTt1xDgA:10 a=ag1SF4gXAAAA:8 a=z6fDK_TwEV2a1kpubHsA:9
 a=CjuIK1q_8ugA:10 a=Yupwre4RP9_Eg_Bd0iYG:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=ITlAHpAkZgwzbsH7+o7ClwAy2DGiFCeI3yA7f9yUB4E=; b=k8d/e
	Ri5LxbW6c/8X69ESBaBBatPigB2vfV6tu7VyT5wCNJUPZkKt51QtI6J5iGULQ4h2ilRZsHPGz1hFq
	g2OPRogQ2EBOiUB4eGTtDDc7ePtDVP4Z/00f2k4gyGMkPJ9fo2VYJayntD37vwMCqpZmXhmV3QezL
	RnENp9/gZSNIg+MSofJQvvhD8HjOrg9EL4nHdqMZm9IiYzpwiG+VelKNoSh+CsKYuImJ0zVuwEcyO
	DVdPpXoDIyy6JkUUEGfmnaJUHQe7NGEPPV3Rg/sDlSjgpxo3WpWWROpBdegaC5nXlAtGjBEHf9gxX
	fUW5dh1h9lFiK76h+RXMhDSWk0XRg==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1m4O13-00057X-Nn; Fri, 16 Jul 2021 14:36:33 +0100
Date: Fri, 16 Jul 2021 14:36:33 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] license: Drop adding RRECOMMENDS for license packages
Message-ID: <20210716133633.GA15120@mcrowe.com>
References: <20210707170607.2698337-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20210707170607.2698337-1-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfLj7zdCRgXHzrLq2ehzTUqDQ96Mw6nopWASDnX5rInezo6KE1UYrBirFxabCImID71DbueFEEtX0kj0FwAGKSwGRjSOB26pKBXL6gzUaqJJ6Fc85y1Lj
 143d29vLSWTkQiIR8SI6YCIXH7HrU3e0GJVjcD5qbOl88YCucHn3RuCZuSPFreNOn36jgoUhAOpr4g==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wednesday 07 July 2021 at 18:06:07 +0100, Richard Purdie wrote:
> This changes behaviour when LICENSE_CREATE_PACKAGE is in use. Packages
> no longer have RRECOMMENDS adding to them.
> 
> It was highlighted that this doesn't apply to PACKAGES_DYNAMIC, nor can
> it easily be made to do so. There is also a much easier way to handle this
> which is:
> 
> IMAGE_INSTALL_COMPLEMENTARY += "*-lic"
> 
> which works on a per image basis and doesn't change the underlying
> package dependencies. I propose we switch to this instead.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/license.bbclass | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index f7978e266b6..c87473cbb85 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -63,14 +63,6 @@ def add_package_and_files(d):
>          # first in PACKAGES to be sure that nothing else gets LICENSE_FILES_DIRECTORY
>          d.setVar('PACKAGES', "%s %s" % (pn_lic, packages))
>          d.setVar('FILES_' + pn_lic, files)
> -    for pn in packages.split():
> -        if pn == pn_lic:
> -            continue
> -        rrecommends_pn = d.getVar('RRECOMMENDS_' + pn)
> -        if rrecommends_pn:
> -            d.setVar('RRECOMMENDS_' + pn, "%s %s" % (pn_lic, rrecommends_pn))
> -        else:
> -            d.setVar('RRECOMMENDS_' + pn, "%s" % (pn_lic))
>  
>  def copy_license_files(lic_files_paths, destdir):
>      import shutil
> -- 
> 2.30.2
> 

It turns out that this has an interesting side effect when
IMAGE_FEATURES also contains "dbg-pkgs".

If python3-core is installed in my image then dbg-pkgs causes python3-dbg
to be installed. python3-dbg recommends gdbm-dbg, so libgdbm-dbg also gets
installed.

Prior to this change, libgdbm-dbg recommends gdbm-lic, so libgdbm-lic gets
installed too.

After this change, libgdbm-dbg no longer recommends gdbm-lic and since
libgdbm itself isn't installed and the complementary globs have already
been matched libgdbm-lic is not installed.

(Other recipes that have multiple binary packages with dependencies that
aren't all installed are affected similarly.)

I don't think this really matters in general, and don't propose to change
anything, but it is a surprise if you have a check that goes through the
results of image_list_installed_packages(d) confirming that all the licence
files have been installed and it gets upset that libgdbm-lic isn't there.

Thanks.

Mike.
