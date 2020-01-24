Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
	by mail.openembedded.org (Postfix) with ESMTP id 035847FBCD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 15:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id E2F30249DB6;
	Fri, 24 Jan 2020 10:35:53 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id nXGQhF5I9nUM; Fri, 24 Jan 2020 10:35:53 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 75450249DB4;
	Fri, 24 Jan 2020 10:35:53 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 75450249DB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1579880153;
	bh=/RRMz+WXl1AdfJRHBQ5BVY05MQqNYTwAESun/BDCZWA=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=oAlZpGkMmfu7Lo6ILQVcmFW9fh0CUhtLp6fAu9+kHCgcglVDSLqA4ddE2uR4hBFeo
	x5jRqMCuvmW2YRx9VKjDwsNs0HPEjTz7XynUA5132MCmt8FUeJYwsZGn5oH3DvyREp
	qVLa8oj3Q5yIv2+gd67Ul80Xjyuu6jnyTTUpBKNkcu69GzJGadWs6CZaFeopC2HCbe
	bjGiuNSa/9URBUNGCNxq4zWXADDmiinePrGlPaAtIw5OeXfhb9oB4o/Bzw1eoA5XV5
	1ZUEXIOAmM4MJ5v11wkPFrjxCnAMop5F+nbLIJeQVNQ+jlw8b73I4LPV6vCyZPorsQ
	71UX/Pb1jOX7w==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tiXt1eRye4PY; Fri, 24 Jan 2020 10:35:53 -0500 (EST)
Received: from joraj-alpa (192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id 3DF30249DB3;
	Fri, 24 Jan 2020 10:35:53 -0500 (EST)
Date: Fri, 24 Jan 2020 10:35:47 -0500
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200124153547.GA13934@joraj-alpa>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
	<20200120172510.22648-10-alex.kanavin@gmail.com>
	<20200120173722.GA15172@joraj-alpa>
	<CANNYZj943ssJ9U99R_J9HmD_GVkNU6S-T5VLG=+RmHXp7Gbu+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj943ssJ9U99R_J9HmD_GVkNU6S-T5VLG=+RmHXp7Gbu+Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jeremie.galarneau@efficios.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/24] ptests: exclude lttng-tools
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
X-List-Received-Date: Fri, 24 Jan 2020 15:35:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 24, 2020 at 01:47:48PM +0100, Alexander Kanavin wrote:
> I have traced the failing tests to missing supplementary shell scripts that
> apparently are newly added, and weren't packaged to the target.
> 
> Also, /tmp indeed wasn't big enough.
> 
> With those issues addressed (patch is coming), I am still having two
> failures:

Thanks for that effort.

> 
> #     Failed test
> (../../../../../lttng-tools-2.11.0/tests/regression/tools/live/live_test.c:main()
> at line 707)
> # Got first packet index with offset 0 and len 4096
> not ok 6 - Get metadata, received 0 bytes
> FAIL: tools/live/test_ust_tracefile_count 6 - Get metadata, received 0 bytes
> 
> # Got first packet index with offset 0 and len 4096
> not ok 6 - Get metadata, received 0 bytes
> FAIL: tools/live/test_ust 6 - Get metadata, received 0 bytes
> 
> What's weird is that sometimes they pass. Could there be a race or some
> timing issue in the test?

This indeed seems suspicious. Are you able to reproduce it rather quickly? If so
we can continue this in private for the instruction on the base setup so I can
reproduce it and get working on it.

These tests have a lot of moving parts.

Cheers

> 
> Alex
> 
> On Mon, 20 Jan 2020 at 18:37, Jonathan Rajotte-Julien <
> jonathan.rajotte-julien@efficios.com> wrote:
> 
> > Could you point me toward reports for the failing tests?
> >
> > I just want to make sure they are not actual regression.
> >
> > A yocto specific patch was dropped that allowed ptest to pass when
> > lttng-ust is not present. This can be a source of problems.
> > OE commit:015aea5d93614676decd18578a8ae2d68417cfc5
> >
> > Also some tests required a minimum requirement for /tmp that could lead to
> > problem for image/test setup with limited memory since AFAIK /tmp size is
> > derived from the available memory (at least when using qemu test image).
> >
> > Cheers
> >
> > On Mon, Jan 20, 2020 at 06:24:56PM +0100, Alexander Kanavin wrote:
> > > These tests are producing failures that appear and
> > > disappear randomly. This requires investigation
> > > by someone with expertise, so let's disable until then.
> > >
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >  meta/conf/distro/include/ptest-packagelists.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> > b/meta/conf/distro/include/ptest-packagelists.inc
> > > index 49cb9046c6c..f42e90bd187 100644
> > > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > > @@ -58,6 +58,7 @@ PTESTS_FAST = "\
> > >  #    rt-tests-ptest \ # Needs to be checked whether it runs at all
> > >  #    bash-ptest \ # Test outcomes are non-deterministic by design
> > >  #    mdadm-ptest \ # Multiple failures; mdmon crashes in at least one
> > of the tests
> > > +#    lttng-tools-ptest \ # Random failures that are difficult to
> > reproduce
> > >  #"
> > >
> > >  PTESTS_SLOW = "\
> > > @@ -67,7 +68,6 @@ PTESTS_SLOW = "\
> > >      glib-2.0-ptest \
> > >      gstreamer1.0-ptest \
> > >      libevent-ptest \
> > > -    lttng-tools-ptest \
> > >      openssh-ptest \
> > >      openssl-ptest \
> > >      perl-ptest \
> > > --
> > > 2.17.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> > --
> > Jonathan Rajotte-Julien
> > EfficiOS
> >

-- 
Jonathan Rajotte-Julien
EfficiOS

