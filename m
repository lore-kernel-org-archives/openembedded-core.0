Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 97FB865C78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 13:17:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Jul 2015 06:17:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,471,1432623600"; d="scan'208";a="746892682"
Received: from cbernard-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.31.54])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jul 2015 06:17:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Istrate, Daniel AlexandruX" <daniel.alexandrux.istrate@intel.com>
Date: Tue, 14 Jul 2015 14:17:42 +0100
Message-ID: <2830923.Hq27Wl5Vgc@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.7-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <174AD7CFE5F468498ACCFE3FEE0EF1EBE66974@IRSMSX102.ger.corp.intel.com>
References: <1436863689-29230-1-git-send-email-daniel.alexandrux.istrate@intel.com>
	<6014412.IjVSLHLSvX@peggleto-mobl.ger.corp.intel.com>
	<174AD7CFE5F468498ACCFE3FEE0EF1EBE66974@IRSMSX102.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oeqa/selftest: [YOCTO #7976] Updated imagefeature testcases.
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
X-List-Received-Date: Tue, 14 Jul 2015 13:17:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 14 July 2015 12:27:11 Istrate, Daniel AlexandruX wrote:
> > A stylistic thing perhaps, but instead of ... {}".format(str) why not just
> > use ... %s" % str ? 
> -- I don't have strong feelings about using str.format
> ..I could use "%s %str" instead if that's the style. I like format because
> I don't have to cast to string the passed in parameter.

OK, well I guess I'll leave that up to you.
 
> > Hmm, so I thought the plan we talked about here was to use QemuRunner. As
> > I said earlier, if QemuRunner isn't doing what we need here (e.g. isn't
> > allowing us to use pexpect) then we should fix it so that it does or at
> > least make it optional. Even with these changes we are still left with a
> > complete implementation of running QEMU here in the test, which we want to
> > avoid.
> -- I am aware that we should use QemuRunner but at the moment it
> isn't doing what we need here. Since these testcases might interfere with
> other qemu instances running in parallel I thought it is a good compromise
> the way I implemented in this patch. When we will manage to update
> QemuRunner, these testcase can be easily updated too.

I had thought what we would do would be to fix this properly in one go, but 
given the desire to reduce failures on the autobuilder we can accept this one. 
I do want us to fix this properly however (and soon). What I would suggest is, 
Markus can make the implementation to work for bug 7928, and then you can re-
use that here - I've entered a separate bug to cover the last part:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=7994
 
> These changes aren't described in the commit message - please either add
> mention of them or if they aren't actually related to resolving the QEMU
> running issue, put them in a separate patch.
> -- I updated the assert message to also include the output. Is it really
> necessary to submit another patch with this minor change?

As a general rule we shouldn't be mixing different fixes in the same patch 
unless they are completely tied together. If you could please keep this in 
mind for the future that would be much appreciated.

Looking more closely, I've just noticed that some of the places you have 
changed are looking at the status value returned from calls to runCmd() or 
bitbake(), except those calls to have the default of ignore_status=False, thus 
that assert will never be called on failure - the function checks the status 
already and bails out itself. Shouldn't we just drop these asserts entirely?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

