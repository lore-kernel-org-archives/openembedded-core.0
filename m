Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id E8A427318E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 14:03:17 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20160816140308916_0484
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 14:03:08 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=29375 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bZezH-0003BA-04 for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2016 10:05:03 -0400
Date: Tue, 16 Aug 2016 10:02:59 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1608160956340.7804@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: subtle weirdness when you combine "_append" with "+="?
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
X-List-Received-Date: Tue, 16 Aug 2016 14:03:18 -0000
Content-Type: text/plain; charset=US-ASCII


  was about to submit a small number of patches to clean up redundancy
when people combine "_append" with "+=" (because it offends my
delicate sensibilities), and ran across this in oe-core,
unfs3_0.9.22.r497.bb:

  DEPENDS_append_class-nativesdk += "flex-nativesdk"

uh, what?

  most of the time, i assume the above doesn't hurt, it's just ...
silly. but normally, with "_append", you *need* to add the leading
space explicitly, and that's not being done above. so does that mean
that combining "_append" with "+=" *does* generate a leading space?
that just makes my head hurt -- the possibility that "_append" is
being used in a way that normally makes it fail, only to have "+="
step in and save the day. at which point "_append" saves processing
that until the end of parsing? yeesh.

  thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


