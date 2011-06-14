Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QWbAB-0003gV-Od for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 23:28:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5ELPI51018311
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 22:25:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17963-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 22:25:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5ELPAZh018302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 22:25:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
Date: Tue, 14 Jun 2011 22:24:48 +0100
Message-ID: <1308086688.15712.362.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V2] allarch.bbclass: Set FEED_ARCH to original value of BASE_PACKAGE_ARCH and then set BASE_PACKAGE_ARCH to 'all'
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
X-List-Received-Date: Tue, 14 Jun 2011 21:28:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-14 at 14:13 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/allarch.bbclass |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
> index e3ac392..b9ba28b 100644
> --- a/meta/classes/allarch.bbclass
> +++ b/meta/classes/allarch.bbclass
> @@ -2,9 +2,10 @@
>  # This class is used for architecture independent recipes/data files (usally scripts)
>  #
>  
> +# We need to pour the value of BASE_PACKAGE_ARCH into FEED_ARCH
> +# before we reset it
> +FEED_ARCH := ${BASE_PACKAGE_ARCH}
>  BASE_PACKAGE_ARCH = "all"
> -PACKAGE_ARCH = "all"
> -
>  # No need for virtual/libc or a cross compiler
>  INHIBIT_DEFAULT_DEPS = "1"

This is a *really* bad idea. An "all" package should have no need to set
architecture specific values into FEED_ARCH.

Just for those not following IRC, the problem is Angstrom adds FEED_ARCH
to OVERRIDES. Adding "all" to overrides turns out to do nasty things to
classes like rm_work with "_all" in the function names.
 
I'd suggest that various machines should start adding things like armv7a
to ${MACHINEOVERRIDES} which has a much more clearly defined scope and
that FEED_ARCH should quietly die ;-).

Cheers,

Richard




