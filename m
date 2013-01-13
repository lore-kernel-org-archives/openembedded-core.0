Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TuMyd-00057e-ON for openembedded-core@lists.openembedded.org;
	Sun, 13 Jan 2013 13:48:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0DCWSPH003117;
	Sun, 13 Jan 2013 12:32:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18272-06; Sun, 13 Jan 2013 12:32:23 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0DCWFOQ003110
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sun, 13 Jan 2013 12:32:18 GMT
Message-ID: <1358080338.23113.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chris Larson <clarson@kergoth.com>
Date: Sun, 13 Jan 2013 12:32:18 +0000
In-Reply-To: <CABcZAN=T+GS=H_PuyusNYJNmjbVraoz1u_OdCHq3Nr8s=hqBHw@mail.gmail.com>
References: <alpine.DEB.2.02.1301120618220.15410@oneiric>
	<1357995930.4072.134.camel@ted>
	<CABcZAN=T+GS=H_PuyusNYJNmjbVraoz1u_OdCHq3Nr8s=hqBHw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: image_types.bbclass: what's with "elf" and "cpio.gz"?
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
X-List-Received-Date: Sun, 13 Jan 2013 12:48:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-01-12 at 12:15 -0700, Chris Larson wrote:

>         Order is important. The elf image depends on the cpio.gz image
>         already
>         having been created so a) it must be created and b) it must
>         happen
>         before elf.
> 
> I'd think we could implement a data-driven method for this, rather
> than hardcoding this knowledge. Either declare the deps via a flag, or
> have one directly call the other.

Calling one from the other would cause issues like knowing when the
image type had already run (or cause it to run multiple times) but the
deps idea in flags would be better I agree. Its just the small matter of
implementing it and the complexities that entails.

With pseudo now able to safely store state, there is probably no excuse
not to split the rootfs task into multiple pieces and have the image
creation parts as separate tasks. This would mean we can use the normal
dependency logic and not have to reinvent the wheel. It would also allow
parallelism too, all with existing code. 

The more I think about this, the more I like the idea...

Cheers,

Richard




