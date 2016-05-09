Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 2076762135
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 10:40:23 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20160509104021095_0486
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 10:40:21 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=51886 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1azidM-0002eu-Kv for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2016 06:41:52 -0400
Date: Mon, 9 May 2016 06:39:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1605090630480.21387@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: should a SRC_URI referring to "rday.cfg" look for "rday.scc"?
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
X-List-Received-Date: Mon, 09 May 2016 10:40:25 -0000
Content-Type: text/plain; charset=US-ASCII


  (aside: this is with wind river linux 8 and i dropped bruce a note
about it, but i really should keep this stuff on the mailing list.)

  not sure if this is a WRL issue, or more general OE or YP issue, but
i was doing a kernel config yesterday, and my SRC_URI included, say,
"rday.scc", which incorporated both kernel config fragments and
patches, and that worked fine.

  eventually, after massive refactoring, all that was left of that
item was some kernel configuration which was already in "rday.cfg", so
i edited SRC_URI and replaced "rday.scc" with "rday.cfg", but i left
that old "rday.scc" in that directory (with its referent patches),
assuming it would be ignored.

  did a clean and configure and got:

  | DEBUG: Executing shell function do_kernel_metadata
| ERROR: could not find patch rday.patch, included from
.../rday.scc ...

  it *appears* that, even though SRC_URI now refers to (among other
things) just "rday.cfg", it looks like the configure step is *still*
trying to process "rday.scc", which contains a reference to a now
non-existent patch, hence the failure.

  if i just remove (or rename) "rday.scc", then things work fine. is
this expected behaviour? is there some reason that if SRC_URI
includes, say "derf.cfg", the configuration will automatically look
for and try to process "derf.scc"? or am i just doing something silly?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================




