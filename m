Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 452 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 02 May 2018 13:48:18 UTC
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 73E71745D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 13:48:17 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id DrzvfqG5uy3jiDrzwfzHjC; Wed, 02 May 2018 14:40:46 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=fL8XI6Se c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=VUJBJC2UJ8kA:10 a=lIts2nFRua1RrzvkxPMA:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1fDrzv-0007g4-Eg; Wed, 02 May 2018 14:40:43 +0100
Date: Wed, 2 May 2018 14:40:43 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <20180502134043.w3eqbl4afvsjjy55@mcrowe.com>
References: <20180501113655.11666-1-mac@mcrowe.com>
	<fb6ef50149364c4db6f17687bb90645a@XBOX02.axis.com>
MIME-Version: 1.0
In-Reply-To: <fb6ef50149364c4db6f17687bb90645a@XBOX02.axis.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfC3a0rMD46jw8CnKVCRl7Ll4DLyfn1Vd4gzEqsEmfaxByeH23FVmdKFWwz3tbIbsFZJiuJR0322VaWVyQ0vPy2W71tmNSPJk1MsBNRRPrJOAfQYit6eA
	mDnRY/VO557GBIXuiqgJqI2w9bfqNUH/+Oie+e8mM9004vMy+4QdADef
Subject: Re: [PATCH] alsa-utils: Fix error when removing unwanted udev	rules
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
X-List-Received-Date: Wed, 02 May 2018 13:48:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wednesday 02 May 2018 at 08:39:27 +0000, Peter Kjellerstedt wrote:
> >  	if ${@bb.utils.contains('PACKAGECONFIG', 'udev', 'false', 'true', d)}; then
> 
> I suggest that you remove the if-statement since the /unwanted directory 
> shall always be removed if it exists so there is no need to test for it.

I had wondered about doing that myself, but had decided to make as few
changes as possible.

> > -		# This is where alsa-utils will install its rules if we don't tell it anything else.
> > -		rm -rf ${D}${nonarch_base_libdir}/udev
> > -		rmdir --ignore-fail-on-non-empty ${D}${nonarch_base_libdir}
> > +        	# If udev is disabled, we told configure to install the rules in /unwanted, so
> > +        	# we can get rid of them now.
> > +        	rm -rf ${D}/unwanted
> 
> Correct the indentation (the rest of the function is indented using
> tabs).

I'd spotted that, and had thought that I'd sorted it out. It turns out that
I ended up making it even worse with a mixture of spaces and tabs. :(

Hopefully v2 is better.

Thanks.

Mike.

