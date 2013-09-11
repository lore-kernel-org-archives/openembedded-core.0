Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 596B560EE0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 12:03:46 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8BCHP3g031716; Wed, 11 Sep 2013 13:17:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jrYZPKvLE8_2; Wed, 11 Sep 2013 13:17:25 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8BCHMAc031713
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 11 Sep 2013 13:17:23 +0100
Message-ID: <1378901014.3484.182.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Date: Wed, 11 Sep 2013 13:03:34 +0100
In-Reply-To: <523054FA.2080902@r-finger.com>
References: <CAP71Wjynkd=CGry-YKvEetsuGvoXmhwhVAF1rXuOuo-nh7V2CQ@mail.gmail.com>
	<523054FA.2080902@r-finger.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: OE gcc-cross with builtin sysroot, BUG?
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
X-List-Received-Date: Wed, 11 Sep 2013 12:03:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-11 at 12:33 +0100, Tomas Frydrych wrote:
> Hi,
> 
> On 11/09/13 11:29, Nicolas Dechesne wrote:
> > To me the problem is that gcc-cross 'embedds' some $MACHINE data in its
> > package, but it is not marked as 'machine specific, but arch specific.
> >  So several machines will end up sharing the same gcc-cross package.
> 
> The cross compiler should not be machine specific, that makes no sense.
> It seems to me that your problem comes entirely from the introduction of
> the machine element into the location of the *architecture* sysroot,
> which is not how the OE system is designed to work -- if your sysroot
> (i.e., the tmp dir) is in different place for different builds, then
> they are entirely separate builds, you should not share sstate between
> them. If you want to share the sstate, you need to share the sysroot.

Nearly, but not quite. The sstate is designed to be able to relocate to
any tmpdir. We play with the RPATHs and other things to ensure this
works. In the gcc-cross case, we need to pass in the option to the right
sysroot but we do that. If you stop passing in the right options, you
might get lucky or you might not...

> But it might be worth having some sort of sanity checker to catch this
> kind of misconfiguration.

Poisoning the defaults for gcc-cross would seem to be the best way of
avoiding confusion.

Cheers,

Richard


