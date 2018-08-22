Return-Path: <yang.wang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BCDB57940F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:44:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7MFiL3v028064
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Aug 2018 08:44:21 -0700 (PDT)
Received: from [147.11.118.189] (147.11.118.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 22 Aug 2018 08:44:21 -0700
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	<randy.macleod@windriver.com>
References: <7AA7B88A6FC2B84F9AA5EF03A8A6FCB201348A030B@ALA-MBD.corp.ad.wrs.com>
	<bebc4ced-47eb-9cb8-4df5-4716a2dd4d11@windriver.com>
	<CAP71WjxgSESvWm=FO=O0cmY+UE82OEc3L=2ioJp9K4xuhZ_hRQ@mail.gmail.com>
From: Yang Wang <yang.wang@windriver.com>
Message-ID: <0f31c417-75ef-fdd4-925f-de320a778275@windriver.com>
Date: Wed, 22 Aug 2018 11:44:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAP71WjxgSESvWm=FO=O0cmY+UE82OEc3L=2ioJp9K4xuhZ_hRQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 22 Aug 2018 15:44:23 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 18-08-22 02:51 AM, Nicolas Dechesne wrote:

> hi,
>
> On Wed, Aug 22, 2018 at 4:25 AM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>> On 08/21/2018 11:04 AM, Wang, Yang (Young) wrote:
>>> Hi All,
>>>
>>> I'm working on this ticket:
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12372
>> Thanks for investigating the bug/enhancement and posting your thoughts.
>> I'm jumping in without much expertise to try to get the ball rolling.
>>
>>> As far as I know, the following are all true nowadays:
>>> - Ptest needs to be run on real hardware and it takes few hours to finish
>>> - Ptest can be run within OEQA, it can also be run independently
>>> - LAVA is a good open source test  framework which:
>>>     - can manage both real hardware and different kinds of simulators as the test devices
>>>     - provides well managed logging system and test reports
>>>
>>> How to automatically run Ptest? I think running it with LAVA is a good solution, but ...
>>>
>>> LAVA is running as a server which can manage test jobs submitted to it, here is a typical LAVA job:
>>> https://staging.validation.linaro.org/scheduler/job/231942/definition
>>> As you can see, it defines the device type, test images which will used, the test cases and a lot of others.
>> That's a good clear format.
>>
>> I believe that what people are thinking is that we'd have:
>>
>> device_type: x86
>>
>> job_name: x86_64 oeqa
>> ...
>>
>> actions:
>> - deploy:
>>   ...
>>
>> - boot:
>> ...
>>
>> - test:
>>      timeout:
>>        minutes: 2
>>      definitions:
>>   << some thing that makes the target and lava server wait for
>>      oeqa to run >>
>>        name: oeqa-test
>>
>>> So the typical automatic way to run a test through LAVA is to write a script which use a LAVA job template, replace images with the expected ones, and then submit it to LAVA though a command, for example:
>>> $ lava-tool submit-job http://<user>@<lava-server> x86_64_ job_oeqa-ptest.yaml
> This is more or less something that we are doing as part of our CI
> loop. The process is the following:
>
> 1. fetch layers updates
> 2. make a new build for one or more $MACHINE
> 3. use LAVA job template to generate an actual LAVA job
> 4. run this LAVA job on the Linaro LAVA Board farm
>
> There is no integration into oe-core / bitbake, it is run outside of
> the OE builds.
This is clear, the test automation through LAVA needs to be done outside
of OE.
> You can check our ptest LAVA job from our most recent build:
> https://validation.linaro.org/scheduler/job/1890442
>
> The generated LAVA job is:
> https://validation.linaro.org/scheduler/job/1890442/definition
>
> The job deals with all the flashing/management of the device to test
> (a dragonboard 820c in this specific example), so there is a bit of
> boiler plate , but the base template for running ptest can be found
> here:
>
> https://git.linaro.org/ci/job/configs.git/tree/lt-qcom/lava-job-definitions/boards/template-ptest.yaml
>
> which itself points the the LAVA job definition for ptest:
>
> https://git.linaro.org/qa/test-definitions.git/tree/automated/linux/ptest
>
> This is where LAVA communicates and manages how to run ptests and get
> status from each test.
>
> And finally... you can view the test results for this ptest run in LAVA:
>
> https://validation.linaro.org/results/1890442/0_linux-ptest
My private test automation framework is doing the similar job on daily
basis.

So there are some preconditions of doing test automation through LAVA
publicly:
1. Select a public LAVA server with an accessible account
2. Exactly know which type of hardware we would like to use, and that
has to be set in the LAVA job
    - It doesn't need to set a specific board since LAVA supports
device-types, for example:
https://validation.linaro.org/scheduler/device_types
3. Devices under this specific device-type need to be maintained by
someone, if they don't work, our tests will fail all the time

So, go back to the original ticket, we can definitely create some
scripts to run Ptest automatically through LAVA, but specific settings
of LAVA server and device-type have to be there as well. I'm concerned
if this is what the ticket reporter would like to get.

Thanks,
-Yang Wang
>> That would still work given the above oeqa job.
>>
>> No doubt there's additional glue code that would
>> be nice to write that would allow automatically creating
>> the lava yaml that boots the system into a state where oeqa
>> code takes over.
> I think most of what needs to be created is there in all the links I
> shared above. This is what we came up with , and it is not integrated
> with oeqa. But this can be used as a baseline at least.
>
>> I've never used it and only just found the code but
>> I bet that adding another controller to:
>>
>> git://git.yoctoproject.org/meta-yocto
>>
>> $ ls  meta-yocto-bsp/lib/oeqa/controllers/
>> beaglebonetarget.py  edgeroutertarget.py  grubtarget.py  __init__.py
>>
>> is what would make sense.
>>
>>> This command will return a job id (take #231942 as an example), and then the script can get all logs and reports based on LAVA server address and this job id, for example:
>>> - execution log: https://staging.validation.linaro.org/scheduler/job/231942
>>> - test report: https://staging.validation.linaro.org/results/231942/0_smoke-tests
>> Suspect that this is were the design intent diverges.
>>
>> Usually lava runs the whole system, and I think we just
>> want it to manage the hardware and then step out of the way.
>> There'd likely be an api to allow oeqa and lava to communicate
>> so that for example oeqa could tell lava that the tests were done.
> Yes, LAVA runs the whole system. Including management of devices to
> test, reboot, flashing.. It also has a LAVA test definition format
> that must be used. So to benefit from LAVA, a LAVA instance must be
> setup, and then we need to have lab instances where boards are
> attached to. A LAVA instance can have several labs, and labs can be
> spread physically. LAVA must know how to deal with each
> hardware/machine (e.g. how to power it on, get a serial console). The
> linux rootfs can be flashed into onboard memory, or NFS can be used as
> well. That is left to the JOB writer.
>
>> All lava would know is that an oeqa test ran and it's completion
>> status.
>>
>>> So, as far as I can tell, it may not be an appropriate way to integrate LAVA test into a bitbake command as we run it with simple test harness, LAVA is an advanced test framework and it manages all jobs submit to it well.
>>>
>>> Please comment if you have better idea about this ticket.
>> I'm really going on a few conversations that I've had or chats
>> on IRC so hopefully someone else can step up and comment on both Young's
>> initial email and my interpretation of where we're trying to
>> get to.
>>
>> Thanks,
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


