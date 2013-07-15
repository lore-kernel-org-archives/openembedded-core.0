Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 32B27619DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 09:47:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Jul 2013 02:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,668,1367996400"; d="scan'208";a="345726032"
Received: from unknown (HELO helios.localnet) ([10.252.122.64])
	by orsmga001.jf.intel.com with ESMTP; 15 Jul 2013 02:47:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bian Naimeng <biannm@cn.fujitsu.com>
Date: Mon, 15 Jul 2013 10:47:21 +0100
Message-ID: <3927888.IYAupCGTDk@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <51E3599E.5000807@cn.fujitsu.com>
References: <51DBC97F.1090606@cn.fujitsu.com> <7309265.hkedPcPrsU@helios>
	<51E3599E.5000807@cn.fujitsu.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1]package_rpm.bbclass: remove xx.spec before doing rpmbuild xx.src.rpm
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
X-List-Received-Date: Mon, 15 Jul 2013 09:47:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 15 July 2013 10:08:30 Bian Naimeng wrote:
> Hi Paul,
> 
> said the following on 2013-7-13 1:07:, Paul Eggleton wrote:
> > Hi Bian,
> > 
> > On Friday 12 July 2013 10:04:56 Bian Naimeng wrote:
> >> said the following on 2013-7-11 18:54:, Burton, Ross wrote:
> >>> On 10 July 2013 03:56, Bian Naimeng <biannm@cn.fujitsu.com> wrote:
> >>>> Sorry, it looks like i should post this patch to poky. please ignore
> >>>> this
> >>> 
> >>> You were right the first time, meta/ is oe-core. :)
> >> 
> >> Thanks for your reminding.
> >> 
> >> In this case, the following error will be caught.
> >> 
> >>    | error: Bad owner/group:  .../tmp/work/i586-poky-linux/.../xxx.spec
> >>    | Building target platforms: i586-poky-linux
> >>    | 
> >>    | RPM build errors:
> >>    |     Bad owner/group: .../tmp/work/i586-poky-linux/.../xxx.spec
> >> 
> >> The following bb file can cause this error.
> >> # cat xxx.bb
> >> 
> >>   SRC_URI="..../xxx.src.rpm"
> >>   
> >>   do_unpack2 () {
> >>   
> >>           cd ${WORKDIR}
> >>           tar zxvf xxx.tar.gz
> >>   
> >>   }
> >>   addtask do_unpack2 after do_unpack before do_configure
> >> 
> >> Of course, we can walk around it by append "extract=xxx.tar.gz" to
> >> SRC_URI, but it's not good way when the xxx.src.rpm containing lots of
> >> necessary files.
> > 
> > Wouldn't using subdir=xyz in the SRC_URI entry put the contents of the rpm
> > into a subdirectory and thus avoid this problem?
> 
> Thanks for your suggestion.
> Yes, it's can avoid this problem.
> 
> But, why we don't remove the xxx.spec file before doing rpmbuild xx.src.rpm
> if it's existed. The old xxx.spec is unuseful.

It's a tricky situation. I just think there's a limit to the lengths we should 
go to to prevent extraction of an archive that doesn't contain a subdirectory 
and may therefore extract files that clash with files the build system wants to 
write. In any case, this patch has now been merged.

> In my opinion, it can make the bb file easier and clean than using
> subdir=xyz in the SRC_URI

The subdir parameter is trivial to add, and my advice is that subdir should 
always be used when the archive doesn't contain a reasonable subdirectory and 
then you won't hit subtle problems like this one. 

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

