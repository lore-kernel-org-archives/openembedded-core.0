Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXcRT-0007Sg-Ov
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 20:07:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 May 2012 10:57:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148041076"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 10:57:03 -0700
Message-ID: <4FBE766E.50009@linux.intel.com>
Date: Thu, 24 May 2012 10:57:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337633664-19754-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1337633664-19754-1-git-send-email-obi@opendreambox.org>
Subject: Re: [PATCH 1/2] distutils.bbclass: don't delete .pyo files
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
X-List-Received-Date: Thu, 24 May 2012 18:07:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2012 01:54 PM, Andreas Oberritter wrote:
> * Deleting .pyo files causes them to get compiled on the target.
> * First boot gets *really* slow for python based projects.
> * No space gets saved on the target.
> * The package manager doesn't know about the files and
>    therefore fails to uninstall them, occupying space and causing
>    uninstalled python scripts to remain executable.
> * It's inconsistent, because python itself and autotools based
>    projects already ship .pyo files.
> * Probably .pyo files were deleted because .pyc files were
>    available earlier, but this has changed and OE-Core's python
>    now only generates optimized .pyo files. Deletion of .pyo was
>    introduced in 2008, python/04-default-is-optimized.patch
>    was introduced in 2009.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   meta/classes/distutils.bbclass |    4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
> index 18ae805..bcddf8d 100644
> --- a/meta/classes/distutils.bbclass
> +++ b/meta/classes/distutils.bbclass
> @@ -65,10 +65,6 @@ distutils_do_install() {
>           if test -e ${D}${datadir}/share; then
>               mv -f ${D}${datadir}/share/* ${D}${datadir}/
>           fi
> -
> -        # These are generated files, on really slow systems the storage/speed trade off
> -        # might be worth it, but in general it isn't
> -        find ${D}${libdir}/${PYTHON_DIR}/site-packages -iname '*.pyo' -exec rm {} \;
>   }
>
>   EXPORT_FUNCTIONS do_compile do_install


Merged these 2 into OE-Core

Thanks
	Sau!


