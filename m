Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S101b-0007y6-Hc
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 19:37:47 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Feb 2012 10:29:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="121016260"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2012 10:29:23 -0800
Message-ID: <4F47D703.9080605@linux.intel.com>
Date: Fri, 24 Feb 2012 10:29:23 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F355B52.6050007@opendreambox.org>
In-Reply-To: <4F355B52.6050007@opendreambox.org>
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
X-List-Received-Date: Fri, 24 Feb 2012 18:37:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2012 10:00 AM, Andreas Oberritter wrote:
> * If configure.ac contains AM_GNU_GETTEXT and po/Makefile.in.in
>    doesn't exist, autotools_do_configure() copies a local
>    version of Makefile.in.in to this location. If the directory
>    'po' doesn't exist, the function aborts.
>
> * This patch verifies that the directory exists before copying
>    a file to it. This fixes libcddb, which uses AM_GNU_GETTEXT,
>    but has no 'po' directory.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   meta/classes/autotools.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index 5d74333..e22ea68 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -149,7 +149,7 @@ autotools_do_configure() {
>   			  else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC>/dev/null; then
>                               # We'd call gettextize here if it wasn't so broken...
>   			    cp ${STAGING_DATADIR}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
> -			    if [ ! -e ${S}/po/Makefile.in.in ]; then
> +			    if [ -d ${S}/po/ -a ! -e ${S}/po/Makefile.in.in ]; then
>   			      cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
>                               fi
>   			  fi
>
Merged into OE-core

Thanks
	Sau!

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


