Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QtKXU-0002zJ-J0
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 16:22:44 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Aug 2011 07:18:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,380,1309762800"; d="scan'208";a="40074467"
Received: from unknown (HELO helios.localnet) ([10.255.18.69])
	by fmsmga002.fm.intel.com with ESMTP; 16 Aug 2011 07:18:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 16 Aug 2011 15:18:02 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1313503017.git.anders@chargestorm.se>
	<0723e2f710db1680c71a1f6f848563cfcc6b3cdc.1313503017.git.anders@chargestorm.se>
In-Reply-To: <0723e2f710db1680c71a1f6f848563cfcc6b3cdc.1313503017.git.anders@chargestorm.se>
MIME-Version: 1.0
Message-Id: <201108161518.02244.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/5] qt4: allow a reduction in build time
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
X-List-Received-Date: Tue, 16 Aug 2011 14:22:44 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 16 August 2011 14:57:48 Anders Darander wrote:
> When reducing build time by adding QT_DISTRO_FLAGS from the set '-no-gui
> -nomake tools -nomake examples -nomake demos -nomake docs', build failure
> can occur, due to not building all tools.
> 
> * Make rm not error out when removing one of the, possibly, non-existing
> tools. * Only try to rename qtdemo, if qtdemo exists.
> * Guard do_split_packages() with an try-except-clause, otherwise we get an
> error stating that .../phrasebooks/... do not exist.
> 
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta/recipes-qt/qt4/qt4.inc |   13 ++++++++-----
>  1 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
> index 0410a92..994ec12 100644
> --- a/meta/recipes-qt/qt4/qt4.inc
> +++ b/meta/recipes-qt/qt4/qt4.inc
> @@ -227,7 +227,10 @@ python populate_packages_prepend() {
> 
>          phrasebook_dir =
> bb.data.expand('${datadir}/${QT_DIR_NAME}/phrasebooks/', d)
> phrasebook_name = bb.data.expand('${QT_BASE_NAME}-phrasebook-%s', d) -    
>    do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name,
> '${PN} phrasebook for %s', extra_depends='' ) +        try:
> +                do_split_packages(d, phrasebook_dir, '^(.*)\.qph$',
> phrasebook_name, '${PN} phrasebook for %s', extra_depends='' ) +       
> except:
> +                pass
> 
>          # Package all the plugins and their -dbg version and create a meta
> package import os
> @@ -278,11 +281,11 @@ do_install() {
> 
>  	# These are host binaries, we should only use them in staging
>  	rm ${D}/${bindir}/qmake
> -	rm ${D}/${bindir}/uic
> -	rm ${D}/${bindir}/uic3
> +	rm -f ${D}/${bindir}/uic
> +	rm -f ${D}/${bindir}/uic3
>  	rm ${D}/${bindir}/moc
>  	rm ${D}/${bindir}/rcc
> -	rm ${D}/${bindir}/lrelease
> +	rm -f ${D}/${bindir}/lrelease
> 
>  	# fix pkgconfig, libtool and prl files
>  	sed -i -e s#-L${S}/lib##g \
> @@ -319,6 +322,6 @@ do_install() {
> 
>  	#Append an E to the qtdemo file
>  	if [ -n "${QT_LIBINFIX}" ] ; then
> -		mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
> +		[ -f ${D}${bindir}/qtdemo ] && mv ${D}${bindir}/qtdemo
> ${D}${bindir}/qtdemo${QT_LIBINFIX} fi
>  }

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


