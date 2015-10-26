Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 4D26E73695
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 10:40:38 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20151026104037069_0484;
	Mon, 26 Oct 2015 10:40:37 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [99.240.204.5] (port=51236 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ZqfDM-0004UW-M5; Mon, 26 Oct 2015 06:41:20 -0400
Date: Mon, 26 Oct 2015 06:40:28 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <11124457.9F2LW3uP4S@peggleto-mobl.ger.corp.intel.com>
Message-ID: <alpine.LFD.2.20.1510260637410.21382@localhost>
References: <alpine.LFD.2.20.1510230754010.4583@localhost>
	<2338694.BfAL3tqMdu@peggleto-mobl.ger.corp.intel.com>
	<alpine.LFD.2.20.1510260618110.21219@localhost>
	<11124457.9F2LW3uP4S@peggleto-mobl.ger.corp.intel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: why does sysfsutils-2.1.0.bb set S = "${WORKDIR}/sysfsutils-${PV}"?
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
X-List-Received-Date: Mon, 26 Oct 2015 10:40:39 -0000
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Oct 2015, Paul Eggleton wrote:

> On Monday 26 October 2015 06:23:09 Robert P. J. Day wrote:
> > On Fri, 23 Oct 2015, Paul Eggleton wrote:
> >
> > ... me snipped ...
> >
> > > I don't think so, it appears that line goes way back to the initial
> > > population of the repository. Looks like we could just drop it.
> >
> >   it *looks* like there are a number of lines like that in oe-core
> > that are superfluous ... some samples (which i have not verified, i
> > just selected from brief visual inspection):
> >
> > recipes-bsp/hostap/hostap-utils.inc:S = "${WORKDIR}/hostap-utils-${PV}"
> > recipes-bsp/pcmciautils/pcmciautils.inc:S = "${WORKDIR}/pcmciautils-${PV}"
> > recipes-connectivity/openssl/openssl.inc:S = "${WORKDIR}/openssl-${PV}"
> > recipes-core/sysvinit/sysvinit_2.88dsf.bb:S = "${WORKDIR}/sysvinit-${PV}"
> > recipes-core/glib-2.0/glib.inc:S = "${WORKDIR}/glib-${PV}"
> > recipes-core/sysfsutils/sysfsutils_2.1.0.bb:S =
> > "${WORKDIR}/sysfsutils-${PV}" recipes-devtools/mtools/mtools_3.9.9.bb:S =
> > "${WORKDIR}/mtools-${PV}" recipes-devtools/intltool/intltool.inc:S =
> > "${WORKDIR}/intltool-${PV}" recipes-devtools/git/git.inc:S =
> > "${WORKDIR}/git-${PV}"
> > recipes-extended/psmisc/psmisc.inc:S = "${WORKDIR}/psmisc-${PV}"
> > recipes-extended/net-tools/net-tools_1.60-26.bb:S =
> > "${WORKDIR}/net-tools-1.60"
> > recipes-gnome/gtk+/gtk+3_3.16.6.bb:S =
> > "${WORKDIR}/gtk+-${PV}"
> > recipes-kernel/oprofile/oprofile_1.1.0.bb:S = "${WORKDIR}/oprofile-${PV}"
> > recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb:S =
> > "${WORKDIR}/libid3tag-${PV}" ... etc etc ...
> >
> > and probably lots more. do i have at least the right understanding
> > that any setting of S which eventally equates to
> > ${WORKDIR}/${BPN}-${PV} serves no useful purpose? (not sure about
> > *-native recipes, though, i have to take a closer look at those to see
> > if they fit the pattern.)
>
> Now, you really need to be careful with this - in some cases these
> files are included from other recipes where PN is not the same as it
> would be in the standard recipe; there it is deliberate and
> "cleaning it up" would actually break the other recipe. Additionally
> I can see above, net-tools isn't a candidate because the version
> part is not the same ("1.60" vs "1.60-26"). Every recipe will need
> to be checked.

  oh, i realize this ... i did say that this was a very cursory list i
hadn't checked carefully yet. i may or may not do any of this cleanup,
i just wanted to make sure i was at least understanding the occasional
redundancy correctly.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


