Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id E464B6AC36
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Mar 2015 08:45:17 +0000 (UTC)
Received: from [99.240.204.5] (port=46252 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YUWpr-0006te-56; Sun, 08 Mar 2015 04:45:19 -0400
Date: Sun, 8 Mar 2015 04:45:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@Device-040570
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <95053983.gSqlKBTLmC@peggleto-mobl5.ger.corp.intel.com>
Message-ID: <alpine.LFD.2.11.1503080420110.11437@Device-040570>
References: <alpine.LFD.2.11.1503070931520.19814@Device-040570>
	<95053983.gSqlKBTLmC@peggleto-mobl5.ger.corp.intel.com>
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
X-List-Received-Date: Sun, 08 Mar 2015 08:45:18 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 7 Mar 2015, Paul Eggleton wrote:

> On Saturday 07 March 2015 09:43:34 Robert P. J. Day wrote:
> >   more nitpickery, but i've noticed a couple different ways in the OE
> > code base and documentation for conditionally appending based on an
> > override, and it might just be that i'm confused about the underlying
> > mechanics of the append operators.
> >
> >   first, there's this from qemu.inc:
> >
> > KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
> >
> > i've always read that as, "if override of linux-yocto package is in
> > effect, then add this feature to KERNEL_FEATURES using the "append"
> > operator, which will leave the appending to the end and, in addition,
> > *requires* that we explicitly have that leading space given that we're
> > using _append.
> >
> >   it's also my understanding that i can have multiple assignments like
> > that (possibly based on different overrides), and they will all be
> > processed properly and finally appended to (in this case)
> > KERNEL_FEATURES. so far, so good?
> >
> >   but if i check the YP ref manual, i see documentation like this:
> >
> > ref-variables.xml:     KERNEL_FEATURES_append_cedartrail +=
> > "bsp/cedartrail/cedartrail-pvr-merge.scc" ref-variables.xml:
> > KERNEL_FEATURES_append_cedartrail += "cfg/efi-ext.scc" ref-variables.xml:
> >   KERNEL_FEATURES_append_cedartrail-nopvr += " cfg/smp.scc"
> >
> > which looks a bit weird -- combining "_append" with "+=" (and even
> > inconsistently adding that leading space).
> >
> >   is there some difference between the above approaches i've never
> > understood? is there a preferred style?
>
> IMO, '..._append +=' shouldn't be used. It might be assumed that the
> += accomplishes more than just adding a leading space, which it
> doesn't. It's much simpler to just include the leading space in the
> value.

  i agree, and there's a ton of that stuff under the meta-yocto layer
in scripts/lib/bsp/substrate/target/arch (obviously directly related
to the very example i pulled out of the reference manual):

$ grep -r "_append.*+=" *
i386/recipes-kernel/linux/linux-yocto-tiny_3.14.bbappend:KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
i386/recipes-kernel/linux/linux-yocto_3.17.bbappend:KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
i386/recipes-kernel/linux/linux-yocto-dev.bbappend:KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
i386/recipes-kernel/linux/linux-yocto_3.14.bbappend:KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
mips/recipes-kernel/linux/linux-yocto-rt_3.10.bbappend:KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
mips/recipes-kernel/linux/linux-yocto-tiny_3.10.bbappend:KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
mips/recipes-kernel/linux/linux-yocto-tiny_3.17.bbappend:KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
mips/recipes-kernel/linux/linux-yocto-rt_3.14.bbappend:KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
mips/recipes-kernel/linux/linux-yocto_3.10.bbappend:KERNEL_FEATURES_append_{{=machine}} += " cfg/smp.scc"
... snip lots more of exactly the same stuff ...
$

  it's obviously not hard to grep for the string "_append.*+=" to see
where stuff like this is happening -- i'll let someone else decide
what to do about it; most of it is in the meta-yocto layer under
scripts/.

  final note: i realize that a lot of my nitpickery is just that --
nitpickery -- but i'm trying to prevent possibilities for confusion
for newer readers and users. in cases like this, if the (bitbake)
manual explains that there's one way to do appending (+=) and a second
way to do appending (_append), and readers think they understand the
difference, then it's definitely setting them up for confusion to see
both constructs being used at the same time on the same line. hence,
the relentless pedantry.

rday

p.s.  a small number of examples of the same thing under OE layer:

$ grep -r "_append_.*+=" *
recipes-core/libxml/libxml2.inc:RDEPENDS_${PN}-ptest_append_libc-glibc += "glibc-gconv-ebcdic-us glibc-gconv-ibm1141"
recipes-devtools/unfs3/unfs3_0.9.22.r490.bb:DEPENDS_append_class-nativesdk += "flex-nativesdk"
recipes-support/gnutls/gnutls.inc:LDFLAGS_append_libc-uclibc += " -pthread"
$

  in cases like that, what is the "preferred" style?

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


