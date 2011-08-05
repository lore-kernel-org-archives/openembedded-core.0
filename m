Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QpKO2-0005eu-Rk for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 15:24:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75DJoI1011883;
	Fri, 5 Aug 2011 14:19:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10683-07; Fri,  5 Aug 2011 14:19:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75DJffl011877
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 5 Aug 2011 14:19:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <ED5193A2-1D7E-4424-8B5B-FF755B56FFFC@kernel.crashing.org>
References: <1312196922-20019-1-git-send-email-koen@dominion.thruhere.net>
	<4E3B542C.1070306@linux.intel.com>
	<ADE3B9A3-1B0B-4ECA-A472-D241AA542051@dominion.thruhere.net>
	<4E3B8082.5010909@linux.intel.com>
	<DF702E9E-8D68-4088-9178-E4C7B22EC0C4@dominion.thruhere.net>
	<EDEBFCA3-43E9-48FA-A3A8-44A78B87BDD2@dominion.thruhere.net>
	<079D72ED-42F0-46C9-ABDB-6DE4F34AA3E7@dominion.thruhere.net>
	<ED5193A2-1D7E-4424-8B5B-FF755B56FFFC@kernel.crashing.org>
Date: Fri, 05 Aug 2011 14:19:19 +0100
Message-ID: <1312550359.14274.104.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] gtk-icon-cache bbclass: only add runtime dependencies on hicolor-icon-theme when installing icons
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
X-List-Received-Date: Fri, 05 Aug 2011 13:24:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-05 at 07:42 -0500, Kumar Gala wrote:
> On Aug 5, 2011, at 1:51 AM, Koen Kooi wrote:
> 
> > 
> > Op 5 aug. 2011, om 08:44 heeft Koen Kooi het volgende geschreven:
> > 
> >> 
> >> Op 5 aug. 2011, om 07:48 heeft Koen Kooi het volgende geschreven:
> >> 
> >>> 
> >>> Op 5 aug. 2011, om 07:32 heeft Saul Wold het volgende geschreven:
> >>> 
> >>>> On 08/04/2011 10:28 PM, Koen Kooi wrote:
> >>>>> 
> >>>>> Op 5 aug. 2011, om 04:23 heeft Saul Wold het volgende geschreven:
> >>>>> 
> >>>>>> On 08/01/2011 04:08 AM, Koen Kooi wrote:
> >>>>>>> Tested with gnome-icon-theme and libsoup recipes on angstrom.
> >>>>>>> 
> >>>>>> But you did not test it against anything in oe-core, it has broken the build for connman-gnome and oprofileui, which use this bbclass.
> >>>>>> 
> >>>>>> The oe-core gnome-icon-theme does not include this class.
> >>>>>> 
> >>>>>> Please correct this.
> >>>>>> 
> >>>>>> Processing task-base-extended...
> >>>>>> | error: Failed dependencies:
> >>>>>> | 	hicolor-icon-theme is needed by tasks-0.19-r0.armv5te
> >>>>>> | 	hicolor-icon-theme is needed by connman-gnome-0.5-r6.armv5te
> >>>>>> | 	hicolor-icon-theme is needed by oprofileui-server-0.0+git1+0c3c32fa754c1d0b70e65767ea7048914f776396-r4.armv5te
> >>>>> 
> >>>>> So you found broken metadata. If tasks, connman-gnome and oprofileui-server need hicolor-icon-theme, they should list it in their RDEPENDS_${PN}. That is a seperate issue than what I fixed in the bbclass
> >>>> 
> >>>> Koen, the gtk-icon-cache.bbclass did contain that RDEPENDS, which you removed
> >>> 
> >>> It wasn't removed, it was changed to only add the dependency when needed, and by the looks of it it works. 
> >>> 
> >>> Does the following patch work for you?
> >>> 
> >>> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
> >>> index d9b5d1b..1e65e06 100644
> >>> --- a/meta/classes/gtk-icon-cache.bbclass
> >>> +++ b/meta/classes/gtk-icon-cache.bbclass
> >>> @@ -1,5 +1,8 @@
> >>> FILES_${PN} += "${datadir}/icons/hicolor"
> >>> 
> >>> +# OE can't resolve RDEPENDS added thru the python code below, so make sure it has been built.
> >>> +DEPENDS += "hicolor-icon-theme"
> >>> +
> >>> # This could run on the host as icon cache files are architecture independent,
> >>> # but there is no gtk-update-icon-cache built natively.
> >>> gtk_icon_cache_postinst() {
> >> 
> >> 
> >> I can answer that myself: no, it will cause a dependency loop
> > 
> > 
> > And this one?
> > 
> > +++ b/meta/classes/gtk-icon-cache.bbclass
> > @@ -1,5 +1,7 @@
> > FILES_${PN} += "${datadir}/icons/hicolor"
> > 
> > +DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']}"
> 
> This fixes my issue with core-image-sato on mpc8315

This looks right to me. Should I turn this into a commit or are you
waiting for some reason?

Cheers,

Richard



