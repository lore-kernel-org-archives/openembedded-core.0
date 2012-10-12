Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TMeV1-0001hQ-Uw for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 14:37:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9CCOhHg027413;
	Fri, 12 Oct 2012 13:24:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25953-07; Fri, 12 Oct 2012 13:24:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9CCOV0X027407
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 12 Oct 2012 13:24:32 +0100
Message-ID: <1350044676.25627.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Fri, 12 Oct 2012 13:24:36 +0100
In-Reply-To: <CAGiJk9fX67UyL_NQo-TWUzgpu=0wq6N3u9pDmKnOskbsjNhxAQ@mail.gmail.com>
References: <CAGiJk9fX67UyL_NQo-TWUzgpu=0wq6N3u9pDmKnOskbsjNhxAQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Accelerate do_package
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
X-List-Received-Date: Fri, 12 Oct 2012 12:37:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-10-12 at 13:43 +0200, Samuel Stirtzel wrote:
> Hi,
> after re-building Qt the third time today, I was curious why
> do_package takes this long.

Try:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t1&id=e355769c1dc2dd5c464f2fcfe0991f797613b43e

The trouble is this "breaks" certain rpm per file dependency pieces and
I've not found time to dive into finding an alternative way to do that.

> From my investigation it looks like the library stripping is the culprit,
> it lets my system idle with 5% CPU usage over a long time.

Its the fork/exec overhead from the above that does this.

> Would it be possible to accelerate do_package with parallelisation?
> Likely I could look into this sometime soon, but I'd rather hear your
> thoughts on this first.

Parallelisation is good but there is a better piece of low hanging fruit
here.

> PS:
> Also sstate creation and rootfs packing could be made faster with
> pbzip2 [1] / pigz [2] (we have a recipe for pigz), or is anthing
> preventing this?

The trouble is circular dependencies and being consistent about which
util gets used where without races and dependency loops.

Its also not the big time sync people think it is, I tested a patch
which "offlined" the whole sstate archive creation and it doesn't make
much difference to overall build time.

Cheers,

Richard (not around much over the next few days)



