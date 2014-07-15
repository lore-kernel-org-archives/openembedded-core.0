Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 15F1870625
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:24:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Jul 2014 08:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,666,1400050800"; d="scan'208";a="573484582"
Received: from unknown (HELO [10.255.12.224]) ([10.255.12.224])
	by orsmga002.jf.intel.com with ESMTP; 15 Jul 2014 08:21:47 -0700
Message-ID: <53C5470B.2090704@linux.intel.com>
Date: Tue, 15 Jul 2014 08:21:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Armin Kuster <akuster@mvista.com>, 
	openembedded-core@lists.openembedded.org
References: <1405437238-28782-1-git-send-email-akuster@mvista.com>
In-Reply-To: <1405437238-28782-1-git-send-email-akuster@mvista.com>
Subject: Re: [meta-oe][PATCH] [v2] nettle: update to version 3.0
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
X-List-Received-Date: Tue, 15 Jul 2014 15:24:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2014 08:13 AM, Armin Kuster wrote:
> Updating to version 3.x
> Version 3.x includes GPL v3 code. They call it dual
>    licensing
> Keeping 2.7.1 as it is GPL v2
> Put common code in inc file
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>   meta/recipes-support/nettle/nettle.inc      | 27 +++++++++++++++++++++++++++
>   meta/recipes-support/nettle/nettle_2.7.1.bb | 20 +++-----------------
>   meta/recipes-support/nettle/nettle_3.0.bb   | 16 ++++++++++++++++
>   3 files changed, 46 insertions(+), 17 deletions(-)
>   create mode 100644 meta/recipes-support/nettle/nettle.inc
>   create mode 100644 meta/recipes-support/nettle/nettle_3.0.bb
>
> diff --git a/meta/recipes-support/nettle/nettle.inc b/meta/recipes-support/nettle/nettle.inc
> new file mode 100644
> index 0000000..bca35c0
> --- /dev/null
> +++ b/meta/recipes-support/nettle/nettle.inc
> @@ -0,0 +1,27 @@
> +SUMMARY = "A low level cryptographic library"
> +HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
> +SECTION = "libs"
> +LICENSE = "LGPLv2.1 & GPLv2"
> +
> +# Version 2.7.1 is GPL v2
> +# set PREFERRED_VERSION_nettle =  "2.7.1" in local.conf
> +# if you want GPLv2 code
> +#

The preferred mechanism for getting GPLv2 is to set 
INCOMPATIBLE_LICENSE="GPLv3", not by setting PREFERRED_VERSION, so I am 
not sure this comment is best here.

> +# Version 3.x is GPL v2 and v3
> +
> +
> +DEPENDS += "gmp"
> +
> +SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
> +
> +EXTRA_OECONF = "--disable-openssl"
> +
> +do_configure_prepend() {
> +       if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then
> +               cp ${S}/aclocal.m4 ${S}/acinclude.m4
> +       fi
> +}
> +
> +inherit autotools
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_2.7.1.bb
> index 8aa5351..9ef9f64 100644
> --- a/meta/recipes-support/nettle/nettle_2.7.1.bb
> +++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
> @@ -1,26 +1,12 @@
> -SUMMARY = "A low level cryptographic library"
> -HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
> -SECTION = "libs"
> +
> +include nettle.inc
> +
>   LICENSE = "LGPLv2.1 & GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>                       file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
>                       file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
>
> -DEPENDS += "gmp"
> -
> -SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
>
>   SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
>   SRC_URI[sha256sum] = "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
>
> -EXTRA_OECONF = "--disable-openssl"
> -
> -do_configure_prepend() {
> -       if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then
> -               cp ${S}/aclocal.m4 ${S}/acinclude.m4
> -       fi
> -}
> -
> -inherit autotools
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-support/nettle/nettle_3.0.bb b/meta/recipes-support/nettle/nettle_3.0.bb
> new file mode 100644
> index 0000000..bac2e71
> --- /dev/null
> +++ b/meta/recipes-support/nettle/nettle_3.0.bb
> @@ -0,0 +1,16 @@
> +#
> +# Nettle  3 and above contains GPL v3 code
> +# use 2.7.1 if you do not want GPL v3 code
> +#
> +
> +include nettle.inc
> +
> +LICENSE = "LGPLv2.1 & GPLv2 & GPLv3"
> +
This should be | (single) then based on your follow up email to RP.

Sau!

> +LIC_FILES_CHKSUM = "file://COPYINGv3;md5=11cc2d3ee574f9d6b7ee797bdce4d423\
> +                    file://serpent-decrypt.c;beginline=53;endline=67;md5=a4ccbeb343203d3586661f45c1cab577 \
> +                    file://serpent-set-key.c;beginline=56;endline=70;md5=150b0ea44cdfb712a83331bff566e9a8"
> +
> +SRC_URI[md5sum] = "f64b1bf1e774b7ae6e507318e340250e"
> +SRC_URI[sha256sum] = "9651c0bd2326eb737d0ed9eb403444712407c01a25b0fe813432ef31bebcd913"
> +
>

