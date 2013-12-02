Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E8D716DD10
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 23:38:33 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB2NcRjk017006; Mon, 2 Dec 2013 23:38:27 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LygrFmq4Z6Vd; Mon,  2 Dec 2013 23:38:27 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB2NcM2s016994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 2 Dec 2013 23:38:24 GMT
Message-ID: <1386027497.4463.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Mon, 02 Dec 2013 23:38:17 +0000
In-Reply-To: <529D17A4.9070209@windriver.com>
References: <1386025059.4463.6.camel@ted> <529D17A4.9070209@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFC: Locked down sstate cache usage
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
X-List-Received-Date: Mon, 02 Dec 2013 23:38:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-12-02 at 17:28 -0600, Mark Hatle wrote:
> On 12/2/13, 4:57 PM, Richard Purdie wrote:
> > I've been giving things some thought, specifically why sstate doesn't
> > get used more and why we have people requesting external toolchains. I'm
> > guessing the issue is that people don't like how often sstate can change
> > and the lack of an easy way to lock it down.
> 
> While I haven't fully looked into this.  I've got two cases where people want to 
> lock down the sstate.
> 
> The first is they simply want to lock it down, either what they're building is 
> in the sstate-cache --or-- it's an error.  (Then they could whitelist specific 
> items that they want built from source -- expecting these would be their custom 
> recipes.)

That would be easy enough to do from the sstate hash validation code
path since you can tell if it was found in the cache or not.

> The second is a case similar to what you have below, they want specific packages 
> to come from specific hashes.  My concern though is if the user changes 
> something to do with the signature(s), i.e. picks a different distribution flag 
> or something, which would normally cause a toolchain component to invalidate and 
> be rebuilt.  (In this case, I'd like a way to identify that they changed 
> something in an incompatible way.)  Not exactly sure how I would do that in this 
> case.

Well, you can call the main hash function and see what it returns,
compare it to the locked value and error if its different.

> > Locking it down is actually quite easy so I thought I'd share a quick
> > proof of concept of how you can do this (for example to a specific
> > toolchain). With an addition like this to local.conf (or wherever):
> >
> > SIGGEN_LOCKEDSIGS = "\
> > gcc-cross:do_populate_sysroot:a8d91b35b98e1494957a2ddaf4598956 \
> > eglibc:do_populate_sysroot:13e8c68553dc61f9d67564f13b9b2d67 \
> > eglibc:do_packagedata:bfca0db1782c719d373f8636282596ee \
> > gcc-cross:do_packagedata:4b601ff4f67601395ee49c46701122f6 \
> > "
> >
> > the code at the end of the email will force the hashes to those values
> > for the recipes mentioned. The system would then find and use those
> > specific objects from the sstate cache instead of trying to build
> > anything.
> >
> > Obviously this is a little simplistic, you might need to put an override
> > against this to only apply those revisions for a specific architecture
> > for example. You'd also probably want to put code in the sstate hash
> > validation code to ensure it really did install these from sstate since
> > if it didn't you'd want to abort the build.
> >
> > Anyhow, I thought I'd put this out there and see if there is interest in
> > better supporting this kind of usage of sstate?
> 
> If there was a simply way we could run a validation of specific options, and 
> then set the value to one of many? potential options that would work I think.

This is harder since its difficult to know which options to make fuzzy
and how they should be fuzzy. You'd probably be better off excluding the
specific options from the sstate cache signatures in the first place for
this to work.

Cheers,

Richard


