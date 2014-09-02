Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C45486FE3B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 12:11:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s82CBWE8014702
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Sep 2014 05:11:33 -0700 (PDT)
Received: from server.local (147.11.116.193) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 05:11:32 -0700
Message-ID: <5405B3F4.4000507@windriver.com>
Date: Tue, 2 Sep 2014 08:11:32 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>	
	<1409479646.29296.223.camel@ted> <5403DC5C.4020307@windriver.com>
	<1409587965.29296.233.camel@ted>
In-Reply-To: <1409587965.29296.233.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/18] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 02 Sep 2014 12:11:39 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-09-01, 12:12 PM, Richard Purdie wrote:
> On Sun, 2014-08-31 at 22:39 -0400, Bruce Ashfield wrote:
>> On 2014-08-31, 6:07 AM, Richard Purdie wrote:
>>> Thanks for the other fix, I've pulled that in and am retesting. I did
>>> also see:
>>>
>>> https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/24/steps/BuildImages/logs/stdio
>>>
>>> ERROR: Fetcher failure: Unable to find revision 5a47bbc4c3c2472f3746a8cf1485db7134cf9245 in branch master even from upstream
>>> ERROR: Function failed: Fetcher failure for URL: 'git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=master,meta;name=machine,meta'. Unable to fetch URL from any source.
>>> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/qemux86_64-poky-linux/linux-yocto-tiny/3.14.17+gitAUTOINC+ccad961c4c_5a47bbc4c3-r0/temp/log.do_fetch.10000
>>> NOTE: recipe linux-yocto-tiny-3.14.17+gitAUTOINC+ccad961c4c_5a47bbc4c3-r0: task do_fetch: Failed
>>> ERROR: Task 324 (/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb, do_fetch) failed with exit code '1'
>>> WARNING: Failed to fetch URL git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=master,meta;name=machine,meta, attempting MIRRORS if available
>>> ERROR: Fetcher failure: Unable to find revision 12f9e966eb249c3bdcc935612e2a372e90bad950 in branch master even from upstream
>>> ERROR: Function failed: Fetcher failure for URL: 'git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=master,meta;name=machine,meta'. Unable to fetch URL from any source.
>>> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/qemux86_64-poky-linux/linux-yocto-rt/3.14.17+gitAUTOINC+ccad961c4c_12f9e966eb-r0/temp/log.do_fetch.9978
>>> NOTE: recipe linux-yocto-rt-3.14.17+gitAUTOINC+ccad961c4c_12f9e966eb-r0: task do_fetch: Failed
>>> ERROR: Task 325 (/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb, do_fetch) failed with exit code '1
>>>
>>> (I've a fix in for the other alsa failure)
>>>
>>> Any idea what's up with this?
>>
>> Fixed. I just pushed the patch to my contrib zedd/kernel branch. Attached
>> here as well.
>>
>> I did fat finger the conditional assignments and include order in my
>> KBRANCH_DEFAULT removal patch.
>>
>> But it is working now, and I'm back to normally scheduled long weekend
>> activities .. but will of course continue to monitor.
>
> Thanks, much appreciated. We're down to one remaining issue:
>
> https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/27/steps/BuildImages/logs/stdio
>
> which is basically because by default, meta-skeleton isn't in
> bblayers.conf. Not quite sure what the correct fix is here.

Aha .. indeed.

>
> For now I've merged everything in the series except the image addition.

Sounds good. I'll have a look at that image type and see what I can cook up.

Bruce

>
> Cheers,
>
> Richard
>


