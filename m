Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 04AA777D00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 21:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3BLNsj6032404; 
	Tue, 11 Apr 2017 22:23:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id giYFIwshDyzV; Tue, 11 Apr 2017 22:23:54 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3BLC1VX031553
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 11 Apr 2017 22:12:03 +0100
Message-ID: <1491945121.12091.47.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Jussi Kukkonen
	<jussi.kukkonen@intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 11 Apr 2017 22:12:01 +0100
In-Reply-To: <16f574d161924ec89eadf24244d6cf2d@XBOX02.axis.com>
References: <cover.1491920909.git.jussi.kukkonen@intel.com>
	<ea482eb749a7dbeb22743bf6ce3f31c447b970bf.1491920909.git.jussi.kukkonen@intel.com>
	<8f6fdae166cb44babe9c975f584df839@XBOX02.axis.com>
	<1491930987.12091.32.camel@linuxfoundation.org>
	<16f574d161924ec89eadf24244d6cf2d@XBOX02.axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCHv3 1/1] native/nativesdk: Use fixed DISTRO_FEATURES
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
X-List-Received-Date: Tue, 11 Apr 2017 21:24:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-04-11 at 18:06 +0000, Peter Kjellerstedt wrote:
> > 
> > -----Original Message-----
> > From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
> > Se
> > On Tue, 2017-04-11 at 15:32 +0000, Peter Kjellerstedt wrote:
> > > 
> > > > +    # Set features here to prevent appends and distro features
> > > > backfill
> > > > +    # from modifying native distro features
> > > > +    features = set(d.getVar("DISTRO_FEATURES_NATIVE").split())
> > > > +    filtered = set(bb.utils.filter("DISTRO_FEATURES",
> > > > d.getVar("DISTRO_FEATURES_FILTER_NATIVE"), d).split())
> > > > +    d.setVar("DISTRO_FEATURES", " ".join(features | filtered))
> > > You should sort the list of features to make it deterministic.
> > Do we sort DISTRO_FEATURES anywhere else?
>
> No, but it is never worked upon via set() as these are here...
> 
> > 
> > I thought we only accessed DISTRO_FEATURES with functions which
> > have
> > support in bitbake (contains/filter) which means that should be
> > unnecessary?
>
> Will the lack of sorting not affect the task hashes (and bitbake -e)
> if these are set via set() operations, which may result in the order
> of the features listed in the final DISTRO_VARIABLE from varying
> based on how Python happens to pull the features out of the set()?

setVar operations don't actually affect task hashes directly. We track
functions which use variables through getVar/getVarFlag and only if
something uses it does its value affect the hash.

We can therefore safely setVar this, its only users of
getVar/getVarFlag which would see its value and with DISTRO_FEATURES,
we only obtain the value through contains/filter which have special
handling in bitbake (similar to getVar).

So I still think sorting is unnecessary, at least in theory.

Cheers,

Richard

