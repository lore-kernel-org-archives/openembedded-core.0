Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 93E2D65C66
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 09:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t059RaCd019039; Mon, 5 Jan 2015 09:27:36 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Im9gDRymVthR; Mon,  5 Jan 2015 09:27:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t059RMRk019032
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 5 Jan 2015 09:27:34 GMT
Message-ID: <1420450079.25779.21.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Mon, 05 Jan 2015 09:27:59 +0000
In-Reply-To: <54A95A5A.70809@topic.nl>
References: <54A2C3B2.9010006@topic.nl>
	<20141230175915.GB18678@crash.betafive.co.uk>
	<54A44ADC.3010000@topic.nl> <54A65B5E.4030504@topic.nl>
	<1420190187.25779.15.camel@linuxfoundation.org>
	<54A95A5A.70809@topic.nl>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Bug: PR server changes the PKGV variable too
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
X-List-Received-Date: Mon, 05 Jan 2015 09:28:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2015-01-04 at 16:20 +0100, Mike Looijmans wrote:
> On 01/02/2015 10:16 AM, Richard Purdie wrote:
> > On Fri, 2015-01-02 at 09:48 +0100, Mike Looijmans wrote:
> >> On 12/31/2014 08:13 PM, Mike Looijmans wrote:
> >>> On 30-12-2014 18:59, Paul Barker wrote:
> >>>> On Tue, Dec 30, 2014 at 04:24:34PM +0100, Mike Looijmans wrote:
> >>>>> What if the architecture of a package was accidentally left at its
> >>>>> default, but it should have been "all" for example?
> >>>>>
> >>>>> Just putting "inherit allarch" or simply PACKAGE_ARCH="all" into the
> >>>>> recipe is not enough. You get stuck with a "more specific" older
> >>>>> version, so that no device wants to upgrade to the newer version
> >>>>> that's "all" architecture compatible.
> >>>>>
> >>>>
> >>>> What package manager are you using on the device? If you're using opkg
> >>>> it should
> >>>> prioritise by version not arch unless the command line option
> >>>> '--prefer-arch-to-version' is passed. If you're using opkg and it's
> >>>> not doing
> >>>> that, let me know and I'll look into it when I get chance to.
> >>>
> >>> It's opkg.
> >>>
> >>> But on closer inspection I noticed that the "git" version is also
> >>> mysteriously reset to 0, so that the package also gets a lower version
> >>> number instead of a higher one. Seems to be the PR server borking things
> >>> again or so, I'll have to investigate that next year...
> >>
> >> Weird, something in OE killed "gitpkgv".
> >>
> >> in the recipe, I have this:
> >>
> >> inherit gitpkgv
> >> PV = "2.0+git${SRCPV}"
> >> PKGV = "2.0+git${GITPKGV}"
> >>
> >>
> >> $ bitbake enigma2-plugin-extensions-autobackup -e | grep PKGV
> >>
> >> delivers correct information:
> >>
> >> PKGV="2.0+git68+2e7a1db"
> >> GITPKGVTAG="0.0-68-g2e7a1db"
> >> GITPKGV="68+2e7a1db"
> >>
> >>
> >> But after building and deploying the package, the version number will
> >> eventually end up being this one:
> >>
> >> 2.0+git5+2e7a1db509-r0.2
> >>
> >>
> >> What in OE is replacing a perfectly good PKGV tag with something
> >> completely different bearing no relation whatsoever? Even the number of
> >> digits in the git tag differs from the one I put in the recipe!
> >>
> >> Even if I put some random text into PKGV, it gets replaced.
> >
> > Did something come from sstate?
> 
> I got todays master from openembedded-core and meta-openembedded, and 
> the recipe above (with a fix for the license). I leave everything as the 
> script "oe-init-build-env" does, I only add meta-openembedded/meta-oe to 
> the bblayers.conf list to get access to the gitpkgv class.
> 
> I named the recipe above "weirdversion.bb", and when I build it "as is", 
> I get the correct version number "z-pkgv+68+2e7a1db-r0" (with "pkgv" and 
> "68" in it).
> 
> However, when I add the following line to local.conf to activate the 
> PR-SERVER, things go wrong:
> 
> PRSERV_HOST = "localhost:0"
> 
> After this change, the package suddenly gets "z-pv+0+2e7a1db509-r0.0" as 
> version string, so apparently the PR server kills the PKGV variable and 
> replaces it with something derived from PV alone.
> 
> Since this is a completely clean situation with nothing but core code, 
> it must be a bug in the PR server (it seems to act as PV server instead...).

Imagine you're not using gitpkgv. You set:

PV = "x.y+${SRCPV}"

Since SRCPV contains a revision hash, you can end up in a situation
where the version changes and you cannot upgrade the package since the
hash didn't 'increase'.

The PR server therefore combines with the git fetcher to add an
incremental number at the start of the SRCPV string and yes, in that
scenario, it acts as a PV server. This is actually working as designed.

When you add in gitpkgv, something is obviously going wrong. gitpkgv is
in meta-oe since I've refused to add it to core on the several occasions
its been requested. I've said this before but I will say is again, it
*needs* become part of the standard fetcher API rather than a hacked in
afterthought which doesn't integrate well.

Cheers,

Richard



