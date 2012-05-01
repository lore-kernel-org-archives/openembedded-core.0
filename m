Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SPJfL-0006KR-Ud for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 22:27:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q41KHavi016884;
	Tue, 1 May 2012 21:17:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16443-04; Tue,  1 May 2012 21:17:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q41KHPLp016878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 1 May 2012 21:17:27 +0100
Message-ID: <1335903448.7415.134.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Seebach <peter.seebach@windriver.com>
Date: Tue, 01 May 2012 21:17:28 +0100
In-Reply-To: <20120501112318.6561f45d@wrlaptop>
References: <cover.1335815704.git.peter.seebach@windriver.com>
	<1a15132d9ff316a53f58764aad35bb09c5fbcf0e.1335815704.git.peter.seebach@windriver.com>
	<1335869234.7415.94.camel@ted> <20120501112318.6561f45d@wrlaptop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 01 May 2012 20:27:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-05-01 at 11:23 -0500, Peter Seebach wrote:
> On Tue, 1 May 2012 11:47:14 +0100
> Richard Purdie <richard.purdie@linuxfoundation.org> wrote: 
> > To be honest I'm really tempted to split this tuneabi stuff out into a
> > different class. I appreciate the OSVs need something but it probably
> > doesn't make sense with half an implementation sitting in the core
> > like this, particularly when the code is near impenetrable like the
> > above. I'm left wondering what TUNEABI is too...
> 
> The big reason I'd advocate for having it in the base stuff is that
> otherwise, all the OSVs are going to do their own and do it
> incompatibly.  The one thing worse than having one incomprehensible
> thing is having many incomprehensible things with subtly different
> semantics.
>  
> > > +                bb.warn("Got an unexpected '%s' in MULTILIBS." %
> > > pairs[0])
> 
> > Shouldn't this get added to the errors list?
> 
> Good question!  I was unable to find anything definite on the topic.
> My thought is, if everything has to be multilib:, there's no reason for
> the leading multilib: because it adds no information, so presumably
> there logically *could* be something else, but I haven't seen any and
> don't know about them.

Ah, I see what's happened here. This variable is used to append to
BBCLASSEXTEND where there are other values like "nativesdk" and
"native". Looking at the code, I think you should process
MULTILIB_VARIANTS.

The naming of the various multilib variables could probably do with
improvement in places :/.

Another good sanity check might be to look at the BBCLASSEXTEND values
and ensure they're in the list "native", "nativesdk", "multilib:xxx",
"cross".

> > > +            else:
> > > +                if pairs[1] == 'lib':
> > > +                    tune_error_set.append("The multilib 'lib' was
> > > specified, but that causes parse errors.")
> 
> > Hmm, it does?
> 
> Yeah, that was the thing I ran into when I tried a default config
> someone suggested; I thoughtfully corrected lib32 to lib, and libxcb
> exploded with two pages of Python stack traces and diagnostics.  If
> that's not intentional, I can drop this check and we can treat it as a
> package bug.

I think its a packaging bug. I'd be interested to see the error.

Cheers,

Richard



