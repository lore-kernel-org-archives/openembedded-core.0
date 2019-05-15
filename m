Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A2BF27DE39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 13:42:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 453why1P4Fz60;
	Wed, 15 May 2019 15:42:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557927747;
	bh=IPh6mf6UgYeJVsCdPpC4J73VRAufdUIQePwkVx+CjYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gn6yhgm0f6XUfvOTZFyOOr5IAo0S2h0DkkQvIMwDHemowgOm2lXz6ZjS5gSP2AGJG
	7ad3Jm3OSSJ5q8D4iTGckDabKOezldJCmfXULuTR+TxqTaBy+gHatpNx1sZE9ZneWm
	DnROFudvGgZhSdXdo4hPA464jSKG0THViKJNDnG5k7ka2hWH6yOdhihMZ2bGA1s91D
	v0f6xr7jnvYbpTFQfyUHOdbuIbwIpaPNDcVxDn04WdfIH+A6DgV4F6X8o+WNYkjf47
	fqGYLFBhMYX3l9BQvq4nlyKLkkTs2ap9PqznBvcVehSaB+IURpOuTsq88oZqJjFRdt
	z5qQ/RDBTC4gEbZiJ65h1s3oD8QwMXanuG6gqfNkf48vbxbw1Z0Mbpj8X7K5/jT/H3
	bdoclssfxFx5BBTxDTZetYPYwwf5fUh8yyaJF7upjqG5V1W01fXX+64fGdLQipkEFg
	Z37X5zT/pBow6JmVFtw+QRpn4OtGQWkAkuwPrxP+AqgvkEAzoQKj6DfZLJhkFUAeE+
	ARJvL4f097JFGqOKcXBA0IFuUuihm6y2AAkKCNUY+imTmgJGXJ3/fHEz4QoXg2VBpp
	nK0twYmfDP43hmzd2NymrCBZF7nTgcuk1EG8Gvi2J/Skc2J1L7lg5dlrkE+VJUcWma
	uNc0G32Ho0IBOuRzRg+oZRIo=
Date: Wed, 15 May 2019 16:42:18 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20190515134218.GA20396@localhost>
References: <1557912193-40178-1-git-send-email-hongxu.jia@windriver.com>
	<CALbNGRT7NFoRN8EXYDiQ64+0g-bB=jvd7HcfUCRn+_26iRQX4Q@mail.gmail.com>
	<0ffc3e2e-2321-0edb-c90a-76225017472d@windriver.com>
	<20190515110813.GA13420@localhost>
	<6e3c7d20-a86b-9487-5640-0de47f716d95@windriver.com>
MIME-Version: 1.0
In-Reply-To: <6e3c7d20-a86b-9487-5640-0de47f716d95@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: output failed config.log
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
X-List-Received-Date: Wed, 15 May 2019 13:42:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 15, 2019 at 08:30:03PM +0800, Hongxu Jia wrote:
> On 5/15/19 7:08 PM, Adrian Bunk wrote:
> > The end of config.log often contains expected error messages completely
> > unrelated to the actual problem.
> 
> I am afraid you did not suffer pain from it, the most related message
> 
> with do_configure failure is config.log. Take a example, as my previous
> 
> commit [grub/grub-efi: fix unrecognized command line option
> 
> '-pipe-Wno-error' in CFLAGS]
> 
> It takes me hours to reproduce grub/grub-efi build faiure (only
>...

I fully understand your pain, and have already suffered it many times.

> > Debian autobuilders already dump config.log when when configuring failed,
> > and there it is a common problem that people end up searching for the
> > problem in the wrong places due to that.
> 
> It's another story, it is better that autobuilder provide sufficient and
> 
> necessary info and data, not only config.log, but also local.conf,
> 
> all available log.do_***, sources in ${B} and ${S}, even data in ${WORKDIR},
> 
> result of `bitbake -e'
> 
> but before we got there, the fix is best choice for do_configure failure

There is no universal best choice here.

Let me give you an example when building a more recent ofono locally 
with and without your patch.

When a configure task fails, the last lines from log.do_configure
are dumped to the shell.

Without your patch I get when building in a shell:
...
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for signalfd... yes
| checking for dlopen in -ldl... yes
| checking for glib-2.0 >= 2.32... yes
| checking for dbus-1 >= 1.4... yes
| checking for libudev >= 143... yes
| checking for mobile-broadband-provider-info... yes
| checking for ell >= 0.12... no
| configure: error: Embedded Linux library >= 0.12 is required
...

The problem is immediately visible.

With your patch, one has to scroll up through the whole config.log for 
getting this information.

And the config.log contains plenty of other (expected) errors a user 
might mistake as cause of the problem.

For autobuilders dumping config.log can be OK if there is no better 
option available, but people looking at autobuilder logs should be
aware what to scroll over when starting to look at the log.

For anyone building manually in a shell these should really not be done,
it has a high potential of confuding the user and the config.log is 
easily available.

The best available option might be to have a knob with default off,
and autobuilders might be configured to dump config.log.

> //Hongxu

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


