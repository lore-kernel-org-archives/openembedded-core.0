Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SDm2Z-0003s8-1L
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 02:19:35 +0200
Received: by pbcum15 with SMTP id um15so2141713pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 17:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=o1iyFxobH6/8xOO8eYU2lAolZJ4GFP6RwmWAjrSDUmU=;
	b=KO/1pXt9VuriVhQP5tuXW3amqwPwjkCs3pEhBdUWnQfJd4VWCCTqp8DRxrPchRZt1t
	dqoe1vHp8N56AAk4gkA7xeTqalD+NIGVCZ/sEQgMAQpFNSbb1ZwO25PWcD7lJ+x6lSzQ
	gtvBwd02U5XIiqphwL/tz6markRQXmxnHmmJf7C0umJBzjqExr3tRf9tW+Q7+VfBXJOG
	1m8q8PYqj4sBhkSSQoxcVpd86f5b22jOQ2Dv9QS/WsNGXpPERCaRpzhf4JvC65T2Jb9D
	QiW8WG5EXzxRF6CX6P12Nd077QlLM41wx0So91EkL6h1jPh1t0oZIfIPctUd2FfdaOhi
	MyNQ==
Received: by 10.68.222.165 with SMTP id qn5mr1352877pbc.88.1333152629006;
	Fri, 30 Mar 2012 17:10:29 -0700 (PDT)
Received: from [10.61.32.129] ([69.38.219.78])
	by mx.google.com with ESMTPS id l1sm8402759pbs.34.2012.03.30.17.10.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 17:10:28 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CABcZAN=HPM054rq2_au7ftG8K5kSEqJU4jdLOdh2iHrq1=qz6A@mail.gmail.com>
Date: Fri, 30 Mar 2012 17:10:32 -0700
Message-Id: <3D56E063-F4AD-43A7-8E80-724A6B1BE2A6@dominion.thruhere.net>
References: <CABcZANnPwgsCz=f8_UhM3TZsBotBZ26FYp5Fbxjq_kYqqBs3cQ@mail.gmail.com>
	<025E8263-4786-499A-A57D-BF1D677452CC@dominion.thruhere.net>
	<CABcZAN=HPM054rq2_au7ftG8K5kSEqJU4jdLOdh2iHrq1=qz6A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQk4lZAChZrMLS/nU22j5fYcZZhc+Oq3ePEGbaUetbyhaFp39uJHaEqqOHbakLskngf2YMkX
Cc: openembedded-core@openembedded.org
Subject: Re: [RFC] One shared state reuse solution
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Mar 2012 00:19:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 mrt. 2012, om 16:23 heeft Chris Larson het volgende geschreven:

> On Fri, Mar 30, 2012 at 3:02 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> Op 30 mrt. 2012, om 14:54 heeft Chris Larson het volgende geschreven:
>>=20
>>> Greetings,
>>>=20
>>> Over the past day, I've implemented a solution for the shared state
>>> reuse issues Mentor has seen with our poky-based product. This
>>> solution is similar in concept to what we had in our Mentor Embedded
>>> Linux 4 (non-yocto-based) product.
>>>=20
>>> This implementation restructures SSTATE_DIR such that non-target
>>> sstate archives are placed in a directory specific to the host we're
>>> running on, and allows fallback to sstates from compatible hosts. In
>>> addition, there is a hook in place for modifying the returned build
>>> host identifier string. Using these capabilities, configured as =
you'll
>>> see below at the gist, I can populate sstate-cache from a Centos5
>>> machine and fully reuse that shared state on a u1004 machine, but if =
I
>>> take the u1004 sstate-cache and pull it over to Centos5, all the
>>> non-target recipes will be rebuilt.
>>>=20
>>> This has a list of "compatible hosts", which are used as fallback
>>> regardless of what distro you're running on, so assumes you won't be
>>> running on a host older than the ones you're using as your
>>> compatibility baseline. I think this will satisfy the needs of most,
>>> and as you'll see when you look at the implementation, is entirely
>>> opt-in currently, so does no harm to anyone who chooses not to =
utilize
>>> it.
>>>=20
>>> https://gist.github.com/2253903 - shows an example of how to make =
use
>>> of this functionality
>>> https://github.com/kergoth/oe-core/compare/sstate-structure - the =
implementation
>>>=20
>>> Regarding the implementation, I realize it isn't as clean as it =
could
>>> be, but the only way to resolve it in a cleaner way would be to =
modify
>>> bitbake, which I wasn't prepared to do at this juncture. The
>>> fundamental issue adding complexity is that SSTATE_DIR is pulled =
from
>>> the configuration metadata, not cached per-recipe, so one can't
>>> manipulate where individual recipes get their archives stored. As a
>>> workaround, I set the global SSTATE_DIR to the host-bound location,
>>> then when writing the archives for target recipes, moves the archive
>>> up to the parent directory (to the root of the original SSTATE_DIR)
>>> and symlinks it back.
>>>=20
>>> Richard had proposed modifying the filename rather than the =
directory
>>> structure (e.g. via the sstate package arch), but this would make
>>> things far more complex. In order to implement fallback, one would
>>> have to mangle the filename, and one wouldn't be able to simply
>>> leverage SSTATE_MIRRORS to fetch the variants in a simple way, as it
>>> would have to attempt to fetch multiple filenames, which would =
require
>>> invasive changes to sstate.bbclass. I think using the directory
>>> structure is the easiest and cleanest route to the goal without
>>> invasive changes, and given it's opt-in nature, I'd like to see this
>>> go upstream, at a minimum as a temporary measure until/if a longer
>>> term more invasive solution occurs.
>>>=20
>>> I'm looking for questions, comments, testers, and in particular,
>>> thoughts on whether this will meet the needs of others with similar
>>> requirements (e.g. others shipping metadata with associated shared
>>> state).
>>=20
>> This is not strictly related to your patchset, but has anyone thought =
about license based blacklisting of sstate? I can imagine that an =
autobuilder will build everything, includes things like evil 3d drivers, =
but no want anyone to access the sstate for those builds.
>=20
> I'd think that this would best be handled as a part of population of
> the shared state mirror. That is, we could create a class like
> copyleft_compliance, but for population of a shared state repository,
> obeying licensing for distribution constraints.

That was my idea as well, but I worded my question too vague :)

regards,

Koen=


