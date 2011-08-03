Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QoemK-0002ff-W2 for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 18:58:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73GsNPc027725
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 17:54:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27670-02 for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2011 17:54:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73GsIwq027719
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 17:54:18 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312349222-27254-1-git-send-email-galak@kernel.crashing.org>
References: <1312349222-27254-1-git-send-email-galak@kernel.crashing.org>
Date: Wed, 03 Aug 2011 17:53:59 +0100
Message-ID: <1312390439.2344.706.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2] image-mklibs.bbclass: Add powerpc64 arch support
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
X-List-Received-Date: Wed, 03 Aug 2011 16:58:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-03 at 00:27 -0500, Kumar Gala wrote:
> powerp64 dynamic loader is 'ld64.so.1'.
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
> * Use correct name of ppc64 dynamic loader
> * user ${baselib} so if we are /lib or /lib64 things work
> 
>  meta/classes/image-mklibs.bbclass |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
> index 9f5a4ea..83f609c 100644
> --- a/meta/classes/image-mklibs.bbclass
> +++ b/meta/classes/image-mklibs.bbclass
> @@ -19,6 +19,9 @@ mklibs_optimize_image_doit() {
>  		powerpc | mips | microblaze )
>  			dynamic_loader="/lib/ld.so.1"
>  			;;
> +		powerpc64)
> +			dynamic_loader="/${baselib}/ld64.so.1"
> +			;;
>  		x86_64)
>  			dynamic_loader="/lib/ld-linux-x86-64.so.2"
>  			;;

Can we use ${base_libdir} there please?

${baselib} is really intended only for use to build the other
expressions.

We should probably use ${base_libdir} elsewhere in this file too. I also
suspect prelinking of a multilib image may need work :/.

Cheers,

Richard



