Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BAEBC7FEDE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 02:32:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8K2WRHU015998
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 19 Sep 2019 19:32:27 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 19 Sep 2019 19:32:26 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1567741059-137869-1-git-send-email-changqing.li@windriver.com>
	<3f394af5d0dcaabf8465b5a53ce9c2c7b3d07e54.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <66a27926-2d65-8677-0d76-f1903f82c6a9@windriver.com>
Date: Fri, 20 Sep 2019 10:32:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <3f394af5d0dcaabf8465b5a53ce9c2c7b3d07e54.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.186]
Subject: Re: [PATCH 1/2] mdadm: fix do_package failed when changed local.conf but not cleaned
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
X-List-Received-Date: Fri, 20 Sep 2019 02:32:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 9/7/19 5:48 AM, Richard Purdie wrote:
> On Fri, 2019-09-06 at 11:37 +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> reproduce steps:
>> 1. add DISTRO_FEATURE_append = 'usrmerge' in local.conf
>> 2. bitbake mdadm --success
>> 3. remove DISTRO_FEATURE_append = 'usrmerge' from local.conf
>> 4. bitbake mdadm  -- failed when do_package
>>
>> it is not proper to change source Makefile during do_install by sed,
>> change to add patch for it.
>>
>> [YOCTO #13493]
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> This somehow seems to break:
>
> oe-selftest -r devtool.DevtoolModifyTests.test_devtool_buildclean
> and
> oe-selftest -r devtool.DevtoolModifyTests.test_devtool_modify
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/694
>
> Cheers,
>
> Richard

I researched this problem,  it is not problem of this patch, but this 
patch reveal

the defect of the testcase.


without this patch, Makefile is changed during first run of do_compile 
task,

for external_src, EXTERNALSRC is one of inputs of sigdata of do_compile,

then will rerun the second time's compile task.  but this cover defects 
of testcase,

please see the fixed patch for details.


I have send 2 patch to fix the problem of testcase,  which is titled 
with devtool.py


BRs

Sandy

>
>
>

