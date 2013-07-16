Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 175C66B1C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 22:54:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2013 15:54:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,680,1367996400"; d="scan'208";a="371344542"
Received: from unknown (HELO [10.255.13.97]) ([10.255.13.97])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2013 15:54:11 -0700
Message-ID: <51E5CF13.4090405@linux.intel.com>
Date: Tue, 16 Jul 2013 15:54:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: eu@felipetonello.com
References: <1370626502-5233-1-git-send-email-eu@felipetonello.com>
	<1374012965-4556-1-git-send-email-eu@felipetonello.com>
In-Reply-To: <1374012965-4556-1-git-send-email-eu@felipetonello.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] valgrind: added perl dependency
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
X-List-Received-Date: Tue, 16 Jul 2013 22:54:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/16/2013 03:16 PM, eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <eu@felipetonello.com>
>
> This is necessary since the valgrind package depends on /usr/bin/perl.
>
> This patch will fix this error while installing into rootfs:
> Computing transaction...error: Can't install valgrind-3.8.1-r8@armv7a_vfp_neon: no package provides /usr/bin/perl
>
> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> ---
>   meta/recipes-devtools/valgrind/valgrind_3.8.1.bb | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
> index 3520d49..4ee1b64 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.8.1.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
>
>   X11DEPENDS = "virtual/libx11"
>   DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
> -PR = "r8"
> +PR = "r9"
>
PR Bump is not needed, mentioned this in past reviews.

Sau!
>   SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>   	   file://fix_issue_caused_by_ccache.patch \
> @@ -37,6 +37,8 @@ do_install_append () {
>       install -m 644 ${B}/default.supp ${D}/${libdir}/valgrind/
>   }
>
> +RDEPENDS_${PN} += "perl"
> +
>   FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug/*"
>   RRECOMMENDS_${PN}_powerpc += "${TCLIBC}-dbg"
>   RRECOMMENDS_${PN}_powerpc64 += "${TCLIBC}-dbg"
>

