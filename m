Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SDlJD-00018g-I0
	for openembedded-core@openembedded.org; Sat, 31 Mar 2012 01:32:43 +0200
Received: by qcso7 with SMTP id o7so666067qcs.6
	for <openembedded-core@openembedded.org>;
	Fri, 30 Mar 2012 16:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=LmF/ztMSy4/Dj4VJk7BacH95kQ07Vx1F2qOj4oLlx5k=;
	b=GnlaDSEZwO3odk0vUv66oV892/aFzgMFNJL37eGeOf6IVgsg29d8Am3lozapX5Q74q
	DV1/YOGhbmgMOO/6FVNOEnFJuu4jN0DoSzRfYuOitu+l3ManViNUGm/uh/J96syl1DgH
	WnxddhCztPqB2IX6CoZKGVFphdSjNErPKSoPVmDikNBCODtm7jJIa086ZK7l9IFgqTx7
	j666mDAl7aYoTLexZL+kLafyYpJSK57H3LklBOwMd8/92HBLVgCSDmPj8HdXY32YeA6I
	4z8x2sL1RTzqh2OXt8BcrLhu7ck9T9MEhP9ktKyixwRs3FzElhad1NOYVqi88scXbbxE
	Qtwg==
Received: by 10.229.134.194 with SMTP id k2mr87117qct.125.1333149818254; Fri,
	30 Mar 2012 16:23:38 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Fri, 30 Mar 2012 16:23:18 -0700 (PDT)
In-Reply-To: <025E8263-4786-499A-A57D-BF1D677452CC@dominion.thruhere.net>
References: <CABcZANnPwgsCz=f8_UhM3TZsBotBZ26FYp5Fbxjq_kYqqBs3cQ@mail.gmail.com>
	<025E8263-4786-499A-A57D-BF1D677452CC@dominion.thruhere.net>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 30 Mar 2012 16:23:18 -0700
X-Google-Sender-Auth: wSoI10iPWO6JIYnKKO62dzrYkC0
Message-ID: <CABcZAN=HPM054rq2_au7ftG8K5kSEqJU4jdLOdh2iHrq1=qz6A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 30 Mar 2012 23:32:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 3:02 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> Op 30 mrt. 2012, om 14:54 heeft Chris Larson het volgende geschreven:
>
>> Greetings,
>>
>> Over the past day, I've implemented a solution for the shared state
>> reuse issues Mentor has seen with our poky-based product. This
>> solution is similar in concept to what we had in our Mentor Embedded
>> Linux 4 (non-yocto-based) product.
>>
>> This implementation restructures SSTATE_DIR such that non-target
>> sstate archives are placed in a directory specific to the host we're
>> running on, and allows fallback to sstates from compatible hosts. In
>> addition, there is a hook in place for modifying the returned build
>> host identifier string. Using these capabilities, configured as you'll
>> see below at the gist, I can populate sstate-cache from a Centos5
>> machine and fully reuse that shared state on a u1004 machine, but if I
>> take the u1004 sstate-cache and pull it over to Centos5, all the
>> non-target recipes will be rebuilt.
>>
>> This has a list of "compatible hosts", which are used as fallback
>> regardless of what distro you're running on, so assumes you won't be
>> running on a host older than the ones you're using as your
>> compatibility baseline. I think this will satisfy the needs of most,
>> and as you'll see when you look at the implementation, is entirely
>> opt-in currently, so does no harm to anyone who chooses not to utilize
>> it.
>>
>> https://gist.github.com/2253903 - shows an example of how to make use
>> of this functionality
>> https://github.com/kergoth/oe-core/compare/sstate-structure - the implem=
entation
>>
>> Regarding the implementation, I realize it isn't as clean as it could
>> be, but the only way to resolve it in a cleaner way would be to modify
>> bitbake, which I wasn't prepared to do at this juncture. The
>> fundamental issue adding complexity is that SSTATE_DIR is pulled from
>> the configuration metadata, not cached per-recipe, so one can't
>> manipulate where individual recipes get their archives stored. As a
>> workaround, I set the global SSTATE_DIR to the host-bound location,
>> then when writing the archives for target recipes, moves the archive
>> up to the parent directory (to the root of the original SSTATE_DIR)
>> and symlinks it back.
>>
>> Richard had proposed modifying the filename rather than the directory
>> structure (e.g. via the sstate package arch), but this would make
>> things far more complex. In order to implement fallback, one would
>> have to mangle the filename, and one wouldn't be able to simply
>> leverage SSTATE_MIRRORS to fetch the variants in a simple way, as it
>> would have to attempt to fetch multiple filenames, which would require
>> invasive changes to sstate.bbclass. I think using the directory
>> structure is the easiest and cleanest route to the goal without
>> invasive changes, and given it's opt-in nature, I'd like to see this
>> go upstream, at a minimum as a temporary measure until/if a longer
>> term more invasive solution occurs.
>>
>> I'm looking for questions, comments, testers, and in particular,
>> thoughts on whether this will meet the needs of others with similar
>> requirements (e.g. others shipping metadata with associated shared
>> state).
>
> This is not strictly related to your patchset, but has anyone thought abo=
ut license based blacklisting of sstate? I can imagine that an autobuilder =
will build everything, includes things like evil 3d drivers, but no want an=
yone to access the sstate for those builds.

I'd think that this would best be handled as a part of population of
the shared state mirror. That is, we could create a class like
copyleft_compliance, but for population of a shared state repository,
obeying licensing for distribution constraints.
--=20
Christopher Larson


