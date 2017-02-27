Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 187EC72FF4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:09:28 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20170227140922469_0486
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:09:22 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=37359 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ciLzI-0004VR-7y for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2017 09:09:16 -0500
Date: Mon, 27 Feb 2017 09:09:13 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1702270819550.25847@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: a few more picky questions about COMPATIBLE_MACHINE usage
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
X-List-Received-Date: Mon, 27 Feb 2017 14:09:29 -0000
Content-Type: text/plain; charset=US-ASCII


  (i apologize for beating this issue to death, but i want to
understand it and, more often than not, what i'm puzzled about always
seems simple but i end up wondering, "ok, is that just sloppily coded,
or is there some subtle property that i'm missing?". anyway ...)

  from examples under meta-openembedded, let's first look at the
recipe meta-efl/recipes-efl/e17/elbow_git.bb, which opens with:

  # webkit-efl isn't available for < armv7a
  COMPATIBLE_MACHINE = "(-)"
  COMPATIBLE_MACHINE_x86 = "(.*)"
  COMPATIBLE_MACHINE_x86-64 = "(.*)"
  COMPATIBLE_MACHINE_armv7a = "(.*)"

  first, that comment seems out of date as it makes no mention of MIPS
or ppc, but that's just being picky.

  next, i assume the line:

  COMPATIBLE_MACHINE = "(-)"

is to initialize the set of compatible machines to the empty set, yes?
i'm more familiar with the construct:

  COMPATIBLE_MACHINE = "(^$)"

to do that, but i'm assuming setting that variable to any unmatchable
value from MACHINE_OVERRIDES will work just as well. (it would be nice
if that were consistent, unless there is something magic about the RE
"-").

  i next assume that lines of the form:

  COMPATIBLE_MACHINE_x86 = "(.*)"

are meant to indicate that if that MACHINE_OVERRIDES comparison
succeeds, then all possible targets are compatible, is that right?
however, given precisely those lines above, is it not equivalent to
just write:

  COMPATIBLE_MACHINE = "(x86|x86-64|armv7a)"

oddly, there is another recipe that seems to do the same thing, but in
a very different way, meta-oe/recipes-support/ne10/ne10_1.2.1.bb:

  COMPATIBLE_MACHINE_aarch64 = "(.*)"
  COMPATIBLE_MACHINE_armv7a = "(.*)"

  python () {
    if any(t.startswith('armv7') for t in d.getVar('TUNE_FEATURES').split()):
        d.setVar('NE10_TARGET_ARCH', 'armv7')
        bb.debug(2, 'Building Ne10 for armv7')
    elif any(t.startswith('aarch64') for t in d.getVar('TUNE_FEATURES').split()):
        d.setVar('NE10_TARGET_ARCH', 'aarch64')
        bb.debug(2, 'Building Ne10 for aarch64')
    else:
        raise bb.parse.SkipPackage("Incompatible with archs other than armv7 and aarch64")
  }

i'm confused ... what is the point of defining these compatibilites:

  COMPATIBLE_MACHINE_aarch64 = "(.*)"
  COMPATIBLE_MACHINE_armv7a = "(.*)"

without first starting with:

  COMPATIBLE_MACHINE = "(-)"

as is stands, isn't the above just saying this recipe is compatible
with everything?

  now, i can see that that anonymous python routine refines the
machine compatibility even further but, to speed things up, why not
first start with just:

  COMPATIBLE_MACHINE = "(aarch64|armv7a)"

or (once again), am i misunderstanding something?

  one more question coming on this, but i want to study it a bit more
carefully first.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


