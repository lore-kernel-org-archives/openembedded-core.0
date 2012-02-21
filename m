Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RzylC-0004ms-QA for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 00:04:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1LMuJXo021166
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 22:56:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20289-10 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 22:56:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1LMu9es021160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 22:56:10 GMT
Message-ID: <1329864969.20261.89.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2012 22:56:09 +0000
In-Reply-To: <4F441BF1.6090404@mlbassoc.com>
References: <1329861809.20261.68.camel@ted> <4F441BF1.6090404@mlbassoc.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Heads up: basichash being enabled for poky by default
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
X-List-Received-Date: Tue, 21 Feb 2012 23:04:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-21 at 15:34 -0700, Gary Thomas wrote:
> On 2012-02-21 15:03, Richard Purdie wrote:
> > If you're not ready for the change, you can still set:
> >
> > BB_SIGNATURE_HANDLER = 'OEBasic'
> >
> > to get the existing behaviour either at a local or distro level. The
> > difference is one will include the sstate hash in the files in
> > tmp/stamps/*. This means if the hash changes, it gets rebuilt.
> >
> > As a result of this commit your tree will rebuild. I'll bump the TMPDIR
> > ABI version number at the same time so people more easily spot the
> > change and can either revert or continue at their choice.
> 
> For those of us not using DISTRO=poky, what are the pros & cons
> of the various signature handler settings?

In gory details terms, there are five options:

unset, "basic", "basichash", "OEBasic", "OEBasicHash"

Which reminds me that the patch I linked to is wrong and we'll be
switching to OEBasicHash. See below for the difference.

I'd suggest people only care about OEBasic (the current default
everywhere) and OEBasicHash.

We need some kind of hash generator for sstate. Since sstate is now
mandatory, having a siggen is also mandatory so the unset option isn't
useful for OE-Core but was there for compatibility with OE-classic.

The difference between the OE and plain variants is that the OE versions
live in meta/lib/oe/sstatesig.py instead of bitbake. You can see they
inherit the basic versions and make some specific tweaks to the
dependency tree (like ignoring changes in quilt-native so do_patch
doesn't get rerun when quilt-native changes). This also shows how you
could plug in a completely different custom signature generator.

The difference between basic and basichash is that basic hash injects
the signatures into the files in tmp/stamps/. This means things will
rebuild when any hash changes, removing the manual PR bump process and
making things much more deterministic and consistent with the sstate
packages. It likely will rebuild more than you want it to in some cases
though.

Does that make things clearer?

Cheers,

Richard







