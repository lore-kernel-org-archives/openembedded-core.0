Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T1dmU-0006QP-4C for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 15:37:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7FDP6cI001477
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 14:25:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00388-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 14:25:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7FDOwtc001467
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 14:24:59 +0100
Message-ID: <1345037098.538.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2012 14:24:58 +0100
In-Reply-To: <501A8C5C.8090503@mentor.com>
References: <501A8C20.8020502@mentor.com> <501A8C5C.8090503@mentor.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] systemtap-uprobes: inhibit package strip
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
X-List-Received-Date: Wed, 15 Aug 2012 13:37:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-08-02 at 07:19 -0700, Wade Farnsworth wrote:
> uprobes.ko is not located in /lib/modules, so it fails the check in
> runstrip that ensures that only the debug section is stripped, leaving
> the symbols untouched.  This prevents the module from being inserted at
> run time.  Inhibiting package stripping fixes the problem.
> 
> Signed-off-by: Wade Farnsworth <wade_farnsworth@mentor.com>
> ---
>  .../systemtap/systemtap-uprobes_git.bb             |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
> index b328e6b..f135a54 100644
> --- a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
> @@ -9,6 +9,8 @@ PR = "r0"
>  # On systems without CONFIG_UTRACE, this package is empty.
>  ALLOW_EMPTY_${PN} = "1"
>  
> +INHIBIT_PACKAGE_STRIP = "1"
> +
>  inherit module-base gettext
>  
>  FILES_${PN} += "${datadir}/systemtap/runtime/uprobes"

I think we need to teach package.bbclass to identify kernel modules
better (.ko extension?) rather than hack around this for each external
module...

Cheers,

Richard



