Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiTje-0004CX-V2 for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 17:30:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04GNM1J020860;
	Wed, 4 Jan 2012 16:23:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20732-02; Wed,  4 Jan 2012 16:23:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04GNE6Y020854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 4 Jan 2012 16:23:15 GMT
Message-ID: <1325694194.20759.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Colin Walters <walters@verbum.org>
Date: Wed, 04 Jan 2012 16:23:14 +0000
In-Reply-To: <1325642890.24646.8.camel@lenny>
References: <1325642890.24646.8.camel@lenny>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky@yoctoproject.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky] -dev RPM packages Require:ing all of their bitbake build dependences
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
X-List-Received-Date: Wed, 04 Jan 2012 16:30:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-03 at 21:08 -0500, Colin Walters wrote:
> I'm trying to use Yocto to generate a target which has standard build
> tools like gcc, make, the glibc headers etc.
> 
> In theory, this is solved by task-core-sdk, but I ran into the issue
> that "pkg-config-dev" contains pkg.m4 which is obviously necessary for
> building anything that uses pkg-config and the autotools.  The further
> issue is that OE has a rule that -dev packages Require: all of the RPMs
> used to build the recipie.
> 
> In the case of pkgconfig-dev, that pulls in libglib-2.0-dev which pulls
> in libx11-dev which is already way more than I want.
> 
> One approach to this problem is to drain the -dev packages into the main
> "runtime" package.  I have difficulty imagining someone wanting to
> ship /usr/bin/pkg-config but not pkg.m4 for example.  I'm not yet sure
> how many recipes are affected though.

I can imagine someone downloading something and wanting to build it but
not reautoconf'ing it. At that point you'd need pkg-config but not
the .m4 files.

> Another approach would be to stop injecting -dev Requires by default.  I
> imagine this was done to handle the case of library A whose headers
> require library B.  However, a saner way to handle this I think is
> simply to push people to use pkg-config; IIRC a script exists to extract
> pkg-config dependencies from the .pc files and use that for the RPM
> auto-dependency phase.  That would ensure that e.g. gtk+-dev Requires:
> glib-dev.  This doesn't help non-pkg-config libraries, but those people
> should be shamed anyways =)

I think these dependencies are wrong and need revisiting. Currently,
-dev and -dbg packages share the same code and its tilted more in favour
of -dbg than it is for -dev.

I think the -dev packages make sense if you want to build X but not
build something that just depends on X. We should therefore move the
dependencies to a new package (need a good name) and rethink the -dev
package dependencies.

Cheers,

Richard




