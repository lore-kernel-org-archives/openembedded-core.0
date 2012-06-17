Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SgBs9-0004pZ-4Y for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 11:34:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5H9NaRM027983
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2012 10:23:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18265-03 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2012 10:23:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5H9NRVv027977
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2012 10:23:28 +0100
Message-ID: <1339925008.8481.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jun 2012 10:23:28 +0100
In-Reply-To: <20120617090351.GA21623@ad.chargestorm.se>
References: <20120617090351.GA21623@ad.chargestorm.se>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Parse errors introduce by qt4 python->shell style functions
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
X-List-Received-Date: Sun, 17 Jun 2012 09:34:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-06-17 at 11:03 +0200, Anders Darander wrote:
> Hi,
> 
> I recently started to look at updating our internal repos using the
> latest denzil updates.
> 
> However, this introduced parse errors for us. We got a bbappend for
> qt4-embedded, which includes a number of lines like:
> 
> QT_CONFIG_FLAGS := "${@oe_filter_out('-plugin-gfx-transformed', 
> '${QT_CONFIG_FLAGS}', d)}"
> 
> (this is to remove lots of features, both size-wise and to reduce build
> time).
> 
> This work fine up to the original denzil release. Now I've run a bisect,
> and found that our problems was introduced by "qt4: move functions from
> python to shell style", commit id:
> 98cb2efe4e9f3092d531c9fc809406c3ef559725.
> 
> After this commit, we get errors like:
> $ bitbake core-image-sato -eLoading cache: 100%
> |###################################################| ETA:  00:00:00
> Loaded 1109 entries from dependency cache.
> ERROR: Failure expanding variable QT_CONFIG_FLAGS[:=], expression was
> ${@oe_filter_out('-plugin-gfx-transformed', '      -embedded ${QT_ARCH}

Where is QT_ARCH coming from?

Looking at the way the code now works, I have a suspicion that we should
change that to $QT_ARCH and that might fix your problem. I'm just
guessing though.

Cheers,

Richard



