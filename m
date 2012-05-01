Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SPG12-0001XN-Jh
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 18:33:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q41GNg3v016402
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 May 2012 09:23:42 -0700 (PDT)
Received: from wrlaptop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 1 May 2012 09:23:42 -0700
Date: Tue, 1 May 2012 11:23:18 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120501112318.6561f45d@wrlaptop>
In-Reply-To: <1335869234.7415.94.camel@ted>
References: <cover.1335815704.git.peter.seebach@windriver.com>
	<1a15132d9ff316a53f58764aad35bb09c5fbcf0e.1335815704.git.peter.seebach@windriver.com>
	<1335869234.7415.94.camel@ted>
X-Mailer: Claws Mail 3.7.8 (GTK+ 2.24.4; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] sanity.bbclass: Implement initial toolchain sanity checks
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
X-List-Received-Date: Tue, 01 May 2012 16:33:29 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Tue, 1 May 2012 11:47:14 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> > This patch also provides a whitelisting mechanism (which is
> > completely unused) to allow vendors providing prebuilt toolchain
> > components to restrict tunings to those based on or compatible with
> > a particular ABI.

^-- this will be referred back to later

> > +    if not tune or tune == "":
 
> "if not tune:"

Heh.  I do about 80% of my scripting work in Lua and Ruby these
days.  :)
 
> We'd usually have
> 
>    features = (data.getVar("TUNE_FEATURES_tune-%s" % tune, True) or
> "").split() if not features:
>        return "Tuning '%s' has no defined features, and cannot be
> used." % tune

Heh.  And here, again, I'm used to things in which "".split() would
have given me an array with a single empty string back, same as any
other string with no spaces in it.  :)

Looks like I have to do more experiments.
 
> > +    valid_tunes = data.getVarFlags('TUNEVALID') or ""
> > +    conflicts = data.getVarFlags('TUNECONFLICTS') or ""
 
> Hmm, shouldn't this be "or {}" ?

Yes.

> > +    whitelist = data.getVar("TUNEABI_WHITELIST", True) or ''
 
> So what is TUNEABI_WHITELIST?

See the last paragraph of the above.
 
> and what is TUNEABI_OVERRIDE? These should probably get the [doc] tags
> you add for other things.

Good catch.

> To be honest I'm really tempted to split this tuneabi stuff out into a
> different class. I appreciate the OSVs need something but it probably
> doesn't make sense with half an implementation sitting in the core
> like this, particularly when the code is near impenetrable like the
> above. I'm left wondering what TUNEABI is too...

The big reason I'd advocate for having it in the base stuff is that
otherwise, all the OSVs are going to do their own and do it
incompatibly.  The one thing worse than having one incomprehensible
thing is having many incomprehensible things with subtly different
semantics.
 
> > +                bb.warn("Got an unexpected '%s' in MULTILIBS." %
> > pairs[0])

> Shouldn't this get added to the errors list?

Good question!  I was unable to find anything definite on the topic.
My thought is, if everything has to be multilib:, there's no reason for
the leading multilib: because it adds no information, so presumably
there logically *could* be something else, but I haven't seen any and
don't know about them.

> > +            else:
> > +                if pairs[1] == 'lib':
> > +                    tune_error_set.append("The multilib 'lib' was
> > specified, but that causes parse errors.")

> Hmm, it does?

Yeah, that was the thing I ran into when I tried a default config
someone suggested; I thoughtfully corrected lib32 to lib, and libxcb
exploded with two pages of Python stack traces and diagnostics.  If
that's not intentional, I can drop this check and we can treat it as a
package bug.

> What we really want to check here is that each pair[1] value is
> unique.
> Again, I'd just add this to the error list. If someone really wants to
> do it, they can disable the checks. This should also happen if tune is
> used more than once.

Okay.  Good catch on that, hadn't thought of it.
 
> Just set these and skip "doc" in the above tests. Its ugly but I'd
> prefer to have them set than unset.

Okay.
 
> Can you split this patch into two so we can get the bits that were
> below in (they look fine) whilst we work on the above.

Yup.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


