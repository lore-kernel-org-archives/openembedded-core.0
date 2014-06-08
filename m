Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 60F4F6FA7F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Jun 2014 04:02:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jun 2014 21:02:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,997,1392192000"; d="scan'208";a="544468846"
Received: from unknown (HELO [10.255.12.194]) ([10.255.12.194])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2014 21:02:27 -0700
Message-ID: <5393E053.6080006@linux.intel.com>
Date: Sat, 07 Jun 2014 21:02:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Armin Kuster <akuster@mvista.com>, 
	openembedded-core@lists.openembedded.org
References: <1402151406-14527-1-git-send-email-akuster@mvista.com>
In-Reply-To: <1402151406-14527-1-git-send-email-akuster@mvista.com>
Subject: Re: [PATCH] cups: Fix build failure
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
X-List-Received-Date: Sun, 08 Jun 2014 04:02:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2014 07:30 AM, Armin Kuster wrote:
> The follwing error was seen when no crypt dependency was included.
>
> In file included from cups-private.h:29:0,
> |                  from attr.c:26:
> | http-private.h:83:24: fatal error: gcrypt.h: No such file or directory
> |  #    include <gcrypt.h>
> |                         ^
>
> Add bcrypt to DEPENDS
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>   meta/recipes-extended/cups/cups.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
> index fd88552..249eac4 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -1,7 +1,7 @@
>   SUMMARY = "An Internet printing system for Unix"
>   SECTION = "console/utils"
>   LICENSE = "GPLv2 & LGPLv2"
> -DEPENDS = "gnutls libpng jpeg dbus dbus-glib zlib libusb"
> +DEPENDS = "gnutls libpng jpeg dbus dbus-glib zlib libusb bcrypt"

Do we really want to enable crypt here or make it optional?  If we set 
ac_cv_search_crypt=no on the EXTRA_OECONF line, then we can remove this 
floating dependency or make it a PACKAGECONFIG setting

Sau!

>   PROVIDES = "cups14"
>
>   SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
>

