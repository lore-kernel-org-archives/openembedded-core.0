Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1SgDh4-0000NG-26
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 13:30:58 +0200
Received: from ad.chargestorm.se (83.252.253.85) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server (TLS) id 8.3.245.1;
	Sun, 17 Jun 2012 13:19:05 +0200
Date: Sun, 17 Jun 2012 13:19:35 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20120617111934.GA9736@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <20120617090351.GA21623@ad.chargestorm.se>
	<1339925008.8481.3.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1339925008.8481.3.camel@ted>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
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
X-List-Received-Date: Sun, 17 Jun 2012 11:30:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Richard Purdie <richard.purdie@linuxfoundation.org> [120617 11:23]:
> On Sun, 2012-06-17 at 11:03 +0200, Anders Darander wrote:
> > I recently started to look at updating our internal repos using the
> > latest denzil updates.

> > However, this introduced parse errors for us. We got a bbappend for
> > qt4-embedded, which includes a number of lines like:

> > QT_CONFIG_FLAGS := "${@oe_filter_out('-plugin-gfx-transformed', 
> > '${QT_CONFIG_FLAGS}', d)}"

> > (this is to remove lots of features, both size-wise and to reduce build
> > time).

> > This work fine up to the original denzil release. Now I've run a bisect,
> > and found that our problems was introduced by "qt4: move functions from
> > python to shell style", commit id:
> > 98cb2efe4e9f3092d531c9fc809406c3ef559725.

> > After this commit, we get errors like:
> > $ bitbake core-image-sato -eLoading cache: 100%
> > |###################################################| ETA:  00:00:00
> > Loaded 1109 entries from dependency cache.
> > ERROR: Failure expanding variable QT_CONFIG_FLAGS[:=], expression was
> > ${@oe_filter_out('-plugin-gfx-transformed', '      -embedded ${QT_ARCH}

> Where is QT_ARCH coming from?

It comes from qt4_arch.inc along the rest of qt4. 

qt4-embedded.inc is adding this QT_ARCH to QT_CONFIG_FLAGS.

I probably should have mentioned that during bisecting, I was only using
oe-core (and bitbake 1.15.2), no other layers/distros. And I copied my
oe_filter_out line to the end of qt4-embedded_4.7.4.bb, all to make it
easier for you (or someone else) to reproduce, and also to remove the
possibillity of errors in my local layers and meta-oe.

> Looking at the way the code now works, I have a suspicion that we should
> change that to $QT_ARCH and that might fix your problem. I'm just
> guessing though.

Thanks, that solved the problem. Patch on it's way.

I could have sworn that I had tried that... but obviously not.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


