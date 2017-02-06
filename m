Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AA31C71997
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 14:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v16ERETI010158; Mon, 6 Feb 2017 14:27:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MqUFXNSnI63R; Mon,  6 Feb 2017 14:27:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v16ERAOi010151
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 6 Feb 2017 14:27:11 GMT
Message-ID: <1486391230.14144.82.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>, openembedded-core@lists.openembedded.org
Date: Mon, 06 Feb 2017 14:27:10 +0000
In-Reply-To: <1486388525.22715.2.camel@pbcl.net>
References: <1486120259.13882.26.camel@pbcl.net>
	<1486120807.14144.68.camel@linuxfoundation.org>
	<1486124973.13882.29.camel@pbcl.net>
	<1486388525.22715.2.camel@pbcl.net>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: RSS difficulties
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
X-List-Received-Date: Mon, 06 Feb 2017 14:27:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-02-06 at 13:42 +0000, Phil Blundell wrote:
> On Fri, 2017-02-03 at 12:29 +0000, Phil Blundell wrote:
> > Ah, right, thanks.  The particular piece of magic I was missing
> > was:
> > 
> >             # Nothing need depend on libc-initial/gcc-cross-initial
> >             if "-initial" in taskdependees[task][0]:
> >                 continue
> > 
> > which I think explains all the difficulties I was having.
> Actually, that explains most of my difficulties but not all of them.
> The remaining ones seem to come down to missing dependencies but I am
> not quite clear on why the dependencies are missing.
> 
> The problematic recipes are Java ones. The Java toolchain, as you
> might expect, has a fairly complicated dependency tree but
> essentially:
> 
> - any Java package has DEPENDS = "virtual/javac-native", which is
> PROVIDEd by ecj-bootstrap-native.bb
> 
> - ecj-bootstrap-native.bb is basically just a wrapper script which
> runs the Java compiler. The actual compiler implementation is in
> libecj-bootstrap-native.bb and ecj-bootstrap-native.bb RDEPENDS on
> that.
> 
> If I run "bitbake -D -D ..." then I see:
> 
> DEBUG: Added runtime dependencies ['libecj-bootstrap-native'] for
> .../meta-java/recipes-core/ecj/ecj-bootstrap-native.bb
> 
> but this dependency edge doesn't show up in task-depends.dot and,
> sure enough, libecj-bootstrap-native isn't getting installed into the
> recipe-sysroot.
> 
> Is there some other piece of logic that is squashing these
> dependencies? Or is there somewhere else that I ought to be looking
> for them?

If its not in task-depends.dot, there is a much higher level problem
with bitbake itself not seeing the dependencies before sstate/RSS gets
anywhere near them.

I'm going to guess its some combination of -native and RDEPENDS
together which are known to not work entirely "correctly".

Some example open bugs:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10113
https://bugzilla.yoctoproject.org/show_bug.cgi?id=6317

The trouble is that for native, PACKAGES = "" so how would bitbake
known which RDEPENDS_<pkg> to look at? What exists today is all a bit
of a hack which works for our common cases but has problems. I've been
meaning to find time to take a good look at it and come up with a
proper plan but so far it hasn't made the top of the agenda.

What happens if you set DEPENDS?

Cheers,

Richard




