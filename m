Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rqleg-0002kI-G6 for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 14:15:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0RD82av008758
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 13:08:02 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08484-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 13:07:58 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0RD7q02008752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 13:07:54 GMT
Message-ID: <1327669675.19643.454.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jan 2012 13:07:55 +0000
In-Reply-To: <1A3FDA4B-424A-4C09-8DC9-9663BBC92D92@dominion.thruhere.net>
References: <1327597394-31990-1-git-send-email-koen@dominion.thruhere.net>
	<1327611071.19643.405.camel@ted>
	<E55A8B17-3534-482A-8A69-CFE94D14F04D@dominion.thruhere.net>
	<1327621946.19643.425.camel@ted>
	<D7538C0B-CAE0-4043-BCF3-50C18B18781E@dominion.thruhere.net>
	<1327657835.19643.439.camel@ted>
	<1A3FDA4B-424A-4C09-8DC9-9663BBC92D92@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] package bbclass: allow per package PRIVATE_LIBS
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
X-List-Received-Date: Fri, 27 Jan 2012 13:15:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-27 at 12:55 +0100, Koen Kooi wrote:
> Op 27 jan. 2012, om 10:50 heeft Richard Purdie het volgende geschreven:
> 
> > On Fri, 2012-01-27 at 10:45 +0100, Koen Kooi wrote:
> >> Op 27 jan. 2012, om 00:52 heeft Richard Purdie het volgende geschreven:
> >> 
> >>> On Fri, 2012-01-27 at 00:17 +0100, Koen Kooi wrote:
> >>>> Op 26 jan. 2012, om 21:51 heeft Richard Purdie het volgende geschreven:
> >>>> 
> >>>>> On Thu, 2012-01-26 at 18:03 +0100, Koen Kooi wrote:
> >>>>>> If a recipe packages multiple versions of shlib (e.g. powervr drivers) we only want the shlib code to pickup $PN, not $PN-foo subpackages.
> >>>>>> This keeps backward compatibility with the global PRIVATE_LIBS usage if no per package PRIVATE_LIBS are set for a given package. In other words: this doesn't break the firefox recipe.
> >>>>>> 
> >>>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >>>>>> ---
> >>>>>> meta/classes/package.bbclass |    5 ++++-
> >>>>>> 1 files changed, 4 insertions(+), 1 deletions(-)
> >>>>>> 
> >>>>>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> >>>>>> index 45447e3..22a76cf 100644
> >>>>>> --- a/meta/classes/package.bbclass
> >>>>>> +++ b/meta/classes/package.bbclass
> >>>>>> @@ -1246,7 +1246,8 @@ python package_do_shlibs() {
> >>>>>> 				if not this_soname in sonames:
> >>>>>> 					# if library is private (only used by package) then do not build shlib for it
> >>>>>> 					if not private_libs or -1 == private_libs.find(this_soname):
> >>>>>> -						sonames.append(this_soname)
> >>>>>> +						if not private_libs_pkg or -1 == private_libs_pkg.find(this_soname):
> >>>>>> +							sonames.append(this_soname)
> >>>>>> 				if libdir_re.match(root):
> >>>>>> 					needs_ldconfig = True
> >>>>>> 				if snap_symlinks and (file != this_soname):
> >>>>>> @@ -1328,6 +1329,8 @@ python package_do_shlibs() {
> >>>>>> 	shlib_provider = {}
> >>>>>> 	private_libs = d.getVar('PRIVATE_LIBS', True)
> >>>>>> 	for pkg in packages.split():
> >>>>>> +		if not private_libs:
> >>>>>> +			private_libs_pkg = d.getVar('PRIVATE_LIBS_' + pkg, True)
> >>>>> 
> >>>>> You might as well just put:
> >>>>> 
> >>>>>                       private_libs = d.getVar('PRIVATE_LIBS_' + pkg, True)
> >>>>> 
> >>>>> and drop the first bit of the patch.
> >>>> 
> >>>> Wouldn't that kill backward compatibility?
> >>> 
> >>> No, since it would only take effect if the plain PRIVATE_LIBS was not
> >>> set...
> >> 
> >> The problem with the 'private_libs' var is that it's global and this needs a pkg local variable.
> > 
> > I see your point. How about just doing:
> > 
> > 	private_libs = d.getVar('PRIVATE_LIBS_' + pkg, True) or d.getVar('PRIVATE_LIBS', True)
> > 
> > ?
> 
> That would still set the global variable when it encounters a
> subpackage with PRIVATE_LIBS set. And that would mean it will come
> down to carefully ordering PACKAGES and hoping the class iterates them
> in the same order.
> 
> > The code just looks more complex in your patch than I think it needs
> to be.
> 
> I agree but I couldn't figure out a way that keeps both the old global
> syntax working and enables the per-package one to work as well. But I
> must admit that I lack the most basic python skills :)

I was meaning to do:

        shlib_provider = {}
-       private_libs = d.getVar('PRIVATE_LIBS', True)
        for pkg in packages.split():
+               private_libs = d.getVar('PRIVATE_LIBS_' + pkg, True) or d.getVar('PRIVATE_LIBS', True)
                needs_ldconfig = False
                bb.debug(2, "calculating shlib provides for %s" % pkg)

so private_libs is reset each time to the correct value.

Cheers,

Richard



