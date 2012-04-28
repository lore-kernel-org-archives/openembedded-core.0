Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1SO8qz-0002iQ-Pf
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2012 16:42:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3SEWlwi026325
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 28 Apr 2012 07:32:47 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.23.38) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sat, 28 Apr 2012 07:32:46 -0700
Message-ID: <4F9BFF8D.6040702@windriver.com>
Date: Sat, 28 Apr 2012 10:32:45 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
References: <1335513988-4447-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1335513988-4447-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Koen Kooi <martin.jansa@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] kernel bbclass: recreate uImage unless	KEEPUIMAGE is set
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
X-List-Received-Date: Sat, 28 Apr 2012 14:42:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-04-27 4:06 AM, Koen Kooi wrote:
> The intent of the uImage code in this class includes the following
>
> 1) be able to specify custom load addresses without needing to patch the kernel
> 2) add better information to the uImage description field
>
> The current state is a NOP anyway, the kernel will always build a uImage when you tell it to 'make uImage'.
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta-oe/classes/kernel.bbclass |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
> index b7e9f54..98320fe 100644
> --- a/meta-oe/classes/kernel.bbclass
> +++ b/meta-oe/classes/kernel.bbclass
> @@ -512,7 +512,7 @@ KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
>
>   do_uboot_mkimage() {
>   	if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
> -		if test ! -e arch/${ARCH}/boot/uImage ; then
> +		if test "x${KEEPUIMAGE}" = "x" ; then

I realize this is targeted meta-oe, and not directly to oe-core (but
openembedded-core is cc'd + it's Saturday morning with no coffee here
yet which means I may be misreading) .. so I thought I'd comment as
this whizzed past.

The existing users on top of the oe-core class expect (whether they
know it or not) the opposite of this (i.e. do nothing, get the kernel's
uImage). To keep their old behaviour, they now need to explicitly set a
flag. I know that I'd have quite a few layers to update if this went
directly into oe-core.

How are the current meta-oe and related BSPs currently overriding
the behaviour (I didn't go look, I'm invoking my Saturday morning clause
again :) ? Is it a class override ? If so, can the layers that
currently have an override set a flag (which is a simpler override) to
get the behaviour they used to have, while leaving the boards with no
override the behaviour that they used to have ?

Cheers,

Bruce

>   			ENTRYPOINT=${UBOOT_ENTRYPOINT}
>   			if test -n "${UBOOT_ENTRYSYMBOL}"; then
>   				ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \



