Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5696011B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Dec 2017 02:37:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBQ2bDBK006173
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Dec 2017 18:37:14 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 25 Dec 2017 18:37:13 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1513821698.git.liezhi.yang@windriver.com>
	<6bed2ead820cbb22462e458b49c82c71ece0ff85.1513821698.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <3fb4c571-65e0-6ddc-2a95-a31c261a5fc4@windriver.com>
Date: Tue, 26 Dec 2017 10:37:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <6bed2ead820cbb22462e458b49c82c71ece0ff85.1513821698.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/2] oeqa/core/loader.py: fix re for module
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
X-List-Received-Date: Tue, 26 Dec 2017 02:37:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Please drop patch 1/2 since Leo has sent patch for it:

core/loader.py: fix regex to include all available test cases

// Robert

On 12/21/2017 10:02 AM, Robert Yang wrote:
> Fixed:
> $ oe-selftest -r eSDK.oeSDKExtSelfTest.test_image_generation_binary_feeds
> Traceback (most recent call last):
> [snip]
>    File "/workspace2/lyang1/poky/meta/lib/oeqa/core/loader.py", line 49, in _built_modules_dict
>      module_name, class_name, test_name = m.groups()
> AttributeError: 'NoneType' object has no attribute 'groups'
> 
> The old code assumed the arg should be:
> module.Class.test
> 
> Note about the module and Class, the lower and upper cases matters, which can't
> handle the testcases like eSDK.oeSDKExtSelfTest.test_image_generation_binary_feeds
> and gotoolchain.oeGoToolchainSelfTest.test_go_dep_build. Use a new re to fix
> the problem, now all of the following commmands can work:
> $ oe-selftest -r eSDK
> $ oe-selftest -r eSDK.oeSDKExtSelfTest
> $ oe-selftest -r eSDK.oeSDKExtSelfTest.test_image_generation_binary_feeds
> 
> [YOCTO #12438]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/lib/oeqa/core/loader.py | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
> index 975a081..25078ba 100644
> --- a/meta/lib/oeqa/core/loader.py
> +++ b/meta/lib/oeqa/core/loader.py
> @@ -41,9 +41,10 @@ def _built_modules_dict(modules):
>           return modules_dict
>   
>       for module in modules:
> -        # Assumption: package and module names do not contain upper case
> -        # characters, whereas class names do
> -        m = re.match(r'^([^A-Z]+)(?:\.([A-Z][^.]*)(?:\.([^.]+))?)?$', module)
> +        # The format is module.class.test, while .class and .test is optional.
> +        m = re.match(r'([^\.]+)(?:\.([^\.]+))?(?:\.([^\.]*))?', module)
> +        if not m:
> +            raise OEQATestNotFound("Not found %s in loaded test cases" % module)
>   
>           module_name, class_name, test_name = m.groups()
>   
> 

