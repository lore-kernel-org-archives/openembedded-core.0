Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 10ED777E4E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 08:16:02 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v8L8FvAb014940
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 21 Sep 2017 09:15:58 +0100
Message-ID: <1505981757.18640.155.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 09:15:57 +0100
In-Reply-To: <20170919182734.15741-2-sgw@linux.intel.com>
References: <20170919182734.15741-1-sgw@linux.intel.com>
	<20170919182734.15741-2-sgw@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/3] arch-x86: Add x86-x32 to MACHINEOVERRIDES
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
X-List-Received-Date: Thu, 21 Sep 2017 08:16:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-09-19 at 11:27 -0700, Saul Wold wrote:
> This is needed as an x32 more generic x32 override later in the
> OVERRIDES, currently linux-gnux32 is the first override, but we
> need a stronger (later in the list) x32 override to deal with some
> needed x32 dependency overrides.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/conf/machine/include/x86/arch-x86.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/conf/machine/include/x86/arch-x86.inc b/meta/conf/machine/include/x86/arch-x86.inc
> index e51d595f74..31d30b3304 100644
> --- a/meta/conf/machine/include/x86/arch-x86.inc
> +++ b/meta/conf/machine/include/x86/arch-x86.inc
> @@ -26,6 +26,7 @@ TUNE_LDARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-m elf32_x86_64',
>  TUNE_ASARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-x32', '', d)}"
>  # user mode qemu doesn't support x32
>  MACHINE_FEATURES_BACKFILL_CONSIDERED_append = " ${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'qemu-usermode', '', d)}"
> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x86_x32:', '' ,d)}"
>  
>  # ELF64 ABI
>  TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"

I was ok with this until I realised the patch does not do what it says
in the commit message, it adds "x86_x32", not "x86-x32". Since "_" is
the override modifier, I worry about how this reacts with the rest of
the system and I suspect its a bad idea. Is there a reason you didn't
use "x86-x32" (following the example of x86-64)?

Cheers,

Richard

