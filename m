Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8D9A26E85D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 01:27:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s241RFwu026388
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Mar 2014 17:27:15 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 3 Mar 2014 17:27:14 -0800
Message-ID: <53152BF1.3050806@windriver.com>
Date: Tue, 4 Mar 2014 09:27:13 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1393256563.git.liezhi.yang@windriver.com>
	<CAJTo0Lb=a40bP3R-YtSoxeixcKaPjASwiXU8617cfMSqx4cKMw@mail.gmail.com>
In-Reply-To: <CAJTo0Lb=a40bP3R-YtSoxeixcKaPjASwiXU8617cfMSqx4cKMw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5 V2] refactor the archiver*.bbclass
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
X-List-Received-Date: Tue, 04 Mar 2014 01:27:17 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Ross,

Thanks for your reply, please see my comments inline.

On 02/27/2014 09:05 PM, Burton, Ross wrote:
> Hi Robert,
>
> Having a look at this and playing with my own toy archiver makes me
> think that this shouldn't be using the postfuncs at all.
>

Yes, I gree as we had talked.

> The main task, deploy_archives, should depend on the subtasks that it
> needs and be simply ordered before do_build.  I see that your code
> does this but changes it to be before do_rootfs if the recipe is an
> image: I'm not sure I understand why this is as do_rootfs is just a
> task that executes before do_build so this shouldn't need
> special-casing.
>

This part of code is derived from the previous archiver.bbclass, I will
remove it.

> Why did you implement the subtasks as postfuncs instead of normal
> tasks?  This has the effect of causing more work to be done if the

What I had thought was that use the postfuncs will always make sure it
will run, for example, if do_unpack runs, then do_unpack[postfuncs] will
always run, but if we use a new task:

addtask do_ar_unpacked after do_unpack before do_patch

If do_patch doesn't run, the do_ar_unpacked would not run either, as had
talked, we will use new ${S}, so this problem will be gone, I will use
new tasks.

> archiver needs to run: for example do_ar_unpacked() is a postfunc on
> do_unpack so either enabling/disabling the archiver or editing the
> archiver class causes the do_unpack hash to change, so everything
> afterwards (do_patch, do_configure, do_compile, ...) has to
> re-execute.
>
> My toy archiver was implemented as a new task which is after do_fetch
> but before do_build.  This means that it executes after fetch has
> completed but is outside of the
> fetch->patch->configure->compile->install sequence.
>
> https://github.com/rossburton/meta-ross/blob/master/classes/rearchiver.bbclass
>
> (it also has a way of archiving the original sources in a way that
> actually archives the original sources)

Great, thanks, I will send a V3 sooner.

// Robert


>
> Ross
>
>

