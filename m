Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 8718971A79
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Nov 2016 11:29:47 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161106112947910_0684
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Nov 2016 11:29:47 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=40314 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c3Ldr-0001mw-5R for openembedded-core@lists.openembedded.org;
	Sun, 06 Nov 2016 06:29:39 -0500
Date: Sun, 6 Nov 2016 06:28:35 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1611060625550.19174@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: "Can't install perl-soap-lite-1.20-r0@all: no package provides /bin/env" ??
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
X-List-Received-Date: Sun, 06 Nov 2016 11:29:48 -0000
Content-Type: text/plain; charset=US-ASCII


  currently writing my first batch of perl recipes, fairly mindlessly
plagiarizing from existing recipes, first bunch worked fine, then i
whipped together a recipe for SOAP::Lite from here:

  https://metacpan.org/pod/SOAP::Lite

built fine, but when i tried to add the perl-soap-lite-1.20-r0.all.rpm
to my core-image-minimal build, i got:

  Computing transaction...error: Can't install \
    perl-soap-lite-1.20-r0@all: no package provides /bin/env

sure enough, that rpm has that dependency:

  $ rpm -qpR perl-soap-lite-1.20-r0.all.rpm
  /bin/env
  /usr/bin/env
  perl
  $

and when i fire up my "qemuppc" session for that core-image-minimal
image, there is indeed no /bin/env file (hence the error), but there
is:

  /usr/bin/env -> /bin/busybox.nosuid

so ... what is the proper solution for this? i suspect i'm going to
run into this issue again in upcoming recipes, so i'd love to resolve
it in a minimally hacky way.

rday

p.s. now that i think about it, why would a package have a dependency
on *both* /bin/env and /usr/bin/env? isn't that sort of redundant?

p.p.s. i searched for the phrase "no package provides /bin/env" as a
first attempt, and i weirdly got this:

https://www.google.ca/search?q=%22no+package+provides+/bin/env%22&ie=utf-8&oe=utf-8&gws_rd=cr&ei=jBMfWJ20JIfZjwTKzarIBg

never heard of that website before, and no other matches. seems a bit
odd.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


