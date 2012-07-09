Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SoHSY-0005oi-Dy for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:09:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q69Gw9aq009112
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 17:58:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09062-02 for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2012 17:58:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q69Gw1d8009106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 17:58:02 +0100
Message-ID: <1341853082.8066.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 09 Jul 2012 17:58:02 +0100
In-Reply-To: <alpine.DEB.2.02.1207070629090.18029@oneiric>
References: <alpine.DEB.2.02.1207070629090.18029@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: FETCHCMD versus FETCHCOMMAND
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
X-List-Received-Date: Mon, 09 Jul 2012 17:09:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-07-07 at 06:33 -0400, Robert P. J. Day wrote:
> just noticed the following as i was still poking around with
> fetchers:
> 
> $ grep -r FETCHCMD * | grep -v pyc
> bitbake/lib/bb/fetch2/hg.py:        basecmd = data.expand('${FETCHCMD_hg}', d)
> bitbake/lib/bb/fetch2/svn.py:        ud.basecmd = d.getVar('FETCHCMD_svn', True)
> bitbake/lib/bb/fetch2/osc.py:        basecmd = data.expand('${FETCHCMD_osc}', d)
> bitbake/lib/bb/fetch2/git.py:        ud.basecmd = data.getVar("FETCHCMD_git", d, True) or "git"
> bitbake/lib/bb/fetch2/git.py:        basecmd = data.getVar("FETCHCMD_git", d, True) or "git"
> bitbake/lib/bb/fetch2/git.py:        basecmd = data.getVar("FETCHCMD_git", d, True) or "git"
> bitbake/lib/bb/fetch2/bzr.py:        basecmd = data.expand('${FETCHCMD_bzr}', d)
> bitbake/ChangeLog:	  (requires new FETCHCMD_svn definition in bitbake.conf)
> meta/conf/bitbake.conf:FETCHCMD_svn = "/usr/bin/env svn"
> meta/conf/bitbake.conf:FETCHCMD_cvs = "/usr/bin/env cvs"
> meta/conf/bitbake.conf:FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 -nv --no-check-certificate"
> meta/conf/bitbake.conf:FETCHCMD_bzr = "/usr/bin/env bzr"
> meta/conf/bitbake.conf:FETCHCMD_hg = "/usr/bin/env hg"
> $
> 
>   i can see that FETCHCMD represent the "base" fetch command for each
> fetcher, i also notice that there isn't a perfect correspondence
> between the fetchers and bitbake.conf.
> 
>   for example, there's no definition of FETCHCMD_osc even though
> osc.py checks for it.  conversely, bitbake.conf sets FETCHCMD_cvs even
> though the cvs.py fetcher never bothers to check it.
> 
>   nothing wrong with any of that, just an observation about
> consistency.

Thanks for the reminder. The idea was to drop the COMMAND versions in
favour of the CMD ones. I've just sent out a series of patches which
would complete that work.

We're probably heading to a point where the fetchers have sane defaults
encoded and we remove the bitbake.conf settings entirely for the default
case just allowing the user to override if ever needed.

Cheers,

Richard



