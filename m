Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.8141.1622728860666244432
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 07:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:47276 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lonu6-00AWOM-Jw
	for openembedded-core@lists.openembedded.org; Thu, 03 Jun 2021 10:00:59 -0400
Date: Thu, 3 Jun 2021 10:00:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: want to clarify proper approach to shared lib (.so) installation
Message-ID: <b389383-5997-4638-97f-e6919364bda7@crashcourse.ca>
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


  sort of a 2-part soliloquy. in current YP code base i've inherited,
most of the internal (local directory SRC_URI-based) recipes inherit a
proprietary class that, among doing other internal, proprietary
things, totally redefines PACKAGES as:

  PACKAGES = "${PN} ... ${PN}-dev ..."

i had never really noticed that before, but it's pretty obvious that
that's not a great idea, as it allows what i call the recipe "base"
package (${PN}) to gather up everything that matches its standard
wildcard pattern before moving on, in effect "stealing" content from
subsequent packages they would normally get if the base package was at
the end, not the beginning.

  somehow, this has worked all this time, but it's clear(?) that what
would be the "normal" contents of the various packages isn't going to
be what one would expect; in particular, the base package is going to
be what i call "overpackaged", with lots of stuff it doesn't really
need so i'm guessing what's going into the image is more than is
really necessary. somehow, though, it's worked all this time until
recently, when i noticed this quirk was causing some Q/A issues, so i
took a deep breath, commented out that line from the class file to use
the default packaging approach and re-tried the build, which is when
all hell broke loose.

  it turns out that these internal recipes use local Makefile-based
source directories, which build, then install their generated
artifacts in a temporary (non-YP) staging area per recipe, *then*
manually (little by little) install stuff in ${D} via a general
do_install() routine, at which point the regular packaging and
subsequent steps kick in, but it's what now gets copied into ${D} that
is causing grief.

  apparently, many of these recipes generate a shared library, and i'm
well aware that the *normal* packaging involving a shared library is
like this example from libidn2 (snipped for brevity to show only
shared lib stuff):

 libidn2/
  usr/
   lib/
    libidn2.so.0 -> libidn2.so.0.3.7
    libidn2.so.0.3.7                    [actual library file]

 libidn2-dev/
  usr/
   lib/
    libidn2.so -> libidn2.so.0.3.7

so the *normal* packaging for a shared lib is that the lib itself and
a symlink to it go into the base package, while another symlink goes
into the "-dev" package. i'd never really paid that much attention to
that until i reset that PACKAGES variable, as all of these internal
recipes end up installing into ${D} nothing but the shared lib file
itself under /usr/lib, and why this has worked all this time is a
mystery, but having made this change is generating all sorts of Q/A
diagnostics as this is what ends up in ${D} using a "fubar" recipe
example given the manual installation being done using normal
packaging:

 fubar/
  usr/
   bin/
    ... snip ...
   no lib/ directory

 fubar-dev/
  usr/
   lib/
    libfnvcma.so            [actual shared lib]

unsurprisingly, there are QA issues with the above:

ERROR: fubar-1.0-r0 do_package_qa: QA Issue: -dev package contains non-symlink .so: fubar-dev
path .../packages-split/fubar-dev/usr/lib/libfnvcma.so'[dev-elf]
ERROR: fubar-1.0-r0 do_package_qa: QA Issue: fubar rdepends on fubar-dev [dev-deps]

  *sigh*.

  in short, because these internal recipes generate only the single
shared lib file itself and that's all that's copied into ${D}, the
regular Q/A tests will naturally barf, and i could use INSANE_SKIP all
over the place to get around this, but it seems to me that the proper
approach is to tell the developers that they need to start generating
the appropriate symlinks for all of their recipes so packaging is done
properly.

  i'm just about to check if there is a switch or class i can invoke
that will "fix" this issue (as in, set up the shared libs in ${D}
properly), but apart from that, am i correct in thinking that the
developers need to do this correctly from the beginning?

rday
