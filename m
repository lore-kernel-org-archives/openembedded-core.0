Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0651272A18
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 02:06:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBL267vY009814
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sat, 20 Dec 2014 18:06:07 -0800 (PST)
Received: from server.local (128.224.21.8) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 20 Dec 2014 18:04:28 -0800
Message-ID: <54962AAB.9040800@windriver.com>
Date: Sat, 20 Dec 2014 21:04:27 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1418984914.13316.6.camel@linuxfoundation.org>		
	<1418992908.13316.14.camel@linuxfoundation.org>		
	<54942326.8080806@windriver.com>		
	<1418994949.13316.16.camel@linuxfoundation.org>	
	<1419074109.13316.31.camel@linuxfoundation.org>	
	<54959211.9020504@windriver.com>
	<1419115211.13316.47.camel@linuxfoundation.org>
In-Reply-To: <1419115211.13316.47.camel@linuxfoundation.org>
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
X-List-Received-Date: Sun, 21 Dec 2014 02:06:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-12-20 5:40 PM, Richard Purdie wrote:
> On Sat, 2014-12-20 at 10:13 -0500, Bruce Ashfield wrote:
>> On 2014-12-20 6:15 AM, Richard Purdie wrote:
>>> So where are we at?
>>>
>>> Thanks to some great help from Ross, we have a number of patches merged
>>> and many of the issues in my last email have been addressed. I'm
>>> continuing to struggle with the kernel series. The last build on the
>>> autobuilder highlighted that:
>>>
>>> * there are problems in boot-directdisk.bbclass (have a fix)
>>> * there is a do_rootfs/do_package_qa race (have a fix)
>>> * the report-error.bbclass tasks could crash (have a fix)
>>> * the kernelmodule sanity tests were failing (have a fix)
>>> * qemumips gdb is failing to compile, probably due to new kernel
>>>     headers (no fix as yet)
>>> * systemd sanity QA tests continue to fail on xorg and systemd-login
>>>     (no fix as yet)
>>> * there are continuing problems with linux-imx from meta-fsl-arm, I
>>>     thought these were addressed but clearly not :(
>>>
>>> Ideally I'd like to take some time off over the holidays but I can't see
>>> that happening until the patch queues are under some kind of control :(.
>>
>> Let me know if there are one of these that you want me to take. I'm all
>> for pitching in and getting everyone some down time.
>
> Looks like I spoke too soon:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86/builds/132/steps/BuildImages_1/logs/stdio

Amazing how those race conditions pop out on the builders .. I probably
built this 100 times, and never managed to trigger these.

>
> which seems to be a race over the kernel source directory. I'm guessing
> the file in question is a temporary build artefact of lttng-modules
> which was running at the same time? Any way we can avoid temp files in
> the kernel source dir?

Hmm. The modules should already have their output directory set to their
own source (not the kernel), so they really shouldn't be dropping down
any temp files.

I was only using the cpio method to copy the source since that is what
was already being used .. and it is a bit faster. The stat of the
files to the pipe is what is catching us here.

The question is .. do we really care ? A straight copy of the files wouldn't
be so sensitive to this, or we could explicitly exclude then in the
existing cpio pipe. That would buy some time to track down what is
touching down the tmp file in the kernel build process, and I can't see
how the dual use of that staged directory will cause us a problem on
the copied kernel source side (we do clean things up before packaging).

Bruce

>
> Cheers,
>
> Richard
>
>


