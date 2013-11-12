Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 5DED06D6F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 22:34:18 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VgMXL-0007nJ-Op; Tue, 12 Nov 2013 23:34:20 +0100
Message-ID: <1384299205.3828.29.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 12 Nov 2013 23:33:25 +0000
In-Reply-To: <1384270308.6460.11.camel@ted>
References: <1384270308.6460.11.camel@ted>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Tue, 2013-11-12 at 15:31 +0000,
	Richard Purdie wrote: >
	I also totalled the time in each task type,
	the output is below. The > numbers
	there are interesting as the strip patch seems to add 100s to >
	do_populate_sysroot.
	There doesn't seem to be a big difference in > compile time. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Confusing Performance Numbers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Nov 2013 22:34:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-12 at 15:31 +0000, Richard Purdie wrote:
> I also totalled the time in each task type, the output is below. The
> numbers there are interesting as the strip patch seems to add 100s to
> do_populate_sysroot. There doesn't seem to be a big difference in
> compile time.

That's probably to be expected: the amount of disk bandwidth you save by
not copying the symbols into the sysroot (and into sstate) is almost
certainly going to be outweighed by the time it takes to strip the files
in the first place.  So that set of numbers at least does seem
believable.

In theory at least, adding -Wl,-s to BUILD_LDFLAGS could give you the
stripping behaviour at lower cost since the linker could avoid writing
out the symbol table in the first place.  But I'm not entirely sure how
this option is actually implemented within the linker (or whether ld.bfd
and ld.gold do the same thing in that respect) and it's entirely
possible that it might be no better in practice.  

Using -march=native for natives is an interesting idea, though even if
this was a win on a single machine it might obviously be a net loss in
the presence of a shared sstate cache.  Of course, the vast majority of
-native binaries are run so seldom that their impact on the overall
build performance is going to be negligible: the ones that dominate are
going to be the toolchain.  One idea that I've seen suggested from time
to time (but never actually tried out) is that it might be a win under
some circumstances to do a 2-stage bootstrap of gcc-native and then use
that gcc-native to build gcc-cross as well as all other native packages.
If you were building everything from scratch every time then it's hard
to imagine this being a real benefit unless your distribution bundled
compiler was spectacularly rubbish, but if you assume that these gccs
will come out of sstate for most builds then it starts to seem more
plausible that this might be worth doing.

p.



