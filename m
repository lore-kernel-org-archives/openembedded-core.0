Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD8E60069
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Dec 2017 22:48:30 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vBAMmTE3022925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 10 Dec 2017 22:48:31 GMT
Message-ID: <1512946109.19417.136.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Haiqing Bai <Haiqing.Bai@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 10 Dec 2017 22:48:29 +0000
In-Reply-To: <1511938459-22871-1-git-send-email-Haiqing.Bai@windriver.com>
References: <1511938459-22871-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] gmp: depends on flex-native to fix parallel building issue
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
X-List-Received-Date: Sun, 10 Dec 2017 22:48:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-11-29 at 14:54 +0800, Haiqing Bai wrote:
> fix below parallel building issue:
> configure:27365: result: flex
> configure:27403: flex conftest.l
> .../sysroots/x86_64-linux/usr/bin/flex.real: No such file or
> directory
> configure:27407: $? = 127
> configure:27409: checking lex output file root
> configure:27420: error: cannot find output from flex; giving up
> 
> Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> ---
>  meta/recipes-support/gmp/gmp.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-
> support/gmp/gmp.inc
> index abac8cf..1b35eaa 100644
> --- a/meta/recipes-support/gmp/gmp.inc
> +++ b/meta/recipes-support/gmp/gmp.inc
> @@ -10,3 +10,5 @@ PACKAGECONFIG[readline] = "--with-readline=yes,
> --with-readline=no,readline"
>  
>  ARM_INSTRUCTION_SET_armv4 = "arm"
>  ARM_INSTRUCTION_SET_armv5 = "arm"
> +
> +DEPENDS = "flex-native"

With recipe specific sysroots this should now be deterministic. The log
above suggests you were not using recipe specific sysroots? This would
therefore only be applicable to morty and earlier?

Cheers,

Richard

