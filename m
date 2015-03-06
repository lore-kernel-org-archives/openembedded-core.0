Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 1B4596017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 11:34:37 +0000 (UTC)
Received: from [99.240.204.5] (port=33201 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YTqWc-00079b-Lj; Fri, 06 Mar 2015 06:34:38 -0500
Date: Fri, 6 Mar 2015 06:34:34 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@Device-040570
To: Mike Looijmans <mike.looijmans@topic.nl>
In-Reply-To: <54F98C99.4010209@topic.nl>
Message-ID: <alpine.LFD.2.11.1503060631520.21022@Device-040570>
References: <alpine.LFD.2.11.1503050340460.25779@Device-040570>
	<54F9700E.1050501@topic.nl>
	<alpine.LFD.2.11.1503060427330.11154@Device-040570>
	<54F98C99.4010209@topic.nl>
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
Subject: Re: is standard for COMPATIBLE_MACHINE to use "()" or not?
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
X-List-Received-Date: Fri, 06 Mar 2015 11:34:42 -0000
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463811327-1918413605-1425641677=:21022"

---1463811327-1918413605-1425641677=:21022
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 6 Mar 2015, Mike Looijmans wrote:

> ﻿On 06-03-15 10:35, Robert P. J. Day wrote:
> > On Fri, 6 Mar 2015, Mike Looijmans wrote:
> >
> > > ﻿On 05-03-15 09:43, Robert P. J. Day wrote:
> > > >
> > > >     a style guide thing ... it appears that COMPATIBLE_MACHINE happily
> > > > acccepts a matching RE within parentheses or not, is there a
> > > > preference?
> > > >
> > > >     also, in checking that, i ran across this in oe-core:
> > > >
> > > > linux-yocto_3.14.bb:COMPATIBLE_MACHINE =
> > > > "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> > > > linux-yocto_3.19.bb:COMPATIBLE_MACHINE =
> > > > "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> > > > linux-yocto-dev.bb:COMPATIBLE_MACHINE =
> > > > "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64)"
> > >
> > > The regex should have been "qemu(arm|x86|ppc|mips|mips64|x86-64)"
> > >
> > > And since "x86-64" already matches "x86", that could have been omitted.
> > >
> > > > where the first two recipes list "qemuarm64" but the dev version
> > > > doesn't ... is that deliberate?
> > >
> > > Probably not, but "qemuarm64" matches "qemuarm" already.
> >
> >    more nitpcking pedantry, but as i read it from the python code in
> > base.bbclass:
> >
> >          need_machine = d.getVar('COMPATIBLE_MACHINE', True)
> >          if need_machine:
> >              import re
> >              compat_machines = (d.getVar('MACHINEOVERRIDES', True) or
> >              "").split(":")
> >              for m in compat_machines:
> >                  if re.match(need_machine, m):
> >                      break
> >
> > the "re.match"ing does not implicitly anchor the RE to the beginning
> > or end of string, correct? it couldn't, or "qemuarm64" could not
> > possibly match "qemuarm".
> >
> >    does that not suggest that one should add those anchors to avoid the
> > (admittedly unlikely) situation where i define a machine named, say,
> > "rdayqemux86" which, as i read it, will match a "qemux86" machine even
> > if i didn't want it to? would i then avoid this by setting:
> >
> >    COMPATIBLE_MACHINE = "^rdayqemu"
> >
> > to match *all* machines whose names *start* with "rdayqemu"? this
> > really isn't explained carefully anywhere i can see.
>
> Well, I got my knowledge the hard way too (getting hit with
> unexpected results and then looking into the source code).
>
> Without further hints, I think over 90% of the users think that
> COMPATIBLE_MACHINE does an exact match, not a regex match, and when
> they see the "|" in some recipes, they just assume some code will do
> a string.split('|') on it.
>
> I wonder if the actual intention of that long qemu mach was "all
> QEMU machines", in which case the expression could have been simply
> "qemu" or better "^qemu".

  i was going to suggest *exactly* the same thing, but i wanted to
make sure i understood the precise mechanics of the re matching first.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

---1463811327-1918413605-1425641677=:21022--
