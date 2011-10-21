Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RHGRu-0006ZY-TF
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 16:51:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9LEjxcX014199
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 07:45:59 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 21 Oct 2011 07:45:59 -0700
Message-ID: <4EA185A6.3050103@windriver.com>
Date: Fri, 21 Oct 2011 09:45:58 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
	<22ed6acc0a44d9bc0d6f7a2e800c039d77d75477.1319184832.git.Martin.Jansa@gmail.com>
In-Reply-To: <22ed6acc0a44d9bc0d6f7a2e800c039d77d75477.1319184832.git.Martin.Jansa@gmail.com>
Subject: Re: [PATCH 2/8] libatomics-ops: force ARM mode
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
X-List-Received-Date: Fri, 21 Oct 2011 14:51:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 10/21/11 3:17 AM, Martin Jansa wrote:
> * otherwise ie spitz (armv5te) build fails with:
> | make[3]: Entering directory `/OE/shr-core/tmp/work/armv5te-oe-linux-gnueabi/libatomics-ops-1.2-r5/libatomic_ops-1.2/src'
> | arm-oe-linux-gnueabi-gcc  -march=armv5te  -mthumb -mthumb-interwork  -mtune=xscale --sysroot=/OE/shr-core/tmp/sysroots/spitz -DHAVE_CONFIG_H -I.    -fPIC -O
> 2 -pipe -g -feliminate-unused-debug-types -DNDEBUG -c atomic_ops.c
> | arm-oe-linux-gnueabi-gcc  -march=armv5te  -mthumb -mthumb-interwork  -mtune=xscale --sysroot=/OE/shr-core/tmp/sysroots/spitz -DHAVE_CONFIG_H -I.    -fPIC -O
> 2 -pipe -g -feliminate-unused-debug-types -DNDEBUG -c atomic_ops_stack.c
> | arm-oe-linux-gnueabi-gcc  -march=armv5te  -mthumb -mthumb-interwork  -mtune=xscale --sysroot=/OE/shr-core/tmp/sysroots/spitz -DHAVE_CONFIG_H -I.    -fPIC -O
> 2 -pipe -g -feliminate-unused-debug-types -DNDEBUG -c atomic_ops_malloc.c
> | atomic_ops_malloc.c: In function 'msb':
> | atomic_ops_malloc.c:223:2: warning: right shift count >= width of type [enabled by default]
> | rm -f libatomic_ops_gpl.a
> | ar cru libatomic_ops_gpl.a atomic_ops_stack.o atomic_ops_malloc.o
> | arm-oe-linux-gnueabi-ranlib libatomic_ops_gpl.a
> | {standard input}: Assembler messages:
> | {standard input}:286: Error: selected processor does not support Thumb mode `swp r1,r2,[r3]'
> | {standard input}:329: Error: selected processor does not support Thumb mode `swp r0,r1,[r3]'
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../pulseaudio/libatomics-ops_1.2.bb               |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
> index 05b22e8..4d9ca0d 100644
> --- a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
> +++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
> @@ -20,4 +20,6 @@ S = "${WORKDIR}/libatomic_ops-${PV}"
>  
>  ALLOW_EMPTY_${PN} = "1"
>  
> +ARM_INSTRUCTION_SET = "arm"
> +
>  inherit autotools pkgconfig

Wouldn't it be better to fix libatomic-ops to have proper thumb mode assembly,
then fall back to non-thumb assembly?

I swear I had a patch to do this in the past, but I'm currently not able to find it.

--Mark


