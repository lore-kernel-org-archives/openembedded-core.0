Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1R8wk7-0000vd-3k
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 18:12:19 +0200
Received: from mail-yi0-f52.google.com ([209.85.218.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 28 Sep 2011 09:06:47 -0700
Received: by yie30 with SMTP id 30so13477244yie.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 09:06:47 -0700 (PDT)
Received: by 10.68.0.4 with SMTP id 4mr44784916pba.23.1317226006842;
	Wed, 28 Sep 2011 09:06:46 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id h5sm8983670pbf.4.2011.09.28.09.06.46
	(version=SSLv3 cipher=OTHER); Wed, 28 Sep 2011 09:06:46 -0700 (PDT)
Message-ID: <4E834615.6050506@intel.com>
Date: Wed, 28 Sep 2011 09:06:45 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1316955464-19997-1-git-send-email-morphis@gravedo.de>
	<1316955464-19997-2-git-send-email-morphis@gravedo.de>
In-Reply-To: <1316955464-19997-2-git-send-email-morphis@gravedo.de>
Subject: Re: [PATCH 2/2] qt4-embedded: move qte.sh profile script into own package
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
X-List-Received-Date: Wed, 28 Sep 2011 16:12:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2011 05:57 AM, Simon Busch wrote:
> We don't want to pull the whole qt suite in our images when only installing a tiny setup
> which needs the profile script for several configuration issues. This moves the qte.sh
> profile script into a qt4-embedded-conf package which is automatically installed when an
> image depends on qt4-embedded.
>
> Signed-off-by: Simon Busch<morphis@gravedo.de>
> ---
>   meta/recipes-qt/qt4/qt4-embedded.inc |    8 ++++++--
>   1 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
> index 1ede922..ed872b0 100644
> --- a/meta/recipes-qt/qt4/qt4-embedded.inc
> +++ b/meta/recipes-qt/qt4/qt4-embedded.inc
> @@ -3,7 +3,7 @@ SECTION = "libs"
>   LICENSE = "LGPLv2.1 | GPLv3"
>   HOMEPAGE = "http://qt.nokia.com"
>   DEPENDS += "directfb tslib"
> -INC_PR = "r31"
> +INC_PR = "r32"
>
>   QT_BASE_NAME ?= "qt4-embedded"
>   QT_BASE_LIB  ?= "libqt-embedded"
> @@ -27,7 +27,11 @@ do_install_append() {
>       install -m 0755 ${WORKDIR}/qte.sh ${D}${sysconfdir}/profile.d/
>   }
>
> -FILES_${PN} += " ${sysconfdir}/profile.d/qte.sh"
> +# We put the qte profile into it's own package as we don't want to install all qt stuff
> +# with depending on the global package qt4-embedded
> +PACKAGES += " ${PN}-conf"
> +FILES_${PN}-conf += " ${sysconfdir}/profile.d/qte.sh"
> +RDEPENDS_${PN} += " ${PN}-conf"
>
>   inherit qt4e
>
Merged into OE-Core

Thanks
	Sau!



