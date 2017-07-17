Return-Path: <tomas@novotny.cz>
X-Greylist: delayed 456 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 17 Jul 2017 15:26:25 UTC
Received: from hosting.pavoucek.net (hosting.pavoucek.net [46.28.107.168])
	by mail.openembedded.org (Postfix) with ESMTP id 04EF662132
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 15:26:25 +0000 (UTC)
Received: from tomas.local.tbs-biometrics.cz (unknown [176.74.132.138])
	(Authenticated sender: tomas@novotny.cz)
	by hosting.pavoucek.net (Postfix) with ESMTPSA id 85C8E1038E9;
	Mon, 17 Jul 2017 17:18:48 +0200 (CEST)
Date: Mon, 17 Jul 2017 17:18:48 +0200
From: Tomas Novotny <tomas@novotny.cz>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20170717171848.4a8bdc07@tomas.local.tbs-biometrics.cz>
In-Reply-To: <20170717140450.5764-1-Martin.Jansa@gmail.com>
References: <20170717140450.5764-1-Martin.Jansa@gmail.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: icecc in OE (Was: [PATCH] icecc.bbclass: prevent nativesdk builds depending on target specific KERNEL_CC)
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
X-List-Received-Date: Mon, 17 Jul 2017 15:26:26 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Martin,

which version of icecc are you using?

We were trying 1.1rc2, but we had to patch icecc-create-env script in oe.

Tomas

On Mon, 17 Jul 2017 16:04:50 +0200
Martin Jansa <martin.jansa@gmail.com> wrote:

> * without this we cause nativesdk-linux-libc-headers to depend
>   on target specific KERNEL_CC (through icecc_get_tool ->
>   icecc_is_kernel -> KERNEL_CC -> HOST_CC_KERNEL_ARCH ->
>   TARGET_CC_KERNEL_ARCH -> TUNE_FEATURES(thumb) as shown by
>   bitbake-diffsigs:
> 
>   OE qemux86@ ~/build/oe-core $ ls /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/qemu*/*sdk*/*/*do_configure.sigdata*
>   /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/qemuarm/x86_64-nativesdk-oesdk-linux/nativesdk-linux-libc-headers/4.10-r0.do_configure.sigdata.3a9a423878d56524e0ee8e42eba1804f
>   /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/qemux86/x86_64-nativesdk-oesdk-linux/nativesdk-linux-libc-headers/4.10-r0.do_configure.sigdata.401071dbaa88903ece37d35a47965ff2
> 
>   OE qemux86@ ~/build/oe-core $ bitbake-diffsigs /OE/build/oe-core/tmp-glibc/sstate-diff/1499859497/qemu*/*sdk*/*/*do_configure.sigdata*
>   basehash changed from 39774238b66763c598153132e87a2c1a to aa2d66e770bf533e312536eb0a401c4c
>   Variable TARGET_CC_KERNEL_ARCH value changed from '${@bb.utils.contains('TUNE_FEATURES', 'thumb', '-mno-thumb-interwork-marm', '', d)} TUNE_FEATURES{thumb} = Set' to ''
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/icecc.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index 8a3308bdda..1cc1c4ddb0 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -42,6 +42,7 @@ def icecc_dep_prepend(d):
>  
>  DEPENDS_prepend += "${@icecc_dep_prepend(d)} "
>  
> +get_cross_kernel_cc[vardepsexclude] += "KERNEL_CC"
>  def get_cross_kernel_cc(bb,d):
>      kernel_cc = d.getVar('KERNEL_CC', False)
>  

