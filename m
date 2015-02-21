Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 2858771637
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 10:09:34 +0000 (UTC)
Received: from [99.240.204.5] (port=44831 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YP706-0003V4-OP for openembedded-core@lists.openembedded.org;
	Sat, 21 Feb 2015 05:09:30 -0500
Date: Sat, 21 Feb 2015 05:09:30 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1502210434001.12954@localhost>
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
Subject: questions about WORKDIR and S usage and files/ stuff
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
X-List-Received-Date: Sat, 21 Feb 2015 10:09:35 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  some admittedly simple questions about the WORKDIR layout to make
sure i understand it *completely* as the basis for further questions.
(if all of this is documented in an OE or YP manual somewhere, that'd
be great.)

  from bitbake.conf, i can see the default setting for a recipe's
WORKDIR:

BASE_WORKDIR ?= "${TMPDIR}/work"
WORKDIR = "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"

and, across all of the layers i have checked out, the only place i've
seen where a recipe changes that value is here:

openembedded-core/meta/recipes-devtools/gcc/gcc-source.inc:WORKDIR =
"${TMPDIR}/work-shared/gcc-${PV}-${PR}"

which makes sense since gcc is a special case -- in short, for any
kind of "normal" recipe, there is no compelling reason to ever mess
with the WORKDIR variable, is there?

  next, S, and its default value, again from bitbake.conf:

  S = "${WORKDIR}/${BP}"

as i read it (and i sure hope i understand this correctly), the S
directory is where a recipe's source is going to be unloaded and
patched, correct? and, AFAICT, setting this is a *choice* on the part
of the recipe author. leaving that value as it is seems to be
perfectly reasonable, or a recipe author can tweak it to some other
moderately-related value. i've seen numerous examples where, if the
SRC_URI refers to a git repo, the recipe author sets:

  S = "${WORKDIR}/git"

but, again, that's a *choice*, correct? just because you're cloning
from a git repo doesn't *require* you to set S that way, does it? is
there any standard OE convention or, more importantly, *requirement*
for the value of S depending on the recipe?

  moving on, when a recipe contains associated files in a files/ or
${PN}/ directory, as i read it, all of those files are always copied
directly into ${WORKDIR} for further processing, correct? as in, it
doesn't matter how you set S for that recipe, all files listed with
"file://" in the recipe's SRC_URI will be copied directly to
${WORKDIR}, yes? and those files fall into two major categories.

  if a file is a patch file (.diff,.patch suffix), it will be applied
automatically. if it's not a patch file, then it only makes sense if
the corresponding recipe manually and explicitly does something with
that file, correct? otherwise, there's no point in it being there.

  consider the obvious recipe for base-files -- that contains a
SRC_URI that reflects *nothing* but explicit files to populate the
destination ${D} directory, and each one of those files *must* be
manually installed in ${D} somewhere in the recipe, or there is no
point in that file in even being there, correct? (i ask this painfully
simple question because i *know* i've run across recipes that list a
non-patch file in SRC_URI that the recipe subsequently does nothing
with, and i always explain to students that that's a bit of an oddity
and probably represents a historical holdover.)

  sticking with those non-patch files, it makes sense that all of them
should be processed relative to their location in ${WORKDIR} (which is
where they've all been copied), but occasionally, i'll see a recipe
that sets:

  S = ${WORKDIR}

then refers to all those files relative to ${S}. sure, that'll work,
but it always struck me as dangerous in case you ever need to use a
separate S directory down the road, then you'd have to change the
entire recipe.

  as an example, consider base-files again, which sets:

  S = "${WORKDIR}"

but not for any reason that i can see since that recipe consists of
nothing but explicit files, and all of their processing is done with
respect to ${WORKDIR}, anyway, which strikes me as the right way to do
it. so, a question -- what is the point of the base-files recipe
setting S to that value? doesn't seem to have any purpose that i can
see.

  finally(?), i've seen a number of recipes that set:

  S = "${WORKDIR}"

even if they have a SRC_URI tarball *and* some accompanying files to
process. i'm *assuming* this is acceptable as long as the recipe
author knows that unloading both the tarball source and the files into
the same WORKDIR won't cause any name clashes, yes? it would seem to
always be cleaner to keep the source in a subdirectory, but if a
recipe author wants to mix everything in the same place, i guess
that's a possibility. is there any *compelling* reason to set S =
${WORKDIR}?

  i think that's it for now ... i just wanted to make sure i
completely understand this variable usage as the basis for the next
posting or two.

rday

p.s. i also notice that a small number of OE recipes contain the
apparently redundant setting:

$ grep -r "^S = \"\${WORKDIR}/\${BP}\"" *
meta/recipes-extended/texinfo/texinfo_4.8.bb:S = "${WORKDIR}/${BP}"
meta/recipes-extended/texinfo/texinfo_5.2.bb:S = "${WORKDIR}/${BP}"
meta/recipes-support/taglib/taglib_1.9.1.bb:S = "${WORKDIR}/${BP}"
$

which i would be tempted to remove, just because i'm a big fan of
minimalization.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

