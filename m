Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3CB057C160
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 10:51:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45P3ZX5FGYz4s;
	Wed, 12 Jun 2019 12:51:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560336678;
	bh=FpFK7gbr/a6rbZ1Jh6jKYtq80/ks9IxFLrmsV86HBOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyHGZuRr1YsCSD2DZFGQHgfcn8qnS12GAmA/U9QVJRugTbdgqQ+CzxTHxnczSDSqR
	TNaNv5/bugdiazDeP/hIKCJT5fFErjzl8ZLJ9Q6vyug/CSkzMYpAyJYtlNEhnV1+8t
	fbdo+8BBS/lmpEeq1L5uU/Dw2uv/8ijhdFujfwZk/+olkAPQQrPm8Xzt+AG9+jJazY
	cOAci8TBvO6N7L7WaYmbRnTjxKBFpsaO53YdZtFa/WJOUuGZvqfcrNNk3JBQkCO8aC
	J8gty1gU3LwUolse/JGk1/c1Sa0Ed/lEUoiPH0E1ICL1jrbCbiG6n3seA4S59xloYA
	Tg2E+UPElgd5XRGWxB7Kedt5AuhS7QCsFNBm82I3hDiSZFGtuJ8csum+XEXm3gNiXA
	Gt1gQObroIz8gWqTnsPg6j0+/ipLoDYjBnWj1ar6byaz42Gch2qAqBzKGUk65vCVfx
	7ynlc+OI/55PJVDF66RG4d1of908epiFON1n/wChsHLd+poy6meiaY9RcLPYVqzcNc
	ggae0Nv4a0BkeFPBwZUNZdo/TTpTsGv9hlIrzi5ivF/JAyCl8uZQqxSBmYAhw5NGp1
	g8vjHFnuTouG9Unhf4zjJsDQThlm4RlPhA41Qqm5wp+8F2I6XNCLkKGPfeHcQc3h3p
	xWlR0U1yB04x8lJXijh66PfI=
Date: Wed, 12 Jun 2019 13:51:14 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190612105114.GA23143@localhost>
References: <1560243834-266906-1-git-send-email-zhe.he@windriver.com>
	<be27377cd254f6b314185702300d051d20fb7c28.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <be27377cd254f6b314185702300d051d20fb7c28.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] lttng-modules: Backport patches to fix compilation failures since kernel v5.1
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
X-List-Received-Date: Wed, 12 Jun 2019 10:51:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jun 11, 2019 at 11:49:34PM +0100, Richard Purdie wrote:
> On Tue, 2019-06-11 at 17:03 +0800, zhe.he@windriver.com wrote:
> > From: He Zhe <zhe.he@windriver.com>
> > 
> > For the moment,
> > 0001~0004 are on master branch only.
> > 0005~0007 are on stable-2.11 branch, but v2.11 has not been released
> > yet.
> > 
> > Signed-off-by: He Zhe <zhe.he@windriver.com>
> > ---
> > v2: Correct a typo in SOB for 0001*.patch
> 
> I just discussed this with lttng upstream maintainers a little. We're
> going to have continual tension between keeping lttng-modules up to
> date and new kernel versions.
> 
> How about we also have a git version of this particular recipe which
> has a DEFAULT_PREFERENCE = "-1" but people can opt into with a
> PREFERRED_VERSION when using newer kernels?

Yocto stable series will ship a _git AUTOREV recipe?

> That should keep people using very recent kernels happy, let us use a
> stable release version and avoid us adding/removing large patchsets on
> a semi regular basis?
>...

The semi regular basis is only slightly moved, or how and when will 
replacing the already EOL kernel 5.0 with 5.1 in Yocto be handled?

IMHO it would be better to acknowledge that this is a case where staying 
at stable release versions is sometimes not the best option, and upgrade 
the normal recipe to -rc releases or even a git snapshot from a more 
recent stable branch when necessary.

E.g. right now it seems clear that the next Yocto release will have
to use lttng-modules >= 2.11 in any case for kernel 5.2, so upgrading
from 2.10.9 to 2.11.0-rc5 would be logical.

> Cheers,
> 
> Richard

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


