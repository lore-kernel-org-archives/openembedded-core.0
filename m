Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTq4-0000Au-9m
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:35:12 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jul 2012 12:23:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="187010359"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2012 12:23:40 -0700
Message-ID: <5011993C.9050502@linux.intel.com>
Date: Thu, 26 Jul 2012 12:23:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343065037-13851-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1343065037-13851-1-git-send-email-otavio@ossystems.com.br>
Subject: Re: [PATCH v2 1/2] shadow-native: use 'users' group by default
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
X-List-Received-Date: Thu, 26 Jul 2012 19:35:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/23/2012 10:37 AM, Otavio Salvador wrote:
> The rootfs has 'users' group at number 100 and without this fix it
> would assign to a non-existent group and if a group with gid as 1000
> is created later it would own all files for users created.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   .../shadow/shadow-native_4.1.4.3.bb                |    5 ++++-
>   1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
> index 1e071f1..cd5605f 100644
> --- a/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
> +++ b/meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
> @@ -7,7 +7,7 @@ LICENSE = "BSD | Artistic-1.0"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
>                       file://src/passwd.c;firstline=8;endline=30;md5=2899a045e90511d0e043b85a7db7e2fe"
>
> -PR = "r6"
> +PR = "r7"
>
>   SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
>              file://shadow.automake-1.11.patch \
> @@ -46,4 +46,7 @@ do_install_append() {
>   	# Now we don't have a mail system. Disable mail creation for now.
>   	sed -i 's:/bin/bash:/bin/sh:g' ${D}${sysconfdir}/default/useradd
>   	sed -i '/^CREATE_MAIL_SPOOL/ s:^:#:' ${D}${sysconfdir}/default/useradd
> +
> +	# Use users group by default
> +	sed -i 's,^GROUP=1000,GROUP=100,g' ${D}${sysconfdir}/default/useradd
>   }
>

Merged these 2 into OE-Core

Thanks
	Sau!


