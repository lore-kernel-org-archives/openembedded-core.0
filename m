Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B877C71DD0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 02:12:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6O2C16D015580
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 23 Jul 2017 19:12:01 -0700
Received: from [128.224.162.246] (128.224.162.246) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 23 Jul 2017 19:12:00 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>,
	<paul.eggleton@linux.intel.com>, <ross.burton@intel.com>
References: <cover.1500450690.git.liezhi.yang@windriver.com>
	<0f028eac-d2d0-3ab8-232c-658db5b7cc6d@windriver.com>
	<1500640365.22282.104.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <09c7ddc7-feff-a94e-2b6c-5d309aaf6bef@windriver.com>
Date: Mon, 24 Jul 2017 10:11:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1500640365.22282.104.camel@linuxfoundation.org>
Subject: Re: [RFC PATCH 0/5] revive runtime/cases/_ptest.py
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
X-List-Received-Date: Mon, 24 Jul 2017 02:12:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/21/2017 08:32 PM, Richard Purdie wrote:
> On Thu, 2017-07-20 at 10:09 +0800, Robert Yang wrote:
>>
>> On 07/19/2017 04:16 PM, Robert Yang wrote:
>>>
>>> Hello,
>>>
>>> These patches can make ptest test case work, RP has suggested we
>>> write a tool to
>>> do the regression check on ptest result, I think that the use case
>>> is like:
>>>
>>> $ bitbake <image> -ctestiamge # Suppose we add ptest to default
>>> test cases in the future
>>> # Upgrade a recipe form V1.0 to V1.1
>>> $ bitbake <image> -ctestiamge # Run the test again
>>>
>>> Then the regression check tool can report what's different (passed,
>>> failed,
>>> skipped) between V1.0 and V1.1.
>>>
>>> Currently, I'm not sure about where to save the ptest results, I
>>> saved it to
>>> ${WORKDIR}/testimage/ptest_log atm, e.g.:
>>> tmp/work/qemux86-poky-linux/core-image-minimal/1.0-
>>> r0/testimage/ptest_log
>> I still have to think about more about where to put the test result.
>
> Would buildhistory make sense for these since we already have a
> mechanism to store results there between builds?

Thanks, I will add it to buildhistory.

>
>>> But it will be removed after -cclean, then no regression check can
>>> be made, so
>>> I'd like to save the ptest results to DEPLOY_DIR_IMAGE if no
>>> objections, and
>>> make -cclean not remove them. (Or only keep the latest 2 results).
>>>
>>> And I'm not sure where to add the regression check/tool, maybe one
>>> of:
>>> 1) Add a separate tool in oe-core/scripts, this can make it easy to
>>> do regression
>>>    check among different build directories, and
>>> runtime/cases/_ptest.py can invoke it.
>> I'm leaning to add a script called ptest-regression-check which is
>> more flexible, the cases/ptest.py or buildhistory (also the user) can
>> run it when needed.
>
> I'd either add a script, or perhaps an option to the buildhistory-diff?
> Paul might have some adivce on that. I would like to understand if
> there is a good reason we can't use buildhistory to at least help with
> some of this?

Thanks, the script (I named it prc -- Ptest Result Compare  or Ptest Regression
Compile) already done, I will investigate buildhistory to see how to merge it
into buildhistory.

// Robert

>
> Cheers,
>
> Richard
>

