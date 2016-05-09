Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 05F006FF4E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 20:45:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 09 May 2016 13:45:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,601,1455004800"; d="scan'208";a="976009868"
Received: from hlim7-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.171.117])
	by fmsmga002.fm.intel.com with ESMTP; 09 May 2016 13:45:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 May 2016 08:45:27 +1200
Message-ID: <2777859.s7KusZZa7x@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.8-300.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <CADkTA4MGn2Ju0X-AKeyOJ0ba-kZ6v8XGDr2JcPk5zXWADzyMnA@mail.gmail.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
	<29259d2220b8e6e577a3efaa160b77e3366fb6d5.1462768634.git.paul.eggleton@linux.intel.com>
	<CADkTA4MGn2Ju0X-AKeyOJ0ba-kZ6v8XGDr2JcPk5zXWADzyMnA@mail.gmail.com>
MIME-Version: 1.0
Cc: Tom Zanussi <tom.zanussi@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 6/6] classes/image: check kernel config supports IMAGE_FSTYPES items
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
X-List-Received-Date: Mon, 09 May 2016 20:45:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Bruce,

On Mon, 09 May 2016 08:05:06 Bruce Ashfield wrote:
> On Mon, May 9, 2016 at 12:43 AM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
> > A lot of the IMAGE_FSTYPES items require the appropriate filesystem
> > driver to be enabled in the kernel configuration; e.g. in order to read
> > a btrfs filesystem, the kernel must enable CONFIG_BTRFS_FS. Add a check
> > to ensure that is the case.
> 
> So what's the overall design for this ? Is it documented anywhere ? This is
> something that we talked about a couple of years and I have reservations and
> objections to the current implementation.
> 
> .. but since I can only see bits and chunks of patches, I'd rather read
> something complete and offer some more detailed feedback.
> 
> Bottom line: I see a slippery slope to tightly specified option that depend
> on kernel versions, I see kernel options sprayed all over layers, etc, etc.
> Which is exactly what we've been trying to avoid with the centralized kernel
> meta-data, and again, there's a mechanism that I finished early this year to
> extend those options to any kernel, enforce, warn, error, etc .. but now,
> I'll just toss it into the bin.

There's no design written out beyond what you see in the associated bug:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=5574

The situation I am trying to avoid is the exact one mentioned by a commenter 
on that bug - which is that if I build my rootfs in a particular way, and 
couple it with a particular kernel configuration, I want the build system to 
tell me if those are going to be incompatible. The current situation where the 
you don't find out until the system doesn't boot (and you may not get any 
meaningful error message at that point anyway) isn't great.

You mention hardware in your reply to Chris, but this mostly isn't about 
hardware - it's about dependencies on software features of the kernel from 
userspace. I'm perfectly happy if we go for alternative solution, but to my 
mind whatever solution we come up with needs to be something whereby if you 
enable something in userspace that the kernel as currently configured isn't 
going to be able to support, you at least get a warning at build time.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

