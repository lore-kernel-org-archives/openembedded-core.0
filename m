Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1EDFA71AFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 06:03:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBD63qiR002421
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Dec 2016 22:03:52 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Dec 2016 22:03:51 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
	<f7797b9e72ed6e6f7e05be8868b73c68a4ee1a79.1479363545.git.liezhi.yang@windriver.com>
	<19498001.0ZzLqTTt5f@peggleto-mobl.ger.corp.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <e79bc602-85e6-ab24-e5af-dd80df8949fe@windriver.com>
Date: Tue, 13 Dec 2016 14:03:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <19498001.0ZzLqTTt5f@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] oe-publish-sdk: add pyshtables.py to .gitignore
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
X-List-Received-Date: Tue, 13 Dec 2016 06:03:53 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/13/2016 12:59 PM, Paul Eggleton wrote:
> On Wed, 16 Nov 2016 22:19:33 Robert Yang wrote:
>> Fixed:
>> MACHINE = "qemux86-64"
>> require conf/multilib.conf
>> MULTILIBS = "multilib:lib32"
>> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>>
>> $ bitbake core-image-minimal -cpopulate_sdk_ext
>> [snip]
>> ERROR: Failed to update metadata as there have been changes made to it.
>> Aborting.\nERROR: Changed files:\nb' M
>> poky/bitbake/lib/bb/pysh/pyshtables.py\\n'\n" [snip]
>>
>> This is because the test case will run twice
>> (environment-setup-core2-64-poky-linux and
>> environment-setup-x86-pokymllib32-linux), it would fail in the second
>> run since pyshtables.py is regenerated in the first run. This file is
>> generated automatically, publish it doesn't make any sense, so add it to
>> .gitignore.
>>
>> [YOCTO #10647]
>
> The actual fix looks OK but I don't think 10647 is really the right bug
> number. Coincidentally today someone else reported this issue, so this would
> probably be a better one:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10796

Thanks, I will update it.

// Robert

>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  scripts/oe-publish-sdk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
>> index d95c623..e2b1b95 100755
>> --- a/scripts/oe-publish-sdk
>> +++ b/scripts/oe-publish-sdk
>> @@ -116,7 +116,7 @@ def publish(args):
>>      cmd_common = "if [ ! -e .git ]; then"
>>      cmd_common += "    git init .;"
>>      cmd_common += "    mv .git/hooks/post-update.sample
>> .git/hooks/post-update;" -    cmd_common += "    echo '*.pyc\n*.pyo' >
>> .gitignore;"
>> +    cmd_common += "    echo '*.pyc\n*.pyo\npyshtables.py' > .gitignore;"
>>      cmd_common += "fi;"
>>      cmd_common += "git add -A .;"
>>      cmd_common += "git config user.email 'oe@oe.oe' && git config user.name
>> 'OE' && git commit -q -m 'init repo' || true;"
>
> Cheers,
> Paul
>

