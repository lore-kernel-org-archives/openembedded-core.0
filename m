Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 6031760DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 10:54:42 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20140804105424908
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 10:54:24 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=59441 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XEFuF-0007qU-OP for openembedded-core@lists.openembedded.org;
	Mon, 04 Aug 2014 06:54:19 -0400
Date: Mon, 4 Aug 2014 06:54:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1408040630210.6237@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: a few questions on the proper use of TEMPLATECONF
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
X-List-Received-Date: Mon, 04 Aug 2014 10:54:44 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  first time perusing all that templateconf stuff, so some admittedly
simple questions.

  i'm looking at oe-setup-builddir, which is where the initialization
of the new build dir is done, so let's start at the top:

  if [ -z "$BUILDDIR" ]; then
    echo >&2 "Error: The build directory (BUILDDIR) must be set!"
    exit 1
  fi

  mkdir -p $BUILDDIR/conf

  if [ ! -d "$BUILDDIR" ]; then
    echo >&2 "Error: The builddir ($BUILDDIR) does not exist!"
    exit 1
  fi

  if [ ! -w "$BUILDDIR" ]; then
    echo >&2 "Error: Cannot write to $BUILDDIR, perhaps try sourcing with a writable path? i.e. . oe-init-build-env ~/my-build"
    exit 1
  fi

  cd "$BUILDDIR"

so, at that point, i have either a new project, or i've simply reset
my working environment into an existing project. so far, so good. the
next few lines are just a bit puzzling:

  if [ -f "$BUILDDIR/conf/templateconf.cfg" ]; then
    TEMPLATECONF=$(cat $BUILDDIR/conf/templateconf.cfg)
  fi

  . $OEROOT/.templateconf

could that not have been written with an "else" clause?

  if [ -f "$BUILDDIR/conf/templateconf.cfg" ]; then
    TEMPLATECONF=$(cat $BUILDDIR/conf/templateconf.cfg)
  else
    . $OEROOT/.templateconf
  fi

after all, if you have an existing templateconf.cfg and use that to
set TEMPLATECONF, what is the point of subsequently sourcing the
OEROOT .templateconf file, which will simply realize it's been set and
do nothing? (yes, i realize it doesn't hurt, but i firmly believe in
not invoking code that clearly has no value -- it's just confusing for
people who want to RTFS. :-)

  next, i assume that while it's natural to put overriding conf files
in a layer/conf file, they can be placed anywhere, correct?

  also, there appear to be a few typos in that script. here:

echo >&2 "Error: '$TEMPLATECONF' must be a directory containing local.conf & bblayers.conf"

  i assume those names should be local.conf.sample and
bblayers.conf.sample, yes? and a couple other minor typos in comments.

  thoughts?

rday

p.s. oh, one more observation. at the end of oe-setup-builddir:

  if [ -z "$OECORENOTESCONF" ]; then
    OECORENOTESCONF="$OEROOT/meta/conf/conf-notes.txt"
  fi

given that poky uses "meta-yocto/conf" as the default basis for the
sample files, why is this code explicitly using "meta/conf"? i notice
that there are two files with that name under the poky checkout:

[poky]$ find . -name conf-notes.txt
./meta-yocto/conf/conf-notes.txt
./meta/conf/conf-notes.txt
$

  do you really want to mixing those references? yes, the files appear
to be identical, but it's still potentially confusing.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


