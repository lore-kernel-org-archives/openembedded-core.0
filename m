Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C66336CA17
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 02:59:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA82xMAX027493
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Nov 2013 18:59:22 -0800 (PST)
Received: from [147.11.118.117] (147.11.118.117) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 7 Nov 2013 18:59:22 -0800
Message-ID: <527C5387.3020207@windriver.com>
Date: Thu, 7 Nov 2013 21:59:19 -0500
From: Konrad Scherer <Konrad.Scherer@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <1383849386-7680-1-git-send-email-konrad.scherer@windriver.com>
	<1383849386-7680-2-git-send-email-konrad.scherer@windriver.com>
	<527C1F43.2080105@linux.intel.com>
In-Reply-To: <527C1F43.2080105@linux.intel.com>
X-Originating-IP: [147.11.118.117]
Subject: Re: [PATCH] perf: Disable warnings as errors for kernels 3.1+
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
X-List-Received-Date: Fri, 08 Nov 2013 02:59:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-11-07 06:16 PM, Saul Wold wrote:
> On 11/07/2013 10:36 AM, Konrad Scherer wrote:
>> From: Konrad Scherer <Konrad.Scherer@windriver.com>
>>
>> Turns out the sed command has not been working as intended since
>> kernel 3.1 due to the trailing space. Adding the WERROR=0 environment
>> variable is the correct way to disable warnings as errors.
>>
> So, I recently saw this failure:
>
> ERROR: Logfile of failure stored in:
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/genericx86_64-poky-linux/perf/1.0-r8/temp/log.do_configure.12897
>
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: Executing shell function do_configure
> | sed: can't read
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/genericx86-64/usr/src/kernel/tools/perf/Makefile:
> No such file or directory
> | WARNING:
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/genericx86_64-poky-linux/perf/1.0-r8/temp/run.do_configure.12897:1
> exit 2 from
> |   sed -i 's,-Werror ,,'
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/genericx86-64/usr/src/kernel/tools/perf/Makefile
>
> | ERROR: Function failed: do_configure (log file is located at
> /home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/genericx86_64-poky-linux/perf/1.0-r8/temp/log.do_configure.12897)
>
> NOTE: recipe perf-1.0-r8: task do_configure: Failed
> ERROR: Task 3469
> (/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/meta/recipes-kernel/perf/perf.bb,
> do_configure) failed with exit code '1'
>
> I am not sure that your patch will completely address this failure.

Hmm, I have not seen that failure. The build failure my patch is 
addressing was a "warning as error" compile failure. If the sed command 
was moved before the call to make, that should resolve this build 
failure as well. Should I rework the patch?

-- 
Konrad Scherer, MTS, Linux Products Group, Wind River

