Return-Path: <mac@mcrowe.com>
Received: from avasout03.plus.net (avasout03.plus.net [84.93.230.244])
	by mail.openembedded.org (Postfix) with ESMTP id EDC697FA10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 20:08:04 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id fUkZiiaDeKleZfUkaiwsPs; Thu, 12 Dec 2019 20:08:03 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GfxpYjfL c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pxVhFHJ0LMsA:10
	a=9orJIChNB6tlqqBYFbYA:9 a=CjuIK1q_8ugA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com; 
	s=20191005;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=ZiCqALZBeE4ZiFaAQImoXoJr5IzACOu2NhoX7OhgsM4=;
	b=L4P0A
	uqF1FPwd3JepAOOt9zJto1agBlmniAapIUHkGm/VrJoB9rJnCdJUO2yIDy39PKMUBKILsKFk08JaM
	Kd1SOEaqBOvJo5opB3FR79Q7AqCpPqXrM9r8YlwipXeS0eXFEYaOxrWSkJhBPnS4Xpge5RzZ0fXSn
	hWVR9x9IMDcRdTj5ThLBV3KNlAjw2Ekw1NNoQISRi/SAHQyoOoOaNIiUvoYSuZHtmHh9dh19uYY5Q
	xWxswBiqVI5MatJuoorqMl+DscuUNNlyNKvW2M5YjUb70gb7uK5Yvu7rWuq8zc7LF9UOOaexWQ7/O
	wYsk1XUMpjynmHKOE8dL9NyY0wzig==;
Received: from mac by deneb with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1ifUkZ-0003LR-8X; Thu, 12 Dec 2019 20:07:51 +0000
Date: Thu, 12 Dec 2019 20:07:51 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191212200751.GA6113@mcrowe.com>
References: <20191212160557.GA9981@mcrowe.com>
	<3c5243c3abf579069c651312902ca48a087e9842.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <3c5243c3abf579069c651312902ca48a087e9842.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfK117I1unxT9Nq4cbD6b9j7oI8d9E4Nk1nkj8GpeComBWvo4FUyattHAgRi+eRT9L8O3w5ox+BPvc32cppPMmvFQ6QA0AKain5kyXbTCAS3Q/M8mj+vi
	RuovNRMK7gI8ExABY5tAe8qw3RK9fOlUdXBCKEbEzR2vxrni3RFfkDa8
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Use of multilib.conf taints hashes of -native recipes
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
X-List-Received-Date: Thu, 12 Dec 2019 20:08:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thursday 12 December 2019 at 18:17:37 +0000, Richard Purdie wrote:
> On Thu, 2019-12-12 at 16:05 +0000, Mike Crowe via Openembedded-core
> wrote:
> > We compile for a variety of machines, some of which require
> > multilib.conf
> > and some that do not. I was surprised to discover when switching
> > between
> > machines that the do_populate_sysroot_setscene tasks run for many
> > -native
> > recipe. :(
> >
> > It looks like this is because RECIPE_SYSROOT changes:
> >
> >  Variable RECIPE_SYSROOT value changed from '${WORKDIR}/recipe-
> > sysroot' to '${WORKDIR}/${MLPREFIX}recipe-sysroot'
> >
> > This problem goes away if I add the following line to native.bbclass:
> >
> >  RECIPE_SYSROOT = "${WORKDIR}/recipe-sysroot"
> >
> > but this feels like I'm solving the problem in the wrong place. Would
> > it be
> > better to modify multilib.conf to say something like:
> >
> >  RECIPE_SYSROOT_class-target = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
> >
> > instead? (Although I'm rather worried that this will stop it actually
> > working.)
>
> I'm a little bit surprised we don't have tests which detect this.
>
> "oe-selftest -r ssstatetests"
>
> should have something which detected this, at least from memory. Could
> you take a look and see if we're missing some testcase?

There are only two test cases that mention multilib:

 test_sstate_nativesdk_samesigs_multilib
 test_sstate_sametune_samesigs

Neither seems to test for this. I shall try to write one that builds
binutils-native both with and without multilib.

Thanks.

Mike.

