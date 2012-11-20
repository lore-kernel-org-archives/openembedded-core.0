Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TampQ-0006at-4R for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 13:21:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAKC7KXQ005287;
	Tue, 20 Nov 2012 12:07:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05073-01; Tue, 20 Nov 2012 12:07:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAKC7A3V005280
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 20 Nov 2012 12:07:12 GMT
Message-ID: <1353413229.23758.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com
Date: Tue, 20 Nov 2012 12:07:09 +0000
In-Reply-To: <442aa8576f4be75369fe4068794573f257a4d083.1353311649.git.Qi.Chen@windriver.com>
References: <cover.1353311649.git.Qi.Chen@windriver.com>
	<442aa8576f4be75369fe4068794573f257a4d083.1353311649.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] mdadm: make udev rules dir configurable
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
X-List-Received-Date: Tue, 20 Nov 2012 12:21:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-11-20 at 17:34 +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> mdadm hardcodes the udev rules dir to be '/lib/udev/rules.d'.
> However, udev configs its base library directory to be ${base_libdir}
> instead of '/lib'. Thus if the target has powerpc64 architecture,
> the mdraid.rules file will be missing on the target, as the library
> directory is 'lib64'.
> 
> This patch makes the udev rules dir of mdadm configurable, so that
> the mdraid.rules file will not be missing on any target.
> 
> [YOCTO #2804]

This is a bit of a tricky one. I suspect in this case we need to install
all the udev rules to one place and have an udev look in that place,
regardless of which multilib it was compiled for.

We already have this problem with systemd_unitdir. I think we need to do
something like set:

nonarchlib = "/lib"

and then use this value in places where we want it to be invariant (yet
still allow the layout to be configurable).

So your patch starts to help with this but there is more we need to do.

Cheers,

Richard



