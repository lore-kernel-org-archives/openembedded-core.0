Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B318873D8C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 18:03:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jun 2015 11:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,574,1427785200"; d="scan'208";a="504940952"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.173])
	([10.219.4.173])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2015 11:02:45 -0700
Message-ID: <5575D924.5090001@linux.intel.com>
Date: Mon, 08 Jun 2015 13:04:20 -0500
From: =?windows-1252?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Pau Espin Pedrol <pespin.shar@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <1433761851-26152-1-git-send-email-pau.espin@aweurope.be>
In-Reply-To: <1433761851-26152-1-git-send-email-pau.espin@aweurope.be>
Cc: anibal.limon@intel.com
Subject: Re: [PATCH][Daisy] mesa: Avoid leaving empty sysconfdir in mesa package
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
X-List-Received-Date: Mon, 08 Jun 2015 18:03:14 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Looks good for me i tested with rpm and deb package_classes.

Cheers,
     alimon

On 08/06/15 06:10, Pau Espin Pedrol wrote:
> Signed-off-by: Pau Espin Pedrol <pau.espin@aweurope.be>
Acked-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>   meta/recipes-graphics/mesa/mesa.inc | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 96313b5..f88b2a4 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -99,6 +99,11 @@ do_install_append () {
>       
>       # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used
>       rm -f ${D}${sysconfdir}/drirc
> +
> +    # /etc is sometimes left as an empty directory and it ends up into 'mesa' package, which is then a non-empty package
> +    if [ -d ${D}${sysconfdir} ]; then
> +        rmdir --ignore-fail-on-non-empty ${D}${sysconfdir}
> +    fi
>   }
>   
>   # For the packages that make up the OpenGL interfaces, inject variables so that


