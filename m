Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 596 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 24 Feb 2016 21:59:49 UTC
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 481647727B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 21:59:49 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20160224214952427_0486
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 21:49:52 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [127.0.0.1] (port=58782 helo=localhost)
	by astoria.ccjclearline.com with esmtpa (Exim 4.80)
	(envelope-from <rpjday@crashcourse.ca>) id 1aYhKr-00009x-Gg
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Feb 2016 16:51:05 -0500
Received: from 99.240.204.5 ([99.240.204.5]) by astoria.ccjclearline.com
	(Horde Framework) with HTTP; Wed, 24 Feb 2016 16:51:05 -0500
Message-ID: <20160224165105.15082xiuxuncffsw@astoria.ccjclearline.com>
Date: Wed, 24 Feb 2016 16:51:05 -0500
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.3.11)
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: trying to summarize the flexibility in bbappend'ing to kernel recipes
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
X-List-Received-Date: Wed, 24 Feb 2016 21:59:50 -0000
Content-Type: text/plain;
 charset=ISO-8859-1;
 DelSp="Yes";
 format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

   let's see if i can explain this properly -- i want to enumerate all
possible ways to .bbappend to a kernel recipe if i have multiple
target machines and multiple kernel recipes. so let's imagine the
following scenario -- i grab a layer that has two recipe files for
two versions of the kernel, *and* i have two target boards. so ...

  * linux-4.0.bb
  * linux-4.1.bb

and i have two target machines, "mach1" and "mach2", and the combination
of all of these involves various patches. so what are my possibilities?

   first (as long as i understood chris larson properly), i can define
two separate .bbappend files:

  * linux-4.0.bbappend
  * linux-4.1.bbappend

or i can define a single wildcard .bbappend file that covers both:

  * linux-4.%.bbappend

so far, so good.

   next, in these .bbappend files, SRC_URI can refer to any of:

  * .scc files
  * .patch/.diff files
  * .cfg files

so each of my two .bbappend files can enumerate a different set
of files to be applied to that version of the kernel. but wait ...
there's more.

   in each .bbappend file, i can conditionally include files in the
SRC_URI, as in:

  * SRC_URI_mach1 += mach1.patch

so depending on the target machine, i can conditionally include
any of patch files, cfg files or scc files.

   in addition, i can take advantage of FILESEXTRAPATHS, that i once
wrote up here:

   http://www.crashcourse.ca/wiki/index.php/Poky_bbappend_FILESEXTRAPATHS

so that i have a ridiculous set of possibilities as to which patch
files will be applied depending on the:

  * architecture
  * distro
  * target machine

am i making sense so far? because there will be more coming shortly.

rday




