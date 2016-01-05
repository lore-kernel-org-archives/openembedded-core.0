Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 27D86731E1;
	Tue,  5 Jan 2016 21:30:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jan 2016 13:30:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,526,1444719600"; d="scan'208";a="854172097"
Received: from nanoar-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.178.248])
	by orsmga001.jf.intel.com with ESMTP; 05 Jan 2016 13:30:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 06 Jan 2016 10:30:05 +1300
Message-ID: <3002291.NNtibCZEiD@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.8-300.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <1451307640.4129.16.camel@linuxfoundation.org>
References: <1451307640.4129.16.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: openembedded-architecture@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Split do_rootfs into image specific tasks?
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
X-List-Received-Date: Tue, 05 Jan 2016 21:30:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Richard,

On Mon, 28 Dec 2015 13:00:40 Richard Purdie wrote:
> I've heard complaints from people trying to create more interesting
> image types about how hard it is to understand the rootfs/image
> generation code and that its a pain to develop/test/debug.
> 
> Having looked at it myself, the internal construction of shell
> functions which then gets passed into a multiprocessing pool is rather
> convoluted and it places rather odd constraints on when variables are
> expanded. Its therefore no wonder people find it confusing/complex.
> 
> I've sent three patches to the OE-Core list which illustrate how we
> could split the code in lib/oe/image into separate tasks, one per image
> type. This removes the need for the simple task graph code and defers
> to the bitbake task management code to handle this instead.
> 
> This is a good step forward in splitting up the monolithic code and
> starting to make it more accessible to people. It should also make it
> easier for people to hook in other tasks and processes into the rootfs
> code.
> 
> Incidentally, the reason this code was all combined originally was due
> to limitations of fakeroot where if you exited the session, you lost
> permissions data. With pseudo this constraint was removed.
> 
> We did start to rework the rootfs/image code previously and got so far
> with untangling it however we did prioritise some performance tweaks
> over splitting into separate tasks and in hindsight, this was a mistake
> and should have been done the other way around. That work was suspended
> due to changes in the people working on the project but this split has
> always been intended, now is the time to finish it IMO.
> 
> The code I've sent does work but is not finished yet and has only had
> basic testing. Things that remain to be done:
> 
> * Handling of IMAGE_GEN_DEBUGFS needs reimplementing on the new code
>   structure
> * Some variable dependencies on do_rootfs need moving to do_image
> * References to do_rootfs need auditing to see if they should now be
>   do_image_complete
> * Changes need documenting with migration notes.
> * The layout of image.bbclass is pretty horrid and needs cleanup, along
>   with moving functions to the right places
> * We should only calculate the rootfs size once, not once per image
>   type.
> 
> This work could also be a stepping stone towards further changes to the
> rootfs backends. Right now its pretty backwards compatible but we could
> change the API a bit and create the image types as specific tasks right
> from the start rather than hand crafting shell functions as we do now
> for example. I believe there would be further benefits in debugging and
> ease of understanding of the codebase if we did that.
> 
> I guess the real question is whether people like this direction and how
> much should we change the API in order to improve things? Could we
> afford a pretty heavy rewrite in this area to give a good end result?

I like this a lot. I'd idly considered this model before (as I'm sure others 
had) as it simplifies a lot of the multi-format image construction handling, 
improves incremental performance, and the added granularity makes it slightly 
easier to see what the build system is doing. Obviously there is some minor 
cleanup work to be done on the patchset as you've noted.

The only "issue" I can think of is that bitbake -c rootfs will no longer build 
the image files as it did previously; however I'm not sure I'd structure things 
any differently to avoid that though. I suspect people will fairly easily adapt 
to this change as long as we publicise it effectively.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

