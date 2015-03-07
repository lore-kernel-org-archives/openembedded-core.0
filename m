Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 6DF5273913
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2015 14:43:36 +0000 (UTC)
Received: from [99.240.204.5] (port=41395 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YUFx5-0001c9-7H for openembedded-core@lists.openembedded.org;
	Sat, 07 Mar 2015 09:43:39 -0500
Date: Sat, 7 Mar 2015 09:43:34 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@Device-040570
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1503070931520.19814@Device-040570>
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
Subject: proper "style" for VAR_append_override?
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
X-List-Received-Date: Sat, 07 Mar 2015 14:43:37 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  more nitpickery, but i've noticed a couple different ways in the OE
code base and documentation for conditionally appending based on an
override, and it might just be that i'm confused about the underlying
mechanics of the append operators.

  first, there's this from qemu.inc:

KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"

i've always read that as, "if override of linux-yocto package is in
effect, then add this feature to KERNEL_FEATURES using the "append"
operator, which will leave the appending to the end and, in addition,
*requires* that we explicitly have that leading space given that we're
using _append.

  it's also my understanding that i can have multiple assignments like
that (possibly based on different overrides), and they will all be
processed properly and finally appended to (in this case)
KERNEL_FEATURES. so far, so good?

  but if i check the YP ref manual, i see documentation like this:

ref-variables.xml:     KERNEL_FEATURES_append_cedartrail += "bsp/cedartrail/cedartrail-pvr-merge.scc"
ref-variables.xml:     KERNEL_FEATURES_append_cedartrail += "cfg/efi-ext.scc"
ref-variables.xml:     KERNEL_FEATURES_append_cedartrail-nopvr += " cfg/smp.scc"

which looks a bit weird -- combining "_append" with "+=" (and even
inconsistently adding that leading space).

  is there some difference between the above approaches i've never
understood? is there a preferred style?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

