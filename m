Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 553637DEA7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 09:25:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4S9PNRn011377
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 May 2019 02:25:23 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 28 May 2019 02:25:22 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1558516295-289667-1-git-send-email-mingli.yu@windriver.com>
	<12580c58f5d64b60ca87f5077b43924af5d746d2.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CECFFE9.3010807@windriver.com>
Date: Tue, 28 May 2019 17:31:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <12580c58f5d64b60ca87f5077b43924af5d746d2.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.170]
Subject: Re: [PATCH] elfutils: fix ptest failures
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
X-List-Received-Date: Tue, 28 May 2019 09:25:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年05月26日 04:16, richard.purdie@linuxfoundation.org wrote:
> On Wed, 2019-05-22 at 17:11 +0800, mingli.yu@windriver.com wrote:
>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>
>> * Add missing -ptest package dependencies (needs
>>    ${PN}-dbg)
>>
>> * Add missing files which needed by ptest test
>>    to fix below failures:
>>    | ./run-ar.sh: line 23: cd:
>> /usr/lib64/elfutils/ptest/tests/..//src: No such file or directory
>>    | FAIL: run-ar.sh
>>
>>    | sh: ../src/elflint: No such file or directory
>>    | FAIL: asm-tst4
>>
>> * Rework 0001-skip-the-test-when-gcc-not-deployed.patch
>>    to skip the tests which depend on gcc
>>
>> Before:
>> --------------------------------------------
>> Recipe   | Passed    | Failed   | Skipped
>> --------------------------------------------
>> elfutils | 176       | 23       | 4
>> --------------------------------------------
>>
>> After:
>> --------------------------------------------
>> Recipe   | Passed    | Failed   | Skipped
>> --------------------------------------------
>> elfutils | 184       | 15       | 4
>> --------------------------------------------
>>
>
> Unfortunately if I add this to the build we see failures due to core-
> image-sato-sdk-ptest becomming too large for generix86-64 as the image
> exceeds the 4GB limit its FSTYPE allows.
>
> I tried reducing the amount of free space in the image but then the
> strace and until-linux ptests fail:
>
> https://autobuilder.yocto.io/pub/non-release/20190524-8/testresults/testresult-report.txt
>
> We do plan to change the hddimg format and use wic to avoid the 4GB
> limit sometime in 2.8 but those patches aren't ready yet. I'm therefore
> not quite sure what to do here. Is there any way we can save space in
> the images so we could merge this?

It will be better if any space can be saved.

>
> Wth regard to the src/ directory, I did wonder if there needed to be a
> patch to one of the other scripts to use installed files (similar to
> how I fixed some of these last time)?

Have checked your patch about new target oecheck. Anyway, I have 
narrowed down a little to copy only the needed files to src/ dir.

And I also send out v2 patch then which updated to fix all the tests.

Thanks,

>
> Cheers,
>
> Richard
>
>

