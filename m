Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D9BD96FFD4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 02:25:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7M2PVw4019881
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Aug 2018 19:25:31 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 21 Aug 2018 19:25:31 -0700
To: "Wang, Yang (Young)" <yang.wang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <7AA7B88A6FC2B84F9AA5EF03A8A6FCB201348A030B@ALA-MBD.corp.ad.wrs.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <bebc4ced-47eb-9cb8-4df5-4716a2dd4d11@windriver.com>
Date: Tue, 21 Aug 2018 22:25:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7AA7B88A6FC2B84F9AA5EF03A8A6FCB201348A030B@ALA-MBD.corp.ad.wrs.com>
X-Originating-IP: [172.25.44.4]
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	jair.de.jesus.gonzalez.plascencia@intel.com
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
X-List-Received-Date: Wed, 22 Aug 2018 02:25:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 08/21/2018 11:04 AM, Wang, Yang (Young) wrote:
> Hi All,
> 
> I'm working on this ticket:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12372

Thanks for investigating the bug/enhancement and posting your thoughts.
I'm jumping in without much expertise to try to get the ball rolling.

> 
> As far as I know, the following are all true nowadays:
> - Ptest needs to be run on real hardware and it takes few hours to finish
> - Ptest can be run within OEQA, it can also be run independently
> - LAVA is a good open source test  framework which:
>     - can manage both real hardware and different kinds of simulators as the test devices
>     - provides well managed logging system and test reports
>   
> How to automatically run Ptest? I think running it with LAVA is a good solution, but ...
>   
> LAVA is running as a server which can manage test jobs submitted to it, here is a typical LAVA job:
> https://staging.validation.linaro.org/scheduler/job/231942/definition
> As you can see, it defines the device type, test images which will used, the test cases and a lot of others.

That's a good clear format.

I believe that what people are thinking is that we'd have:

device_type: x86

job_name: x86_64 oeqa
...

actions:
- deploy:
  ...

- boot:
...

- test:
     timeout:
       minutes: 2
     definitions:
  << some thing that makes the target and lava server wait for
     oeqa to run >>
       name: oeqa-test

>   
> So the typical automatic way to run a test through LAVA is to write a script which use a LAVA job template, replace images with the expected ones, and then submit it to LAVA though a command, for example:
> $ lava-tool submit-job http://<user>@<lava-server> x86_64_ job_oeqa-ptest.yaml

That would still work given the above oeqa job.

No doubt there's additional glue code that would
be nice to write that would allow automatically creating
the lava yaml that boots the system into a state where oeqa
code takes over.

I've never used it and only just found the code but
I bet that adding another controller to:

git://git.yoctoproject.org/meta-yocto

$ ls  meta-yocto-bsp/lib/oeqa/controllers/
beaglebonetarget.py  edgeroutertarget.py  grubtarget.py  __init__.py

is what would make sense.

> This command will return a job id (take #231942 as an example), and then the script can get all logs and reports based on LAVA server address and this job id, for example:
> - execution log: https://staging.validation.linaro.org/scheduler/job/231942
> - test report: https://staging.validation.linaro.org/results/231942/0_smoke-tests

Suspect that this is were the design intent diverges.

Usually lava runs the whole system, and I think we just
want it to manage the hardware and then step out of the way.
There'd likely be an api to allow oeqa and lava to communicate
so that for example oeqa could tell lava that the tests were done.

All lava would know is that an oeqa test ran and it's completion
status.

> So, as far as I can tell, it may not be an appropriate way to integrate LAVA test into a bitbake command as we run it with simple test harness, LAVA is an advanced test framework and it manages all jobs submit to it well.
>   
> Please comment if you have better idea about this ticket.

I'm really going on a few conversations that I've had or chats
on IRC so hopefully someone else can step up and comment on both Young's
initial email and my interpretation of where we're trying to
get to.

Thanks,

-- 
# Randy MacLeod
# Wind River Linux

