Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id 93C8160F18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 11:33:14 +0000 (UTC)
Received: from [192.168.0.2] (host86-137-81-79.range86-137.btcentralplus.com
	[86.137.81.79]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id EEB399531
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 12:33:15 +0100 (BST)
Message-ID: <523054FA.2080902@r-finger.com>
Date: Wed, 11 Sep 2013 12:33:14 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130630 Icedove/17.0.7
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAP71Wjynkd=CGry-YKvEetsuGvoXmhwhVAF1rXuOuo-nh7V2CQ@mail.gmail.com>
In-Reply-To: <CAP71Wjynkd=CGry-YKvEetsuGvoXmhwhVAF1rXuOuo-nh7V2CQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Sep 2013 11:33:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/09/13 11:29, Nicolas Dechesne wrote:
> To me the problem is that gcc-cross 'embedds' some $MACHINE data in its
> package, but it is not marked as 'machine specific, but arch specific.
>  So several machines will end up sharing the same gcc-cross package.

The cross compiler should not be machine specific, that makes no sense.
It seems to me that your problem comes entirely from the introduction of
the machine element into the location of the *architecture* sysroot,
which is not how the OE system is designed to work -- if your sysroot
(i.e., the tmp dir) is in different place for different builds, then
they are entirely separate builds, you should not share sstate between
them. If you want to share the sstate, you need to share the sysroot.

But it might be worth having some sort of sanity checker to catch this
kind of misconfiguration.

Tomas


-- 
http://sleepfive.com

