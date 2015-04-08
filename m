Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 181F860089
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 13:54:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 08 Apr 2015 06:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,544,1422950400"; d="scan'208";a="677067608"
Received: from joeholla-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.10.65])
	by orsmga001.jf.intel.com with ESMTP; 08 Apr 2015 06:54:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Wed, 08 Apr 2015 14:54:52 +0100
Message-ID: <12211684.ST3S4rfOnv@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <5523A770.6030201@opendreambox.org>
References: <cover.1427274653.git.Qi.Chen@windriver.com>
	<9a54a9260aede9cf1842db3cd1244a1d4c247310.1427274653.git.Qi.Chen@windriver.com>
	<5523A770.6030201@opendreambox.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] util-linux: split util-linux-sulogin
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
X-List-Received-Date: Wed, 08 Apr 2015 13:54:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 07 April 2015 11:46:24 Andreas Oberritter wrote:
> Hello Chen Qi,
> 
> On 25.03.2015 10:11, Chen Qi wrote:
> > [YOCTO #6698]
> > 
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> > 
> >  meta/recipes-core/util-linux/util-linux.inc | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/recipes-core/util-linux/util-linux.inc
> > b/meta/recipes-core/util-linux/util-linux.inc index 10b14b3..d93505c
> > 100644
> > --- a/meta/recipes-core/util-linux/util-linux.inc
> > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > @@ -32,7 +32,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk
> > util-linux-cfdisk util-linux-sfd> 
> >               util-linux-mkfs util-linux-mcookie util-linux-reset \
> >               util-linux-mkfs.cramfs util-linux-fsck.cramfs
> >               util-linux-fstrim \
> >               util-linux-partx ${PN}-bash-completion util-linux-hwclock \
> > 
> > -             util-linux-findfs util-linux-getopt"
> > +             util-linux-findfs util-linux-getopt util-linux-sulogin"
> > 
> >  PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount',
> >  'util-linux-pylibmount', '', d)}"
> >  
> >  PACKAGES_DYNAMIC = "^util-linux-lib.*"
> > 
> > @@ -96,6 +96,8 @@ FILES_util-linux-mkfs = "${sbindir}/mkfs"
> > 
> >  FILES_util-linux-fsck.cramfs = "${sbindir}/fsck.cramfs"
> >  FILES_util-linux-mkfs.cramfs = "${sbindir}/mkfs.cramfs"
> > 
> > +FILES_util-linux-sulogin = "${base_sbindir}/sulogin*"
> > +
> > 
> >  # Util-linux' blkid replaces the e2fsprogs one
> >  FILES_util-linux-blkid = "${base_sbindir}/blkid*"
> >  RCONFLICTS_util-linux-blkid = "e2fsprogs-blkid"
> > 
> > @@ -173,7 +175,7 @@ ALTERNATIVE_PRIORITY = "100"
> > 
> >  ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root
> >  switch_root" ALTERNATIVE_${PN} += "mkfs.minix hexdump last logger mesg
> >  renice wall"> 
> > -ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject sulogin"
> > +ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject"
> > 
> >  ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
> >  ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
> > 
> > @@ -184,7 +186,6 @@ ALTERNATIVE_LINK_NAME[pivot_root] =
> > "${base_sbindir}/pivot_root"> 
> >  ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
> >  ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
> >  ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
> > 
> > -ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
> > 
> >  ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8
> >  utmpdump.1 reset.1"> 
> > @@ -239,6 +240,9 @@ ALTERNATIVE_TARGET[reset] = "${base_bindir}/reset"
> > 
> >  ALTERNATIVE_util-linux-getopt = "getopt"
> >  ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
> > 
> > +ALTERNATIVE_util-linux-sulogin = "sulogin"
> > +ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
> > +
> > 
> >  BBCLASSEXTEND = "native nativesdk"
> >  
> >  python do_package_prepend () {
> 
> I think you should add RDEPENDS_${PN} = "util-linux-sulogin". I didn't
> check whether that was done for other split-out packages, but otherwise
> people installing util-linux might miss sulogin in the future.

Unless util-linux becomes just a meta-package that pulls in all of the split 
packages and itself contains nothing, that would seem to me to defeat the 
purpose of splitting out the package in the first place - you could never have 
util-linux installed without util-linux-sulogin.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

