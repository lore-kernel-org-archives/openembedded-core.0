Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0AEA7BEEC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 13:50:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4FDocKq018010
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 May 2019 06:50:38 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 15 May 2019 06:50:37 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <1557912193-40178-1-git-send-email-hongxu.jia@windriver.com>
	<CALbNGRT7NFoRN8EXYDiQ64+0g-bB=jvd7HcfUCRn+_26iRQX4Q@mail.gmail.com>
	<0ffc3e2e-2321-0edb-c90a-76225017472d@windriver.com>
	<20190515110813.GA13420@localhost>
	<6e3c7d20-a86b-9487-5640-0de47f716d95@windriver.com>
	<20190515134218.GA20396@localhost>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <da1db475-e2ea-d474-e335-1c56285b9361@windriver.com>
Date: Wed, 15 May 2019 21:50:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515134218.GA20396@localhost>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: output failed config.log
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
X-List-Received-Date: Wed, 15 May 2019 13:50:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 5/15/19 9:42 PM, Adrian Bunk wrote:
> On Wed, May 15, 2019 at 08:30:03PM +0800, Hongxu Jia wrote:
>> On 5/15/19 7:08 PM, Adrian Bunk wrote:
>>> The end of config.log often contains expected error messages completely
>>> unrelated to the actual problem.
>> I am afraid you did not suffer pain from it, the most related message
>>
>> with do_configure failure is config.log. Take a example, as my previous
>>
>> commit [grub/grub-efi: fix unrecognized command line option
>>
>> '-pipe-Wno-error' in CFLAGS]
>>
>> It takes me hours to reproduce grub/grub-efi build faiure (only
>> ...
> I fully understand your pain, and have already suffered it many times.
>
>>> Debian autobuilders already dump config.log when when configuring failed,
>>> and there it is a common problem that people end up searching for the
>>> problem in the wrong places due to that.
>> It's another story, it is better that autobuilder provide sufficient and
>>
>> necessary info and data, not only config.log, but also local.conf,
>>
>> all available log.do_***, sources in ${B} and ${S}, even data in ${WORKDIR},
>>
>> result of `bitbake -e'
>>
>> but before we got there, the fix is best choice for do_configure failure
> There is no universal best choice here.
>
> Let me give you an example when building a more recent ofono locally
> with and without your patch.
>
> When a configure task fails, the last lines from log.do_configure
> are dumped to the shell.
>
> Without your patch I get when building in a shell:
> ...
> | checking whether to build shared libraries... yes
> | checking whether to build static libraries... no
> | checking for signalfd... yes
> | checking for dlopen in -ldl... yes
> | checking for glib-2.0 >= 2.32... yes
> | checking for dbus-1 >= 1.4... yes
> | checking for libudev >= 143... yes
> | checking for mobile-broadband-provider-info... yes
> | checking for ell >= 0.12... no
> | configure: error: Embedded Linux library >= 0.12 is required
> ...
>
> The problem is immediately visible.
>
> With your patch, one has to scroll up through the whole config.log for
> getting this information.
>
> And the config.log contains plenty of other (expected) errors a user
> might mistake as cause of the problem.
>
> For autobuilders dumping config.log can be OK if there is no better
> option available, but people looking at autobuilder logs should be
> aware what to scroll over when starting to look at the log.
>
> For anyone building manually in a shell these should really not be done,
> it has a high potential of confuding the user and the config.log is
> easily available.
>
> The best available option might be to have a knob with default off,
> and autobuilders might be configured to dump config.log.

After applying my fix, here is the sample

...

checking for i586-wrs-linux-gcc... i586-wrs-linux-gcc  -m32 -march=i586 
--sysroot=/buildarea1/hjia/wrlinux-1019/build_master-wr_qemux86_2019051509/build/tmp-glibc/work/i586-wrs-linux/grub/2.02-r0/recipe-sysroot
checking whether the C compiler works... no
configure: error: in 
`/buildarea1/hjia/wrlinux-1019/build_master-wr_qemux86_2019051509/build/tmp-glibc/work/i586-wrs-linux/grub/2.02-r0/build':
configure: error: C compiler cannot create executables
See `config.log' for more details
NOTE: The following config.log files may provide further information.
NOTE: 
/buildarea1/hjia/wrlinux-1019/build_master-wr_qemux86_2019051509/build/tmp-glibc/work/i586-wrs-linux/grub/2.02-r0/build/config.log
NOTE: This file contains any messages produced by compilers while
NOTE: running configure, to aid debugging if configure makes a mistake.

...

The content of config.log has prefix `NOTE:' and also tells user

See `config.log' for more dettails and balabala

//Hongxu

>> //Hongxu
> cu
> Adrian
>


