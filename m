Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rw2VN-0003Nz-S8
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Feb 2012 03:16:02 +0100
Received: by daln34 with SMTP id n34so2374745dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 18:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2oQl8B9d8Sz3NgO/ec+wZLRBQYaw7HX+vV+oXSm+jQI=;
	b=LL2I16yAlUPmqoxO61h48vfnaWe5nebUKrGGlp0PzyANYBcBX1Sxq35qkjdF+yQua7
	Y78+oLEYAc5A5gl6pDf7loNpRflFvS6HwzkOWaciCZefuJVtH/ZCPLtg0S6xMFb1OCvl
	APwN+MIM9+2Dr1zlPNeLjLA8/ci20fSalBPW8=
Received: by 10.68.241.101 with SMTP id wh5mr21654996pbc.114.1328926074736;
	Fri, 10 Feb 2012 18:07:54 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id p9sm17973543pbb.9.2012.02.10.18.07.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 18:07:53 -0800 (PST)
Date: Fri, 10 Feb 2012 18:07:49 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120211020749.GE2095@sakrah.homelinux.org>
References: <4F355B52.6050007@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4F355B52.6050007@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] autotools.bbclass: Don't copy into non-existant directory
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
X-List-Received-Date: Sat, 11 Feb 2012 02:16:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (10/02/12 19:00), Andreas Oberritter wrote:
> * If configure.ac contains AM_GNU_GETTEXT and po/Makefile.in.in
>   doesn't exist, autotools_do_configure() copies a local
>   version of Makefile.in.in to this location. If the directory
>   'po' doesn't exist, the function aborts.
> 
> * This patch verifies that the directory exists before copying
>   a file to it. This fixes libcddb, which uses AM_GNU_GETTEXT,
>   but has no 'po' directory.
> 

this patch is ok however did you try to create the dir and then copy
over the file if it did not exist ?

> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/classes/autotools.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index 5d74333..e22ea68 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -149,7 +149,7 @@ autotools_do_configure() {
>  			  else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC >/dev/null; then
>                              # We'd call gettextize here if it wasn't so broken...
>  			    cp ${STAGING_DATADIR}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
> -			    if [ ! -e ${S}/po/Makefile.in.in ]; then
> +			    if [ -d ${S}/po/ -a ! -e ${S}/po/Makefile.in.in ]; then
>  			      cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
>                              fi
>  			  fi
> -- 
> 1.7.5.4
> 


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
-Khem


