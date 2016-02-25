Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 0C18F77270
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 10:42:45 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20160225104243789_0486;
	Thu, 25 Feb 2016 10:42:43 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [127.0.0.1] (port=46707 helo=localhost)
	by astoria.ccjclearline.com with esmtpa (Exim 4.80)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1aYtOl-0003rV-Ja; Thu, 25 Feb 2016 05:43:55 -0500
Received: from 216.191.234.70 ([216.191.234.70]) by
	astoria.ccjclearline.com (Horde Framework) with HTTP; Thu, 25 Feb 2016
	05:43:55 -0500
Message-ID: <20160225054355.31601h2jb9pdojr4@astoria.ccjclearline.com>
Date: Thu, 25 Feb 2016 05:43:55 -0500
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Christopher Larson <clarson@kergoth.com>
References: <20160224165105.15082xiuxuncffsw@astoria.ccjclearline.com>
	<CABcZANntxYc_G9ctctpgUMeB1SDZtA6wOWgZbOCzd4UH4tgG_A@mail.gmail.com>
In-Reply-To: <CABcZANntxYc_G9ctctpgUMeB1SDZtA6wOWgZbOCzd4UH4tgG_A@mail.gmail.com>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.3.11)
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: trying to summarize the flexibility in bbappend'ing to kernel recipes
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
X-List-Received-Date: Thu, 25 Feb 2016 10:42:46 -0000
Content-Type: text/plain;
 charset=UTF-8;
 DelSp="Yes";
 format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

   (i'm going to reply to this post just to keep everything in the  
same thread.)

   i'm going to try to clarify all of the ways one can bbappend to a kernel
recipe, and i'll have a few questions along the way. as before, let's
assume i have access to a layer that already gives me two base recipes,
say:

  * linux_4.0.bb
  * linux_4.1.bb

which already come with their own base patches and .cfg and .scc files,
and i want to extend that for two moderately-related target boards,
"mach1" and "mach2", for which i will supply the machine definition
files. i want to be able to handle all possible combinations of kernel
version and target board in a single layer, of course, and while i'll
keep things simple with two kernel versions and two target boards,
this should trivially extend to more of each.

                 bbappend files
                 -------- -----

   first, i could start with kernel version-specific .bbappend files:

  * linux_4.0.bbappend
  * linux_4.1.bbappend

this is *probably* what i'll do, although there are a couple other
possibilities. if the customization is similar, i could just use a
single wildcard bbappend file to handle both with something like:

  * linux_4.%.bbappend, or
  * linux_%.bbappend

i could also (based on that revelation from chris larson that *all* matching
bbappend files will be applied), have a combination of version-specific
*and* wildcard bbappend files, but i suspect that way lies madness and
wow, much overkill. so i think i'll go with one bbappend file per kernel
version.

                 FILESEXTRAPATHS
                 ---------------

   as i mentioned, i once wrote up what i think is still a correct
explanation of FILESEXTRAPATHS here:

   http://www.crashcourse.ca/wiki/index.php/Poky_bbappend_FILESEXTRAPATHS

and i can see a couple possibilities for setting this.

   first, if i want entirely separate patch/scc/cfg directories for each
kernel version, each bbappend file would include the line:

   FILESEXTRAPATHS_prepend := "${THISDIR}/${BP}:"

and i would then create individual customization directories for each
kernel version:

  * linux-4.0/
  * linux-4.1/

(i'm assuming that if i did indeed use a wildcard .bbappend file, the
value of ${BP} would be set properly based on my PREFERRED_VERSION of
the kernel, yes? i can't imagine how that couldn't be true, but let's
just make sure of that.)

   the next possibility for FILESEXTRAPATHS would be if all of my local
customization applied (almost) equally to all possible targets,
i guess i could use the same line in all my bbappend files -- a line
of one of the following forms:

  * FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
  * FILESEXTRAPATHS_prepend := "${THISDIR}/linux:"
  * FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
  * FILESEXTRAPATHS_prepend := "${THISDIR}/rday:"

