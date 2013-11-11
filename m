Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2746CFEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 10:34:31 +0000 (UTC)
Received: from [173.34.6.101] (port=32876 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VfopC-0003Vj-RK for openembedded-core@lists.openembedded.org;
	Mon, 11 Nov 2013 05:34:31 -0500
Date: Mon, 11 Nov 2013 05:34:20 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1311110437360.9099@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
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
Subject: wanting to confirm understanding of FILESPATH in .bb and .inc files
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
X-List-Received-Date: Mon, 11 Nov 2013 10:34:32 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  currently poking around for examples of recipes' use of FILESPATH to
use in class, and i just want to make absolutely sure i understand its
usage since some recipes seem to use it in weird and/or unnecessary
ways. (using the current poky tarball 10.0.0 for this.)

  first, i can see the default setting of FILESPATH in base.bbclass:

FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}",
  "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"

which, for any recipe, creates a FILESPATH that starts with top-level
subdirectories of ${BP}, ${BPN} and "files" and, on top of that,
extends each one with further subdirectories as defined by the
variable FILESOVERRIDES. so, as a working example, i can use "bb show"
to display the value of FILESPATH for, say, the zlib recipe, which
shows me a path with 15 entries (exactly as i expected building for my
beagleboard xm):

FILESPATH="/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib-1.2.8/arm
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib-1.2.8/armv7a
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib-1.2.8/beagleboard
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib-1.2.8/poky
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib-1.2.8/
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib/arm
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib/armv7a
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib/beagleboard
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib/poky
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/zlib/
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/files/arm
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/files/armv7a
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/files/beagleboard
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/files/poky
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/zlib/files/"

so far, so good, and here's where i want the clarification.

  as long as a recipe has "file://" references that occur exclusively
in any of the directories listed above, there should be no reason to
*need* to override FILESPATH, correct? however, some recipe or include
files clearly do just that, and i want to make sure that what i'm
seeing in files like that is *optional*, and not required due to some
subtlety i'm unaware of.

  consider first example:

systemtap_git.inc:FILESPATH = "${FILE_DIRNAME}/systemtap"

it would seem that this setting is superfluous since that entry is
already in the default value of FILESPATH for that recipe, so i'm
guessing that the benefit of the above is to simply reduce the size of
FILESPATH for efficiency? i mean, technically, the above didn't need
to be set, did it?

  another example is with "-native" recipes. consider:

qemu-helper-native_1.0.bb:FILESPATH = "${FILE_DIRNAME}/qemu-helper"

again, that seems redundant since:

$ bb show -r qemu-helper-native BP BPN
Parsing recipes..done.
# BP=${BPN}-${PV}
BP="qemu-helper-1.0"
# BPN=${@base_prune_suffix(d.getVar('PN', True), d.getVar('SPECIAL_PKGSUFFIX', True).split(), d)}
BPN="qemu-helper"
$

so that entry is already part of FILESPATH.

  i can see that there are times when a recipe or include file does
need to override the default value of FILESPATH, i just want to
confirm that there are instances in the current oe-core code base that
it appears to be unnecessary. thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


