Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Txn1e-00057w-1x
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 00:13:23 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2013 14:56:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,517,1355126400"; d="scan'208";a="275379164"
Received: from unknown (HELO [10.255.15.89]) ([10.255.15.89])
	by orsmga002.jf.intel.com with ESMTP; 22 Jan 2013 14:57:33 -0800
Message-ID: <50FF195D.6020604@linux.intel.com>
Date: Tue, 22 Jan 2013 14:57:33 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Qi.Chen@windriver.com
References: <cover.1358836314.git.Qi.Chen@windriver.com>
	<55f028c6a820eca153b31716bc7b8516a77ef06f.1358836314.git.Qi.Chen@windriver.com>
In-Reply-To: <55f028c6a820eca153b31716bc7b8516a77ef06f.1358836314.git.Qi.Chen@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V8 5/6] volatile-conf-minimal: add recipe
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
X-List-Received-Date: Tue, 22 Jan 2013 23:13:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/21/2013 10:36 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> This recipe provides a config file for core-image-minimal.
> This config file is used for volatile storage handling in case of a
> readonly rootfs.
>
> Also, let core-image-minimal depend on this recipe.
>
> [YOCTO #3406]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-core/images/core-image-minimal.bb     |    3 +++
>   .../files/volatiles-readonly-minimal               |    8 ++++++++
>   .../volatile-conf-minimal_1.0.bb                   |   15 +++++++++++++++
>   3 files changed, 26 insertions(+)
>   create mode 100644 meta/recipes-core/readonly-volatile-conf/files/volatiles-readonly-minimal
>   create mode 100644 meta/recipes-core/readonly-volatile-conf/volatile-conf-minimal_1.0.bb
>
> diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
> index 0d2613e..f6baeae 100644
> --- a/meta/recipes-core/images/core-image-minimal.bb
> +++ b/meta/recipes-core/images/core-image-minimal.bb
> @@ -6,6 +6,9 @@ IMAGE_LINGUAS = " "
>
>   LICENSE = "MIT"
>
> +RDEPENDS += "volatile-conf-minimal"
This needs to be RDEPENDS_${PN}

> +IMAGE_INSTALL += "volatile-conf-minimal"
> +
I am still digging into this idea of having a image specific volatile 
package, RP is not wild about it either.  What's different now from 
before is the minimal version cut down from the orignal version?  Is 
there any reason we can't use a larger volatile conf?

Sau!

>   inherit core-image
>
>   IMAGE_ROOTFS_SIZE = "8192"
> diff --git a/meta/recipes-core/readonly-volatile-conf/files/volatiles-readonly-minimal b/meta/recipes-core/readonly-volatile-conf/files/volatiles-readonly-minimal
> new file mode 100644
> index 0000000..b7146a2
> --- /dev/null
> +++ b/meta/recipes-core/readonly-volatile-conf/files/volatiles-readonly-minimal
> @@ -0,0 +1,8 @@
> +# This configuration file lists filesystem objects specific to minimal image
> +# with read-only rootfs.
> +# This configuration file will only be applied if the image is minimal and the
> +# rootfs is read-only.
> +# For the detailed format information, refer to /etc/default/volatiles/00_core.
> +d root root 0755 /var/volatile/lib/ none
> +d root root 0755 /var/volatile/lib/urandom/ none
> +l root root 0755 /var/lib/urandom /var/volatile/lib/urandom
> diff --git a/meta/recipes-core/readonly-volatile-conf/volatile-conf-minimal_1.0.bb b/meta/recipes-core/readonly-volatile-conf/volatile-conf-minimal_1.0.bb
> new file mode 100644
> index 0000000..c5744e1
> --- /dev/null
> +++ b/meta/recipes-core/readonly-volatile-conf/volatile-conf-minimal_1.0.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "Provide config files for core-image-minimal"
> +DESCRIPTION = "This package contains a config file for core-image-minimal. \
> +It is used to handle volatile storage in case of a read-only rootfs."
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +SRC_URI = "file://volatiles-readonly-minimal"
> +
> +PR = "r1"
> +
> +do_install () {
> +	install -d ${D}${sysconfdir}/default/volatiles
> +	install -m 0644 ${WORKDIR}/volatiles-readonly-minimal ${D}${sysconfdir}/default/volatiles/00_core_readonly
> +}
>


