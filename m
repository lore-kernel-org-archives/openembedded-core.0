Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5F560657
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 10:34:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 26 Oct 2015 03:34:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,201,1444719600"; d="scan'208";a="819513092"
Received: from randjicd-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.27.7])
	by fmsmga001.fm.intel.com with ESMTP; 26 Oct 2015 03:34:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 26 Oct 2015 10:34:50 +0000
Message-ID: <11124457.9F2LW3uP4S@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.8-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <alpine.LFD.2.20.1510260618110.21219@localhost>
References: <alpine.LFD.2.20.1510230754010.4583@localhost>
	<2338694.BfAL3tqMdu@peggleto-mobl.ger.corp.intel.com>
	<alpine.LFD.2.20.1510260618110.21219@localhost>
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 26 Oct 2015 10:34:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 26 October 2015 06:23:09 Robert P. J. Day wrote:
> On Fri, 23 Oct 2015, Paul Eggleton wrote:
> 
> ... me snipped ...
> 
> > I don't think so, it appears that line goes way back to the initial
> > population of the repository. Looks like we could just drop it.
> 
>   it *looks* like there are a number of lines like that in oe-core
> that are superfluous ... some samples (which i have not verified, i
> just selected from brief visual inspection):
> 
> recipes-bsp/hostap/hostap-utils.inc:S = "${WORKDIR}/hostap-utils-${PV}"
> recipes-bsp/pcmciautils/pcmciautils.inc:S = "${WORKDIR}/pcmciautils-${PV}"
> recipes-connectivity/openssl/openssl.inc:S = "${WORKDIR}/openssl-${PV}"
> recipes-core/sysvinit/sysvinit_2.88dsf.bb:S = "${WORKDIR}/sysvinit-${PV}"
> recipes-core/glib-2.0/glib.inc:S = "${WORKDIR}/glib-${PV}"
> recipes-core/sysfsutils/sysfsutils_2.1.0.bb:S =
> "${WORKDIR}/sysfsutils-${PV}" recipes-devtools/mtools/mtools_3.9.9.bb:S =
> "${WORKDIR}/mtools-${PV}" recipes-devtools/intltool/intltool.inc:S =
> "${WORKDIR}/intltool-${PV}" recipes-devtools/git/git.inc:S =
> "${WORKDIR}/git-${PV}"
> recipes-extended/psmisc/psmisc.inc:S = "${WORKDIR}/psmisc-${PV}"
> recipes-extended/net-tools/net-tools_1.60-26.bb:S =
> "${WORKDIR}/net-tools-1.60" 
> recipes-gnome/gtk+/gtk+3_3.16.6.bb:S =
> "${WORKDIR}/gtk+-${PV}"
> recipes-kernel/oprofile/oprofile_1.1.0.bb:S = "${WORKDIR}/oprofile-${PV}"
> recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb:S =
> "${WORKDIR}/libid3tag-${PV}" ... etc etc ...
> 
> and probably lots more. do i have at least the right understanding
> that any setting of S which eventally equates to
> ${WORKDIR}/${BPN}-${PV} serves no useful purpose? (not sure about
> *-native recipes, though, i have to take a closer look at those to see
> if they fit the pattern.)

Now, you really need to be careful with this - in some cases these files are 
included from other recipes where PN is not the same as it would be in the 
standard recipe; there it is deliberate and "cleaning it up" would actually 
break the other recipe. Additionally I can see above, net-tools isn't a 
candidate because the version part is not the same ("1.60" vs "1.60-26"). 
Every recipe will need to be checked.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

