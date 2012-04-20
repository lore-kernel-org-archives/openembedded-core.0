Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SLAdi-0007DB-K9 for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 12:00:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3K9owTo023445;
	Fri, 20 Apr 2012 10:50:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23307-02; Fri, 20 Apr 2012 10:50:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3K9ojAF023438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 20 Apr 2012 10:50:48 +0100
Message-ID: <1334915449.3028.35.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 20 Apr 2012 10:50:49 +0100
In-Reply-To: <4F9100E0.4090200@linux.intel.com>
References: <cover.1334875218.git.sgw@linux.intel.com>
	<ad439be70f90f60d12d905c8c6546d373448ca6a.1334875218.git.sgw@linux.intel.com>
	<CABcZAN=aojEpwUEWj0wB=6OD7wkwOwteGAGvN9TQGS+HCs+DtA@mail.gmail.com>
	<4F9100E0.4090200@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Chris Larson <clarson@kergoth.com>, dvhart@linux.intel.com
Subject: Re: [PATCH 06/10] quilt: move empty quiltrc to native
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
X-List-Received-Date: Fri, 20 Apr 2012 10:00:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-04-19 at 23:23 -0700, Saul Wold wrote:
> On 04/19/2012 09:17 PM, Chris Larson wrote:
> > On Thu, Apr 19, 2012 at 3:44 PM, Saul Wold<sgw@linux.intel.com>  wrote:
> >> The package.bbclass uses the native sysroot /usr/bin/quiltrc as an empty quiltrc
> >> to ensure that the user quiltrc does not affect our patching scheme. This ensures
> >> the correct file is in the correct sysroot.
> >
> > I assume this was meant to be patch.bbclass? Aside: ${bindir} really
> > isn't where that should go, as a point for future improvement :)
> Yes, patch.bbclass references $STAGING_NATIVE_BINDIR (I think that's 
> it), Yeah, I thought about moving it, which I could still do in a second 
> patch to the native sysroot /etc or /usr/share/quilt, this might be the 
> better place.
> 
> Thoughts?

I suspect that was a workaround where quilt was picking up things it
shouldn't on a system and we needed a quiltrc file but didn't stage
sysconfdir. I think we do stage sysconfdir for native packages now and
the fact it was using /usr is just historical detail which can be
removed.

Looking at the history, we added sysconfdir 2.5 years ago in:

http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/classes/base.bbclass?id=dfd32b429a0a9bed09b75f59f0c7fb37f42c3ed9

The quiltrc fix was from two years before that:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=95554ee9b15e575a369d9686be6af45d3a6985fc
http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/classes/patch.bbclass?id=0443d80b50e98bb329e30430bde5db67f09004e3

Regardless, lets just have one patch which moves this somewhere sensible
and makes it quilt-native only.

Cheers,

Richard




