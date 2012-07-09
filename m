Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGvV-0003sB-7x
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:35:09 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Jul 2012 09:23:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120388981"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Jul 2012 09:23:40 -0700
Message-ID: <4FFB058C.6070806@linux.intel.com>
Date: Mon, 09 Jul 2012 09:23:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341605280-32431-1-git-send-email-msm@freescale.com>
In-Reply-To: <1341605280-32431-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH] packagedata.py: Fix get_subpkgedata_fn for multilib
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
X-List-Received-Date: Mon, 09 Jul 2012 16:35:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/06/2012 01:08 PM, Matthew McClintock wrote:
> This happens when tryng to add libgcc-dev to as a multilib package
> (e.g. IMAGE_INSTALL_append = " lib32-libgcc-dev")
>
> | Processing task-core-boot...
> | Processing fman-ucode...
> | Processing dosfstools...
> | Processing lib32-libgcc-dev...
> | Unable to find package lib32-libgcc-dev (libgcc-dev)!
> NOTE: package fsl-image-full-1.0-r1.1.3.6: task do_rootfs: Failed
>
> RPM (or bitbake?) is looking in the tmp/pkgdata, however some of these file
> paths are mungned for the multilib scenario:
>
> $ find tmp/pkgdata/ | grep libgcc-dev$
> tmp/pkgdata/ppce5500-fsl-linux/runtime/lib32-libgcc-dev
> tmp/pkgdata/ppc64e5500-fsl-linux/runtime/libgcc-dev
>
> This patch fixes where we look for these files so they can be found and
> properly installed for the multilib root file system
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>   meta/lib/oe/packagedata.py |    8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
> index a7a40f0..9a28e6b 100644
> --- a/meta/lib/oe/packagedata.py
> +++ b/meta/lib/oe/packagedata.py
> @@ -27,6 +27,14 @@ def read_pkgdatafile(fn):
>
>   def get_subpkgedata_fn(pkg, d):
>       archs = d.expand("${PACKAGE_ARCHS}").split(" ")
> +    mlarchs = d.getVar("MULTILIB_PACKAGE_ARCHS", d) or None
> +
> +    if mlarchs:
> +        for mlarch in mlarchs.split(" "):
> +            if "_" in mlarch:
> +                prefix, split, new_arch = mlarch.partition("_")
> +                archs.append(new_arch)
> +
>       archs.reverse()
>       pkgdata = d.expand('${TMPDIR}/pkgdata/')
>       targetdir = d.expand('${TARGET_VENDOR}-${TARGET_OS}/runtime/')
>

Merged into OE-Core

Thanks
	Sau!


