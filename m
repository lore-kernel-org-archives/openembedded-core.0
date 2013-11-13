Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 24AEA6D817
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 18:28:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2013 10:24:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="434749966"
Received: from unknown (HELO [10.255.15.132]) ([10.255.15.132])
	by orsmga002.jf.intel.com with ESMTP; 13 Nov 2013 10:28:26 -0800
Message-ID: <5283C4CA.2020400@linux.intel.com>
Date: Wed, 13 Nov 2013 10:28:26 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Ming Liu <ming.liu@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1384330547-1638-1-git-send-email-ming.liu@windriver.com>
In-Reply-To: <1384330547-1638-1-git-send-email-ming.liu@windriver.com>
Subject: Re: [PATCH] qemu: explicitly disable xen support
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
X-List-Received-Date: Wed, 13 Nov 2013 18:28:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2013 12:15 AM, Ming Liu wrote:
> We don't make use of xen and when building on Ubuntu 13.04 when
> libxen-dev is installed on the build host you will get errors like the
> following:
>
> | /usr/include/x86_64-linux-gnu/bits/string3.h:81: warning: memset used with constant zero length parameter; this could be due to transposed parameters
> | /usr/lib/gcc/x86_64-linux-gnu/4.7/../../../../lib/libxenguest.so: undefined reference to `lzma_alone_decoder@XZ_5.0'
> | /usr/lib/gcc/x86_64-linux-gnu/4.7/../../../../lib/libxenguest.so: undefined reference to `lzma_code@XZ_5.0'
> | /usr/lib/gcc/x86_64-linux-gnu/4.7/../../../../lib/libxenguest.so: undefined reference to `lzma_stream_decoder@XZ_5.0'
> | /usr/lib/gcc/x86_64-linux-gnu/4.7/../../../../lib/libxenguest.so: undefined reference to `lzma_end@XZ_5.0'
>
> This change disables xen for both -native and target packages but
> since it is a PACKAGECONFIG a user could tune this to have xen support
> in the target package.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 702fe01..95a3aa3 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -79,6 +79,7 @@ do_install_append() {
>   PACKAGECONFIG ??= ""
>   PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
>   PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
> +PACKAGECONFIG[xen] = "--enable-xen, --disable-xen,,"
>
If enabled what dependencies or rdepends does it need?  liblzma seems 
like it might be one.

Sau!

>   # Qemu target will not build in world build for ARM or Mips
>   BROKEN_qemuarm = "1"
>

