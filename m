Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FBDC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 14:46:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.37108.1702046804891057130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 06:46:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iVvTLNCu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7EFD240008;
	Fri,  8 Dec 2023 14:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702046802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hIi4MGAf4L7V6EvTFq41Sw5lRVUsmuP5QgbJreizPbs=;
	b=iVvTLNCuQas/nx7eJ6wKLeIe27JjnjEht9babGTM6ZJMXLoyVp3opajLm3gHmT5sV3MpZc
	yO1VeTDmb/HF2GHoFl83CruNk0j08gmiAYDYzekZH2JoujoCCBc/vHmqtUPrHElDl1vX1Y
	yOxNftjwgMnGIkmUAoO0dy6HZ+/yr0LC5uQu5OWigq5ozapQyWV8WWPYrVsP44fC14OMrH
	zijynHgbA4ZsM363YxT+r3R/SudrvJU6y546KJR0UKLqVGPOuSReaoCwSTYH5IeFjcJsBk
	kZiTamEGSSH3kNFe3QVSRcWJhMsERZ8zmVVuGysVmvhS43X3frXtF4RKpGyc6w==
Date: Fri, 8 Dec 2023 15:46:41 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org,
	Tim Orling <tim.orling@konsulko.com>, Umesh.Kallapa@windriver.com,
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
	Shivaprasad.Moodalappa@windriver.com
Subject: Re: [PATCH 2/2] rust: Disable rust oe-selftest
Message-ID: <2023120814464190b6f0e7@mail.local>
References: <20231208104800.4175679-1-Yash.Shinde@windriver.com>
 <20231208104800.4175679-2-Yash.Shinde@windriver.com>
 <bb8e3b3c-9f8d-41ac-b67c-f58465c81aef@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb8e3b3c-9f8d-41ac-b67c-f58465c81aef@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 14:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192073

On 08/12/2023 09:05:51-0500, Randy MacLeod wrote:
> On 2023-12-08 5:48 a.m., Yash.Shinde@windriver.com wrote:
> > From: Yash Shinde<Yash.Shinde@windriver.com>
> > 
> > After rust is upgraded to 1.71 and later versions, the rust oe-selftest gives
> > build errors due to unstable nightly options(see the error mentioned below). Thus, disable the test suite
> > until the issue is fixed
> > 
> > error: the option `Z` is only accepted on the nightly compiler
> > thread 'main' panicked at 'failed to gather the target spec for x86_64-poky-linux-gnu', synthetic_targets.rs:66:9
> > 
> > Following issues are created in Yocto bugzilla and rust upstream to track this issue-
> > 
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=15275
> > https://github.com/rust-lang/rust/issues/115642
> > https://users.rust-lang.org/t/does-rust-test-suite-supports-nightly-options-during-bootstrapping-in-rust/103108
> > https://users.rust-lang.org/t/unable-to-read-target-specs-when-rust-1-73-is-bootstrapped-in-yocto-poky/102959
> > 
> > Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> > ---
> >   meta/lib/oeqa/selftest/cases/rust.py | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
> > index 7d148142fc..6dbc517006 100644
> > --- a/meta/lib/oeqa/selftest/cases/rust.py
> > +++ b/meta/lib/oeqa/selftest/cases/rust.py
> > @@ -39,6 +39,9 @@ def parse_results(filename):
> >   @OETestTag("runqemu")
> >   class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
> >       def test_rust(self, *args, **kwargs):
> > +        # Disable Rust Oe-selftest
> > +        self.skipTest("The Rust Oe-selftest is disabled.")
> > +
> >           # build remote-test-server before image build
> >           recipe = "rust"
> >           start_time = time.time()
> 
> Thanks for the Rust update Yash and it's unfortunate that we haven't
> resolved the problems
> with the test suite. We decided to diskable the tests and do the update
> because some changes
> were blocked waiting for a newer version of Rust according to Tim.
> 
> Yash,
> It would be better to disable (skip) the test suite first so that there
> isn't a commit with the testsuite
> broken.
> 
> Alex, the commits are independent, will you please re-order them before
> merging?

Sure!

> 
> ../Randy
> 
> -- 
> # Randy MacLeod
> # Wind River Linux

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

