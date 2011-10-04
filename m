Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RB7E0-0007Eq-E5 for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 17:48:08 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94Fn2aK009458 for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 16:49:03 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rSydVBwHYILW
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 16:49:02 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94FmuFk009448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 16:48:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 04 Oct 2011 16:42:26 +0100
In-Reply-To: <1317740599.13337.43.camel@phil-desktop>
References: <1317660469.13337.16.camel@phil-desktop>
	<1317725702.14671.33.camel@ted>
	<1317740599.13337.43.camel@phil-desktop>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317742955.14671.62.camel@ted>
Mime-Version: 1.0
Subject: Re: sstate_clean() overzealous?
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
X-List-Received-Date: Tue, 04 Oct 2011 15:48:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-04 at 16:03 +0100, Phil Blundell wrote:
> On Tue, 2011-10-04 at 11:54 +0100, Richard Purdie wrote:
> > I think we need to teach this clean function about stamp-extra-info and
> > instead of stfile + ".*", remove stfile + ".*." + stamp-extra-info if
> > stamp-extra-info is set. That would likely fix the problem you're
> > seeing.
> 
> Okay, thanks.  I applied this change locally:
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 91f209a..7f38800 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -258,10 +258,15 @@ def sstate_clean(ss, d):
>              bb.utils.unlockfile(lock)
>  
>      stfile = d.getVar("STAMP", True) + ".do_" + ss['task']
> +    extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info')
>      oe.path.remove(stfile)
>      oe.path.remove(stfile + "_setscene")
> -    oe.path.remove(stfile + ".*")
> -    oe.path.remove(stfile + "_setscene" + ".*")
> +    if extrainf:
> +        oe.path.remove(stfile + ".*." + extrainf)
> +       oe.path.remove(stfile + "_setscene" + ".*." + extrainf)

Thinking further about this it may need to be ".*" instead of ".*.". I
suspect with the above it wouldn't be wiping out some of the stamps it
should be with OE-Core and the Basic siggen code. BasicHash would work
though.

Cheers,

Richard



