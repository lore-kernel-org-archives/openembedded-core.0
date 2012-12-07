Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TgmJI-0008GA-On
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 02:01:00 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 06 Dec 2012 16:46:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,233,1355126400"; d="scan'208";a="177272144"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.161])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Dec 2012 16:46:23 -0800
Message-ID: <50C13C5E.3010300@linux.intel.com>
Date: Thu, 06 Dec 2012 16:46:22 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1354781375.git.kai.kang@windriver.com>
	<4b453b852e6dbd3c91d1ffd469cdfc5480c1ec79.1354781375.git.kai.kang@windriver.com>
In-Reply-To: <4b453b852e6dbd3c91d1ffd469cdfc5480c1ec79.1354781375.git.kai.kang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libuser: enable python support
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
X-List-Received-Date: Fri, 07 Dec 2012 01:01:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2012 12:16 AM, Kang Kai wrote:
> Compile libuser with python support.
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>   meta/recipes-extended/libuser/libuser_0.57.1.bb |   12 +++++++++---
>   1 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/libuser/libuser_0.57.1.bb b/meta/recipes-extended/libuser/libuser_0.57.1.bb
> index 99b661b..3a29695 100644
> --- a/meta/recipes-extended/libuser/libuser_0.57.1.bb
> +++ b/meta/recipes-extended/libuser/libuser_0.57.1.bb
> @@ -15,10 +15,16 @@ SRC_URI = "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz"
>
>   SRC_URI[md5sum] = "be82c6941264d0b4bd04f95fb342ec7d"
>   SRC_URI[sha256sum] = "a61289867581fa715354a3fafe09c3e481173ce0a2dcb33b04588b6ac13cead5"
> -PR = "r2"
> +PR = "r3"
>
>   DEPENDS = "popt libpam glib-2.0 xz-native docbook-utils-native linuxdoc-tools-native"
>
> -EXTRA_OECONF += "--without-python"
> +inherit autotools gettext pythonnative python-dir
> +
> +EXTRA_OEMAKE = "PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/${PYTHON_DIR}"
> +
This change seems to have a problem with the non-gplv3, possibly some 
library or newer api is needed by the python code.

Please review, you might need a wrapper with INCOMPATIBLE_LICENSE check 
for enabling or disabling the python.

Thanks
    Sau!

> +PACKAGES += "${PN}-python "
> +
> +FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug"
> +FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
>
> -inherit autotools gettext
>


