Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id A8FE065CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 08:06:01 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 9F31668A01C; Tue, 19 Jul 2016 09:06:01 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id EE37A68A019;
	Tue, 19 Jul 2016 09:05:58 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 52E27674036E;
	Tue, 19 Jul 2016 10:05:58 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <1468876796-16026-1-git-send-email-clopez@igalia.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <578DDF66.7030600@mlbassoc.com>
Date: Tue, 19 Jul 2016 10:05:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1468876796-16026-1-git-send-email-clopez@igalia.com>
Subject: Re: [PATCH] webkitgtk: Switch the ARMv7 build to Thumb2 and enable back the JSC JIT.
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
X-List-Received-Date: Tue, 19 Jul 2016 08:06:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-07-18 23:19, Carlos Alberto Lopez Perez wrote:
> * The JSC JIT is broken on ARMv7 without Thumb2.
>
> [YOCTO #9474]
>
> Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>

Works on my i.MX6Q target!

Acked-by: Gary Thomas <gary@mlbassoc.com>

> ---
>   meta/recipes-sato/webkit/webkitgtk_2.12.3.bb | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
> index c5e5432..536fa23 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
> @@ -71,10 +71,6 @@ EXTRA_OECMAKE_append_armv5 = " -DENABLE_JIT=OFF "
>   EXTRA_OECMAKE_append_armv6 = " -DENABLE_JIT=OFF "
>   EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
>
> -# ARM JIT can build on armv7a, but doesnt' work on runtime, cause
> -# displaying problems or ephiphany hang.
> -EXTRA_OECMAKE_append_armv7a = " -DENABLE_JIT=OFF "
> -
>   # binutils 2.25.1 has a bug on aarch64:
>   # https://sourceware.org/bugzilla/show_bug.cgi?id=18430
>   EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
> @@ -89,7 +85,18 @@ SECURITY_CFLAGS_append_aarch64 = " -fPIE"
>   FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbundle.so"
>
>   # http://errors.yoctoproject.org/Errors/Details/20370/
> -ARM_INSTRUCTION_SET = "arm"
> +ARM_INSTRUCTION_SET_armv4 = "arm"
> +ARM_INSTRUCTION_SET_armv5 = "arm"
> +ARM_INSTRUCTION_SET_armv6 = "arm"
> +
> +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=9474
> +# https://bugs.webkit.org/show_bug.cgi?id=159880
> +# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
> +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mthumb).
> +ARM_INSTRUCTION_SET_armv7a = "thumb"
> +ARM_INSTRUCTION_SET_armv7r = "thumb"
> +ARM_INSTRUCTION_SET_armv7m = "thumb"
> +ARM_INSTRUCTION_SET_armv7ve = "thumb"
>
>   # Invalid data memory access: 0x00000000
>   # ...
>


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

