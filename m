Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q7YBq-0002GE-D6 for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 21:14:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p36JCeFL027222;
	Wed, 6 Apr 2011 20:12:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23922-06; Wed,  6 Apr 2011 20:12:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p36JCMTN027171
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 6 Apr 2011 20:12:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jeremy Puhlman <jpuhlman@mvista.com>
In-Reply-To: <4D9BA594.3030005@mvista.com>
References: <1302001365.24596.459.camel@rex>  <4D9BA594.3030005@mvista.com>
Date: Wed, 06 Apr 2011 11:53:06 -0700
Message-ID: <1302115986.22904.83.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Proposed Multilib Implementation Brainstorming
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
X-List-Received-Date: Wed, 06 Apr 2011 19:14:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-04-05 at 16:28 -0700, Jeremy Puhlman wrote:
> > 
> > To do this I'm thinking of a new set of include files of the form
> > conf/machine/include/multilib-xxxx.inc, similar in nature to the
> > tune-xxx.inc files. A given setup would include each of the multilibs it
> > requred. Each multilib include file would look something like:
> > 
> > conf/machine/include/multilib-x86-lib32.inc:
> > 
> > MULTILIBS += "lib32"
> > 
> > BASE_PACKAGE_ARCH_virtclass-multilib-lib32 = "core2-lib32"
> > TARGET_CC_ARCH_virtclass-multilib-lib32 = "-m32 -march=core2"
> > PACKAGE_EXTRA_ARCHS += "core2-lib32"
> > 
> > libdir_virtclass-multilib-lib32 = "${exec_prefix}/lib32"
> > base_libdir_virtclass-multilib-lib32 = "${base_prefix}/lib32"
> > 
> > i.e. use overrides to change the target cc architecture specifying the
> > required flags to the compiler and also alter the library paths as
> > required.
> > 
> > I'm envisaging passing an optional new parameter to classes in
> > BBCLASSEXTEND so for example the definition of a multilib could look
> > something like:
> > 
> > BBCLASSEXTEND_append = " multilib:x86-lib32"
> > 
> > and all the multilib class would need to do is to manipulation of
> > variables including OVERRIDES in a similar way to native.bbclass with
> > the complication of handling the parameter.
> 
> It is possible to do it with out changes to bitbake, but adding
> parametrization to BBCLASSEXTEND would be useful in a number of ways,
> and much more elegant then doing it with out it, and cleaner for that
> matter. Unrelated to multilib, would the full path to the sub parameters
> be configurable via the extended class? i.e. "conf/machine/include/" be
> a configurable value from the multilib class?

I've been thinking this would be the other way around. The act of adding
some conf/machine/include/* files would then trigger the inheritance of
the multilib class with the parameter specified at the point of the
inclusion.

> > For opkg there are multiple levels we can take the integration to. It
> > should be possible for example to install the "weaker" multilibs first,
> > then just install the stronger ones over the top, assuming any file
> > overwriting is ok and can be ignored. 
> 
> If there isn't any kind of compartmentalization of binaries(i.e. the
> alternate abi having a set of packages that only contian runtime libs),
> wouldn't this render the package management on opkg based systems post
> install largely useless other then just adding new components?

Its use case specific and I agree the above is hacky. It would be better
to have that option with known caveats that none at all though.

>  Most
> applications are getting better about it(openssl comes to mind), but
> some may still place arch specific headers in common locations. Many
> like openssl started switching over to arch wrapper headers, but there
> may be some stuff still lurking out there. Could probably be handled on
> a case by case basis.

Yes, we've going to have to watch for this kind of issue and get it
fixed as and where we find it.

> I have been kicking around a still broken POC implementation to this for
> a bit, but this is basically the line of thought(minus the
> parametrization of BBCLASSEXTEND) for a while on the subject. This looks
> mostly right to me.

Great, thanks for the feedback!

Cheers,

Richard



