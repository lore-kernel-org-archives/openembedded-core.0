Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TYcoE-00009I-BJ for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 14:15:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAED1H2Q019958;
	Wed, 14 Nov 2012 13:01:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17794-08; Wed, 14 Nov 2012 13:01:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAED1821019952
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 14 Nov 2012 13:01:10 GMT
Message-ID: <1352898069.11419.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chris Larson <clarson@kergoth.com>
Date: Wed, 14 Nov 2012 13:01:09 +0000
In-Reply-To: <CABcZANkMe=Bxfr5=PJkDUDT0LS1uN3AL=Sigo9OXS-rQyaexzQ@mail.gmail.com>
References: <1352815159.24487.122.camel@ted>
	<CABcZANkMe=Bxfr5=PJkDUDT0LS1uN3AL=Sigo9OXS-rQyaexzQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 14 Nov 2012 13:15:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-11-13 at 16:42 -0700, Chris Larson wrote:

> On Tue, Nov 13, 2012 at 6:59 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>         Signed-off-by: Richard Purdie
>         <richard.purdie@linuxfoundation.org>
>         ---
>         diff --git
>         a/meta/recipes-extended/bash/bash-4.2/crossfix.patch
>         b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
>         new file mode 100644
>         index 0000000..f587c34
>         --- a/dev/null
>         +++ b/meta/recipes-extended/bash/bash-4.2/crossfix.patch
>         @@ -0,0 +1,28 @@
>         +Adding @CROSS_COMPILE@ to CFLAGS_FOR_BUILD causes errors
>         like:
>         +
>         +mkbuiltins.o: In function `open':
>         +/usr/include/x86_64-linux-gnu/bits/fcntl2.h:54: undefined
>         reference to `xopen'
>         +mkbuiltins.o: In function `read':
>         +/usr/include/x86_64-linux-gnu/bits/unistd.h:45: undefined
>         reference to `xread'
>         +collect2: ld returned 1 exit status
>         +
>         +when compiling on a 64 bit x86 build system for a 32 bit x86
>         target since
>         +config.h confuses the compiler about settings. By removing
>         the option, config.h
>         +isn't used and the compiler stops getting confused.
>         +
>         +Upstream-Status: Pending
>         +RP 2012/11/13
> 
> Relying on the target config.h to build a host tool could fail if the
> build and target environments differ greatly, which is likely why
> mkbuiltins.c has hardcoded defines assuming less about the host (just
> POSIX) based on the CROSS_COMPILE define. I don't think removing that
> is the best fix, personally.

Agreed. I'd actually misread that file and thought that it was using
config.h in the CROSS_COMPILE case.

> The reason for this failure has to do with a particular set of
> circumstances. A header in the bash source tree defines STRING() based
> on HAVE_STRINGIZE. This define overwrites the unistd.h define of the
> same macro. The unistd.h definitions of read() and open() wrap the
> call to the real functions to implement FORTIFY_SOURCES, and those
> wrappers use STRING() to do it. As a result, for any host that
> defaults to -DFORTIFY_SOURCES, STRING() returns 'x' resulting in a
> concatenation rather than an assembly level rename of the function
> being called.
>
> If we add -DHAVE_STRINGIZE in the CROSS_COMPILE case, then STRING()
> will be defined to something useful, and therefore the FORTIFY_SOURCES
> wrappers don't get hosed.
>
> See http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/commit/?id=da0ff91 for an alternative fix which may be more likely to be accepted upstream.
> 
This is better, yes. Is there a reason this is in meta-mentor and not
OE-Core? I'd really like to pull it into OE-Core...

Cheers,

Richard



