Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 06D0B73B3F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 11:33:46 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 12 Mar 2015 04:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,388,1422950400"; d="scan'208";a="539874000"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.24.97])
	by orsmga003.jf.intel.com with ESMTP; 12 Mar 2015 04:33:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 12 Mar 2015 11:33:45 +0000
Message-ID: <5754681.VTnbJoMohW@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.7-100.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <alpine.LFD.2.11.1503080420110.11437@Device-040570>
References: <alpine.LFD.2.11.1503070931520.19814@Device-040570>
	<95053983.gSqlKBTLmC@peggleto-mobl5.ger.corp.intel.com>
	<alpine.LFD.2.11.1503080420110.11437@Device-040570>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: combining "_append" with "+=" (was: proper "style" for VAR_append_override?)
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
X-List-Received-Date: Thu, 12 Mar 2015 11:33:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 08 March 2015 04:45:14 Robert P. J. Day wrote:
> On Sat, 7 Mar 2015, Paul Eggleton wrote:
> > On Saturday 07 March 2015 09:43:34 Robert P. J. Day wrote:
> > >   more nitpickery, but i've noticed a couple different ways in the OE
> > > 
> > > code base and documentation for conditionally appending based on an
> > > override, and it might just be that i'm confused about the underlying
> > > mechanics of the append operators.
> > > 
> > >   first, there's this from qemu.inc:
> > > KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
> > > 
> > > i've always read that as, "if override of linux-yocto package is in
> > > effect, then add this feature to KERNEL_FEATURES using the "append"
> > > operator, which will leave the appending to the end and, in addition,
> > > *requires* that we explicitly have that leading space given that we're
> > > using _append.
> > > 
> > >   it's also my understanding that i can have multiple assignments like
> > > 
> > > that (possibly based on different overrides), and they will all be
> > > processed properly and finally appended to (in this case)
> > > KERNEL_FEATURES. so far, so good?
> > > 
> > >   but if i check the YP ref manual, i see documentation like this:
> > > ref-variables.xml:     KERNEL_FEATURES_append_cedartrail +=
> > > "bsp/cedartrail/cedartrail-pvr-merge.scc" ref-variables.xml:
> > > 
> > > KERNEL_FEATURES_append_cedartrail += "cfg/efi-ext.scc" ref-variables.xml:
> > >   KERNEL_FEATURES_append_cedartrail-nopvr += " cfg/smp.scc"
> > > 
> > > which looks a bit weird -- combining "_append" with "+=" (and even
> > > inconsistently adding that leading space).
> > > 
> > >   is there some difference between the above approaches i've never
> > > 
> > > understood? is there a preferred style?
> > 
> > IMO, '..._append +=' shouldn't be used. It might be assumed that the
> > += accomplishes more than just adding a leading space, which it
> > doesn't. It's much simpler to just include the leading space in the
> > value.
> 
>   i agree, and there's a ton of that stuff under the meta-yocto layer
> in scripts/lib/bsp/substrate/target/arch (obviously directly related
> to the very example i pulled out of the reference manual):
> 
> $ grep -r "_append.*+=" *
> i386/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend:KERNEL_FEATURES_app
> end_{{=machine}} += " cfg/smp.scc"
> i386/recipes-kernel/linux/linux-yocto_3.17.bbappend:KERNEL_FEATURES_append_
> {{=machine}} += " cfg/smp.scc"
> i386/recipes-kernel/linux/linux-yocto-dev.bbappend:KERNEL_FEATURES_append_{
> {=machine}} += " cfg/smp.scc"
> i386/recipes-kernel/linux/linux-yocto_3.14.bbappend:KERNEL_FEATURES_append_
> {{=machine}} += " cfg/smp.scc"
> mips/recipes-kernel/linux/linux-yocto-rt_3.10.bbappend:KERNEL_FEATURES_appe
> nd_{{=machine}} += " cfg/smp.scc"
> mips/recipes-kernel/linux/linux-yocto-tiny_3.10.bbappend:KERNEL_FEATURES_ap
> pend_{{=machine}} += " cfg/smp.scc"
> mips/recipes-kernel/linux/linux-yocto-tiny_3.17.bbappend:KERNEL_FEATURES_ap
> pend_{{=machine}} += " cfg/smp.scc"
> mips/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend:KERNEL_FEATURES_appe
> nd_{{=machine}} += " cfg/smp.scc"
> mips/recipes-kernel/linux/linux-yocto_3.10.bbappend:KERNEL_FEATURES_append_
> {{=machine}} += " cfg/smp.scc" ... snip lots more of exactly the same stuff
> ...
> $
> 
>   it's obviously not hard to grep for the string "_append.*+=" to see
> where stuff like this is happening -- i'll let someone else decide
> what to do about it; most of it is in the meta-yocto layer under
> scripts/.

I think pretty much all of those should get fixed. They've probably fallen 
under the radar since they aren't strictly part of the metadata, but they are 
important as these are the templates from which new BSPs are created from 
yocto-bsp.

>   final note: i realize that a lot of my nitpickery is just that --
> nitpickery -- but i'm trying to prevent possibilities for confusion
> for newer readers and users. in cases like this, if the (bitbake)
> manual explains that there's one way to do appending (+=) and a second
> way to do appending (_append), and readers think they understand the
> difference, then it's definitely setting them up for confusion to see
> both constructs being used at the same time on the same line. hence,
> the relentless pedantry.

Right, and we certainly do appreciate all of your input, I hope we don't seem 
too grumpy or dismissive in response ;) Our recipes should be the ultimate 
example in how to do things properly and we should try to make sure that they 
are if at all possible.

> p.s.  a small number of examples of the same thing under OE layer:
> 
> $ grep -r "_append_.*+=" *
> recipes-core/libxml/libxml2.inc:RDEPENDS_${PN}-ptest_append_libc-glibc +=
> "glibc-gconv-ebcdic-us glibc-gconv-ibm1141"
> recipes-devtools/unfs3/unfs3_0.9.22.r490.bb:DEPENDS_append_class-nativesdk
> += "flex-nativesdk"
> recipes-support/gnutls/gnutls.inc:LDFLAGS_append_libc-uclibc += " -pthread"
> $
> 
>   in cases like that, what is the "preferred" style?

I don't think the presence or absence of an override changes things - the same 
concern applies.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