or whatever i wanted to call it, and just create the corresponding
single customization directory to be used by *all* of the bbappend files.

   the final possibility would seem to be if i want some
kernel version-specific customization *and* some generic customization,
i could create both types of directories:

  * linux-4.0/           (for only 4.0)
  * linux-4.1/           (for only 4.1)
  * linux/               (for all versions)

and each bbappend file would use the line:

   FILESEXTRAPATHS_prepend := "${THISDIR}/${BP}:${THISDIR}/${BPN}:"

so that kernel-specific customization would be searched for first, then
generic customization. that's probably more complicated than i need,
i just want to know that it's *possible*, yes?

                 Conditional SRC_URI
                 ----------- -------

   Given that some customization will differ from target board to target
board, I know I can add conditional customization to my bbappend files
with the syntax:

   SRC_URI_mach1 += "..."
   SRC_URI_mach2 += "..."

but if it's just machine-dependent, I know there's another way to do this,
coming shortly. that is, if i'm going to override based on only values
in FILESOVERRIDES and not OVERRIDES in general, i prefer the
subdirectory approach.

   [side note: i asked about this once upon a time -- is there a
preferred style for this in the sense of which of these two forms
is the encouraged form in bbappend files?

   SRC_URI_mach1 += "..."
   SRC_URI_append_mach1 = "..."

just curious. anyway, onward ...]

                 FILESOVERIDES and FILESEXTRAPATHS subdirectories
                 ------------- --- --------------- --------------

   again, referring to what i *hope* is a correct explanation i wrote for
FILESEXTRAPATHS here (and please let me know if i screwed that up):

   http://www.crashcourse.ca/wiki/index.php/Poky_bbappend_FILESEXTRAPATHS

for each directory "d/" prepended to FILESEXTRAPATHS, the search order for
a new SRC_URI item will be:

   * d/${DISTROOVERRIDES}
   * d/${MACHINEOVERRIDES}
   * d/${TRANSLATED_TARGET_ARCH}
   * d/

so in my example on my wiki page above, building a "poky" distro for
a beaglebone with my customization directory being named "files/",
the search order for my new customization content would be:

   * files/poky/
   * files/beaglebone/
   * files/armv7a/
   * files/arm/
   * files/

so as long as my bbappend SRC_URI overrides can be handled by
FILESOVERRIDES, i prefer to do it this way and not clutter up my
bbappend files with conditional SRC_URI settings, but that's just
a personal preference. obviously, i can mix those two approaches,
but i suspect that just gets overly confusing.

                 Possible kernel SRC_URI customization
                 -------- ------ ------- -------------

   final section, which i'm not entirely clear on. if i create a
kernel bbappend file, the possibilities for SRC_URI customization are
typically (am i missing anything important?):

   * .patch/.diff files
   * .cfg files
   * .scc files
   * a defconfig file

now, the patch and cfg files and the defconfig file will be searched for
based on how i explained FILESEXTRAPATHS above, correct? as in, the
FILESOVERRIDES value will be taken into account. but what about the .scc
files?

   i assume *locating* the .scc file itself is subject to the same
FILESOVERRIDES-based search order, but once you find it, and it contains
either:

   * "patch" directives
   * "kconf hardware" directives pointing to more .cfg fragments

does the search for those internal items start all over again based
on my setting for FILESEXTRAPATHS? in other words, if there is a
single, generic .scc file, can its patch or config fragment references
resolve to machine-specific or distro-specific files? as a guess,
i would think so, but i have no idea, not sure i've ever read that
anywhere. (i'm not saying i would deliberately set things up this way,
it sounds potentially confusing, i just want to make sure that's what is
happening.)

   anyway, i think that's it, did i miss anything? and once i clarify
all this, i'll write another wiki page on it. thanks muchly.

rday




