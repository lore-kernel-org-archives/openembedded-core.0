Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QUaL7-0002UB-5k for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 10:11:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5988KT0010214
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jun 2011 09:08:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09646-10 for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2011 09:08:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5988Bep010208
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jun 2011 09:08:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307606678.15712.130.camel@rex>
References: <cover.1306931844.git.dexuan.cui@intel.com>
	<4DE67440.1020405@mentor.com> <1306950977.27470.461.camel@rex>
	<4DE69582.2090508@mentor.com>
	<1306958729.3119.3.camel@lenovo.internal.reciva.com>
	<4DE6A43A.3050401@mentor.com>
	<1306961135.3119.13.camel@lenovo.internal.reciva.com>
	<4DE6A836.3040004@mentor.com> <1307023591.27470.549.camel@rex>
	<4DE79D69.7080806@mentor.com> <1307025426.2529.209.camel@phil-desktop>
	<4DE7BA3F.4060600@mentor.com> <1307032545.27470.580.camel@rex>
	<4DE7C09F.9000104@mentor.com>  <1307606678.15712.130.camel@rex>
Date: Thu, 09 Jun 2011 09:08:04 +0100
Message-ID: <1307606884.15712.132.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC v1 PATCH 00/16] populate perl-native into its own	directory
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
X-List-Received-Date: Thu, 09 Jun 2011 08:11:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-09 at 09:04 +0100, Richard Purdie wrote:
> On Thu, 2011-06-02 at 09:55 -0700, Tom Rini wrote:
> > On 06/02/2011 09:35 AM, Richard Purdie wrote:
> > > On Thu, 2011-06-02 at 09:28 -0700, Tom Rini wrote:
> > >>   Even if we're using the sstate
> > >> cache from /foo/oecore/tmp over in /bar/oecore/tmp (and /foo/oecore/tmp
> > >> is rm -rf'd) ?  Since we've got a create_wrapper around perl and
> > >> perl${PV} it should be I suppose (or is easily added there), but I'd
> > >> feel a lot better with some testing of the above case (and the updates
> > >> to cpan*bbclass).
> > > 
> > > I only took the perl-native DEPENDS patch on the condition this gets
> > > fixed properly. The patches that are there look to do that, at least for
> > > OE-Core. If there are further issues we're going to have to take them as
> > > they arise as I have an objection to crippling the build dependencies
> > > because perl is broken. Really this could use some TLC from someone with
> > > experience in the area...
> > 
> > Well, I guess I'd boil down what I said above into a request like this
> > for v3:
> > - Modify cpan.bbclass to NOT set PERL_INC / PERL_LIB / PERL_ARCHLIB /
> > PERLHOSTLIB.
> 
> The first three of these are all about the *target* perl location and I
> think we still need them due the mess that perl's build system is. With
> the patch series in question they won't actually point at perl-native in
> the target case and they are only really used for cross compiling
> purposes.
> 
> PERLHOSTLIB is used by the target perl when cross compiling to find
> native .so files. perl-native will always be present at this point and
> again, it seems like a valid use case.
> 
> Summary is that I don't think perl-native is broken in any way but we do
> need those variables.
> 
> > - In /scratch/oecore/tmp0 build the images that were built for v1
> > - In /scratch/oecore/tmp1 build perl-native's full sstate cache.
> > - Keep the sstate cache from tmp1 and otherwise rm -rf tmp1.
> > - In /scratch/oecore/tmp2 using the sstate from tmp1, build the same
> > images that were built for tmp0.
> 
> I'm confused by this test cycle. What do you mean by "build
> perl-native's full sstate cache"?
> 
> I suspect you've asking for some partial sstate cache to be shared
> between two builds?
> 
> Put simpler, you probably want:
> 
> in tmp0 "bitbake perl-native"
> in tmp1, different location to tmp0, "bitbake core-image-sato" but
> sharing the same sstate cache

I meant to add that tmp0 should be renamed before this second step so if
there are hardcoded references in any of the sstate packages they
couldn't find anything in tmp0 as it would no longer exist.

> Is that what you're thinking?
> 
> FWIW, I've been running locally with the patch series and I think I'd
> like to merge it. If there are issues we can address them as and when
> they're identified...
> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




