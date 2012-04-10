Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SHfOa-0001nm-Jz
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 20:02:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3AHr5sg022257
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 10:53:05 -0700 (PDT)
Received: from msp-dhcp19.wrs.com (172.25.34.19) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 10 Apr 2012 10:53:04 -0700
Message-ID: <4F847380.6000401@windriver.com>
Date: Tue, 10 Apr 2012 12:53:04 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: MIPS vs MIPS32 tunings -- summary and questions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2012 18:02:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

We still do not have a clean answer for how to resolve the concerns in the 
recent thread "conf/machine/include: Cleanup MIPS tunings to match README".  The 
following is in response to a request I received to summarize the discussion so 
far, and include the options to resolve the issue for the current OE-Core release.

If you are interested in this, please be sure to read until the end before 
commenting.

Background:

About 2 weeks ago, in response to a number of patches sent for PowerPC issues, I 
set to the task of documenting and cleaning up the various tune files.  It was 
discovered that since they were originally implemented, a number of minor 
conflicts and defects had crept into the system.  The recent patch set added a 
number of README files and attempted to resolve any duplication, or confusion 
between items.

During this work it was discovered that there were two tunings that produced the 
same package architecture:

mips (tune), optimized for mips1 - o32 ABI, produced packages with a "mips" arch

mips32 (tune), optimized for mips32 - o32 ABI, produced packages also with a 
"mips" arch.

While "mips1" should work on a "mips32" system, the reverse is not true.  There 
was no way to distinguish, in a package feed, the difference between the two 
sets of binaries.

I updated the MIPS tune files to resolve this issue.  The result was:

mips (tune), mips1 - o32 ABI, produced packages with a "mips" arch

mips32 (tune), mips32 - o32 ABI, produced packages with a "mips32" arch

This lead to the thread mentioned above.  At first there were concerns that the 
GNU target arch had changed (from mips to mips32), this was not the case.  The 
only change is in the produced package arch names.  So the package feeds and 
image generation are the only components affected by this change.

After various discussion with folks, such as Khem Raj, it is unlikely that 
anyone would be using oe-core with a "mips1" target.  There may be some mips3 or 
mips4 targets, but we find it highly unlikely based on our current experience. 
Khem suggested resolving this my simply making the "mips" include mips32 as the 
default optimization.

Image generation was verified to produce the same images before and after this 
change for the qemumips target.  I am unable to verify the package feeds, as I 
do not have a suitable setup for this.

So possible solutions to this particular issue, which we do need on prior to the 
upcoming release:

1) Revert the behavior and match that last release.  We have two tunes that 
produce different binaries w/ the same "mips" package arch.
    * This preserves previous behavior, but IMHO continues to implement the defect

mips (tune) - mips1 processor, o32 ABI - mips package arch
mips32 (tune) - mips32 processor, o32 ABI - mips package arch

2) Keep it as it is currently checked in.  Provide the ability to build a basic 
"mips" and a more optimized "mips32" tuned target and package set.
    * This fixes the defect and provides the opportunity for "mips" to be a 
basic common package arch, while mips32 (or additional mips3? mips4? mips32r2?) 
tunes could be used to augment this for specific systems.

mips (tune) - mips1 processor, o32 ABI - mips package arch
mips32 (tune) - mips32 processor, o32 ABI - mips32 package arch

3) Define only one mips tune, with a target package arch of "mips".  Changing 
the basic mips tune, and corresponding mips package arch to include mips32 
optimizations and instructions.
    * This preserves the "mips" tune, but changes the behavior of the tune from 
default compiler, to mips32 optimization
    * Anyone requiring mips3 or mips4 will need to add a tune, and that tune 
will not be compatible with "mips"

mips (tune) - mips32 processor, o32 ABI - mips package arch

   3a) Preserve the mips32 tune entries, but define it as being equal to mips
       * Preserves the tune entries for compatibility, but is anyone directly 
using them?

   3b) Remove the mips32 tune entries -- effectively eliminating mips32 as a tune
       * Removes the tune entries (cleans up the tunes), no compatibility -- but 
it's unlikely anyone was directly specifying "mips32" as their machine's 
DEFAULTTUNE.

My recommendation is either 2 or 3.  The 3a/b variation is simply an 
implementation detail to me, and I will be happy to implement it either way if 
this is the chosen direction.

--Mark


