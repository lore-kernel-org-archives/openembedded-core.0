Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.10976.1619005490843724510
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 04:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:45666 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lZBHl-0000XI-Dv
	for openembedded-core@lists.openembedded.org; Wed, 21 Apr 2021 07:44:50 -0400
Date: Wed, 21 Apr 2021 07:44:45 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: standard for names for local source mirror tarballs for git-based recipes?
Message-ID: <373df555-e7c2-f0b4-11c5-575d209391ea@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
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


  based on my recommendation, colleague created a local source mirror
to start collecting tarballs so as to minimize amount of downloading
for various builds. names of tarballs that correspond to fixed
(versioned) tarballs was fairly obvious, but he got stuck trying to
local source mirror a tarball for googletest (from meta-oe), which
contains (among other things):

  googletest_git.bb
  ...
  PV = "1.10.0"
  S = "${WORKDIR}/git"
  SRCREV = "703bd9caab50b139428cea1aaff9974ebee5742e"
  SRC_URI = "git://github.com/google/googletest.git"

he wasn't sure what name the tarball should have in order to be
recognized in the local source mirror. i didn't have the answer off
the top of my head, but since for years i've enhanced all my builds
with a site.conf file containing:

  SOURCE_MIRROR_URL ?= "file:///home/rpjday/oe/dist/tarballs/"
  INHERIT += "own-mirrors"
  BB_GENERATE_MIRROR_TARBALLS = "1"

i just added googletest to a random build to see what i'd get, and
got:

  git2_github.com.google.googletest.git.tar.gz

i guess i'd never paid close attention to the name generation for such
things, but i'm *assuming* that the name generation by the appropriate
fetcher code simply encodes everything there is to know about the
source so that the appropriate tarball is recognized as the local
source mirror version for that recipe. is that about right?

  second question: clearly, the simple name of that tarball doesn't
encode the PV or SRCREV values, so what happens if the base recipe
suddenly bumps PV up to 1.11.0? i'm sure the answer is obvious, i've
just never thought about it.

rday
