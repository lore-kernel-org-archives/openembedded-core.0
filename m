Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C21B6DD10
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 23:28:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB2NSixt010504
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Dec 2013 15:28:44 -0800 (PST)
Received: from msp-dhcp36.wrs.com (172.25.34.36) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 2 Dec 2013 15:28:43 -0800
Message-ID: <529D17A4.9070209@windriver.com>
Date: Mon, 2 Dec 2013 17:28:36 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1386025059.4463.6.camel@ted>
In-Reply-To: <1386025059.4463.6.camel@ted>
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
X-List-Received-Date: Mon, 02 Dec 2013 23:28:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/13, 4:57 PM, Richard Purdie wrote:
> I've been giving things some thought, specifically why sstate doesn't
> get used more and why we have people requesting external toolchains. I'm
> guessing the issue is that people don't like how often sstate can change
> and the lack of an easy way to lock it down.

While I haven't fully looked into this.  I've got two cases where people want to 
lock down the sstate.

The first is they simply want to lock it down, either what they're building is 
in the sstate-cache --or-- it's an error.  (Then they could whitelist specific 
items that they want built from source -- expecting these would be their custom 
recipes.)

The second is a case similar to what you have below, they want specific packages 
to come from specific hashes.  My concern though is if the user changes 
something to do with the signature(s), i.e. picks a different distribution flag 
or something, which would normally cause a toolchain component to invalidate and 
be rebuilt.  (In this case, I'd like a way to identify that they changed 
something in an incompatible way.)  Not exactly sure how I would do that in this 
case.

> Locking it down is actually quite easy so I thought I'd share a quick
> proof of concept of how you can do this (for example to a specific
> toolchain). With an addition like this to local.conf (or wherever):
>
> SIGGEN_LOCKEDSIGS = "\
> gcc-cross:do_populate_sysroot:a8d91b35b98e1494957a2ddaf4598956 \
> eglibc:do_populate_sysroot:13e8c68553dc61f9d67564f13b9b2d67 \
> eglibc:do_packagedata:bfca0db1782c719d373f8636282596ee \
> gcc-cross:do_packagedata:4b601ff4f67601395ee49c46701122f6 \
> "
>
> the code at the end of the email will force the hashes to those values
> for the recipes mentioned. The system would then find and use those
> specific objects from the sstate cache instead of trying to build
> anything.
>
> Obviously this is a little simplistic, you might need to put an override
> against this to only apply those revisions for a specific architecture
> for example. You'd also probably want to put code in the sstate hash
> validation code to ensure it really did install these from sstate since
> if it didn't you'd want to abort the build.
>
> Anyhow, I thought I'd put this out there and see if there is interest in
> better supporting this kind of usage of sstate?

If there was a simply way we could run a validation of specific options, and 
then set the value to one of many? potential options that would work I think.

--Mark

> Cheers,
>
> Richard
>
>
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 329c84d..fd015de 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -62,6 +62,16 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
>       # Default to keep dependencies
>       return True
>
> +def sstate_lockedsigs(d):
> +    sigs = {}
> +    lockedsigs = (d.getVar("SIGGEN_LOCKEDSIGS", True) or "").split()
> +    for ls in lockedsigs:
> +        pn, task, h = ls.split(":", 2)
> +        if pn not in sigs:
> +            sigs[pn] = {}
> +        sigs[pn][task] = h
> +    return sigs
> +
>   class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
>       name = "OEBasic"
>       def init_rundepcheck(self, data):
> @@ -76,9 +86,22 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>       def init_rundepcheck(self, data):
>           self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE", True) or "").split()
>           self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS", True) or "").split()
> +        self.lockedsigs = sstate_lockedsigs(data)
>           pass
>       def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
>           return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
> +    def get_taskhash(self, fn, task, deps, dataCache):
> +        recipename = dataCache.pkg_fn[fn]
> +        if recipename in self.lockedsigs:
> +            if task in self.lockedsigs[recipename]:
> +                k = fn + "." + task
> +                h = self.lockedsigs[recipename][task]
> +                self.taskhash[k] = h
> +                #bb.warn("Using %s %s %s" % (recipename, task, h))
> +                return h
> +        h = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskhash(fn, task, deps, dataCache)
> +        #bb.warn("%s %s %s" % (recipename, task, h))
> +        return h
>
>   # Insert these classes into siggen's namespace so it can see and select them
>   bb.siggen.SignatureGeneratorOEBasic = SignatureGeneratorOEBasic
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


