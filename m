Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id 71E496FF78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:51:55 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id 203-v6so607583ljj.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 23:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RKV64qc5JbemV8tEaRgfP8yE8PgIkmly5heNh6sJFW0=;
	b=bnQgOXR04ydiXBjr0Q1rLvdOlw0rnY6WFbp/NCPuPvOFHIksIYIP+efVR7dpL+ERL5
	OxKNsdHnijK8te4DqlrRNr6VZZwm+K5vkyKeAfTmu7t1ZSfrQBypFaVgFs2mEbxIAWvg
	qzTCN5sYfRP4gFg9KJcvyruYu+9OYJp0Rp9IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RKV64qc5JbemV8tEaRgfP8yE8PgIkmly5heNh6sJFW0=;
	b=cWrTdQbrq3WigUHrOO0BsnSyxGWnWkzz8IGDz5lUz5m91w+hdJM1AJAQT6KJaZRw7W
	lUjOpTc3tnRfhPf5+27bjf0VVN+8lybwXa48ucoTEQoIjHXTESVrjgqVNpxyAiXUioFr
	22mODmLnVR7MJ5WkryZfniolt2abQr+yNGdE5Ut5tHC0bt2eSrLYX6AwW1CH+EAll744
	I8M7I6fmnZPf/kp12blv22aIoXmOyaHk+Vr2tNvkddp1XI8lvZDn3B6Zbp1Cx332dWdx
	qxyAEWfkwjm4DI3Ws/Bx1m1gEjvROGBFgfGCyhlZyShNvZoNefyjwGCvup36mXL6zR6q
	AQBA==
X-Gm-Message-State: APzg51AUISg1aMz17iJEKwBWu9uxurFUr9r0rX03IO+cKLgw3TO1pfX1
	froR89iyiyWxT5LVOdRvuojmZKPPf6zY5GtlL9oxeA==
X-Google-Smtp-Source: ANB0VdZ1vKlS6u7COHS1RoPcCYhfjpqg2vCHH+EcOZB5GtIkY4Krsn4iqKK0+bgnl5F82pMYqveax742RbghNvQF+mw=
X-Received: by 2002:a2e:658a:: with SMTP id
	e10-v6mr2055685ljf.99.1534920715921; 
	Tue, 21 Aug 2018 23:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <7AA7B88A6FC2B84F9AA5EF03A8A6FCB201348A030B@ALA-MBD.corp.ad.wrs.com>
	<bebc4ced-47eb-9cb8-4df5-4716a2dd4d11@windriver.com>
In-Reply-To: <bebc4ced-47eb-9cb8-4df5-4716a2dd4d11@windriver.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 22 Aug 2018 08:51:44 +0200
Message-ID: <CAP71WjxgSESvWm=FO=O0cmY+UE82OEc3L=2ioJp9K4xuhZ_hRQ@mail.gmail.com>
To: randy.macleod@windriver.com
Cc: richard.purdie@intel.com, jair.de.jesus.gonzalez.plascencia@intel.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Yocto Project Bug 12372 - Automate the execution of pTest with LAVA
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
X-List-Received-Date: Wed, 22 Aug 2018 06:51:55 -0000
Content-Type: text/plain; charset="UTF-8"

hi,

On Wed, Aug 22, 2018 at 4:25 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 08/21/2018 11:04 AM, Wang, Yang (Young) wrote:
> > Hi All,
> >
> > I'm working on this ticket:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=12372
>
> Thanks for investigating the bug/enhancement and posting your thoughts.
> I'm jumping in without much expertise to try to get the ball rolling.
>
> >
> > As far as I know, the following are all true nowadays:
> > - Ptest needs to be run on real hardware and it takes few hours to finish
> > - Ptest can be run within OEQA, it can also be run independently
> > - LAVA is a good open source test  framework which:
> >     - can manage both real hardware and different kinds of simulators as the test devices
> >     - provides well managed logging system and test reports
> >
> > How to automatically run Ptest? I think running it with LAVA is a good solution, but ...
> >
> > LAVA is running as a server which can manage test jobs submitted to it, here is a typical LAVA job:
> > https://staging.validation.linaro.org/scheduler/job/231942/definition
> > As you can see, it defines the device type, test images which will used, the test cases and a lot of others.
>
> That's a good clear format.
>
> I believe that what people are thinking is that we'd have:
>
> device_type: x86
>
> job_name: x86_64 oeqa
> ...
>
> actions:
> - deploy:
>   ...
>
> - boot:
> ...
>
> - test:
>      timeout:
>        minutes: 2
>      definitions:
>   << some thing that makes the target and lava server wait for
>      oeqa to run >>
>        name: oeqa-test
>
> >
> > So the typical automatic way to run a test through LAVA is to write a script which use a LAVA job template, replace images with the expected ones, and then submit it to LAVA though a command, for example:
> > $ lava-tool submit-job http://<user>@<lava-server> x86_64_ job_oeqa-ptest.yaml

