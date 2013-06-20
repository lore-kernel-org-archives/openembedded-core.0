Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 713D4608A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 14:50:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 20 Jun 2013 07:50:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,905,1363158000"; d="scan'208";a="352960889"
Received: from unknown (HELO helios.localnet) ([10.252.122.59])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2013 07:50:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jonathan Liu <net147@gmail.com>
Date: Thu, 20 Jun 2013 15:50:02 +0100
Message-ID: <3332015.9LH41hgt44@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <1371734393-27665-1-git-send-email-net147@gmail.com>
References: <1371734393-27665-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4: add eglibc-gconv-utf-16 to QtCore RRECOMMENDS when using glibc
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
X-List-Received-Date: Thu, 20 Jun 2013 14:50:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 20 June 2013 23:19:53 Jonathan Liu wrote:
> This fixes the following warnings when running Qt applications:
> QIconvCodec::convertFromUnicode: using Latin-1 for conversion, iconv_open
> failed QIconvCodec::convertToUnicode: using Latin-1 for conversion,
> iconv_open failed
> 
> Qt's QString class stores strings internally using UTF-16 encoding.
> The UTF-16 iconv module is needed to convert between the system's local
> 8-bit representation and QString's UTF-16 encoding.
> 
> For example, the following functions would be affected:
> QString::fromLocal8Bit(...)
> QString::toLocal8Bit(...)
> 
> If the UTF-16 iconv module couldn't be loaded, it would use Latin-1
> encoding instead of the system's encoding for conversion.
> 
> [YOCTO #349]
> 
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/recipes-qt/qt4/qt4.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
> index 828e30a..ebe0ea5 100644
> --- a/meta/recipes-qt/qt4/qt4.inc
> +++ b/meta/recipes-qt/qt4/qt4.inc
> @@ -134,6 +134,7 @@ FILES_${QT_BASE_NAME}-demos-doc =
> "${docdir}/${QT_DIR_NAME}/qch/qt.qch" RRECOMMENDS_${PN} = "${LIB_PACKAGES}
> ${OTHER_PACKAGES}"
>  RRECOMMENDS_${PN}-dev = "${DEV_PACKAGES}"
>  RRECOMMENDS_${PN}-dbg = "${DBG_PACKAGES}"
> +RRECOMMENDS_${QT_BASE_LIB}core4_append_libc-glibc = " eglibc-gconv-utf-16"
>  RRECOMMENDS_${QT_BASE_NAME}-demos += " \
>              ${QT_BASE_NAME}-examples \
>              ${QT_BASE_NAME}-plugin-sqldriver-sqlite \

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Thanks for fixing this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

