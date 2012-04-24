Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SMbsM-00067M-N7 for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 11:17:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3O980Hr005526;
	Tue, 24 Apr 2012 10:08:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04928-03; Tue, 24 Apr 2012 10:07:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3O97r2K005520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 Apr 2012 10:07:54 +0100
Message-ID: <1335258474.12692.112.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 24 Apr 2012 10:07:54 +0100
In-Reply-To: <3A2828E0-62CF-45BC-ABE9-5A41755B0C90@dominion.thruhere.net>
References: <4F8AC160.7020405@kth.se>
	<44025B47-33F8-44B8-94A1-2C8E8B866C1E@dominion.thruhere.net>
	<9301829E-837E-4C49-A3B8-57208CE9A196@dominion.thruhere.net>
	<3A2828E0-62CF-45BC-ABE9-5A41755B0C90@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: [Angstrom-devel] Python library hashlib is missig hash-code.
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
X-List-Received-Date: Tue, 24 Apr 2012 09:17:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-23 at 15:08 +0200, Koen Kooi wrote:
> Op 23 apr. 2012, om 10:15 heeft Koen Kooi het volgende geschreven:
> 
> > Op 15 apr. 2012, om 16:35 heeft Koen Kooi het volgende geschreven:
> > 
> >> My theory is that this is caused by the openssl /usr changes, can
> anyone confirm or deny that?
> > 
> > I dug into this. The breakage was recorded by buildhistory:
> 
> [..]
> 
> > I'm going to band-aid it so we can get a working python hashlib
> module in the 'denzil' branch, hopefully someone will come up with a
> proper fix soon.
> 
> After spending some more time on this and getting a ton of help from
> RP:
> 
> Python can't link to anything in ${base_libdir} due to a combination
> of python having a stupid buildsystem and the patches we apply to make
> it less stupid. The only fix I found to get hashlib and ssl to work in
> python is to revert the patch to openssl that moves libcrypto around.
> 
> I really need python unbroken in the release branch, so I see a few
> scenarios:
> 
> 1) revert openssl patch, seperate /usr doesn't work properly anyway in
> this release
> 2) fix python
> 3) revert openssl patch, statically link libcrypto into dhclient.
> 4) bbappend openssl in meta-angstrom to revert the openssl patch
> 
> There are probably more scenarios, but I'm going to have lunch before
> thinking some more about it. My question to all of you:
> 
> 	How do you want to fix this for denzil and how do you want to fix
> this for master?
> 
> And to be clear: I'm mean getting things into the denzil branch of
> OE-core, not getting it into the release, it's too late for that.

I've managed to squeeze a fix for this in, I posted the patches last
night. It wasn't just the ssl piece that was broken, there were a number
of problems in the python recipe causing various modules to fail to
build (such as curses and readline). Some of these issues had been
present for much longer than the openssl change.

Its worth noting the openssl change was not the problem, it was python
passing native paths to a cross-gcc which then understandably got
confused.

At this point the release is pretty much done, assuming a favourable QA
report.

Cheers,

Richard





