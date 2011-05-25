Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPN8a-0006hO-BU for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 01:05:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4PN29ap006098
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 00:02:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05858-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 00:02:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4PN21TN006092
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 00:02:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306342881.2525.258.camel@phil-desktop>
References: <1306342881.2525.258.camel@phil-desktop>
Date: Thu, 26 May 2011 00:02:00 +0100
Message-ID: <1306364520.27470.81.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RDEPENDS_${PN} and virtclass-native
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
X-List-Received-Date: Wed, 25 May 2011 23:05:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-25 at 18:01 +0100, Phil Blundell wrote:
> By way of displacement activity to avoid actually fixing my perl
> compilation problem, it occurred to me to investigate why perl was
> getting dragged into a micro-base-image build in the first place.  The
> culprit turns out to be imake, which does:
> 
> RDEPENDS_${PN} = "perl xproto"
> 
> and is then BBCLASSEXTENDed to imake-native (which in turn is pulled in
> by way of prelink-native and transfig-native).
> 
> Now, leaving aside the question of whether it is reasonable for prelink
> to be depending on transfig, it is clearly wrong for the -native version
> of imake to be depending on perl.  It seems that native.bbclass makes
> some effort to rewrite plain RDEPENDS to the -native version, but it
> doesn't apply the same tactics to RDEPENDS_${PN} or any such.  (And, in
> fact, rewriting plain RDEPENDS is probably futile since few if any
> recipes are going to be setting it.)
> 
> Obviously I can fix this by just setting RDEPENDS_virtclass-native in
> the recipe, and that's what I've done in my local tree.  But I wonder if
> a better solution would be for native.bbclass to be slightly more
> adventurous about rewriting these things for itself.

I think we need to fix native.bbclass. I dread to think what this is
doing to the dependency tree at present. We did remove most references
to RDEPENDS directly so I think that makes this a high priority to fix.

I'd note that the rewriting code is fraught with ordering/expansion
issues which is why that code plays games with the variables like it
does.

DEPENDS is horrible and it looks like we needed to do something similar
for RDEPENDS. Better solutions to the ordering problems would be very
welcome. It problem was the use of DEPENDS_prepend in places iirc.

Cheers,

Richard



