Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.2692.1630666666274599813
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 03:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:58380 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mM6tG-0003ST-GM
	for openembedded-core@lists.openembedded.org; Fri, 03 Sep 2021 06:57:44 -0400
Date: Fri, 3 Sep 2021 06:57:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: wanting to clarify some shared lib install and packaging issues
Message-ID: <e819f3ff-af68-fac7-b1a8-19a5b1f26d7@crashcourse.ca>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  some really basic observations and questions about shared libs from
BB recipes as i'm trying to resolve some issues related to a weird
hybrid build system that overrides the standard do_install() task by
manually populating the "image" directory for each recipe, then hands
control over to bitbake to take it from there.

  first, quick review as i am going to have to explain all this to
some folks, so let's make sure i don't sound like an idiot. from the
explanation here:

  https://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html

when a BB recipe creates a shared lib, i typically expect to see the
following under image/usr/lib/ (example from "nettle" directory
building for aarch64):

  libhogweed.so -> libhogweed.so.6.4          [linker name]
  libhogweed.so.6 -> libhogweed.so.6.4        [soname]
  libhogweed.so.6.4                           [real name, actual lib]

based on default packaging defined in bitbake.conf, i then expect to
see the "base" package "nettle" install the following on the target:

  libhogweed.so.6 -> libhogweed.so.6.4
  libhogweed.so.6.4

while the development package nettle-dev will contain support the
linker name linking to, well, one of the above:

  libhogweed.so -> libhogweed.so.6.4

so far, nothing interesting, but this packaging means that, on the
target, if something needs to link against the libhogweed library, it
would normally link using the soname, "libhogweed.so.6", so a file by
that name *must* exist on the target and, normally, it does (even if
it's a symlink).

  here's what i just ran into -- this hybrid system that bypasses the
normal BB install step and manually populates the image directory
makes a bit of a mess with setting the symlinks and names properly,
but this was "fixed" by totally redefining the standard recipe
packaging, so that *all* shared lib files (all three forms) were
stuffed into the base package. and as long as that weird repackaging
was in place, everything "worked".

  along comes me, who really hates this re-definition of what goes
into each package as it packages far more for the target than is
necessary, and i revert the packaging back to the standard ... and
things break, and here's why.

  the end result of the weird hybrid installation and my reverting the
packaging is that what ended up on the target in terms of the shared
libs was simply:

  libfubar.so

that is, the actual shared lib (not a symlink), but with the linker
name, not the soname, which would appear to be the cause of all sorts
of things suddenly not running anymore, as a quick inspection showed
systemd services trying to start and complaining:

  ... error while loading shared libraries: libfubar.so.1 ...

so i just want to confirm that all of that is due to the shared lib
having been packaged and installed on the target via its linker name,
not its proper soname, correct?

  it *seems* like that's all i have to fix, but am i overlooking
anything? as long as the shared lib is findable via its soname, should
that be the general solution?

rday
