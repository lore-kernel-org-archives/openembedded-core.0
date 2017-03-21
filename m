Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 15C46719E2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 13:23:34 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170321132333259_0684
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 13:23:33 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=50150 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cqJky-0000iv-5X for openembedded-core@lists.openembedded.org;
	Tue, 21 Mar 2017 09:23:24 -0400
Date: Tue, 21 Mar 2017 09:23:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703210915080.29107@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: how to hack cross-compilation into a single "plugins" directory?
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
X-List-Received-Date: Tue, 21 Mar 2017 13:23:36 -0000
Content-Type: text/plain; charset=US-ASCII


  i know this is simple, but if someone can point me at a recipe from
which i can copy and paste, that would be just ducky.

  cross-compiling recipe poptop for powerpc, source available here:

https://sourceforge.net/p/poptop/git/ci/master/tree/

  i found an old OE recipe here:

https://github.com/openembedded/openembedded/tree/master/recipes/poptop

wherein the recipe's do_install_append() routine contains the lines:

  # broken
  sed -ri "s,^[:space:]*logwtmp[:space:]*,# logwtmp," ${D}/${sysconfdir}/pptpd.conf
  rm -f ${D}${libdir}/pptpd/pptpd-logwtmp.so

well, there's a good reason that single plugin is "broken" ... because
the plugins/Makefile reads:

  CC	= gcc
  COPTS	= -O2 -g
  CFLAGS	= $(COPTS) -I.. -I../../include -fPIC
  LDFLAGS	= -shared
  LDADD   = -lutil
  INSTALL	= install -o root
  prefix  = /usr/local

  PLUGINS = pptpd-logwtmp.so

  # include dependencies if present
  ifeq (.depend,$(wildcard .depend))
  include .depend
  endif

  all:	$(PLUGINS)

  %.so: %.c
	$(CC) -o $@ $(LDFLAGS) $(CFLAGS) $^ $(LDADD)

... etc etc ... in short, no clue about cross-compiling -- the
generated plugin is, indeed, an x86-64 ELF executable, not powerpc.

  i'm sure i could tease out how to hack that Makefile, but is there
another recipe with a similar structure i could just steal a Makefile
from?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


