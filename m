Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QSBAh-0003Kq-Ui
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 18:55:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jun 2011 09:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,310,1304319600"; d="scan'208";a="12666874"
Received: from unknown (HELO helios.localnet) ([10.255.12.204])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2011 09:51:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 2 Jun 2011 17:51:26 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1306958862.git.otavio@ossystems.com.br>
	<ac909be8f5af8515017da51e7217fc15ef69379e.1306958862.git.otavio@ossystems.com.br>
In-Reply-To: <ac909be8f5af8515017da51e7217fc15ef69379e.1306958862.git.otavio@ossystems.com.br>
MIME-Version: 1.0
Message-Id: <201106021751.26598.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 2/3] qmake_base.bbclass: fix lrelease/lupdate binary names
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
X-List-Received-Date: Thu, 02 Jun 2011 16:55:00 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 01 June 2011 21:09:54 Otavio Salvador wrote:
> To support translation, qmake based projects usually call lrelease and
> lupdate however OE changes the binary names so this needs some mangle
> to work out of box.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/classes/qmake_base.bbclass |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/qmake_base.bbclass
> b/meta/classes/qmake_base.bbclass index a054efd..165d689 100644
> --- a/meta/classes/qmake_base.bbclass
> +++ b/meta/classes/qmake_base.bbclass
> @@ -92,6 +92,11 @@ qmake_base_do_configure() {
>  		bbnote "qmake prevar substitution: ${EXTRA_QMAKEVARS_PRE}"
>  	fi
> 
> +	# Hack .pro files to use OE utilities
> +	find -name '*.pro' \
> +	     -exec sed -i -e 's,=\s*.*/lrelease,= ${OE_QMAKE_LRELEASE},g' \
> +	                  -e 's,=\s*.*/lupdate,= ${OE_QMAKE_LUPDATE},g' '{}' ';'
> +
>  #bbnote "Calling '${OE_QMAKE_QMAKE} -makefile -spec ${QMAKESPEC} -o
> Makefile $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST'" unset
> QMAKESPEC || true
>  	${OE_QMAKE_QMAKE} -makefile -spec ${QMAKESPEC} -o Makefile
> $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die "Error
> calling ${OE_QMAKE_QMAKE} on $PROFILES"

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 

Paul Eggleton
Intel Open Source Technology Centre


