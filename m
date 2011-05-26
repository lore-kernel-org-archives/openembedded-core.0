Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPO39-0007w2-JN for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 02:03:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4Q00aD7006811
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 01:00:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06492-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 01:00:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4Q00OKw006805
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 01:00:27 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306364520.27470.81.camel@rex>
References: <1306342881.2525.258.camel@phil-desktop>
	<1306364520.27470.81.camel@rex>
Date: Thu, 26 May 2011 01:00:23 +0100
Message-ID: <1306368023.27470.91.camel@rex>
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
X-List-Received-Date: Thu, 26 May 2011 00:03:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-26 at 00:02 +0100, Richard Purdie wrote:
> I think we need to fix native.bbclass. I dread to think what this is
> doing to the dependency tree at present. We did remove most references
> to RDEPENDS directly so I think that makes this a high priority to fix.
> 
> I'd note that the rewriting code is fraught with ordering/expansion
> issues which is why that code plays games with the variables like it
> does.
> 
> DEPENDS is horrible and it looks like we needed to do something similar
> for RDEPENDS. Better solutions to the ordering problems would be very
> welcome. It problem was the use of DEPENDS_prepend in places iirc.

I just reminded myself of the problem with DEPENDS.

Imagine the recipe says:

DEPENDS = "foo"
inherit autotools

Behind the scenes, autotools (amongst other thinsg) does a:

DEPENDS_prepend = "autoconf-native"

The trouble comes when you try:

DEPENDS_virtclass-native = ""

since you want to drop the foo dependency. The dependencies being added
by autotools.bbclass are still wanted but they get overwritten. At this
point I had to remember bitbake's finalize ordering. It does:

finalize()
<call anonymous python>
finalize()

The first call to finalize() expands the _prepend/_append before we see
them. We then lose the ability to see what was added though the classes
vs. what was in the recipe. The second finalize can then only clobber
the data.

If we could get our function called before the first finalize(), we
would remove the need to play the games we do which is looking very very
attractive.

I suspect its time to extend the anonymous python to indicate more
specifically when it would like to be run...

Cheers,

Richard




