Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TiCpv-0004G0-9s
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 00:32:35 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Dec 2012 15:18:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,254,1355126400"; d="scan'208";a="260216452"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.85])
	by fmsmga001.fm.intel.com with ESMTP; 10 Dec 2012 15:18:02 -0800
Message-ID: <50C66DAA.8090800@linux.intel.com>
Date: Mon, 10 Dec 2012 15:18:02 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
References: <1354787367-18543-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<1354787367-18543-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
In-Reply-To: <1354787367-18543-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
Cc: Lukas Bulwahn <lukas.bulwahn@bmw-carit.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] distutils: Replacing path to native python by path to python in the image to support python packages with console-script setup
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
X-List-Received-Date: Mon, 10 Dec 2012 23:32:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2012 01:49 AM, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@bmw-carit.de>
>
> When using distutils for a python package based on a python-setuptools
> installation script that sets up a console script, the header
> of the console script created by setuptools points to the
> python-native path.
>
> The console scripts are commonly executed in the image, but not
> in the sysroot environment. Therefore, the header of the
> console scripts should point to the python interpreter in the
> image.
>
> Setuptools does not allow to set the path of the python
> interpreter via some command-line argument.
> Hence after the installation script ran, the distutils
> class replaces the path in the console script files created by
> the installation.
>
> Signed-off-by: Lukas Bulwahn <Lukas.Bulwahn@oss.bmw-carit.de>
> ---
>   meta/classes/distutils.bbclass |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
Thanks for the patch, good catch, but need a slight tweak.

Sau!


> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
> index 552e5f3..f67297e 100644
> --- a/meta/classes/distutils.bbclass
> +++ b/meta/classes/distutils.bbclass
> @@ -47,12 +47,14 @@ distutils_do_install() {
>
>           if test -e ${D}${bindir} ; then	
>               for i in ${D}${bindir}/* ; do \
> +                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${bindir}/python:g $i
I think this should really end up being #!/usr/bin/env python as that's 
how I see all other scripts do it.

>                   sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
>               done
>           fi
>
>           if test -e ${D}${sbindir}; then
>               for i in ${D}${sbindir}/* ; do \
> +                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${bindir}/python:g $i
Same here.
>                   sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
>               done
>           fi
> @@ -64,7 +66,6 @@ distutils_do_install() {
>           #
>           if test -e ${D}${datadir}/share; then
>               mv -f ${D}${datadir}/share/* ${D}${datadir}/
> -            rmdir ${D}${datadir}/share
>           fi
>   }
>
>


