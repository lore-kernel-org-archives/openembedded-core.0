Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8F19B72727
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 08:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBN8Ipxt003730; Tue, 23 Dec 2014 08:18:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id c2iomqVxRIbB; Tue, 23 Dec 2014 08:18:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBN8IYeT003720
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 23 Dec 2014 08:18:46 GMT
Message-ID: <1419322751.1777.3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 23 Dec 2014 08:19:11 +0000
In-Reply-To: <lymw6gylj1.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lymw6gylj1.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to enforce ${B} = ${S} builds globally?
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
X-List-Received-Date: Tue, 23 Dec 2014 08:19:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-12-22 at 12:24 +0100, Enrico Scholz wrote:
> what is the recommended way to enable in-source builds globally?

You could probably do something like:

B_forcevariable = "${S}"

although its untested and I would warn that we rely on separate build
directories to avoid breakage from autotools not noticing new
configuration and rebuilding things correctly.

> Building in a separate directory might be interesting for qa, but it
> lowers end-user experience significantly because __FILE__ expands now
> to absolute names.
> 
> E.g.
> 
> | #include <assert.h>
> | int main() { assert(0); }
> 
> gives
> 
> | test: /srv/oe/cache/bld/f95aceac-8952-bd61-430a-dfcdf48db33c/work/cortexa9t2hf-vfp-neon-linux-gnueabi/test/1.0-r0/test-1.0/test.c:2: main: Assertion `0' failed.
> 
> instead of
> 
> | test: test.c:2: main: Assertion `0' failed.


Lets say you just shared this error as a cut and paste to me asking for
help. In the latter case, I have no idea what happened. In the former, I
can tell you were building for an arm system, your recipe PN was test
and so on.

So whilst the paths can be annoying, they can also be helpful and there
are in fact two sides to this.

Cheers,

Richard



