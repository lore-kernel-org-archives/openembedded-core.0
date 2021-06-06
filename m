Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.23478.1622986326839221055
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 06:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-52-70-26-112-209.dsl.bell.ca ([70.26.112.209]:51204 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lpssY-009SlO-E2
	for openembedded-core@lists.openembedded.org; Sun, 06 Jun 2021 09:32:05 -0400
Date: Sun, 6 Jun 2021 09:31:48 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: canonical way to "migrate" Makefile stuff to bitbake recipe file?
Message-ID: <8e58957-fba8-f192-7ca-15def85458fb@crashcourse.ca>
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


  following on a couple earlier posts, at my current gig, a co-op
student has been given the job of, bit by bit, "migrating" the targets
in a number of sizable Makefiles to BB recipe files, in order to
incorporate all that legacy build process in a current YP
infrastructure.

  he's working on the really low-level targets to begin with, and the
process is kind of hacky -- the source for any component (and its
corresponding Makefile) is simply left where it is (for now), and the
corresponding recipe file (in the simplest possible case) looks like
this for some given "subsystem":

subsystem.bb
============

  inherit migrate

  SRC_URI += "file://subsystem/"
  MG_BUILD_DIR = "subsystem/"

the internal migrate.bbclass handles setting FILESEXTRAPATHS so that
all the subsystems can be located as above, and the do_compile() task
is redefined to be (simplifying a bit):

  do_compile() {
    cd ${MG_BUILD_DIR}
    oe_runmake
  }

in other words, the *building* of any subsystem hasn't really changed
all that much, it's still done pretty much in place as it was before,
at which point there is a do_install() routine whose job it is to take
the generated artifacts and manually "install" them into "${D}" in the
proper locations; in short, the "migration" process emulates the first
part of building a recipe all the way up to emulating the installation
step and getting everything into the ${WORKDIR}/image/ directory,
whereupon the normal packaging and subsequent OE steps kick in. so
far, this is working adequately for the really simple makefile
targets.

  next, as long as this process works, then further recipes can
incorporate build-time dependencies of earlier migrated recipes, so
for subsystem "sub1", we might add:

  DEPENDS += "sub2 sub3"

and that should still work, but said co-op student asked about how to
deal with makefiles with multi-line rules for a subsystem target, call
it "sub", and various sub-components in subdirectories c1, c2 and c3:

  sub: [some dependencies]
	$(MAKE) -C c1
	$(MAKE) -C c2
	$(MAKE) -C c3

my initial reaction was, if those sub-makes can be done independently,
then the simplest solution is to define separate recipes files for
each one (with SRC_URI set appropriately):

sub-c1.bb
=========

  inherit migrate

  SRC_URI += "file://sub/c1/"
  MG_BUILD_DIR = "sub/c1/"

where each of the component recipe files can define its own build-time
dependencies independently of the other components. and one can then
define a collective recipe to gather all of them as build-time
dependencies representing the entire subsystem:

sub.bb
======

  DEPENDS += "sub-c1 sub-c2 sub-c3"

so, for any new recipes, one can independently depend on any subset of
those components, or just depend on them all together if that's
easier.

  is this a reasonable way to go about it? that is, given a
multi-line Makefile rule that refers to building in several immediate
"component" subdirectories, write a separate recipe file for each
component? am i missing anything obvious that would simplify this?

rday


