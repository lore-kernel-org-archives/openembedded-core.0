Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tfzcb-0005qd-AQ for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 22:01:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB4KlHmX011060;
	Tue, 4 Dec 2012 20:47:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09167-10; Tue,  4 Dec 2012 20:47:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB4Kl7Gr011054
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 4 Dec 2012 20:47:09 GMT
Message-ID: <1354654017.25268.65.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 04 Dec 2012 20:46:57 +0000
In-Reply-To: <50BE342E.1070401@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
	<13c1d96727b678dc95430f1144b3017c9e62948f.1354641032.git.mark.hatle@windriver.com>
	<20121204170432.GH14870@jama.jama.net> <50BE342E.1070401@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/22] update-alternatives.bbclass: Add missing runtime dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 21:01:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-12-04 at 11:34 -0600, Mark Hatle wrote:
> On 12/4/12 11:04 AM, Martin Jansa wrote:
> > On Tue, Dec 04, 2012 at 11:14:35AM -0600, Mark Hatle wrote:
> >> When using update-alternatives, there should be a runtime dependency on
> >> update-alternatives.  Without this, it's possible to get into a situation
> >> where the package is not installable.
> >>
> >> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >> ---
> >>   meta/classes/update-alternatives.bbclass |    6 ++++++
> >>   1 files changed, 6 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
> >> index 4e1ff27..e432506 100644
> >> --- a/meta/classes/update-alternatives.bbclass
> >> +++ b/meta/classes/update-alternatives.bbclass
> >> @@ -304,6 +304,12 @@ python populate_packages_prepend () {
> >>               alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target)
> >>
> >>           if alt_setup_links:
> >> +            # RDEPENDS setup
> >> +            bb.note('adding runtime requirement for update-alternatives for %s' % pkg)
> >> +            rdepends = d.getVar('RDEPENDS_%s' % pkg, True) or ""
> >> +            rdepends += ' ' + d.getVar('MLPREFIX') + 'update-alternatives'
> >> +            d.setVar("RDEPENDS_%s" % pkg, rdepends)
> >> +
> >
> > I guess you should use VIRTUAL-RUNTIME_update-alternatives here
> 
> I believe what I have here is correct.

No, Martin is right.

>   We don't care which update-alternatives 
> we use, just that one is used.
> 
> recipes-devtools/dpkg/dpkg.inc:RPROVIDES_update-alternatives-dpkg += 
> "update-alternatives"
> recipes-devtools/opkg/opkg.inc:RPROVIDES_update-alternatives-cworth += 
> "update-alternatives"
> 
> If I use the ${VIRTUAL-RUNTIME_update-alternatives} that has the effect or hard 
> coding which specific version of update-alternatives we're going to use.. (-dpg 
> vs -cworth)  I'm not sure this is really the desired behavior in this case -- if 
> it is, it's easy enough to change of course.

I keep telling people this and people keep ignoring me.

We DO NOT SUPPORT switching providers at runtime since its a package
manager specific problem for which we currently have no general
abstraction.

This leads to patches like:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=fe21ace36e19e06cbfdb83f73e60623bd4e382af

since the virtual/ space does not somehow magically work at runtime,
worse it breaks the deb package backend.

PREFERRED_PROVIDER is a build time thing. virtual/ is a build time
thing. How do I explain this any clearer?

The only mechanism for distro selection of runtime is VIRTUAL-RUNTIME_
which is pretty horrible and likely would be better done with something
debian package renaming like since we already have that mangling code.

Cheers,

Richard




