Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8A08C6B20F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 16:28:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jul 2013 09:28:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,678,1367996400"; d="scan'208";a="366140976"
Received: from unknown (HELO helios.localnet) ([10.252.122.80])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jul 2013 09:29:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jate Sujjavanich <Jate.Sujjavanich@myfuelmaster.com>
Date: Tue, 16 Jul 2013 17:28:37 +0100
Message-ID: <5246829.WLtotMrLQF@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <6C2434209962DC46B88345CA85C334A201C9F4A6EBE9@Courier.syntech.org>
References: <1371653832-2178-1-git-send-email-jate.sujjavanich@myfuelmaster.com>
	<1409263.tPA0GAOlPL@helios>
	<6C2434209962DC46B88345CA85C334A201C9F4A6EBE9@Courier.syntech.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Checksums for local files now stored using partial recipe path
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
X-List-Received-Date: Tue, 16 Jul 2013 16:28:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Jate,

On Wednesday 19 June 2013 13:14:54 Jate Sujjavanich wrote:
> Paul Eggleton wrote on Wednesday, June 19, 2013 at 11:45 AM:
> > Actually, looking more closely at this I'm not sure how the full path to
> > the file would be getting into the signature - looking at lib/bb/siggen.py
> > it should only be adding the file checksum value to the signature data and
> > not the path. I did a quick test with master by moving some files referred
> > to in SRC_URI to a different valid location (thus changing their full
> > path), cleaning the recipe and then building it again, and the output was
> > restored from sstate rather than rebuilding.
> >
> > Can you explain how you came to the conclusion that this was why the
> > checksums were different on different machines?
>
> On the same machine, I had two identical poky directories. One, I built
> first to use as the cache source. I then configured the second one to use a
> SSTATE_MIRRORS pointing to the first.
> 
> The build of the second would just detect changes and force a rebuild.
> Running the bitbake-diffsigs tool on the do_fetch...sigdata showed
> something like the following on all of the local files:
> 
> Removed("/home/user/poky1/meta/recipes...file1", chksum1)
> Added("/home/user/poky2/meta/recipes...file1", chksum1)
> 
> Upon applying my patch, the components of core-minimal-image were pulled
> from the sstate-cache.

I just got around to trying this again, only this time I cloned a new poky 
tree in a different path which should replicate your situation and used 
SSTATE_MIRRORS to point to the previous sstate-cache. It built completely from 
sstate as it expected. For reference I was testing with the latest dylan 
branch and core-image-minimal.

As I said earlier, if you look at the code only the checksum value goes into 
the task checksum and not the filename, so the path to the base of the metadata 
changing cannot influence the task checksum. However, I think I can see how you 
would think that the paths changing influenced the checksum, since the data 
that we put into the siginfo file *does* contain the full path, and thus 
bitbake-diffsigs will report that as having changed even though that difference 
didn't change the task checksum. That is a bug and we should fix how we store 
paths either in the cache or in the siginfo file, but that fix will have to take 
into account different layer paths. I'd suggest a simpler and more reliable 
approach would be to just get the relative path to os.path.dirname of the 
recipe rather than TOPDIR.

As far as I can tell though that won't actually fix the issue triggering 
rebuilds in your case. Something else must be changing. It would be 
interesting if you could dig into what that might be as I can't reproduce the 
rebuilding issue here.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

