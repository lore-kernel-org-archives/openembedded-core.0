Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 67F84729D6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 11:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBLBRELY000388; Sun, 21 Dec 2014 11:27:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5ZMv1VOWTHss; Sun, 21 Dec 2014 11:27:14 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBLBR0Pu000384
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 21 Dec 2014 11:27:12 GMT
Message-ID: <1419161257.13316.49.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Sun, 21 Dec 2014 11:27:37 +0000
In-Reply-To: <54962AAB.9040800@windriver.com>
References: <1418984914.13316.6.camel@linuxfoundation.org>
	<1418992908.13316.14.camel@linuxfoundation.org>
	<54942326.8080806@windriver.com>
	<1418994949.13316.16.camel@linuxfoundation.org>
	<1419074109.13316.31.camel@linuxfoundation.org>
	<54959211.9020504@windriver.com>
	<1419115211.13316.47.camel@linuxfoundation.org>
	<54962AAB.9040800@windriver.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Merging problems
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
X-List-Received-Date: Sun, 21 Dec 2014 11:27:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-12-20 at 21:04 -0500, Bruce Ashfield wrote:
> On 2014-12-20 5:40 PM, Richard Purdie wrote:
> > On Sat, 2014-12-20 at 10:13 -0500, Bruce Ashfield wrote:
> >> On 2014-12-20 6:15 AM, Richard Purdie wrote:
> >>> So where are we at?
> >>>
> >>> Thanks to some great help from Ross, we have a number of patches merged
> >>> and many of the issues in my last email have been addressed. I'm
> >>> continuing to struggle with the kernel series. The last build on the
> >>> autobuilder highlighted that:
> >>>
> >>> * there are problems in boot-directdisk.bbclass (have a fix)
> >>> * there is a do_rootfs/do_package_qa race (have a fix)
> >>> * the report-error.bbclass tasks could crash (have a fix)
> >>> * the kernelmodule sanity tests were failing (have a fix)
> >>> * qemumips gdb is failing to compile, probably due to new kernel
> >>>     headers (no fix as yet)
> >>> * systemd sanity QA tests continue to fail on xorg and systemd-login
> >>>     (no fix as yet)
> >>> * there are continuing problems with linux-imx from meta-fsl-arm, I
> >>>     thought these were addressed but clearly not :(
> >>>
> >>> Ideally I'd like to take some time off over the holidays but I can't see
> >>> that happening until the patch queues are under some kind of control :(.
> >>
> >> Let me know if there are one of these that you want me to take. I'm all
> >> for pitching in and getting everyone some down time.
> >
> > Looks like I spoke too soon:
> >
> > https://autobuilder.yoctoproject.org/main/builders/nightly-x86/builds/132/steps/BuildImages_1/logs/stdio
> 
> Amazing how those race conditions pop out on the builders .. I probably
> built this 100 times, and never managed to trigger these.

We also have one more:

https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/134/steps/Running%20Sanity%20Tests/logs/stdio

On target module building for ppc fails.

> > which seems to be a race over the kernel source directory. I'm guessing
> > the file in question is a temporary build artefact of lttng-modules
> > which was running at the same time? Any way we can avoid temp files in
> > the kernel source dir?
> 
> Hmm. The modules should already have their output directory set to their
> own source (not the kernel), so they really shouldn't be dropping down
> any temp files.
> 
> I was only using the cpio method to copy the source since that is what
> was already being used .. and it is a bit faster. The stat of the
> files to the pipe is what is catching us here.
> 
> The question is .. do we really care ? A straight copy of the files wouldn't
> be so sensitive to this, or we could explicitly exclude then in the
> existing cpio pipe. That would buy some time to track down what is
> touching down the tmp file in the kernel build process, and I can't see
> how the dual use of that staged directory will cause us a problem on
> the copied kernel source side (we do clean things up before packaging).

Well, I think we need to get to the bottom of this. I made some
experiments. The best results were from hacking scripts/Kbuild.include
where these .tmp files get created, I hacked it not to remove them.

When you do that, it becomes clear that do_make_scripts is the task
which is causing the problem.

The world has changed since we last visited the scripts problem, we
could move that task to the main kernel build now and have the modules
and kernel-devsrc depend on it? The function in module.bbclass would
then become a placeholder?

Cheers,

Richard




