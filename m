Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TYdxd-00054t-A8 for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 15:29:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAEEF4Jw020484;
	Wed, 14 Nov 2012 14:15:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20196-01; Wed, 14 Nov 2012 14:14:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAEEErAe020472
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 14 Nov 2012 14:14:54 GMT
Message-ID: <1352902494.13332.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chris Larson <clarson@kergoth.com>
Date: Wed, 14 Nov 2012 14:14:54 +0000
In-Reply-To: <CABcZAN=sRNMPhR=FAWKyObYZt1XVnyr6tjj1ceg9Tf0bw8pjPg@mail.gmail.com>
References: <1352815159.24487.122.camel@ted>
	<CABcZANkMe=Bxfr5=PJkDUDT0LS1uN3AL=Sigo9OXS-rQyaexzQ@mail.gmail.com>
	<1352898069.11419.2.camel@ted>
	<CABcZAN=sRNMPhR=FAWKyObYZt1XVnyr6tjj1ceg9Tf0bw8pjPg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: Add fix for cross compile issues
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
X-List-Received-Date: Wed, 14 Nov 2012 14:29:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-11-14 at 07:08 -0700, Chris Larson wrote:
> On Wed, Nov 14, 2012 at 6:01 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>         > The reason for this failure has to do with a particular set
>         of
>         > circumstances. A header in the bash source tree defines
>         STRING() based
>         > on HAVE_STRINGIZE. This define overwrites the unistd.h
>         define of the
>         > same macro. The unistd.h definitions of read() and open()
>         wrap the
>         > call to the real functions to implement FORTIFY_SOURCES, and
>         those
>         > wrappers use STRING() to do it. As a result, for any host
>         that
>         > defaults to -DFORTIFY_SOURCES, STRING() returns 'x'
>         resulting in a
>         > concatenation rather than an assembly level rename of the
>         function
>         > being called.
>         >
>         > If we add -DHAVE_STRINGIZE in the CROSS_COMPILE case, then
>         STRING()
>         > will be defined to something useful, and therefore the
>         FORTIFY_SOURCES
>         > wrappers don't get hosed.
>         >
>         > See
>         http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/commit/?id=da0ff91 for an alternative fix which may be more likely to be accepted upstream.
>         >
>         
>         This is better, yes. Is there a reason this is in meta-mentor
>         and not
>         OE-Core? I'd really like to pull it into OE-Core...
> 
> Nope, it's just in the pending upstream pile. I'll send a patch
> against oe-core to the list today if you'd like.

Please, I'd like to get that problem fixed.

Cheers,

Richard




