Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.7187.1622202554981117984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 04:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:37206 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lmazJ-007m7v-Tp
	for openembedded-core@lists.openembedded.org; Fri, 28 May 2021 07:49:13 -0400
Date: Fri, 28 May 2021 07:49:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: looking for OE recipe examples to demonstrate "externalsrc" usage
Message-ID: <cdc6edcc-ca3c-db8-c449-dd56b8d7450@crashcourse.ca>
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


  the scenario: existing codebase where lots of (Makefile-based)
source components each exist in their own local directory and are,
little by little, being transmogrified into OE recipes but in a very
cumbersome way.

  almost all of those source directories are massively contaminated
with hard-coded references to internal helper ".mk" makefiles to
assist in the local building, which flies in the face of OE wanting
pristine, unadulterated source as a starting point, with all local
customization happening in the recipe file. as it is, rather than
defining recipe files that take advantage of "externalsrc", those
recipe files simply set SRC_URI to point at the source directory, then
add some internal hackery to manually copy the generated artifacts
into ${D}. it's messy, and it seems to really make a mess of
dependencies, so here's my cunning plan.

  at a minimum, maintainers will be advised that their source
directories must be cleansed of all local references, and makefiles
can accept settings only through the environment, at which point the
corresponding recipe file can then be written properly using
"externalsrc."

  i want to add some samples of this to the current layer just so
developers can see how this works (recipes and source just for
examination, not for incorporation into the build). so it occurred
that i should just find some really simple, Makefile-based recipes in
OE, bitbake the fetch/unpack/patch steps, then just copy the resulting
source from WORKDIR elsewhere, and modify the recipe file to point at
it using externalsrc.

  as an example i've already put in place, there's the dmidecode
recipe:

http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb?h=master

and its top-level Makefile:

https://git.savannah.nongnu.org/cgit/dmidecode.git/tree/Makefile

again, the only purpose of this is to present some examples of some
component source directory that is "externalsrc-ready", and stealing
some OE recipes seems to be by far the easiest way to do this.
(whether or not you like the dmidecode Makefile is not the point. :-)

  a couple other examples i've stolen are squashfs-tools:

http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb

and ic2-tools:

http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/i2c-tools/i2c-tools_4.2.bb

both of which transform nicely to using externalsrc.

  to the current layer i'm working with, i'm going to add a
"recipes-externalsrc" directory, whose purpose is to simply
demonstrate the proper use of this class, so i'm open to more
suggestions of OE recipes that would make for good examples, perhaps
getting increasingly complicated along the way (all Makefile-based for
now).

  thoughts? suggestions?

rday