This is more or less something that we are doing as part of our CI
loop. The process is the following:

1. fetch layers updates
2. make a new build for one or more $MACHINE
3. use LAVA job template to generate an actual LAVA job
4. run this LAVA job on the Linaro LAVA Board farm

There is no integration into oe-core / bitbake, it is run outside of
the OE builds.

You can check our ptest LAVA job from our most recent build:
https://validation.linaro.org/scheduler/job/1890442

The generated LAVA job is:
https://validation.linaro.org/scheduler/job/1890442/definition

The job deals with all the flashing/management of the device to test
(a dragonboard 820c in this specific example), so there is a bit of
boiler plate , but the base template for running ptest can be found
here:

https://git.linaro.org/ci/job/configs.git/tree/lt-qcom/lava-job-definitions/boards/template-ptest.yaml

which itself points the the LAVA job definition for ptest:

https://git.linaro.org/qa/test-definitions.git/tree/automated/linux/ptest

This is where LAVA communicates and manages how to run ptests and get
status from each test.

And finally... you can view the test results for this ptest run in LAVA:

https://validation.linaro.org/results/1890442/0_linux-ptest

>
> That would still work given the above oeqa job.
>
> No doubt there's additional glue code that would
> be nice to write that would allow automatically creating
> the lava yaml that boots the system into a state where oeqa
> code takes over.

I think most of what needs to be created is there in all the links I
shared above. This is what we came up with , and it is not integrated
with oeqa. But this can be used as a baseline at least.

>
> I've never used it and only just found the code but
> I bet that adding another controller to:
>
> git://git.yoctoproject.org/meta-yocto
>
> $ ls  meta-yocto-bsp/lib/oeqa/controllers/
> beaglebonetarget.py  edgeroutertarget.py  grubtarget.py  __init__.py
>
> is what would make sense.
>
> > This command will return a job id (take #231942 as an example), and then the script can get all logs and reports based on LAVA server address and this job id, for example:
> > - execution log: https://staging.validation.linaro.org/scheduler/job/231942
> > - test report: https://staging.validation.linaro.org/results/231942/0_smoke-tests
>
> Suspect that this is were the design intent diverges.
>
> Usually lava runs the whole system, and I think we just
> want it to manage the hardware and then step out of the way.
> There'd likely be an api to allow oeqa and lava to communicate
> so that for example oeqa could tell lava that the tests were done.

Yes, LAVA runs the whole system. Including management of devices to
test, reboot, flashing.. It also has a LAVA test definition format
that must be used. So to benefit from LAVA, a LAVA instance must be
setup, and then we need to have lab instances where boards are
attached to. A LAVA instance can have several labs, and labs can be
spread physically. LAVA must know how to deal with each
hardware/machine (e.g. how to power it on, get a serial console). The
linux rootfs can be flashed into onboard memory, or NFS can be used as
well. That is left to the JOB writer.

>
> All lava would know is that an oeqa test ran and it's completion
> status.
>
> > So, as far as I can tell, it may not be an appropriate way to integrate LAVA test into a bitbake command as we run it with simple test harness, LAVA is an advanced test framework and it manages all jobs submit to it well.
> >
> > Please comment if you have better idea about this ticket.
>
> I'm really going on a few conversations that I've had or chats
> on IRC so hopefully someone else can step up and comment on both Young's
> initial email and my interpretation of where we're trying to
> get to.
>
> Thanks,
>
> --
> # Randy MacLeod
> # Wind River Linux
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

