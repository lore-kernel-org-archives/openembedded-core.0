Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SDjvh-0007mR-VJ
	for openembedded-core@openembedded.org; Sat, 31 Mar 2012 00:04:22 +0200
Received: by qcso7 with SMTP id o7so634589qcs.6
	for <openembedded-core@openembedded.org>;
	Fri, 30 Mar 2012 14:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=a/SwcXCeMaqBkpFKWuammF2NiXJCrZ7tobO4CsZZJG8=;
	b=pXLb29oxhkv+Wn5kYePASHmZrModX69sg97pUblX4emnvS7hMcXHm6d1W/zqMUbVxi
	IAeMjNv4GEC9VbeoSk2bkayl+LmqjEqlaO4MwNMxmo6IpTnEc0JQjaw1b7Ap99QQm2jn
	xmbCavVuuj43qNlwx3C7OHlsq0ruiwVj0FYLzXgqeUblHkcRTuYfvOwU0x4s2EV5goLW
	E8cDqksNpNVqYziduZg0/uQCqvtqv9KADJOY7Ss43xVfRHrOmEs08v6hNS1AS9R7hhud
	nMFI0OUZk02cr3pGsPJuZO1/3DnWvjAEKw1V8rJCat7LykJmfcchCAl6SmSe3aSlJU5a
	yIPQ==
Received: by 10.229.111.210 with SMTP id t18mr1499697qcp.145.1333144516637;
	Fri, 30 Mar 2012 14:55:16 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Fri, 30 Mar 2012 14:54:56 -0700 (PDT)
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 30 Mar 2012 14:54:56 -0700
X-Google-Sender-Auth: YHZRJBPhFE5q_vf8822wQiwpQi4
Message-ID: <CABcZANnPwgsCz=f8_UhM3TZsBotBZ26FYp5Fbxjq_kYqqBs3cQ@mail.gmail.com>
To: openembedded-core@openembedded.org
Subject: [RFC] One shared state reuse solution
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
X-List-Received-Date: Fri, 30 Mar 2012 22:04:22 -0000
Content-Type: text/plain; charset=UTF-8

Greetings,

Over the past day, I've implemented a solution for the shared state
reuse issues Mentor has seen with our poky-based product. This
solution is similar in concept to what we had in our Mentor Embedded
Linux 4 (non-yocto-based) product.

This implementation restructures SSTATE_DIR such that non-target
sstate archives are placed in a directory specific to the host we're
running on, and allows fallback to sstates from compatible hosts. In
addition, there is a hook in place for modifying the returned build
host identifier string. Using these capabilities, configured as you'll
see below at the gist, I can populate sstate-cache from a Centos5
machine and fully reuse that shared state on a u1004 machine, but if I
take the u1004 sstate-cache and pull it over to Centos5, all the
non-target recipes will be rebuilt.

This has a list of "compatible hosts", which are used as fallback
regardless of what distro you're running on, so assumes you won't be
running on a host older than the ones you're using as your
compatibility baseline. I think this will satisfy the needs of most,
and as you'll see when you look at the implementation, is entirely
opt-in currently, so does no harm to anyone who chooses not to utilize
it.

https://gist.github.com/2253903 - shows an example of how to make use
of this functionality
https://github.com/kergoth/oe-core/compare/sstate-structure - the implementation

Regarding the implementation, I realize it isn't as clean as it could
be, but the only way to resolve it in a cleaner way would be to modify
bitbake, which I wasn't prepared to do at this juncture. The
fundamental issue adding complexity is that SSTATE_DIR is pulled from
the configuration metadata, not cached per-recipe, so one can't
manipulate where individual recipes get their archives stored. As a
workaround, I set the global SSTATE_DIR to the host-bound location,
then when writing the archives for target recipes, moves the archive
up to the parent directory (to the root of the original SSTATE_DIR)
and symlinks it back.

Richard had proposed modifying the filename rather than the directory
structure (e.g. via the sstate package arch), but this would make
things far more complex. In order to implement fallback, one would
have to mangle the filename, and one wouldn't be able to simply
leverage SSTATE_MIRRORS to fetch the variants in a simple way, as it
would have to attempt to fetch multiple filenames, which would require
invasive changes to sstate.bbclass. I think using the directory
structure is the easiest and cleanest route to the goal without
invasive changes, and given it's opt-in nature, I'd like to see this
go upstream, at a minimum as a temporary measure until/if a longer
term more invasive solution occurs.

I'm looking for questions, comments, testers, and in particular,
thoughts on whether this will meet the needs of others with similar
requirements (e.g. others shipping metadata with associated shared
state).
-- 
Christopher Larson


