Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QSGPB-0005ap-Nf for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 00:30:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52MR5c7030599
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 23:27:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30397-03 for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2011 23:27:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52MQvfS030593
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 23:26:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307050662.4028.3.camel@lenovo.internal.reciva.com>
References: <1307008107.2529.175.camel@phil-desktop>
	<1307049946.27470.589.camel@rex>
	<1307050662.4028.3.camel@lenovo.internal.reciva.com>
Date: Thu, 02 Jun 2011 23:26:36 +0100
Message-ID: <1307053596.27470.597.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] rpm: avoid dependency on perl and python for -native build
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
X-List-Received-Date: Thu, 02 Jun 2011 22:30:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-02 at 22:37 +0100, Phil Blundell wrote:
> On Thu, 2011-06-02 at 22:25 +0100, Richard Purdie wrote:
> > | checking pcre.h usability... no
> > | checking pcre.h presence... no
> > | checking for pcre.h... no
> > | checking for pcre_compile in -lpcre... no
> > | checking whether to build with PCRE library... no
> > | ++ executing failure action
> > | configure: error: PCRE is mandatory. If you don't have  libpcre then --with-pcre=internal could be used
> 
> Oh dear, that's not too good.  Can you send me a copy of the config.log
> corresponding to that failure?  Is pcre actually in your sysroot, or has
> it just not been built and staged at all?

Its not been built or staged at all. I think I'm being a little hasty in
blaming your patch directly, its interacting very badly with one that
was working happily in my tree todo with cleaning up native.bbclass.

What you're doing is setting:

DEPENDS = "X"
DEPENDS_virtclass-native = "X"

and assuming that the DEPENDS_virtclass-native will get post processed
by native.bbclass to add the -native bits where needed. With my cleanup
one side effect is that no longer happens.

My understanding is that if you are going to explicitly override DEPENDS
like that you get what you say you want. We therefore likely need to do
something like:

DEPENDS = "X Y Z ${EXTRAPERLDEPS}"
EXTRAPERLDEPS = "perl python"
EXTRAPERLDEPS_virtclass-native = ""

Cheers,

Richard









