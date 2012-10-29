Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TSrjy-0001HS-Sk for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 16:59:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TFjRDT005738;
	Mon, 29 Oct 2012 15:45:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04497-10; Mon, 29 Oct 2012 15:45:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TFjJcG005732
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 29 Oct 2012 15:45:20 GMT
Message-ID: <1351525519.2828.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Mon, 29 Oct 2012 15:45:19 +0000
In-Reply-To: <1351521750.13864.12.camel@phil-desktop>
References: <1351521750.13864.12.camel@phil-desktop>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: race between aclocal and unstaging of .m4 files
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
X-List-Received-Date: Mon, 29 Oct 2012 15:59:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-29 at 14:42 +0000, Phil Blundell wrote:
> If do_configure() from one recipe runs in parallel with
> sysroot_cleansstate() from another then aclocal may fail because it
> doesn't react very well to .m4 files disappearing underneath it.  This
> manifests as slightly obscure failures such as:
> 
> | aclocal: error: aclocal: file '.../tmp-eglibc/sysroots/x86_64-linux/share/aclocal/alsa.m4' does not exist
> 
> where the .m4 file in question is not one that the recipe being built
> would actually want to use.  (The alsa.m4 error above actually occurred
> during a build of attr.)
> 
> There seem to be two obvious ways of fixing this:
> 
> a) Add more locking so that these things can't happen in parallel
> 
> b) Patch aclocal to make this situation non-fatal
> 
> My inclination would be to do (b) since it's less intrusive.  Any
> objections or better suggestions?

Does current master not resolve this by creating a copy of the aclocal
directory using hardlinks and using that?

We've gone around in circles on this but I think its fixed once and for
all now.

Cheers,

Richard



