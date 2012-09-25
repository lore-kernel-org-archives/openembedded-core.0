Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TGUPG-0000Sh-DR for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 14:38:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8PCPecI008017;
	Tue, 25 Sep 2012 13:25:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07280-02; Tue, 25 Sep 2012 13:25:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8PCPW0L008011
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 25 Sep 2012 13:25:33 +0100
Message-ID: <1348575933.8662.48.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 25 Sep 2012 13:25:33 +0100
In-Reply-To: <1348570313-16920-1-git-send-email-Martin.Jansa@gmail.com>
References: <1348570313-16920-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] linux-yocto: drop machine from SRCREV_FORMAT
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
X-List-Received-Date: Tue, 25 Sep 2012 12:38:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-25 at 12:51 +0200, Martin Jansa wrote:
> * otherwise LOCALCOUNT is incremented after each MACHINE switch when 
>   machine usually has different SRCREV (e.g. because of different KBRANCH)
> * see http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/029392.html
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 973970d..6efb578 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE ?= "standard"
>  # KMETA ?= ""
>  KBRANCH ?= "master"
>  KMACHINE ?= "${MACHINE}"
> -SRCREV_FORMAT ?= "meta_machine" 
> +SRCREV_FORMAT ?= "meta" 
>  
>  LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"

No, absolutely not. I have discussed this with Bruce before and there
are no guarantees that the meta branch gets updated whenever machine
changes. This is necessary to have deterministic builds and correctness
of sstate for example.

Whatever the problem we're trying to fix here, we need to find a
different way. We probably need to fix the git LOCALCOUNT counters in
the fetcher instead.

Cheers,

Richard




