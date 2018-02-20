Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09A3B78726
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 15:50:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1KFo4Ed029336
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Feb 2018 07:50:04 -0800 (PST)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 20 Feb 2018 07:49:45 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1519054657-4616-1-git-send-email-bruce.ashfield@windriver.com>
	<1519054657-4616-2-git-send-email-bruce.ashfield@windriver.com>
	<1519083917.24236.261.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <2bb0d254-91d2-28e7-cf1b-1dbd4171ab13@windriver.com>
Date: Tue, 20 Feb 2018 10:50:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519083917.24236.261.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] make-mod-scripts: change how some kernel module tools are built
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
X-List-Received-Date: Tue, 20 Feb 2018 15:50:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02/19/2018 06:45 PM, Richard Purdie wrote:
> On Mon, 2018-02-19 at 10:37 -0500, Bruce Ashfield wrote:
>> From: Joe Slater <jslater@windriver.com>
>>
>> Remove do_make_scripts() from module-base.bbclass and put
>> functionality in a recipe.  This will build the scripts only
>> once instead of each time an external module is built.
>>
>> [YOCTO #12228]
>>
>> Signed-off-by: Joe Slater <jslater@windriver.com>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>
>> v2: added the LIC_FILES_CHECKSUM
>>
> 
> Sadly this doesn't pass all our tests:
> 
> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/827/steps/Running%20oe-selftest/logs/stdio
> 
> oe-selftest -r sstatetests.SStateTests.test_sstate_sametune_samesigs
> 
> should reproduce.
> 
> I suspect that the recipe may need:
> 
> PACKAGE_ARCH = "${MACHINE_ARCH}"

Once I finally got my layers correct, this does fix the problem.
Assuming I ran the test properly ;) Will send a v3 shortly.


:~/poky/build$ oe-selftest -r 
sstatetests.SStateTests.test_sstate_sametune_samesigs
2018-02-20 10:36:21,167 - oe-selftest - INFO - Adding layer libraries:
2018-02-20 10:36:21,167 - oe-selftest - INFO -  /home/bruce/poky/meta/lib
2018-02-20 10:36:21,167 - oe-selftest - INFO - 
/home/bruce/poky/meta-yocto-bsp/lib
2018-02-20 10:36:21,167 - oe-selftest - INFO - 
/home/bruce/poky/meta-selftest/lib
2018-02-20 10:36:21,169 - oe-selftest - INFO - Running bitbake -p
2018-02-20 10:36:31,724 - oe-selftest - INFO - Adding: "include 
selftest.inc" in /home/bruce/poky/build/conf/local.conf
2018-02-20 10:36:31,724 - oe-selftest - INFO - Adding: "include 
bblayers.inc" in bblayers.conf
2018-02-20 10:36:31,724 - oe-selftest - INFO - 
test_sstate_sametune_samesigs (sstatetests.SStateTests)
2018-02-20 10:40:14,496 - oe-selftest - INFO -  ... ok
2018-02-20 10:40:14,496 - oe-selftest - INFO - 
----------------------------------------------------------------------
2018-02-20 10:40:14,497 - oe-selftest - INFO - Ran 1 test in 222.773s
2018-02-20 10:40:14,497 - oe-selftest - INFO - OK
2018-02-20 10:40:14,497 - oe-selftest - INFO - RESULTS:
2018-02-20 10:40:14,497 - oe-selftest - INFO - RESULTS - 
sstatetests.SStateTests.test_sstate_sametune_samesigs - Testcase 1369: 
PASSED
2018-02-20 10:40:14,497 - oe-selftest - INFO - SUMMARY:
2018-02-20 10:40:14,497 - oe-selftest - INFO - oe-selftest () - Ran 1 
test in 222.774s
2018-02-20 10:40:14,497 - oe-selftest - INFO - oe-selftest - OK - All 
required tests passed

Bruce

> 
> Cheers,
> 
> Richard
> 


