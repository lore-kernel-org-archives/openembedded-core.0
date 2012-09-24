Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TG5ZG-0003yt-3t for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 12:07:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8O9sCaF027385;
	Mon, 24 Sep 2012 10:54:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26940-02; Mon, 24 Sep 2012 10:54:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8O9s2oH027379
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 24 Sep 2012 10:54:03 +0100
Message-ID: <1348480442.4486.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Mon, 24 Sep 2012 10:54:02 +0100
In-Reply-To: <1348479655.31293.19.camel@phil-desktop>
References: <1348467993.4444.252.camel@x121e.pbcl.net>
	<1348476693.10108.221.camel@ted>
	<1348479655.31293.19.camel@phil-desktop>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] staging: Avoid staging the same binaries again and again
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
X-List-Received-Date: Mon, 24 Sep 2012 10:07:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-24 at 10:40 +0100, Phil Blundell wrote:
> On Mon, 2012-09-24 at 09:51 +0100, Richard Purdie wrote:
> > Wouldn't testing whether $dest already exists work just as well?
> 
> I wasn't totally confident that $dest was guaranteed never to exist in
> advance

do_populate_sysroot[cleandirs] = "${SYSROOT_DESTDIR}"

(dest is ${SYSROOT_DESTDIR})

>  (and that we'd never want to stage multiple $srcs into a single
> $dest).

sysroot_stage_* are symmetrical so I can't imagine this happening.

The main worry would be something happening before sysroot_stage_all.
SYSROOT_PREPROCESS_FUNCS happen afterwards so there is at least a hook
used in most cases that would avoid the issue.

I'm torn whether its better to be simple or less fragile in this case.
Or simply do some tests (if ${bindir} != ${sbindir}) and so on.

Cheers,

Richard

>   But yes, if both of those are true then I think testing for the
> existence of $dest would be fine.
> 
> p.
> 
> 




